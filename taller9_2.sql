CREATE TABLE Tipologia(

	idTipologia INTEGER(11) NOT NULL,
	tipologia VARCHAR(45) NOT NULL,
	PRIMARY KEY(idTipologia)

);


CREATE TABLE Planeta(

	idPlaneta INTEGER(11) NOT NULL,
	idTipologia INTEGER(11) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	distancia FLOAT(50) NOT NULL,
	traslacion FLOAT(50) NOT NULL,
	PRIMARY KEY(idPlaneta),
	FOREIGN KEY(idTipologia) REFERENCES Tipologia(idTipologia)
);


CREATE TABLE Satelite(

	idSatelite INTEGER(11) NOT NULL,
	idPlaneta INTEGER(11) NOT NULL,
	nombre VARCHAR(45) NOT NULL,
	PRIMARY KEY(idSatelite),
	FOREIGN KEY(idPlaneta) REFERENCES Planeta(idPlaneta)
);

----------------------------------------------------------------------------------------inserts--------------------------------------------------------

INSERT INTO Tipologia(idTipologia, tipologia) VALUES
(1,"Terrestre"),
(2,"Joviano");

INSERT INTO Planeta VALUES
(1,1,"Mercurio",58000,0.240),
(2,1,"Venus",108208,0.650),
(3,1,"Tierra",149503,1),
(4,1,"Marte",152400,2.130),
(5,2,"Júpiter",778000,11.900),
(6,2,"Saturno",953707,29.424),
(7,2,"Urano",2870000,83.747),
(8,2,"Neptuno",4500000,163.823);

INSERT INTO Satelite VALUES
(1,3,"Luna"),
(2,4,"Fobos"),
(3,4,"Delmo"),
(4,5,"Adrastea"),
(5,5,"Calisto"),
(6,5,"Leda"),
(7,5,"Kore"),
(8,5,"Europa"),
(9,6,"Titan"),
(10,6,"Travis"),
(11,6,"Pandora"),
(12,6,"Pollux"),
(13,7,"Ariel"),
(14,7,"Belinda"),
(15,7,"Cupido"),
(16,8,"Galatea"),
(17,8,"Talasa");

----------------------------------------------------------------------QUERIES-----------------------------------------------------------------------------

-----Punto1
select nombre
from Planeta
inner join Tipologia ON Tipologia.idTipologia=Planeta.idTipologia
where tipologia="Joviano"
order by nombre;

-----Punto2
select nombre
from Planeta
where distancia<3000;

----Punto3
select distinct Planeta.nombre, traslacion
from Planeta
left outer join Satelite ON Satelite.idPlaneta=Planeta.idPlaneta
where Satelite.idPlaneta is NULL;

-----Punto4
select nombre, traslacion
from Planeta
where nombre LIKE 'M%';

------Punto5
select Planeta.nombre nombrePlaneta, Satelite.nombre nombreSatelite
from Planeta
inner join Satelite ON Satelite.idPlaneta=Planeta.idPlaneta;

-----Punto6
select distinct Planeta.nombre, count(idSatelite) numeroSatelites
from Planeta
left outer join Satelite ON Satelite.idPlaneta=Planeta.idPlaneta
group by Planeta.nombre;

-----Punto7
select avg(traslacion) PromedioTraslacion
from Planeta;

-----Punto8
SELECT P.Nombre, T.Tipologia, P.Traslacion
FROM Planeta P
INNER JOIN Tipologia T 
ON T.idTipologia = P.idTipologia
WHEN P.Distancia = (SELECT MAX(P.Distancia) 
FROM Planeta P);

----Punto9

update Satelite
SET Satelite.nombre=CONCAT("I","",Satelite.nombre)
where Satelite.nombre in(
	select Q1.nombre
	FROM (
		select Satelite.nombre
		from Satelite
		inner join Planeta ON Planeta.idPlaneta=Satelite.idPlaneta
		where Planeta.nombre="Urano"
		) as Q1
);

----Punto10
delete from Satelite
where (Satelite.nombre LIKE 'P%' AND Satelite.nombre like '%X') or (Satelite.nombre LIKE 'P%' AND Satelite.nombre like '%A');

------Punto11
select distinct Planeta.nombre, count(idSatelite) numeroSatelites, Tipologia.tipologia
from Planeta
left outer join Satelite ON Satelite.idPlaneta=Planeta.idPlaneta
inner join Tipologia ON Tipologia.idTipologia=Planeta.idTipologia
group by Planeta.nombre
having count(idSatelite)>=2;

