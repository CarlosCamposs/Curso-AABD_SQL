/* Las condiciones de las tablas hacen referencia a poner cosas como no se permite valores
repetidos, vacios, etc. */

/* Como queremos crear una tabla en la base de datos "entrenamiento" por eso
hemos creado este script*/

CREATE TABLE prueba(
col1 int PRIMARY KEY,
	col2 char(2) NOT NULL,
	col3 char,
	col4 int UNIQUE
);

/* Para visualizar la tabla*/
SELECT * FROM prueba;

/*	ERORRES COMUNES	*/

/* Error 1*/
INSERT INTO prueba(col1)
VALUES (2);

/* Uno pensaría que en la col1 ponga un "2" en el primer registro, pero así no funciona, SQL
piensa en meter valores en todo el renglón*/

/* Entonces piensa que el dato "2" se mete en la primera columna y los demás son null, pero
pusimos la restricción en la col2 que no se permitia valores nulos en la columna*/


/* Error 2*/
INSERT INTO prueba(col1, col2)
VALUES (2,’abc’);

/*Como no aparece col3 y col4, SQL asume que van vacías*/
/* Aquí el error está en la condición de la col2, era char(2)*/


/* Error 3*/
INSERT INTO prueba(col1,col2)
VALUES(2,'ab','abc');

/* Aquí el error es que no se especificó col3*/

/* FORMATO CORRECTO*/
INSERT INTO prueba(col1,col2,col3)
VALUES(2,'ab','a');
SELECT * FROM prueba;

/* Esto agrega otro registro (fila) a la tabla*/
INSERT INTO prueba(col1,col3,col2)
VALUES(4,'a','ab');
SELECT * FROM prueba;

