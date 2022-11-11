/*
 * Proyecto de Administracion de Base de Datos & Ingenieria de Software
 * Semestre:	  Quinto
 * Proyeto :      Facturacion
 * Autores :      Jeremy Lopez, Oscar Cuenca, Andres Jaramillo, Jeremy Prieto y Esteban Rodriguez
 *
 * Version :      1.0v
 * Fecha   :      Lunes 4 de Julio , 2022
 */
 

CREATE DATABASE Facturacion;

USE Facturacion;

CREATE TABLE Categoria(
	idcategoria INTEGER CONSTRAINT pk_idcategoria PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(100)
);

CREATE TABLE Producto(
	idproducto INTEGER CONSTRAINT pk_idproducto PRIMARY KEY NOT NULL,
	idcategoria INTEGER NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	precio DECIMAL NOT NULL,
	stock INTEGER NOT NULL,
	CONSTRAINT fk_idcategoria FOREIGN KEY(idcategoria) REFERENCES Categoria (idcategoria),
	CONSTRAINT chk_precio CHECK (precio >= 0),
	CONSTRAINT chk_stock CHECK (stock >= 0)
);

CREATE TABLE Cliente (
	idcliente INTEGER CONSTRAINT pk_idcliente PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	telefono VARCHAR(10) NOT NULL,
	email VARCHAR (100) NOT NULL,
	CONSTRAINT uqc_email UNIQUE(email),
	CONSTRAINT uqc_telefono UNIQUE(telefono)
);

CREATE TABLE Modo_de_Pago(
	idpago INTEGER CONSTRAINT pk_idpago PRIMARY KEY NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	detalle VARCHAR(100)NOT NULL
);

CREATE TABLE Vendedor(
	idvendedor INTEGER CONSTRAINT pk_idvendedor PRIMARY KEY NOT NULL,
	cedula VARCHAR(10) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
	telefono VARCHAR(10) NOT NULL,
	direccion VARCHAR(100) NOT NULL,
	email VARCHAR(50) NOT NULL,
	CONSTRAINT uqv_email UNIQUE(email),
	CONSTRAINT uqv_telefono UNIQUE(telefono)
);

CREATE TABLE Factura(
	num_factura INTEGER CONSTRAINT pk_num_factura PRIMARY KEY NOT NULL,
	fecha DATE NOT NULL,
	idcliente INTEGER NOT NULL,
	idvendedor INTEGER NOT NULL,
	idpago INTEGER NOT NULL,
	CONSTRAINT fk_idcliente FOREIGN KEY (idcliente) REFERENCES cliente(idcliente),
	CONSTRAINT fk_idvendedor FOREIGN KEY (idvendedor) REFERENCES Venderdor(idvendedor),
	CONSTRAINT fk_idpago FOREIGN KEY (idpago) REFERENCES Modo_de_Pago(idpago)
);

CREATE TABLE Detalle(
	num_detalle INTEGER CONSTRAINT pk_num_detalle PRIMARY KEY NOT NULL,
	idfactura INTEGER NOT NULL,
	idproducto INTEGER NOT NULL,
	cantidad INTEGER NOT NULL,
	precio DECIMAL NOT NULL,
	CONSTRAINT fk_idproducto FOREIGN KEY (idproducto) REFERENCES Producto(idproducto),
	CONSTRAINT fk_idfactura FOREIGN KEY (idfactura) REFERENCES Factura(num_factura),
	CONSTRAINT chk_cantidad CHECK (cantidad >= 0),
	CONSTRAINT chk_precio CHECK (precio >= 0)
);
https://helpmybusinesspos.info/tag/descargar-base-de-datos-de-productos-de-abarrotes-en-excel/

INSERT INTO categoria(idcategoria,nombre,descripcion) VALUES(1,'Bebidas','Cualquier liquido que se ingiere'),
	(2,'Higiene','Cualquier producto relacionado con la limpieza personal y del hogar'),
	(3,'Ropa','Cualquier tipo de vestimenta'),
	(4,'Accesorio','Cualquier objeto no esencial para una cosa y pueda sustituirse'),
	(5,'Despensa','Cualquier alimento');

INSERT INTO producto(idproducto,nombre,precio,stock,idcategoria) VALUES (1,'Leche',1.5,100,1),
(1,'Aceite Capullo 1lt',3,240,5),
(1,'Alimento Whiskas Tradiccion 9kg',9.5,68,5),
(1,'Cereal Golden Foods 550gr',2.25,75,5),
(1,'Flash Limon',0.75,300,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1),
(1,'Leche',1.5,100,1);

INSERT INTO vendedor(idvendedor,cedula,nombre,apellido,telefono,direccion,email) VALUES(1,'0750491200','Jorge','Rosillo','0916382765','La quintera calle n','jorgitor@hotmail.com');

INSERT INTO modo_de_pago(idpago,nombre,detalle) VALUES(1,'Efectivo','Es el dinero que se lleva encima, en la billetera o en el bolsillo del pantalón');

INSERT INTO cliente(idcliente,nombre,apellido,direccion,telefono,email) VALUES(1,'Alfredo','Gustamante','Arenillas, Av.Sexto Duran','0932548768','AlfredinG@gmail.com');




