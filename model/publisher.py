# -*- coding: utf-8 -*-

"""
Publisher entity.
"""

from dataclasses import dataclass


@dataclass
class Publisher:
    """Book publisher."""

    id_publisher: int | None = None
    name: str = ""

    # TODO : improve __str__
    def __str__(self) -> str:
        return f"{self.name}"
