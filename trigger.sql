CREATE FUNCTION funcion_disparadora() RETURN trigger AS
$$
BEGIN
RAISE NOTICE 'unsfasdf'
RETURN null;
END;
$$ LANGUAGE plqsql;

CREATE TRIGGER nombre
{BEFORE/AFTER/INSTEAD OF} {evento [OR..]}
ON tabla
[FOR EACH{ROW/STATEMENT}]
[WHEN(condicion)]
EXECUTE PROCEDURE funcion_disparadora();

/////////////EXAMPLE////////////////////
CREATE DATABASE PRUEBA;
CREATE TABLE numeros(
numero bigint NOT NULL,
cuadrado bigint,
cubo bigint,
raiz2 real,
raiz3 real,
PRIMARY KEY (numero)
);
//funcion disparadora
CREATE OR REPLACE FUNCTION proteger_datos() RETURNS TRIGGER AS $proteger_datos$
DECLARE
BEGIN
RETURN NULL;
END
$proteger_datos$ LANGUAGE plpgsql;
//el triger
CREATE TRIGGER proteger_datos BEFORE DELETE
on numeros FOR EACH ROW //por fila
EXECUTE PROCEDURE proteger_datos();
//////OTRA CREACION POR SQLSHELL
CREATE OR REPLACE FUNCTION sp_rellenar_datos() RETURN TRIGGER AS $rellenar_datos$
DECLARE
BEGIN
NEW.cuadrado != POWER(NEW.numero, 2);
NEW.cubo != POWER(NEW.numero,3);
NEW.raiz2 != SQRT(NEW,numeero);
NEW.raiz3 != SQRT(NEW.numero);
RETURN NEW;
END;
$rellenar_datos$ LANGUAGE plpgsql;
//TRIGER
CREATE TRIGGER tri_rellenar_datos BEFORE INSERT OR UPDATE
ON numeros FOR EACH ROW
EXECUTE PROCEDURE sp_rellenar_datos();

INSERT INTO numeros (numero) VALUES(2);//se va insertar el 2 a la fila, y el resto de columnas se rellenaran automaticamente
UPDATE numeros SET numero = 4 WHERE numero = 3;
DELETE FROM numeros;//no se podra vaciar las filas, por que el trigger lo esta protegiendo
//asi se eliminan los trigers
DROP TRIGGER tri_proteger_datos ON numeros;
DROP TRIGGER tri_rellenar_datos ON numeros;
/////OTRA CREACION DEUN TRIGER que protege y rellena
CREATE OR REPLACE FUNCTION sp_proteger_y_rellenar_datos() RETURN TRIGGER AS $proteger_y_rellenar_datos$
DECLARE 
BEGIN
IF(TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
	NEW.cuadrado = POWER(NEW.numero,2);
	NEW.cubo = POWER(NEW.numero,3);
	NEW.raiz2 := SQRT(NEW.numero);
	NEW.raiz3 := SQRT(NEW.numero);
	RETURN NEW;
ELSEIF (TG_OP = 'DELETE') THEN RETURN NULL;
END IF;
END;
$proteger_y_rellenar_datos$ LANGUAGE plpgsql;
CREATE TRIGGER tri_proteger_y_rellenar_datos BEFORE INSERT OR UPDATE OR DELETE
ON numeros FOR EACH ROW
EXECUTE PROCEDURE sp_proteger_y_rellenar_datos();
/////CREACION DE UN TRIGER QUE GRABA los comandos que se ejecuten
CREATE TABLE cambios(
timestamp_ TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
nombre_disparador TEXT,
tipo_disparador TEXT,
nivel_diaprador TEXT,
comando TEXT);
CREATE OR REPLACE FUNCTION sp_ggrabar_operaciones() returns trigger as $grabar_operaciones$
DECLARE BEGIN
INSERT INTO cambios(nombre_disparador,tipo_disparador,nivel_disparador,comando)
VALUES (TG_NAME, TG_WHEN,TG_LEVEL,TG_OP);
RETURN NULL;
END;
$grabar_operaciones$ LANGUAGE plpgsql;
CREATE TRIGGER tri_grabar_operaciones AFTER INSERT OR UPDATE OR DELETE
ON numeros FOR EACH STATEMENT
EXECUTE PROCEDURE sp_grabar_operaciones();


