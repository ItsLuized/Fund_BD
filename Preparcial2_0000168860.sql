CREATE DATABASE Preparcial2_0000168850;
USE Preparcial2_0000168850;

CREATE TABLE Nacionalidad (
    idNacionalidad INT PRIMARY KEY,
    nacionalidad VARCHAR(50)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    edad INT NOT NULL,
    id_Nacionalidad INT NOT NULL,
    FOREIGN KEY (id_Nacionalidad) REFERENCES Nacionalidad (idNacionalidad)
);

CREATE TABLE Marca (
    idMarca INT PRIMARY KEY,
    marca varchar(100),
    id_Nacionalidad INT NOT NULL,
    FOREIGN KEY (id_Nacionalidad) REFERENCES Nacionalidad (idNacionalidad)
);

CREATE TABLE Modelo (
    idModelo INT PRIMARY KEY,
    modelo VARCHAR(100),
    id_Marca INT NOT NULL,
    FOREIGN KEY (id_Marca) REFERENCES Marca (idMarca)
);

CREATE TABLE Automovil (
    idAutomovil INT PRIMARY KEY,
    velocidadMaxima INT NOT NULL,
    aceleracion INT NOT NULL,
    caballosFuerza INT NOT NULL,
    id_Modelo INT NOT NULL,
    FOREIGN KEY (id_Modelo) REFERENCES Modelo (idModelo)
);

CREATE TABLE Compra (
    idCompra INT PRIMARY KEY,
    valorCompra INT NOT NULL,
    fechaCompra DATE,
    id_Cliente INT NOT NULL,
    id_Automovil INT NOT NULL,
    FOREIGN KEY (id_Cliente) REFERENCES Cliente (idCliente),
    FOREIGN KEY (id_Automovil) REFERENCES Automovil (idAutomovil)
);

INSERT INTO Nacionalidad (idNacionalidad, nacionalidad)
VALUES
(1, 'Venezolano'),
(2, 'Colombiano'),
(3, 'Mexicano'),
(4, 'Italiano'),
(5, 'Español');


INSERT INTO Cliente (idCliente, nombre, apellido, edad, id_Nacionalidad)
VALUES
(1, 'Nicole', 'Continelli', 19, 1),
(2, 'Alessandro', 'Flores', 28, 3),
(3, 'Aida', 'Ruiz', 45, 1),
(4, 'Luis', 'Martinez', 20, 1),
(5, 'Maria', 'Triviño', 56, 4),
(6, 'Andrea', 'Gonzales', 34, 2);


INSERT INTO Marca (idMarca, marca, id_Nacionalidad)
VALUES
(1, 'Toyota', 5),
(2, 'Chevrolet', 3),
(3, 'Renault', 2),
(4, 'Suzuki', 1);

INSERT INTO Modelo (idModelo, modelo, id_Marca)
VALUES
(1, 'Logan', 3),
(2, 'Captiva', 2),
(3, 'Fiesta', 4),
(4, 'Corolla', 3),
(5, 'Prius', 4),
(6, 'Fortuner', 1);


INSERT INTO Automovil (idAutomovil, velocidadMaxima, aceleracion, caballosFuerza, id_Modelo)
VALUES
(1, 220, 40, 50000, 2),
(2, 240, 55, 65000, 4),
(3, 230, 30, 89000, 6),
(4, 220, 48, 34000, 3),
(5, 210, 56, 23000, 5),
(6, 280, 35, 76000, 1);


INSERT INTO Compra (idCompra, valorCompra, fechaCompra, id_Cliente, id_Automovil)
VALUES
(1, 450000, '2019-04-05', 6, 2),
(2, 330000, '2019-03-10', 3, 1),
(3, 450000, '2019-02-05', 4, 2),
(4, 340000, '2019-02-18', 3, 3),
(5, 290000, '2019-01-23', 5, 6),
(6, 220000, '2019-04-30', 1, 5),
(7, 890000, '2019-03-03', 2, 4);

-- CONSULTAS

/* 1.Realizar una consulta que muestre el nombre y apellidos (concatenados), edad y nacionalidad de todos los clientes 
de la compañía, que el apellido comience con la letra C y que el nombre termine con la letra O. Ordenar por edad y luego por nacionalidad. */

SELECT CONCAT(C.nombre, " ", C.apellido) AS "Nombre", C.edad, N.nacionalidad
FROM Cliente C 
INNER JOIN Nacionalidad N 
ON C.id_Nacionalidad = N.idNacionalidad
/*WHERE C.apellido LIKE "C%"
AND C.nombre LIKE "%o"*/
ORDER BY C.edad;

