CREATE TABLE Ruta(
	idRuta INT PRIMARY KEY,
	fecha VARCHAR(20) NOT NULL,
	hora VARCHAR(11) NOT NULL
);

CREATE TABLE AutoBus(
	idAutoBus INT PRIMARY KEY,
	placa VARCHAR(20) NOT NULL,
	asientos INT NOT NULL,
	registradora BOOLEAN NOT NULL,
	idRuta INTEGER(11) NOT NULL,
	FOREIGN KEY (idRuta) REFERENCES Ruta(idRuta)
);


CREATE TABLE Asistente(
	idAsistente INT PRIMARY KEY,
	cedula VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	eps VARCHAR(15) NOT NULL
);

CREATE TABLE AutoBusAsistente(
	idAsistente INT NOT NULL,
	idAutoBus INT NOT NULL,
	FOREIGN KEY (idAsistente) REFERENCES Asistente(idAsistente),
	FOREIGN KEY (idAutoBus) REFERENCES AutoBus(idAutoBus),
	PRIMARY KEY (idAsistente, idAutoBus)
);

CREATE TABLE Conductor(
	idConductor INT PRIMARY KEY,
	cedula VARCHAR(20) NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	eps VARCHAR(15) NOT NULL
);

CREATE TABLE AutoBusConductor(
	idConductor INT NOT NULL,
	idAutoBus INT NOT NULL,
	FOREIGN KEY (idConductor) REFERENCES Conductor(idConductor),
	FOREIGN KEY (idAutoBus) REFERENCES AutoBus(idAutoBus),
	PRIMARY KEY (idConductor, idAutoBus)
);

CREATE TABLE Ciudad(
	idCiudad INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	departamento VARCHAR(20) NOT NULL
);

CREATE TABLE RutaCiudad(
	idCiudad INT NOT NULL,
	idRuta INT NOT NULL
	FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad),
	FOREIGN KEY (idRuta) REFERENCES Ruta(idRuta),
	PRIMARY KEY (idCiudad, idRuta)
);

CREATE TABLE Sucursal(
	idSucursal INT PRIMARY KEY,
	telefono INT NOT NULL,
	direccion VARCHAR(30) NOT NULL
);

CREATE TABLE CiudadSucursal(
	idCiudad INT,
	idSucursal INT,
	FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad),
	FOREIGN KEY (idSucursal) REFERENCES Sucursal(idSucursal),
	PRIMARY KEY (idCiudad, idSucursal)
);

----------------------------------------------------------------------------- VALORES ------------------------------------------------------------------------

INSERT INTO Ruta VALUES 
(1,"24/Mayo/2017","6:45 AM"),
(2,"03/Abril/2017","10:30 AM"),
(3,"14/Mayo/2017","11:15 AM"),
(4,"15/Agosto/2017","6:00 PM"),
(5,"01/Julio/2017","8:20 PM");

INSERT INTO AutoBus VALUES
(1,"ASB-058",25,0,1),
(2,"QFM-067",40,1,2),
(3,"NFE-154",35,1,3),
(4,"AAE-379",50,0,4),
(5,"GHN-666",20,1,5);

INSERT INTO Asistente VALUES
(1,"1019128936","Mauricio","Sánchez","Sura"),
(2,"51716573","Jeannette","Parra","Sura"),
(3,"17156789","Alberto","Sánchez","Sura"),
(4,"41256987","Alfonso","Garcia","Coomeva"),
(5,"1018975462","Daniela","Correa","Compensar");

INSERT INTO AutoBusAsistente VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO Conductor VALUES
(1,"49875666","Julian","Pérez","Coomeva"),
(2,"13245678","David","Gutierrez","Sura"),
(3,"17921333","German","Angarita","SaludTotal"),
(4,"33456111","Alberto","Nuñez","Sura"),
(5,"23987678","Leonardo","Santos","Compensar");

INSERT INTO AutoBusConductor VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO Ciudad VALUES
(1,"Bogotá D.C","Bogotá"),
(2,"Medellín","Antioquia"),
(3,"Cali","Valle del Cauca"),
(4,"Cartagena","Bolivar"),
(5,"Chía","Cundinamarca");

INSERT INTO RutaCiudad VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

INSERT INTO Sucursal VALUES
(1,"4589665","Calle 45 #47-98"),
(2,"8954471","Carrera 9 #22-11"),
(3,"5678900","Calle 204 #111-01"),
(4,"6778765","Avenida 2 #198-33"),
(5,"4589665","Carrea 122 #19-77");

INSERT INTO CiudadSucursal VALUES
(5,3),
(4,4),
(3,5),
(2,1),
(1,2);