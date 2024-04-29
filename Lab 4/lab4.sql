-- Practical 5: Integrity Constraint (Domain Integrity, Entity Integrity,
-- Referential Integrity, Key Constraint), Check Constraint and Default Value concept.

-- 1. Create a table Emp with attributes ename, ecity, salary, enumber 
-- with following constraints: enumber is the primary key and should start 
-- with ‘E’, ecity should have default values as Delhi.


create table emp(
e_no varchar(5) primary key,
ename varchar(7),
ecity varchar(10) default 'Delhi',
salary int,
check (e_no like 'E%')
);

-- 2. Create another Table Department with attributes did, budget and manager_id,
-- dname with following constraints: budget should not be less than 10000.


create table depart(
d_id varchar(5),
budget int,
manager_id varchar(5),
dname varchar(15),
check (budget > 10000)
);

-- 3. Create another Table Works with attributes did and eid 
-- combination of both as primary key


create table work(
d_id varchar(5),
e_id varchar(5),
primary key(d_id, e_id));

-- 4. Alter table Department and make did as the primary key.

alter table depart add primary key(d_id);

-- 5. Alter table Department and make manager_id as the foreign key.

alter table depart add foreign key(manager_id) references emp(e_no);

-- 6. Alter table Works and make did and eid as foreign keys.

alter table work add foreign key(d_id) references depart(d_id) ;
alter table work add foreign key(e_id) references emp(e_no) ;

-- 7. Create table book with attributes ISBN, title, price, pid with following
-- constraints: ISBN is the primary key, price should be >=20/<=200, title 
-- should not have null values.


create table books(
ISBN varchar(7) primary key,
title varchar(10) not null,
price int,
p_id varchar(10),
check (price >= 20 and price <= 200)
);

-- 8. Create table publisher with attributes pid, pname, state with following 
-- constraints: pname should not have null values; state should be either 
-- Haryana, Tamil nadu, Maharashtra.


create table publisher(
p_id varchar(10),
pname varchar(5) not null,
state varchar(10),
check (state in ('Haryana', 'Tamil Nadu', 'Maharashtra'))
);

-- 9. Alter the table publisher by making pid as primary key.

alter table publisher add constraint primary key(p_id) ;

-- 10. Alter the table book by making pid as foreign key.

alter table books add constraint fk_BookPublisher foreign key(p_id) references 
publisher(p_id);

-- 11. Remove the foreign key constraint on books.

alter table books drop constraint fk_BookPublisher;




