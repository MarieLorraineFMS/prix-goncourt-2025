# -*- coding: utf-8 -*-

"""
Book entity.
"""

from dataclasses import dataclass
from datetime import date
from typing import Optional


@dataclass
class Book:
    """Book in Goncourt selection."""

    id_book: int | None = None
    title: str = ""
    summary: str = ""
    publication_date: Optional[date] = None
    page_count: int | None = None
    isbn: Optional[str] = None
    price: float | None = None

    # FK
    author_id: int | None = None
    publisher_id: int | None = None

    def __str__(self) -> str:
        return f"{self.title} {self.summary}"
