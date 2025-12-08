# -*- coding: utf-8 -*-

"""
JuryMember DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional

from dao.base_dao import BaseDao
from model.jury_member import JuryMember


@dataclass
class JuryMemberDao(BaseDao[JuryMember]):
    """DAO for JuryMember entities."""

    def create(self, obj: JuryMember) -> int:
        ...

    def read(self, id_entity: int) -> Optional[JuryMember]:
        ...

    def update(self, obj: JuryMember) -> bool:
        ...

    def delete(self, obj: JuryMember) -> bool:
        ...

    def read_all(self) -> list[JuryMember]:
        ...

    def read_president(self) -> Optional[JuryMember]:
        ...
