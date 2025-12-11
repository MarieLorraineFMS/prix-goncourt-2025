# -*- coding: utf-8 -*-

"""
Jury member entity.
"""

from dataclasses import dataclass


@dataclass
class JuryMember:
    """Goncourt jury member."""

    id_member: int | None = None
    first_name: str = ""
    last_name: str = ""
    is_president: bool = False

    # TODO : Optionnal auth
    login: str=""
    password_hash:  str=""

    # TODO : improve __str__
    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
