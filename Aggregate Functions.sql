SELECT count(author_fname) AS NumberOfAuthor_FName
FROM books;


SELECT count(DISTINCT author_fname) AS DistinctAuthorFnames
FROM Books;


SELECT count(DISTINCT author_lname) AS DistinctAuthorLnames
FROM Books;


SELECT count(DISTINCT released_year) AS distinctYears
FROM books;


SELECT title
FROM books
WHERE title LIKE "%the%";


SELECT count(*) AS CountTheBooks
FROM books
WHERE title LIKE "%the%";


SELECT author_lname
FROM books
GROUP BY author_lname;


SELECT author_lname,
       count(*) AS BooksWirtten
FROM books
GROUP BY author_lname;


SELECT author_lname,
       count(*) AS BooksWirtten
FROM books
GROUP BY author_lname
ORDER BY count(*);


SELECT released_year
FROM books;


SELECT released_year,
       count(*) AS Number_Of_Books_Per_Year
FROM books
GROUP BY released_year;


SELECT min(released_year) AS EarlyYear
FROM books;


SELECT max(pages)
FROM books;


SELECT min(author_fname)
FROM books;


SELECT title,
       pages,
       author_fname AS OrdinaryWay
FROM books
ORDER BY pages DESC
LIMIT 1;


SELECT title,
       author_fname,
       author_lname,
       pages
FROM books
WHERE pages =
    (SELECT max(pages)
     FROM books);


SELECT title,
       released_year,
       author_lname,
       author_fname
FROM books
WHERE released_year =
    (SELECT max(released_year)
     FROM books);


SELECT title,
       released_year,
       author_lname,
       author_fname
FROM books
WHERE released_year =
    (SELECT min(released_year)
     FROM books);


SELECT author_fname,
       author_lname,
       count(*)
FROM books
GROUP BY author_fname,
         author_lname;


SELECT concat_ws(" ", author_fname, author_lname) AS FullNameOfTheAuthor,
       count(*)
FROM books
GROUP BY FullNameOfTheAuthor;


SELECT concat_ws(" ", author_fname, author_lname) AS FullNameOfTheAuthor,
       min(released_year)
FROM books
GROUP BY FullNameOfTheAuthor;


SELECT sum(pages)
FROM books;


SELECT concat_ws(" ", author_fname, author_lname) AS FullNameOfTheAuthorToCountPages,
       sum(pages)
FROM books
GROUP BY FullNameOfTheAuthorToCountPages;


SELECT avg(released_year)
FROM books;


SELECT avg(pages)
FROM books;


SELECT author_lname,
       author_fname,
       avg(pages)
FROM books
GROUP BY author_lname,
         author_fname;


SELECT avg(stock_quantity),
       released_year,
       count(*)
FROM books
GROUP BY released_year;

-- Excercise
 -- Number of books in the table

SELECT count(book_id) AS NumOfBooksInTheDataSet
FROM books;

-- How many books were released in each released_year

SELECT count(*),
       released_year
FROM books
GROUP BY released_year;

-- Print total number of books in stock_quantity

SELECT sum(stock_quantity)
FROM books;

-- Find average released_year for each author

SELECT concat_ws(" ", author_fname, author_lname) AS FullNameOfAuth,
       avg(released_year)
FROM books
GROUP BY FullNameOfAuth;

-- Find the full name if the author that wrote the longest book

SELECT concat_ws(" ", author_fname, author_lname) AS FullNameOfAuth
FROM books
WHERE pages =
    (SELECT max(pages)
     FROM books);


SELECT released_year AS YEAR,
       count(*) AS books,
       avg(pages) AS avg_pages
FROM books
GROUP BY released_year;