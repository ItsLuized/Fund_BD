CREATE TABLE Nacionalidad(

	idNacionalidad INTEGER(11) NOT NULL,
	nacionalidad VARCHAR(45) NOT NULL,
	PRIMARY KEY(idNacionalidad)

);

CREATE TABLE Marca(

	idMarca INTEGER(11) NOT NULL,
	idNacionalidad INTEGER(11) NOT NULL,
	marca VARCHAR(100) NOT NULL,
	PRIMARY KEY(idMarca),
	FOREIGN KEY(idNacionalidad) REFERENCES Nacionalidad(idNacionalidad)
);

CREATE TABLE Cliente(

	idCliente INTEGER(11) NOT NULL,
	idNacionalidad INTEGER(11) NOT NULL,
	nombres VARCHAR(100) NOT NULL,
	apellidos VARCHAR(100) NOT NULL,
	edad INTEGER(11) NOT NULL,
	PRIMARY KEY(idCliente),
	FOREIGN KEY(idNacionalidad) REFERENCES Nacionalidad(idNacionalidad)

);

CREATE TABLE Modelo(

	idModelo INTEGER(11) NOT NULL,
	idMarca INTEGER(11) NOT NULL,
	modelo VARCHAR(100) NOT NULL,
	PRIMARY KEY(idModelo),
	FOREIGN KEY(idMarca) REFERENCES Marca(idMarca)
);

CREATE TABLE Automovil(

	idAutomovil INTEGER(11) NOT NULL,
	idModelo INTEGER(11) NOT NULL,
	velocidadMaxima INTEGER(11) NOT NULL,
	aceleracion INTEGER(11) NOT NULL,
	caballosdefuerza INTEGER(11) NOT NULL,
	PRIMARY KEY(idAutomovil),
	FOREIGN KEY(idModelo) REFERENCES Modelo(idModelo)
);

CREATE TABLE Compra(

	idCompra INTEGER(11) NOT NULL,
	idCliente INTEGER(11) NOT NULL,
	idAutomovil INTEGER(11) NOT NULL,
	fechaCompra DATE NOT NULL DEFAULT "0000-00-00",
	valorCompra INTEGER(11) NOT NULL,
	PRIMARY KEY(idCompra),
	FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente),
	FOREIGN KEY(idAutomovil) REFERENCES Automovil(idAutomovil)
);

----------------------------------------------------------------------------------------inserts--------------------------------------------------------
INSERT INTO Nacionalidad VALUES
(1,"Perú"),
(2,"Rusia"),
(3,"Holanda"),
(4,"Estados Unidos"),
(5,"Canadá"),
(6,"China"),
(7,"Colombia"),
(8,"India"),
(9,"Alemania"),
(10,"Panamá");

INSERT INTO Marca VALUES
(1,4,"Chevrolet"),
(2,4,"Ford"),
(3,4,"GM");

INSERT INTO Modelo VALUES
(1,1,"Spark"),
(2,1,"Aveo"),
(3,1,"Tahoe"),
(4,2,"Explorer"),
(5,2,"Fusion"),
(6,2,"Fiesta"),
(7,3,"Edge");

INSERT INTO Automovil VALUES 
(1,1,160,7.5,1000),
(2,2,170,9,1400),
(3,3,220,12,3000),
(4,4,220,12,3000),
(5,5,200,10,2000),
(6,6,200,10.4,2300),
(7,7,190,12,1560);

INSERT INTO Cliente VALUES
(1,2,"Pablo","Pinto",30),
(2,8,"Julieta","Ramos",40),
(3,2,"Dafne","Caro",20),
(4,7,"Lorena","Ruge",34),
(5,5,"Andres","Cañas",25),
(6,6,"Camilo","Ramo",23),
(7,3,"Fernando","Camacho",49),
(8,7,"Karen","Zambrano",40),
(9,7,"Carlos","Riaño",47);

