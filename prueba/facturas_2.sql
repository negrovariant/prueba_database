CREATE DATABASE PRUEBA;

\c PRUEBA

CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(100), rut VARCHAR(10) UNIQUE NOT NULL, direccion VARCHAR(100));

CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR(50) NOT NULL UNIQUE, descripcion VARCHAR(100));

CREATE TABLE facturas(id SERIAL PRIMARY KEY, fecha_factura DATE NOT NULL, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);

CREATE TABLE clientes_facturas(
cliente_id INT NOT NULL,
factura_id INT NOT NULL,
FOREIGN KEY(cliente_id) REFERENCES clientes(id),
FOREIGN KEY(factura_id) REFERENCES facturas(id)
);

CREATE TABLE productos(
id SERIAL PRIMARY KEY,
nombre VARCHAR(50),
descripcion VARCHAR(100),
valor_unitario FLOAT,
categoria_id INT NOT NULL
);

CREATE TABLE listado_productos(
factura_id INT,
producto_id INT,
FOREIGN KEY(factura_id) REFERENCES facturas(id),
FOREIGN KEY(producto_id) REFERENCES productos(id),
cantidad INT NOT NULL
);

INSERT INTO clientes(nombre, rut, direccion) VALUES
('juan andres ', 1, 'el salto 5608'),
('tomas rojas', 5467, 'santiago bueras 200'),
('leslie rojs', 56708, 'tomas moro 211'),
('nicolas soto', 3675, 'la serena 2406'),
('Maria pino', 980, 'el vergel 333');

INSERT INTO categorias(nombre, descripcion) VALUES
('abarrotes', 'varios', ),
('congelados', 'prod.congelados'),
('art_oficina', 'escritorio');

INSERT INTO productos(nombre, descripcion, valor_unitario, categoria_id) VALUES
('cafe', 'descafeinado 200cc', 4300, 1),
('arroz integral', 'arroz sano', 1000, 1),
('teclado','teclgiado pc', 4000, 3),
('pantalla', 'pantalla pc', 25000, 3),
('salmon', 'salmon congelado', 1000, 2),
('verduras ', 'verduras congeladas', 850, 2),
('choclo', 'grano ', 400, 2),
('mouse', 'raton pc', 3500, 3);

INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 2000, 253, 2253);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 2010, 3253, 5253);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 2340, 323, 9053);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 2340, 4923, 2353);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 23933, 49, 2039);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 3933, 349, 4839);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 3323, 343, 3839);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 7323, 4343, 339);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES(NOW()::DATE, 734, 2343, 3339);
INSERT INTO facturas(fecha_factura, subtotal, iva, precio_total) VALUES('2010-05-05', 734, 2343, 3339);