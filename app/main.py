# -*- coding: utf-8 -*-

"""
Console entry point for Prix Goncourt 2025 app.
"""

from business.goncourt_service import GoncourtService


def main() -> None:
    service = GoncourtService() # type: ignore

    print("=== Prix Goncourt 2025 ===")
    print("1. Liste des livres pour une sélection")
    print("2. Afficher le résultat final")
    print("0. Quitter")
    # TODO: CLI


if __name__ == "__main__":
    main()
