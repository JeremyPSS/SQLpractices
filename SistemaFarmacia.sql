/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      CompanyLENOVO
 * Project :      Farmacia.DM1
 * Author :       LENOVO
 *
 * Date Created : Sunday, February 13, 2022 17:20:05
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: Administrador 
 */

CREATE TABLE Administrador(
    IdUsuario     int             NOT NULL,
    Contrasena    varchar(100)    NOT NULL,
    Cedula        varchar(10)     NOT NULL,
    Nombres       varchar(40)     NOT NULL,
    Apellidos     varchar(40)     NOT NULL,
    Telefono      varchar(15)     NOT NULL,
    Email         varchar(45)     NOT NULL,
    Tipo          varchar(30)     NOT NULL,
    Estado        varchar(30)     NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (IdUsuario)
)
go



IF OBJECT_ID('Administrador') IS NOT NULL
    PRINT '<<< CREATED TABLE Administrador >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Administrador >>>'
go

/* 
 * TABLE: Cliente 
 */

CREATE TABLE Cliente(
    IdCliente    int            NOT NULL,
    Nombre       varchar(30)    NOT NULL,
    Apellido     varchar(40)    NOT NULL,
    Correo       varchar(50)    NOT NULL,
    Cedula       varchar(30)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (IdCliente)
)
go



IF OBJECT_ID('Cliente') IS NOT NULL
    PRINT '<<< CREATED TABLE Cliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Cliente >>>'
go

/* 
 * TABLE: Factura 
 */

CREATE TABLE Factura(
    IdFactura       int         NOT NULL,
    Total           money       NOT NULL,
    FechaFactura    datetime    NOT NULL,
    IdCliente       int         NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (IdFactura)
)
go



IF OBJECT_ID('Factura') IS NOT NULL
    PRINT '<<< CREATED TABLE Factura >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Factura >>>'
go

/* 
 * TABLE: Factura_Detalle 
 */

CREATE TABLE Factura_Detalle(
    IdFactura        int      NOT NULL,
    IdMedicamento    int      NOT NULL,
    Cantidad         int      NOT NULL,
    Subtotal         money    NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (IdFactura, IdMedicamento)
)
go



IF OBJECT_ID('Factura_Detalle') IS NOT NULL
    PRINT '<<< CREATED TABLE Factura_Detalle >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Factura_Detalle >>>'
go

/* 
 * TABLE: Medicamento 
 */

CREATE TABLE Medicamento(
    IdMedicamento        int             NOT NULL,
    Nombre               varchar(50)     NOT NULL,
    Enpaque              varchar(20)     NOT NULL,
    Cantidad             int             NOT NULL,
    Presentacion         varchar(15)     NOT NULL,
    FechaVencimiento     datetime        NOT NULL,
    viaAdministracion    varchar(15)     NOT NULL,
    Almacenamiento       varchar(15)     NOT NULL,
    Especificacion       varchar(100)    NOT NULL,
    Precio               money           NOT NULL,
    IdPromocion          int             NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (IdMedicamento)
)
go



IF OBJECT_ID('Medicamento') IS NOT NULL
    PRINT '<<< CREATED TABLE Medicamento >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Medicamento >>>'
go

/* 
 * TABLE: Promociones 
 */

CREATE TABLE Promociones(
    IdPromocion    int               NOT NULL,
    Tipo           varchar(30)       NULL,
    Porcentaje     decimal(18, 0)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (IdPromocion)
)
go



IF OBJECT_ID('Promociones') IS NOT NULL
    PRINT '<<< CREATED TABLE Promociones >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Promociones >>>'
go

/* 
 * TABLE: Factura 
 */

ALTER TABLE Factura ADD CONSTRAINT RefCliente9 
    FOREIGN KEY (IdCliente)
    REFERENCES Cliente(IdCliente)
go


/* 
 * TABLE: Factura_Detalle 
 */

ALTER TABLE Factura_Detalle ADD CONSTRAINT RefFactura4 
    FOREIGN KEY (IdFactura)
    REFERENCES Factura(IdFactura)
go

ALTER TABLE Factura_Detalle ADD CONSTRAINT RefMedicamento5 
    FOREIGN KEY (IdMedicamento)
    REFERENCES Medicamento(IdMedicamento)
go


/* 
 * TABLE: Medicamento 
 */

ALTER TABLE Medicamento ADD CONSTRAINT RefPromociones12 
    FOREIGN KEY (IdPromocion)
    REFERENCES Promociones(IdPromocion)
go


