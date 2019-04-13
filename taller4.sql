CREATE TABLE Empresa(

	idEmpresa INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	NIT VARCHAR (11) NOT NULL,
	direccion VARCHAR (30) NOT NULL
	
	);

CREATE TABLE Funcion(

	idFuncion INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	descripcion VARCHAR (250) NOT NULL
	);

CREATE TABLE Especialidad(

	idEspecialidad INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	descripcion VARCHAR (250) NOT NULL
	
	);

CREATE TABLE Tipo(

	idTipo INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL
	);

CREATE TABLE Departamento(

	idDepartamento INT PRIMARY KEY,
	presupuestoBecas INTEGER (30) NOT NULL,
	idEmpresa INT NOT NULL,
	FOREIGN KEY (idEmpresa) REFERENCES Empresa(idEmpresa)

	);

CREATE TABLE Proyecto(

	idProyecto INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	fechaInicio VARCHAR(150) NOT NULL,
	fechaFin VARCHAR(150) NOT NULL,
	maximoIngenieros INT NOT NULL,
	idDepartamento INT NOT NULL,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento)

	);

CREATE TABLE TipoFuncion(
	idTipo INT NOT NULL,
	idFuncion INT NOT NULL,
	FOREIGN KEY (idTipo) REFERENCES Tipo(idTipo),
	FOREIGN KEY (idFuncion) REFERENCES Funcion(idFuncion),
	PRIMARY KEY (idTipo, idFuncion)
	);

CREATE TABLE Empleado(

	idEmpleado INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	cedula VARCHAR(20) NOT NULL,
	salario INT NOT NULL,
	numeroSeguridadSocial INT NOT NULL,
	idDepartamento INT NOT NULL,
	idTipo INT NOT NULL,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento),
	FOREIGN KEY (idTipo) REFERENCES Tipo(idTipo)
	);

CREATE TABLE EmpleadoEspecialidad(

	idEmpleado INTEGER(11) NOT NULL,
	idEspecialidad INTEGER(11) NOT NULL,
	FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado),
	FOREIGN KEY (idEspecialidad) REFERENCES Especialidad(idEspecialidad),
	PRIMARY KEY (idEmpleado, idEspecialidad)
	);

CREATE TABLE Hijo(

	idHijo INT PRIMARY KEY,
	nombre VARCHAR (15) NOT NULL,
	fechaNacimiento VARCHAR(150) NOT NULL,
	idEmpleado INT NOT NULL,
	FOREIGN KEY (idEmpleado) REFERENCES Empleado(idEmpleado)

	);

CREATE TABLE Beca(

	idBeca INT PRIMARY KEY,
	monto INT NOT NULL,
	fechaConcesion VARCHAR(150) NOT NULL,
	idDepartamento INT NOT NULL,
	idHijo INT NOT NULL,
	FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento),
	FOREIGN KEY (idHijo) REFERENCES Hijo(idHijo)

	);

CREATE TABLE EstudioAcademico(

	idEstudioAcademico INT PRIMARY KEY,
	tipo VARCHAR (150) NOT NULL,
	idHijo INTEGER (11) NOT NULL,
	FOREIGN KEY (idHijo) REFERENCES Hijo(idHijo)

	);

-----------------------------------------------------------------------------INSERTS-----------------------------------------------------------------------------

insert into Empresa (idEmpresa, nombre, NIT, direccion) values 
(1, 'Kattie',1053, '86 Fisk Pass'),
(2, 'Ermina',9335, '09435 Logan Plaza'),
(3, 'Ernest',6194 ,'802 Sunbrook Hill'),
(4, 'Wang',5303, '5434 Crest Line Center'),
(5, 'Jory',5028 ,'810 Oak Valley Drive'),
(6, 'Lilly',4541 ,'138 Gulseth Plaza'),
(7, 'Netti',4093 ,'1396 Straubel Plaza'),
(8, 'Marianna',2227 ,'5742 Dovetail Parkway'),
(9, 'Valerye',5251, '212 Rieder Parkway'),
(10, 'Juana',9335,'7861 Towne Avenue');
    
insert into Funcion (idFuncion, nombre, descripcion) values 
(1, 'Health ', 'Carpal tunnel release'),
(2, 'Environmental ', 'Total mandibulectomy NEC'),
(3, 'Professor', 'Hemorrhoid injection'),
(4, 'Therapist', 'Impl CRT pacemaker sys'),
(5, 'Mechanical', 'Ins part disc pros cerv'),
(6, 'VP Product ', 'Endolymphatic shunt'),
(7, 'Desktop ', 'Cls red-radius/ul epiphy'),
(8, 'Financial ', 'Excise inguinal node'),
(9, 'Systems ', 'Stretching of foreskin'),
(10, 'Marketing ', 'Excis les lacrimal gland');

insert into Especialidad (idEspecialidad, nombre, descripcion) values 
(1, 'LabWindows/CVI', 'Pathological fracture, left ulna, initial encounter for fracture'),
(2, 'DNA Sequencing', 'Abrasion, unspecified lesser toe(s), sequela'),
(3, 'WLM', 'Alpha-1-antitrypsin deficiency'),
(4, 'Pyrography', 'Toxic effect of venom of other snake, assault, initial encounter'),
(5, 'ICD-9', 'Contusion of sigmoid colon'),
(6, 'SLC500', 'Other paralytic syndrome following nontraumatic subarachnoid hemorrhage affecting left dominant side'),
(7, 'Painting', 'Burn of first degree of multiple sites of right lower limb, except ankle and foot, initial encounter'),
(8, 'ILS', 'Corrosion of unspecified eye and adnexa, part unspecified, sequela'),
(9, 'Xerces', 'Glaucoma secondary to drugs, bilateral'),
(10, 'RHIT', 'Other vitreous opacities, bilateral');

