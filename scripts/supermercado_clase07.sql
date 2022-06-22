-- Este script es continuación del anterior cuyo nombre es supermercado_clase04.sql
-- pero decidí crear un nuevo script puesto que el anterior script ya tenía muchas líneas de código

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- C07 Joins
-- Estas líneas de código se copiaron del script creacion_tablas.txt para que sean usados en la Sesion07

CREATE TABLE sales_2015 AS SELECT * FROM sales WHERE ship_date BETWEEN '2015-01-01' AND '2015-12-31';
CREATE TABLE customer_20_60 AS SELECT * FROM customer WHERE age BETWEEN 20 and 60;
-- Recordar que después de crear tablas es necesario dar Refresh para que se actualice

-- Leemos las bases de datos para entender el problema
SELECT * FROM sales;
SELECT COUNT(*) FROM sales;

SELECT * FROM customer;
SELECT COUNT(*) FROM customer;

-- Sesión 07
/* ####################################### */
/* ####################################### */
/* ####################################### */
-- INNER JOIN

SELECT
A.order_line, --Así se puede hacer referencia a la columna order_line de la tabla
A.product_id,
A.customer_id,
A.sales,
B.customer_name,
B.age 				-- Todas estas columnas quiero que me muestre, algunas de la tabla A otras de la tabla B
FROM sales_2015 AS A --Con esto digo que a la tabla sales_2015 la llamamos A
INNER JOIN customer_20_60 AS B --Con esto digo que a la tabla customer_20_60 la llamamos B
ON A.customer_id = B.customer_id --Aqui es donde igualamos las columnas join
ORDER BY customer_id; --Aqui ya no es necesario poner "A." o "B.", puesto que las líneas anteriores ya me crean una tabla y ahora solo quiero que lo ordene

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- LEFT JOIN

SELECT
a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales_2015 AS a
LEFT JOIN customer_20_60 AS b
ON a.customer_id = b.customer_id
ORDER BY customer_id;

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- RIGHT JOIN

SELECT
a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales_2015 AS a
RIGHT JOIN customer_20_60 AS b
ON a.customer_id = b.customer_id
ORDER BY customer_id;

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- FULL JOIN

SELECT
a.order_line,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
FROM sales_2015 AS a
FULL JOIN customer_20_60 AS b
ON a.customer_id = b.customer_id
ORDER BY a.customer_id, b.customer_id;

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- CROSS JOINT

CREATE TABLE month(MM int);
CREATE TABLE year(YYYY int);

INSERT INTO month
VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

INSERT INTO year
VALUES (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019),(2020),(2021);
-- Estas líneas de código se sacaron del script: script_ejemplos_combinar.txt


SELECT 
a.YYYY,
b.MM 
FROM year AS a, month AS b;

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- C08 Búsquedas combinadas 

-- Estas líneas de código se sacaron del script: script_ejemplos_combinar.txt}

create table A(col1A char(1),col2A varchar);
create table B(col1B char(1),col2B varchar);

insert into A values ('A','dato A'),('B','dato B'),('C','dato C'),('D','dato D'),('C','dato C');
insert into B values ('C','s'),('C','dato C'),('F','u'),('C','dato C'),('G','v'),('C','dato C');

SELECT * FROM A;
SELECT * FROM B; -- Son las mismas tablas que aparecen en la diapositiva


-- INTERSECT
CREATE TABLE interseccion AS
SELECT * from A
INTERSECT
SELECT * FROM B;

SELECT * FROM interseccion;

-- INTERSECT ALL
SELECT * FROM A
INTERSECT ALL
SELECT * FROM B;

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- EXCEPT

CREATE TABLE resta AS
SELECT * FROM A
EXCEPT
SELECT * FROM B;

SELECT * FROM resta;

/* ####################################### */
/* ####################################### */
/* ####################################### */
-- UNION

CREATE TABLE _union AS
SELECT * FROM A
UNION
SELECT * FROM B;

SELECT * FROM _union;


-- UNION ALL
SELECT * FROM A
UNION ALL
SELECT * FROM B;

































































