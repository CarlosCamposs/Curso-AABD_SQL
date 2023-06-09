/*Creamos la tabla para guardar los datos del archivo customer.csv*/
CREATE TABLE customer(
	Customer_ID varchar,
	Customer_Name varchar,
	Segment varchar,
	Age int,
	Country varchar,
	City varchar,
	State varchar, /*State es una palabra reservada pero no va a molestar al código, porque no estamos renombrando cosas*/ 
	Postal_Code int,
	Region varchar);
	
SELECT * FROM customer;

/*Importamos los datos*/
COPY customer FROM 'C:\Users\Public\Documents\aabd_sql_2021\Customer.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM customer;

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* IN */

/*Muestra aquellos registros que tienen en city Phil, Seat*/
SELECT * FROM customer WHERE city IN ('Philadelphia', 'Seattle');
SELECT * FROM customer WHERE city='Philadelphia' OR city='Seattle'; /*Otra forma menos eficiente*/

/*Selecciona los city distinct de customer donde city sea phil, seat*/
SELECT DISTINCT city FROM customer WHERE city IN ('Philadelphia', 'Seattle');





SELECT * FROM customer WHERE city IN ('Philadelphia', 'Seattle') AND segment IN ('Corporate');

/*Comprobación que solo me agarra segment=corporate*/
SELECT * FROM customer WHERE city IN ('Philadelphia', 'Seattle') AND segment='Corporate';


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* BETWEEN */
SELECT * FROM customer;


SELECT * FROM customer WHERE age BETWEEN 20 AND 30;
SELECT * FROM customer WHERE age>=20 AND age <=30; /*Forma menos eficiente*/

SELECT * FROM customer WHERE age NOT BETWEEN 20 AND 30;

/* Un ejemplo un poco más complejo */
SELECT * FROM customer WHERE (age NOT BETWEEN 20 AND 30) AND city IN ('Philadelphia', 'Los Angeles');

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* LIKE */


SELECT * FROM customer WHERE customer_name LIKE 'J%';

SELECT * FROM customer WHERE customer_name LIKE '%Nelson%'; 
/*No importa qué haya antes o qué haya después, quiero que aparezca Nelson, en alguna parte*/

SELECT * FROM customer WHERE customer_name LIKE '____ %';
/*Solo primer nombre con cuatro letras, ____ y luego un espacio*/

SELECT DISTINCT city FROM customer WHERE city NOT LIKE  'S%';

SELECT * FROM customer WHERE customer_name LIKE 'G\%%'; /*Como en LaTeX*/

SELECT * FROM customer WHERE customer_name LIKE 'David';
/*Aqui solo va a mostrar aquellos que únicamente se llaman David, sin apellidos*/

SELECT * FROM customer WHERE customer_name LIKE 'David %';
/*Aqui ya permitimos que se llame David y tenga cualquier apellido*/

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/*Sesión 05*/

/*Estas líneas de código se copiaron del archivo "script_sales_product_.txt" para empezar la clase*/

CREATE TABLE sales(Order_Line int Primary Key,
				   Order_ID varchar,
				   Order_Date date,
				   Ship_Date date,
				   Ship_Mode varchar,
				   Customer_ID varchar,
				   Product_ID varchar,
				   Sales numeric,
				   Quantity int,
				   Discount numeric,
				   Profit numeric);

CREATE TABLE product(product_id varchar PRIMARY KEY,
					 category varchar,
					 sub_category varchar,
					 product_name varchar);

COPY sales FROM 'C:\Users\Public\Documents\aabd_sql_2021\Sales.csv' DELIMITER ',' CSV HEADER;
COPY product FROM 'C:\Users\Public\Documents\aabd_sql_2021\Product.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM sales;
SELECT * FROM product;
/*A partir de aqui ya empezamos a programar*/

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* ORDER BY */

SELECT * FROM customer;

SELECT * FROM customer WHERE state='California' ORDER BY customer_name ASC;

SELECT * FROM customer WHERE state='California' ORDER BY customer_name DESC;

SELECT * FROM customer WHERE age >25
ORDER BY city ASC, customer_name DESC;
/*Aqui lo que estamos diciendo es que cuando encuentre empates entre CIUDAD los desempatará con el nombre
de forma descendiente*/

SELECT * FROM customer ORDER BY age;


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* LIMIT */

SELECT * FROM customer WHERE age>=25 ORDER BY age DESC LIMIT 8;

SELECT * FROM customer WHERE age>=25 ORDER BY age ASC LIMIT 10;

/*Estos resultados que vamos obteniendo NO son una tabla como tal, solo tenemos 3 tablas
									customers, product, sales
Estos outputs que resultan del SELECT se llaman "query" */

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* AS */

SELECT customer_id AS "Num de cliente", customer_name AS nombre, age AS "Edad_cliente" 
/*Todo esto es una query, le podemos poner todo lo que ya sabemos hacer*/
FROM customer
ORDER BY nombre; /*Es el nuevo nombre de la columna*/


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* COUNT */

SELECT COUNT (*) FROM sales;

SELECT COUNT(order_line) AS ”Número de productos que se ordenaron”, /*Cuenta el NÚMERO DE RENGLONES, no los valores en los renglones*/
COUNT(DISTINCT order_id) AS ”Número de órdenes distintas”
FROM sales WHERE customer_id = 'CG-12520';

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* SUM */
SELECT * FROM sales;

SELECT SUM(profit) AS "Total de ganancia" FROM sales;


