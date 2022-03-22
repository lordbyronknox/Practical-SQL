
create table shopper (
	shopper_id smallserial constraint shopper_id_key PRIMARY KEY,
	first_name varchar (20),
	last_name varchar (20),
	email varchar (30) constraint email_constraint unique
);

create table cart (
	shopper_id integer NOT NULL references shopper (shopper_id), 
	item_id integer NOT NULL references price_list (item_id)
);

create table price_list (
	item_id smallserial constraint item_id_key primary key,
	item varchar (20),
	price integer
);

create table shopping_cart (
	shopper_id integer, 
	item_id integer, 
	item varchar (20), 
	price integer
)

insert into shopper (first_name, last_name, email)
values ('John', 'Doe', 'jdoe@mail.com'),
	   ('Dan', 'Brown', 'dbrown@mail.com'),
	   ('Megan', 'Yale', 'myale@mail.com'),
	   ('Frank', 'Zappa', 'fzappa'),
	   ('Sally', 'Field', 'sfield@mail.com'),
	   ('Jack', 'Black', 'jblack@mail.com')
	   
insert into price_list (item, price)
values ('Diet Coke', 10),
	   ('Coke', 11),
	   ('Bread', 15),
	   ('Milk', 20),
	   ('Topdeck', 9),
	   ('Canned Peaches', 12),
	   ('Fire Lighters', 13),
	   ('Magazine', 24)
	   
select * from price_list

insert into cart (shopper_id, item_id)
values (1, 1),
	   (2, 2),
	   (3, 3),
	   (4, 4),
	   (5, 5),
	   (6, 6),
	   (6, 7),
	   (6, 8)
	   

-- 3
select * from price_list;
select * from shopper
select * from cart
select * from shopping_cart

-- 4
insert into shopping_cart (shopper_id, item_id, item, price)
select shopper.shopper_id, price_list.item_id, price_list.item, price_list.price
from shopper LEFT JOIN cart
ON shopper.shopper_id = cart.shopper_id
left join price_list
ON cart.item_id = price_list.item_id
where shopper.shopper_id = 6 and price_list.item_id = 6 

insert into shopping_cart (shopper_id, item_id, item, price)
select shopper.shopper_id, price_list.item_id, price_list.item, price_list.price
from shopper LEFT JOIN cart
ON shopper.shopper_id = cart.shopper_id
left join price_list
ON cart.item_id = price_list.item_id
where shopper.shopper_id = 6 and price_list.item_id in (7, 8) 

-- 5
select * from shopping_cart;

-- 6
select shopper_id ,count(item) as Num_of_Items, sum(price) as Total_Rand
from shopping_cart
GROUP BY shopper_id

create table orders (
	order_number smallserial,
	shopper_id integer,
	Number_of_items integer,
	total integer
)

insert into orders (shopper_id, number_of_items, total)
select shopper_id ,count(item) as Num_of_Items, sum(price) as Total_Rand
from shopping_cart
GROUP BY shopper_id

select * from orders