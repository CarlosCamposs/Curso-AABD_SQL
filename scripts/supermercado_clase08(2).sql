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





