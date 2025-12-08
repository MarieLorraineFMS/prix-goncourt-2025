# -*- coding: utf-8 -*-

"""
Book DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.book import Book


@dataclass
class BookDao(BaseDao[Book]):
    """DAO for Book entities."""

    def create(self, obj: Book) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Book]:
        ...

    def update(self, obj: Book) -> bool:
        ...

    def delete(self, obj: Book) -> bool:
        ...

    def read_all(self) -> list[Book]:
        ...

    def read_by_selection(self, selection_id: int) -> list[Book]:
        ...
