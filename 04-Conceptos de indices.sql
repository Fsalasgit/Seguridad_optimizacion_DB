/*
Hash y B-tree son algoritmos de búsquedas ordenadas

	B-TREE
    
    En 32 niveles puede analizar 4.294.967.296

	HASH
    
    Sirve como un indice de un libro, es bastante util por ejemplo para criptomonedas
*/

/*Desmotracion de como el idice puede mejorar la eficiencia del query

--COST 8849.05
EXPLAIN FORMAT = JSON SELECT * FROM facturas WHERE FECHA_VENTA='20170101' \G;

--CREAR INDICE:

ALTER TABLE FACTURAS ADD INDEX(FECHA_VENTA);

--COST 25.059
EXPLAIN FORMAT = JSON SELECT * FROM facturas WHERE FECHA_VENTA='20170101' \G;

En la primer consulta examina todos los registros mientras que despues de crear el indice solo ingreso a ref,
convirtiendo fecha venta como key; 74 registros vs 88.000

ALTER TABLE FACTURAS DROP INDEX FECHA_VENTA;

 "query_cost": "8849.05"
 EXPLAIN FORMAT = JSON SELECT * FROM facturas WHERE FECHA_VENTA='20170101' \G;

*/

