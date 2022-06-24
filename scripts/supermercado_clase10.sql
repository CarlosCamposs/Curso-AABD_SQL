/* ###################################### */
/* ###################################### */
/* ###################################### */
-- C14.Patrones en textos

-- Búsqueda básica
-- Se usa LIKE o ILIKE (los comodines son dos;  _ y % )

-- Regex

-- Links
-- https://regex101.com/
--https://regex101.com/r/geGfa/1

SELECT * FROM customer
WHERE customer_name ~*'^a+[a-z\s]*$';

SELECT * FROM customer
WHERE customer_name ~*'^(a|b|c|d)+[a-z\s]+$';

SELECT * FROM customer
WHERE customer_name ~*'^(a|b|c|d)[a-z]{3}\s[a-z]{4}$';

-- El siguiente código se copió del scritp User_table.txt

-- Cuando ponemos id serial estamos diciendo que va a poner los números consecutivamente
create table users(id serial primary key, name character varying);
insert into users (name)
VALUES ('Alex'),
('Jon Snow'),
('Christopher'),
('Arya'),
('Luis Coronel'),
('Lolita'),
('alex@gmail.com'),
('@sandip5004'),
('juan@gmail.com');

SELECT * FROM users;

-- Muestra solo los registros que tienen correo electrónico
SELECT * FROM users
WHERE name ~*'^[a-z0-9\.\−\_]+@[a-z0-9\−]+\.[a-z]{2,5}$'


/* ###################################### */
/* ###################################### */
/* ###################################### */
-- C15. Conversiones en tipos de datos


SELECT sales, TO_CHAR(sales,'9999.99') -- En excel es equivalente a poner ####.##
FROM sales;
-- Esta truncando a dos decimales

SELECT sales, TO_CHAR(sales,'0999.99') -- En excel es equivalente a poner ####.##
FROM sales;
-- Al poner ese cero lo que estoy haciendo es que todos los números tengan longitud 4 (en su parte entera),
-- por lo que 14 aparecerá como 0014.85


SELECT sales, TO_CHAR(sales,'$9,999.99')
FROM sales; -- Estoy diciendo que el separador de miles sean comas y que ponga el signo de pesos

SELECT * FROM sales; -- Order_date aparece como YY-MM-DD

SELECT order_date, TO_CHAR(order_date,'MMDDYY')
FROM sales; -- Aqui estamos pidiendo que los escriba en mes, día y año

SELECT order_date, TO_CHAR(order_date,'Month DD, YY')
FROM sales;



/* ###################################### */
/* ###################################### */
/* ###################################### */
-- Conversión de texto a fecha

SELECT TO_DATE('2019/01/15','YYYY/MM/DD');

SELECT TO_DATE('26122018','DDMMYYYY');





