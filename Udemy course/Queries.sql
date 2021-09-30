------------------- SELECT --------------------

-- Extracting all values from actor table

SELECT *FROM actor;

-- Extracting only first name from actor table

SELECT first_name 
FROM actor;

-- Extracting first and last name

SELECT last_name 
FROM actor;

-- Extracting first,last and emailif from customers

SELECT first_name,last_name,email 
FROM customer;

---------------- DISTINCT------------------------
--Distinct is used in SQL to get unique values from table

SELECT DISTINCT release_year 
FROM film;

-- how many unique rental rate do we have

SELECT DISTINCT rental_rate 
FROM film;

-- checking unique movie ratings from film

SELECT DISTINCT rating 
FROM film;

----------------- COUNT -------------------------
-- count function is used to return number of rows based on column applied

-- count all rows from film table

SELECT COUNT(*) 
FROM film;

SELECT *FROM payment;

SELECT COUNT(*) 
FROM payment;

-- Actual number of distinct amount paid

SELECT COUNT(DISTINCT amount) 
FROM payment;

------------------ WHERE clause --------------------
-- WHERE clause is used to allow a condition on SQL statement

SELECT *FROM customer;

SELECT *FROM customer 
WHERE first_name = 'Jared';

SELECT *FROM film;

SELECT *FROM film 
WHERE rental_rate > 4 
AND replacement_cost >= 19.99
AND rating = 'R';

SELECT title FROM film 
WHERE rental_rate > 4 
AND replacement_cost >= 19.99
AND rating = 'R';

SELECT COUNT(*) FROM film 
WHERE rental_rate > 4 
AND replacement_cost >= 19.99
AND rating = 'R';

SELECT *FROM film 
WHERE rating = 'R' OR rating = 'PG';

SELECT count(*) FROM film 
WHERE rating = 'R' 
OR rating = 'PG';

SELECT *FROM film 
WHERE rating != 'R';

-- extracting email id of Nancy Thomas

SELECT email FROM customer 
WHERE first_name = 'Nancy' 
AND last_name = 'Thomas';

-- description of movie Outlaw Hanky

SELECT description FROM film 
WHERE title = 'Outlaw Hanky';

-- phone number for the customer staying in 259 Ipoh Drive

SELECT phone FROM address 
WHERE address = '259 Ipoh Drive';

----------------------- ORDER BY --------------------------------
-- It is used to sory based on some column

SELECT *FROM customer;

SELECT *FROM customer 
ORDER BY first_name;

SELECT *FROM customer
ORDER BY first_name DESC;

SELECT *FROM customer
ORDER BY store_id,first_name;

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id,first_name;

SELECT store_id,first_name,last_name FROM customer
ORDER BY store_id DESC,first_name ASC;


--------------- LIMIT in SQL ------------------------
--it is used to limit rows information returned from query

SELECT *FROM payment 
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

--customer id of first 10 customers who ever created a payment

SELECT customer_id FROM payment
ORDER BY payment_date
LIMIT 10;

-- title of 5 shortest movies

SELECT title,length FROM film
ORDER BY length ASC
LIMIT 5;

SELECT count(*) FROM film
WHERE length <= 50;

--------------------- BETWEEN in SQL ----------------------------
-- It is used to extract information within range

SELECT *FROM film 
WHERE length BETWEEN 5 AND 50;

-------------------- GROUP BY ---------------------------------
-- Aggregate function takes multiple input and return single output
-- Common aggregate functions are SUM(),MIN(),MAX(),COUNT(),AVG()

-- extract minimum replacement cost of film

SELECT MIN(replacement_cost) 
FROM film;

-- Maximum

SELECT MAX(replacement_cost) 
FROM film;

-- Max and min

SELECT MAX(replacement_cost),MIN(replacement_cost) 
FROM film;

-- Average replacement cost

SELECT ROUND(AVG(replacement_cost),2) 
FROM film;

-- Summation

SELECT SUM(replacement_cost) 
FROM film;

-- GROUP BY

SELECT *FROM payment;

SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;


SELECT customer_id,SUM(amount),COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

SELECT customer_id,staff_id
FROM payment
GROUP BY customer_id,staff_id
ORDER BY staff_id;

--- grouping by time stamp by calling special function DATE

SELECT DATE(payment_date),SUM(amount)
FROM payment 
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

--- GROUP BY challenge task

SELECT staff_id,COUNT(amount)
FROM payment
GROUP BY staff_id;

SELECT *FROM film;

SELECT ROUND(AVG(replacement_cost),2) AS avg_cost,rating
FROM film 
GROUP BY rating;

SELECT *FROM payment;

SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT *FROM payment;

SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;

-- number of customer per store

SELECT *FROM customer;

SELECT store_id,COUNT(customer_id)
FROM customer
GROUP BY store_id;

SELECT store_id,COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

-- HAVING clause challenge

SELECT *FROM payment;

SELECT customer_id,COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40
ORDER BY COUNT(amount) DESC
LIMIT 1;

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;

--------- Assessment ----------

-- 1. Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
-- The answer should be customers 187 and 148.

SELECT *FROM payment;

SELECT customer_id,SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

--2. How many films begin with the letter J?
-- The answer should be 20.

SELECT *FROM film;

SELECT COUNT(*)
FROM film 
WHERE title LIKE 'J%';

--3. What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
-- The answer is Eddie Tomlin

SELECT *FROM customer;

SELECT *FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;

