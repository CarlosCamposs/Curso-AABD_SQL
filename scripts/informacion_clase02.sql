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

