create database employeeDB;

CREATE table employees (
	emp_id bigserial constraint emp_id_key PRIMARY KEY,
	first_name varchar (15),
	surname varchar (20),
	gender varchar (10),
	address varchar (30),
	email varchar (30) constraint email_key unique,
	depart_id integer references department (depart_id),
	role_id integer references roles (role_id),
	salary_id integer references salaries (salary_id),
	overtime_id integer references overtime_hours (overtime_id)
	);
	
create table department (
	depart_id smallserial constraint depart_id_key primary key,
	depart_name varchar (10),
	depart_city varchar (15)
)

create table roles (
	role_id smallserial constraint roles_id_key primary key,
	role varchar (10)
)
    
create table salaries (
	salary_id smallserial constraint salary_id_key primary key,
	salary_pa integer
)

create table overtime_hours (
	overtime_id smallserial constraint overtime_id_key primary key,
	overtime_hours integer
)

insert into employees (first_name, surname, gender, address, email, depart_id, role_id,
					  salary_id, overtime_id)
values ('Adel', 'Jones', 'female', '10 Down st.', 'ajones@mail.com', 1, 1, 3, 3),
	   ('Bob', 'Smith', 'Male', '23 Sweet St.', 'bsmaith@mail.com', 2, 4, 3, 4),
	   ('Dan', 'Brown', 'Male', '202 Jen St.', 'dbrown@mail.com', 3, 3, 4, 1),
	   ('Ellen', 'Man', 'Woman', '1 Jigger st.', 'eman@mail.com', 1, 1, 1, 2),
	   ('Frank', 'Freak', 'Man', '21 Jump St', 'ffreak@mail.com', 2, 2, 1, 4);


	   
insert into department (depart_name, depart_city)
values ('finance', 'Joburg'),
	   ('workshop', 'Durban'),
	   ('marketing', 'Cape Town');
	   
	   
insert into roles (role)
values ('accountant'),
	   ('mechanic'),
	   ('mark_manag'),
	   ('foreman');
	   
insert into salaries (salary_pa)
values (100000),
	   (150000),
	   (175000),
	   (200000);
	   
insert into overtime_hours (overtime_hours)
values (2),
	   (4),
	   (6),
	   (8);

select * from employees
select * from department	
select * from roles
select * from salaries
select * from overtime_hours
	   
	   
select employees.first_name, employees.surname, employees.gender, employees.address,
employees.email,department.depart_name, roles.role, salaries.salary_pa, 
overtime_hours.overtime_hours
from employees left join department
on employees.depart_id = department.depart_id
left join roles
on employees.role_id = roles.role_id
left join salaries
on employees.salary_id = salaries.salary_id
left join overtime_hours
on employees.overtime_id = overtime_hours.overtime_hours

