-- /////////////////////////////////////////////////////////////////////////////////////
-- TODO SQL – Future evolution for Prix Goncourt 2025 database
--   1) Add PERSON as a common parent for AUTHOR & JURY_MEMBER
--   2) Add VOTE table to link jury members & books by round
--   3) (Optional) Prepare FINAL_RESULT for multiple years/rounds
-- /////////////////////////////////////////////////////////////////////////////////////
-- ////////////////////////////////////////////////////////////////////////////////////
-- STEP 0 – BACKUP & FK CHECK
-- ////////////////////////////////////////////////////////////////////////////////////
-- Before doing anything, create a backup
SET
    FOREIGN_KEY_CHECKS = 0;

-- ///////////////////////////////////////////////////////////
-- STEP 1 – Create PERSON table
-- ///////////////////////////////////////////////////////////
CREATE TABLE
    person (
        id_person INT UNSIGNED NOT NULL AUTO_INCREMENT,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(150) NOT NULL,
        PRIMARY KEY (id_person),
        KEY idx_person_last_name (last_name)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- ///////////////////////////////////////////////////////////
-- STEP 2 – Add person_id to AUTHOR & JURY_MEMBER
-- (step to link existing rows to PERSON)
-- ///////////////////////////////////////////////////////////
ALTER TABLE author
ADD COLUMN person_id INT UNSIGNED NULL AFTER id_author;

ALTER TABLE jury_member
ADD COLUMN person_id INT UNSIGNED NULL AFTER id_member;

-- ///////////////////////////////////////////////////////////
-- STEP 3 – Seed PERSON with AUTHOR & JURY_MEMBER
-- ///////////////////////////////////////////////////////////
-- 3.1 Insert authors as persons
INSERT INTO
    person (first_name, last_name)
SELECT DISTINCT
    first_name,
    last_name
FROM
    author;

-- 3.2 Link each author to its person row
UPDATE author a
JOIN person p ON p.first_name = a.first_name
AND p.last_name = a.last_name
SET
    a.person_id = p.id_person;

-- 3.3 Insert distinct jury members
INSERT INTO
    person (first_name, last_name)
SELECT DISTINCT
    jm.first_name,
    jm.last_name
FROM
    jury_member jm
    LEFT JOIN person p ON p.first_name = jm.first_name
    AND p.last_name = jm.last_name
WHERE
    p.id_person IS NULL;

-- 3.4 Link each jury member to its person row
UPDATE jury_member jm
JOIN person p ON p.first_name = jm.first_name
AND p.last_name = jm.last_name
SET
    jm.person_id = p.id_person;

-- ///////////////////////////////////////////////////////////
-- STEP 4 – Add foreign keys from AUTHOR/JURY_MEMBER to PERSON
-- ///////////////////////////////////////////////////////////
ALTER TABLE author MODIFY COLUMN person_id INT UNSIGNED NOT NULL;

ALTER TABLE jury_member MODIFY COLUMN person_id INT UNSIGNED NOT NULL;

ALTER TABLE author ADD CONSTRAINT fk_author_person FOREIGN KEY (person_id) REFERENCES person (id_person) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE jury_member ADD CONSTRAINT fk_jury_member_person FOREIGN KEY (person_id) REFERENCES person (id_person) ON UPDATE CASCADE ON DELETE RESTRICT;

-- ///////////////////////////////////////////////////////////
-- STEP 5 – Move first_name/last_name only in PERSON
--          & remove duplicates in AUTHOR/JURY_MEMBER
-- ///////////////////////////////////////////////////////////
-- SHOULD NOT be executed until app is updated to read names from PERSON
-- After app update:
-- ALTER TABLE author
--     DROP COLUMN first_name,
--     DROP COLUMN last_name;
--
-- ALTER TABLE jury_member
--     DROP COLUMN first_name,
--     DROP COLUMN last_name;
-- ///////////////////////////////////////////////////////////
-- STEP 6 – Create VOTE table (UC8, UC9, UC10)
-- ///////////////////////////////////////////////////////////
-- Record individual votes of jury members for each round (1, 2, 3, ...).
CREATE TABLE
    vote (
        id_vote INT UNSIGNED NOT NULL AUTO_INCREMENT,
        id_member INT UNSIGNED NOT NULL,
        id_book INT UNSIGNED NOT NULL,
        round_number TINYINT UNSIGNED NOT NULL, -- 1, 2, 3...
        vote_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (id_vote),
        UNIQUE KEY uniq_vote_member_round_book (id_member, round_number, id_book),
        KEY idx_vote_book (id_book),
        CONSTRAINT fk_vote_member FOREIGN KEY (id_member) REFERENCES jury_member (id_member) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT fk_vote_book FOREIGN KEY (id_book) REFERENCES book (id_book) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- //////////////////////////////////////////////////////////////////////
-- STEP 7 – (Optional) Prepare FINAL_RESULT for multi-year & multi-round
-- //////////////////////////////////////////////////////////////////////
-- Current table final_result:
--   id_book (PK, FK book)
--   nb_votes
--   is_winner
--   decided_by_president
--
-- Final_result per : year, round, book
-- 7.1 Add columns year & round_number with default for current data
ALTER TABLE final_result
ADD COLUMN year INT NOT NULL DEFAULT 2025 AFTER id_book,
ADD COLUMN round_number TINYINT UNSIGNED NOT NULL DEFAULT 3 AFTER year;

-- 7.2 Change primary key to (year, round_number, id_book)
ALTER TABLE final_result
DROP PRIMARY KEY;

ALTER TABLE final_result ADD PRIMARY KEY (year, round_number, id_book);

-- ///////////////////////////////////////////////////////////
-- STEP 8 – Re-enable FK check
-- ///////////////////////////////////////////////////////////
SET
    FOREIGN_KEY_CHECKS = 1;