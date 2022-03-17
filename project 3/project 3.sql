select * from my_contacts;

-- 1

SELECT contact_id, COUNT(contact_id)
FROM my_contacts
GROUP BY contact_id
HAVING COUNT(contact_id) > 1
ORDER BY contact_id;
-- no duplicates found


-- 2

DELETE FROM my_contacts
WHERE contact_id IN
(SELECT contact_id
FROM
(SELECT contact_id,
ROW_NUMBER() OVER(PARTITION BY contact_id
ORDER BY contact_id) AS row_num
FROM my_contacts) t
WHERE t.row_num > 1);


-- 3

create table my_contacts ( 
	contact_id bigserial constraint contact_id_key PRIMARY KEY,
	last_name varchar(20) NOT NULL,
    first_name varchar(20) NOT NULL,
    phone integer NOT NULL,
    email varchar(40) NOT NULL constraint email_constraint unique,
    gender varchar(10) NOT NULL, 
    birthday date NOT NULL,
    prof_id integer NOT NULL references profession (prof_id),
    postal_code varchar(4) NOT NULL references postal_code (postal_code),
    status_id integer NOT NULL references status (status_id)
);

create table profession (
	prof_id bigserial constraint prof_id_key primary key,
	profession varchar (30) constraint profession_key unique
);

create table postal_code (
	postal_code varchar (4) constraint postal_code_key primary key,
	city varchar (20),
	province varchar (20)
);

create table status (
	status_id bigserial constraint status_id_key primary key,
	status varchar (10)
);

create table contact_interest (
	contact_id integer references my_contacts (contact_id),
	interest_id integer references interests (interest_id)
);

create table contact_seeking (
	contact_id integer references my_contacts (contact_id),
	seeking_id integer references seeking (seeking_id)
);

create table interests (
	interest_id bigserial constraint interest_id_key primary key,
	interest varchar (50) constraint interest_key unique
);

create table seeking (
	seeking_id bigserial constraint seeking_id_key primary key,
	seeking varchar (20)
)




-- 4

insert into profession (profession)
values ('accountant'),
	   ('plumber'),
	   ('consultant'),
	   ('janitor'),
	   ('actor'),
	   ('lumberjack');
	   
insert into postal_code (postal_code, city, province)
values ('1459', 'gauteng', 'boksburg'),
	   ('1460', 'gauteng', 'benoni'),
	   ('2078', 'eastern cape', 'east london'),
	   ('2098', 'eastern cape', 'qonce'),
	   ('1324', 'free state', 'bloemfontein'),
	   ('1340', 'free state', 'virginia'),
	   ('2020', 'KwaZulu-Natal', 'durban'),
	   ('2030', 'KwaZulu-Natal', 'newcastle'),
	   ('3214', 'Limpopo', 'polokwane'),
	   ('3230', 'Limpopo', 'tzaneen'),
	   ('4351', 'Mpumalanga', 'belfast'),
	   ('4370', 'Mpumalanga', 'barberton'),
	   ('1243', 'Northern Cape', 'kimberly'),
	   ('1249', 'Northern Cape', 'kuruman'),
	   ('7424', 'North West', 'vryberg'),
	   ('7494', 'North West', 'brits');
	   
insert into status (status)
values ('married'),
	   ('single');
   
	   
insert into interests (interest)
values ('Fishing'),
	   ('Running'),
	   ('Coffee'),
	   ('Jazz'),
	   ('Live concerts'),
	   ('Cars'),
	   ('Football'),
	   ('Gardening'),
	   ('Photography'),
	   ('Nutrician'),
	   ('Fitness'),
	   ('Charity work');
	   
	   
insert into seeking (seeking)
values ('Relationship'),
	   ('Fling'),
	   ('Friend'),
	   ('Romance'),
	   ('Sex'),
	   ('Drinking buddy');
	   
	   
insert into my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id,
    postal_code, status_id)
values ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', 3, 1460, 1),
	   ('jones', 'Jim', 0831200000, 'jjones@mail.com', 'male', '1977-11-11', 2, 1324, 1),
	   ('Edwards', 'ben', 0831200001, 'bedwards@mail.com', 'male', '1969-12-23', 1, 2020, 2),
	   ('Vedder', 'Edna', 0831200002, 'evedder@mail.com', 'female', '1978-01-16', 4, 1340, 1),
	   ('Mags', 'Sherley', 0831200003, 'smags@mail.com', 'female', '1997-09-11', 6, 2098, 1),
	   ('Tully', 'Jerremy', 0831200004, 'jtully@mail.com', 'male', '2000-07-13', 5, 7494, 2),
	   ('Baxter', 'Sally', 0831200005, 'sbaxter@mail.com', 'female', '1999-10-19', 1, 1249, 1),
	   ('Abby', 'Mike', 0831200006, 'mabby@mail.com', 'male', '2002-06-09', 3, 4351, 1),
	   ('Jabb', 'Nathan', 0831200007, 'njabb@mail.com', 'male', '2002-06-09', 6, 3214, 1),
	   ('Lexington', 'Nigel', 0831200008, 'nlexton@mail.com', 'male', '2002-06-09', 1, 7424, 2),
	   ('Scott', 'Sean', 0831200009, 'sscott@mail.com', 'male', '2002-06-09', 4, 1243, 1),
	   ('Wright', 'Leigh', 0831200010, 'lwright@mail.com', 'female', '2002-06-09', 1, 2078, 1),
	   ('Mills', 'Dana', 0831200011, 'dmills@mail.com', 'female', '2002-06-09', 3, 2098, 1),
	   ('Westcot', 'Ben', 0831200012, 'bwestcot@mail.com', 'male', '2002-06-09', 5, 1460, 2),
	   ('Rakes', 'Kelly', 0831200013, 'krakes@mail.com', 'female', '2002-06-09', 2, 1340, 1),
	   ('Bates', 'Cathy', 083120014, 'cbates@mail.com', 'female', '1968-10-17', 6, 2020, 1);


insert into contact_interest (contact_id, interest_id)
values (17, 1),
	   (17, 2),
	   (17, 3),
	   (18, 2),
	   (18, 1),
	   (18, 6),
	   (19, 3),
	   (19, 10),
	   (19, 8),
	   (20, 4),
	   (20, 1),
	   (20, 5),
	   (20, 12),
	   (20, 11),
	   (21, 5),
	   (21, 9),
	   (21, 3),
	   (21, 6),
	   (22, 6),
	   (22, 11),
	   (22, 5),
	   (23, 7),
	   (23, 2),
	   (23, 8),
	   (24, 8),
	   (24, 12),
	   (24, 4),
	   (25, 9),
	   (25, 7),
	   (25, 10),
	   (26, 1),
	   (26, 10),
	   (26, 11),
	   (27, 9),
	   (27, 6),
	   (27, 5),
	   (28, 2),
	   (28, 12),
	   (28, 10),
	   (29, 9),
	   (29, 3),
	   (29, 11),
	   (30, 6),
	   (30, 12),
	   (30, 2),
	   (31, 5),
	   (31, 4),
	   (31, 3),
	   (32, 4),
	   (32, 8),
	   (32, 9);
	   
insert into contact_seeking (contact_id, seeking_id)
values (17, 1),
	   (18, 2),
	   (19, 3),
	   (20, 4),
	   (21, 6),
	   (22, 5),
	   (23, 4),
	   (24, 1),
	   (25, 2),
	   (26, 6),
	   (27, 5),
	   (28, 2),
	   (29, 2),
	   (30, 3),
	   (31, 5),
	   (32, 6);
	   


-- 5

WITH RECURSIVE cohort AS (
SELECT contact_id, prof_id, concat(first_name, ' ', last_name) AS full_name
FROM my_contacts
WHERE prof_id = 2
UNION
SELECT e.contact_id, e.prof_id, e.first_name
FROM my_contacts e
INNER JOIN cohort s ON s.contact_id = e.prof_id)
SELECT * FROM cohort;


-- 6

SELECT * 
FROM my_contacts
ORDER BY contact_id
FETCH FIRST ROW ONLY;


-- 7

SELECT my_contacts.contact_id, my_contacts.first_name, profession.profession
FROM my_contacts INNER JOIN profession 
ON my_contacts.prof_id = profession.prof_id
WHERE profession.prof_id = 3
ORDER BY my_contacts.contact_id;


-- 8

SELECT
s1.first_name,
s2.first_name,
s1.proffession
FROM my_contacts s1 INNER JOIN profession s2 
ON s1.contact_id <> s2.contact_id	 
AND s1.prof_id = s2.prof_id			 
--'profession' table does not have contact_id but i added (hypothetically)
-- it to this query for the sake of the example.


