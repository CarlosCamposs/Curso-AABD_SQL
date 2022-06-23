-- C11. Funciones de tipo caracter
-- Esto se refiere a qué cosas podemos hacer con los datos de tipo caracter

/* ######################################## */
/* ######################################## */
/* ######################################## */
-- LENGTH

SELECT LENGTH('hola');

SELECT customer_name, LENGTH(customer_name) AS caracteres
FROM customer
WHERE age > 30;
-- Con esto podemos ver que LENGTH es una función vectorizada

SELECT customer_name AS "nombres largos"
FROM customer
WHERE LENGTH(customer_name) > 10; -- Aqui lo estamos usando como filtro


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- UPPER y LOWER

SELECT UPPER('Yo soy Popeye');

SELECT customer_name,
UPPER(customer_name) AS Mayuscula, LOWER(customer_name) AS Minuscula
FROM customer
WHERE age > 30; -- En este ejemplo usamos un vector


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- REPLACE

SELECT REPLACE('Yo soy Popeye','soy','quiero ser');


SELECT customer_name, country,
REPLACE(country,'United States','US') AS "country new" -- Nueva columna
FROM customer; --Versión vectorizada


SELECT customer_name, country,
REPLACE(LOWER(country),'united states','US') AS "country new"
FROM customer;


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- TRIM, LTRIM, RTRIM

SELECT TRIM(LEADING 'A'FROM 'AAA Yo soy Popeye BB');
-- LEADING es para decir que quiero que busque desde izq a derecha
-- Luego se pone qué quiero que busque
-- FROM y el texto en donde quiero que busque
-- y todo esto lo va a hacer para eliminarla (por eso es TRIM, esto hace que lo borre)

-- Como dice que "elimina la cadena máxima" entonces va a eliminar las 3 "A", no elimina de uno en uno
-- No mata a los espacios

SELECT TRIM(TRAILING 'B' FROM 'AAA Yo soy Popeye BB');
-- Borra la B desde derecha, pero todas las B

SELECT TRIM(BOTH ' ' FROM ' Yo soy Popeye BB ');
-- Borra del lado izquierdo Y del lado derecho

SELECT LTRIM(' Yo soy Popeye ',' ');
-- Busca los espacios a la izquierda y los va a borrar

SELECT RTRIM(' Yo soy Popeye ',' ');
-- Busca los espacios a la derecha y los borra

/* ######################################## */
/* ######################################## */
/* ######################################## */
-- OPERADOR DE CONCATENACIÓN

SELECT customer_name, city||', '||state||', '||country AS direccion
FROM customer;

SELECT* FROM product;

SELECT product_id ||' es un ' || product_name AS "Descripción humana"
FROM product;

/* ######################################## */
/* ######################################## */
/* ######################################## */
-- SUBSTRING

SELECT SUBSTRING('Este es un texto' FROM 1 FOR 3);
--Devuelve Est

SELECT customer_id,customer_name,
SUBSTRING(customer_id FOR 2) AS cust_grupo
FROM customer
WHERE SUBSTRING(customer_id FOR 2) = 'AB';
-- Si no ponemos FROM asumirá que va desde 1

SELECT customer_id, customer_name,
SUBSTRING(customer_id FROM 4 FOR 5) AS cust_numero
FROM customer
WHERE SUBSTRING(customer_id FOR 2) = 'AB';

/* ######################################## */
/* ######################################## */
/* ######################################## */
-- CONCATENACIÓN CON LIMITADORES

SELECT STRING_AGG(product_id,', ') from sales;
-- En un solo registro concatena todos los valores de product_id con una coma y espacio


SELECT order_id, STRING_AGG(product_id,', ')
FROM sales
GROUP BY order_id;
-- Por cada uno de los order_id nos va a mostrar los product_id que tienen ese mismo valor de order_id pero
-- los va a mostrar concatenados por una coma y espacio

SELECT state, STRING_AGG(customer_id,', ') AS "Id del cliente"
FROM customer
GROUP BY state;

-- Otro ejemplo
-- Una tabla con dos columans donde la primera columna sea el estado y la segunda sean las ciudades
SELECT * FROM customer;

SELECT state, STRING_AGG(city, ', ') 
FROM customer
GROUP BY state;
-- Hay que quitar los valores repetidos, por eso de pone el DISTINCT
SELECT state, STRING_AGG(DISTINCT city, ', ') 
FROM customer
GROUP BY state;


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- C12. Funciones matemáticas


-- Piso y techo

SELECT FLOOR(3.4);
SELECT CEIL(3.4);

SELECT * FROM sales LIMIT 10;

SELECT order_line, sales, FLOOR(sales) AS "Función piso", CEIL(sales) AS "Función techo"
FROM sales
WHERE discount > 0;


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- RANDOM


SELECT random();

SELECT RANDOM() AS "Entre cero y uno", RANDOM()*(50-10)+10 AS "Entre 10 y 50",
FLOOR(RANDOM()*(50-10+1))+10 AS "Entre 10 y 50 pero entero";


SELECT FLOOR(RANDOM()*6)+1; -- Genero números aleatorios entre 1 y 6, como si tirada un dado


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- SETSEED

SELECT SETSEED(0.4); -- El argumento debe estar entre -1 y 1
SELECT RANDOM(), RANDOM(), RANDOM(); 
-- Cuando fijamos una semilla y ejecutamos el código en conjunto (las dos lineas) lanzará el mismo número aleatorio
-- Si solo ejecutamos la segunda linea, generará otro número aleatorio


SELECT SETSEED(0.5);
SELECT RANDOM() , RANDOM()*(50-10)+10, FLOOR(RANDOM()*(50-10+1))+10;


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- ROUND

SELECT order_line, sales, ROUND(sales),ROUND(sales,2)
FROM sales;


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- POWER

SELECT POWER(6,2), POWER(4,0.5);

SELECT age, POWER(age,2)
FROM customer ORDER BY age;


/* ######################################## */
/* ######################################## */
/* ######################################## */
-- C13. Funciones de fecha


-- 	Fecha y hora actuales
SELECT CURRENT_DATE, CURRENT_TIME, CURRENT_TIME(3), CURRENT_TIMESTAMP, CURRENT_TIMESTAMP(3);


