/* ################################# */
/* ################################# */
/* ################################# */
-- Sesión 11

-- Creación de usuarios
CREATE USER popeye WITH PASSWORD 'abcde';

-- Control de usuarios

GRANT SELECT, INSERT, UPDATE, DELETE ON product TO popeye;

GRANT ALL ON product TO popeye;

GRANT CREATE ON DATABASE supermercado TO popeye;

-- Renombrar usuarios

ALTER USER popeye RENAME TO  bruto;


-- Actividades de los usuarios

SELECT usename FROM pg_user;

SELECT * FROM pg_user;

-- Para ver las actividades de todos los usuarios
SELECT * FROM pg_stat_activity;

-- Eliminar usuarios

-- Para eliminar un usuario es necesario quitarle los privilegios primero, ahorita vamos a ver qué pasa
-- cuando no se los quitamos
DROP USER bruto;

REVOKE ALL ON product FROM bruto;

-- Para quitar privilegios sobre una base de datos se hace lo siguiente
-- Base de datos > Click derecho > Properties > Security > Eliminar al usuario con el icono
DROP USER bruto;
