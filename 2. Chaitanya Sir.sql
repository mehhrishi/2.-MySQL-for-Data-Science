#day1  
show databases;
use itv;
use sql_hr;
show tables;
use  itv; 
show tables;
create table student(rollno int,name varchar(25),city varchar(40));
insert into student values(1,"cs","thane");
select * from student;
insert into student values(2,"sql","vashi");
insert into student values(3,"python","mankhurd");
select * from student;
select rollno,name from student;
insert into student values(1,"java","mulund");
select  * from student;
drop table student; 
create table emp(eid int,ename varchar(25),gender enum("male","female","trans"),primary key (eid));
show tables;
insert into emp values(101,"cs","male");
insert into emp values(101,"sql","female");
select * from emp;
use itv;
show tables;
desc emp;
create table mytable(fname varchar(20), lname varchar(20));

# alter: in order to add new column or in order to change the datatype of particular column like rollno is "int"
# datatype so, with the 
describe emp;
# adding new column
alter table emp add column profilename enum ("manager","clerk","staff");
select * from emp;

# how to alter (add a column in mytable)
# alter table tablename add column column_name datatype constraints
alter table mytable add column city varchar(20);
# desc/describe it describe the table , it gives the information of a specified table for eg:- desc mytable
desc mytable;

#how to drop a column from a table using alter
# alter table tablename drop column columnname;
alter table emp drop column profilename;
desc emp;
alter table mytable drop column city;
desc mytable;


# insert new column in mytable
alter table mytable add column feature varchar(20);
desc mytable;

# how to change the datatype of existing column
# alter table tablename modify column columnname datatype;
alter table mytable modify column feature varchar(60);

desc mytable;

# addig new column
alter table mytable add column city varchar(40);



# using truncate
# truncate table tablename;
truncate table mytable;

desc mytable;

select * from mytable;

#to delete/drop a table

drop table mytable;

#show tables
show tables;


# creating new table with date datatype 

create table demo(id int primary key, name varchar(20), dob date);
desc demo;

show tables;

insert into demo values(1,"cs",'1999-06-21');

#to display all the records from demo
select * from demo;

insert into demo values(2,"sql",'1990-05-25'),(3,"css",'1985-07-25');
select * from demo;

#exercise
select id,name from demo;

#exercise
alter table demo add column city varchar(40);

desc demo;

select * from demo;

# now there are 4 column
insert into demo values(4,"ps","1999-05-04"); # it will give error bcoz there are 4 column

# lets try insert into another way

insert into demo(id,name,dob) values(4,"ps","1999-05-04"); # now, it worked bcoz we mentioned the columnnames 
														   # next to 'demo' tablename	
select * from demo;

# if the user doesn't provide id so in that case
# lets try
insert into demo (name,dob,city) values("ks",'1998-05-21');
#will get an error because 'id' not provide and we have to provide because its primary key
select * from demo;


# deleting column city
alter table demo drop column city; #alternate way := drop column columnname;

desc demo;
select * from demo;

# to delete a particular row

delete from demo where id='4';

select * from demo;
delete from demo where id='104';
insert into demo values(4,"cs","1999-05-04"),(5,"sql","1999-05-04");

select * from demo;

# delete where name = "cs"
delete from demo where name="cs";

select * from demo;
#updateing record
# change the name of id=2

# update tablename set columnname=new value where id=2;
update demo set name="hrishi" where id=2;

select * from demo;

# using where clause with select statement
select * from demo where id=3;

select * from demo where name="sql";

select name,dob from demo where id=2;

# to change the name of the attribute or column name of particular table
ALTER TABLE table_name RENAME COLUMN old_col_name TO new_col_name;

# day 4
create table demo1(id int primary key,weight decimal(3,2), name varchar(25),age int, check (age>=18));
insert into demo1 values(1,1.3,'cs',34);
select * from demo1;
alter table demo1 drop column weight;
desc demo1;
insert into demo1 values(2,'qw',10);
insert into demo1 values(2,'qw',40);
insert into demo1 values(3,'df',55);
insert into demo1 values(4,'vg',40);
insert into demo1 values(5,'gy',80);

#selectage greater than=40
select * from demo1 where age>=40;
show tables;
create table stable(sid int primary key,sname varchar(25),address varchar(60),age int,Rollno int);
desc stable;
insert into stable values(1,'rohit','badlapur',22,10);
insert into stable values(2,'hrishi','chembur',22,20,9870998760);
alter table stable add column contact bigint;
desc stable;
select * from stable;
use itv;
insert into stable values(3,'ashish','vashi',20,30,9876523410);
insert into stable values(4,'mohit','sanpada',24,40,9854712541);
insert into stable values(5,'sunil','germany',21,50,3547854121);
update stable set contact=9874563210;
select * from stable;

