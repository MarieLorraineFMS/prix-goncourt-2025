# -*- coding: utf-8 -*-

"""
Selection DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.selection import Selection


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
        ...
