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
	
/*Importamos los datos*/
COPY customer FROM 'C:\Users\Public\Documents\aabd_sql2021\Customer.csv' DELIMITER ',' CSV HEADER;
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
SELECT DISTINCT segment FROM customer WHERE city IN ('Philadelphia', 'Seattle') AND segment IN ('Corporate');


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

COPY sales FROM 'C:\Users\Public\Documents\aabd_sql2021\Sales.csv' DELIMITER ',' CSV HEADER;
COPY product FROM 'C:\Users\Public\Documents\aabd_sql2021\Product.csv' DELIMITER ',' CSV HEADER;

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
ORDER BY nombre;


/* ####################################################*/
/* ####################################################*/
/* ####################################################*/
/* COUNT */

SELECT COUNT (*) FROM sales;

SELECT COUNT(order_line) AS ”Número de productos que se ordenaron”, 
COUNT(DISTINCT order_id) AS ”Número de órdenes distintas”
FROM sales WHERE customer_id = 'CG-12520';


