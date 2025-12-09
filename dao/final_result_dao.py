# -*- coding: utf-8 -*-

"""
FinalResult DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.final_result import FinalResult


@dataclass
class FinalResultDao(BaseDao[FinalResult]):
    """DAO for final round results."""

    def create(self, obj: FinalResult) -> int:
        ...

    def read(self, id_entity: int) -> Optional[FinalResult]:
        ...

    def update(self, obj: FinalResult) -> bool:
        ...

    def delete(self, obj: FinalResult) -> bool:
        ...

    def read_all(self) -> list[FinalResult]:
        ...

    def replace_results(self, results: dict[int, int]) -> None:
        ...
