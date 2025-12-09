-- test_queries.sql
USE goncourt_2025;

-- /////////////////////////////////////////////////
-- All books with author & publisher
-- /////////////////////////////////////////////////
SELECT
    b.id_book,
    b.title,
    a.first_name AS author_first_name,
    a.last_name AS author_last_name,
    p.name AS publisher_name,
    b.publication_date,
    b.isbn,
    b.price
FROM
    book b
    JOIN author a ON a.id_author = b.author_id
    JOIN publisher p ON p.id_publisher = b.publisher_id
ORDER BY
    b.id_book;

-- /////////////////////////////////////////////////
-- Books by selection
-- /////////////////////////////////////////////////
SELECT
    s.id_selection,
    s.year,
    s.round_number,
    s.selection_date,
    b.id_book,
    b.title
FROM
    selection_book sb
    JOIN selection s ON s.id_selection = sb.id_selection
    JOIN book b ON b.id_book = sb.id_book
ORDER BY
    s.round_number,
    b.id_book;

-- /////////////////////////////////////////////////
-- Book count by selection
-- /////////////////////////////////////////////////
SELECT
    s.id_selection,
    s.round_number,
    s.selection_date,
    COUNT(*) AS nb_books
FROM
    selection_book sb
    JOIN selection s ON s.id_selection = sb.id_selection
GROUP BY
    s.id_selection,
    s.round_number,
    s.selection_date
ORDER BY
    s.round_number;

-- /////////////////////////////////////////////////
-- Final result with title, author & publisher
-- /////////////////////////////////////////////////
SELECT
    fr.id_book,
    b.title,
    a.first_name AS author_first_name,
    a.last_name AS author_last_name,
    p.name AS publisher_name,
    fr.nb_votes
FROM
    final_result fr
    JOIN book b ON b.id_book = fr.id_book
    JOIN author a ON a.id_author = b.author_id
    JOIN publisher p ON p.id_publisher = b.publisher_id
ORDER BY
    fr.nb_votes DESC;

-- /////////////////////////////////////////////////
-- Character by book
-- /////////////////////////////////////////////////
SELECT
    bc.book_id,
    b.title,
    bc.name AS character_name
FROM
    book_character bc
    JOIN book b ON b.id_book = bc.book_id
ORDER BY
    bc.book_id,
    bc.name;

-- /////////////////////////////////////////////////
-- Book count by publisher
-- /////////////////////////////////////////////////
SELECT
    p.id_publisher,
    p.name AS publisher_name,
    COUNT(b.id_book) AS nb_books
FROM
    publisher p
    LEFT JOIN book b ON b.publisher_id = p.id_publisher
GROUP BY
    p.id_publisher,
    p.name
ORDER BY
    nb_books DESC,
    p.name;