# -*- coding: utf-8 -*-

"""
App - Prix Goncourt 2025.
"""


import textwrap
from typing import Dict

from business.goncourt_service import BookDetails, GoncourtService
from dao.book_dao import BookDao
from dao.author_dao import AuthorDao
from dao.publisher_dao import PublisherDao
from dao.character_dao import CharacterDao
from dao.selection_dao import SelectionDao
from dao.final_result_dao import FinalResultDao
from logging_config import setup_logging



# /////////////////////////////// COLORS ///////////////////////////////


RESET = "\033[0m"
BOLD = "\033[1m"

FG_RED = "\033[31m"
FG_GREEN = "\033[32m"
FG_YELLOW = "\033[33m"
FG_BLUE = "\033[34m"
FG_CYAN = "\033[36m"
FG_MAGENTA = "\033[35m"


def color(text: str, fg: str) -> str:
    """Retourne une chaîne colorée."""
    return f"{fg}{text}{RESET}"


# /////////////////////////////// UI ///////////////////////////////

def print_header() -> None:
    """Header."""
    print(color("\n/////////////////////////////////", FG_CYAN))
    print(color("  PRIX GONCOURT 2025", FG_CYAN))
    print(color("/////////////////////////////////\n", FG_CYAN))


def print_menu() -> None:
    """Menu."""
    print(color("Menu principal :", FG_BLUE))
    print("  1) Lister les livres d'une sélection (UC1)")
    print("  2) Détail d'un livre (UC2)")
    print("  3) Résultats du dernier tour (UC3)")
    print("  4) Saisir les livres de la 2e sélection (UC4)")
    print("  5) Saisir les livres de la 3e sélection (UC5)")
    print("  6) Saisir les votes du dernier tour (UC6)")
    print("  q) Quitter")
    print()


def print_book_details(details: BookDetails) -> None:
    """Display book details."""
    b = details.book
    wrapped_summary = textwrap.fill(
        b.summary,
        width=100,
        initial_indent="",
        subsequent_indent=" " * 24,
    )
    print(color(f"[#{b.id_book}] {b.title}", FG_YELLOW))
    print(f"    Date de parution    : {b.publication_date}")
    print(f"    Pages               : {b.page_count}")
    print(f"    ISBN                : {b.isbn}")
    print(f"    Prix éditeur        : {b.price} €")

    if details.author is not None:
        a = details.author
        print(f"    Auteur              : {a.first_name} {a.last_name}")
    else:
        print("     Auteur              : (inconnu)")

    if details.publisher is not None:
        p = details.publisher
        print(f"    Éditeur             : {p.name}")
    else:
        print("     Éditeur             : (inconnu)")

    if details.characters:
        names = ", ".join(c.name for c in details.characters)
        print(f"    Personnages         : {names}")
    else:
        print("     Personnages         : (aucun renseigné)")

    print(f"    Résumé              : {wrapped_summary}")

    print()


# /////////////////////////////// HANDLERS UC ///////////////////////////////

def handle_uc1_list_selection(service: GoncourtService) -> None:
    """UC1 : Display books by selection."""
    try:
        raw = input("Numéro de sélection (1, 2 ou 3) : ").strip()
        round_number = int(raw)
    except ValueError:
        print(color("Numéro invalide.", FG_RED))
        return

    details_list = service.list_books_for_selection(round_number)
    if not details_list:
        print(color("Aucune sélection trouvée.", FG_RED))
        return

    print(color(f"\nLivres de la sélection n°{round_number} :", FG_GREEN))
    for details in details_list:
        print_book_details(details)


def handle_uc2_book_details(service: GoncourtService) -> None:
    """UC2 : display one book with details."""
    # Display all books
    books = service.list_all_books()
    if not books:
        print(color("Aucun livre disponible.", FG_RED))
        return

    print(color("\nListe des livres disponibles :", FG_CYAN))
    for b in books:
        # Show id & title for selection
        print(
            f"[{color(str(b.id_book), FG_YELLOW)}] "
            f"{b.title} "
        )
    print()

    # Ask user
    raw = input("Id du livre à afficher : ").strip()
    try:
        book_id = int(raw)
    except ValueError:
        print(color("Id invalide.", FG_RED))
        return

    details = service.get_book_details(book_id)
    if details is None:
        print(color("Aucun livre trouvé avec cet id.", FG_RED))
        return

    print(color("\nDétail du livre :", FG_GREEN))
    print_book_details(details)



