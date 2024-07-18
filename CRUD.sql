USE pet_shop;

SHOW TABLES;


DROP TABLE cats;


CREATE TABLE cats (cat_id INT AUTO_INCREMENT,
                              name VARCHAR(100),
                                   breed VARCHAR(100),
                                         age INT, PRIMARY KEY (cat_id));

DESC cats;


INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);


SELECT *
FROM cats;


SELECT name
FROM cats;


SELECT age
FROM cats;


SELECT name,
       age,
       cat_id
FROM cats;


SELECT name,
       age,
       cat_id
FROM cats
WHERE age > 5;


SELECT *
FROM cats
WHERE age = 4;


SELECT cat_id
FROM cats;


SELECT name,
       breed
FROM cats;


SELECT name,
       age
FROM cats
WHERE breed = "Tabby";


SELECT cat_id AS whatever_id,
       age
FROM cats
WHERE cat_id = age;


SELECT name AS kittyName
FROM cats;


SET SQL_SAFE_UPDATES = 0;


UPDATE CATS
SET breed = "Shorthair"
WHERE breed = 'Tabby';


UPDATE cats
SET age = 13
WHERE name = 'Mist';


SELECT *
FROM cats
WHERE name = "Jackson";


UPDATE cats
SET name = "Jack"
WHERE name = "Jackson";


UPDATE cats
SET breed = "British Shorthair"
WHERE name = "Ringo";


UPDATE cats
SET age = 12
WHERE breed = "Maine Coon";


DELETE
FROM cats
WHERE cat_id > 8;


DELETE
FROM cats
WHERE name = "Egg";


DELETE
FROM cats
WHERE age = cat_id;


SELECT *
FROM cats;


DELETE
FROM cats
WHERE age = 4;


DROP TABLE cats;