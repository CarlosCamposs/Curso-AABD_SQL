
/* #################################### */
/* #################################### */
/* #################################### */
-- Sesión 08 (C08)

-- Subconsulta con WHERE

-- Primero haremos el problema con lo que aprendimos con los JOIN

SELECT * FROM sales LIMIT 5;
SELECT * FROM customer LIMIT 5;

-- Una opción es esta
SELECT * FROM sales 
INNER JOIN customer 
ON sales.customer_id=customer.customer_id
WHERE age>60;

-- Otra opción
CREATE TABLE customer_60 AS
SELECT customer_id, names_id FROM custome WHERE age>60;
-- y luego hacer un LEFT JOIN donde la tabla de la izquierda sea sales y la tabla de la derecha sea esta nueva
-- De esta forma lograría traerme los nombres de los clientes cuya edad es mayor a 60 a la tabla de sales

-- Usando subconsultas sería de la siguiente forma


SELECT *
FROM sales
WHERE customer_id IN
	(SELECT DISTINCT customer_id
	FROM customer
	WHERE age>60);
-- Recordar que cuando ponemos un condicional IN el resultado devolverá todos aquelllos registros cuyo customer_id coincida
-- con los valores que están dentro del IN
-- Este método es equivalente a la primera opción que puse

/* #################################### */
/* #################################### */
/* #################################### */
-- Subconsulta con FROM


SELECT
	a.product_id,
	a.product_name,
	a.category,
	b.cantidad
FROM product AS a
	LEFT JOIN -- Aqui pudimos haber puesto un INNER JOIN y hubiera dado el mismo resultado
		(SELECT product_id, SUM(quantity) AS cantidad FROM sales
		GROUP BY product_id) AS b
	ON a.product_id = b.product_id
ORDER BY cantidad DESC;


/* #################################### */
/* #################################### */
/* #################################### */
-- Subconsulta con SELECT

SELECT
	customer_id, -- Primera columna
	order_id, -- Segunda columna
	(SELECT customer_name FROM customer
	WHERE sales.customer_id = customer.customer_id) --Tercera columna
FROM sales
ORDER BY customer_id DESC;




/* #################################### */
/* #################################### */
/* #################################### */
-- C10. Vistas


CREATE VIEW logistica AS
	SELECT
	a.order_line,
	b.customer_id,
	b.customer_name,
	b.city,
	b.state,
	b.country
	FROM sales AS a
		LEFT JOIN customer AS b
		ON a.customer_id = b.customer_id
	ORDER BY a.order_line;

-- Los resultados de crear una VIEW se pueden ver en la parte de Schemas --> Views
-- o poniendo el siguiente comando

SELECT * FROM logistica;
-- Se llaman como si fueran tablas

DROP VIEW logistica;



