
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

SELECT customer_id FROM customer
EXCEPT
SELECT customer_id FROM sales
			-- Para identificar que registros estan en "customer" pero no en "sales"

SELECT * FROM sales;
SELECT * FROM customer;

SELECT customer_id, ship_mode  
FROM sales
WHERE customer_id IN ( -- On my first try, I'd written "=" instead of "IN"
 	SELECT customer_id 
	FROM customer
	WHERE age=18);

SELECT * FROM product;

SELECT
a.product_id,
a.product_name,
a.category,
b.cantidad
FROM product AS a
INNER JOIN
(SELECT product_id, SUM(quantity) AS cantidad
FROM sales
GROUP BY product_id)AS b
ON a.product_id=b.product_id;


SELECT
	customer_id,
	order_id,
	(	SELECT customer_name FROM customer
		WHERE sales.customer_id = customer.customer_id)
FROM sales
ORDER BY customer_id DESC;
			-- La subconsulta no sirve por si sola, se tiene que ejecutar toda la query para que no lanze error

SELECT * FROM logistica


SELECT UPPER('wtw'), LOWER('WTW'), LENGTH('WTW');

SELECT REPLACE('SRM','S','F') -- A big challenge

SELECT TRIM(LEADING 'A' FROM 'AAASoy Carlos');
SELECT TRIM(TRAILING 'ZZZ' FROM 'Soy CarlosZZZ');

SELECT LTRIM('AAASoy Carlos','A');
SELECT RTRIM('Soy CarlosZZZ', 'Z'); -- Same as REPLACE, we first put the text that we want to change


SELECT  DISTINCT(a.customer_name) || ' tiene ' || a.age ||' años y su ID es: '	|| b.customer_id
FROM customer AS a
INNER JOIN sales AS b
ON a.customer_id=b.customer_id;

SELECT * FROM product;
SELECT * FROM customer;
SELECT * FROM sales;


SELECT product_id, category, 
UPPER(SUBSTRING(category FOR 3)) AS code1,
UPPER( SUBSTRING(sub_category FOR 2))AS code2
FROM product
ORDER BY code1 DESC;

SELECT state, STRING_AGG(customer_id,', ')
FROM customer
GROUP BY state;

SELECT sales, discount,profit, 
TO_CHAR(sales, '$9999.99')
FROM sales;
			-- We could delete the blank spaces with TRIM(LEADING ___)

SELECT * FROM customer;

CREATE TABLE customer_18_30 AS
SELECT customer_id, customer_name, segment, age 
FROM customer
WHERE age>=18 AND age<=30;

SELECT * FROM customer_18_30;


SELECT sales, quantity,
CASE 
	WHEN quantity>1 THEN sales/quantity
	ELSE quantity/sales
END AS "Cuentas"
FROM sales;

-- 
SELECT * FROM customer;

SELECT CONCAT(customer_id, ' ', customer_name) FROM customer; -- CONCAT

SELECT '09/02/1970';
SELECT CAST('09/02/1970' AS DATE);
SELECT CAST(CAST('06/08/2023'AS DATE)  - CAST('11/03/2023'AS DATE) AS INT);

SELECT * FROM sales 
WHERE sales<ALL(
	SELECT sales FROM sales
	WHERE quantity>5); -- Estamos diciendo que las "sales" deben ser menor que CUALQUIERA (ALL)		
					   -- que aparece en el segundo SELECT, entonces toma el minimo


	