
-- Repaso de SQL para examen tecnico de WTW
-- -----------------------------------------------------------------------------------------------

SELECT * FROM customer;

SELECT COUNT(DISTINCT city)- COUNT(DISTINCT(region)) AS diferencia FROM customer;

SELECT * FROM customer WHERE age <19;
SELECT MIN(age) FROM customer;

SELECT * FROM customer 
WHERE age=(
	SELECT MIN(age) FROM customer);
	
SELECT * FROM customer
WHERE age=(
	SELECT MAX(age)-MIN(age) FROM customer) AND region='Central';
	
ALTER TABLE customer 
ADD COLUMN probabilidad INT;

ALTER TABLE customer
DROP probabilidad;

SELECT * FROM customer;

ALTER TABLE customer
ALTER COLUMN age TYPE INTEGER; -- No funciona


-- Para volver a tener la columna de "age" como INT
ALTER TABLE customer
ADD COLUMN new_age int;

UPDATE customer SET new_age=CAST(age AS int);

ALTER TABLE customer 
DROP COLUMN age;

ALTER TABLE customer
RENAME COLUMN new_age TO age;

SELECT * FROM customer;
----------------------------------------------------

SELECT * FROM customer WHERE age IN (18,19,20)

SELECT * FROM sales;

SELECT * FROM sales WHERE ship_date BETWEEN '2015-01-01' AND '2015-12-31'; -- Envios realizados en 2015

SELECT * FROM customer WHERE customer_name NOT ILIKE 'c%';

SELECT * FROM customer ORDER BY age ASC;
SELECT * FROM customer ORDER BY customer_name ASC;


SELECT customer_name AS nombre, city AS ciudad, age AS edad FROM customer
ORDER BY ciudad ASC, edad ASC


SELECT region, COUNT(DISTINCT customer_id)  FROM customer GROUP BY region ORDER BY region ASC;

SELECT region, COUNT(customer_id), AVG(age)
FROM customer
GROUP BY region;

SELECT region, state, COUNT(customer_id), AVG(age)
FROM customer
GROUP BY region, state
ORDER BY region ASC;


-- Me quede en la diapositiva 22




