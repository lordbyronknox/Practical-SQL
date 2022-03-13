
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
	   
select * from my_contacts;
select * from profession;
select * from postal_code;
select * from status;
select * from contact_interest;
select * from contact_seeking;
select * from interests;
select * from seeking;


SELECT profession.profession, CONCAT(postal_code.city, ', ', postal_code.province, ', ', postal_code.postal_code) as Postal_Code, status.status, interests.interest, seeking.seeking
FROM my_contacts LEFT JOIN profession
ON my_contacts.prof_id = profession.prof_id
LEFT JOIN postal_code
ON my_contacts.postal_code = postal_code.postal_code
LEFT JOIN status
ON my_contacts.status_id = status.status_id
LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT JOIN contact_seeking
ON my_contacts.contact_id = contact_seeking.contact_id
LEFT JOIN interests
On interests.interest_id = contact_interest.interest_id
LEFT JOIN seeking
ON seeking.seeking_id = contact_seeking.seeking_id
