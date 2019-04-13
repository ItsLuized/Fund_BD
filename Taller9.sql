--1.- HACER TABLAS

CREATE DATABASE Taller9;

CREATE TABLE Tipologia (
    idTipologia INT PRIMARY KEY,
    Tipologia VARCHAR (50) NOT NULL
);

CREATE TABLE Planeta(
    idPlaneta INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Distancia FLOAT NOT NULL,
    Traslacion FLOAT NOT NULL,
    idTipologia INT NOT NULL,
    FOREIGN KEY (idTipologia) REFERENCES Tipologia(idTipologia)
);

CREATE TABLE Satelite(
    idSatelite INT PRIMARY KEY,
    Nombre VARCHAR(50),
    idPlaneta INT NOT NULL,
    FOREIGN KEY (idPlaneta) REFERENCES Planeta(idPlaneta)
);

--1,5.- LLENAS TABLAS

INSERT INTO Tipologia(idTipologia, Tipologia)
VALUES
('1','Terrestre'),
('2','Joviano');

INSERT INTO Planeta(idPlaneta,Nombre,Distancia,Traslacion,idTipologia)
VALUES
(1,'Mercurio',58000,0.240,1),
(2,'Venus',108202,0.650,1),
(3,'Tierra',149503,1,1),
(4,'Marte',152400,2.130,1),
(5,'Júpiter',778000,11.900,2),
(6,'Saturno',953707,29.424,2),
(7,'Urano',2870000,83.747,2),
(8,'Neptuno',4500000,163.723,2);

INSERT INTO Satelite (idSatelite,Nombre,idPlaneta)
VALUES
('1','Luna','3'),
('2','Fobos','4'),
('3','Delmo','4'),
('4','Adrastea','5'),
('5','Calisto','5'),
('6','Leda','5'),
('7','Kore','5'),
('8','Europa','5'),
('9','Titan','6'),
('10','Tarvis','6'),
('11','Pandora','6'),
('12','Pollux','6'),
('13','Ariel','7'),
('14','Belinda','7'),
('15','Cupido','7'),
('16','Galatea','8'),
('17','Talasa','8');

--2.- CONSULTAS

--1. Consultar nombres de los planetas Jovianos ordenados alfabeticamente.

SELECT Nombre 
FROM Planeta 
WHERE idTipologia = (SELECT idTipologia FROM Tipologia WHERE Tipologia LIKE "Joviano");

/*2.Consultar nombres de los planetas TERRESTRES, 
    que se encuentren a menos de 3000 millones de km del sol.
*/

SELECT Nombre 
FROM Planeta
WHERE idTipologia = (SELECT idTipologia FROM Tipologia WHERE Tipologia LIKE "Terrestre")
AND Distancia < 3000;
    
/*3. Consulta que muestre nombre y periodo de los planetas que no tienen satélite,
    ordenados por periodo de traslacion.  */    

SELECT P.Nombre, P.Traslacion
FROM Planeta P
LEFT JOIN Satelite S
ON P.idPlaneta = S.idPlaneta
WHERE S.idPlaneta IS NULL
ORDER BY P.Traslacion;

--4. Consulta que muestre el nombre y periodo de los planetas que comienzan por "M"

SELECT Nombre, Traslacion
FROM Planeta P
WHERE Nombre LIKE '%M%';

--5. Consulta que muestre los nombres de todos los planetas con sus satelites.

SELECT P.Nombre 'Nombre Planeta', S.Nombre 'Nombre Satelite'
FROM Planeta P
RIGHT JOIN Satelite S
ON P.idPlaneta = S.idPlaneta;

/*6.  Muestre los nombre de todos los planetas con # de satelites que tiene.
    Mostrar tanto planetas que tienen como los que no tienen satelites  */

SELECT P.Nombre 'Planeta', COUNT(S.idPlaneta) '# de Satelites que tiene'
FROM Planeta P
INNER JOIN Satelite S
ON P.idPlaneta = S.idPlaneta
GROUP BY P.Nombre;