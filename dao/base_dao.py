# dao/base_dao.py
# -*- coding: utf-8 -*-

"""
Generic abstract base DAO[T] class for all entities.
"""

from dataclasses import dataclass
from abc import ABC, abstractmethod
from typing import ClassVar, Optional

import pymysql
import pymysql.cursors



@dataclass
class BaseDao[T](ABC):

    connection: ClassVar[pymysql.Connection] = pymysql.connect(
        host="localhost",
        user="goncourt_user",
        password="goncourt_user_password",
        database="goncourt_2025",
        cursorclass=pymysql.cursors.DictCursor,
    )

    @abstractmethod
    def create(self, obj: T) -> int:
        """Create an entity in DB from the given object.
        Returns the new entity id (0 if creation failed).
        """
        ...

    @abstractmethod
    def read(self, id_entity: int) -> Optional[T]:
        """Return the object corresponding to the given id (or None)."""
        ...

    @abstractmethod
    def update(self, obj: T) -> bool:
        """Update the DB entity corresponding to the given object.
        Return True if the update was successful.
        """
        ...

    @abstractmethod
    def delete(self, obj: T) -> bool:
        """Delete the DB entity corresponding to the given object.
        Return True if the deletion was successful.
        """
        ...

    @abstractmethod
    def read_all(self) -> list[T]:
        """Return all entities of type T from DB."""
        ...
