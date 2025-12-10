# -*- coding: utf-8 -*-

"""
Final result entity.
"""

from dataclasses import dataclass
from typing import Optional

from model.book import Book


@dataclass
class FinalResult:
    """Final vote result for a book at the last round."""

    # FK to book.id_book
    book_id: int
    nb_votes: int

    book: Optional[Book] = None

    def __str__(self) -> str:
        return f"{self.book_id} {self.nb_votes}"
