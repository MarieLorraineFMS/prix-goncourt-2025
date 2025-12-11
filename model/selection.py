# -*- coding: utf-8 -*-

"""
Selection entity.
"""

from dataclasses import dataclass
from datetime import date
from typing import Optional


@dataclass
class Selection:
    """Selection of books (Goncourt round)."""

    id_selection: int | None = None
    year: int = 2025
    round_number: int = 1  # 1, 2 or 3
    selection_date: Optional[date] = None

    # TODO : improve __str__
    def __str__(self) -> str:
        return f"{self.year} - le {self.selection_date} - Sélection : {self.round_number}"