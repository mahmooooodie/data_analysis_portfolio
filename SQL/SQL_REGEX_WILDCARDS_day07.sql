CREATE TABLE employees 
(  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM employees;

CREATE TABLE companies 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

--Herbir company için company, number_of_employees ve ortalama salary değerlerini bulun.

SELECT company,number_of_employees,
(SELECT AVG(salary) from employees where companies.company = employees.company)
AS avg_salary_from_employees
FROM companies;

select company_id, company,
(select max(salary) from employees where companies.company = employees.company),
(select min(salary) from employees where companies.company = employees.company)
from companies;

-- wild cards in SQL
--1) % percentage sign wildcard: u use it when u want to filter things like _% or %_ meaning ur looking for a character before the percentage or after
-- for example if we want to see the employess that start with the letter 'E' we have to use LIKE 'E%'

SELECT name, salary FROM employees
WHERE name LIKE 'E%';

-- if we want to see employees with names ending in 'E' we have to use WHERE name LIKE '%e'

SELECT name, salary FROM employees
WHERE name LIKE '%e';

-- if we want employees who have an 'e' anywhere in their name, we have to use WHERE name LIKE '%e%'
SELECT name, salary FROM employees
WHERE name LIKE '%e%';

-- if we want names starting with 'b' and ending with 't' we have to use WHERE name LIKE 'B%t'
SELECT name, salary FROM employees
WHERE name LIKE 'B%t';

--2) The second wildcard is _ where _ chooses one character
-- if we want to see names where the 3rd character is 'a', we have to use WHERE name LIKE '__a%'
SELECT state FROM employees
WHERE state LIKE '__o%';

-- we want to see states where the second to last character is 'i'
SELECT state FROM employees
WHERE state LIKE '%i_';

-- states where the second character is 'e' and there are at least 6 characters
SELECT state FROM employees
WHERE state LIKE '_e____%';

--states where there is an 'i' anywhere after the first two characters
SELECT state FROM employees
WHERE state LIKE '__%i%';

CREATE TABLE words
( 
  word_id CHAR(10) UNIQUE,
  word VARCHAR(50) NOT NULL,
  number_of_letters SMALLINT
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);

SELECT word from words
WHERE word not like '%h%';

SELECT word from words
WHERE word not like '%f'
AND word not like '%t';

SELECT word from words
WHERE word not like '_a%'
AND word not like '_e%';


-- find words that start with 'h', second character is 'a' 'o' or 'i', and ends with 't'
-- 1st way: using LIKE
SELECT word from words
WHERE word like 'h%'
AND word like '_a%' or word like '_o%' or word like '_i%';

-- 2nd way: using REGEXP (regular expressions command) using ~
-- we have to use (.*) like % in this case
SELECT word from words
WHERE word ~ 'h[oai](.*)t';

-- words where first letter is 'h' second letter is any letter for 'a-i' and it ends with 't'
SELECT word from words
WHERE word ~ 'h[a-i](.*)t';

SELECT word FROM words
WHERE word ~ '^[s](.*)[a]$';
