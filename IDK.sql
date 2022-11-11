/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      CompanyLENOVO
 * Project :      DATA MODEL
 * Author :       LENOVO
 *
 * Date Created : Monday, June 27, 2022 13:08:37
 * Target DBMS : Microsoft SQL Server 2008
 */

/* 
 * TABLE: Cliente 
 */

CREATE TABLE Cliente(
    Identificacion    int            NOT NULL,
    Nombre            varchar(50)    NOT NULL,
    Apellido          varchar(50)    NOT NULL,
    Direccion         varchar(50)    NOT NULL,
    FNacimiento       date           NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Identificacion)
)
go



IF OBJECT_ID('Cliente') IS NOT NULL
    PRINT '<<< CREATED TABLE Cliente >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Cliente >>>'
go

/* 
 * TABLE: [Cliente Producto] 
 */

CREATE TABLE [Cliente Producto](
    Identificacion    int    NOT NULL,
    Codigo            int    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Identificacion, Codigo)
)
go



IF OBJECT_ID('Cliente Producto') IS NOT NULL
    PRINT '<<< CREATED TABLE Cliente Producto >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Cliente Producto >>>'
go

/* 
 * TABLE: Producto 
 */

CREATE TABLE Producto(
    Codigo            int               NOT NULL,
    Nombre            varchar(50)       NOT NULL,
    PrecioUnitario    decimal(10, 0)    NOT NULL,
    RUC               varchar(50)       NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (Codigo)
)
go



IF OBJECT_ID('Producto') IS NOT NULL
    PRINT '<<< CREATED TABLE Producto >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Producto >>>'
go

/* 
 * TABLE: [Cliente Producto] 
 */

ALTER TABLE [Cliente Producto] ADD CONSTRAINT RefCliente2 
    FOREIGN KEY (Identificacion)
    REFERENCES Cliente(Identificacion)
go

ALTER TABLE [Cliente Producto] ADD CONSTRAINT RefProducto3 
    FOREIGN KEY (Codigo)
    REFERENCES Producto(Codigo)
go


