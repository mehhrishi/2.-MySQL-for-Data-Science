# mosh Sql

# select clause
select first_name, last_name from customers; # it will firstname and last from customer table
select last_name, first_name from customers; # it will give lastname and firstname from customers table
select last_name, first_name, points from customers;
select last_name, first_name, points+10 from customers; 
select last_name, first_name, points+10 from customers where customer_id=2;
select last_name, first_name,points as originalpoints, points+10 from customers;
-- in math, multiplication and division operators gets higher precedence compare to add and subtraction operators
select last_name,first_name,points,points + 10 *100 as discount_fcators from customers;
select last_name,first_name,points,points + 10 *100,(points + 10) *100  from customers;
 select state from customers;
select distinct state from customers; #it gives you distinct value
select count(distinct state) from customers; # it will give count of distinct state
# excercise
-- select * from products;
select name,unit_price,(unit_price * 1.1) as new_price from products;


# we use where clause to filter data
select * from customers where points >3000;#points greater than 3000
select * from customers where points <> 200;# not equal to 200
select * from customers where points = 157;
select * from customers where points != 3547;# not equal to 3547
select * from customers where state="VA"; # string "va" is as sequence of character so it should always be in Quotes
select * from customers where state="VA" or "va"; # string "va" is as sequence of character so it should always be in Quotes
# sql is not case sensitive
select * from customers where state !="VA"; #not equal to "va"
select * from customers where state <>"VA"; #not equal to "va"
select * from customers where birth_date > '1990-01-01'; 
# excercise
select * from orders where order_date>="2019-01-01";


#The AND, OR and NOT Operators
select * from customers where birth_date > "1990-01-01" and points >1000;
select * from customers where birth_date > "1990-01-01" or points >1000;
select * from customers where birth_date > "1990-01-01" or points >1000 and state="va";
# AND opretor has a higher precedence over OR operator
# but we can change the order by giving parenthesis
select * from customers where (birth_date > "1990-01-01" or points >1000) and state="va";
select * from customers where birth_date > "1990-01-01" or (points > 1000 and state="va");
# now, will use NOT operator
select * from customers where not (birth_date > "1990-01-01" or points > 1000);
# the above syntax says that born date should be before 1990 
# and point should not be greater than 1000 just because of "NOT" operator
select * from customers where (birth_date < "1990-01-01" and points < 1000);
# this syntax gives the same value as per the above syntax

#exercise
select * from order_items where order_id="6" and unit_price*quantity > 30;


# IN operator
select * from customers;
select * from customers where state="va" or state="ga" or state = "fl";
select * from customers where state in ("va","ga","fl");
select * from customers where state not in ("va","ga","fl");

# exercise
select * from products;
select * from products where quantity_in_stock in (49,38,72);
# numbers doesn't require qoutes

# Between operator
select * from customers where points >= 1000 and points <=3000; # normal way
# using between operator
select * from customers where points between 1000 and 3000; # these both values are inclusive


#exercise
select * from customers;
select * from customers where birth_date between '1990-01-01' and '2000-01-01';


# Like operator
# to know whose lastname starts with "b",below syntax
select * from customers where last_name like "b%";

# TO KNOW WHOSE LASTNAME starts with "brush"
select * from customers where last_name like "brush%";

# to know whose lastname consist letter "b" no matter where start,end,middle
select * from customers where last_name like "%b%";

# customers whose lastname end with "y"
select * from customers where last_name like "%y";


# select id, firstname, lastname from customer table where lastname starts with b
select customer_id,first_name, last_name from customers where last_name like "b%";

# where lastname consist of 6 character where the last character is y.
select * from customers where last_name like "_____y";

#whose lastname start with b and ends with y
select * from customers where last_name like "b%" and  last_name like "%y";


# exercise
select * from customers where address like "%avenue%" or phone like "%9";
# question
select * from customers where address like "%trail%" or address like "%avenue%" and phone like  "%9";

#customers whose phone numbers ends with "9".
select * from customers where phone like "%9";

#customers whose phone numbers not ends with "9".
select * from customers where phone not like "%9";


#regexp operators
#not with regex
select * from customers where last_name like "%field%";

# with regex
select * from customers where last_name regexp "field";

# we use ^ caret sign for the string which starts with like regexp "^brush"
# if we use caret sign for "^field" in the lastname we wont get the output, 
#let try it

select * from customers where last_name regexp "^field";
# here field is at the last position of so will get null or nothin as in output

#to search "field " as a string for last position will use "$" sign
select * from customers where last_name regexp "field$"; # it says that the lastname should end with field
# now we got the output.  


