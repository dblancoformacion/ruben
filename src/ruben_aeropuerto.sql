/*creacion de la base de datos*/
DROP DATABASE IF EXISTS ruben_aeropuerto;
CREATE DATABASE IF NOT EXISTS ruben_aeropuerto 
  CHARACTER SET utf8 
  COLLATE utf8_spanish_ci;
/* codificacion en transmision castellano */
SET NAMES 'utf8';

/* SELECCIONAMOS LA BASE DE DATOS */
USE ruben_aeropuerto;

/* CREAR TABLA */
CREATE TABLE IF NOT EXISTS aeropuerto (
  -- CREAMOS LOS CAMPOS
  id_aeropuerto int AUTO_INCREMENT,
  nom_aeropuerto varchar(25) NOT NULL,
  ciudad varchar(30) NOT NULL,
  -- COLOCAMOS RESTRICCIONES, CLAVES Y CHECKS
  PRIMARY KEY (id_aeropuerto)
)
  -- OPCIONES DE LA TABLA
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci; 



CREATE TABLE IF NOT EXISTS terminales (
  id_terminal int AUTO_INCREMENT,
  nom_terminal varchar(25) NOT NULL,
  PRIMARY KEY (id_terminal)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS ofrece (
  id_terminal int,
  id_servicio int,
  PRIMARY KEY (id_terminal, id_servicio),
  FOREIGN KEY(id_terminal) REFERENCES terminales(id_terminal),
  FOREIGN KEY(id_servicio) REFERENCES servicios(id_servicio)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS servicios (
  id_servicio int AUTO_INCREMENT,
  nom_servicio varchar(25) NOT NULL,
  PRIMARY KEY (id_servicio)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;



CREATE TABLE IF NOT EXISTS vuelo (
  id_vuelo int AUTO_INCREMENT,
  PRIMARY KEY (id_vuelo)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS aerolineas (
  id_linea int AUTO_INCREMENT,
  nom_linea varchar (25) NOT NULL,
  nacionalidad varchar (25)NOT NULL ,
  PRIMARY KEY (id_linea)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS cliente(
  id_cliente int AUTO_INCREMENT,
  nom_cliente varchar (25) NOT null,
  PRIMARY KEY (id_cliente)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;


CREATE TABLE IF NOT EXISTS compra(
  id_cliente int,
  id_vuelo int,
  PRIMARY KEY (id_cliente, id_vuelo),
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
  FOREIGN KEY (id_vuelo) REFERENCES vuelo (id_vuelo)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;



CREATE TABLE if NOT EXISTS sedivide(
  id_aeropuerto int,
  id_terminal int,
  PRIMARY KEY (id_aeropuerto,id_terminal),
  FOREIGN  KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto),
  FOREIGN  KEY (id_terminal) REFERENCES terminales(id_terminal)
  )
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE if NOT EXISTS llegadas(
  id_terminal int,
  id_vuelo int,
  PRIMARY KEY (id_terminal,id_vuelo),
  FOREIGN KEY (id_terminal)REFERENCES terminales  (id_terminal),
  FOREIGN KEY (id_vuelo)REFERENCES vuelo (id_vuelo)
  )
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE if NOT EXISTS salidas(
  id_terminal int,
  id_vuelo int,
  PRIMARY KEY (id_terminal,id_vuelo),
  FOREIGN KEY (id_terminal)REFERENCES terminales  (id_terminal),
  FOREIGN KEY (id_vuelo)REFERENCES vuelo (id_vuelo)
  )
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;


CREATE TABLE if NOT EXISTS vuelan(
  id_linea int,
  id_vuelo int,
  PRIMARY KEY (id_linea, id_vuelo),
  FOREIGN KEY (id_linea) REFERENCES aerolineas(id_linea),
  FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo)
  )
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE if NOT EXISTS compra(
  id_cliente int,
  id_vuelo int,
  PRIMARY KEY (id_cliente,id_vuelo),
  FOREIGN KEY (id_cliente) REFERENCES aerolineas(id_cliente),
  FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo)
  )
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;


INSERT INTO aeropuerto VALUES
(1, 'Barajas', 'Madrid'),
(2, 'Cuatro Vientos', 'Madrid'),
(3, 'El Prat', 'Barcelona'),
(4, 'Sabadell', 'Barcelona'),
(5, 'Seve Ballesteros', 'Santander'),
(6, 'Palma de Mallorca', 'Palma de Mallorca'),
(7, 'Son Bonet', 'Palma de Mallorca'),
(8, 'Malaga', 'Malaga');

INSERT INTO cliente VALUES
  (1,'Pepe'),
  (2,'Pepa'),
  (3,'Pili'),
  (4,'Pilo');

SELECT *FROM servicios;


INSERT INTO servicios VALUES
  (1,'Equipaje'),
  (2,'Objetos Perdidos'),
  (3,'Parking'),
  (4,'Bancario'),
  (5,'Informacion Turistica');

INSERT INTO terminales VALUES
  (1,'T1'),
  (2,'T2'),
  (3,'T3'),
  (4,'T1'),
  (5,'T2'),
  (6,'T1'),
  (7,'T2'),
  (8,'T1'),
  (9,'T1'),
  (10,'T1'),
  (11,'T2'),
  (12,'T1'),
  (13,'T2') ;

SELECT *FROM terminales;