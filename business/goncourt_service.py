# -*- coding: utf-8 -*-

"""
Goncourt service (store) for Goncourt use cases.
"""

from dataclasses import dataclass
from typing import Optional

from dao.book_dao import BookDao
from dao.author_dao import AuthorDao
from dao.publisher_dao import PublisherDao
from dao.character_dao import CharacterDao
from dao.selection_dao import SelectionDao
from dao.final_result_dao import FinalResultDao

from model.book import Book
from model.author import Author
from model.publisher import Publisher
from model.character import Character

import logging
logger = logging.getLogger(__name__)



@dataclass
class BookDetails:
    """Book with all related data."""
    book: Book
    author: Optional[Author]
    publisher: Optional[Publisher]
    characters: list[Character]

@dataclass
class FinalResultDetails:
    book_details: BookDetails
    nb_votes: int
    is_winner: bool
    decided_by_president: bool



@dataclass
class GoncourtService:

    book_dao: BookDao
    author_dao: AuthorDao
    publisher_dao: PublisherDao
    character_dao: CharacterDao
    selection_dao: SelectionDao
    final_result_dao: FinalResultDao

    def list_all_books(self) -> list[Book]:
        """Return all books from DB."""
        return self.book_dao.read_all()

    def list_books_for_selection(self, round_number: int) -> list[BookDetails]:
        """UC1 : list all books for a given selection."""
        selection = self.selection_dao.read_by_year_and_round(2025, round_number)
        if selection is None:
            return []

        if selection.id_selection is None:
            return []

        logger.info("Selection loaded: %s", selection)

        books = self.book_dao.read_by_selection(selection.id_selection)
        result: list[BookDetails] = []

        for book in books:
            author: Optional[Author] = None
            if book.author_id is not None:
                author = self.author_dao.read(book.author_id)

            publisher: Optional[Publisher] = None
            if book.publisher_id is not None:
                publisher = self.publisher_dao.read(book.publisher_id)

            characters = self.character_dao.read_by_book(book.id_book or 0)

            result.append(
                BookDetails(
                    book=book,
                    author=author,
                    publisher=publisher,
                    characters=characters,
                )
            )

        return result

    def get_book_details(self, book_id: int) -> Optional[BookDetails]:
        """UC2 : get a single book with details."""
        book = self.book_dao.read(book_id)
        if book is None:
            return None

        author: Optional[Author] = None
        if book.author_id is not None:
            author = self.author_dao.read(book.author_id)

        publisher: Optional[Publisher] = None
        if book.publisher_id is not None:
            publisher = self.publisher_dao.read(book.publisher_id)

        characters = self.character_dao.read_by_book(book.id_book or 0)

        return BookDetails(
            book=book,
            author=author,
            publisher=publisher,
            characters=characters,
        )

    def list_final_results(self) -> list[FinalResultDetails]:
        """UC3 : list final results with books & votes."""
        raw_results = self.final_result_dao.read_all()
        results: list[FinalResultDetails] = []

        for fr in raw_results:
            details = self.get_book_details(fr.book_id)
            if details is None:
                continue
            results.append(
                FinalResultDetails(
                    book_details=details,
                    nb_votes=fr.nb_votes,
                    is_winner=fr.is_winner,
                    decided_by_president=fr.decided_by_president,
                )
            )

        return results

    def set_second_selection(self, book_ids: list[int]) -> None:
        """Set books of 2nd selection & reset later steps.

        Changing 2nd selection invalidates :
        - 3rd selection (finalists)
        - final results (last round votes)
        """
        selection = self.selection_dao.read_by_year_and_round(2025, 2)
        if selection is None:
            raise ValueError("2nd selection not found for year 2025")

        # Update 2nd selection books
        if selection.id_selection is not None:
            self.selection_dao.set_books(selection.id_selection, book_ids)

        # Reset final results
        self.final_result_dao.clear_all()

        # Reset 3rd selection
        third_selection = self.selection_dao.read_by_year_and_round(2025, 3)

        if third_selection is None:
            return

        if third_selection.id_selection is not None:
            # Passing empty list will remove all links
            self.selection_dao.set_books(third_selection.id_selection, [])



    def set_third_selection(self, book_ids: list[int]) -> None:
        """Set books of 3rd selection (finalists) & reset final results.

        Changing finalists invalidates existing final results.
        """
        selection = self.selection_dao.read_by_year_and_round(2025, 3)

        if selection is None:
            raise ValueError("3rd selection not found for year 2025")

        # Update 3rd selection books
        if selection.id_selection is not None:
            self.selection_dao.set_books(selection.id_selection, book_ids)

        # Reset final results
        self.final_result_dao.clear_all()

    def record_final_votes(self, results: dict[int, int], winner_book_id: int,decided_by_president: bool) -> None:
        """UC6: record final votes.
        """
        self.final_result_dao.replace_results(
            results,
            winner_book_id=winner_book_id,
            decided_by_president=decided_by_president,
        )