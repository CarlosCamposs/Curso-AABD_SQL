/* En postgreSQL no hay problema si no ponemos la identación (sangrias) como en Python*/

CREATE TABLE tabla_clientes(
	Id_cliente int,
	Nombre varchar,
	Apellido varchar,
	Edad int,
	correo varchar
); /* Todo esto es como una línea de códdigo, la finalizamos con ; */


/* Esto es una instrucción que se explicará más adelante y nos permite visualizar el 
contenido de la tabla*/
								SELECT * FROM tabla_clientes;

INSERT INTO tabla_clientes
VALUES(1,'Cintia','Cee',32,'ab@xyz.com');
SELECT * FROM tabla_clientes;
/* Si no ponemos el nombre de las columnas, SQL asume el orden que nosotros pusimos
a la tablal por lo que
1 corresponde a id_client
Cintia corresponde a nombre
....
*/
								
INSERT INTO tabla_clientes(Id_cliente, Nombre, Edad, correo)
VALUES (2, 'Diana', 22, 'd@xyz.com');
SELECT * FROM tabla_clientes;
/*Aqui estamos dejando vacio el apellido*/

INSERT INTO tabla_clientes
VALUES (3, 'Euclides', 'Ef', 27, 'ef@xyz.com'), (4, 'Gabriela', 'Eh', 35, 'gh@xyz.com');
SELECT * FROM tabla_clientes;
/*Aquí estamos agregando varios registros
Note que se agregan los VALUES como si fueran vectores*/


/*Importar tablas*/
					/*A donde quiero añadir los renglones*/
COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo) 
FROM 'C:\Users\Carlos Campos\Desktop\SciData\SQL\data\copy.csv'
DELIMITER ',' CSV HEADER;

/*Abrimos el archivo y vimos que los datos estaban delimitados por "," pero también
pudo ser con | o con tabulador*/

/*CSV HEADER indica que el archivo tiene encabezados, esto es exclusivo para archivos CSV*/

/*Esto marca error porque el archivo lo debemos guardar en la "parte pública" de nuestra
computadora, para esto abirmos un "Explorador de archivos" y en la ruta ponemos:
									C:\Users
En "Acceso público" es donde nos va a permitir leer los documentos*/


COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo) 
FROM 'C:\Users\Public\Documents\aabd_sql2021\copy.csv'
DELIMITER ',' CSV HEADER;
/* Esta ya es la forma correcta de leer el arhcivo CSV*/


COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo)
FROM 'C:\Users\Public\Documents\aabd_sql2021\copytext.txt'
DELIMITER ',' ;
SELECT * FROM tabla_clientes;
/* Leemos el archivo .txt*/

/* Notemos que el nombre de las columnas de la tabla que cree (tabla_clientes) no coincide con el
nombre de las columnas del archivo .csv o .txt, eso NO causa conflicto, lo único que estoy diciendo
es que la información me la copie a la tabla que yo cree, lo que SÍ importa es la condición que le
damos a las columnas */


/* Si no nos queremos meter en problemas con la declaración del tipo de variable que se permite en cada
columna podemos declararla como varchar y luego hacer el cambio que necesitemos*/

/*############################################################*/
/*############################################################*/
/*############################################################*/

SELECT Nombre FROM tabla_clientes;

SELECT Nombre, Apellido FROM tabla_clientes;

SELECT * FROM tabla_clientes;

/*############################################################*/
/*############################################################*/
/*############################################################*/

SELECT DISTINCT Nombre FROM tabla_clientes;

SELECT DISTINCT Nombre,Edad FROM tabla_clientes;

COPY tabla_clientes(Id_cliente, Nombre, Apellido, Edad, correo) 
FROM 'C:\Users\Public\Documents\aabd_sql2021\copy.csv'
DELIMITER ',' CSV HEADER;
SELECT * FROM tabla_clientes;
/*Aqui nada mas hemos agregado nuevamente los valores que aparecen en el archivo .csv, es decir,
los hemos repetido y ahora tenemos 10 registros donde el 9 y 10 son copia del 5 y 6 respectivamente*/

SELECT DISTINCT * FROM tabla_clientes;
/*Esto nos va a mostrar todos los registros(renglones) que no son repetidos considerando todas las columnas*/


/*############################################################*/
/*############################################################*/
/*############################################################*/
SELECT * FROM tabla_clientes;  		/*Tiene 10 registros*/

SELECT COUNT (*) FROM tabla_clientes;  /*Cuenta el número de renglones que tiene la tabla*/

SELECT Nombre FROM tabla_clientes WHERE edad=25;
/*Aparece 3 veces Gabriela*/
SELECT DISTINCT Nombre FROM tabla_clientes WHERE edad=25;
/*Solo una vez aparece*/

SELECT Nombre, edad FROM tabla_clientes WHERE edad>25;

SELECT * FROM tabla_clientes WHERE Nombre='Gabriela'; 
/*Los datos de tipo texto van con comilla simple*/

/*############################################################*/
/*############################################################*/
/*############################################################*/

SELECT nombre,apellido, edad FROM tabla_clientes WHERE edad>20 AND edad<30;

SELECT nombre, apellido, edad FROM tabla_clientes WHERE (edad <=25 OR edad >30) AND nombre='Gabriela'; 

SELECT nombre, apellido, edad FROM tabla_clientes WHERE (edad<=25)OR(edad<30 AND nombre='Gabriela');

SELECT nombre,apellido, edad FROM tabla_clientes WHERE NOT(edad=25);
/*Con esto tomamos aquellos que NO tienen edad=25, también se puede hacer con !=*/
SELECT nombre,apellido, edad FROM tabla_clientes WHERE edad!=25;



SELECT nombre,apellido, edad FROM tabla_clientes WHERE NOT edad=25 AND NOT nombre='Jacobo';
SELECT nombre,apellido, edad FROM tabla_clientes WHERE NOT (edad=25 OR nombre='Jacobo'); /*Da lo mismo*/

/* Un error hubiera sido poner esto */
SELECT nombre,apellido, edad FROM tabla_clientes WHERE NOT(edad=25 AND nombre='Jacobo');
/*Puesto que por Leyes de DeMorgan (AnB)'=A'UB' */

/*############################################################*/
/*############################################################*/
/*############################################################*/
/*Actualizaciones*/

SELECT * FROM tabla_clientes;

UPDATE tabla_clientes SET Apellido='Pe', Edad=17 WHERE Id_cliente=2;
SELECT * FROM tabla_clientes;
/*SQL actualizó el dato pero no lo deja en la posición 2, lo pasó a la última*/

UPDATE tabla_clientes SET correo='gee@xyz.com' WHERE nombre='Gabriela' OR nombre='gabriela';
SELECT * FROM tabla_clientes;

UPDATE tabla_clientes SET correo='gee@xyz.com';
SELECT * FROM tabla_clientes;





DELETE FROM tabla_clientes WHERE id_cliente=6;
SELECT * FROM tabla_clientes;

DELETE FROM tabla_clientes WHERE edad>25;
SELECT * FROM tabla_clientes;

DELETE FROM tabla_clientes;
/* Borra los datos, la tabla sigue existiendo en "Tables" dentro de "Schemas" */
