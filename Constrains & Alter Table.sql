CREATE TABLE contacts(name varchar(100) NOT NULL,
                                        phone varchar(15) NOT NULL UNIQUE);


INSERT INTO contacts(name, phone)
VALUES('BillyBob', '456456123'),
      ('James', '123458852');

-- Duplicate and it is not working due to the constraint
-- INSERT INTo contacts(name, phone)
-- VALUES ('John', '456456123');

SELECT *
FROM contacts;


CREATE TABLE partiers(name varchar(30),
                           age INT CHECK (age >= 18));


INSERT INTO partiers(name, age)
VALUES ("Tom", 23),
       ("Timmy", 21),
       ("SomeName", 29),
       ("Jaguar", 18),
       ("Lion", 19),
       ("Stavre", 20);

-- Not working because of constraint
-- insert into partiers(name, age)
-- VALUES  ("Jack", 17);

SELECT *
FROM partiers;


CREATE TABLE palindromes(word varchar(18) check(REVERSE(word)=word));


INSERT INTO palindromes(word)
VALUES('racecar');

-- Not working because of constraint
-- insert into palindromes(word)
-- VALUES ('ABBAA');

SELECT *
FROM palindromes;


CREATE TABLE partiers2(name varchar(20) NOT NULL,
                                        age INT, CONSTRAINT age_over_18 CHECK (age>=18));


INSERT INTO partiers2(name, age)
VALUES ("CTom", 23),
       ("CTimmy", 21),
       ("CSomeName", 29),
       ("CJaguar", 18),
       ("CLion", 19),
       ("CStavre", 20);

-- Error appears now with the namedConstrain
-- insert into partiers2(name, age)
-- VALUES ('FakeName', 3);

SELECT *
FROM partiers2;


CREATE TABLE palindromes2(word varchar(18),
                               CONSTRAINT Check_If_It_Is_Palindrome check(REVERSE(word)=word));


INSERT INTO palindromes2(word)
VALUES ("ABBA");

-- Error appears now with the namedConstrain
-- insert into palindromes2(word)
-- VALUES ("ABBAA");

SELECT *
FROM palindromes2;


CREATE TABLE companies (supplier_id INT PRIMARY KEY AUTO_INCREMENT,
                                                    name varchar(50) NOT NULL,
                                                                     phone varchar(15) NOT NULL UNIQUE,
                                                                                                address varchar(50) NOT NULL,
                                                                                                                    CONSTRAINT name_address_unique UNIQUE (name,
                                                                                                                                                           address));


INSERT INTO companies (name, phone, address)
VALUES ('Company A', '123-456-7890', '123 Elm St'),
       ('Company B', '234-567-8901', '456 Oak St'),
       ('Company C', '345-678-9012', '789 Pine St'),
       ('Company D', '456-789-0123', '101 Maple St'),
       ('Company E', '567-890-1234', '202 Birch St'),
       ('Company F', '678-901-2345', '303 Cedar St'),
       ('Company G', '789-012-3456', '404 Walnut St'),
       ('Company H', '890-123-4567', '505 Spruce St'),
       ('Company I', '901-234-5678', '606 Fir St'),
       ('Company J', '012-345-6789', '707 Ash St');

-- This will work

INSERT INTO companies (name, phone, address)
VALUES ('Company A', '22230', '3/4 Train');

-- This will not work because of the contraint
-- INSERT INTO companies (name, phone, address) VALUES
-- ('Company A', '88888', '3/4 Train');

ALTER TABLE companies ADD COLUMN city varchar(15) NOT NULL DEFAULT 'NotNull';


ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL;

-- alter table companies
-- drop column city;

ALTER TABLE companies
DROP COLUMN employee_count;

RENAME TABLE companies TO suppliers;


ALTER TABLE suppliers RENAME COLUMN city TO LOCATION;


ALTER TABLE suppliers MODIFY address varchar(75);

DESC suppliers;


SELECT *
FROM suppliers;


CREATE TABLE houses(purchase_price INT NOT NULL,
                                       sale_price INT NOT NULL,
                                                      CONSTRAINT salePrice_check check(sale_price >= purchase_price));


INSERT INTO houses(purchase_price, sale_price)
VALUES (100,200);


SELECT *
FROM houses;

DESC houses;


ALTER TABLE houses ADD CONSTRAINT postive_price CHECK (purchase_price >=0);

-- It will not work since purchase price is negative
-- INSERT into houses(purchase_price, sale_price)
-- VALUES(-20, -40);
