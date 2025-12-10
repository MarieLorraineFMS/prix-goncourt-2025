# -*- coding: utf-8 -*-

"""
Publisher DAO implementation.
"""

from dataclasses import dataclass
import logging
from typing import Optional, TypedDict, cast

from dao.base_dao import BaseDao
from model.publisher import Publisher

logger = logging.getLogger(__name__)

class PublisherRecord(TypedDict):
    """Typed row from 'publisher' table."""
    id_publisher: int
    name: str

@dataclass
class PublisherDao(BaseDao[Publisher]):
    """DAO for Publisher entities."""

    def create(self, obj: Publisher) -> int:
        ...

    def read(self, id_entity: int) -> Optional[Publisher]:
        """Return a Publisher by id."""
        logger.info("Reading publisher id=%s from DB", id_entity)

        with BaseDao.connection.cursor() as cursor:
            sql = """
                SELECT id_publisher, name
                FROM publisher
                WHERE id_publisher = %s
            """
            cursor.execute(sql, (id_entity,))
            db_row = cursor.fetchone()

        if db_row is None:
            logger.warning("No publisher found with id=%s", id_entity)
            return None

        row = cast(PublisherRecord, db_row)
        publisher = Publisher(name=row["name"])
        publisher.id_publisher = row["id_publisher"]

        logger.info("Publisher loaded from DB: %s", publisher)
        return publisher


    def update(self, obj: Publisher) -> bool:
        ...

    def delete(self, obj: Publisher) -> bool:
        ...

    def read_all(self) -> list[Publisher]:
        """Return all publishers from DB."""
        logger.info("Reading all publishers from DB")
        publishers: list[Publisher] = []

        with BaseDao.connection.cursor() as cursor:
            sql = "SELECT id_publisher, name FROM publisher"
            cursor.execute(sql)
            db_rows = cursor.fetchall()

        records = cast(list[PublisherRecord], db_rows)

        for row in records:
            publisher = Publisher(name=row["name"])
            publisher.id_publisher = row["id_publisher"]
            publishers.append(publisher)

        logger.info("Loaded %d publishers from DB", len(publishers))
        return publishers

