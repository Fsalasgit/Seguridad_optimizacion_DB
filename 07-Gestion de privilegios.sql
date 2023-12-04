/*Acediendo desde cualquier servidor*/

			#Creando usuario administrador desde cualquier IP
CREATE USER 'admingeneric02'@'%' IDENTIFIED BY 'admingeneric02';
#PRIVILEGIOS DE USUARIO ADMIN ALL
GRANT ALL PRIVILEGES ON *.* TO 'admingeneric02'@'%' WITH GRANT OPTION;


#Limitando acceso a algunos schemas

CREATE USER 'user04'@'%' IDENTIFIED BY 'user04';
#PRIVILEGIOS DE USUARIO user solamente a jugos_ventas
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON jugos_ventas.* TO 'user04'@'%';


CREATE USER 'user05'@'%' IDENTIFIED BY 'user05';
#PRIVILEGIOS DE USUARIO user solamente a jugos_ventas
GRANT SELECT, INSERT, UPDATE, DELETE ON jugos_ventas.facturas TO 'user05'@'%';
GRANT SELECT ON jugos_ventas.tabla_de_vendedores TO 'user05'@'%';

/*Tambien se puede revocar los privilegios*/

#vemos lo privilegios
SELECT * FROM mysql.user;


SHOW GRANTS FOR 'user02'@'localhost';

REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user02'@'localhost';
#SALE SIN PRIVILEGIOS
SHOW GRANTS FOR 'user02'@'localhost';

