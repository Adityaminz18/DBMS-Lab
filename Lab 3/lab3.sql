-- Practical 4: Functions(scalar/group)

create table client_master(
client_no varchar(5), 
cname varchar(7),
city varchar(10),
state varchar(10),
bal_due decimal
);

create table product_master(
product_no varchar(7),
description varchar(20),
qty int,
sell_price int
);

alter table client_master modify state varchar(15) ;

insert into client_master (client_no, cname, city, state, bal_due ) values
('0001', 'Ivan', 'Bombay', 'Maharashtra', 15000),
('0002','Vandana', 'Madras', 'Tamil Nadu', 20000),
('0003', 'Parmada', 'Bombay', 'Maharashtra', 5000),
('0004', 'Basu', 'Delhi', null, 2000.0),
('0006', 'Rukmini', 'Bombay', 'Maharashtra', 10000);

insert into product_master (product_no, description, qty, sell_price) values
('P00001', '1.44 floppies', 100, 500),
('P03453', 'Monitors', 10, 11200),
('P06734', 'Mouse', 20, 1050), 
('P07865', '1.22 floppies', 100, 525),
('P07868', 'Keyboards', 10, 3050),
('P07885', 'CD Drive', 10, 5100),
('P07965', '540 HDD', 10, 8000),
('P07975', '1.44 Drive', 10, 1050),
('P08865', '1.22 Drive', 5, 1050);


-- 1. Count the total number of orders placed

select sum(qty) from product_master ;

-- 2. Calculate the average price of all the products

select avg(sell_price) from product_master ;

-- 3. Determine the maximum and minimum product prices

select max(sell_price) from product_master ;

-- 4. Count the number of products having price greater then equal to 1500

select min(sell_price) from product_master ;

-- 5. Find all the product whose quantity is less than 50

select * from product_master where qty < 50 ;

-- 6. Retrieve the city of all clients in lower case letters

select lower(city) as city from client_master ;

-- 7. Update the table client by changing the first letter of client in caps

update client_master set cname = concat( ucase(left(cname,1)), lcase(substring(cname,2)) );

-- 8. Display the state of client no C0002 in upper case

select upper(state) as state from client_master where client_no = '0002' ;

-- 9. Retrieve the city of client by extracting substring from the city column with m=1,n=4

select substring(city,1,4) from client_master ;

-- 10. Calculate the length of names of clients having client_no=C0004

select length(cname) from client_master where client_no = '0004' ;

-- 11. Update the table product by adding Rs 1000 to the sell price of all products

update product_master set sell_price = sell_price + 1000;

-- 12. Display the order no and day on which the clients placed their order




