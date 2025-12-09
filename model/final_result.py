# -*- coding: utf-8 -*-

"""
Final result entity.
"""

from dataclasses import dataclass


@dataclass
class FinalResult:
    """Final vote result for a book at the last round."""

    # FK to book.id_book
    book_id: int
    nb_votes: int
