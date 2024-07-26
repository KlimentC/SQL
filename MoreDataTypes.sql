CREATE TABLE friends (name varchar(10));


INSERT INTO friends (name)
VALUES ("tom"),
       ("juan pablo"),
       ("james");


SELECT *
FROM friends;


CREATE TABLE states(abbr CHAR(2));


INSERT INTO states(abbr)
VALUES ("CA"),
       ("NY");


INSERT INTO states(abbr)
VALUES ('M');


SELECT *
FROM states;


SELECT char_length(abbr)
FROM states;


CREATE TABLE parent(children Tinyint);


INSERT INTO parent(children)
VALUES (2),
       (7),
       (0);


CREATE TABLE products (price DECIMAL(5, 2));


INSERT INTO products(price)
VALUES(4.50);


INSERT INTO products(price)
VALUES (456.99);


INSERT INTO products(price)
VALUES (411.099);


SELECT *
FROM products;


CREATE TABLE numbers (x float, y DOUBLE);


INSERT INTO numbers(x, y)
VALUES (1.123, 1.123);


INSERT INTO numbers(x, y)
VALUES (1.12345678, 1.12345678);


SELECT *
FROM numbers;


CREATE TABLE people(name varchar(20),
                         birthdate date, birthtime TIME,
                                                   birthdt DAtetime);


INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Elton", '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

DESC people;


INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Lulu", '1985-04-11', '9:45:10', '1985-04-11 9:45:10');


INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Juan", '2020-08-15', '23:59:00', '2020-08-15 23:59:00');


INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES("Hazel", curdate(), curtime(), now());


SELECT birthdate
FROM people;


SELECT *
FROM people;


SELECT birthdate,
       DAY(birthdate),
       DAYOFWEEK(birthdate),
       DAYOFYEAR(birthdate),
       monthname(birthdate)
FROM people;


SELECT name,
       birthtime,
       HOUR(birthtime),
       MINUte(birthtime),
       second(birthtime)
FROM people;


SELECT Concat_ws(" ", monthname(birthdate), day(birthdate), year(birthdate)) AS NewFormat
FROM people;


SELECT birthdate,
       date_format(birthdate, '%a %b %c %M %e %D')
FROM people;


SELECT birthdt,
       date_format(birthdt, '%H:%i')
FROM people;


SELECT birthdt,
       date_format(birthdt, '%r')
FROM people;


SELECT birthdate,
       DateDiff(curdate(), birthdate)
FROM people;


SELECT date_add(curdate(), INTERVAL 1 YEAR);


SELECT date_add(curdate(), INTERVAL 1 DAY);


SELECT date_sub(curdate(), INTERVAL 1 DAY);


SELECT birthdate
FROM people;


SELECT timediff(curtime(), '08:00:00');


CREATE TABLE captions(text varchar(20),
                           created_at timestamp DEFAULT CURRENT_TIMESTAMP);


INSERT INTO captions(text)
VALUES("Just me and the SQL");


INSERT INTO captions(text)
VALUES("Time to party");


SELECT *
FROM captions;


CREATE TABLE captions2
  (text varchar(20),
        created_at timestamp DEFAULT CURRENT_TIMESTAMP,
                                     updated_at timestamp ON UPDATE CURRENT_TIMESTAMP);


INSERT INTO captions2 (text)
VALUES ("I love adventure");


UPDATE captions2
SET text="I love diving";


SELECT *
FROM captions2;


CREATE TABLE inventory (item_name varchar(20),
                                  price DECIMAL(7, 2),
                                        quantity int);


SELECT curtime();


SELECT curdate();


SELECT DAYOFWEEK(curdate());


SELECT dayname(now());


SELECT date_format(NOW(), '%D');


SELECT date_format(curdate(), "%m/%d/%Y");


CREATE TABLE tweets (content varchar(180),
                             username varchar(20),
                                      created_at timestamp DEFAULT CURRENT_TIMESTAMP);


INSERT INTO tweets (content, username)
VALUES("What is this", "David");


SELECT *
FROM tweets;
