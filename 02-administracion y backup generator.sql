/*Usando mecanismos de almacenamiento*/

CREATE TABLE df_table(ID INT, NOMBRE VARCHAR(100)); #Por defecto la crea innoDB

ALTER TABLE df_table ENGINE = MyISAM; #La convertimos con el mecanismo de almacenamiento MyISAM

CREATE TABLE df_table1 (ID INT, NOMBRE VARCHAR(100)) ENGINE = MEMORY;

SHOW ENGINES; #Vemos un resumen de los mecanismos de almacenamientos

/*Creacion de base de datos */

CREATE DATABASE base; #Tambien se puede usar el asistente haciendo click con el secundario y create schema

/*Cambiando el directorio de la base de datos*/

SHOW VARIABLES WHERE variable_Name LIKE '%dir';

/*Supongamos que se lleno el disco y deso cambuarlo a otro lugar

1-creamos carpeta de destino
2-Cambiar el Path to the database root : datadi=c:/...
3-cambiar el nuevo pah
4-copiar el Data y pegar en el nuevo directorio en la base del program Data
4-ir a servicios de windows. parar el sistema y reinicializar

*/

SHOW VARIABLES WHERE variable_Name LIKE '%dir'; #me muestra las variables en un nuevo directorio.

DROP DATABASE base; 
DROP DATABASE base2; 

/*Back up con mysqldump

https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html

mysqldump -uroot -p(para que luego pida la contraseña) --databases jugos_ventas > c:\sqlDBA\jugos_ventas_full.sql

ignora archivo:

mysqldump -uroot -p --databases jugos_ventas --ignore-table jugos_ventas.facturas > c:\sqlDBA\jugos_ventas_sin_factras.sql
*/


USE jugos_ventas;

/*Ejemplo de backup con Workbench

Ventaja que es mas sencillo pero no podemos hacer que se ejecute de manera autonoma
*/

LOCK INSTANCE FOR BACKUP; #Con esto nadie puede hacer nada en la base de datos

UNLOCK INSTANCE; #Habilita la conexión

/*
Back up físico
Es el mejor modo, pero es necesario saber que exportamos todos los archivos de la base de datos (backup completo
*/


LOCK INSTANCE FOR BACKUP; #Con esto nadie puede hacer nada en la base de datos

UNLOCK INSTANCE; #Habilita la conexión

/*El desempeño para restaurar sera mas rapido, pero si no se hace un mantenimiento coherente a los discos,
hay posibilidad de que se corrompa uno de estos archivos binarios.
¿Cual es el mejor backup?
La recomendacion es hacer los 2, preparandote por si falla el físico, el lógico puede recrear alguna de las tablas
Garantizando la recuperacion de toda la informacion.
*/


/*Recuperacion de backups*/

CREATE DATABASE jugos_ventas;

/*
mysql -uroot -p < c:\sqlDBA\jugos_ventas_full.sql

*/


/*

*/
