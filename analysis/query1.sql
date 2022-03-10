CREATE TABLE animal_names (
 	id bigserial,
 	name varchar(25),
 	age numeric
	);

CREATE TABLE animal_species (
 	id bigserial,
 	species varchar(25)
 	);
	
insert into animal_names (name, age)
values ('gorilla', 20),
		('wolf', 12),
		('panda', 18);
		
insert into animal_species (species)
values ('great ape'),
		('K9'),
		('Bear');
		
select * from animal_species

insert into animal_names (name, age)
values ('squirel' 3);	--no ',' between values

--ERROR:  syntax error at or near "3"
--LINE 2: values ('squirel' 3);


