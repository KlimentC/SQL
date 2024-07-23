USE store;


CREATE TABLE books (book_id INT PRIMARY KEY AUTO_INCREMENT,
                                            title VARCHAR(50),
                                                  author_fname VARCHAR(50),
                                                               author_lname VARCHAR(50),
                                                                            released_year INT, stock_quantity INT, pages INT);


INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('To Kill a Mockingbird', 'Harper', 'Lee', 1960, 30, 324),
       ('1984', 'George', 'Orwell', 1949, 25, 328),
       ('Pride and Prejudice', 'Jane', 'Austen', 1813, 15, 279),
       ('The Great Gatsby', 'F. Scott', 'Fitzgerald', 1925, 40, 218),
       ('Moby-Dick', 'Herman', 'Melville', 1851, 20, 635),
       ('War and Peace', 'Leo', 'Tolstoy', 1869, 12, 1225),
       ('The Catcher in the Rye', 'J.D.', 'Salinger', 1951, 35, 277),
       ('The Hobbit', 'J.R.R.', 'Tolkien', 1937, 50, 310),
       ('Brave New World', 'Aldous', 'Huxley', 1932, 28, 268),
       ('The Lord of the Rings', 'J.R.R.', 'Tolkien', 1954, 45, 1178),
       ('Jane Eyre', 'Charlotte', 'Brontë', 1847, 22, 500),
       ('Animal Farm', 'George', 'Orwell', 1945, 33, 112),
       ('Wuthering Heights', 'Emily', 'Brontë', 1847, 18, 416),
       ('Crime and Punishment', 'Fyodor', 'Dostoevsky', 1866, 20, 671),
       ('The Adventures of Huckleberry Finn', 'Mark', 'Twain', 1884, 30, 366),
       ('The Odyssey', 'Homer', '', -800, 10, 541),
       ('Les Misérables', 'Victor', 'Hugo', 1862, 25, 1463),
       ('Anna Karenina', 'Leo', 'Tolstoy', 1877, 15, 864),
       ('Madame Bovary', 'Gustave', 'Flaubert', 1857, 20, 328),
       ('The Divine Comedy', 'Dante', 'Alighieri', 1320, 12, 798);


INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256),
       ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
       ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);


INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('KBook with sapce', 'Kliment', 'Big Chakarovski', 2004, 89, 886);


SELECT *
FROM books;


SELECT author_lname
FROM books;


SELECT DISTINCT author_lname
FROM books;


SELECT released_year
FROM books;


SELECT DISTINCT released_year
FROM books;


SELECT concat_ws(" ", author_fname, author_lname)
FROM books;


SELECT DISTINCT concat_ws(" ", author_fname, author_lname) AS NoDuplicateNames
FROM books;


SELECT DISTINCT author_fname,
                author_lname AS NoDuplicateNamesNoConcat
FROM books;

-- Everything should be different(3 columns)

SELECT DISTINCT author_fname,
                author_lname,
                released_year AS NoDuplicateNamesNoConcat
FROM books;


SELECT book_id,
       title,
       author_lname
FROM books;


INSERT INTO books (title, author_lname)
VALUES ("my life", "cakar");


SELECT book_id,
       author_fname,
       author_lname
FROM books
ORDER BY author_lname DESC;


SELECT title,
       pages
FROM books
ORDER BY pages DESC;


SELECT title,
       pages
FROM books
ORDER BY pages;


SELECT title,
       pages
FROM books
ORDER BY released_year DESC;


SELECT book_id,
       author_fname,
       author_lname,
       pages
FROM books
ORDER BY 4;


SELECT author_lname,
       released_year,
       title
FROM books
ORDER BY author_lname,
         released_year;


SELECT concat(author_fname, " ", author_lname) AS FullAuthorName
FROM books
ORDER BY FullAuthorName;


SELECT book_id,
       title,
       released_year
FROM books
ORDER BY released_year
LIMIT 5;


SELECT book_id,
       title,
       released_year
FROM books
ORDER BY released_year
LIMIT 10;


SELECT book_id,
       title,
       released_year
FROM books
ORDER BY released_year DESC
LIMIT 10;


SELECT book_id,
       title,
       released_year
FROM books
ORDER BY released_year DESC
LIMIT 3;


SELECT book_id,
       title,
       released_year
FROM books
ORDER BY released_year;


SELECT title,
       author_fname,
       author_lname
FROM books
WHERE author_lname LIKE '%tw%';


SELECT *
FROM books;


SELECT title,
       pages
FROM books
ORDER BY pages DESC
LIMIT 1;


SELECT concat_ws(" - ", title, released_year)AS SUMMARY
FROM books
ORDER BY released_year DESC
LIMIT 3;


SELECT title,
       author_lname
FROM books
WHERE author_lname LIKE "% %";


SELECT title,
       released_year,
       stock_quantity
FROM books
ORDER BY stock_quantity
LIMIT 1,
      3;


SELECT title,
       author_lname
FROM books
ORDER BY author_lname,
         title;


SELECT concat("MY FAVOURITE AUTHOR IS ", UPPER(author_fname), " ", UPPER(author_lname), "!") AS yell
FROM books
ORDER BY author_lname;
