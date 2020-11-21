--Se crea database
CREATE DATABASE libros;
\c libros
--Se crea código a partir de modelo lógico
CREATE TABLE editorial(
  id SERIAL,
  nombre_editorial VARCHAR(100),
  PRIMARY KEY (id)
);
CREATE TABLE libro(
  codigo INT,
  titulo VARCHAR(250),
  editorial_id INT REFERENCES editorial(id),
  PRIMARY KEY (codigo)
);
CREATE TABLE lector(
  id SERIAL,
  nombre VARCHAR(100),
  PRIMARY KEY (id)
);
CREATE TABLE libro_dev(
  id SERIAL,
  fecha_devolucion DATE,
  lector_id INT REFERENCES lector(id),
  libro_codigo INT REFERENCES libro(codigo),
  PRIMARY KEY (id)
);
CREATE TABLE autores(
  id SERIAL,
  nombre_autor VARCHAR(100),
  PRIMARY KEY (id)
);
CREATE TABLE autores_libro(
  id SERIAL,
  autores_id INT REFERENCES autores(id),
  libro_codigo INT REFERENCES libro(codigo),
  PRIMARY KEY (id)
);
--Se ingresan valores
-- tabla editorial
INSERT INTO editorial(nombre_editorial) VALUES ('UTHEAD');
INSERT INTO editorial(nombre_editorial) VALUES ('Reverté');
INSERT INTO editorial(nombre_editorial) VALUES ('McGraw-Hill');
INSERT INTO editorial(nombre_editorial) VALUES ('MIR');
-- tabla libro
INSERT INTO libro(codigo, titulo, editorial_id) VALUES (515,'Ecuaciones diferenciasles para ingenieros y ciéntificos', 1);
INSERT INTO libro(codigo, titulo, editorial_id) VALUES (540,'Química', 2);
INSERT INTO libro(codigo, titulo, editorial_id) VALUES (530,'Física', 3);
INSERT INTO libro(codigo, titulo, editorial_id) VALUES (519,'Estadística', 3);
INSERT INTO libro(codigo, titulo, editorial_id) VALUES (512,'Algebra Lineal', 4);
-- tabla lector
INSERT INTO lector(nombre) VALUES ('Pérez Gómez, Juan');
INSERT INTO lector(nombre) VALUES ('Ortega Pereira, Margarita');
INSERT INTO lector(nombre) VALUES ('García Contreras, Rosa');
INSERT INTO lector(nombre) VALUES ('López Molina, Ana');
-- tabla lector libro_dev
INSERT INTO libro_dev(fecha_devolucion, lector_id, libro_codigo) VALUES ('2019/09/15', 1, 515);
INSERT INTO libro_dev(fecha_devolucion, lector_id, libro_codigo) VALUES ('2019/08/23', 2, 540);
INSERT INTO libro_dev(fecha_devolucion, lector_id, libro_codigo) VALUES ('2019/09/24', 3, 530);
INSERT INTO libro_dev(fecha_devolucion, lector_id, libro_codigo) VALUES ('2019/09/18', 4, 519);
INSERT INTO libro_dev(fecha_devolucion, lector_id, libro_codigo) VALUES ('2019/09/17', 1, 512);
-- tabla autores
INSERT INTO autores(nombre_autor) VALUES ('Lambe, C.G');
INSERT INTO autores(nombre_autor) VALUES ('Tranter, C.J.');
INSERT INTO autores(nombre_autor) VALUES ('Christen, HansRudolf');
INSERT INTO autores(nombre_autor) VALUES ('Serway, Raymond A');
INSERT INTO autores(nombre_autor) VALUES ('Murray Spiege');
INSERT INTO autores(nombre_autor) VALUES ('Voevodin,Valentin V');
-- tabla autores-libros
INSERT INTO autores_libro(autores_id, libro_codigo) VALUES (1, 515);
INSERT INTO autores_libro(autores_id, libro_codigo) VALUES (2, 515);
INSERT INTO autores_libro(autores_id, libro_codigo) VALUES (3, 540);
INSERT INTO autores_libro(autores_id, libro_codigo) VALUES (4, 530);
INSERT INTO autores_libro(autores_id, libro_codigo) VALUES (5, 519);
INSERT INTO autores_libro(autores_id, libro_codigo) VALUES (6, 512);

--Comprobando las relaciones
-- ¿Cuando los lectores regresaron los libros?
SELECT fecha_devolucion, nombre, libro_codigo FROM libro_dev
JOIN lector ON libro_dev.lector_id = lector.id;
-- ¿Cuantos libros hay por editorial?
SELECT nombre_editorial, count(*) FROM editorial
JOIN libro ON libro.editorial_id = editorial.id
GROUP BY nombre_editorial;


