def handle_uc3_final_results(service: GoncourtService) -> None:
    """UC3 : display final results."""
    results = service.list_final_results()
    if not results:
        print(color("Aucun résultat saisi pour le dernier tour.", FG_RED))
        return

    print(color("\nRésultats du dernier tour :", FG_GREEN))

    sorted_results = sorted(results, key=lambda t: t[1], reverse=True)

    rank = 1
    for details, votes in sorted_results:
        b = details.book
        line = f"{rank:2d}. [{b.id_book}] {b.title} - {votes} voix"
        if rank == 1:
            print(color(line, FG_YELLOW))
        else:
            print(line)
        rank += 1
    print()



def _ask_book_ids(
    details_list: list[BookDetails],
    expected_count: int,
    label: str,
) -> list[int]:
    """Ask user to choose 'expected_count'(8,4) book ids from given list."""
    if not details_list:
        print(color(f"Aucun livre disponible pour {label}.", FG_RED))
        return []

    # Build allowed id set
    allowed_ids = {
        d.book.id_book
        for d in details_list
        if d.book.id_book is not None
    }

    _print_books_for_choice(details_list)

    while True:
        print(
            f"Saisir {color(str(expected_count), FG_YELLOW)} id(s) de livre "
            f"pour {label}, séparés par des virgules."
        )
        raw = input("Ids : ").strip()

        if not raw:
            print(color("Aucune saisie, annulation.", FG_RED))
            return []

        parts = [p.strip() for p in raw.split(",") if p.strip()]
        ids: list[int] = []

        for p in parts:
            try:
                ids.append(int(p))
            except ValueError:
                print(color(f"Id ignoré (non entier) : {p}", FG_RED))

        # Remove duplicates while keeping order
        unique_ids: list[int] = []
        for i in ids:
            if i not in unique_ids:
                unique_ids.append(i)

        if len(unique_ids) != expected_count:
            print(
                color(
                    f"Il faut choisir exactement {expected_count} livre(s), "
                    f"vous en avez choisi {len(unique_ids)}.",
                    FG_RED,
                )
            )
            continue

        invalid = [i for i in unique_ids if i not in allowed_ids]
        if invalid:
            print(
                color(
                    f"Id(s) non valide(s) (hors liste) : {invalid}",
                    FG_RED,
                )
            )
            continue

        return unique_ids


def _print_books_for_choice(details_list: list[BookDetails]) -> None:
    """List of books for CLI."""
    print()
    print(color("Liste des livres disponibles :", FG_CYAN))
    print("-" * 50)
    for d in details_list:
        book = d.book
        author_label = (
            f"{d.author.first_name} {d.author.last_name}"
            if d.author is not None
            else "Auteur inconnu"
        )
        print(
            f"[{color(str(book.id_book), FG_YELLOW)}] "
            f"{book.title} "
            f"({author_label})"
        )
    print("-" * 50)
    print()


def handle_uc4_second_selection(service: GoncourtService) -> None:
    """UC4 : set the 2nd selection with exactly 8 books from round 1."""
    # Load round 1 books
    details_list = service.list_books_for_selection(1)
    if not details_list:
        print(
            color(
                "Impossible de définir la 2e sélection : "
                "la 1ère sélection est vide.",
                FG_RED,
            )
        )
        return

    book_ids = _ask_book_ids(
        details_list,
        expected_count=8,
        label="la 2ᵉ sélection (8 livres)",
    )
    if not book_ids:
        return

    service.set_second_selection(book_ids)
    print(color("2ᵉ sélection mise à jour avec succès.", FG_GREEN))


