# outer-joins-ministore

MiniStore - OUTER JOINS
1. ¿Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Que se perdería si usaras INNER JOIN?
Use LEFT JOIN porque necesitaba mostrar todos los productos del catalogo, tambien los que nunca fueron vendidos.
Si hubiera utilizado INNER JOIN, solamente aparecerian los productos que tienen ventas asociadas y se perderian los productos como 108 (Hub USB-C 7p) y 109 (Parlante Bluetooth)

3. ¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?
Utilice RIGHT JOIN para conservar todos los registros de la tabla ventas, incluso cuando el producto vendido no existe en el catalogo.
En mi consulta la tabla productos está a la izquierda y la tabla ventas esta a la derecha. Pude ver la venta número 10, que tiene el producto_id 999 y no tiene coincidencia en la tabla productos.

3.¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.
Los valores NULL indican que no existe una coincidencia entre los registros de las dos tablas.
En la Consulta 1.. un venta_id NULL significa que el producto no tiene ninguna venta asociada. Por ejemplo el producto 108 (Hub USB-C 7p) nunca fuw vendido.
En la Consulta 2, un producto_id NULL que proviene de la tabla productos significa que existe una venta que su producto no está registrado en el catalogo. En este ejercicio pasa con la venta numero 10, que correspomde al producto_id 999.

4.¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?
Utilizaria FULL OUTER JOIN para hacer un registro y comparar informacion de diferentes tablas o sistemas.
Por ejemplo, para comparar el catalogo de productos con el historial de ventas y detectar tanto productos que nunca fueron vendidos como ventas que contienen productos inexistentes.
Esto permite identificarlos para que no haya errores y mejorar la calidad de los datos antes de generar reportes.
