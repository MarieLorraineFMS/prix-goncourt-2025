# Architecture – Prix Goncourt 2025

L'application suit une architecture multicouche avec un design pattern DAO


## 1. Structure générale

```
app/
    main.py
business/
    goncourt_service.py
dao/
    author_dao.py
    base_dao.py
    book_dao.py
    character_dao.py
    jury_member_dao.py
    publisher_dao.py
    selection_dao.py
    vote_dao.py
model/
    author.py
    book.py
    character.py
    jury_member.py
    publisher.py
    selection.py
    vote.py
docs/
    architecture.md
    class_diagram.puml
    mcd.puml
    sequence_diagram_book.puml
    sequence_diagram_selection.puml
    technical_specifications.md
    use_cases.md
    use_cases.puml
sql/
    schema.sql
    seed.sql
tests/
    test_sql.sql
```




### Couche `model/`
Contient les entités métiers :
- Book, Author, Publisher, Character
- Selection
- JuryMember
- Vote (à venir)

### Couche `dao/`
Accès DB via un `Dao[T]` générique.

### Couche `business/`
`GoncourtService` centralise les cas d’utilisation :
- gestion des sélections
- affichage des livres
- résultats
- opérations du président du jury

### Couche `app/`
Interface console, appelant le service.

## 2. Justification des choix

- **Année fixée à 2025** dans la V1, mais présente dans le modèle pour une éventuelle future extension.
- **Table `final_result`** choisie pour simplifier l’implémentation future des votes.
- **DAO génériques** pour respecter les bonnes pratiques, cohérent avec le projet École & le cours.
- **PlantUML + markdown** pour la documentation.
