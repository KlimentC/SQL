create database Learn;

use Learn;


CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

select *
from employees;

select department,avg(salary)
from employees
group by department;

select avg(salary)
from employees;

select emp_no,department,salary,avg(salary) over()
from employees;

select 
emp_no,
department,
salary,
min(salary) over(), 
max(salary) over(),
avg(salary) over()
from employees;


select
emp_no,
department,
salary,
avg(salary) over (partition by department) as dept_avg
from employees;

select emp_no,
department,
salary,
avg(salary) over (partition by department) as department_avg,
avg(salary) over () as company_avg
from employees
order by emp_no;


select 
emp_no, 
department,salary, 
count(*) over(partition by department) as CountPerDepartment
from employees;

select 
emp_no, 
department,salary, 
sum(salary) over(partition by department) as CountPerDepartment,
sum(salary) over() as TotalPayroll
from employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

SELECT
emp_no,
department,
salary,
min(salary) over(PARTITION by department ORDER by salary) as rolling_min
FROM
employees;

SELECT
emp_no,
department,
salary,
RANK() OVER(order by salary desc) as overall_salary_rank
from employees;

SELECT
emp_no,
department,
salary,
RANK() OVER(partition by department ORDER by salary desc) as department_salary_rank,
RANK() OVER(order by salary desc) as overall_salary_rank
from employees
order by department;


SELECT
emp_no,
department,
salary,
ROW_NUMBER() OVER(partition by department ORDER by salary desc) as department_salary_rank_row,
RANK() OVER(partition by department ORDER by salary desc) as department_salary_rank,
RANK() OVER(order by salary desc) as overall_salary_rank,
DENSE_RANK() OVER(order by salary desc) as dense_overall_salary_rank
from employees
order by department;



select
emp_no,
department,
salary,
NTILE(4) over(order by salary desc) as salary_quart
from employees;

select
emp_no,
department,
salary,
NTILE(10) over(order by salary desc) as salary_quart
from employees;


select
emp_no,
department,
salary,
NTILE(4) over(partition by department order by salary desc) as department_salary_quart
from employees;



-- gets the highest payed emp
select
emp_no,
department,
salary,
first_value(emp_no) over (order by salary desc) as first_value_column
from employees;


select
emp_no,
department,
salary,
first_value(emp_no) over (partition by department order by salary desc) as first_value_column_in_department,
first_value(emp_no) over (order by salary desc) as first_value_column
from employees;

