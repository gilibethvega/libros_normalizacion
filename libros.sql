--Se crea database
CREATE DATABASE libros;
\c libros
--Se crea código a partir de modelo lógico
CREATE TABLE editorial(
  id SERIAL,
  nombre_editorial VARCHAR(100),
  PRIMARY KEY (id),
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
  PRIMARY KEY id
);
CREATE TABLE autores_libro(
  id SERIAL,
  autores_id INT REFERENCES autores(id),
  libro_codigo INT REFERENCES libro(codigo),
  PRIMARY KEY (id)
);
