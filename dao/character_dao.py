# -*- coding: utf-8 -*-

"""
Character DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional, TypedDict, cast

from dao.base_dao import BaseDao

from model.character import Character

import logging
logger = logging.getLogger(__name__)

class CharacterRecord(TypedDict):
    """Typed row from 'book_character' table."""
    id_character: int
    name: str
    book_id: int


@dataclass
class CharacterDao(BaseDao[Character]):
    """DAO for Character entities."""

    def create(self, obj: Character) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Character]:
        ...

    def update(self, obj: Character) -> bool:
        ...

    def delete(self, obj: Character) -> bool:
        ...

    def read_all(self) -> list[Character]:
        ...

    def read_by_book(self, book_id: int) -> list[Character]:
        """Return characters for a given book."""
        logger.info("Reading characters for book_id=%s", book_id)

        characters: list[Character] = []

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT id_character, name, book_id
                FROM book_character
                WHERE book_id = %s
            """
            cursor.execute(sql, (book_id,))
            db_rows = cursor.fetchall()

        records = cast(list[CharacterRecord], db_rows)

        for row in records:
            character = Character(
                name=row["name"],
                book_id=row["book_id"],
            )
            character.id_character = row["id_character"]
            characters.append(character)

        logger.info("Loaded %d characters for book_id=%s", len(characters), book_id)
        return characters

