# -*- coding: utf-8 -*-

"""
Author DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.author import Author


@dataclass
class AuthorDao(BaseDao[Author]):
    """DAO for Author entities."""

    def create(self, obj: Author) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Author]:
        ...

    def update(self, obj: Author) -> bool:
        ...

    def delete(self, obj: Author) -> bool:
        ...

    def read_all(self) -> list[Author]:
        ...
