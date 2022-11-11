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

---1º
CREATE FUNCTION public."Buscar"()
    RETURNS integer
    LANGUAGE 'plpgsql'
    
AS $BODY$
---2º
declare ultimoID integer;
BEGIN
    select max(id_libro) INTO ultimoID FROM libro;
    RETURN ultimoID;
END;
$BODY$;

ALTER FUNCTION public."Buscar"()
    OWNER TO postgres;
---3º
create or replace function suma(numeric, numeric) returns numeric
as $$
declare
    a numeric;
    b numeric;
    res numeric;
begin
    a:=$1;
    b:=$2;
    res := a+b;
    return res;
end;
$$ LANGUAGE plpgsql;
---4º
create or replace function fibonacci(int) returns int
as $$
declare
    a int;
    
    res int :=0;
begin
    a:=$1;
    if(a=1 or a =2) then
        res :=1;
    else
        res:= fibonacci(a-2) + fibonacci(a-1);
    end if;
    return res;
end;
$$ LANGUAGE plpgsql;
---5º
create or replace function deleteAuthor(
    id_autor INT
) returns varchar(50)
language plpgsql
as $$
BEGIN
    DELETE FROM autor WHERE id_autor = id_autor;
    RETURN 'eliminado';
END
$$;
---6º
create or replace function esPositivo(int) returns boolean
as $$
declare
    a int;
    
    res boolean :=false;
begin
    a:=$1;
    if(a>0) then
        res :=true;
    else
        if(a=0) then
        res := true;
        end if;
    end if;
    return res;
end;
$$ LANGUAGE plpgsql;
---7º
create or replace function getalllibros() returns libro
language SQL
as $$
    SELECT * FROM libro;
$$
---8º
create or replace function getallusuarios() returns usuario
language SQL
as $$
    SELECT * FROM usuario;
$$
---9º
create or replace function getlibroById(id_libro int) returns libro
language SQL
as $$
    SELECT * FROM libro WHERE id_libro = id_libro;
$$
---10º
create or replace function getUsuarioById(id_usuario int) returns usuario
language SQL
as $$
    SELECT * FROM usuario WHERE id_usuario = id_usuario;
$$