insert into Tipo (idTipo, nombre) values 
(1, 'Outdoors'),
(2, 'Electronics'),
(3, 'Health'),
(4, 'Jewelery'),
(5, 'Tools'),
(6, 'Fancy'),
(7, 'Indumentary'),
(8, 'Games'),
(9, 'Sports'),
(10, 'Home');

insert into Departamento (idDepartamento, presupuestoBecas, idEmpresa) values 
(1, 79685108, 6),
(2, 86685597, 3),
(3, 61894439, 2),
(4, 49178950, 1),
(5, 50874843, 3),
(6, 51111437, 4),
(7, 38140857, 8),
(8, 87883335, 3),
(9, 25468793, 1),
(10, 8989378, 4);

insert into Proyecto (idProyecto, nombre, fechaInicio, fechaFin, maximoIngenieros, idDepartamento) values 
(1, 'Sonsing', '2017-03-03', '2017-04-07', 19, 8),
(2, 'Overhold', '2016-11-06', '2016-11-11', 23, 3),
(3, 'Fintone', '2016-07-05', '2017-02-11', 21, 3),
(4, 'Quo Lux', '2017-02-28', '2016-05-06', 30, 6),
(5, 'Mat Lam Tam', '2016-11-04', '2017-01-23', 8, 9),
(6, 'Voyatouch', '2017-01-08', '2017-04-11', 34, 1),
(7, 'Transcof', '2016-10-11', '2016-11-14', 31, 1),
(8, 'Fixflex', '2016-10-13', '2017-02-03', 23, 1),
(9, 'Opela', '2016-05-04', '2017-04-06', 19, 9),
(10, 'Daltfresh', '2016-05-25', '2017-02-26', 24, 7);

insert into TipoFuncion (idTipo, idFuncion) values
(2, 2),
(4, 9),
(8, 9),
(2, 3),
(2, 5),
(10, 10),
(8, 5),
(5, 7),
(5, 2),
(2, 1);

insert into Empleado (idEmpleado, nombre, cedula, salario, numeroSeguridadSocial, idDepartamento, idTipo) values 
(1, 'Correy', '20-486-9291', 1229962, 69627626, 2, 5),
(2, 'Eal', '45-634-2162', 2749993, 57310297, 10, 8),
(3, 'Derrek', '92-964-0887', 1153615, 0798076186, 4, 8),
(4, 'Kent', '11-671-8387', 1836795, 0236521934, 5, 4),
(5, 'Tobin', '92-967-8970', 780735, 52248192, 8, 3),
(6, 'Mickie', '68-211-2297', 2310625, 0088851141, 3, 7),
(7, 'Tonnie', '70-938-1898', 1839183, 39154185, 1, 9),
(8, 'Caitlin', '85-758-7479', 802613, 55149167, 8, 8),
(9, 'Warner', '62-849-7122', 1167297, 89358859, 8, 3),
(10, 'Jamison', '38-268-9557', 2444422, 1903381398, 8, 3);

insert into EmpleadoEspecialidad (idEmpleado, idEspecialidad) values 
(1, 7),
(4, 6),
(6, 2),
(7, 8),
(5, 7),
(2, 6),
(2, 2),
(4, 6),
(9, 6),
(1, 4);

insert into Hijo (idHijo, nombre, fechaNacimiento, idEmpleado) values 
(1, 'Leslie', '1993-03-27', 5),
(2, 'Tally', '1998-09-09', 2),
(3, 'Hadrian', '2000-09-20', 7),
(4, 'Paton', '1994-02-12', 5),
(5, 'Thea', '1996-10-11', 1),
(6, 'Ermanno', '1991-03-27', 9),
(7, 'Sigmund', '1996-12-26', 2),
(8, 'Allyn', '1993-02-17', 8),
(9, 'Nata', '2001-01-28', 3),
(10, 'Magdaia', '2003-02-04', 8);

insert into Beca (idBeca, monto, fechaConcesion, idDepartamento, idHijo) values 
(1, 7521377, '1996-08-03', 7, 7),
(2, 8474240, '1992-03-16', 2, 6),
(3, 8705732, '2003-06-14', 9, 7),
(4, 7155725, '1998-08-11', 4, 7),
(5, 1118970, '2002-10-08', 3, 1),
(6, 2233215, '1993-02-20', 4, 2),
(7, 6271524, '1993-08-26', 2, 4),
(8, 6043295, '1997-08-10', 7, 9),
(9, 6467229, '1999-05-22', 7, 1),
(10, 4143073, '1994-12-31', 5, 5);

insert into EstudioAcademico (idEstudioAcademico, tipo, idHijo) values 
(1, 'Bachillerato', 7),
(2, 'Primaria', 2),
(3, 'Primaria', 10),
(4, 'Bachillerato', 9),
(5, 'Bachillerato', 4),
(6, 'Bachillerato', 5),
(7, 'Tecnico', 10),
(8, 'Bachillerato', 4),
(9, 'Tecnico', 6),
(10, 'Primaria', 4);