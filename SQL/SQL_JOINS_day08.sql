select* from employees

-- union is used to join and return two or more fields into one field in a select command
-- union only returns unique fields, so there would be no repetition in the result


select state as state_name_of_employee, salary
from employees
where salary > 3000

UNION

Select name as state_name_of_employee, salary
from employees
where salary < 2000;

-- the UNION ALL operator is used to return repetition as well

select state as state_name_of_employee, salary
from employees
where salary > 3000

UNION ALL

Select name as state_name_of_employee, salary
from employees
where salary < 2000;

--INTERSECT operator is used to return the result of intersecting data between two queries

select name as intersect_name, salary
from employees
where salary > 1000
INTERSECT
select name as intersect_name, salary
from employees
where salary < 2000


select name
from employees
where salary > 2000

INTERSECT

select name
from employees
where company in ('IBM','GOOGLE','APPLE');

-- EXCEPT operator is used to find everything except specified query

select name, company
from employees
where salary < 3000
EXCEPT
select name, company
from employees
where company = 'GOOGLE';

--JOIN Operators
--1) INNER JOIN: returns common data from 2 tables
--2) LEFT JOIN: returns all data from first table plus common data between 2 tables
--3) RIGHT JOIN: returns all data from second table plus common data between 2 tables
--4) FULL JOIN: returns all data from both tables
--5) SELF JOIN: returns a single table that will be used as 2 tables

CREATE TABLE my_companies 
(  
  company_id CHAR(3), 
  company_name VARCHAR(20)
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');

SELECT * FROM my_companies;

CREATE TABLE orders 
(  
  company_id CHAR(3),   
  order_id CHAR(3),
  order_date DATE
);

INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');

SELECT * FROM orders;

select mc.company_name, o.order_id, o.order_date
from my_companies mc INNER JOIN orders o
ON mc.company_id = o.company_id;

select mc.company_name, o.order_id, o.order_date
from my_companies mc LEFT JOIN orders o
ON mc.company_id = o.company_id;

select mc.company_name, o.order_id, o.order_date
from my_companies mc RIGHT JOIN orders o
ON mc.company_id = o.company_id;

select mc.company_name, o.order_id, o.order_date
from my_companies mc FULL JOIN orders o
ON mc.company_id = o.company_id;

select mc.company_name, o.order_id, o.order_date
from my_companies mc SELF JOIN orders o
ON mc.company_id = o.company_id;

--SELF JOIN:Returns the common data from the table itself

CREATE TABLE workers1 
(  
  id CHAR(2), 
  name VARCHAR(20),
  title VARCHAR(60),
  manager_id CHAR(2) 
);

INSERT INTO workers1 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers1 VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers1 VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers1 VALUES(4, 'Amy Sky', 'CEO', 5);

SELECT * FROM workers1;


SELECT w1.name AS Employee, w2.name AS Manager
FROM workers1 w1 INNER JOIN workers1 w2
ON w1.manager_id = w2.id