SELECT * FROM product;
/*Buscamos cual es el product_id del artículo para buscarlo después en la tabla de sales*/
SELECT product_id AS "Identificador del producto" FROM product WHERE product_name='Bretford CR4500 Series Slim Rectangular Table';
SELECT SUM(quantity) AS "Cantidad Total" FROM sales WHERE product_id='FUR-TA-10000577';
/*product_id=FUR-TA-10000577 se sacó de la tabla product*/

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* (AVG) */
 
SELECT * FROM customer;  
SELECT AVG(age) AS "Promedio de edad" FROM customer;

SELECT * FROM sales;
SELECT AVG(sales*0.10) AS "Comisión promedio por venta" FROM sales;
/*Para cada uno de los registros de la columan "sales" se calcula el 10%, por lo que podriamos pensar en tener una columna
cuyas registros sean el 10% de cada una de las ventas, y nosotros estamos interesados en conocer el PROMEDIO de eso*/

/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* MIN y MAX */

SELECT * FROM sales LIMIT 10;

SELECT MIN(sales) AS "Mínimo de ventas en junio" FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) AS "Máximo de ventas en junio" FROM sales WHERE order_date BETWEEN '2015-06-01' AND '2015-06-30';

SELECT MAX(sales) AS "Mayor ingreso" FROM sales WHERE order_date BETWEEN '2015-01-01' AND '2015-12-31';
/*En esta primera query estamos hallando cual fue el mayor ingreso en 2015*/
SELECT order_date AS "Fecha mayor ingreso" FROM sales WHERE sales=6354.95;
/*En esta segunda consulta ya vemos cuál es la fecha en la que ocurrio esta máxima sale*/
/*IMPORTANTE:
Aqui estamos especificando el valor en la que se obtuvo el MAX(sales) pero si justamente hubiera coincidio
que en otra fecha se alcanzó el MISMO MÁXIMO, hubieran aparecido las dos fechas, por lo que en la sentencia WHERE
es necesario poner dos condiciones
1) Que la fecha esté entre 01 enero 2015 y 31 diciembre 2015 
2) sales=6345.95*/


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* SESIÓN 06 */



/*GROUP BY*/
SELECT * FROM customer LIMIT 10;

SELECT COUNT(*) FROM customer WHERE region='South';
SELECT COUNT(*) FROM customer WHERE region='West';
/* El GROUPBY nos permite no estar haciendo para cada uno de los region*/

SELECT region AS "Región", 
COUNT(customer_id) AS "Total de clientes" 
/*Con esto digo que me muestre solo dos columnas, una llamada Región y otra Total de clientes
y luego que los GROUPBY por region*/
FROM customer
GROUP BY region;


SELECT * FROM sales LIMIT 10;

SELECT product_id AS "Productos vendidos",
SUM(quantity) AS Cantidad
FROM sales
GROUP BY product_id ORDER BY Cantidad DESC;



SELECT * FROM customer LIMIT 10;

SELECT region AS "Región", state AS "Estado", /*Notar que aqui estamos diciendo que se quede con 2 Y LUEGO viene una coma*/
COUNT(customer_id) AS "Número de clientes", AVG(age) AS "Promedio de edad"
FROM customer
GROUP BY region,state ;



SELECT * FROM sales LIMIT 10;

SELECT customer_id AS "Nombre del cliente", 
MIN(sales) AS "Mínimo", MAX(sales) AS "Máximo", AVG(sales) AS "Promedio", SUM(sales) AS Total_de_ingresos_por_cliente
FROM sales
GROUP BY customer_id
ORDER BY Total_de_ingresos_por_cliente DESC
LIMIT 5;


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* HAVING */

SELECT * FROM customer LIMIT 5;

SELECT region AS "Regiones", 
COUNT(customer_id) AS "Número de clientes" /*Función de agregación*/
FROM customer
GROUP BY region  /*Hasta aqui es lo mismo que lo visto en la sentencia GROUP BY*/
HAVING COUNT(customer_id)>200;



SELECT region AS "Región",
COUNT(customer_id) AS "Total de clientes" /*Función de agregación, a esta se le aplica HAVING*/
FROM customer
WHERE customer_name LIKE 'A%' 
GROUP BY region
/*Hasta aqui hacemos un GROUPBY mostrando en cada una de las regiones el total de registros que tienen por inicial A*/
HAVING COUNT(customer_id) BETWEEN 15 AND 20;
/* 15 <= COUNT(customer_id) <= 20*/


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/*C06 CONDICIONALES*/

/*CASE*/

SELECT *, CASE
WHEN age < 30 THEN 'Joven'
WHEN age > 60 THEN 'Mayor'
ELSE 'Medio'
END AS "Categoría de edad" 
FROM customer;
/*Como seleccionamos toda la tabla, estamos diciendo que nos muestre toda la tabla Y además la columna del alias que creamos
(eso hacia el alias, al final solo nos mostraba las columnas que le habiamos puesto un alias, pero como pusimos SELECT*
pues ahora también nos muestra todas las demás columnas) 
IMPORTANTE
todo eso es una query, no es ninguna modificación a la tabla original*/

-- Así también se puede poner comentarios

--Para crear tablas se usa la siguiente sintaxis

-- CREATE TABLE nombre_de_la_tabla
-- AS
-- (código de la query que queremos guardar como tabla) ;

-- Y ahora que ya tenemos la tabla con la query que queriamos, podemos aplicar cualquier sentencia a las
-- columnas de esa nueva tabla