-- 9

SELECT first_name, city
FROM my_contacts e FULL OUTER JOIN postal_code d 
ON d.postal_code = e.postal_code;


-- 10

SELECT e.postal_code, city
FROM postal_code e FULL OUTER JOIN my_contacts d 
ON e.postal_code = d.postal_code
WHERE d.postal_code IS NULL;


-- 11

SELECT
postal_code.postal_code,
postal_code.city,
postal_code.province,
my_contacts.postal_code
FROM postal_code LEFT JOIN my_contacts 
ON postal_code.postal_code = my_contacts.postal_code;


-- 12

SELECT * FROM profession CROSS JOIN my_contacts;


-- 13

SELECT * FROM my_contacts NATURAL JOIN profession;


-- 14

SELECT first_name FROM my_contacts
UNION ALL
SELECT postal_code FROM postal_code
ORDER BY first_name ASC;


-- 15

SELECT contact_id, first_name
INTO my_contacts_newTable
FROM my_contacts
WHERE gender = 'male';


-- 16

select AVG(status_id)
FROM status
-- 1 = married, 2 = single
-- so there are an even number of married/single people

SELECT random() * 100 + 1 AS RAND_1_100
from generate_series(17,32);


-- 17

SELECT contact_id, status_id
FROM my_contacts
WHERE status_id > (
SELECT AVG(status_id) FROM my_contacts
);


-- 18

SELECT relname, relpages 
FROM pg_class 
ORDER BY relpages ASC limit 1;	--'ASC' to show the smallest table


-- 19

SELECT DISTINCT				-- removed 'ON' - query does not work with it.
contact_id, status_id
FROM my_contacts
WHERE status_id > (
SELECT AVG (status_id) FROM my_contacts);




-- Object-Oriented SQL for Data Complexity

-- 1 (20)

SELECT first_name, interest, count(*)
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT join interests
ON interests.interest_id = contact_interest.interest_id
GROUP BY ROLLUP(first_name, interest)
ORDER BY first_name


-- 2 (21)

SELECT distinct first_name, count(interest)
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT join interests
ON interests.interest_id = contact_interest.interest_id
GROUP BY CUBE(first_name, interest)
ORDER BY first_name


-- 3 (22)

CREATE INDEX index_gender ON my_contacts (gender);


-- 4 (23)

SELECT distinct first_name, count(interest)
FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT join interests
ON interests.interest_id = contact_interest.interest_id
GROUP BY CUBE(first_name, interest)
HAVING count(interest) > 3 
ORDER BY first_name


-- 5 (24)

CREATE TABLE my_contacts_audit (
	when timestamp NOT NULL,
	user_id	text NOT NULL,
)

CREATE OR REPLACE FUNCTION delete_audit() 
RETURNS TRIGGER AS $delete_audit$
    BEGIN
        INSERT INTO my_contacts_audit SELECT now(), user;
    END;
$delete_audit$ LANGUAGE plpgsql;


CREATE TRIGGER check_delete
AFTER DELETE
ON my_contacts
FOR EACH ROW
EXECUTE PROCEDURE delete_audit();


-- 6 (25)

SELECT contact_id + 1
FROM my_contacts a
WHERE NOT EXISTS
(
	SELECT NULL
	FROM my_contacts b
	WHERE a.contact_id = b.contact_id + 1
)
ORDER BY contact_id


-- 7 (26)

SELECT first_name, profession,
RANK() OVER 
	(
	ORDER BY prof_id
	)
FROM my_contacts INNER JOIN profession USING (prof_id);


-- 8 (27)

SELECT first_name, profession,
DENSE_RANK() OVER 
	(
	ORDER BY prof_id
	)
FROM my_contacts INNER JOIN profession USING (prof_id);


-- 9 (28)

SELECT first_name, birthday,
FIRST_VALUE(birthday) OVER (
	ORDER BY birthday
) AS olderst
FROM my_contacts;


-- 10 (29)

SELECT first_name, birthday,
LAST_VALUE(birthday) OVER (
ORDER BY birthday RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
) AS youngest
FROM my_contacts


-- 11 (30)

EXPLAIN SELECT * FROM my_contacts;


-- 12 (31)

CREATE ROLE jeff
LOGIN
PASSWORD 'admin';

SELECT rolname FROM pg_roles;


-- 13 (32)

CREATE ROLE dating_administrator;

GRANT dating_administrator TO jeff;



