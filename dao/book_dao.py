# -*- coding: utf-8 -*-

"""
Book DAO implementation.
"""

from dataclasses import dataclass
from typing import Optional, TypedDict, cast
from datetime import date


from dao.base_dao import BaseDao

from model.book import Book

import logging
logger = logging.getLogger(__name__)

class BookRecord(TypedDict):
    """Typed row from 'book' table."""
    id_book: int
    title: str
    summary: str
    publication_date: date
    page_count:int
    isbn: str
    price:float
    author_id:int
    publisher_id:int

@dataclass
class BookDao(BaseDao[Book]):
    """DAO for Book entities."""

    def create(self, obj: Book) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Book]:
        """Return a book by id.

        :param id_entity: id_book of book to read
        :return: Book object or None if not found
    """
        logger.warning("Getting book with id=%s from DB", id_entity)

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT
                    b.id_book,
                    b.title,
                    b.summary,
                    b.publication_date,
                    b.page_count,
                    b.isbn,
                    b.price,
                    b.author_id,
                    b.publisher_id
                FROM book b
                WHERE b.id_book = %s
            """
            cursor.execute(sql, (id_entity,))
            db_row = cursor.fetchone()

        if db_row is None:
            logger.error("No book found with id=%s", id_entity)
            return None

        row = cast(BookRecord, db_row)
        book = Book(
            title=row["title"],
            summary=row["summary"],
            publication_date=row["publication_date"],
            page_count=row["page_count"],
            isbn=row["isbn"],
            price=row["price"],
            author_id=row["author_id"],
            publisher_id=row["publisher_id"],
        )
        book.id_book = row["id_book"]

        logger.warning("Book loaded from DB : %s", book.title)
        return book


    def update(self, obj: Book) -> bool:
        ...

    def delete(self, obj: Book) -> bool:
        ...

    def read_all(self) -> list[Book]:
        """Return all books entities from DB."""
        logger.warning("Reading all books from DB")
        books: list[Book] = []

        with BaseDao.connection.cursor() as cursor:
            sql =  """
                SELECT
                    id_book,
                    title,
                    summary,
                    publication_date,
                    page_count,
                    isbn,
                    price,
                    author_id,
                    publisher_id
                FROM book
                ORDER BY title
            """
            cursor.execute(sql)
            db_rows = cursor.fetchall()

        records = cast(list[BookRecord], db_rows)

        for row in records:
            book = Book(
            title=row["title"],
            summary=row["summary"],
            publication_date=row["publication_date"],
            page_count=row["page_count"],
            isbn=row["isbn"],
            price=row["price"],
            author_id=row["author_id"],
            publisher_id=row["publisher_id"]
            )
            book.id_book = row["id_book"]
            books.append(book)

        logger.warning("Loaded %d books from DB", len(books))
        return books


    def read_by_selection(self, selection_id: int) -> list[Book]:
        """Return all books for a given selection."""

        logger.warning("Reading author id=%s from DB", selection_id)
        books: list[Book] = []

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT
                    b.id_book,
                    b.title,
                    b.summary,
                    b.publication_date,
                    b.page_count,
                    b.isbn,
                    b.price,
                    b.author_id,
                    b.publisher_id
                FROM selection_book sb
                JOIN book b ON b.id_book = sb.id_book
                WHERE sb.id_selection = %s
                ORDER BY b.id_book
            """
            cursor.execute(sql, (selection_id))
            db_rows = cursor.fetchall()

        rows = cast(list[BookRecord], db_rows)

        for row in rows:
            book = Book(
                id_book=row["id_book"],
                title=row["title"],
                summary=row["summary"],
                publication_date=row["publication_date"],
                page_count=row["page_count"],
                isbn=row["isbn"],
                price=row["price"],
                author_id=row["author_id"],
                publisher_id=row["publisher_id"],
            )
            book.id_book = row["id_book"]
            books.append(book)

        logger.warning("Loaded %d books for selection id=%s", len(books), selection_id,)
        return books
