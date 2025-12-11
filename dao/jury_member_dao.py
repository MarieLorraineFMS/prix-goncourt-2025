# -*- coding: utf-8 -*-

"""
JuryMember DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional, TypedDict, cast

from dao.base_dao import BaseDao

from model.jury_member import JuryMember

import logging
logger = logging.getLogger(__name__)

class JuryMemberRecord(TypedDict):
    """Typed row from 'jury_member' table."""
    id_member: int
    first_name: str
    last_name: str
    is_president: int
    login: str
    password_hash: str


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

    def read_by_login(self, login: str) -> Optional[JuryMember]:
        """Return a JuryMember by login or None if not found."""
        logger.warning("Reading jury member by login=%s", login)

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT id_member,
                       first_name,
                       last_name,
                       is_president,
                       login,
                       password_hash
                FROM jury_member
                WHERE login = %s
            """
            cursor.execute(sql, (login,))
            db_row = cursor.fetchone()

        if db_row is None:
            logger.warning("No jury member found with login=%s", login)
            return None

        row = cast(JuryMemberRecord, db_row)

        member = JuryMember(
            id_member=row["id_member"],
            first_name=row["first_name"],
            last_name=row["last_name"],
            is_president=bool(row["is_president"]),
            login=row["login"],
            password_hash=row["password_hash"],
        )

        logger.info(
            "Jury member loaded from DB: %s %s (president=%s)",
            member.first_name,
            member.last_name,
            member.is_president,
        )
        return member
