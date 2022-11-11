
/*CREACIÓN DE LA BASE DE DATOS 'PEDIDOS' */
/*Author: Jeremy Prieto*/
drop database if exists PEDIDOS;

create database PEDIDOS;

CREATE TABLE EMPLEADOS(
EMPLEADOID int NOT NULL,
NOMBRE char(30) NULL,
APELLIDO char(30) NULL,
FECHA_NAC date NULL,
REPORTA_A int NULL,
EXTENSION int NULL,
CONSTRAINT PK_EMPLEADOS PRIMARY KEY (EMPLEADOID));

CREATE TABLE PROVEEDORES(
PROVEEDORID int NOT NULL,
NOMBREPROV char(50) NOT NULL,
CONTACTO char(50) NOT NULL,
CELUPROV char(12) NULL,
FIJOPROV char(12) NULL,
CONSTRAINT PK_PROVEEDORES PRIMARY KEY
(PROVEEDORID ) );

CREATE TABLE CATEGORIAS(
CATEGORIAID int NOT NULL,
NOMBRECAT char(50) NOT NULL,
CONSTRAINT PK_CATEGORIAS PRIMARY KEY
(CATEGORIAID) ) ;

CREATE TABLE CLIENTES(
CLIENTEID int NOT NULL,
CEDULA_RUC char(10) NOT NULL,
NOMBRECIA char(30) NOT NULL,
NOMBRECONTACTO char(50) NOT NULL,
DIRECCIONCLI char(50) NOT NULL,
FAX char(12) NULL,
EMAIL char(50) NULL,
CELULAR char(12) NULL,
FIJO char(12) NULL,
CONSTRAINT PK_CLIENTES PRIMARY KEY
(CLIENTEID) );

CREATE TABLE ORDENES(
ORDENID int NOT NULL,
EMPLEADOID int NOT NULL,
CLIENTEID int NOT NULL,
FECHAORDEN date NOT NULL,
DESCUENTO int NULL,
CONSTRAINT PK_ORDENES PRIMARY KEY
(ORDENID) );


CREATE TABLE DETALLE_ORDENES(
ORDENID int NOT NULL,
DETALLEID int NOT NULL,
PRODUCTOID int NOT NULL,
CANTIDAD int NOT NULL,
CONSTRAINT PK_DETALLE_ORDENES PRIMARY KEY
(ORDENID,DETALLEID ) );

CREATE TABLE PRODUCTOS(
PRODUCTOID int NOT NULL,
PROVEEDORID int NOT NULL,
CATEGORIAID int NOT NULL,
DESCRIPCION char(50) NULL,
PRECIOUNIT numeric NOT NULL,
EXISTENCIA int NOT NULL,
CONSTRAINT PK_PRODUCTOS PRIMARY KEY
(PRODUCTOID )) ;

ALTER TABLE ORDENES
ADD CONSTRAINT FK_ORDENES_CLIEN_ORD_CLIENTES FOREIGN KEY(CLIENTEID)
REFERENCES CLIENTES (CLIENTEID)
on delete restrict on update restrict;

ALTER TABLE ORDENES ADD CONSTRAINT FK_ORDENES_EMPLE_ORD_EMPLEADO FOREIGN KEY(EMPLEADOID)
REFERENCES EMPLEADOS (EMPLEADOID)
on delete restrict on update restrict;

ALTER TABLE DETALLE_ORDENES ADD CONSTRAINT FK_DETALLE__ORDEN_DET_ORDENES FOREIGN KEY(ORDENID)
REFERENCES ORDENES (ORDENID)
on delete restrict on update restrict;

ALTER TABLE DETALLE_ORDENES ADD CONSTRAINT FK_DETALLE__PROD_DETA_PRODUCTO FOREIGN KEY(PRODUCTOID)
REFERENCES PRODUCTOS (PRODUCTOID)
on delete restrict on update restrict;

ALTER TABLE PRODUCTOS ADD CONSTRAINT FK_PRODUCTO_CATE_PROD_CATEGORI FOREIGN KEY(CATEGORIAID)
REFERENCES CATEGORIAS (CATEGORIAID)
on delete restrict on update restrict;

