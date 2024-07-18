create table cats (
  name varchar(50), 
  age int
);
use pet_shop;
desc cats;
INSERT INTO cats (name, age) VALUE ("Blue stelle", 5);
INSERT INTO cats (name, age) VALUE ("Jenkins", 7);
select 
  * 
from 
  cats;
INSERT into cats (name) value ("Tode");
INSERT INTO cats (name, age) 
VALUES 
  ("Jenkins", 7), 
  ("Beth", 2), 
  ("Meatball", 2), 
  ("Potato Face", 1);
create table cats2 (
  name varchar(20) NOT NULL, 
  age INT NOT NULL
);
desc cats2;
create table cats3 (
  name varchar(20) DEFAULT "No Name", 
  age int default 99
);
insert into cats3 (name) 
values 
  ("Gary");
insert into cats3 (age) 
values 
  (1);
select 
  * 
from 
  cats3;
create table cats4 (
  name varchar(20) NOT NULL default "NoNameHere", 
  age int NOT NULL default -1
);
desc cats4;
Insert into cats4 () 
Values 
  ();
select 
  * 
from 
  cats4;
create table uniqueCats (
  cat_id INT not null PRIMARY KEY, 
  name varchar(10), 
  age int
);
desc uniqueCats;
INSERT into uniqueCats(cat_id, name, age) value (1, "Bongo", 3);
INSERT into uniqueCats(cat_id, name, age) value (1, "Margo", 3);
select 
  * 
from 
  uniqueCats;
create table uniqueCats2 (
  cat_id INT not null PRIMARY KEY AUTO_INCREMENT, 
  name varchar(10), 
  age int
);
insert into uniqueCats2 (name, age) 
values 
  ("WhiteCat", 8), 
  ("Biggy", 3);
select 
  * 
from 
  uniqueCats2;
desc uniqueCats2;
create database TestingDatabase;
use testingdatabase;
create table people (
  first_name varchar(20), 
  last_name varchar(20), 
  age int
);
INSERT INTO people (first_name, last_name, age) 
VALUES 
  ("Stavre", "Stavreski", 40), 
  ("Petko", "Petkoski", 40), 
  ("Jane", "Osogovski", 23);
select 
  * 
from 
  people;
use testingdatabase;
create table Employees(
  id int primary key auto_increment, 
  last_name varchar(15) NOT NULL, 
  first_name varchar(15) NOT NULL, 
  middle_name varchar(15), 
  age int NOT NULL, 
  current_status varchar(15) NOT NULL Default "employed"
);
desc Employees;
INSERT INTO Employees(first_name, last_name, age) 
values 
  ("Stavre", "Stavre", 30);
select 
  * 
from 
  Employees;
show tables;
