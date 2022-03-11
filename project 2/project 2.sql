
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
	interest varchar (50)
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
	   ('1243', 'Northern Cape', 'kuruman'),
	   ('7424', 'North West', 'vryberg'),
	   ('7494', 'North West', 'brits');
	   
insert into status (status)
values ('married'),
	   ('single');
	   
insert into my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id,
    postal, status_id)
values ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('jones', 'Jim', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('Edwards', 'ben', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   ('Smith', 'John', 0831112020, 'jsmith@mail.com', 'male', '1970-01-01', , , ),
	   
	   


