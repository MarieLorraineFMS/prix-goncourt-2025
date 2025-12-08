# -*- coding: utf-8 -*-

"""
Vote DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.vote import Vote


@dataclass
class VoteDao(BaseDao[Vote]):
    """DAO for Vote entities."""

    def create(self, obj: Vote) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Vote]:
        ...

    def update(self, obj: Vote) -> bool:
        ...

    def delete(self, obj: Vote) -> bool:
        ...

    def read_all(self) -> list[Vote]:
        ...

    # Helpers
    def read_by_round(self, round_number: int) -> list[Vote]:
        ...

    def read_by_book_and_round(self, book_id: int, round_number: int) -> list[Vote]:
        ...
