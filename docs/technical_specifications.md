# Technical Specifications – Prix Goncourt 2025

Ce document décrit les traitements, les méthodes, les interactions et les tables impliquées pour chaque cas d’utilisation.


---

## UC1 – Consulter une sélection

### Service
`list_books_for_selection(round_number: int) -> list[Book]`
- year = 2025 fixé dans la V1.

### DAO
- `SelectionDao.read_by_year_and_round(2025, round_number)`
- `BookDao.read_by_selection(selection_id)`
- `AuthorDao.read(author_id)`
- `PublisherDao.read(publisher_id)`
- `CharacterDao.read_by_book(book_id)`

### Tables
- `selection`
- `selection_book`
- `book`
- `author`
- `publisher`
- `character`

---

## UC2 – Consulter le détail d’un livre

### Service
`get_book_details(book_id: int) -> Book`

### DAO
- `BookDao.read(book_id)`
- `AuthorDao.read(author_id)`
- `PublisherDao.read(publisher_id)`
- `CharacterDao.read_by_book(book_id)`

### Tables
- `book`
- `author`
- `publisher`
- `character`

---

## UC3 – Consulter les résultats du dernier tour

### Service
`list_final_results() -> list[tuple[Book, int]]`

### DAO
  - `FinalResultDao.read_all()`

### Tables
- `final_result`
- `book`

---

## UC4 – Indiquer les livres de la 2e sélection

### Service
`set_second_selection(book_ids: list[int]) -> None`

### DAO
- `SelectionDao.read_by_year_and_round(2025, 2)`
- `SelectionDao.set_books(selection_id:int, book_ids:list[int])`

### Tables
- `selection`
- `selection_book`

---

## UC5 – Indiquer les livres de la 3e sélection

### Service
`set_third_selection(book_ids: list[int]) -> None`

### DAO
- Idem UC4, mais avec `round_number = 3`.

---

## UC6 – Saisir les votes du dernier tour

### Service
`record_final_votes(results: dict[int, int]) -> None`

### DAO
- `FinalResultDao.replace_results(results: dict[int, int])`

### Tables
- `final_result`

---

## Fonctionnalités futures (authentification & votes)

### UC7 – Authentification
Service : `authenticate_member(login:str, password:str) -> Optional[JuryMember]`
DAO : `JuryMemberDao.read_by_login(login:str)`

### UC8 / UC9 / UC10 – Votes
Service générique :
`cast_vote(member_id:int, book_id:int, round_number:int) -> None`
DAO : `VoteDao.create(Vote(...))`
Tables : `vote`, `jury_member`

---
