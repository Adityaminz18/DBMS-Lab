-- Practical 3: Exercise on retrieval of data (using logical operators, relational
-- operators, between operator, in/not in predicate, pattern matching)


-- 1. List down the employees who are having salaries greater than equal to 20000
-- and less than equal to 50000.

select * from employees where salary >= 20000 and salary <= 50000 ;
select * from employees where salary between 20000 and 50000;

-- 2. List down the departments located in Noida.

select * from office ;
select * from office where location = 'Noida' ;

-- 3. List the eid, name of those employees whose name starts with letter a 
-- and ends with letter a.

select e_id, ename from employees where ename like 'a%a' ;

-- 4. List those employees who are having age greater than 30 yrs 
-- and are residing in Delhi.

select * from employees where age > 30 and city = 'Delhi' ; 

-- 5. List the eid ,age,name of employees living in either Noida,
--  Delhi or Gurgaon using in predicate.

select * from employees ;
select e_id, ename from employees where address in ('Noida','Delhi','Gurgaon');

-- 6. List the details of the departments whose location name has 
-- second character as a and second last character as a

select * from office where location like '_a%a' ;




