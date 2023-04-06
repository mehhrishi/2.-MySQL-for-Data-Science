create database testdb;
show databases;
use testdb;

create table customers(ID int primary key,
				Name varchar(50) not null,
                age int not null,
                City char(50),
                Salary numeric);
                
select * from customers;
# inserting values
insert into customers 
values (1,'Sam',26,'Delhi',9000),
	   (2,'Ram',19,'Bangalore',11000),
       (3,'Pam',31,'Mumbai',6000),
       (4,'Jam',42,'Pune',10000);

select * from customers;

# Updating the values
update customers 
set Name = 'Hrishi', age = 24
where ID = 1;

select * from customers;

# Deleting the Single Rows/Records
delete from customers
where id = 3;

select * from customers;

# deleting multiple records
delete from customers
where id in (2,4);

delete from customers
where id = 1;


# Insert alll the records again

select * from customers;
# inserting values
insert into customers 
values (1,'Sam',26,'Delhi',9000),
	   (2,'Ram',19,'Bangalore',11000),
       (3,'Pam',31,'Mumbai',6000),
       (4,'Jam',42,'Pune',10000);
       
select * from customers;

# Lets add the using Alter Table
alter table customers 
add column gender char(10) not null;

select * from customers;

update customers
set gender = 'male'
where id = 1; 

select * from customers;

desc customers;

# Drop column 
alter table customers 
drop column gender;

select * from customers;

-- alter/ modify the column 

# To change the datatype of existing datatype
alter table customers 
modify column Salary varchar(10); 

alter table customers 
modify column Salary int not null;

select * from customers;

desc customers;

# Rename Column
# let Rename Table Name 
alter table customers rename Salary ;

alter table Salary rename cust;

select * from cust;


# Rename the column name
desc cust;
alter table cust rename column Salary to Sal;
# While renaming you cannot add datatype and constraints.  

select * from cust;

# let rename colname and dtype and add constraint
 desc cust;

alter table cust change column Sal Salary varchar(25) null;

desc cust;

use testdb;
# Truncate Table 
-- It will delete the records of the Table
truncate table cust;

# select Clause 
select * from cust;
# There will be no records because we have just truncate the Table means deleted the rows 

# Drop the Table
drop table cust;

show tables;



# Select Clause 
use sql_hr;

select * from employees;

# REname Table name
alter table employees rename emp;


select * from emp;


# Rename column Name
alter table emp rename column employee_id to emp_id;

select * from emp;

# SELECT clause 

select emp_id, first_name from emp;

select emp_id, first_name, last_name from emp;

# Where Clause
select * from emp;

select first_name,last_name  from emp 
where salary > 50000;

select *  from emp;

-- order by clause 
select * from emp;

select * from emp 
order by first_name desc
limit 5;


# Strings function 
select * from emp;

# upper()
select upper(first_name)
from emp;

# lower()
select lower(last_name) from emp;

# length()
select length(first_name) from emp;


# substring()
select substring(first_name, 1, 5), first_name from emp;

# concat ()
select concat(first_name,'  ',last_name) as fullname, first_name,last_name 
from emp;

# REPLACE ()
select replace(first_name, "D'arcy", "Hrishi"), first_name from emp;

# Aggregate Functions

# count() 
select count(first_name) from emp;
# it will return total no. of rows 

select * from emp;

select count(*) from emp;

select count(reports_to) from emp;
# because there is one missing value 

# Sum ()

select sum(salary) from emp;

# Avg()
select avg(salary) from emp;

# min()
select min(salary) from emp;

select * from emp
where salary = min(salary);
# didin't work

# max()
select max(salary) from emp;

# avg () and round()
select round(avg(salary),2) from emp;
  
# how to import excel file to SQL
select * from emp;

use testdb;
show tables;
create table payment ( c_id int primary key ,
					amount int,
                    mode varchar(50),
                    payment_date date);

select * from payment;

select sum(amount), mode from payment
GROUP BY mode;
						
select mode, sum(amount) from payment
GROUP BY mode;

select mode, sum(amount) as Total from payment
GROUP BY mode;

select mode, sum(amount) as Total from payment
GROUP BY mode
order by total asc;

select mode, sum(amount) as Total from payment
GROUP BY mode
order by total desc;

select * from payment;

select mode, min(amount) as min_transaction from payment
GROUP BY mode;

select * from payment;

select c_id, min(amount) as mini from payment
GROUP BY c_id;

SELECT mode, avg(amount) as Average from payment
GROUP BY mode;

SELECT mode, count(amount) as count from payment
GROUP BY mode;

SELECT mode, count(mode) as count from payment
GROUP BY mode;

select * from payment;

# Having clause
use testdb;

select * from payment;