INSERT INTO Compra VALUES
(1,2,1,"2017-05-12",18000000),
(2,3,2,"2017-01-02",28000000),
(3,2,1,"2017-02-09",18000000),
(4,3,3,"2017-08-30",180000000),
(5,4,5,"2017-05-07",140000000),
(6,5,2,"2017-06-16",28000000),
(7,2,6,"2017-04-22",52000000),
(8,3,3,"2017-09-16",180000000),
(9,3,3,"2017-09-16",180000000),
(10,3,2,"2017-09-16",180000000),
(11,2,6,"2017-10-16",520000000),
(12,2,1,"2017-10-18",180000000),
(13,8,5,"2017-10-18",140000000),
(14,9,6,"2017-10-19",520000000),
(15,8,1,"2017-10-29",180000000),
(16,9,1,"2017-10-30",180000000);

----------------------------------------------------------------------QUERIES-----------------------------------------------------------------------------

----Punto1
select CONCAT(Cliente.nombres,' ',Cliente.apellidos) nombreCompleto, Cliente.edad, Nacionalidad.nacionalidad
from Cliente
inner join Nacionalidad on Nacionalidad.idNacionalidad=Cliente.idNacionalidad
where  Cliente.apellidos LIKE 'C%' AND Cliente.nombres like '%O'
order by Cliente.edad and Nacionalidad.nacionalidad;

----Punto2 falta
select max(numeroAutomovilesVendidos) numeroAutomovilesVendidos, Modelo.modelo modeloAutomovil, Marca.marca marcaAutomovil
from(
select count(Modelo.idmodelo) numeroAutomovilesVendidos, Modelo.modelo modeloAutomovil, Marca.marca marcaAutomovil
from Compra
inner join Automovil ON Automovil.idAutomovil=Compra.idAutomovil
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca
group by modeloAutomovil) Q1, Compra C
inner join Automovil ON Automovil.idAutomovil=C.idAutomovil
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca;
---subquery
select count(Modelo.idmodelo) numeroAutomovilesVendidos, Modelo.modelo modeloAutomovil, Marca.marca marcaAutomovil
from Compra
inner join Automovil ON Automovil.idAutomovil=Compra.idAutomovil
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca
group by modeloAutomovil;
having numeroAutomovilesVendidos=5

-----Punto3
select Modelo.modelo modeloAutomovil, Marca.marca marcaAutomovil, velocidadMaxima
from Automovil
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca
where velocidadMaxima=(select max(velocidadMaxima) from Automovil);

-----Punto4
select CONCAT(Cliente.nombres,' ',Cliente.apellidos) nombreCompleto,count(Compra.idCompra) numeroAutomovilesComprados
from Compra
inner join Cliente ON Cliente.idCliente=Compra.idCliente
group by nombreCompleto;

-----Punto5
select CONCAT(Cliente.nombres,' ',Cliente.apellidos) nombreCompleto,avg(Compra.valorCompra) promedioValorCompra
from Compra
inner join Cliente ON Cliente.idCliente=Compra.idCliente
group by nombreCompleto;

----Punto6
select Modelo.modelo modeloAutomovil, Marca.marca marcaAutomovil
from Automovil
left outer join Compra ON Automovil.idAutomovil=Compra.idAutomovil
left outer join Modelo on Modelo.idModelo=Automovil.idModelo
left outer join Marca on Marca.idMarca=Modelo.idMarca
where Compra.idCompra is Null;

-----Punto7 falta
SELECT concat(Cliente.Nombres," ",Cliente.apellidos) nombreCompleto, edad, Nacionalidad.nacionalidad, max(Compra.idAutomovil) carrosComprados
from Cliente
INNER join Nacionalidad ON Cliente.idNacionalidad = Nacionalidad.idNacionalidad
INNER join Compra ON Cliente.idCliente = Compra.idCliente
WhERE Compra.idAutomovil IN (
	select count(idAutomovil) 
	from Compra
	group by idAutomovil
	);

--------Punto8
select avg(velocidadMaxima) PromedioVelocidadMaxima
from Automovil;

