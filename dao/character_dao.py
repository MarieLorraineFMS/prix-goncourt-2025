# -*- coding: utf-8 -*-

"""
Character DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.character import Character


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
        ...
