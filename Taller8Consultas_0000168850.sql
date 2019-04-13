--1

SELECT CONCAT(Nombre, " ", Apellidos) Nombre, CONCAT(FechaNacimiento) "Fecha de Nacimiento", Nacionalidad 
FROM Persona INNER JOIN Nacionalidad ON Persona.id_Nacionalidad = Nacionalidad.IdNacionalidad;

--1.2 

SELECT CONCAT(Nombre, " ", Apellidos) Nombre, CONCAT(FechaNacimiento) "Fecha de Nacimiento", Nacionalidad 
FROM Persona INNER JOIN Nacionalidad ON Persona.id_Nacionalidad = Nacionalidad.IdNacionalidad;
WHERE Persona.Nombres LIKE '%G%'
AND Persona.Apellidos LIKE '%o%';

--1.3 
SELECT CONCAT(Nombre, " ", Apellidos) Nombre, CONCAT(FechaNacimiento) "Fecha de Nacimiento", Nacionalidad 
FROM Persona INNER JOIN Nacionalidad ON Persona.id_Nacionalidad = Nacionalidad.IdNacionalidad;
ORDER BY Nombres;


--1.4 

SELECT CONCAT(Nombre, " ", Apellidos) Nombre, CONCAT(FechaNacimiento) "Fecha de Nacimiento", Nacionalidad 
FROM Persona INNER JOIN Nacionalidad ON Persona.id_Nacionalidad = Nacionalidad.IdNacionalidad;
ORDER BY Nacionalidad.Nacionalidad;

--2

SELECT CONCAT(Nombres, Apellidos) Nombre, Nacionalidad, Campo
FROM Nacionalidad Nac NATURAL JOIN Persona Per
NATURAL JOIN Premiado Pre
NATURAL JOIN Premio Prmi NATURAL JOIN Campo C;

--3

SELECT CONCAT(Nombres, ' ', Apellidos) Nombre, MAX(FechaNacimiento)
FROM Premiado NATURAL JOIN Persona;


--4

SELECT Nacionalidad, COUNT(idPremio)
  FROM Nacionalidad Nac NATURAL JOIN Persona Per
  LEFT OUTER JOIN Premiado Pre ON Per.idPersona = Pre.idPersona
  GROUP BY (Nac.idNacionalidad);

--5

SELECT CONCAT(Nombres,' ',Apellidos), Campo
  FROM Persona NATURAL JOIN Premiado
  NATURAL JOIN Premio
  NATURAL JOIN Campo
  WHERE Persona.FechaNacimiento LIKE '%-08-%';

--6

SELECT CONCAT(Nombres,' ',Apellidos)Nombre, Nacionalidad
FROM Nacionalidad Nac NATURAL JOIN Persona Per
LEFT OUTER JOIN Premiado Pre ON Per.idPersona = Pre.idPersona
WHERE idPremio IS NULL;

-- 7

SELECT Nacionalidad, AVG(YEAR(CURRENT_DATE) - YEAR(FechaNacimiento)) Edad_Promedio
FROM Persona NATURAL JOIN Nacionalidad
GROUP BY idNacionalidad;

-- 8

SELECT CONCAT(Nombres,' ',Apellidos)Nombre, Nacionalidad
FROM Persona NATURAL JOIN Nacionalidad
WHERE YEAR(FechaNacimiento) BETWEEN 1950 AND 1975;

--9
UPDATE Persona SET Nombres = 'Juan', FechaNacimiento = '1975-04-10'
WHERE Nombres LIKE 'Juan Carlos' AND Apellidos LIKE '%Pérez%';

--10

DELETE FROM Persona
WHERE idNacionalidad = (SELECT idNacionalidad FROM Nacionalidad WHERE Nacionalidad LIKE 'China');
