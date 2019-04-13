CREATE TABLE Campo (
IdCampo INT PRIMARY KEY,
Campo VARCHAR(100)
);

CREATE TABLE Nacionalidad (
IdNacionalidad INT PRIMARY KEY,
Nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE Premio (
idPremio INT PRIMARY KEY,
Año YEAR NOT NULL,
Actividad VARCHAR(255) NOT NULL,
id_Campo INT,
FOREIGN KEY (id_Campo) REFERENCES Campo(idCampo)
);

CREATE TABLE Persona (
idPersona INT PRIMARY KEY,
Nombre VARCHAR(45) NOT NULL,
Apellidos VARCHAR(45) NOT NULL,
FechaNacimiento DATE NOT NULL,
id_Nacionalidad INT NOT NULL,
FOREIGN KEY (id_Nacionalidad) REFERENCES Nacionalidad (idNacionalidad)
);

CREATE TABLE Premiado (
id_Premio INT,
id_Persona INT,
FOREIGN KEY (id_Premio) REFERENCES Premio (idPremio),
FOREIGN KEY (id_Persona) REFERENCES Persona (idPersona),
PRIMARY KEY (id_Premio, id_Persona)
);

ALTER TABLE table MODIFY field type1 NOT NULL

INSERT INTO Nacionalidad (IdNacionalidad, Nacionalidad) 
VALUES
('1','Perú'),
('2','Rusia'),
('3','Holanda'),
('4','EEUU'),
('5','Canadá'),
('6','China'),
('7','Colombia'),
('8','India'),
('9','Alemania');

INSERT INTO Persona (IdPersona, Nombre, Apellidos, FechaNacimiento, id_Nacionalidad)
VALUES
('1','Juan Carlos', 'Perez', '1970-07-01', '1'),
('2','Konstantin', 'Novoselov', '1974-08-23', '2'),
('3','Andre', 'Geim', '1958-10-01', '3'),
('4','George', 'Smith', '1930-05-10', '4'),
('5','Willard', 'Boyle', '1924-08-19', '5'),
('6','Charles', 'Kao', '1933-11-04', '6'),
('7','Barack', 'Obama', '1961-08-04', '4'),
('8','Gabriel', 'García Márquez', '1927-03-06', '7'),
('9','Amartya', 'Sen', '1933-11-03', '8'),
('10','Gunter', 'Blobel', '1936-05-21', '9');

UPDATE Persona SET Nombre='Barack' WHERE Apellidos='Obama';
//Para cambiar el nombre donde se cumpla una condición.

INSERT INTO Campo(IdCampo, Campo)
VALUES
('1','Física'),
('2','Paz'),
('3','Literatura'),
('4','Economía'),
('5','Medicina');

INSERT INTO Premio (idPremio, Año, Actividad, id_Campo)
VALUES
('1', '2010', 'Material bidimensional grafeno', '1'),
('2', '2010', 'Material bidimensional grafeno', '1'),
('3', '2010', 'Sensor CCD', '1'),
('4', '2010', 'Sensor CCD', '1'),
('5', '2010', 'Sensor CCD', '1'),
('6', '2009', '', '2'),
('7', '1982', 'Obra Cien Años de Soledad', '3'),
('8', '1998', 'Economía del bienestar', '4'),
('9', '1999', 'Situación proteínas en la célula', '5');

INSERT INTO Premiado (id_Premio, id_Persona)
VALUES
('1','2'),
('2','3'),
('3','4'),
('4','5'),
('5','6'),
('6','7'),
('7','8'),
('8','9'),
('9','10');


