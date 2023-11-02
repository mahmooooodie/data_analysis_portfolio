SELECT name from employees
group by state;

SELECT * from employees;

Select state, MAX(salary) AS max_salary_per_state
from employees
group by state
having MAX(salary)<3000
Order by max_salary_per_state ASC;

SELECT * from employees order by salary desc limit 3; 

--Limit keyword; limit is used with ORDER BY and it shows how much data you want to view from the top