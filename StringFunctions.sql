CREATE DATABASE StringFunctions;

USE StringFunctions;


CREATE TABLE books(book_id INT PRIMARY KEY AUTO_INCREMENT,
                                           title varchar(100),
                                                 author_fname varchar(100),
                                                              author_lname varchar(100),
                                                                           release_year int, stock_quantity int, pages int);


INSERT INTO books (title, author_fname, author_lname, release_year, stock_quantity, pages)
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


SELECT *
FROM books;

DESC books;

SHOW TABLES;


SELECT concat(author_fname, "  ", author_lname) AS Full_Name
FROM books;


SELECT concat_ws(" - ", author_fname, author_lname) AS Full_Name_WS
FROM books;


SELECT substring("Hello World", 1, 4);


SELECT substring("Hello World", 1, 7);


SELECT substring("Hello World", 2, 4);


SELECT substring("Hello World", 7);


SELECT substring("Hello World", 7, 2);


SELECT substring("Hello World", -3);


SELECT substr(title, 1, 15)
FROM books;


SELECT substr(author_lname, 1, 1) AS INITIAL,
       author_lname
FROM books;


SELECT concat(substr(title, 1, 10), "...") AS ShortTitle
FROM books;


SELECT concat(substring(author_fname, 1, 1), ".", substring(author_lname, 1, 1), ".") AS InitialsOfAuthors
FROM books;

select replace ('Hello World', 'Hell', '%&#%@');

select replace("cheese bread coffee milk", " ", " and ");


select * 
from books;

select replace(title, " ", "-")
from books;

select reverse("Hello World ! ");

select reverse(author_fname)
from books;

select concat(author_fname, reverse(author_fname))
from books;

select char_length(author_fname)
from books;

select char_length(title) AS Lenght, title
from books;

select ucase(title)
from books;

select lcase(title)
from books;

select insert("Hello Kliment", 6,4, " There ");

select LEFT("Kliment",3);

select RIGHT("Kliment",3);

select Repeat("hahah",50);

select TRIM(LEADING '.' FROM "............san antonio............");

select TRIM(BOTH '.' FROM "............san antonio............");



select REVERSE(ucase("Why does my cat look at me with such hate?"));

select Replace(title, " ", "->") AS title
from books;


select author_lname as forward, reverse(author_lname) as backwards
from books;


select concat_ws(" ", ucase(author_fname), ucase(author_lname)) AS FullUpperCaseName
from books;

select concat_ws(" was released in ", title, release_year)
from books;

select title, char_length(title)
from books;



select concat(substr(title, 1,10),"...."), concat_ws(",",author_lname,author_fname), concat(stock_quantity, " in stock")
from books;