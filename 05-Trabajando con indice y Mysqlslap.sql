#COST 3.75
SELECT A.CODIGO_DEL_PRODUCTO FROM tabla_de_productos A;

# COST 39394.50
SELECT A.CODIGO_DEL_PRODUCTO, C.CANTIDAD FROM tabla_de_productos
A INNER JOIN items_facturas C ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO;

# COST 127190.25
SELECT A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) AS ANO, C.CANTIDAD
 FROM tabla_de_productos A INNER JOIN items_facturas C 
 ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO INNER JOIN facturas B ON C.NUMERO = B.NUMERO;

# 127190.25 --> EL GROUP BY Y EL ORDER BY NO AUMENTA CONSIDERABLEMENTE LA CONSULTA
SELECT A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) AS ANO, SUM(C.CANTIDAD) AS CANTIDAD 
FROM tabla_de_productos A INNER JOIN items_facturas C 
ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO INNER JOIN facturas B
ON C.NUMERO = B.NUMERO GROUP BY A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA)
 ORDER BY  A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA);
 
 CREATE TABLE `facturas1` (
  `DNI` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `FECHA_VENTA` date DEFAULT NULL,
  `NUMERO` int NOT NULL,
  `IMPUESTO` float NOT NULL
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 CREATE TABLE `items_facturas1` (
  `NUMERO` int NOT NULL,
  `CODIGO_DEL_PRODUCTO` varchar(10) NOT NULL,
  `CANTIDAD` int NOT NULL,
  `PRECIO` float NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `tabla_de_productos1` (
  `CODIGO_DEL_PRODUCTO` varchar(10) NOT NULL,
  `NOMBRE_DEL_PRODUCTO` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(10) DEFAULT NULL,
  `SABOR` varchar(20) DEFAULT NULL,
  `ENVASE` varchar(20) DEFAULT NULL,
  `PRECIO_DE_LISTA` float NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Creamos tablas sin tablas primarias ni foranes*/

INSERT INTO facturas1
SELECT * FROM facturas;

INSERT INTO items_facturas1
SELECT * FROM items_facturas;

INSERT INTO tabla_de_productos1
SELECT * FROM tabla_de_productos;

#COST 3.75
SELECT A.CODIGO_DEL_PRODUCTO FROM tabla_de_productos1 A;

# COST 727696.92
SELECT A.CODIGO_DEL_PRODUCTO, C.CANTIDAD FROM tabla_de_productos1
A INNER JOIN items_facturas1 C ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO;

# COST 805645.92
SELECT A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) AS ANO, C.CANTIDAD
 FROM tabla_de_productos1 A INNER JOIN items_facturas1 C 
 ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO INNER JOIN facturas B ON C.NUMERO = B.NUMERO;

# 60.386.882.842,25 --> EL GROUP BY Y EL ORDER BY NO AUMENTA CONSIDERABLEMENTE LA CONSULTA
SELECT A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA) AS ANO, SUM(C.CANTIDAD) AS CANTIDAD 
FROM tabla_de_productos1 A INNER JOIN items_facturas1 C 
ON A.CODIGO_DEL_PRODUCTO = C.CODIGO_DEL_PRODUCTO INNER JOIN facturas1 B
ON C.NUMERO = B.NUMERO GROUP BY A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA)
 ORDER BY  A.CODIGO_DEL_PRODUCTO, YEAR(FECHA_VENTA);

/*Sin claves primaria ni externe perjudica el desempeño de las consultas significativamente.*/

/*mysqllab permite saber como se compartarian las diversas consultas realacionadas a nuestras tablas*/


# cost 8.849,05 -> usa un access type all
SELECT * FROM facturas WHERE FECHA_VENTA='20170101';

ALTER TABLE facturas ADD INDEX(FECHA_VENTA);

# cost 25,90 -> usa un access type ref
SELECT * FROM facturas WHERE FECHA_VENTA='20170101';

#-----
#COST 8866.15
SELECT * FROM facturas1 WHERE FECHA_VENTA='20170101';


/*
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqlslap -uroot -p --concurrency=100 --iterations=10 --create-schema=jugos_ventas --query="SELECT * FROM facturas WHERE FECHA_VENTA='20170101'";
Enter password: ***************
Benchmark
        Average number of seconds to run all queries: 0.395 seconds
        Minimum number of seconds to run all queries: 0.140 seconds
        Maximum number of seconds to run all queries: 1.203 seconds
        Number of clients running queries: 100
        Average number of queries per client: 1
        
	viendo una tabla sin indices:
        
C:\Program Files\MySQL\MySQL Server 8.0\bin>mysqlslap -uroot -p --concurrency=100 --iterations=10 --create-schema=jugos_ventas --query="SELECT * FROM facturas1 WHERE FECHA_VENTA='20170101'";
Enter password: ***************
Benchmark
        Average number of seconds to run all queries: 7.757 seconds
        Minimum number of seconds to run all queries: 6.031 seconds
        Maximum number of seconds to run all queries: 10.375 seconds
        Number of clients running queries: 100
        Average number of queries per client: 1
        

*/