ALTER TABLE PRODUCTOS ADD CONSTRAINT FK_PRODUCTO_PROV_PROD_PROVEEDO FOREIGN KEY(PROVEEDORID)
REFERENCES PROVEEDORES (PROVEEDORID)
on delete restrict on update restrict;

ALTER TABLE EMPLEADOS ADD CONSTRAINT FK_EMPLEADO_REPORTA FOREIGN KEY(REPORTA_A)
REFERENCES EMPLEADOS (EMPLEADOID)
on delete restrict on update restrict;

/*INSERCIÓN DE DATOS EN LA BASE                */

insert into categorias (categoriaid, nombrecat) values (100, 'CARNICOS');
insert into categorias (categoriaid, nombrecat) values (200, 'LACTEOS');


insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values
(10, 'DON DIEGO', 'MANUEL ANDRADE', '099234567','2124456');
insert into proveedores (proveedorid, nombreprov, contacto,celuprov,fijoprov) values
(20, 'PRONACA', 'JUAN PEREZ', '0923434467','2124456');


INSERT INTO PRODUCTOS VALUES (1,10,100,'SALCHICHAS VIENESAS',2.60,200);
INSERT INTO PRODUCTOS VALUES (2,10,100,'SALAMI DE AJO',3.60,300);

set datestyle to dmy;

INSERT INTO EMPLEADOS VALUES (1,'JUAN', 'CRUZ', '18/01/67',null, 231);
INSERT INTO EMPLEADOS VALUES (2,'MARIO', 'SANCHEZ', '01/03/79',1,144);


INSERT INTO CLIENTES VALUES (1,'1890786576','SUPERMERCADO ESTRELLA','JUAN ALBAN','AV.AMAZONAS',NULL,NULL,NULL,NULL);
INSERT INTO CLIENTES VALUES (2,'1298765477','EL ROSADO','MARIA CORDERO','AV.AEL INCA',NULL,NULL,NULL,NULL);


INSERT INTO ORDENES VALUES(1,3,4,'17/06/07', 5);
INSERT INTO ORDENES VALUES(2,3,4,'02/06/07', 10);


INSERT INTO detalle_ordenes VALUES(1,1,1,2);
INSERT INTO detalle_ordenes VALUES(1,2,4,1);



----------------------------------------------------------------------------------------------
--					CREACION DE TRIGGERS
----------------------------------------------------------------------------------------------
--funcion disparadora
CREATE OR REPLACE FUNCTION proteger_datos() RETURNS TRIGGER AS $proteger_datos$
DECLARE
BEGIN
RETURN NULL;
END
$proteger_datos$ LANGUAGE plpgsql;
--el triger
CREATE TRIGGER proteger_datos BEFORE DELETE
on clientes FOR EACH ROW
EXECUTE PROCEDURE proteger_datos();


CREATE OR REPLACE FUNCTION sp_rellenar_datos() RETURNS TRIGGER AS $rellenar_datos$
DECLARE
BEGIN
NEW.descripcion := 'ninguna';
RETURN NEW;
END;
$rellenar_datos$ LANGUAGE plpgsql;
--TRIGER
CREATE TRIGGER tri_rellenar_datos BEFORE INSERT OR UPDATE
ON productos FOR EACH ROW
EXECUTE PROCEDURE sp_rellenar_datos();

CREATE TABLE cambios(
timestamp_ TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
nombre_disparador TEXT,
tipo_disparador TEXT,
nivel_diaprador TEXT,
comando TEXT);
CREATE OR REPLACE FUNCTION sp_grabar_operaciones() returns trigger as $grabar_operaciones$
DECLARE BEGIN
INSERT INTO cambios(nombre_disparador,tipo_disparador,nivel_disparador,comando)
VALUES (TG_NAME, TG_WHEN,TG_LEVEL,TG_OP);
RETURN NULL;
END;
$grabar_operaciones$ LANGUAGE plpgsql;
CREATE TRIGGER tri_grabar_operaciones AFTER INSERT OR UPDATE OR DELETE
ON ordenes FOR EACH STATEMENT
EXECUTE PROCEDURE sp_grabar_operaciones();