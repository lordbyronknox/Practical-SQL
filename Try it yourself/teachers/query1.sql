select * from teachers

select school, first_name, last_name
from teachers
order by school asc, last_name asc;

select first_name, salary
from teachers
where first_name ilike 'S%' and salary > 40000;

select first_name, last_name, salary, hire_date
from teachers
where hire_date > '2010-01-01'
order by salary desc;