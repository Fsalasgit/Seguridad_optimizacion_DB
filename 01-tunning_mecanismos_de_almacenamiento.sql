/*
Si se desea hacer mntenimiento o cambair algo en las bases se puede detener desde servicios de windows
o el siguiente comando en cmd:
Net stop MySQL80 - Para detener
Net start MySQL80 - Para reiniciar el servidor
*/
/*
	Tunning
    
Es un concepto que hace referencia a configurar el ambiente MySQL


*/

/*
	Variables de ambientes
    
Son variables declarada fuera del programa. 
*/

SHOW GLOBAL STATUS LIKE 'created_ymp_disk_tables'; #Muestra tablas creadas en el disco
SHOW GLOBAL STATUS LIKE 'created_tmp_tables'; #Muestra las tablas creadas con MySql

SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';

SET GLOBAL tmp_table_size = 136700160; #Aumento mas megas a las tablas temporales en disco, finalizado trabaja
# en memoria, ;

SHOW GLOBAL VARIABLES LIKE 'tmp_table_size';


