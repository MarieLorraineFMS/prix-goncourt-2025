-- schema.sql
-- Table creation
SET
    utf8mb4 COLLATE utf8mb4_general_ci;

USE goncourt_2025;

SET
    FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS selection_book;

DROP TABLE IF EXISTS book_character;

DROP TABLE IF EXISTS final_result;

DROP TABLE IF EXISTS selection;

DROP TABLE IF EXISTS book;

DROP TABLE IF EXISTS jury_member;

DROP TABLE IF EXISTS author;

DROP TABLE IF EXISTS publisher;

SET
    FOREIGN_KEY_CHECKS = 1;

-- /////////////////////////////////////////////////
-- PUBLISHER
-- /////////////////////////////////////////////////
CREATE TABLE
    publisher (
        id_publisher INT UNSIGNED NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        PRIMARY KEY (id_publisher),
        UNIQUE KEY uniq_publisher_name (name)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- AUTHOR
-- /////////////////////////////////////////////////
CREATE TABLE
    author (
        id_author INT UNSIGNED NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(150) NOT NULL,
        biography TEXT NULL,
        PRIMARY KEY (id_author),
        KEY idx_author_last_name (last_name)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- BOOK
-- /////////////////////////////////////////////////
CREATE TABLE
    book (
        id_book INT UNSIGNED NOT NULL AUTO_INCREMENT,
        title VARCHAR(255) NOT NULL,
        summary TEXT NULL,
        publication_date DATE NULL,
        page_count INT UNSIGNED NULL,
        isbn VARCHAR(20) NULL,
        price DECIMAL(8, 2) NULL,
        author_id INT UNSIGNED NOT NULL,
        publisher_id INT UNSIGNED NOT NULL,
        PRIMARY KEY (id_book),
        KEY idx_book_title (title),
        KEY idx_book_author (author_id),
        KEY idx_book_publisher (publisher_id),
        CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author (id_author) ON UPDATE RESTRICT ON DELETE RESTRICT,
        CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher (id_publisher) ON UPDATE RESTRICT ON DELETE RESTRICT
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- JURY_MEMBER
-- /////////////////////////////////////////////////
CREATE TABLE
    jury_member (
        id_member INT UNSIGNED NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(150) NOT NULL,
        is_president TINYINT (1) NOT NULL DEFAULT 0,
        login VARCHAR(50) NOT NULL,
        password_hash VARCHAR(255) NOT NULL,
        PRIMARY KEY (id_member),
        UNIQUE KEY uniq_jury_login (login)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- SELECTION
-- /////////////////////////////////////////////////
CREATE TABLE
    selection (
        id_selection INT UNSIGNED NOT NULL AUTO_INCREMENT,
        year INT NOT NULL,
        round_number TINYINT UNSIGNED NOT NULL, -- 1, 2, 3
        selection_date DATE NOT NULL,
        PRIMARY KEY (id_selection),
        UNIQUE KEY uniq_selection_year_round (year, round_number)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- BOOK_CHARACTER
-- /////////////////////////////////////////////////
CREATE TABLE
    book_character (
        id_character INT UNSIGNED NOT NULL AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        book_id INT UNSIGNED NOT NULL,
        PRIMARY KEY (id_character),
        KEY idx_character_book (book_id),
        CONSTRAINT fk_character_book FOREIGN KEY (book_id) REFERENCES book (id_book) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- SELECTION_BOOK (N-N entre selection et book)
-- /////////////////////////////////////////////////
CREATE TABLE
    selection_book (
        id_selection INT UNSIGNED NOT NULL,
        id_book INT UNSIGNED NOT NULL,
        PRIMARY KEY (id_selection, id_book),
        KEY idx_selection_book_book (id_book),
        CONSTRAINT fk_selection_book_selection FOREIGN KEY (id_selection) REFERENCES selection (id_selection) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_selection_book_book FOREIGN KEY (id_book) REFERENCES book (id_book) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- /////////////////////////////////////////////////
-- FINAL_RESULT (résultat du dernier tour)
-- /////////////////////////////////////////////////
CREATE TABLE
    final_result (
        id_book INT UNSIGNED NOT NULL,
        nb_votes INT UNSIGNED NOT NULL DEFAULT 0,
        PRIMARY KEY (id_book),
        CONSTRAINT fk_final_result_book FOREIGN KEY (id_book) REFERENCES book (id_book) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;