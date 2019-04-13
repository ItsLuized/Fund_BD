CREATE TABLE Presidente(
	idPresidente INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	edad INT NOT NULL,
	fechaNacimiento VARCHAR(150) NOT NULL,
	periodoMandatos INT NOT NULL
);

CREATE TABLE Alcalde(
	idAlcalde INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	apellido VARCHAR(20) NOT NULL,
	edad INT NOT NULL,
	fechaNacimiento VARCHAR(150) NOT NULL,
	periodoMandatos INT NOT NULL
);

CREATE TABLE Pais(
	idPais INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	continente VARCHAR(20) NOT NULL,
	codigoArea INT NOT NULL,
	extension INT NOT NULL,
	numeroHabitantes INT NOT NULL,
	idPresidente INT NOT NULL,
	FOREIGN KEY (idPresidente) REFERENCES Presidente(idPresidente)
);

CREATE TABLE Ciudad(

	idCiudad INT PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL,
	extension INT NOT NULL,
	numeroHabitantes INT NOT NULL,
	nivelMar INT NOT NULL,
	idAlcalde INT NOT NULL,
	FOREIGN KEY (idAlcalde) REFERENCES Alcalde(idAlcalde)
);

CREATE TABLE PaisCiudad(
	idPais INT NOT NULL,
	idCiudad INT NOT NULL,
	FOREIGN KEY (idPais) REFERENCES Pais(idPais),
	FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad),
	PRIMARY KEY (idPais, idCiudad)
);

----------------------------------------------------------------------------- VALORES ------------------------------------------------------------------------

INSERT INTO Presidente VALUES
(1,"Juan Manuel","Santos",65,"10 de Agosto de 1951",2),
(2,"Donald","Trump",70,"14 de Junio de 1946",1),
(3,"Francois","Hollande",62,"12 de Agosto de 1954",1),
(4,"Mariano","Rajoy",62,"27 de Marzo de 1955",2),
(5,"Nicolas","Maduro",54,"23 de noviembre de 1962",2);

INSERT INTO Alcalde VALUES
(1,"Enrique","Peñalosa",62,"30 de septiembre de 1954",2),
(2,"Muriel","Bowser",44,"2 de agosto de 1972",1),
(3,"Anner","Hidalgo",57,"19 de junio de 1959",1),
(4,"Manuela","Carmena",73,"9 de febrero de 1944",1),
(5,"Antonio","Ledezma",61,"1 de mayo de 1955",2);

INSERT INTO Pais VALUES
(1,"Colombia","Sudamerica",57,1142,47120000,1),
(2,"Estados Unidos","Norteamerica",1,9834,318900000,2),
(3,"Francia","Europa",33,643,66030000,3),
(4,"España","Europa",34,501,46770000,4),
(5,"Venezuela","Sudamerica",58,916,30410000,5);

INSERT INTO Ciudad VALUES
(1,"Bogotá D.C.",1587,8081000,2630,1),
(2,"Washington D.C.",177,658893,125,2),
(3,"Paris",105,2244000,35,3),
(4,"Madrid",604,3165000,667,4),
(5,"Caracas",777,2104000,900,5);

INSERT INTO PaisCiudad VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);





SELECT PA.continente, PA.nombre ,PR.nombre FROM Pais PA INNER JOIN Presidente PR ON PA.idPais=PR.idPresidente;

--QUERY PARA OBTENER FECHA DE NACIMIENTO DE LAS CUALES SON LOS MAS JOVENES ** fechaNacimiento tiene que ser DATE
select PR.* FROM Presidente WHERE PR.fechaNacimiento =(SELECT MAX(fechaNacimiento) FROM Presidente);

SELECT E.* from Estudiante WHERE E.porcentajeBeca =(SELECT MAX(porcentajeBeca) FROM  Beca);

select PR.idPresidente, CONCAT(PR.nombre,' ',PR.apellido) nombreCompleto, CASE WHEN PR.edad >60 THEN 'Mayor de 60' when PR.periodoMandatos>1 then 'Mas de un periodo' END
from Presidente PR;

alter table Pais
add nombrePeriodos varchar(30);

UPDATE Pais SET nombrePeriodos='Dictador'
where idPresidente IN( 
	SELECT idPresidente from Presidente where periodoMandatos=2);

	