--------------------- JOINS in SQL ----------------------------
-- using AS for aliases

SELECT COUNT(*) AS amount_count
FROM payment;

-- INNER JOINS
-- Let's extract customer email id for each payment 

SELECT *FROM customer;
SELECT *FROM payment;

SELECT *FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id;

SELECT customer.customer_id,customer.first_name,customer.email
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id;

-- FULL OUTER JOIN --
-- Return all rows from both the table

SELECT *FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.customer_id IS null;

-- LEFT JOIN --
-- extracting all rows from left table and common between both the table.

SELECT *FROM film;
SELECT *FROM inventory;

SELECT film.film_id,title,inventory_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null;

-- RIGHT JOIN --
-- extracting all rows from right table and common between both the table.

SELECT inventory.film_id,title,inventory_id
FROM inventory
RIGHT JOIN film
ON inventory.film_id = film.film_id
WHERE film.film_id IS null;

-- UNION --
-- It is used to combine the result of two or more select statement

SELECT *FROM payment;
--UNION
SELECT *FROM customer;

------------- JOINS challenge ------------------

SELECT *FROM customer;
SELECT *FROM address;

SELECT district,email 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

SELECT *FROM actor;
SELECT *FROM film;
SELECT *FROM film_actor;


SELECT title FROM film
WHERE film_id 
IN(SELECT film_id 
FROM film_actor 
WHERE actor_id 
IN(SELECT actor.actor_id
FROM actor 
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'));


SELECT film.title,actor.first_name,actor.last_name
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg';

------------- TIMESTAMP and Extract ---------------------------

--SHOW ALL

--SELECT NOW()

--SELECT TIMEOFDAY()

--SELECT CURRENT_DATE

--- extract year from timestamp

SELECT EXTRACT(YEAR FROM payment_date) 
FROM payment;

--- extract month from timestamp

SELECT EXTRACT(MONTH FROM payment_date) 
FROM payment;

--- extract quarter from timestamp

SELECT EXTRACT(QUARTER FROM payment_date) 
FROM payment;

--- Extract AGE of payment 

SELECT AGE(payment_date)
FROM payment;

--- To char used to convert into text

SELECT TO_CHAR(payment_date,'MONTH YYYY')
FROM payment;

------------------------

SELECT TO_CHAR(payment_date,'MONTH')
FROM payment 
GROUP BY TO_CHAR(payment_date,'MONTH');

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1

------------ Mathematical Functions in SQL ----------------


SELECT ROUND(rental_rate/replacement_cost,2)*100
FROM film;

----------
--Extract length of all customers first name

SELECT LENGTH(first_name)
FROM customer;

-- String concatenate

SELECT first_name ||' '|| last_name AS full_name
FROM customer;

SELECT UPPER(first_name) ||' '|| UPPER(last_name)
AS full_name
FROM customer;

SELECT first_name ||'.'|| last_name || '@gmail.com'
FROM customer;

SELECT LOWER(first_name) ||'.'|| LOWER(last_name) || '@gmail.com'
FROM customer;

----------- Sub query and EXISTS ---------------------

SELECT title,rental_rate
FROM film
WHERE rental_rate >
(SELECT AVG(rental_rate) 
FROM film);

SELECT first_name,last_name
FROM customer as c
WHERE EXISTS
(SELECT *FROM payment as p
WHERE c.customer_id = p.customer_id
AND p.amount>11);


SELECT first_name,last_name
FROM customer as c
WHERE NOT EXISTS
(SELECT *FROM payment as p
WHERE c.customer_id = p.customer_id
AND p.amount>11);

----- SELF JOIN ------

SELECT *FROM film;

SELECT title,length 
FROM film 
WHERE length = 117;

SELECT f1.title,f2.title,f1.length
FROM film AS f1
JOIN film AS f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length;

---------- CASE Statemnt ----------
-- CASE statement is used to execute SQL code when certain conditions are met.
-- It's very similar to IF/ELSE statement.

SELECT *FROM customer;

--- General CASE statement ---

SELECT customer_id,
CASE
 	WHEN (customer_id BETWEEN 1 AND 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Platinum'
	ELSE 'Ordinary'
END AS customer_class
FROM customer;

--- CASE expression

SELECT customer_id,
CASE customer_id
 	WHEN 2 THEN 'Second Position'
	WHEN 1 THEN 'Winner'
	ELSE 'Pass'
END AS customer_class
FROM customer;

SELECT *FROM film;

SELECT 
SUM(
	CASE rating
	WHEN 'R' THEN 1 ELSE 0
	END
) AS r,
SUM(
	CASE rating
	WHEN 'PG' THEN 1 ELSE 0
	END
) AS pg,
SUM(
	CASE rating
	WHEN 'PG-13' THEN 1 ELSE 0
	END
) AS pg13
FROM film;

SELECT COALESCE(1,2,3,4)
SELECT COALESCE(1,2,3,NULL)

-- CAST is used to convert one data type to another

SELECT CAST('5'AS INTEGER)

-- Postgres version

SELECT '5'::INTEGER

------ VIEWS in SQL --------

CREATE VIEW customer_info AS
SELECT first_name,last_name,address 
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id;

SELECT *FROM customer_info;

-- Altering view

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name,address,district
FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id;

SELECT *FROM customer_info;

--drop view

DROP VIEW IF EXISTS customer_info;

-- Changing name of view

ALTER VIEW customer_info RENAME TO c_info;

SELECT *FROM c_info;





















