# display record of specific sid
select * from stable where sid=1;

# display only sname, address of specific sid
select sname,address from stable where sid=2;

# display record of specific name

select * from stable where sname='ashish';

# display records whose age is greater than 20

select * from stable where age >20;

# delete a record whose sid is 2

delete from stable where sid=2;

select * from stable;

update stable set contact=987456147 where sid=1;

update stable set contact=9999999999 where sid=3;
select * from stable;

create table tab(id int);
desc tab;
drop table tab;

# to change the name of a column and its data type
# alter table tablename change old_columnname new_columnname datatype constraint;

alter table stable change sname fisrtname varchar(100) unique;
desc stable;

# using auto_increment

create table person(srno int auto_increment primary key,name varchar(40),city varchar(20),age int);
desc person;
insert into person(name, city, age) values('rohit','badla',24);


# exercise

create table jobs(job_id int,job_title varchar(40));
desc jobs;
alter table jobs add column min_salary bigint;
desc jobs;
alter table jobs add column max_salary bigint;
desc jobs;
# adding column two at a time 
#alter table jobs add column (new1column datatype,new2column datatype);

alter table jobs rename column min_salary to job_min_salary;
alter table jobs change max_salary job_max_salary float8;


# to change the name of table
alter table oldname rename newname;

alter table jobs rename job_info;
desc job_info;

# 21 feb
use itv;
create table demo12(id int primary key auto_increment,name varchar(20),city varchar(20),country varchar(20), salary int);
desc demo12;
show create table demo12;
# to insert multiple records

insert into demo12(name,city,country,salary) 
values("chaitanya","mumbai","india",2000),
	  ("ramesh","delhi","india",1000),
      ("nilay","pune","india",4000),
      ("suresh","delhi","india",5000),
      ("swapnil","pune","india",6000);
      
select * from demo12;


# logical operator:- AND, OR, NOT

# 1. AND operator
select * from demo12 where (city="pune") and (salary>4000);

select * from demo12 where city="delhi" and salary>1000;

# 2. OR operator

select * from demo12 where salary=4000 or salary=6000;

# not operator 
# gives exact opposite result

select * from demo12 where not(salary>4000);
# will give output which are less than 4000 and 4000


# to fetch recors where salary is between 4000 and 6000
select * from demo12 where (salary>=4000) and (salary<=6000);
# range operator :- between Range is a fuction where betwwen acts as a keyword
select * from demo12 where salary  between 4000 and 6000;
# between operator is used to specify a "range" 

# IN operator we can call set operator cause 
# we have a set of list mention in the below set of city 
# and we can also membership operator
select * from demo12 where city in ("mumbai","pune","thane");


# LIKE Operator
# 's%' = starts with "s"
# 'p%' = starts with "p"
# '%k' = end with  "k"
# '_h%' = second character should be 'h'
# '%s_' = second last character should be 's'
# 'r%h' = name should start with 'r' and ends with 'h'
# '%a% = where name should have character called "a"
# display alll the records where name starts with "s"
select * from demo12 where name like "s%";

# display alll the records where name ends with "h"
select * from demo12 where name like "%h";

# display all the record where in name second character is "h"
select * from demo12 where name like "_h%";

# display all the record where in name second last character is "s"
select * from demo12 where name like '%s_';

# display all the record where in name should start with "r" and ends with "h"
select * from demo12 where name like 'r%h';

# display all the record where name should have character "a"
select * from demo12 where name like '%a%';

# exercise

create table demo13(eid int primary key auto_increment,ename varchar(20), salary int,dept_id int,state varchar(20));
desc demo13;

insert into demo13(ename,salary,dept_id,state) 
values("chaitanya",20000,101,"maharashtra"),
	("rajesh",15000,112,"tamilnadu"),
    ("rahul",13000,115,"tamilnadu"),
    ("ramesh",5500,117,"gujrat"),
    ("virat",24000,117,"gujrat");
select * from demo13;
# display records whose salary is less than 15000
select * from demo13 where salary<15000;

# display all records whose dept id is 117 and salary is greater than 20000
select * from demo13 where (dept_id=117) and (salary > 20000);

# display ename and salary  whose salry is between 15000 to 25000
select ename, salary from demo13 where salary between 15000 and 25000;

# display records  of id (1,3,5)
select * from demo13 where eid in (1,3,5);

# display all records whose state is gujrat and salary should be greater than 10000

select * from demo13 where (state="gujrat") and (salary>10000); 









