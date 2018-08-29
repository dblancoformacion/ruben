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
  id_aeropuerto int,
  PRIMARY KEY (id_terminal),
  FOREIGN KEY (id_aeropuerto )REFERENCES aeropuerto (id_aeropuerto)
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





CREATE TABLE IF NOT EXISTS aerolineas (
  id_linea int AUTO_INCREMENT,
  nom_linea varchar (25) NOT NULL,
  nacionalidad varchar (25)NOT NULL ,
  PRIMARY KEY (id_linea)
  
)
ENGINE = INNODB
CHARACTER SET utf8
COLLATE utf8_spanish_ci;

CREATE TABLE IF NOT EXISTS vuelo (
  id_vuelo int AUTO_INCREMENT,
  id_terminal_salida int,
  id_terminal_llegada int,
  id_linea int,
  plazas smallint NOT NULL,
  plazas_restantes smallint,
  PRIMARY KEY (id_vuelo),
  FOREIGN KEY(id_terminal_salida) REFERENCES terminales(id_terminal),
  FOREIGN KEY(id_terminal_llegada) REFERENCES terminales(id_terminal),
  FOREIGN KEY(id_linea) REFERENCES aerolineas(id_linea)
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


INSERT INTO servicios VALUES
  (1,'Equipaje'),
  (2,'Objetos Perdidos'),
  (3,'Parking'),
  (4,'Bancario'),
  (5,'Informacion Turistica');

INSERT INTO terminales VALUES 
  (1,'T1',1),
  (2,'T2',1),
  (3,'T3',1),
  (4,'T1',2),
  (5,'T2',2),
  (6,'T1',3),
  (7,'T1',4),
  (8,'T1',5),
  (9,'T1',6),
  (10,'T1',7),
  (11,'T1',8);
INSERT INTO aerolineas VALUES
  (1,'Iberia','España'),
  (2,'Air France','Francia'),
  (3,'British Airways','UK'),
  (4,'Lufthansa','Alemania'),
  (5,'American Airlines', 'USA');
INSERT INTO vuelo VALUES
  (1,1,6,1),
  (2,2,10,2),
  (3,3,9,1),
  (4,3,7,5),
  (5,5,1,4),
  (6,6,1,1),
  (7,8,11,3); 

INSERT INTO ofrece VALUES 
  (1,1),
  (1,3),
  (1,5),
  (2,2),
  (2,3),
  (2,5),
  (3,1),
  (3,2),
  (3,4),
  (4,1),
  (4,2),
  (4,4),
  (5,1),
  (5,2),
  (5,4),
  (5,5),
  (6,2),
  (6,4),
  (7,1),
  (7,5),
  (8,2),
  (8,3),
  (8,4),
  (9,1),
  (9,3),
  (9,5),
  (10,3),
  (10,4);

INSERT INTO compra VALUES 
  (1,1),
  (4,1),
  (4,6),
  (3,7),
  (2,5);



SELECT *FROM aerolineas;