CREATE DATABASE TALLER_1;
USE TALLER_1;

CREATE TABLE Farmacia (
	idFarmacia INT PRIMARY KEY, 
	nombre VARCHAR (15) NOT NULL,
	telefono VARCHAR (7) NOT NULL,
	fax VARCHAR(7) NOT NULL,
	direccion VARCHAR (30) NOT NULL
	
);


CREATE TABLE Medicamento(

	idMedicamento INTEGER PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	codigo VARCHAR(15) NOT NULL,
	precio INT NOT NULL,
	stock INT NOT NULL,
	id_Farmacia INT NOT NULL,
	FOREIGN KEY (id_Farmacia) REFERENCES Farmacia(idFarmacia)

	);

CREATE TABLE Laboratorio(

	idLaboratorio INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	telefono VARCHAR(7) NOT NULL,
	fax VARCHAR (30) NOT NULL,
	direccion VARCHAR(30) NOT NULL
	
	);

CREATE TABLE LaboratorioMedicamento(

	id_Laboratorio INT ,
	id_Medicamento INT ,
	FOREIGN KEY (id_Laboratorio) REFERENCES Laboratorio (idLaboratorio),
	FOREIGN KEY (id_Medicamento) REFERENCES Medicamento (idMedicamento),
	PRIMARY KEY (id_Laboratorio, id_Medicamento)
);

	

CREATE TABLE TipoAdquisicion(

	idTipoAdquisicion INT PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
	descripcion VARCHAR(250) NOT NULL,
	id_Medicamento INT NOT NULL,
	FOREIGN KEY (id_Medicamento) REFERENCES Medicamento(idMedicamento)
	
	);

CREATE TABLE TipoVenta(

	idTipoVenta INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	descripcion VARCHAR(250) NOT NULL,
	id_Medicamento INT NOT NULL,
	FOREIGN KEY (id_Medicamento) REFERENCES Medicamento(idMedicamento)
	
	);

CREATE TABLE TipoMedicamento(

	idTipoMedicamento INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	descripcion VARCHAR(250) NOT NULL,
	id_Medicamento INT NOT NULL,
	FOREIGN KEY (id_Medicamento) REFERENCES Medicamento(idMedicamento)
	
	);

CREATE TABLE Familia(

	idFamilia INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL
	
);

CREATE TABLE FamiliaMedicamento(

	id_Familia INT,
	id_Medicamento INT,
	FOREIGN KEY (id_Familia) REFERENCES Familia(idFamilia),
	FOREIGN KEY (id_Medicamento) REFERENCES Medicamento(idMedicamento),
	PRIMARY KEY (id_Familia, id_Medicamento)
);

CREATE TABLE TipoEnfermedad(

	idTipoEnfermedad INT PRIMARY KEY,
	nombre VARCHAR (20) NOT NULL,
	descripcion VARCHAR(250) NOT NULL
	);

CREATE TABLE FamiliaTipoEnfermedad(

	id_Familia INT NOT NULL,
	id_TipoEnfermedad INT NOT NULL,
	FOREIGN KEY (id_Familia) REFERENCES Familia(idFamilia),
	FOREIGN KEY (id_TipoEnfermedad) REFERENCES TipoEnfermedad(idTipoEnfermedad),
	PRIMARY KEY(id_Familia, id_TipoEnfermedad)
	
	);

CREATE TABLE Enfermedad(

	idEnfermedad INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	descripcion VARCHAR(250) NOT NULL,
	id_TipoEnfermedad INT NOT NULL,
	FOREIGN KEY (id_TipoEnfermedad) REFERENCES TipoEnfermedad(idTipoEnfermedad)
	
	);


-----------------------------------------------------------------------------INSERTS------------------------------------------------------------------------

INSERT INTO Enfermedad VALUES 
(1, 'Herpes', 'se pueden manifestar en los labios', 1),
(2, 'Artritis', 'dificultades en los huesos', 2),
(3, 'Cancer', 'celulas cancerígenas se reproducen en el cuerpo', 4),
(4, 'Demencia', 'trastorno mental', 5);

INSERT INTO Familia VALUES 
(1, 'depresivos'),
(2, 'glucemiantes'),
(3, 'hipertensivos'),
(4, 'Diureticos'),
(5, 'Sedantes');

INSERT INTO FamiliaMedicamento VALUES  
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);


INSERT INTO Farmacia VALUES 
(1,"Farmatodo","6718135","6777570","Calle 170 #15-47"),
(2,"La Rebaja","6896541","3063215","Calle 171 #34-67"),
(3,"Cruz Verde","5478945","6777570","Calle 172 #22-109"),
(4,"Acuña","6718135","8065410","Calle 173 #44-01"),
(5,"Cafam","6718135","3091705","Calle 174 #78-13");

INSERT INTO Laboratorio VALUES
(1,"Genfar","6984521","5221212","Calle 18 #44 A-20"),
(2,"Bayer","8006598","2458787","Avenidad de las Américas #5652"),
(3,"GSK","4178686","6987421"," Avenida Eldorado 69B-45 P-9"),
(4,"Pfizer","6002300","4587932","Transversal 55 #95-66"),
(5,"EuroLab","2153801","2142127","Carrera 9A # 117A - 31");

INSERT INTO TipoEnfermedad VALUES
(1,"Infecciosas","son aquellas provocadas por el contacto de la persona con algún tipo de germen tales como bacterias o protozoos, virus u hongos."),
(2,"Congénitas","hacer referencia a un padecimiento sufrido desde el momento del nacimiento, y que fue adquirido en la gestación."),
(3,"Hereditarias","su característica principal radica en el hecho de que la transmisión se produce de generación en generación."),
(4,"Autoinmunes","se producen cuando el sistema inmunológico reacciona frente a ciertas células del propio organismo."),
(5,"Mentales","el término se refiere a  alteraciones o trastornos cerebrales causado por desordenes químicos en dicho órgano.");

INSERT INTO Medicamento VALUES 
(1,"Acetaminofen","256888",120000,34,3),
(2,"Omeprazol","458774",10000,57,1),
(3,"Viagra","354889",23600,40,4),
(4,"Aspirina","897455",8600,120,2),
(5,"Azodac","457632",101560,24,5);

INSERT INTO LaboratorioMedicamento VALUES
(3,1),
(1,2),
(4,3),
(2,4),
(5,5);

INSERT INTO TipoAdquisicion VALUES
(1,"Contado","El pago fue de $120000",1),
(2,"Contado","El pago fue de $10000",2),
(3,"Tarjeta de Credito","El pago fue de $101560",5),
(4,"Tarjeta Debito","El pago fue de $8600",4),
(5,"Contado","El pago fue de $23600",3);

INSERT INTO TipoVenta VALUES
(1,"Libre","se pueden comprar sin una receta médica",1),
(2,"Libre","se pueden comprar sin una receta médica",2),
(3,"Restringida","solo con receta médica",5),
(4,"Libre","se pueden comprar sin una receta médica",4),
(5,"Libre","se pueden comprar sin una receta médica",3);

INSERT INTO TipoMedicamento VALUES
(1,"Análgesico","calmante para el dolor",1),
(2,"Análgesico","calmante para el dolor",2),
(3,"PDE","clase de medicamentos denominados inhibidores de la fosfodiesterasa",3),
(4,"Salicilato","clase de medicamentos denominados para dolor o tratamientos cardiovasculares",4),
(5,"Suplemento"," suplemento nutricional específicamente diseñado para suplir los nutrientes",5);

