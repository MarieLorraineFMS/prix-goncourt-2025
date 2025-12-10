# -*- coding: utf-8 -*-

"""
Main character entity.
"""

from dataclasses import dataclass


@dataclass
class Character:
    """Character of a book."""

    id_character: int | None = None
    name: str = ""

    # Link to book
    book_id: int | None = None

    def __str__(self) -> str:
        return f"{self.name}"
