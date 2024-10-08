CREATE TABLE reviewers (id int PRIMARY KEY AUTO_INCREMENT,
                                           first_name varchar(15) NOT NULL,
                                                                  last_name varchar(15) NOT NULL);


CREATE TABLE series (id int PRIMARY KEY AUTO_INCREMENT,
                                        title varchar(60),
                                              released_year YEAR,
                                                            genre varchar(20));


CREATE TABLE reviews (id int PRIMARY KEY AUTO_INCREMENT,
                                         rating double(4, 2),
                                                series_id int, reviewer_id int,
                      FOREIGN KEY (series_id) REFERENCES series(id),
                      FOREIGN KEY (reviewer_id) REFERENCES reviewers(id));


INSERT INTO series (title, released_year, genre)
VALUES ('Archer', 2009, 'Animation'),
       ('Arrested Development', 2003, 'Comedy'),
       ("Bob's Burgers", 2011, 'Animation'),
       ('Bojack Horseman', 2014, 'Animation'),
       ("Breaking Bad", 2008, 'Drama'),
       ('Curb Your Enthusiasm', 2000, 'Comedy'),
       ("Fargo", 2014, 'Drama'),
       ('Freaks and Geeks', 1999, 'Comedy'),
       ('General Hospital', 1963, 'Drama'),
       ('Halt and Catch Fire', 2014, 'Drama'),
       ('Malcolm In The Middle', 2000, 'Comedy'),
       ('Pushing Daisies', 2007, 'Comedy'),
       ('Seinfeld', 1989, 'Comedy'),
       ('Stranger Things', 2016, 'Drama');


INSERT INTO reviewers (first_name, last_name)
VALUES ('Thomas', 'Stoneman'),
       ('Wyatt', 'Skaggs'),
       ('Kimbra', 'Masters'),
       ('Domingo', 'Cortes'),
       ('Colt', 'Steele'),
       ('Pinkie', 'Petit'),
       ('Marlon', 'Crafford');


INSERT INTO reviews(series_id, reviewer_id, rating)
VALUES (1,1,8.0),
       (1,2,7.5),
       (1,3,8.5),
       (1,4,7.7),
       (1,5,8.9),
       (2,1,8.1),
       (2,4,6.0),
       (2,3,8.0),
       (2,6,8.4),
       (2,5,9.9),
       (3,1,7.0),
       (3,6,7.5),
       (3,4,8.0),
       (3,3,7.1),
       (3,5,8.0),
       (4,1,7.5),
       (4,3,7.8),
       (4,4,8.3),
       (4,2,7.6),
       (4,5,8.5),
       (5,1,9.5),
       (5,3,9.0),
       (5,4,9.1),
       (5,2,9.3),
       (5,5,9.9),
       (6,2,6.5),
       (6,3,7.8),
       (6,4,8.8),
       (6,2,8.4),
       (6,5,9.1),
       (7,2,9.1),
       (7,5,9.7),
       (8,4,8.5),
       (8,2,7.8),
       (8,6,8.8),
       (8,5,9.3),
       (9,2,5.5),
       (9,3,6.8),
       (9,4,5.8),
       (9,6,4.3),
       (9,5,4.5),
       (10,5,9.9),
       (13,3,8.0),
       (13,4,7.2),
       (14,2,8.5),
       (14,3,8.9),
       (14,4,8.9);


CREATE VIEW full_reviews AS
SELECT title,
       released_year,
       genre,
       rating,
       first_name,
       last_name
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;


SELECT *
FROM full_reviews
WHERE genre = 'Animation';


SELECT genre,
       avg(rating)
FROM full_reviews
GROUP BY genre;

-- The next line it will not work since of the rules of join view
-- delete from full_reviews where released_year = 2010

CREATE VIEW ordered_series AS
SELECT *
FROM series
ORDER BY released_year;

-- this work since it is permitted by the rules

INSERT INTO ordered_series (title, released_year, genre)
VALUES ("The Great", 2020, 'Comedy');


SELECT *
FROM ordered_series;


DELETE
FROM ordered_series
WHERE title = "The Great";


SELECT *
FROM ordered_series;


CREATE OR REPLACE VIEW ordered_series AS
SELECT *
FROM series
ORDER BY released_year DESC;


SELECT *
FROM ordered_series;

-- droping the view, this does not delete the series TABLE
-- drop view ordered_series;

SELECT *
FROM full_reviews;


SELECT title,
       avg(rating) AS RatingOfTheShow,
       COUNT(rating) AS review_count
FROM full_reviews
GROUP BY title
ORDER BY avg(rating);


SELECT title,
       avg(rating),
       COUNT(rating) AS review_count
FROM full_reviews
GROUP BY title
HAVING count(rating) > 1
ORDER BY avg(rating);


SELECT title,
       avg(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;


SELECT title,
       count(rating)
FROM full_reviews
GROUP BY title WITH ROLLUP;


SELECT released_year, genre,avg(rating)
from full_reviews
GROUP by released_year, genre with ROLLUP;


SELECT @@GLOBAL.sql_mode;

SELECT @@Session.sql_mode;

SELECT 3/0;

show warnings;

set Session sql_mode='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';

SELECT 3/0;

show warnings;

-- STRICT_TRANS_TABLES when this is off you can even put string inwhere integer needs to be withouth any error and the transaction will be work






