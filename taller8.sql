CREATE TABLE Campo(

	idCampo INTEGER(11) NOT NULL,
	campo VARCHAR(100) NOT NULL,
	PRIMARY KEY(idCampo)

);

CREATE TABLE Nacionalidad(

	idNacionalidad INTEGER(11) NOT NULL,
	nacionalidad VARCHAR(50) NOT NULL,
	PRIMARY KEY(idNacionalidad)

);

CREATE TABLE Persona(

	idPersona INTEGER(11) NOT NULL,
	nombres VARCHAR(45) NOT NULL,
	apellidos VARCHAR(45) NOT NULL,
	fechaNacimiento DATE NOT NULL DEFAULT "0000-00-00",
	idNacionalidad INTEGER(11) NOT NULL,
	PRIMARY KEY(idPersona),
	FOREIGN KEY(idNacionalidad) REFERENCES Nacionalidad(idNacionalidad)

);

CREATE TABLE Premio(

	idPremio INTEGER(11) NOT NULL,
	anio YEAR NOT NULL,
	actividad VARCHAR(255) NOT NULL,
	idCampo INTEGER(11) NOT NULL,
	PRIMARY KEY(idPremio),
	FOREIGN KEY(idCampo) REFERENCES Campo(idCampo)

);

CREATE TABLE Premiado (

	idPremiado INTEGER(11) NOT NULL,
	idPremio INTEGER (11) NOT NULL,
	idPersona INTEGER(11) NOT NULL,
	PRIMARY KEY (idPremiado),
	FOREIGN KEY (idPersona) REFERENCES Persona(idPersona),
	FOREIGN KEY (idPremio) REFERENCES Premio(idPremio)
);

-----------------------------------------------------------------------------INSERTS------------------------------------------------------------------------
INSERT INTO Nacionalidad VALUES
(1,"Peru"),
(2,"Rusia"),
(3,"Holanda"),
(4,"Estados Unidos"),
(5,"Canada"),
(6,"China"),
(7,"Colombia"),
(8,"India"),
(9,"Alemania");

INSERT INTO Campo VALUES
(1,"Fisica"),
(2,"Paz"),
(3,"Literatura"),
(4,"Economia"),
(5,"Medicina");

INSERT INTO Premio VALUES
(1,"2010","Material bidimensional grafeno",1),
(2,"2010","Sensor CCD",1),
(3,"1982","Obra cien años de Soldedad",3),
(4,"1998","Economia del bienestar",4),
(6,"2009","Paz",2),
(5,"1999","Situacion proteinas en la celula",5);

INSERT INTO Persona VALUES 
(1, "Juan Carlos","Perez","1970-07-01",1),
(2,"Konstantin","Novoselov","1974-08-23",2),
(3,"Andre","Geim","1958-10-01",3),
(4,"George","Smith","1930-05-10",4),
(5,"Willard","Boyle","1924-08-19",5),
(6,"Charles","Kao","1933-11-04",6),
(7,"Barack","Obama","1961-08-04",4),
(8,"Gabriel","García Márquez","1927-03-06",7),
(9,"Amartya","Sen","1933-11-03",8),
(10,"Günter","Blobel","1936-05-21",9);

INSERT INTO Premiado VALUES
(1,1,2),
(2,1,3),
(3,2,4),
(4,2,5),
(5,2,6),
(6,6,7),
(7,3,8),
(8,4,9),
(9,5,10);

---------------------------------------------------------------------- QUERIES -----------------------------------------------------------------------------

----- Punto1
select CONCAT(P.nombres,' ',P.apellidos) nombreCompleto, P.fechaNacimiento , N.nacionalidad
from Persona P, Nacionalidad N
where P.idNacionalidad=N.idNacionalidad AND P.nombres LIKE 'G%' AND P.nombres like '%o%'
order by N.nacionalidad ASC;

select CONCAT(Persona.nombres, ' ', Persona.apellidos) nombreCompleto, Persona.fechaNacimiento, nacionalidad
from Persona
inner join Nacionalidad ON Persona.idNacionalidad=Nacionalidad.idNacionalidad
where Persona.nombres LIKE 'G%' AND Persona.nombres like '%o%'
order by nacionalidad asc;

----- Punto2
select CONCAT(P.nombres,' ',P.apellidos) nombrePremiado, N.nacionalidad, C.campo categoriaNobel
from Persona P, Nacionalidad N, Premiado Pre, Campo C, Premio Pri
where P.idNacionalidad=N.idNacionalidad AND Pre.idPersona=P.idPersona AND C.idCampo=Pri.idCampo AND Pre.idPremio=Pri.idPremio;

----- Punto3
select CONCAT(P.nombres,' ',P.apellidos) nombrePremiado, N.nacionalidad, Max(P.fechaNacimiento) fechaNacimiento
from Persona P, Nacionalidad N, Premiado Pre, Premio Pri
where P.idNacionalidad=N.idNacionalidad AND Pre.idPersona=P.idPersona AND Pre.idPremio=Pri.idPremio;

----- Punto4
SELECT Nacionalidad , count(Premiado.idpremio) Veces_Ganadas
FROM Nacionalidad
INNER JOIN Persona ON Persona.idNacionalidad = nacionalidad.idnacionalidad
LEFT outer JOIN Premiado ON  Premiado.idPersona = persona.idPersona
GROUP BY nacionalidad;

----- Punto5
select CONCAT(P.nombres,' ',P.apellidos) nombrePremiado, N.nacionalidad,P.fechaNacimiento fechaNacimiento
from Persona P, Nacionalidad N, Premiado Pre, Premio Pri
where P.idNacionalidad=N.idNacionalidad AND Pre.idPersona=P.idPersona AND Pre.idPremio=Pri.idPremio AND MONTH(P.fechaNacimiento)=8;
 	
----- Punto6
SELECT CONCAT(nombres," ",apellidos) nombreCompleto, nacionalidad, count(P.idpremio) NumeroDePremios
from Persona
INNER JOIN Nacionalidad ON persona.idNacionalidad=nacionalidad.idNacionalidad
left OUTER JOIN Premiado p ON p.idPersona=persona.idPersona
GROUP BY Nacionalidad
having count(P.idPremio)=0;

----- punto7
select Nacionalidad, AVG((year(CURDATE())-year(fechaNacimiento))) Promedio_Edad
from Persona
INNER JOIN Nacionalidad ON Persona.idNacionalidad=Nacionalidad.idNacionalidad
GROUP BY Nacionalidad;

----- Punto9
SELECT CONCAT(nombres," ",apellidos) nombreCompleto, Nacionalidad, fechaNacimiento
FROM Persona
INNER JOIN Nacionalidad ON Persona.idNacionalidad=Nacionalidad.idNacionalidad
WHERE year(fechaNacimiento) BETWEEN 1950 AND 1975
order by fechaNacimiento;

----- Punto9
update Persona AS P1, (select P.idPersona from Persona P where P.nombres="Juan Carlos") AS P2 
SET P1.nombres="Juan",P1.fechaNacimiento="1975-04-10"
where P1.idPersona=P2.idPersona;

----- Punto10
DELETE FROM persona
WHERE idPersona in (SELECT Q1.idPersona FROM
	(SELECT persona.idpersona FROM persona
	 INNER JOIN nacionalidad ON nacionalidad.idNacionalidad = persona.idNacionalidad
	 WHERE nacionalidad LIKE 'china') as Q1);

