# -*- coding: utf-8 -*-

"""
App - Prix Goncourt 2025.
"""

import textwrap
from typing import Dict

from business.goncourt_service import BookDetails, GoncourtService

from dao.book_dao import BookDao
from dao.author_dao import AuthorDao
from dao.jury_member_dao import JuryMemberDao
from dao.publisher_dao import PublisherDao
from dao.character_dao import CharacterDao
from dao.selection_dao import SelectionDao
from dao.final_result_dao import FinalResultDao

from model.jury_member import JuryMember

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
    """Return colored text"""
    return f"{fg}{text}{RESET}"

# /////////////////////////////// GLOBAL ///////////////////////////////

current_user: JuryMember | None = None

# /////////////////////////////// UI ///////////////////////////////

def print_header() -> None:
    """Header."""
    print(color("\n/////////////////////////////////", FG_CYAN))
    print(color("  PRIX GONCOURT 2025", FG_CYAN))
    print(color("/////////////////////////////////\n", FG_CYAN))
    print()

def print_menu() -> None:
    """Menu."""
    print(color("Menu principal :", FG_BLUE))
    print("  1) Lister les livres d'une sélection (UC1)")
    print("  2) Détail d'un livre (UC2)")
    print("  3) Résultats du dernier tour (UC3)")
    print("  4) Saisir les livres de la 2e sélection (UC4) [président]")
    print("  5) Saisir les livres de la 3e sélection (UC5) [président]")
    print("  6) Saisir les votes du dernier tour (UC6) [président]")
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
        print()
        print(color("En cours de délibération.", FG_RED))
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
    raw = input("Livre à afficher : ").strip()
    try:
        book_id = int(raw)
    except ValueError:
        print(color("Saisie invalide.", FG_RED))
        return

    details = service.get_book_details(book_id)
    if details is None:
        print(color("Aucun livre trouvé.", FG_RED))
        return

    print(color("\nDétail du livre :", FG_GREEN))
    print_book_details(details)

def handle_uc3_final_results(service: GoncourtService) -> None:
    """UC3 : display final results."""
    results = service.list_final_results()
    if not results:
        print()
        print(color("La délibération est en cours.", FG_RED))
        return

    print(color("\nRésultats du dernier tour :", FG_GREEN))

    # Sort by nb_votes
    sorted_results = sorted(results, key=lambda r: r.nb_votes, reverse=True)

    rank = 1

    for r in sorted_results:
        b = r.book_details.book
        line = f"{rank:2d}. [{b.id_book}] {b.title} - {r.nb_votes} voix"

        if r.is_winner:
            if r.decided_by_president:
                line += " (lauréat, départagé par le président)"
            else:
                line += " (lauréat)"

        if rank == 1:
            print(color(line, FG_YELLOW))
        else:
            print(line)
        rank += 1
    print()

