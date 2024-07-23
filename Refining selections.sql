use store;

create table books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50),
author_fname VARCHAR(50),
author_lname VARCHAR(50),
released_year INT,
stock_quantity INT,
pages INT
);

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


INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('KBook with sapce', 'Kliment', 'Big Chakarovski', 2004, 89, 886);
	
    
select * 
from books;

select  author_lname
from books;


select distinct author_lname
from books;

select released_year
from books;


select distinct released_year
from books;

select concat_ws(" ",  author_fname, author_lname)
from books;

select distinct concat_ws(" ",  author_fname, author_lname) AS NoDuplicateNames
from books;


select distinct author_fname, author_lname AS NoDuplicateNamesNoConcat
from books;


-- Everything should be different(3 columns)
select distinct author_fname, author_lname, released_year AS NoDuplicateNamesNoConcat
from books;


select book_id, title, author_lname 
from books;

INSERT into books (title, author_lname) VALUES ("my life", "cakar");

select book_id, author_fname , author_lname 
from books
ORDER BY author_lname DESC;

select title,pages
from books
ORDER By pages DESC;

select title,pages
from books
ORDER By pages;



select title,pages
from books
ORDER By released_year DESC;


select book_id, author_fname, author_lname, pages
from books
ORDER By 4;

select author_lname, released_year, title 
from books
order by author_lname, released_year;


SELECT concat(author_fname, " ", author_lname) as FullAuthorName
FROM books
order by FullAuthorName;


select book_id, title, released_year
from books
ORDER by released_year
limit 5;

select book_id, title, released_year
from books
ORDER by released_year
limit 10;

select book_id, title, released_year
from books
ORDER by released_year DESC
limit 10;

select book_id, title, released_year
from books
ORDER by released_year DESC
limit 3;

select book_id, title, released_year
from books
ORDER by released_year;

select title, author_fname, author_lname
from books
where author_lname LIKE '%tw%';


select *
from books;

select title, pages
from books
ORDER BY pages desc
limit 1; 


select concat_ws(" - ", title,released_year)as Summary 
from books
Order by released_year  DESC
limit 3;

select title, author_lname
from books
where author_lname LIKE "% %";


select title, released_year,stock_quantity
from books
ORDER BY stock_quantity
limit 1,3;

select title, author_lname
from books
order by author_lname, title;

select concat("MY FAVOURITE AUTHOR IS ", UPPER(author_fname), " ", UPPER(author_lname), "!" ) as yell
from books
order by author_lname;




