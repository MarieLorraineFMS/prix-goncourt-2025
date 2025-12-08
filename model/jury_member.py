# -*- coding: utf-8 -*-

"""
Jury member entity.
"""

from dataclasses import dataclass
from typing import Optional


@dataclass
class JuryMember:
    """Goncourt jury member."""

    id_member: int | None = None
    first_name: str = ""
    last_name: str = ""
    is_president: bool = False

    # TODO : Optionnal auth
    login: Optional[str] = None
    password_hash: Optional[str] = None