# now will search for lastname which has "field" or "mac" in thier lastname
# so for that will use | pipe 
select * from customers where last_name regexp "field|mac";

# we can use | pipe for multiple names like we did for above

select * from customers;

# now will use | pipe for multiple names
select * from customers where last_name regexp "brush|twid|dowson";

# lets try and use for numbers 
select * from customers where phone regexp "98|47|15|24";# it works
 
# now let start using caret in the regexp with |pipe
select * from customers where last_name regexp "^field|mac|rose";
# as you know "field" is an ending name for "Brushfield"

select * from customers where last_name regexp "field$|^mac|^twid";

select * from customers where last_name regexp "e";
# it will consider all the lastname which consist of letter "e"

select * from customers where last_name regexp "[gim]e";
# ge, ie, me 


select * from customers where last_name regexp "e[dmq]";
# ed , em , eq
# you wont get the output because as such there is no record

select * from customers where last_name regexp "[a-h]e";
# ae, be, ce, de, ee, fe, ge, he

select * from customers where last_name regexp "e[a-h]"; 
# ea, eb, ec, ed, ee, ef, eg, eh
-- ^ caret sign for beginning
-- $ for end of the string
-- | pipe for logical OR
-- [abcd] assigning range [a-d]
-- [a-h]e and e[a-h]

# exercise
# from customer whose first names is elka or ambur
select * from customers where first_name regexp "elka|ambur";

# last names starts with "ey" or "on"
select * from customers where last_name regexp "ey$|on$";


# last name start with 'my' or contains 'se'
select * from customers where last_name regexp "^my|se";


#last names contains "b" followed by R or U
select * from customers where last_name regexp "b[ru]";
select * from customers where last_name regexp "br|bu";



# IS NULL Operator
select * from customers;

# it will give you the null value which is present in phone column
select * from customers where phone is null;

#It wont give the data of a null value which was present in phone column with customer id:5 
select * from customers where phone is not null;

#exercise
# get the order that are not shipped
select * from orders;

select * from orders where shipped_date is null;
select * from orders where shipper_id is null;



#order by clause
# order by is bydefault in Ascending order
select * from customers order by customer_id desc; # descending customerid

select * from customers order by first_name asc; # firstname in ascending
 
select * from customers order by birth_date asc; # birthdate in ascending

select * from customers order by birth_date,first_name desc;# first priority to birth_date

select * from customers order by first_name,birth_date desc; # first priority to firstname

select * from customers order by state, first_name; # first priority for state

select * from customers order by state desc , first_name asc;# first priority for state

# now , we can sort data by their bithdate

select first_name, last_name from customers order by birth_date;

select first_name, last_name, birth_date from customers order by birth_date;

select * from customers;

select * from customers where points > 3000;

select first_name, last_name, 10 as pt from customers order by birth_date;
select * from customers;

select first_name, last_name,10 as points from customers order by first_name;

select first_name, last_name,10 as points from customers order by 1,2;
# exercise
select *,quantity*unit_price as totalprice from order_items where order_id=2 order by totalprice asc; 

# Limit clause
# its is used to limit a data 
# limit clase will always come at the end
# for eg , here will choose only the data till customid 3. 
select * from customers limit 3;


# if you limit 300 and there is only 10 data rows ,
# so it gonna print the whole data till 10
select * from customers limit 300;

# what if you need data from 7-9
select * from customers limit 6,3;
# here 6 will skip starting 6 data and it will print next 3 data

# exercise
select * from customers order by points desc limit 3;
select * from customers order by first_name asc limit 3;

select * from customers order by first_name asc limit 3,10;

select * from customers order by customer_id asc limit 3,10;

select * from customers  order by customer_id desc limit 3,5;


# inner joins
 select * from orders;
 
 select * from orders # on basis of customers id will be joining
 join customers on orders.customer_id=customers.customer_id;
 
 select * from orders join customers
 on orders.first_name = customers.first_name;
# gives error showing unknown column order.first_name


select  order_id, first_name, last_name from orders 
join customers on customers.customer_id= orders.customer_id;


select customers.customer_id, order_id, first_name, last_name from orders 
join customers on customers.customer_id= orders.customer_id;

# the syntax looks very lengthier so will give alias 
select c.customer_id, order_id, first_name, last_name from orders o
join customers c on o.customer_id= c.customer_id;


# exercise
select * from order_items oi join products p on oi.product_id=p.product_id;

select order_id,p.product_id, quantity, oi.unit_price,p.name 
from order_items oi 
join products p on oi.product_id = p.product_id;


# Joining across Databases

# here we are using sql_store database and there is a table inside it called ordersitem
# and we are joing it with sql_invt database products table 
# thats why we used that prefix called "sql_inventory.products p"
select * 
from order_items oi
join sql_inventory.products p 
on oi.product_id=p.product_id;

