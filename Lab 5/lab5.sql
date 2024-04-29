-- Practical 6: Set Operations (Union, Intersect, EXCEPT)

create table sailors(
s_id int primary key,
s_name varchar(10),
s_dob date,
s_rating int,
check (s_rating <= 10));

create table reserves(
s_id int ,
b_id int ,
day date,
time_slot varchar(5),
primary key(s_id, b_id),
foreign key(s_id) references sailors(s_id),
foreign key(b_id) references boats(b_id)
);

create table boats(
b_id int,
bname varchar(10),
bcolor varchar(7),
primary key(b_id)
);

insert into sailors(s_id, s_name, s_rating, s_dob) values
(31,'Lubber',8,'2000-1-1');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(32,'Andy',8,'2001-5-1');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(58,'Rusty',10,'2003-5-5');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(64,'Horataio',7,'1995-12-1');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(71,'Zorba',10,'1993-12-1');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(74,'Horataio',9,'1999-9-5');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(85,'Art',3,'2000-12-8');
insert into sailors(s_id, s_name, s_rating, s_dob) values
(95,'Bob',3,'2000-12-12');


insert into boats (b_id,bname,bcolor)
values(101,'Interlake','blue');
insert into boats (b_id,bname,bcolor)
values(102,'Interlake','red');
insert into boats (b_id,bname,bcolor)
values(103,'Clipper','green');
insert into boats (b_id,bname,bcolor)
values(104,'Marine','red');


insert into reserves(s_id,b_id,day,time_slot)
values(22,101,'1998-10-10','NIGHT');
insert into reserves(s_id,b_id,day,time_slot)
values(22,102,'1998-10-10','DAY');
insert into reserves(s_id,b_id,day,time_slot)
values(22,103,'1998-10-8','DAY');
insert into reserves(s_id,b_id,day,time_slot)
values(22,104,'1998-10-7','NIGHT');
insert into reserves(s_id,b_id,day,time_slot)
values(31,102,'1998-11-10','DAY');
insert into reserves(s_id,b_id,day,time_slot)
values(31,103,'1998-11-6','NIGHT');
insert into reserves(s_id,b_id,day,time_slot)
values(31,104,'1998-11-12','NIGHT');
insert into reserves(s_id,b_id,day,time_slot)
values(64,101,'1998-9-5','DAY');
insert into reserves(s_id,b_id,day,time_slot)
values(64,102,'1998-9-8','DAY');
insert into reserves(s_id,b_id,day,time_slot)
values(74,103,'1998-3-8','DAY');

-- 1. Find the sid of the sailors who have reserved a red boat but not a green boat.

select distinct r.s_id 
from reserves r 
join boats b on r.b_id = b.b_id 
where b.bcolor = 'red' 
and not exists(
	select 1 from reserves r2 
	join boats b2 
	on r2.b_id = b2.b_id 
	where r2.s_id = r.s_id 
	and b2.bcolor = 'green'
);

-- 2. Find the sid of the sailors who have reserved a red boat or green boat.

select distinct s_id 
from reserves r
join boats b on r.b_id = b.b_id 
where bcolor in ('red','green');

-- 3. Find the sid of the sailors who have reserved both red boat and green boat.

SELECT DISTINCT r.s_id
FROM reserves r
JOIN boats b ON r.b_id = b.b_id
WHERE b.bcolor IN ('red', 'green')
GROUP BY r.s_id
HAVING COUNT(distinct b.bcolor) = 2;




