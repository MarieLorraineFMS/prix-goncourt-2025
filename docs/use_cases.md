# Use Cases – Prix Goncourt 2025

Cas d’utilisation principaux & futurs de l’application
Prix Goncourt 2025.

## Acteurs

- **Utilisateur**
- **Président du jury**
- **Membre du jury** (fonctionnalités futures)

## Liste des cas d’utilisation

### UC1 – Consulter une sélection
**Acteur :** Utilisateur
**But :** Afficher la liste des livres pour la 1re, 2e ou 3e sélection.
**Déclencheur :** L’utilisateur choisit un numéro de sélection.
**Scénario :**
1. L’utilisateur saisit 1, 2 ou 3.
2. L’application récupère la sélection correspondante pour l’année 2025.
3. Les livres associés sont affichés avec leurs informations complètes.

---

### UC2 – Consulter le détail d’un livre
**Acteur :** Utilisateur
**But :** Afficher toutes les informations d’un livre.
**Scénario :**
1. L’utilisateur choisit un livre dans la liste.
2. L’application affiche les données du livre, de l’auteur, de l’éditeur et des personnages principaux.

---

### UC3 – Consulter les résultats du dernier tour
**Acteurs :** Utilisateur, Président
**But :** Afficher le roman gagnant et les voix obtenues par les finalistes.
**Scénario :**
1. L’application lit les résultats du dernier tour.
2. Les livres finalistes sont triés par nombre de voix.
3. Le premier est affiché comme lauréat.

---

### UC4 – Indiquer les livres de la 2e sélection
**Acteur :** Président
**But :** Définir la liste officielle des livres de la 2e sélection.
**Scénario :**
1. Le président sélectionne une liste de livres.
2. L’application met à jour la sélection n°2 de l’année 2025.

---

### UC5 – Indiquer les livres de la 3e sélection
**Acteur :** Président
**But :** Enregistrer la liste des finalistes.
**Scénario :**
1. Le président sélectionne les livres finalistes.
2. L’application met à jour la sélection n°3 de 2025.

---

### UC6 – Saisir les votes du dernier tour
**Acteur :** Président
**But :** Enregistrer le nombre de voix par livre finaliste.
**Scénario :**
1. Le président saisit un nombre de voix par livre.
2. L’application stocke les résultats dans une table dédiée.
3. Les résultats peuvent ensuite être consultés (UC3).

---

## Cas d’utilisation futurs

### UC7 – S’authentifier
### UC8 – Voter pour la 2e sélection
### UC9 – Voter pour la 3e sélection
### UC10 – Voter pour le lauréat

---

## Diagramme des cas d’utilisation

Voir fichier : **use_cases.puml**
