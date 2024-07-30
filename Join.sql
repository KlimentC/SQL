CREATE TABLE customers (id int AUTO_INCREMENT PRIMARY KEY,
                                              first_name varchar(30),
                                                         last_name varchar(30),
                                                                   email varchar(30));


CREATE TABLE orders
  (id int AUTO_INCREMENT PRIMARY KEY,
                         order_date date, amount decimal(8, 2),
                                                 customer_id int,
   FOREIGN key(customer_id) REFERENCES customers(id) ON DELETE CASCADE);


INSERT INTO customers (first_name, last_name, email)
VALUES ('John', 'Doe', 'john.doe@example.com'),
       ('Jane', 'Smith', 'jane.smith@example.com'),
       ('Alice', 'Johnson', 'alice.johnson@example.com'),
       ('Bob', 'Brown', 'bob.brown@example.com'),
       ('Charlie', 'Davis', 'charlie.davis@example.com'),
       ('Diana', 'Miller', 'diana.miller@example.com'),
       ('Eva', 'Wilson', 'eva.wilson@example.com'),
       ('Frank', 'Moore', 'frank.moore@example.com'),
       ('Grace', 'Taylor', 'grace.taylor@example.com'),
       ('Henry', 'Anderson', 'henry.anderson@example.com'),
       ('David', 'Bow', 'David.Bow@example.com'),
       ('Christina', 'Right', 'Christina.Right@example.com');


INSERT INTO orders (order_date, amount, customer_id)
VALUES -- Multiple orders for customer_id = 1 (John Doe)
('2024-07-01', 150.75, 1),
                                                        ('2024-07-15', 50.00, 1),
                                                        -- Multiple orders for customer_id = 2 (Jane Smith)
('2024-07-02', 200.50, 2),
                                                                                                           ('2024-07-18', 80.00, 2),
                                                                                                           -- Multiple orders for customer_id = 3 (Alice Johnson)
('2024-07-03', 75.00, 3),
                                                                                                                                                                 ('2024-07-12', 120.00, 3),
                                                                                                                                                                 -- Multiple orders for customer_id = 4 (Bob Brown)
('2024-07-04', 120.25, 4),
                                                                                                                                                                                                                   ('2024-07-20', 200.00, 4),
                                                                                                                                                                                                                   -- Single orders for other customers
('2024-07-05', 80.00, 5),
                                                                                                                                                                                                                                                       ('2024-07-06', 95.30, 6),
                                                                                                                                                                                                                                                       ('2024-07-07', 110.00, 7),
                                                                                                                                                                                                                                                       ('2024-07-08', 145.60, 8),
                                                                                                                                                                                                                                                       ('2024-07-09', 99.99, 9),
                                                                                                                                                                                                                                                       ('2024-07-10', 250.00, 10);


SELECT *
FROM customers;


SELECT *
FROM orders;

-- select *
-- from orders
-- where customer_id = (select id from customers where first_name="John");
 -- select count(*) AS Number_Of_Orders
-- from orders
-- where customer_id = (select id from customers where first_name="John");
 -- Inner Join

SELECT *
FROM customers
JOIN orders ON orders.customer_id = customers.id;


SELECT first_name,
       last_name,
       order_date,
       amount
FROM customers
JOIN orders ON orders.customer_id = customers.id;


SELECT *
FROM orders
JOIN customers ON customers.id = orders.customer_id;


SELECT first_name,
       last_name,
       SUM(amount) AS total
FROM customers
JOIN orders ON orders.customer_id=customers.id
GROUP BY first_name,
         last_name
ORDER BY total;

-- Left JOIN
 -- tells us who has not placed orders at all

SELECT first_name,
       last_name,
       order_date,
       amount AS somethingAmount
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

-- ifnull function shown

SELECT first_name,
       last_name,
       ifnull(sum(amount), 0)
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name,
         last_name;


DELETE
FROM customers
WHERE last_name="Doe";


CREATE TABLE students(id int PRIMARY KEY AUTO_INCREMENT,
                                         first_name varchar(15));


CREATE TABLE paper
  (title varchar(50),
         grade int, student_id int,
   FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE);


INSERT INTO students (first_name)
VALUES ('Caleb'),
       ('Samantha'),
       ('Raj'),
       ('Carlos'),
       ('Lisa');


INSERT INTO paper (student_id, title, grade)
VALUES (1, 'My First Book Report', 60),
       (1, 'My Second Book Report', 75),
       (2, 'Russian Lit Through The Ages', 94),
       (2, 'De Montaigne and The Art of The Essay', 98),
       (4, 'Borges and Magical Realism', 89);


SELECT *
FROM students;


SELECT *
FROM paper;


SELECT first_name,
       title,
       grade
FROM students
JOIN paper ON paper.student_id = students.id
ORDER BY grade;


SELECT first_name,
       title,
       grade AS GRADE
FROM students
LEFT JOIN paper ON paper.student_id = students.id;


SELECT first_name,
       ifnull(title, 'Missing'),
       ifnull(grade, 0)
FROM students
LEFT JOIN paper ON paper.student_id = students.id;


SELECT first_name,
       ifnull(avg(grade), 0)
FROM students
LEFT JOIN paper ON paper.student_id = students.id
GROUP BY first_name
ORDER BY avg(grade) DESC;


SELECT first_name,
       ifnull(avg(grade), 0),
       CASE
           WHEN (avg(grade) > 90) THEN "PASSING"
           ELSE "FALLING"
       END AS passing_status
FROM students
LEFT JOIN paper ON paper.student_id = students.id
GROUP BY first_name
ORDER BY avg(grade) DESC;