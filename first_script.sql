-- "hello world" of SQL - SELECT * gets you all records from the table
select *
from actor;


-- Queary specific columns - SELECT column_name, ..... FROM table_name
select first_name, last_name 
from actor;

                        -- Change query order --
select last_name, first_name 
from actor;


------------------------------
select *
from film;

-- Filter rows - use the WHERE clause - always after the from 
select*
from actor where first_name = 'Nick';


-- Using the LIKE operator
select*
from actor where first_name LIKE 'Nick';

-- Using the LIKE operator with % - % acts as a wild card - can be any number of characters(0-infinity)
select *
from actor where first_name like 'J%';

-- Using the LIKE operator with _ - _ acts as a wild card for one and only one character 
select *
from actor where first_name like '_i_'; 
-- any record with 3 letters in which 'i' is the second letter


 -- Using % and _ in the same pattern
select *
from actor where first_name like '_i%';

-- Using AND and OR in our WHERE clause
-- OR - only one condition needs to be true 
select*
from actor
where first_name like 'N%' or last_name like 'W%';

-- AND - all conditions need to be true 
select*
from actor
where first_name like 'N%' and last_name like 'W%';



-- Comparing operation in SQL:

-- Greater Than >
-- Less Than <
-- Greater Than or Equal to >=
-- Less Than or Equal to <=
-- Equal =
-- Not Equal <>

select *
from payment;

-- Query for all payments greater than 4
select customer_id, amount
from payment 
where amount > 4;  -- also works in string format (ex: '4')

-- Query all pamyents that are not 7.99
select customer_id, amount
from payment
where amount <> 7.99;

-- Query all payments between 3 and 8
select *
from payment
where amount >= 3 and amount <=8;

-- BETWEEN/AND clause
select *
from payment
where amount between 3 and 8;

-- Order rows of data by using ORDER BY clause (default ascending)
select *
from payment
where amount between 3 and 8
order by payment_date;

-- Descending (desc)
select *
from payment
where amount between 3 and 8
order by amount desc;

-- Ordering by String - alphabetical
select *
from actor
order by last_name;


-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- takes in a column_name as an argument and returns a values 

-- Get SUM of all payments
select amount 
from payment;

select sum(amount)
from payment;

-- Get SUM of all payment more than 5
select sum(amount)
from payment
where amount > 5;

-- Get AVG of all payments more than 5
select avg(amount)
from payment
where amount > 5;

-- COUNT amount of payments more than 5
select count(amount)
from payment
where amount > 5;

-- COUNT all
select count(*)
from payment
where amount > 5;

-- Get MIN amount paid
select min(amount)
from payment;

-- MIN with aliasing
select min(amount) as lowest_amount_paid
from payment;


-- Get MAX amount paid
select max(amount)
from payment;

-- MAX with aliasing
select max(amount) as highest_amount_paid
from payment;

-- Calculate a column based on two other columns 
select payment_id - rental_id as difference
from payment;

-- 
select payment_id, rental_id, payment_id - rental_id as difference
from payment;


-- Queary the number of payment per amount
select count(*)
from payment
where amount = 2.99;

select count(*)
from payment
where amount = 3.99;

select count(*)
from payment
where amount = 4.99;

-- GROUP BY clause - used aggregrations
select amount, count(*)
from payment 
group by amount;

select amount, count(*), sum(amount), avg(amount)
from payment 
group by amount;

-- Using GROUP BY with everything from the select
select amount, customer_id, count(*)
from payment
group by amount, customer_id;

-- Query people who spent the most money
select customer_id, sum(amount)
from payment
group by customer_id
order by sum(amount) desc;

-- Alias our aggregation column and use aliased name in order by
select customer_id, sum(amount) as total_spent
from payment 
group by customer_id 
order by total_spent desc;

-- Query the payment table to display customers who have spent the most, but have made at least 40 payments
select customer_id, count(*), sum(amount) as total_spent
from payment 
group by customer_id 
having count(*) >= 40
order by total_spent desc;

-- LIMIT and OFFSET clauses

-- LIMIT - limits the number of rows that are returned
select *
from film
limit 10;

-- OFFSET - offset the number of rows that are returned
select *
from actor
offset 10;

-- OFFSET/LIMIT - offset the number of rows that are returned and limit the number returned
select *
from actor
offset 10
limit 5;

-- Putting all the clsuses into one query
-- display customers 11-20 who have spent the most in under 20 payment and customer_id has to be greater than 3
select customer_id, sum(amount), count(*)
from payment
where customer_id > 3
group by customer_id 
having count(*) < 20
order by sum(amount)
offset 10
limit 10;

-- Syntax order (SELECT and FROM are the only mandatory keywords):

-- select
-- from 
-- join
-- on
-- where
-- group by 
-- having
-- order by
-- offset 
-- limit 