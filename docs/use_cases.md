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
3. Les finalistes sont affichés avec leur nombre de voix.
4. Le lauréat est indiqué? En cas d’égalité, l’affichage précise si le résultat a été départagé par le président.

---

### UC4 – Indiquer les livres de la 2e sélection
**Acteur :** Président
**But :** Définir la liste officielle des livres de la 2e sélection.
**Scénario :**
1. Le président s'authentifie.
2. Le président choisit les 8 livres de la 2e sélection parmi les livres de la 1re sélection.
3. L’application met à jour la sélection n°2 de l’année 2025.
4. L’application vide automatiquement :
   - la 3e sélection (finalistes),
   - les résultats finaux (table `final_result`).

---

### UC5 – Indiquer les livres de la 3e sélection
**Acteur :** Président
**But :** Enregistrer la liste des finalistes.
**Scénario :**
1. Le président s’authentifie.
2. L’application affiche la liste des 4 finalistes (3e sélection).
3. Le président saisit, pour chaque finaliste, le nombre de voix des autres membres du jury.
   - Le total doit être exactement égal à 9 (9 voix de membres).
4. Le président saisit ensuite son propre vote (un seul livre parmi les finalistes).
5. L’application calcule le total des voix (membres + président = 10).
6. Si un seul livre a le maximum de voix :
   - ce livre est désigné lauréat.
7. S’il y a égalité sur le nombre de voix (y compris la voix du président) :
   - si le président a déjà voté pour un des ex aequo, ce livre est désigné lauréat.
   - sinon, l’application demande au président de trancher parmi les ex aequo.
8. L’application enregistre dans `final_result` :
   - les voix finales par livre,
   - le livre lauréat (`is_winner = 1`),
   - un indicateur `decided_by_president` pour savoir si le lauréat a été départagé par le président.
9. Les résultats sont consultables via UC3.

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
