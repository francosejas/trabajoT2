DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

-- Creamos las tablas
CREATE TABLE fabricante (
 codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
 codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 precio DOUBLE NOT NULL,
 codigo_fabricante INT UNSIGNED NOT NULL,
 FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

-- Insertamos los datos
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto;
-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre,precio from producto;
-- 3. Lista el nombre de los productos, el precio en euros y el precio en dólares 
select nombre, precio as "precio en euros", precio * 1.15 as "precio en dolares" from producto;
-- 4. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select UPPER(nombre),precio from producto;
-- 5. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select LOWER(nombre),precio from producto;
-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre, round(precio) from producto;
-- 7. Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre ASC;
-- 8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre,precio from producto as tp order by nombre asc,precio desc;
-- 9. Lista el primer nombre de todos los productos que hay en la tabla producto.
select nombre, precio from producto limit 1; -- limit nos da x numero de filas (en este caso nos da solo una)
-- 10. Dadme el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio asc limit 1;
-- 11. Dadme el nombre y el precio del producto más caro. (Utilizad solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;
-- 12. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto where precio<=120;
-- 13. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from producto where precio>80 and precio<300;
-- 14. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select * from producto where precio between 60 and 200;
-- 15. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
select * from producto where precio>200 and codigo_fabricante=6;
-- 16. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from producto where codigo_fabricante in (1,3,5); -- in se usa para no tener que poner tantos or
-- 17. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where nombre like "S%";
-- 18. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre like "%W%";
-- 19. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre like "%monitor%" and precio<215;
-- 20 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos (Primero sin inner join).
select producto.nombre, producto.precio, fabricante.nombre from producto, fabricante where producto.codigo_fabricante = fabricante.codigo;  -- puedes hacer consultas a varias tablas a la vez
-- 21 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos (Con inner).
select tp.nombre, tp.precio, tf.nombre from producto as tp
inner join fabricante as tf on tp.codigo_fabricante = tf.codigo;
-- 22 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
select tp.codigo,tp.nombre,tf.codigo,tf.nombre from producto as tp
inner join fabricante as tf on tp.codigo_fabricante = tf.codigo;