#22 FEB TOPICS
-- DISTINCT
-- SORTING
-- LIMIT
-- IS NULL, NULL
-- AGGREGATE FUNCTION
use itv;
create table demo12(id int primary key auto_increment,name varchar(20),city varchar(20),country varchar(20), salary int);
desc demo12;
show create table demo12;
# to insert multiple records

insert into demo12(name,city,country,salary) 
values("chaitanya","mumbai","india",2000),
	  ("ramesh","delhi","india",1000),
      ("nilay","pune","india",4000),
      ("suresh","delhi","india",5000),
      ("swapnil","pune","india",6000);

# distinct:
select distinct city from demo12;

# display all record
select * from demo12;

# sorting :- order by asc and desc
# ascending
# default value of order by is ascending
select * from demo12 order by salary asc; # asc is optional
select * from demo12 order by salary ;

# descending
select * from demo12 order by salary desc;

# exercise
# order by "id" in descending order
select * from demo12 order by id desc;

#limit

# limit first 5 record
select * from demo12 limit 5;

# display 1st row
select * from demo12 limit 1;

# display last 5 records
select * from demo12 order by id desc limit 5;

# display last records
select * from demo12 order by id desc limit 1;

# display last 3 records
select * from demo12 order by id desc limit 3;

# to dsiplay all null values from city column
select * from demo12 where city is null;

# it will empty set because city is not null
select * from demo12 where city is not null;

# aggregate function
-- max(columnname)
-- min(columnname)
-- sum(columnname)
-- count(columnname)

# to get max salary

select max(salary) from demo12;

# give alias
select max(salary)  as max from demo12;
select * from demo12 where max(salary);# error

select id,name,max(salary)  as max from demo12;

# min
select min(salary)  as max from demo12;
select id,name,min(salary)  as max from demo12;

# sum
select name,sum(salary) from demo12;

# average

select avg(salary) from demo12;

# to count how many records are there present in the table
select count(*) from demo12;

# to count city data
select count(city) from demo12;
select count(city) as city from demo12;

# group by
select * from demo12;

# to dispaly max from the city

select max(salary) from demo12 group by city;

# with city column
select city,max(salary) from demo12 group by city;

# find min, sum, avg, by group by 
#min
select city,min(salary) from demo12 group by city;

# sum
select city,sum(salary) from demo12 group by city;

# avg
select city,avg(salary) from demo12 group by city;





# 23feb
# having clause

use itv;
create table demo12(id int primary key auto_increment,name varchar(20),city varchar(20),country varchar(20), salary int);
desc demo12;
show create table demo12;
# to insert multiple records

insert into demo12(name,city,country,salary) 
values("chaitanya","mumbai","india",2000),
	  ("ramesh","delhi","india",1000),
      ("nilay","pune","india",4000),
      ("suresh","delhi","india",5000),
      ("swapnil","pune","india",6000);
#1 display those cities whose count is grater than equal to 2
select city,count(city) from demo12 group by city having count(city)>=2;

#2 
select city,max(salary) from demo12 group by city having max(salary)>=6000;


# upper,  lower :- these are nothing but string function
# name colun in capital format
# upper()
select upper(name) from demo12;


# lower()
select lower(name) from demo12;

# length() it gives length of a  record
select length(name) from demo12;


# replace() function
select * from demo12;
select replace("chaitanya","a","b"); # direct way

select name,replace(name,"a","x") from demo12;

# substr() SubString
select substr("chaitanya",2,5);

select substr("chaitanya",3,5);

select name,substr(name,1,3) from demo12;


delete  from demo; # delete all the record except column name



# 24feb
select abs(-5) as abs_example;
select floor(-5.2) as floor_example; 
select abs(4.3);
select ceil(7.3);

# mod(): returns remainder 
select mod(10,2);
select mod(10,3);


# round()

select round(10.298,1);

select truncate(10.298,2);


# pow(base, exponent value/power):
select pow(2,4); # 2 raise 4

select sqrt(9);

select truncate(sqrt(5),2);

select exp(-1);

select exp(1);

select round(1.236,2);



# date functions

select sysdate();
select last_day(curdate());
select last_day("yyyy-mm-dd");
select last_day("2022-01-01");
select last_day("2022-01-24");
select date_format("2017-01-12","%Y %M %D");


select month('2017-01-01');

select date_format("2017-01-12","%Y");
select date_format("2017-01-12","%M");
select month('2017-01-01') as month ;
select date_format('2022-02-24', '%m %d %y');
select date_format('2022-02-24', '%m %d %Y');
select date_format('2022-02-24', '%M %D %Y');
select date_format('2022-02-24', '%Y');
select month(sysdate());
select year(sysdate());
select year('2022-02-24');
select year('2022-02-24') as year;





