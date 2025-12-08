# -*- coding: utf-8 -*-

"""
Author entity.
"""

from dataclasses import dataclass
from typing import Optional


@dataclass
class Author:
    """Book author."""

    id_author: int | None = None
    first_name: str = ""
    last_name: str = ""
    biography: Optional[str] = None
