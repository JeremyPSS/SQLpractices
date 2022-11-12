/*UNIQUE*/
//una restricción UNIQUE impide que el campo restringido acepte un valor que duplicaría un valor existente para el campo.
CREATE TABLE COMPANY3(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL UNIQUE,
   ADDRESS        CHAR(50),
   SALARY         REAL    DEFAULT 50000.00

);
//Add a constraint type UNIQUE in a already exist columns in a table
//first if you have data repeated, you should delete first before apply this next commands.
//Now imagine the table campany created without the constraint UNIQUE in AGE
ALTER TABLE COMPANY3 ADD CONSTRAINT unique_AGE UNIQUE(AGE);

CONSTRAINT un_film UNIQUE(code,title) //se pueden poner dos parametros a la vez para que estos no halla repeticiones


/*NOT NULL*/
CREATE TABLE COMPANY1(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
/*Añadir una restriccion a una columna ya creada para que no permita dejar valores nulos*/
ALTER TABLE Cars ALTER COLUMN Certificado TEXT CONSTRAINT Certificado_Required NOT NULL

/*PRIMARY KEY*/
CREATE TABLE COMPANY4(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);

/*FOREIGN KEY*/
CREATE TABLE COMPANY6(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL
);
CREATE TABLE DEPARTMENT1(
   ID INT PRIMARY KEY      NOT NULL,
   DEPT           CHAR(50) NOT NULL,
   EMP_ID         INT      references COMPANY6(ID)
);

/*CHECK CONSTRAINT*/
CREATE TABLE COMPANY5(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT    NOT NULL,
   AGE            INT     NOT NULL,
   ADDRESS        CHAR(50),
   SALARY         REAL    CHECK(SALARY > 0)
);
////STEPS:Validation for don't give to user put any gender on the db
CREATE TABLE ESTUDIANTES(
	CodigoE int PRIMARY KEY,
  	Nombre VARCHAR(50),
  	Sexo CHAR
);
TRUNCATE TABLE estudiantes;//limpia la tabla
alter table Estudiantes ADD CONSTRAINT CH_Sexo CHECK(Sexo='F' OR Sexo='M');
INSERT INTO estudiantes VALUES(2,'Josue','M');

/*EXCLUSION CONTRAINT*/
//garantizan que si se comparan dos filas en las columnas o expresiones especificadas utilizando los operadores especificados, 
//al menos una de estas comparaciones de operadores devolverá falso o nulo.
CREATE TABLE COMPANY7(
   ID INT PRIMARY KEY     NOT NULL,
   NAME           TEXT,
   AGE            INT  ,
   ADDRESS        CHAR(50),
   SALARY         REAL,
   EXCLUDE USING gist
   (NAME WITH =,
   AGE WITH <>)
);
//eg
INSERT INTO COMPANY7 VALUES(1, 'Paul', 32, 'California', 20000.00 ); //Fine
INSERT INTO COMPANY7 VALUES(2, 'Paul', 32, 'Texas', 20000.00 ); //Fine
INSERT INTO COMPANY7 VALUES(3, 'Paul', 42, 'California', 20000.00 );  //Error
