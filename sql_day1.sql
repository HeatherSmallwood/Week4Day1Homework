


-- Verify connection to DB using the Actor Table
SELECT *
FROM actor;

-- SELECT first_name and last_name
-- FROM actor TABLE
SELECT first_name, last_name
FROM actor;

-- Query first_name which equals 'Nick'
-- Using the WHERE Clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Query first_name which equals 'Nick'
-- Using LIKE clause
-- NOTE: ( = ) is looking for a literal string
-- while the LIKE Clause allows use for wildcards
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Using LIKE Clause and WILD CARD ( % )
-- Get all J names
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Single Character Wild Card ( _ )
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K___';


-- Query for all first_names that start with 'K__%' has two letters, anything goes after
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'K__%';

----- Comparasion Operators:
-- = Equals to
-- > Greater Than
-- < Less Than
-- >= Greater Than or Equal to
-- <= Less Than or Equal to
-- <> Not equals

-- Using Comparasion Operators with the Payment Table
SELECT *
FROM payment;


-- Query WHERE amount GREATER THAN $10.
SELECT amount
FROM payment 
WHERE amount >10;
-- Query amounts BETWEEN $10-$15
-- NOTE: When using BETWEEN both values are inclusive
SELECT amount
FROM payment
WHERE amount BETWEEN 10 AND 15;
-- Order the payments by amount
-- Using the ORDER BY
-- ASC for ascending order (Default)
-- DESC for decending order
SELECT amount
FROM payment
ORDER by amount DESC;

-- Query all payments NOT EQUAL to 2.99
SELECT amount
FROM payment
WHERE amount <> 2.99;

----- Aggregate Functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

-- Query the SUM of amounts GREATER THAN OR EQUAL TO 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the AVG of amounts GREATER THAN OR EQUAL TO 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

-- Query the COUNT of amounts GREATER THAN OR EQUAL TO 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the COUNT of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment;

-- Query to display the MIN paid using alias
SELECT MIN(amount) AS min_amount_paid
FROM payment;

-- Query to display the MAX paid using alias
SELECT MAX(amount) AS max_amount_paid
FROM payment;

-- GROUP BY (Used with aggregate functions)
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;

-- Query the customer that paid the most
SELECT customer_id,SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)DESC;


SELECT CUSTOMER_ID, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) >100;

SELECT CUSTOMER_ID, SUM(amount)
FROM payment
WHERE amount > 10
GROUP BY customer_id
HAVING SUM(amount) >100;

-- 'WHERE does not work on aggregates '


SELECT amount
FROM payment
ORDER BY amount DESC
LIMIT 10;


-- SQL Operations
-- The SQL standard defines many operations, such as:
-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT

-- HOMEWORK , Q9 is extra credit


-- 1. How many actors are there with the last name ‘Wahlberg’? ANSWER:There are 2, I was able to find Nick and Daryl Wahlberg.
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99? ANSWER:There are zero payments between $3.99 and $5.99. I triple checked this my running the full payment list and there was not any amounts between $3.99 and $5.99.
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;


-- check the amounts to see if any payments are between $3.99-$5.99
SELECT amount
FROM payment;

-- 3. What film does the store have the most of? (search in inventory) 
-- ANSWER:There are over 20 films with a count of 8. 
-- Example's are Crossroads Casualties, Shock Cabin, Ridgemont Submarine, Greatest North, Moon Bunch, Storm Happiness, and Dinosaur Secretary.
SELECT COUNT(inventory_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(inventory_id)DESC;


-- look up a film name by using the firm id
SELECT title
FROM film
WHERE film_id = '231';

-- another checker for the inventory
SELECT *
FROM inventory;



-- 4. How many customers have the last name ‘William’? ANSWER:There are zero customers with the last name William. I ran the query and no data was found.  I triple checked that this is correct by just running the full customer list.
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- checker
SELECT first_name, last_name
FROM customer;


-- 5. What store employee (get the id) sold the most rentals? ANSWER:Jon Stephens sold 7304, his staff ID is 2. 
SELECT COUNT(payment_id), staff_id
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id)DESC;

-- find the actual employee name using the staff ID
SELECT first_name, last_name
FROM staff
WHERE staff_id = '2';

-- 6. How many different district names are there? ANSWER:There are 378 district names.


SELECT COUNT(DISTINCT district)
FROM address;



-- 7. What film has the most actors in it? (use film_actor table and get film_id)ANSWER: There are 15 actors in Lambs Cincinatti.
SELECT COUNT(actor_id), film_id
FROM film_actor
GROUP BY  film_id
ORDER BY COUNT(actor_id)DESC;

SELECT film_id, title
FROM film
WHERE film_id = 508;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) ANSWER:There are 21 names that end with 'es'
SELECT COUNT (last_name)
FROM customer
WHERE last_name LIKE '%__es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT customer_id, COUNT(amount),rental_id
FROM payment 
WHERE amount BETWEEN 4.99 AND 5.99 AND customer_id BETWEEN 380 AND 430
GROUP BY customer_id
HAVING rental_id > 250
ORDER BY customer_id;

-- WHERE amount > 250 AND rental_id BETWEEN 380 AND 430




-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total? ANSWER: There are 5 different rating and PG-13 has the most movies.
SELECT COUNT(DISTINCT rating)
FROM film


SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

SELECT *
FROM film;

