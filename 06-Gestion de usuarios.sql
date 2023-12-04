/*
 Por defecto workbecn crea el usuario root. Es necesario crear primero un usuario admin
 y luego eliminarlo, de matera que el DB(amin) solo tenga todos los permisos.
*/


			#Creando usuario administrador
CREATE USER 'admin02'@'localhost' IDENTIFIED BY 'admin02';
#PRIVILEGIOS DE USUARIO ADMIN ALL
GRANT ALL PRIVILEGES ON *.* TO 'admin02'@'localhost' WITH GRANT OPTION;

			#Creando usuarios comunes
CREATE USER 'user02'@'localhost' IDENTIFIED BY 'user02';
#PRIVILEGIOS DE USUARIO user
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE ON *.* TO 'user02'@'localhost';

			#Creando usuarios de solo lectura
CREATE USER 'read01'@'localhost' IDENTIFIED BY 'read01';
#PRIVILEGIOS DE USUARIO lectura y execute
GRANT SELECT, EXECUTE ON *.* TO 'read01'@'localhost';
#Si el store procedure tiene insert o delete el usuario puede insertar o modificiar las bases

			#Creando usuarios para backup
CREATE USER 'backup01'@'localhost' IDENTIFIED BY 'backup01';
#PRIVILEGIOS DE USUARIO QUE HACE SOLO BACKUP
GRANT SELECT, RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'backup01'@'localhost';