# alias 

select ename as emp_name from demo;



# foreign key
# foreign key is nothing but primary key of another table

-- It is primary key of another table

-- whenever we want to connect 2 tables 

# join
******
join()
******
select 
from
inner join
on

select     column names....
from       table1
inner join table2
on         common column name
use itv;
create table student1(rollno int primary key,name varchar(20),age int);

describe student1;

create table course (cid int primary key,
cname varchar(20),
rollno int,
foreign key (rollno) references student1(rollno));

insert into student1 values
(1,"cs1",19),
(2,"cs2",22),
(3,"cs3",24),
(4,"cs4",25),
(5,"cs5",26),
(6,"cs6",29),
(7,"cs7",30);

insert into course values
(101,"python",1),
(102,"java",2),
(103,"c++",3);

select * from course;

select s.rollno,s.name,s.age,c.cid,c.cname 
from student1 as s
inner join course as c
on s.rollno=c.rollno;

# left join

select s.rollno, s.name,s.age, c.cid,c.cname,c.rollno from student1 as s left join course as c
on s.rollno=c.rollno;

# right join

select s.rollno, s.name,s.age, c.cid,c.cname,c.rollno from student1 as s right join course as c
on s.rollno=c.rollno;

# cross join

select s.rollno, s.name,s.age, c.cid,c.cname,c.rollno from student1 as s  cross join course as c;


# self join
insert into student1 values(8,"ccs",19);

select t1.name as t1name , t2.name as t2name from student1 t1,student1 t2 
where t1.rollno <> t2.rollno and t1.age=t2.age

select t1.name as t1name , t2.age as t2age from student1 t1,student1 t2 
where t1.rollno <> t2.rollno and t1.age=t2.age;


# cascade:- on delete cascade , on update cascade
use itv;
create table tableA(empid int primary key,ename varchar(20),city varchar(20));


create table tableB(deptno int, deptname varchar(20), empid int , foreign key (empid) references tableA(empid));
drop table tableB;


create table tableB(deptno int, deptname varchar(20), empid int , foreign key (empid) references tableA(empid) on delete cascade);
desc tableB;

# insert values
insert into tableA values(101,"cs","thane"),
						(102,"ss","pune");
                        
                        
insert into tableB values(1,"IT",101),
						(2,"CS",102);
select * from tableB;                        
# try deleting
delete from tableA where empid=101;

select * from tableB;

# on update cascade
create table tableA1(empid int primary key,ename varchar(20),city varchar(20));
insert into tableA1 values(101,"cs","thane"),
						(102,"ss","pune");
select * from tableA1;
create table tableB1(deptno int, deptname varchar(20), empid int , foreign key (empid) references tableA1(empid) on update cascade);
insert into tableB1 values(1,"IT",101),
						(2,"CS",102);
select * from tableB1;
update tableA1 set empid=110 where empid=101;
select * from tableA1;
select * from tableB1;

# Sub Query:- nested queries

create table emps(eid int primary key , ename varchar(25), deptname varchar(25), salary bigint);
insert into emps values (101,"ramesh","IT",4000),
						(102,"suresh","CS",5000),
                        (103,"smith","sales",5400),
                        (104,"jhon","CS",5800),
                        (105,"andrew","sales",6000),
                        (106,"belly","CS",7000),
                        (107,"wick","IT",10000),
                        (108,"kick","CS",9000);
select * from emps;

# Q1. display all the records whose salary is greater than the salary of andrew

select  * from emps where salary > (select salary from emps where ename="andrew");

# Q2. display all records whose salary is less than the salary of eid 104
select * from emps where salary < (select salary from emps where eid=104);


# Q3. display all the records whose salary is greater than the avg salary
# first check avg salry : 
select avg(salary) from emps;
select * from emps where salary > (select avg(salary) from emps);

# Q4. display all the records whose salary is less than the maximum slary of cs.
# first check max salary of cs department 
select max(salary) from emps where deptname="cs";

select * from emps where salary < (select max(salary) from emps where deptname="cs");

# Q5. sisplay all  the records whose salary is less than the avg salary of cs
# fisrt check the avg of salary of deptname "cs"
select avg(salary) from emps where deptname="cs";

select * from emps where salary < (select avg(salary) from emps where deptname="cs");

# Q6. display all the records whose salary is less than the maximum salary of it
# first check the max salry of deptname=IT
select max(salary) from emps where deptname="it";

select * from emps where salary < (select max(salary) from emps where deptname="it");
