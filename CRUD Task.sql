USE testingdatabase;

SHOW TABLES;


CREATE TABLE shirts(shirt_id int PRIMARY KEY AUTO_INCREMENT,
			 article varchar(20),
             color varchar(20),
             shirt_size varchar(20),
             last_worn int);


INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
       ('t-shirt', 'green', 'S', 200),
       ('polo shirt', 'black', 'M', 10),
       ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0),
       ('polo shirt', 'red', 'M', 5),
       ('tank top', 'white', 'S', 200),
       ('tank top', 'blue', 'M', 15);


SELECT *
FROM shirts;


INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ("polo shirt", "purple", "M", 50);


SELECT article,
       color
FROM shirts;


SELECT article,
       color,
       shirt_size,
       last_worn
FROM shirts
WHERE shirt_size = "M";


SELECT *
FROM shirts
WHERE article = "polo shirt";


UPDATE shirts
SET shirt_size = "L"
WHERE article = "polo shirt";


SELECT *
FROM shirts
WHERE last_worn = 0;


UPDATE shirts
SET Last_worn = 0
WHERE last_worn = 15;


UPDATE shirts
SET color = "off white",
    shirt_size = "XS"
WHERE color="white";


DELETE
FROM shirts
WHERE last_worn > 199;


DELETE
FROM shirts
WHERE article="tank top";


DELETE
FROM shirts;


DROP TABLE shirts;