SELECT CONCAT(C.nombre, " ", C.apellido) AS "Nombre", C.edad, N.nacionalidad
FROM Cliente C 
INNER JOIN Nacionalidad N 
ON C.id_Nacionalidad = N.idNacionalidad
/*WHERE C.apellido LIKE "C%"
AND C.nombre LIKE "%o"*/
ORDER BY N.nacionalidad; 

-- 2.Realizar una consulta con el modelo y marca del automóvil más vendido.

SELECT Ma.marca, M.modelo
FROM Modelo M
INNER JOIN Marca Ma
ON M.id_Marca = Ma.idMarca
INNER JOIN Automovil A
ON M.idModelo = A.id_Modelo 
WHERE A.idAutomovil = 
(SELECT MAX(Cuenta.comprados)
FROM
(SELECT COUNT(C.id_Automovil) AS comprados
FROM Compra C 
GROUP BY C.id_Automovil)AS Cuenta
);

-- 3. Realizar una consulta que muestre el modelo y marca del automóvil con la mayor velocidad máxima.

SELECT Ma.marca, M.modelo
FROM Modelo M 
INNER JOIN Marca Ma 
ON M.id_Marca = Ma.idMarca
INNER JOIN Automovil A 
ON M.idModelo = A.id_Modelo
WHERE A.velocidadMaxima = 
(SELECT MAX(A.velocidadMaxima)
FROM Automovil A);

/* 4. Realizar una consulta que muestre el nombre y apellidos (concatenados),
edad y número de automóviles que cada cliente ha comprado.*/

SELECT CONCAT(C.nombre," ", C.apellido) AS "Nombre", C.edad, 
COUNT(Co.id_Cliente) AS Compras
FROM Cliente C
INNER JOIN Compra Co
ON C.idCliente = Co.id_Cliente
GROUP BY C.idCliente;

/*5. Realizar una consulta que muestre el nombre y apellidos (concatenados),
 edad y promedio de dinero gastado en la compra de automóviles.*/

SELECT CONCAT(C.nombre," ", C.apellido) AS "Nombre", C.edad, 
AVG(Co.valorCompra)AS "Promedio de gasto en vehiculos"
FROM Cliente C
INNER JOIN Compra Co
ON C.idCliente = Co.id_Cliente
GROUP BY C.idCliente;

/*6.Realizar una consulta que muestre el modelo
y marca de todos los automóviles que nunca se han vendido.*/

SELECT Ma.marca, M.modelo
FROM Modelo M 
INNER JOIN Marca Ma 
ON M.id_Marca = Ma.idMarca
INNER JOIN Automovil A 
ON M.idModelo = A.id_Modelo
INNER JOIN Compra Co 
ON A.idAutomovil = Co.id_Automovil
WHERE Co.id_Automovil IS NULL;

/*7. Realizar una consulta que muestre el número nombre y apellidos (concatenados), edad
y nacionalidad del cliente que más automóviles haya comprado.*/

SELECT CONCAT(C.nombre," ", C.apellido) AS "Nombre", C.edad, N.nacionalidad
FROM Cliente C
INNER JOIN Nacionalidad N
ON C.id_Nacionalidad = N.idNacionalidad
INNER JOIN Compra Co 
ON C.idCliente = Co.id_Cliente
WHERE C.idCliente = 
(SELECT MAX(Comprados)
FROM 
(SELECT COUNT(Co.id_Cliente)AS Comprados
FROM Compra Co
GROUP BY Co.id_Cliente)AS Todo);

/*8. Realizar una consulta con el promedio de velocidades de los automóviles*/

SELECT AVG(A.velocidadMaxima) AS "Promedio de velocidades"
FROM Automovil A;

/* 9. Realizar una consulta que me muestre modelo, marca, nacionalidad, velocidad y 
aceleración del automóvil más popular entre los mayores de 35 años que sean colombianos.*/

SELECT *
FROM Automovil A 
INNER JOIN Modelo M
ON A.id_Modelo = M.idModelo
INNER JOIN Marca Ma 
ON M.id_Marca = Ma.idMarca
INNER JOIN Nacionalidad N 
ON Ma.id_Nacionalidad = N.idNacionalidad
RIGHT JOIN Cliente C
ON C.idCliente = Co.id_Cliente
INNER JOIN Nacionalidad
ON N.idNacionalidad = C.idNacionalidad
WHERE A.idAutomovil = 
(SELECT MAX(Todo.popular)
FROM
(SELECT COUNT(Co.id_Automovil) AS popular
FROM Compra Co
GROUP BY Co.id_Automovil)AS Todo)
AND C.edad >35 AND N.Nacionalidad = 'Colombiano';