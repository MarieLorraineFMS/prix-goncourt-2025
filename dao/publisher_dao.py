# -*- coding: utf-8 -*-

"""
Publisher DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.publisher import Publisher


@dataclass
class PublisherDao(BaseDao[Publisher]):
    """DAO for Publisher entities."""

    def create(self, obj: Publisher) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Publisher]:
        ...

    def update(self, obj: Publisher) -> bool:
        ...

    def delete(self, obj: Publisher) -> bool:
        ...

    def read_all(self) -> list[Publisher]:
        ...
