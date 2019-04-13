CREATE TABLE Empresa (
    idEmpresa INT PRIMARY KEY,
    nombre VARCHAR (50),
    NIT INT NOT NULL,
);

CREATE TABLE Estrato (
    idEstrato INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    descripcion VARCHAR (50) NOT NULL
);

CREATE TABLE Tarifa (
    idTarifa INT PRIMARY KEY,
    monto INT NOT NULL,
    fecha DATE NOT NULL,
    id_Estrato INT NOT NULL,
    FOREIGN KEY (id_Estrato) REFERENCES Estrato (idEstrato)
);

CREATE TABLE Tipo (
    idTipo INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL
);

CREATE TABLE TipoServicio (
    id_Tipo INT NOT NULL,
    id_Servicio INT NOT NULL,
    FOREIGN KEY (id_Tipo) REFERENCES Estrato (idTipo),
    FOREIGN KEY (id_Servicio) REFERENCES Servicio (idServicio),
    PRIMARY KEY (id_Tipo, id_Servicio)

);

CREATE TABLE CallCenter (
    idCall INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL
);

CREATE TABLE Llamada (
    idLlamada INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    hora VARCHAR (50) NOT NULL
);

CREATE TABLE Contrato (
    idContrato INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    fechaInicio  DATE NOT NULL,
    fechaFinalizacion  DATE NOT NULL
);

CREATE TABLE ServicioContrato (
    id_Servicio INT NOT NULL,
    id_Contrato INT NOT NULL,
    FOREIGN KEY (id_Contrato) REFERENCES Contrato (idContrato),
    FOREIGN KEY (id_Servicio) REFERENCES Servicio (idServicio),
    PRIMARY KEY (id_Contrato, id_Servicio)
);

CREATE TABLE Servicio (
    idServicio INT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    id_Empresa INT NOT NULL,
    id_Tarifa INT NOT NULL,
    Id_Call INT NOT NULL,
    FOREIGN KEY (id_Empresa) REFERENCES Empresa (idEmpresa),
    FOREIGN KEY (id_Tarifa) REFERENCES Tarifa (idTarifa),
    FOREIGN KEY (id_Call) REFERENCES CallCenter (idCall)
);



INSERT INTO Empresa (idEmpresa, nombre, NIT)
VALUES 
(1,"TOLMOX", 1234);

INSERT INTO Estrato (idEstrato, nombre, descripcion)
VALUES 
(1, "Estrato 1", "Menor estrato, reciben subsidios."),
(2, "Estrato 2", "Estrato bajo, reciben subsidios."),
(3, "Estrato 3", "Estrato Medio-bajo, reciben subsidios."),
(4, "Estrato 4", "Estrato Medio-alto."),
(5, "Estrato 5", "Estrato Alto, aportan para dar subsidios."),
(6, "Estrato 6", "Estrato más alto.");

INSERT INTO Tarifa (idTarifa, monto, fecha, id_Estrato)
VALUES 
(1, 12000,'2019-3-01',1),
(2, 17000,'2019-3-04',2),
(3, 25000,'2019-3-02',3),
(4, 35000,'2019-3-07',4),
(5, 60000,'2019-3-05',5);

INSERT INTO Tipo(idTipo, Nombre)
VALUES 
(1,"Cable"),
(2,"Satelite");

INSERT INTO TipoServicio(id_Tipo, id_Sercicio) 
VALUES 
(1,1),
(2,2),
(1,2),
(2,4),
(2,3);

INSERT INTO CallCenter(idCall, nombre) 
VALUES 
(1, "CallCenter");

INSERT INTO Llamada(idLlamada, Nombre, hora)
VALUES 
(1,"Victor", "2pm"),
(2,"Manuela","10am"),
(3, "Manuela","4:30pm"),
(4, "Brian","12pm"),
(5,"Luisa","3:45pm");

INSERT INTO Contrato(idContrato, nombre, fechaInicio, fechaFinalizacion)
VALUES 
(1,"Definido", '2018-07-08', '2019-07-08'),
(2,"Definido",'2018-12-18', '2019-12-18'),
(3,"Definido",'2018-01-28', '2019-01-28'),
(4,"Indefenido",'2018-02-08', '2019-02-08'),
(5,"Indefinido",'2018-06-19', '2019-06-19');


INSERT INTO Servicio(idServicio, nombre, id_Empresa,id_Tarifa,Id_Call) 
VALUES 
(1,"Television",1,1,1),
(2,"Internet",1,2,1),
(3,"Internet Movil",1,3,1),
(4,"Telefonia",1,4,1);

INSERT INTO ServicioContrato (id_Sercicio,id_Contrato)
VALUES 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
