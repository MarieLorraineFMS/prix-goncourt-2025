# -*- coding: utf-8 -*-

"""
Selection DAO implementation.
"""

from dataclasses import dataclass
from datetime import date
from typing import Optional, TypedDict, cast

from dao.base_dao import BaseDao

from model.selection import Selection

import logging
logger = logging.getLogger(__name__)

class SelectionRecord(TypedDict):
    """Typed row from 'selection' table."""
    id_selection: int
    year: int
    round_number: int
    selection_date: date


@dataclass
class SelectionDao(BaseDao[Selection]):
    """DAO for Selection entities."""

    def create(self, obj: Selection) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Selection]:
        ...

    def update(self, obj: Selection) -> bool:
        ...

    def delete(self, obj: Selection) -> bool:
        ...

    def read_all(self) -> list[Selection]:
        ...

    def read_by_year_and_round(self, year: int, round_number: int) -> Optional[Selection]:
        """Load a selection from DB by year & round number."""
        logger.warning("Reading selection year=%s round=%s from DB", year, round_number)

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT id_selection,
                       year,
                       round_number,
                       selection_date
                FROM selection
                WHERE year = %s
                  AND round_number = %s
            """
            cursor.execute(sql, (year, round_number))
            db_row = cursor.fetchone()

        if db_row is None:
            logger.warning("No selection found for year=%s and round=%s", year, round_number)
            return None

        row = cast(SelectionRecord, db_row)

        selection = Selection(
            year=row["year"],
            round_number=row["round_number"],
            selection_date=row["selection_date"],
        )
        selection.id_selection = row["id_selection"]

        logger.info("Selection loaded from DB: %s", selection)
        return selection



    def set_books(self, selection_id: int, book_ids: list[int]) -> Optional[Selection]:
        """Update all books related to a given selection.

        - checks that selection exists
        - deletes previous links in selection_book
        - inserts new links for given book ids
        - returns updated Selection or None if not found
        """

        logger.error(
            "Updating books for selection id=%s with book_ids=%s",
            selection_id,
            book_ids,
        )

        with BaseDao.connection.cursor() as cursor:
            # Check selection exists
            cursor.execute(
                """
                SELECT id_selection, year, round_number, selection_date
                FROM selection
                WHERE id_selection = %s
                """,
                (selection_id,),
            )
            db_row = cursor.fetchone()

            if db_row is None:
                logger.error(
                    "No selection found with id=%s, aborting set_books()",
                    selection_id,
                )
                BaseDao.connection.rollback()
                return None

            # Remove current links
            cursor.execute(
                "DELETE FROM selection_book WHERE id_selection = %s",
                (selection_id,),
            )

            # Insert new links
            for book_id in book_ids:
                cursor.execute(
                    """
                    INSERT INTO selection_book (id_selection, id_book)
                    VALUES (%s, %s)
                    """,
                    (selection_id, book_id),
                )

        # Commit changes
        BaseDao.connection.commit()

        # Rebuild Selection object from row
        row = cast(SelectionRecord, db_row)
        selection = Selection(
            id_selection=row["id_selection"],
            year=row["year"],
            round_number=row["round_number"],
            selection_date=row["selection_date"],
        )
        logger.error("Books updated for selection id=%s", selection_id)
        return selection