select * from 
# now will change the databasee and will use sql_inventory database
use sql_inventory;

select *
from products p
join sql_store.order_items oi
on p.product_id=oi.product_id;


# self joins
# in sql we can aslo joint table with itself
use sql_hr;
select * from employees e
join employees m
on e.reports_to=m.employee_id;


select e.employee_id,e.first_name,m.first_name as Manager
from employees e
join employees m
on e.reports_to=m.employee_id;


# joining multiples tables

select * from orders o 
join customers c 
on o.customer_id = c.customer_id
# to join orders table with orders_status will write,
join order_statuses os
on o.status = os.order_status_id;

# if we run above code will get data from 3 different table
# but if we need particular columns from 3 different table 
# use below code

select order_id,
		order_date,
        c.first_name,
        c.last_name,
        os.name as status,
        os.order_status_id
from orders o 
join customers c 
on o.customer_id = c.customer_id
# to join orders table with orders_status will write,
join order_statuses os
on o.status = os.order_status_id;


#exercise 

use sql_invoicing;

select p.date,
p.invoice_id,
p.amount,
c.name,
pm.name as payment_method
from payments p
join clients c
on p.client_id = c.client_id
join payment_methods as pm
on p.payment_method = pm.payment_method_id;

# compound join condition 
use sql_store;

select * from order_items oi
join order_item_notes oin
on oi.order_id = oin.order_id
and oi.product_id = oin.product_id;


# implicit join syntax

select * 
from orders o 
join customers c
on o.customer_id = c.customer_id;

# by using implicit join syntax for the same above code, 
# in implicit we dont use 
select * 
from orders o, customers c # this is implicit syntax where we didn't use 'join' 
#and instead of "on" we use 'where' keyword 
where o.customer_id = c.customer_id;

# but mostly we dont implicit join syntax , because if we forget the "where" clause
select * 
from orders o, customers c;
# it will give us cross join


# till, now we have learned inner join , here inner is the optional keyword 
# so we can also write 'join' keyword
# but will use outer join from now, 
# but before that will use inner join and convert it into outer join

select c.customer_id,
		c.first_name,
        o.order_id
from customers c 
join orders o 
on c.customer_id = o.customer_id
order by c.customer_id;
# if you run this syntax you'll get the result of only those customers 
# who have given orders , but what if we want to see customers whether they have order or not?
# so for that reason we use 'outer join'
# now lets see the syntax 
# outer join is of two types
# 1.left join: all the records from the left table in this case customers are
# returned whether the "on" condition is true or not

select c.customer_id,
		c.first_name,
        o.order_id
from customers c 
left join orders o 
on c.customer_id = o.customer_id
order by c.customer_id;

# as we have used left join, so it will select all the customers table 
# from the left table which is customers 
# and as a result will get all the results of customers who have order or not
# lets try with Right join


select c.customer_id,
		c.first_name,
        o.order_id
from customers c 
right join orders o 
on c.customer_id = o.customer_id
order by c.customer_id;
# if you run it will give an output same like the inner join
# which we did at the before starting the outer join 
# cause orders table consist only those customer id who have ordered items

# now lets try switching the place of the tables 
select c.customer_id,
		c.first_name,
        o.order_id
from orders o 
right join customers c 
on c.customer_id = o.customer_id
order by c.customer_id;
# it will give data of all the table who has order or not
# cause right join means customers table 
# lets try by left join, here left is orders 
# and as you know lleft i.e orders table which only have customers who have ordered items

select c.customer_id,
		c.first_name,
        o.order_id
from orders o 
left join customers c 
on c.customer_id = o.customer_id
order by c.customer_id;

# exercise
select p.product_id,
		p.name,
        oi.quantity
from products p 
left join order_items oi
on p.product_id = oi.product_id;

# lets try with right join
select p.product_id,
		p.name,
        oi.quantity
from products p 
right join order_items oi
on p.product_id = oi.product_id;

# now , will learn
# outer join between multiple tables

select c.customer_id,
c.first_name,
o.order_id,
sh.name	as shipper
from customers c
left  join orders o 
on c.customer_id = o.customer_id
left join shippers sh
on o.shipper_id = sh.shipper_id;

# exercise
select o.order_id,
		o.order_date,
		c.first_name,
        sh.name as shippers,
        os.name as status
from customers c
right join orders o 
on c.customer_id = o.customer_id
right join order_statuses os
on o.status = os.order_status_id
left join shippers sh
on o.shipper_id = sh.shipper_id
limit 10;
 

 

























 




 