def handle_uc4_second_selection(service: GoncourtService) -> None:
    """UC4 : set the 2nd selection with 8 books from round 1."""
    # Load round 1 books
    details_list = service.list_books_for_selection(1)
    if not details_list:
        print(
            color(
                "Impossible de définir la 2e sélection : la délibération de la 1ère sélection est encore en cours.",
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

    print(
        color(
            "Attention : définir une nouvelle sélection va réinitialiser la 3ᵉ sélection et les résultats finaux.",
            FG_YELLOW,
        )
    )
    confirm = input(
        color("Continuer ? (o/N) : ", FG_CYAN)
    ).strip().lower()

    if confirm != "o":
        print(color("Opération annulée.", FG_RED))
        return

    service.set_second_selection(book_ids)
    print()
    print(color("Seconde sélection mise à jour avec succès.", FG_GREEN))

def handle_uc5_third_selection(service: GoncourtService) -> None:
    """UC5 : set the 3rd selection with 4 books from round 2."""
    # Load round 2 books
    details_list = service.list_books_for_selection(2)
    if not details_list:
        print(
            color(
                "Impossible de définir la 3e sélection : la 2e sélection n'a pas encore été définie.",
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

    print(
        color(
            "Attention : définir une nouvelle sélection va réinitialiser les résultats finaux.",
            FG_YELLOW,
        )
    )
    confirm = input(
        color("Continuer ? (o/N) : ", FG_CYAN)
    ).strip().lower()
    if confirm != "o":
        print(color("Opération annulée.", FG_RED))
        return

    # Update third selection & reset final results inside the service
    service.set_third_selection(book_ids)
    print()
    print(color("Finalistes mis à jour avec succès.", FG_GREEN))

def handle_uc6_record_votes(service: GoncourtService) -> None:
    """UC6 : record votes for last round."""
    # Load finalists
    finalists = service.list_books_for_selection(3)
    if not finalists:
        print(
            color(
                "Impossible de saisir les votes : la délibération de la 3e sélection est en encore cours.",
                FG_RED,
            )
        )
        return

    print()
    print(color("======Finalistes=======", FG_CYAN))
    _print_books_for_choice(finalists)

    finalist_ids: list[int] = [
        d.book.id_book
        for d in finalists
        if d.book.id_book is not None
    ]

    if not finalist_ids:
        # SHOULD NOT HAPPEN
        print(color("Erreur : aucun finaliste trouvé.", FG_RED))
        return


    # ////////////////////////////// JURY VOTES //////////////////////////////

    print(
        color(
            "Saisir les voix des membres du jury.",
            FG_YELLOW,
        )
    )

    member_votes: Dict[int, int] = {}
    total_members: int = 0

    for d in finalists:
        b = d.book
        if b.id_book is None:
            continue

        while True:
            raw = input(
                f"Voix des membres pour [{b.id_book}] {b.title} : "
            ).strip()

            if raw == "":
                # Allow 0
                nb = 0
            else:
                try:
                    nb = int(raw)
                    if nb < 0:
                        print(
                            color(
                                "Nombre de voix négatif, merci de ressaisir.",
                                FG_RED,
                            )
                        )
                        continue
                except ValueError:
                    print(color("Valeur non entière, merci de ressaisir.", FG_RED))
                    continue

            member_votes[b.id_book] = nb
            total_members += nb
            break

    print()
    print(
        color(
            f"Total des voix des membres du jury : {total_members}",
            FG_YELLOW,
        )
    )

    if total_members != 9:
        print(
            color(
                "Erreur : le total des voix des membres doit être égal à 9.",
                FG_RED,
            )
        )
        print(color("Saisie annulée, merci de recommencer.", FG_RED))
        return

    # /////////////////////////// PRESIDENT VOTE ///////////////////////////

    president_vote: int

    while True:
        raw = input(
            color(
                "Veuillez saisir votre vote : ",
                FG_CYAN,
            )
        ).strip()

        try:
            choice = int(raw)
        except ValueError:
            print(color("Saisie invalide, merci de saisir un entier.", FG_RED))
            continue

        if choice not in finalist_ids:
            print(
                color(
                    "Cette saisie ne correspond pas à un finaliste, merci de réessayer.",
                    FG_RED,
                )
            )
            continue

        president_vote = choice
        break

    # /////////////////////// TOTAL VOTES ///////////////////////////

    votes_with_president: Dict[int, int] = {}
    for bid in finalist_ids:
        base_votes = member_votes.get(bid, 0)
        if bid == president_vote:
            base_votes += 1  # president vote
        votes_with_president[bid] = base_votes

    total_votes: int = sum(votes_with_president.values())

    print()
    print(
        color(
            f"Total des voix (membres + président) : {total_votes}",
            FG_YELLOW,
        )
    )

    if total_votes != 10:
        # SHOULD NOT HAPPEN
        print(
            color(
                "Erreur interne : le total des voix devrait être égal à 10.",
                FG_RED,
            )
        )
        print(color("Saisie annulée, merci de recommencer.", FG_RED))
        return

    # ////////////////////////////// CHECK TIE //////////////////////////////////////

    max_votes: int = max(votes_with_president.values()) if votes_with_president else 0
    top_ids: list[int] = [
        bid for bid, nb in votes_with_president.items() if nb == max_votes
    ]

    tie_mode: bool = len(top_ids) > 1 and max_votes > 0

    chosen_winner: int

    if tie_mode:
        print()
        print(
            color(
                "Égalité après prise en compte de toutes les voix :",
                FG_YELLOW,
            )
        )
        for d in finalists:
            b = d.book
            if b.id_book in top_ids:
                nb_virtual = votes_with_president.get(b.id_book, 0)
                print(f"- [{b.id_book}] {b.title} ({nb_virtual} voix)")
        print()

        # If president had voted for one of the tied books, we use that as winner
        if president_vote in top_ids:
            chosen_winner = president_vote
        else:
            print(
                color(
                    "Le président doit départager les ex aequo.",
                    FG_YELLOW,
                )
            )

            tied_details = [
                d
                for d in finalists
                if d.book.id_book is not None and d.book.id_book in top_ids
            ]

            chosen_list = _ask_book_ids(
                tied_details,
                expected_count=1,
                label="le lauréat parmi les ex aequo",
            )

            if not chosen_list:
                print(color("Aucun choix effectué, saisie annulée.", FG_RED))
                return

            chosen_winner = chosen_list[0]


        final_votes: Dict[int, int] = dict(votes_with_president)
    else:
        # No tie
        chosen_winner = max(votes_with_president, key=lambda bid: votes_with_president[bid])
        final_votes = dict(votes_with_president)

    # ///////////////////////// SUMMARY /////////////////////////////////

    print()
    print(color("Récapitulatif des résultats :", FG_CYAN))

    for d in finalists:
        b = d.book
        if b.id_book is None:
            continue

        nb_final = final_votes.get(b.id_book, 0)
        line = f"- [{b.id_book}] {b.title} : {nb_final} voix"

        if tie_mode and b.id_book == chosen_winner:
            line += " (lauréat, départagé par le président)"
        elif not tie_mode and b.id_book == chosen_winner:
            line += " (lauréat)"

        print(line)

    total_displayed: int = sum(final_votes.values())
    print()
    print(
        color(
            f"Total des voix : {total_displayed}",
            FG_YELLOW,
        )
    )

    print()
    confirm = input(
        color("Confirmer l'enregistrement de ces résultats ? (o/N) : ", FG_CYAN)
    ).strip().lower()

    if confirm != "o":
        print(color("Saisie des votes annulée.", FG_RED))
        return

    service.record_final_votes(
        final_votes,
        winner_book_id=chosen_winner,
        decided_by_president=tie_mode,
    )
    print()
    print(color("Votes du dernier tour enregistrés.", FG_GREEN))
    print()

# //////////////////////// HELPERS ///////////////////////////////////

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
            f"Saisir {color(str(expected_count), FG_YELLOW)} livre(s) "
            f"pour {label}, séparés par des virgules."
        )
        raw = input("Choix : ").strip()

        if not raw:
            print(color("Aucune saisie, annulation.", FG_RED))
            return []

        parts = [p.strip() for p in raw.split(",") if p.strip()]
        ids: list[int] = []

        for p in parts:
            try:
                ids.append(int(p))
            except ValueError:
                print(color(f"Saisie ignorée (non entier) : {p}", FG_RED))

        # Remove duplicates while keeping order
        unique_ids: list[int] = []
        for i in ids:
            if i not in unique_ids:
                unique_ids.append(i)

        if len(unique_ids) != expected_count:
            print(
                color(
                    f"Il faut choisir {expected_count} livre(s), "
                    f"vous en avez choisi {len(unique_ids)}.",
                    FG_RED,
                )
            )
            continue

        invalid = [i for i in unique_ids if i not in allowed_ids]
        if invalid:
            print(
                color(
                    f"Saisie(s) non valide(s) (hors liste) : {invalid}",
                    FG_RED,
                )
            )
            continue

        return unique_ids

def _print_books_for_choice(details_list: list[BookDetails]) -> None:
    """List of books for CLI."""
    print()
    print(color("Liste des livres :", FG_CYAN))
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

# ////////////////////////////////////////////////////////////////////

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

def authenticate_user() -> JuryMember:
    """Ask for jury login and load the corresponding member from DB.
    Loops until a valid login is provided.
    """
    dao = JuryMemberDao()

    while True:
        login = input(color("Identifiant membre du jury : ", FG_MAGENTA)).strip()
        if not login:
            print(color("Login obligatoire, merci de réessayer.", FG_RED))
            continue

        member = dao.read_by_login(login)
        if member is None:
            print(color("Membre du jury inconnu, merci de réessayer.", FG_RED))
            continue

        role = "Président du jury" if member.is_president else "Membre du jury"
        print()
        print()
        print(
            color(
                f"Connecté en tant que {member.first_name} {member.last_name} ({role})",
                FG_GREEN,
            )
        )
        return member

# /////////////////////////////// MAIN ///////////////////////////////

def main() -> None:

    setup_logging()
    service = build_service()
    global current_user
    current_user = authenticate_user()

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
            if not (current_user and current_user.is_president):
                print(color("Accès réservé au président du jury.", FG_RED))
                continue
            handle_uc4_second_selection(service)
        elif choice == "5":
            if not (current_user and current_user.is_president):
                print(color("Accès réservé au président du jury.", FG_RED))
                continue
            handle_uc5_third_selection(service)
        elif choice == "6":
            if not (current_user and current_user.is_president):
                print(color("Accès réservé au président du jury.", FG_RED))
                continue
            handle_uc6_record_votes(service)
        elif choice == "q":
            print(color("Au revoir", FG_CYAN))
            break
        else:
            print(color("Choix invalide, merci de réessayer.", FG_RED))


if __name__ == "__main__":
    main()
