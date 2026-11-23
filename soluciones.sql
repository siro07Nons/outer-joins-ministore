-- MiniStore - Soluciones con Outer JOINs --

-- CONSULTA 1: LEFT JOIN
-- ¿Qué productos del catálogo nunca fueron vendidos?
SELECT
p.producto_id,
p.nombre,
p.categoria,
p.precio,
v.venta_id,
v.cantidad,
v.fecha_venta
FROM productos p
LEFT JOIN ventas v
ON p.producto_id = v.producto_id
ORDER BY p.producto_id;

-- Los profuctos sin ventas
SELECT
p.producto_id,
p.nombre,
p.categoria,
p.precio
FROM productos p
LEFT JOIN ventas v
ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL
ORDER BY p.producto_id;

-- CONSULTA 2: RIGHT JOIN
-- ¿Existen ventas con productos que no figuran en nuestro catálogo?
SELECT
v.venta_id,
v.producto_id,
v.cliente_id,
v.cantidad,
v.fecha_venta,
p.nombre,
p.categoria,
p.precio
FROM productos p
RIGHT JOIN ventas v
ON p.producto_id = v.producto_id
ORDER BY v.venta_id;

-- Los registros huerfanos
SELECT
v.venta_id,
v.producto_id,
v.cliente_id,
v.cantidad,
v.fecha_venta
FROM productos p
RIGHT JOIN ventas v
ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL
ORDER BY v.venta_id;

-- CONSULTA 3: FULL OUTER JOIN
-- Mostrar todos los productos y todas las ventas sin perder ninguna fila
SELECT
p.producto_id AS producto_catalogo_id,
p.nombre,
p.categoria,
p.precio,
v.venta_id,
v.producto_id AS producto_venta_id,
v.cliente_id,
v.cantidad,
v.fecha_venta,
CASE
WHEN v.venta_id IS NULL THEN 'Producto sin ventas'
WHEN p.producto_id IS NULL THEN 'Venta sin producto en catalogo'
ELSE 'Producto con venta'
END AS estado
FROM productos p
FULL OUTER JOIN ventas v
ON p.producto_id = v.producto_id
ORDER BY
COALESCE(p.producto_id, v.producto_id),
v.venta_id;
