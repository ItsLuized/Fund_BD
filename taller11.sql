-----------------------------queries-----------------------------------

--tabla campo==tabla categoria--

INSERT INTO Persona (idPersona,nombres,apellidos,fechaNacimiento,idNacionalidad) 
VALUES(?,?,?,?,(SELECT idNacionalidad FROM Nacionalidad WHERE nacionalidad=?));

SELECT idPersona, nombres, apellidos, nacionalidad, fechaNacimiento
from Persona
inner join Nacionalidad on Nacionalidad.idnacionalidad=Persona.idnacionalidad;
where nombres=?

SELECT Nacionalidad , count(Premiado.idpremio) Veces_Ganadas
FROM Nacionalidad
INNER JOIN Persona ON Persona.idNacionalidad = nacionalidad.idnacionalidad
LEFT outer JOIN Premiado ON  Premiado.idPersona = persona.idPersona
where nacionalidad=?
GROUP BY nacionalidad;

-----version1
select CONCAT(P.nombres,' ',P.apellidos) nombrePremiado, N.nacionalidad, C.campo categoriaNobel, Pri.anio Año, Pre.idPremio, P.idPersona
from Persona P, Nacionalidad N, Premiado Pre, Campo C, Premio Pri
where P.idNacionalidad=N.idNacionalidad AND Pre.idPersona=P.idPersona AND C.idCampo=Pri.idCampo AND Pre.idPremio=Pri.idPremio;

------version2
select CONCAT(Persona.nombres,' ',Persona.apellidos) nombrePremiado, Campo.campo categoriaNobel, Premio.anio AñoPremio, year(Persona.fechaNacimiento) AñoNacimiento
from persona
inner join Premiado on Premiado.idPersona=Persona.idPersona
inner join Premio on Premio.idPremio=Premiado.idPremio
inner join Campo on Campo.idCampo=Premio.idCampo
WHERE year(Persona.fechaNacimiento)=?;


(select year(fechaNacimiento) anio, count(year(fechaNacimiento)) vecesUsadas, count(persona.idPersona)
from persona
group by anio)
union
(select anio, count(anio), count(premio.idpremio)
from premio
group by anio);


select anio Año, count(Premio.anio)
from Premiado
left outer join Persona on Persona.idPersona=Premiado.idPersona
left outer join Premio on Premio.idPremio=Premiado.idPremio
group by año;

----ultimo punto
select actividad, anio, Campo.campo, idPremio
from Premio
inner join Campo on Campo.idCampo=Premio.idCampo;

select CONCAT(nombres,' ',apellidos) nombreCompleto, fechaNacimiento , idPersona
from persona;

select idPremiado
from Premiado
order by idPremiado;