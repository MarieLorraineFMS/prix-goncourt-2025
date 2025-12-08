# -*- coding: utf-8 -*-

"""
Business service for Prix Goncourt 2025 use cases.
"""

from dataclasses import dataclass
from typing import Optional

from dao.book_dao import BookDao
from dao.selection_dao import SelectionDao
from dao.vote_dao import VoteDao
from model.book import Book
from model.selection import Selection


@dataclass
class GoncourtService:
    """Goncourt app service."""

    book_dao: BookDao = BookDao()
    selection_dao: SelectionDao = SelectionDao()
    vote_dao: VoteDao = VoteDao()

    def list_books_for_selection(self, year:int,round_number: int) -> list[Book]:
        """Return all books belonging to the given selection & year."""
        ...

    def get_selection(self, year:int, round_number: int) -> Optional[Selection]:
        """Return the selection for the given round & year."""
        ...

    def list_final_results(self) -> list[tuple[Book, int]]:
        """Return final results."""
        ...

    def record_final_votes(self, results: dict[int, int]) -> None:
        """Record final votes."""
        ...
