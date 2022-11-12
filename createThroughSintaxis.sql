create table DatosChofer(
	IdDatos int primary key,
	Nombre_C varchar(40),
	Apellido varchar(40),
	Celular varchar(10),
	Numero_Licencia int,
	Cedula varchar(10)
);

create table Chofer(
	Id_Chofer int primary key,
	IdDatos int,
	Salario money,
	CONSTRAINT fk_IdDatos Foreign key (IdDatos) References DatosChofer(IdDatos)
);

create table Provincia(
	Codigo_P int primary key not null,
	Nombre_Pro varchar(40) not null
);

create table Bus(
	IdBus int primary key not null,
	Matricula varchar(10) not null,
	Modelo varchar(10) not null,
	Capacidad int not null
);

create table Pasajero(
	IdPasajero int primary key not null,
	DNI varchar(40) not null,
	Nombre_P varchar(40) not null,
	Apellido varchar(40) not null,
	Ciudad varchar(40) not null
);

create table Reporte(
	N_Reporte int primary key not null,
	Cant_P int not null,
	Fecha_Partida date not null,
	Fecha_Llegada date not null,
	Hora_Salida varchar(10) not null,
	Hora_Llegada varchar(10) not null,
	Recorrido varchar(10) not null,
	
	Id_Chofer int not null,
	IdBus int not null,
	Codigo_P int not null,
	
	constraint fk_Id_Chofer foreign key(Id_Chofer) references Chofer(Id_Chofer),
	constraint fk_IdBus foreign key(IdBus) references Bus(IdBus),
	constraint fk_Codigo_P foreign key(Codigo_P) references Provincia(Codigo_P)
	
);

create table Registro(
	Codigo int primary  key not null,
	IdPasajero int not null,
	N_Reporte int  not null,
	constraint fk_IdPasajero foreign key(IdPasajero) references Pasajero(IdPasajero),
	constraint fk_N_Reporte foreign key(N_Reporte) references Reporte(N_Reporte)
);