def handle_uc5_third_selection(service: GoncourtService) -> None:
    """UC5 : set the 3rd selection with exactly 4 books from round 2."""
    # Load round 2 books
    details_list = service.list_books_for_selection(2)
    if not details_list:
        print(
            color(
                "Impossible de définir la 3e sélection : "
                "la 2e sélection est vide.",
                FG_RED,
            )
        )
        return

    book_ids = _ask_book_ids(
        details_list,
        expected_count=4,
        label="la 3ᵉ sélection (4 finalistes)",
    )
    if not book_ids:
        return

    service.set_third_selection(book_ids)
    print(color("3ᵉ sélection (finalistes) mise à jour avec succès.", FG_GREEN))


def handle_uc6_record_votes(service: GoncourtService) -> None:
    """UC6 : record votes for last round, book by book."""
    # Load finalists (round 3)
    finalists = service.list_books_for_selection(3)
    if not finalists:
        print(
            color(
                "Impossible de saisir les votes : "
                "la 3e sélection (finalistes) est vide.",
                FG_RED,
            )
        )
        return

    # Load current results to show existing votes if any
    current_results = service.list_final_results()
    current_map: Dict[int, int] = {
        book.book.id_book: nb
        for book, nb in current_results
        if book.book.id_book is not None
    }

    print()
    print(color("Saisie des votes du dernier tour : ", FG_CYAN))
    print("-" * 50)

    new_results: Dict[int, int] = {}

    for d in finalists:
        book = d.book
        if book.id_book is None:
            continue

        existing = current_map.get(book.id_book, 0)
        prompt = (
            f"Voix pour [{book.id_book}] {book.title} "
            f"(actuel : {existing}, Enter pour garder) : "
        )
        raw = input(prompt).strip()

        if raw == "":
            # Keep existing value (can be 0)
            new_results[book.id_book] = existing
            continue

        try:
            nb_votes = int(raw)
            if nb_votes < 0:
                print(color("Nombre de voix négatif ignoré, on garde 0.", FG_RED))
                nb_votes = 0
        except ValueError:
            print(
                color(
                    f"Valeur non entière pour ce livre, on garde la valeur actuelle ({existing}).",
                    FG_RED,
                )
            )
            nb_votes = existing

        new_results[book.id_book] = nb_votes

    # Optional: quick check of total votes (10 membres de jury)
    total_votes = sum(new_results.values())
    print()
    print(
        color(
            f"Total des voix saisies : {total_votes}",
            FG_YELLOW,
        )
    )

    # Confirm and save
    confirm = input(
        color("Confirmer l'enregistrement de ces votes ? (o/N) : ", FG_CYAN)
    ).strip().lower()

    if confirm != "o":
        print(color("Saisie des votes annulée.", FG_RED))
        return

    service.record_final_votes(new_results)
    print(color("Votes du dernier tour enregistrés.", FG_GREEN))


# //////////////////////////////////////////////////////////////


def build_service() -> GoncourtService:
    """Build Goncourt_service & DAO"""

    book_dao = BookDao()
    author_dao = AuthorDao()
    publisher_dao = PublisherDao()
    character_dao = CharacterDao()
    selection_dao = SelectionDao()
    final_result_dao = FinalResultDao()

    return GoncourtService(
        book_dao=book_dao,
        author_dao=author_dao,
        publisher_dao=publisher_dao,
        character_dao=character_dao,
        selection_dao=selection_dao,
        final_result_dao=final_result_dao,
    )


# /////////////////////////////// MAIN ///////////////////////////////

def main() -> None:

    setup_logging()
    service = build_service()

    print_header()

    while True:
        print_menu()
        choice = input(color("Votre choix : ", FG_MAGENTA)).strip().lower()

        if choice == "1":
            handle_uc1_list_selection(service)
        elif choice == "2":
            handle_uc2_book_details(service)
        elif choice == "3":
            handle_uc3_final_results(service)
        elif choice == "4":
            handle_uc4_second_selection(service)
        elif choice == "5":
            handle_uc5_third_selection(service)
        elif choice == "6":
            handle_uc6_record_votes(service)
        elif choice == "q":
            print(color("Au revoir", FG_CYAN))
            break
        else:
            print(color("Choix invalide, merci de réessayer.", FG_RED))


if __name__ == "__main__":
    main()
