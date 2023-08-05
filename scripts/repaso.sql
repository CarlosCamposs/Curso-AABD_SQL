
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