-------Punto9
select b.modelo, b.marca, b.nacionalidad, b.VelocidadMaxima, b.Aceleracion, max(b.automovil) as comprados
from (select modelo, marca, nacionalidad, VelocidadMaxima, Aceleracion, count(a.idAutomovil) as automovil
		from automovil a
	INNER join modelo ON a.idModelo = modelo.idModelo
	INNER join marca ON marca.idMarca = modelo.idMarca
	INNER join compra t ON a.idAutomovil = t.idAutomovil
	INNER join nacionalidad on nacionalidad.idnacionalidad = marca.idNacionalidad
	INNER join cliente l on l.idCliente = t.idCliente				
	WhERE l.edad > 35 AND l.idnacionalidad = 7
	GROUP by a.idAutomovil) as b;

------Punto10
select CONCAT(Cliente.nombres,' ',Cliente.apellidos) nombreCompleto, edad, Cl.nacionalidad nacionalidadCliente, CONCAT(Marca.marca,'--',Modelo.modelo,'--',Au.nacionalidad) automovilComprado, valorCompra, fechaCompra
from Automovil
inner join Compra ON Automovil.idAutomovil=Compra.idAutomovil
inner join Cliente ON Cliente.idCliente=Compra.idCliente
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca
inner join Nacionalidad Cl on Cl.idNacionalidad=Cliente.idNacionalidad
inner join Nacionalidad Au  on Au.idNacionalidad=Marca.idNacionalidad
order by fechaCompra;

----------------------------------------------------------------------QUERIES PROGRAMACION----------------------------------------------------------------------
SELECT idMarca, marca, nacionalidad
from Marca
inner join Nacionalidad on Nacionalidad.idnacionalidad=Marca.idnacionalidad;
where marca=?

update Marca set idnacionalidad=(select idnacionalidad from Nacionalidad where nacionalidad=?)
where idMarca=?

select marca, modelo, velocidadMaxima, aceleracion, Automovil.idAutomovil, Automovil.idModelo
from Automovil
inner join Modelo ON Modelo.idmodelo=Automovil.idmodelo
inner join Marca ON Marca.idMarca=Modelo.idMarca;

delete from Automovil
where idAutomovil=?;

delete from Modelo
where idModelo=?;

select *
from cliente
where apellidos LIKE '%o'

select CONCAT(Cliente.nombres,' ',Cliente.apellidos) nombreCompleto, edad, Cl.nacionalidad nacionalidadCliente, sum(valorCompra) sumaCompras
from Automovil
inner join Compra ON Automovil.idAutomovil=Compra.idAutomovil
inner join Cliente ON Cliente.idCliente=Compra.idCliente
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca
inner join Nacionalidad Cl on Cl.idNacionalidad=Cliente.idNacionalidad
group by nombreCompleto
having sumaCompras>=?;

select CONCAT(Cliente.nombres,' ',Cliente.apellidos) nombreCompleto, edad, Cl.nacionalidad nacionalidadCliente, CONCAT(Marca.marca,'--',Modelo.modelo,'--',Au.nacionalidad) automovilComprado, valorCompra, fechaCompra
from Automovil
inner join Compra ON Automovil.idAutomovil=Compra.idAutomovil
inner join Cliente ON Cliente.idCliente=Compra.idCliente
inner join Modelo on Modelo.idModelo=Automovil.idModelo
inner join Marca on Marca.idMarca=Modelo.idMarca
inner join Nacionalidad Cl on Cl.idNacionalidad=Cliente.idNacionalidad
inner join Nacionalidad Au  on Au.idNacionalidad=Marca.idNacionalidad
where fechaCompra>=?
order by fechaCompra;

select Nacionalidad.nacionalidad nacionalidad,count(Cliente.idnacionalidad) conteoClientes, count(Marca.idNacionalidad) conteoMarca
from Nacionalidad
left outer join Cliente on Cliente.idNacionalidad=Nacionalidad.idnacionalidad
left outer join Marca on Marca.idNacionalidad=Nacionalidad.idNacionalidad
group by Nacionalidad.nacionalidad;