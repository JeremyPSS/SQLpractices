create database biblioteca; 

create table Autor(
	id_autor int primary key not null,
	nombre varchar(50) not null,
	nacionalidad varchar(50) not null,
	anio_nacimiento int not null
);

create table Resena(
	id_resena int primary key not null,
	fecha varchar(50) not null,
	revista varchar(50) not null
);

create table Libro(
	id_libro int primary key not null,
	titulo varchar(50) not null,
	genero varchar(50) not null,
	id_resena int not null,
	constraint fk_idresena foreign key (id_resena) references Resena(id_resena)
);

create table Edicion(
	id_edicion int primary key not null,
	ISBN int not null,
	fecha varchar(50) not null,
	revista varchar(50) not null
);

create table Copia(
	id_copia int primary key not null,
	numero int not null
);

create table Usuario(
	id_usuario int primary key not null,
	cedula varchar(10) not null,
	email varchar(100) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null
	
);

create table prestamo(
	id_copia int,
	id_usuario int,
	fecha_prestamo date,
	fecha_devolucion date,
	constraint fk_idcopia foreign key (id_copia) references Copia(id_copia),
	constraint fk_idusuario foreign key (id_usuario) references Usuario(id_usuario)	
);

CREATE OR REPLACE FUNCTION proteger_datos() RETURNS TRIGGER AS $proteger_datos$
DECLARE
BEGIN
RETURN NULL;
END
$proteger_datos$ LANGUAGE plpgsql;

--1º trigger
CREATE OR REPLACE TRIGGER proteger_datosLibro BEFORE DELETE
on libro FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();
--2º trigger
CREATE OR REPLACE TRIGGER proteger_datosUsuario BEFORE DELETE
on usuario FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();
--3º trigger
CREATE OR REPLACE TRIGGER proteger_datosPrestamo BEFORE DELETE
on prestamo FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();
--4º trigger
CREATE OR REPLACE TRIGGER proteger_datosAutor BEFORE DELETE
on autor FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();
--5º trigger
CREATE OR REPLACE TRIGGER proteger_datosEdicion BEFORE DELETE
on edicion FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();
--6º trigger
CREATE OR REPLACE TRIGGER proteger_datosResena BEFORE DELETE
on resena FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();

CREATE TABLE cambios(
timestamp_ TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
nombre_disparador TEXT,
tipo_disparador TEXT,
nivel_disparador TEXT,
comando TEXT);
CREATE OR REPLACE FUNCTION sp_grabar_operaciones() returns trigger as $grabar_operaciones$
DECLARE BEGIN
INSERT INTO cambios(nombre_disparador,tipo_disparador,nivel_disparador,comando)
VALUES (TG_NAME, TG_WHEN,TG_LEVEL,TG_OP);
RETURN NULL;
END;
$grabar_operaciones$ LANGUAGE plpgsql;
--7º trigger
CREATE TRIGGER tri_grabar_operaciones AFTER INSERT OR UPDATE OR DELETE
ON autor FOR EACH STATEMENT
EXECUTE PROCEDURE sp_grabar_operaciones();


CREATE OR REPLACE FUNCTION sp_rellenar_datos() RETURNS TRIGGER AS $rellenar_datos$
DECLARE
BEGIN
NEW.fecha := 'ninguna';
NEW.revista  := 'ninguna';
RETURN NEW;
END;
$rellenar_datos$ LANGUAGE plpgsql;
--8º trigger
CREATE TRIGGER tri_rellenar_datos BEFORE INSERT OR UPDATE
ON resena FOR EACH ROW
EXECUTE PROCEDURE sp_rellenar_datos();