# -*- coding: utf-8 -*-

"""
Author DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional, TypedDict, cast

from dao.base_dao import BaseDao

from model.author import Author

import logging
logger = logging.getLogger(__name__)


class AuthorRecord(TypedDict):
    """Typed row from 'author' table."""
    id_author: int
    first_name: str
    last_name: str
    biography: str

@dataclass
class AuthorDao(BaseDao[Author]):
    """DAO for Author entities."""

    def create(self, obj: Author) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Author]:
        """Return an Author by id.

        :param id_entity: id_author of author to read
        :return: Author object or None if not found
    """
        logger.warning("Reading author id=%s from DB", id_entity)

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT a.id_author,
                       a.first_name,
                       a.last_name,
                       a.biography
                FROM author a
                WHERE a.id_author = %s
            """
            cursor.execute(sql, (id_entity,))
            db_row = cursor.fetchone()

        if db_row is None:
            logger.error("No author found with id=%s", id_entity)
            return None

        row = cast(AuthorRecord, db_row)
        author = Author(
            first_name=row["first_name"],
            last_name=row["last_name"],
            biography=row["biography"],
        )
        author.id_author = row["id_author"]

        logger.warning("Author loaded from DB : %s", author)
        return author
        ...

    def update(self, obj: Author) -> bool:
        ...

    def delete(self, obj: Author) -> bool:
        ...

    def read_all(self) -> list[Author]:
        """Return all Address entities from DB."""
        logger.warning("Reading all author from DB")
        authors: list[Author] = []

        with BaseDao.connection.cursor() as cursor:
            sql = "SELECT * FROM author"
            cursor.execute(sql)
            db_rows = cursor.fetchall()

        records = cast(list[AuthorRecord], db_rows)

        for row in records:
            author = Author(
            first_name=row["first_name"],
            last_name=row["last_name"],
            biography=row["biography"],
            )
            author.id_author = row["id_author"]
            authors.append(author)

        logger.warning("Loaded %d authors from DB", len(authors))
        return authors
