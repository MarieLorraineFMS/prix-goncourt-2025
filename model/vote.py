# -*- coding: utf-8 -*-

"""
Vote entity.
"""

from dataclasses import dataclass

#TODO Implement votes mechanic
@dataclass
class Vote:
    """Vote of a jury member for a book."""

    id_vote: int | None = None
    member_id: int = 0
    book_id: int = 0
    round_number: int = 0
    vote_value: int = 0

    # TODO : improve __str__
    def __str__(self) -> str:
        return f"Round {self.round_number}  book_id: {self.book_id} votes : {self.vote_value}"
