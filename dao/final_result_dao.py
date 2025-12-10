# -*- coding: utf-8 -*-

"""
FinalResult DAO implementation.
"""

import logging
from dataclasses import dataclass
from datetime import date
from typing import Optional, TypedDict, cast

from dao.base_dao import BaseDao
from model.book import Book
from model.final_result import FinalResult

logger = logging.getLogger(__name__)


class FinalResultRecord(TypedDict):
    """Typed row from JOIN final_result / book."""
    id_book: int
    nb_votes: int
    title: str
    summary: str
    publication_date: date | None
    page_count: int | None
    isbn: str | None
    price: float | None
    author_id: int | None
    publisher_id: int | None


@dataclass
class FinalResultDao(BaseDao[FinalResult]):
    """DAO for final round results."""

    def create(self, obj: FinalResult) -> int:
        """Not used, final results are handled by replace_results()."""
        raise NotImplementedError("create() is not supported for FinalResultDao")

    def read(self, id_entity: int) -> Optional[FinalResult]:
        """Not used."""
        raise NotImplementedError("read() is not supported for FinalResultDao")

    def update(self, obj: FinalResult) -> bool:
        """Not used, final results are replaced."""
        raise NotImplementedError("update() is not supported for FinalResultDao")

    def delete(self, obj: FinalResult) -> bool:
        """Not used, final results are replaced."""
        raise NotImplementedError("delete() is not supported for FinalResultDao")

    # /////////////////////////////// UC3 : FINAL RESULTS ///////////////////////////////

    def read_all(self) -> list[FinalResult]:
        """Return all final results with their related Book."""
        logger.warning("Reading final results from DB")
        results: list[FinalResult] = []

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT
                    fr.id_book,
                    fr.nb_votes,
                    b.id_book,
                    b.title,
                    b.summary,
                    b.publication_date,
                    b.page_count,
                    b.isbn,
                    b.price,
                    b.author_id,
                    b.publisher_id
                FROM final_result fr
                JOIN book b ON b.id_book = fr.id_book
                ORDER BY fr.nb_votes DESC, b.title
            """
            cursor.execute(sql)
            db_rows = cursor.fetchall()

        rows = cast(list[FinalResultRecord], db_rows)

        for row in rows:
            book = Book(
                id_book=row["id_book"],
                title=row["title"],
                summary=row["summary"],
                publication_date=row["publication_date"],
                page_count=row["page_count"],
                isbn=row["isbn"],
                price=row["price"],
                author_id=row["author_id"],
                publisher_id=row["publisher_id"],
            )

            result = FinalResult(
                book_id=row["id_book"],
                nb_votes=row["nb_votes"],
                book=book,
            )
            results.append(result)

        logger.warning("Loaded %d final results from DB", len(results))
        return results

    # /////////////////////////////// UC6 : RECORD RESULTS ///////////////////////////////

    def replace_results(self, results: dict[int, int]) -> None:
        """Replace all final results.

        :param results: mapping book_id -> nb_votes
        """
        logger.warning("Replacing all final results in DB")

        with BaseDao.connection.cursor() as cursor:
            cursor.execute("TRUNCATE TABLE final_result")

            sql = """
                INSERT INTO final_result (id_book, nb_votes)
                VALUES (%s, %s)
            """
            data = [(book_id, nb_votes) for book_id, nb_votes in results.items()]
            cursor.executemany(sql, data)

        BaseDao.connection.commit()
        logger.warning("Final results successfully updated")
