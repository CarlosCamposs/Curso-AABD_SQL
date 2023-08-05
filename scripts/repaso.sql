
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


SELECT * FROM customer;

SELECT region, COUNT(customer_id)
FROM customer 
WHERE state LIKE 'A%'
GROUP BY region
HAVING COUNT(customer_id) BETWEEN 10 AND 20;

SELECT age,
CASE 
	WHEN age<18 THEN 'Menor de edad'
	WHEN age >=18 AND age <64 THEN 'Adulto'
	ELSE 'Tercera edad'
END AS "Categoria edad"
FROM customer;


ALTER TABLE customer
ADD COLUMN probabilidad FLOAT(3)-- Creamos una nueva columna

UPDATE customer
SET probabilidad=(
CASE
	WHEN age<18 THEN 1
	WHEN age>=18 AND age <65 THEN  0.5
	ELSE 0
END); -- Con UPDATE establecemos que valores iran en la nueva columna

ALTER TABLE customer
DROP COLUMN probabilidad;

SELECT * FROM customer;

UPDATE customer
SET probabilidad= age/18;


SELECT * FROM customer;
SELECT * FROM sales;

SELECT 
a.customer_name,
a.state,
b.sales,
b.profit
FROM customer as a
INNER JOIN sales as b
ON a.customer_id = b.customer_id;

SELECT 
a.state,
SUM(b.profit) AS "Suma profit"
FROM customer AS a
INNER JOIN sales AS b
ON a.customer_id = b.customer_id
GROUP BY a.state;


SELECT *
FROM customer as a
FULL JOIN sales as b
ON a.customer_id = b.customer_id;

SELECT * FROM sales;
SELECT * FROM customer;


SELECT customer_id FROM customer
EXCEPT
SELECT customer_id FROM sales
			-- Para identificar que registros estan en "customer" pero no en "sales"


-- Me quede en la 38