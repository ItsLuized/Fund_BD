CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL
);

CREATE TABLE Ciudad(
	idCiudad INT PRIMARY KEY,
	nombre VARCHAR (25) NOT NULL,
	departamento VARCHAR (25) NOT NULL
);

CREATE TABLE Dueño(
	idDueño INT PRIMARY KEY,
	nombre VARCHAR (25) NOT NULL,
	apellido VARCHAR (25) NOT NULL,
	cedula VARCHAR (25) NOT NULL,
	eps VARCHAR (25) NOT NULL	
);

CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY,
	nombre VARCHAR (25) NOT NULL,
	apellido VARCHAR (25) NOT NULL,
	cedula VARCHAR (25) NOT NULL	
);

CREATE TABLE Articulo(
	idArticulo INT PRIMARY KEY,
	nombre VARCHAR (25) NOT NULL,
	precio INT NOT NULL,
	marca VARCHAR (25) NOT NULL,
	idCliente INT NOT NULL
	FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
	
);

CREATE TABLE TipoNegocio(
	idTipoNegocio INT PRIMARY KEY,
	nit VARCHAR (25) NOT NULL,
	numeroRazonSocial VARCHAR (25) NOT NULL,
	nombreActividad VARCHAR (25) NOT NULL	
);

CREATE TABLE CentroComercial(
	idCentroComercial INT PRIMARY KEY,
	nombre VARCHAR (25) NOT NULL,
	direccion VARCHAR (25) NOT NULL,
	telefono VARCHAR (25) NOT NULL,
	idEmpresa INTEGER (11) NOT NULL,
	idCiudad INTEGER (11) NOT NULL,
	FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa),
	FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad)
);

CREATE TABLE Tienda(
	idTienda INT PRIMARY KEY,
	nombre VARCHAR (25) NOT NULL,
	ubicacion VARCHAR (25) NOT NULL,
	idTipoNegocio INTEGER (11) NOT NULL,
	FOREIGN KEY (idTipoNegocio) REFERENCES TipoNegocio(idTipoNegocio)
);

CREATE TABLE CentroComercialTienda(
	idCentroComercial INTEGER(11) NOT NULL,
	idTienda INTEGER(11) NOT NULL,
	FOREIGN KEY (idCentroComercial) REFERENCES CentroComercial(idCentroComercial),
	FOREIGN KEY (idTienda) REFERENCES Tienda(idTienda),
	PRIMARY KEY (idCentroComercial, idTienda)
);

CREATE TABLE TiendaCliente(
	idTienda INT NOT NULL,
	idCliente INT NOT NULL,
	FOREIGN KEY (idTienda) REFERENCES Tienda(idTienda),
	FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
	PRIMARY KEY (idTienda, idCliente)
);