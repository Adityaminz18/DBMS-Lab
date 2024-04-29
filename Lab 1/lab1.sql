-- Practical 1: Getting familiar with SQL, parts of SQL, data types used in SQL
-- Practical 2: Exercise on basic DDL commands and DML commands 

create database Company ;
use company ;

create table employees(
e_id varchar(5),
ename char(7),
age int,
dob date,
salary int,
city char(7),
dno varchar(5)
);

create table departments(
d_id varchar(5),
dname char(10),
location char(7)
);


create table students(
s_id varchar(5),
sname char(7)
);

create table works(
e_id varchar(5),
d_id varchar(5),
hours int
);

-- 1. Insert five rows each in the table.

insert into employees(e_id, ename, age, dob, salary, city, dno) values
('E0001', 'Alice', 25, '1997-01-01', 50000, 'Mumbai', 'D0001'),
('E0002', 'Bob', 30, '1992-05-12', 60000, 'Delhi', 'D0002'),
('E0003', 'Charlie', 35, '1987-10-23', 70000, 'pune', 'D0003'),
('E0004', 'David', 40, '1982-03-04', 80000, 'Chennai', 'D0004'),
('E0005', 'Eve', 45, '1977-08-15', 90000, 'Kolkata', 'D0005');

alter table departments modify location char(10) ;

insert into departments(d_id, dname, location) values
('D0001', 'Sales', 'Mumbai'),
('D0002', 'Marketing', 'Delhi'),
('D0003', 'Engineers', 'Bangalore'),
('D0004', 'Finance', 'Chennai'),
('D0005', 'HR', 'Kolkata');

insert into students (s_id, sname) values
('S0001', 'Alice'),
('S0002', 'Bob'),
('S0003', 'Charlie'),
('S0004', 'David'),
('S0005', 'Eve'); 

insert into works(e_id, d_id, hours) values
('E0001','D0001',40),
('E0002','D0002',35),
('E0003','D0003',30),
('E0004','D0004',25),
('E0005','D0005',20);

-- 2. Increase the size of column city to 10 in the table Employee.

alter table employees modify city char(10) ;

-- 3. Rename the table department to the office.

rename table departments to office ;

-- 4. Drop the table student.

drop table students;

-- 5. Delete the data of employees working in department number 1.

SET SQL_SAFE_UPDATES = 0;
delete from employees where dno = 'D0001' ;

-- 6. Increase the salary by 10% of those employees having a salary less than 10000.

update employees set salary = salary*1.1 where salary < 10000 ;
select * from employees ;

-- 7. Add a column State with char (10) in the table Employee.

alter table employees add state char(10) ;

-- 8. Now insert values for the newly added column state in the employee table.

update employees set state = 'New Delhi' where e_id = 'E0002';
update employees set state = 'Mumbai' where e_id = 'E0003';
update employees set state = 'Tamil Nadu' where e_id = 'E0004';
update employees set state = 'Bengal' where e_id = 'E0005';

select * from employees ;

-- 9. Change the name of city in employee to address

alter table employees rename column city to address ;
select * from employees ;

-- 10. Add a column manager_id with varchar (5) in the table Department.

alter table office add column manager_id varchar(5);

-- 11. Now insert values for the newly added column manager_id in the Department Table.

update office set manager_id = 'E0002' where location = 'Delhi' ;
update office set manager_id = 'E0003' where location = 'Mumbai' ;
update office set manager_id = 'E0004' where location = 'Chennai' ;
update office set manager_id = 'E0005' where location = 'Kolkata' ;

-- 12. Drop column age from Employee.

alter table employees drop column age ;
select * from employees ;



