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
SELECT * FROM customer;

