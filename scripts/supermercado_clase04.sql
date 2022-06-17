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







/* Esto lo trabajaremos más adelante
/*Creamos la tabla para importar los datos de sales.csv*/
CREATE TABLE sales(Order_Line,
				   Order_ID,
				   Order_Date,
				   Ship_Date,
				   Ship_Mode,
				   Customer_ID,
				   Product_ID,
				   Sales,
				   Quantity,
				   Discount,
				   Profit);
*/