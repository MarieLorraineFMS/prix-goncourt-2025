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

    # TODO : improve __str__
    def __str__(self) -> str:
        return f"{self.first_name} {self.last_name}"
