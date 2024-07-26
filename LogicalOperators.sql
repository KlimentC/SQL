SELECT title
FROM books
WHERE released_year != 2004 ;


SELECT author_lname
FROM books
WHERE author_lname != 'Hugo' ;


SELECT title
FROM books
WHERE title NOT LIKE '% %';


SELECT title,
       author_lname,
       author_fname
FROM books
WHERE author_fname LIKE 'da%';


SELECT title,
       author_lname,
       author_fname
FROM books
WHERE author_fname NOT LIKE 'da%';


SELECT title
FROM books
WHERE title NOT LIKE '%e%';


SELECT *
FROM books
WHERE released_year > 2000;


SELECT *
FROM books
WHERE pages > 500;


SELECT *
FROM books
WHERE released_year < 2000
ORDER BY released_year;


SELECT *
FROM books
WHERE pages < 500;


SELECT *
FROM books
WHERE author_fname = 'Freida'
  AND released_year > 2000;


SELECT title,
       pages
FROM books
WHERE char_length(title) > 15
  AND pages > 500;


SELECT *
FROM books
WHERE author_fname = 'Freida'
  OR released_year > 2000;


SELECT title,
       released_year
FROM books
WHERE released_year<=1900
  AND released_year >= 1800;


SELECT title,
       released_year
FROM books
WHERE released_year BETWEEN 1800 AND 1900;


SELECT title,
       pages
FROM books
WHERE pages BETWEEN 500 AND 1000;


SELECT title,
       pages
FROM books
WHERE pages NOT BETWEEN 500 AND 1000;


SELECT title,
       author_lname
FROM books
WHERE author_lname = 'Lee'
  OR author_lname = 'Orwell'
  OR author_lname = 'Tolstoy';


SELECT title,
       author_lname
FROM books
WHERE author_lname IN ('Lee',
                       'Orwell',
                       'Tolstoy');


SELECT title,
       author_lname
FROM books
WHERE author_lname NOT IN ('Lee',
                           'Orwell',
                           'Tolstoy');


SELECT title,
       released_year
FROM books
WHERE released_year NOT IN(200,
                           2004,
                           2004)
  AND released_year > 2000;


SELECT title,
       released_year,
       CASE
           WHEN released_year > 2000 THEN 'modern lit'
           ELSE '20th century lit'
       END AS newCategory
FROM books;


SELECT title,
       stock_quantity,
       CASE
           WHEN stock_quantity BETWEEN 0 AND 15 THEN '*'
           WHEN stock_quantity BETWEEN 16 AND 30 THEN '***'
           WHEN stock_quantity BETWEEN 31 AND 50 THEN '****'
           ELSE '*******'
       END AS stockQuantity
FROM books;


SELECT 10 != 10;


SELECT 10 = 10;


SELECT 15 > 14
AND 99-5 <=94;


SELECT *
FROM books
WHERE released_year < 1980
ORDER BY released_year;


SELECT *
FROM books
WHERE author_lname = 'Brontë'
  OR author_lname='Tolstoy';


SELECT *
FROM books
WHERE author_lname = 'Tolstoy'
  AND released_year>'1870';


SELECT *
FROM books
WHERE pages BETWEEN 500 AND 900
ORDER BY pages;


SELECT *
FROM books
WHERE author_lname LIKE 'O%'
  OR author_lname LIKE 'T%';


SELECT *,
       CASE
           WHEN author_lname LIKE '%tolkien%' THEN 'Masterpiece'
           WHEN author_lname LIKE '%Twain%' THEN 'calssic'
           WHEN author_lname LIKE '%Big%' THEN 'Out of this World'
           ELSE 'Worth Reading'
       END AS TypeOfBook
FROM books;


SELECT author_fname,
       author_lname,
       count(*),
       CASE
           WHEN count(*) < 2 THEN'book'
           ELSE 'books'
       END
FROM books
GROUP BY author_lname,
         author_fname;