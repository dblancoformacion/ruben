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
  ciudad varchar(30) DEFAULT NULL,
  -- COLOCAMOS RESTRICCIONES, CLAVES Y CHECKS
  PRIMARY KEY (id_aeropuerto)
)
  -- OPCIONES DE LA TABLA
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

CREATE TABLE IF NOT EXISTS terminales (
  id_terminal int AUTO_INCREMENT,
  nom_terminal varchar(25) NOT NULL,
  PRIMARY KEY (id_terminal)
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
  nom_linea varchar (25),
  nacionalidad varchar (25),
  PRIMARY KEY (id_linea)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS cliente(
  id_cliente int AUTO_INCREMENT,
  nom_cliente varchar (25),
  PRIMARY KEY (id_cliente)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;


CREATE TABLE IF NOT EXISTS ofrece (
  id_terminal int,
  id_servicio int,
  FOREIGN KEY(id_terminal) REFERENCES terminales(id_terminal),
  FOREIGN KEY(id_servicio) REFERENCES servicios(id_servicio)
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;



CREATE TABLE if NOT EXISTS sedivide(
  id_aeropuerto int,
  id_terminal int,
  FOREIGN  KEY (id_aeropuerto) REFERENCES aeropuerto(id_aeropuerto),
  FOREIGN  KEY (id_terminal) REFERENCES terminales(id_terminal)
  )
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;