# count() gives you the total no of rows for each categories.
select mode, count(amount) as total 
from payment 
GROUP BY mode 
HAVING count(amount) > 1; 

select mode, count(amount) as total 
from payment 
GROUP BY mode 
HAVING count(amount) > 1
order by total asc;

select mode, count(amount) as total 
from payment 
GROUP BY mode 
HAVING count(amount) > 1
order by total desc;

select mode, count(amount) as total 
from payment 
GROUP BY mode 
HAVING count(amount) > 1
order by mode asc;

select mode, count(amount) as total 
from payment 
GROUP BY mode 
HAVING count(amount) >=2 and count(amount) <= 3
order by total asc;

select mode, sum(amount) as totalsum
from payment
GROUP BY mode
HAVING totalsum >20;

select mode, sum(amount) as totalsum
from payment
GROUP BY mode
# multiple condition 
HAVING totalsum >20 and totalsum <100;
 

# Timestamp functions/operators

select now();
show TIMEZONE;
select timeofday();
select current_date();
select current_time();
select current_timestamp();
select current_user();

# Extract function
select *  from payment;

select extract(month from payment_date), payment_date from payment;

select *, extract(month from payment_date) as payment_month
from payment;

SELECT *, extract(month from payment_date) as payment_month,
		  extract(day from payment_date) as payment_day
          from payment;

SELECT *, extract(month from payment_date) as payment_month,
		  extract(day from payment_date) as payment_day,
          extract(year from payment_date) as payment_year
          from payment;
          
SELECT *, extract(month from payment_date) as payment_month,
		  extract(day from payment_date) as payment_day,
          extract(year from payment_date) as payment_year,
          extract(quarter from payment_date) as payment_quarter
          from payment;
          
          
# Join
select * from customers;

# 
select * from customers;
select * from payment;

select * 
from customers as c
inner join payment as p
on 
c.customer_id = p.customer_id;

select * 
from customers as c
inner join payment as p
on c.customer_id = p.customer_id
# adding where clause
where c.customer_id = 2;

select c.first_name, p.amount, p.mode
from customers as c
inner join payment as p
on c.customer_id = p.customer_id;


# left join
select * 
from customers as c
left join payment as p
on c.customer_id = p.customer_id;

# right join
select * 
from customers as c
right join payment as p
on c.customer_id = p.customer_id;

# full join

-- select * 
-- from customers 
-- left join customers as c
-- on c.customer_id = p.customer_id;
-- union 
-- select * 
-- from payment
-- right join payment as p
-- on c.customer_id = p.customer_id;

select * from customers as c left join payment as p 
on c.customer_id = p.customer_id
UNION
select * from customers as c right join payment as p 
on c.customer_id = p.customer_id;


-- Self Join 
create table emp (e_id int primary key,
			empname varchar(25),
            manager_id int);
            
insert into emp values(1,'Agni',3),
					  (2,'Akash',4),
                      (3,'Dharti',2),
                      (4,'Vayu',3);

SELECT * from emp;

select *
from emp as t1
join emp as t2
on t2.e_id = t1.manager_id;

select t1.empname, t2.empname as Manager
from emp as t1
join emp as t2
on t2.e_id = t1.manager_id;


-- union

create table custA(custname varchar(25),
					custamount bigint);
insert into custA values('Madan Mohan', 2100),
							  ('Gopi Nath', 1200),
                              ('Govind Dev', 5000);

create table custB(custname varchar(25),
					custamount bigint);

insert into custB values('Gopal Bhat', 1500),
						('Madan Mohan', 2100);
                        
select * from custA
UNION
select * from custB;

# union all
select * from custA
UNION all
select * from custB;



# sub query 
-- Q.1 - find the details of customers payment amount is more
--  than the avg of total amount paid by all customers. 

-- find avg amount 
select avg(amount) from payment;

-- find customers whose amount > avg amount
select * from payment  
where amount>48;
-- And this is not the best practice to write sub query syntax

-- sub query
select *
from payment
where amount > (select avg(amount) from payment);


select * from customers;
select * from payment;

select customer_id, amount, mode
from payment
where customer_id in (select customer_id from customers);

-- Q.2

select * from customers;

select customer_id, amount, mode
from payment
where customer_id in (select customer_id from customers);

select * from payment;

select customer_id, first_name, last_name
from customers c
where exists ( SELECT customer_id, amount 
				from payment p
                where p.customer_id = c.customer_id
                and amount > 60);

-- using inner join

select * from customers;
select * from payment;

select c.customer_id, first_name, last_name, p.amount
from customers c   
inner join payment p
on c.customer_id = p.customer_id
where p.amount > 60;


# stored procedure 
select * from customers;

call get_customers_info; 
