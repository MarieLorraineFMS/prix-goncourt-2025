# -*- coding: utf-8 -*-

"""
Vote entity.
"""

from dataclasses import dataclass


@dataclass
class Vote:
    """Vote of a jury member for a book."""

    id_vote: int | None = None

    member_id: int = 0
    book_id: int = 0
    round_number: int = 0
    vote_value: int = 1
