# -*- coding: utf-8 -*-

"""
Business service for Prix Goncourt 2025 use cases.
"""

from typing import Optional

from dao.author_dao import AuthorDao
from dao.book_dao import BookDao
from dao.character_dao import CharacterDao
from dao.publisher_dao import PublisherDao
from dao.selection_dao import SelectionDao
from dao.final_result_dao import FinalResultDao
from model.book import Book
from model.final_result import FinalResult
from model.selection import Selection


class GoncourtService:
    """Service for Goncourt 2025 use cases."""

    def __init__(self) -> None:
        self.book_dao = BookDao()
        self.author_dao = AuthorDao()
        self.publisher_dao = PublisherDao()
        self.character_dao = CharacterDao()
        self.selection_dao = SelectionDao()
        self.final_result_dao = FinalResultDao()

    #  ////////////////////////////// UC1 – READ SELECTION BY ROUND   //////////////////////////////

    def list_books_for_selection(self, round_number: int) -> list[Book]:
        """Return all books for a given round."""
        year = 2025  # fixed for V1

        selection: Optional[Selection] = self.selection_dao.read_by_year_and_round(
            year, round_number
        )
        if selection is None:
            return []

        books: list[Book] = self.book_dao.read_by_selection(selection.id_selection)  # type: ignore[arg-type]

        # TODO author / publisher / characters
        return books

    #  ////////////////////////////// UC2 – BOOK DETAILS //////////////////////////////

    def get_book_details(self, book_id: int) -> Optional[Book]:
        """Return a book by id."""
        book = self.book_dao.read(book_id)
        if book is None:
            return None

        # TODO Book with author / publisher / characters
        return book

    #  ////////////////////////////// UC3 – FINAL RESULTS //////////////////////////////

    def list_final_results(self) -> list[tuple[Book, int]]:
        """Return final results.

        :return final result : list[tuple[Book, int]]
        """
        final_results: list[FinalResult] = self.final_result_dao.read_all()
        result: list[tuple[Book, int]] = []

        for fr in final_results:
            book = self.book_dao.read(fr.book_id)
            if book is None:
                # do nothing
                continue
            result.append((book, fr.nb_votes))

        return result

    #  ////////////////////////////// UC4 – SECOND SELECTION //////////////////////////////

    def set_second_selection(self, book_ids: list[int]) -> None:
        """Replace books of the second selection."""
        year = 2025
        round_number = 2

        selection = self.selection_dao.read_by_year_and_round(year, round_number)
        if selection is None:
            # TODO create selection
            raise ValueError("Second selection not found in DB")

        # TODO Fix type error
        self.selection_book_dao.set_books(selection.id_selection, book_ids)  # type: ignore[arg-type]

    #  ////////////////////////////// UC5 – SET THIRD SELECTION //////////////////////////////

    def set_third_selection(self, book_ids: list[int]) -> None:
        """Replace books of the third selection (round 3, 2025)."""
        year = 2025
        round_number = 3

        selection = self.selection_dao.read_by_year_and_round(year, round_number)
        if selection is None:
            # TODO create selection
            raise ValueError("Third selection not found in DB")

        # TODO Fix type error
        self.selection_book_dao.set_books(selection.id_selection, book_ids)  # type: ignore[arg-type]

    #  ////////////////////////////// UC6 – RECORD FINAL VOTES  //////////////////////////////

    def record_final_votes(self, results: dict[int, int]) -> None:
        """Replace final results with provided (book_id -> nb_votes) mapping."""
        self.final_result_dao.replace_results(results)
