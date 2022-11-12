		\c Saltar entre bases de datos

    \l Listar base de datos disponibles

    \dt Listar las tablas de la base de datos

    \d <nombre_tabla> Describir una tabla

    \dn Listar los esquemas de la base de datos actual

    \df Listar las funciones disponibles de la base de datos actual

    \dv Listar las vistas de la base de datos actual

    \du Listar los usuarios y sus roles de la base de datos actual

Comandos de inspección y ejecución

    \g Volver a ejecutar el comando ejecutando justo antes

    \s Ver el historial de comandos ejecutados

    \s <nombre_archivo> Si se quiere guardar la lista de comandos ejecutados en un archivo de texto plano

    \i <nombre_archivo> Ejecutar los comandos desde un archivo

    \e Permite abrir un editor de texto plano, escribir comandos y ejecutar en lote. \e abre el editor de texto, escribir allí 
		todos los comandos, luego guardar los cambios y cerrar, al cerrar se ejecutarán todos los comandos guardados.

    \ef Equivalente al comando anterior pero permite editar también funciones en PostgreSQL

Comandos para debug y optimización

    \timing Activar / Desactivar el contador de tiempo por consulta

Comandos para cerrar la consola

    \q Cerrar la consola

mysql -u USERNAME -pPASSWORD -h HOSTNAMEORIP DATABASENAME
sudo -u postgres psql //login in linux with superuser in postgresql
psql -U postgres //solo sirven cuanto esta con superusuario en el terminal de linux



/*Utilice el comando TRUNCATE para eliminar todas las filas de una tabla. 
Esto tiene el mismo efecto que el comando DELETE, 
pero es más rápido que el comando DELETE para tablas grandes.*/
TRUNCATE TABLE nombreDeLaTabla;

/*For delete a TABLE
Not is possible delete a table with the word 'DELETE'
*/
DROP TABLE nombreDeLaTable;

/*ADD A COLUMNA IN A EXISTENT TABLE
First, you have to clear the table 'cause the data won't be correct with the new column
afte we just use the command ADD COLUMN namecolum TypeData
*/
TRUNCATE TABLE estudiantes;
ALTER TABLE estudiantes ADD COLUMN edad INT;

/*Crear una vista con sentencias sql*/
CREATE VIEW myVista AS SELECT * FROM mytabla WHERE col2 = 5;

/*El funcionamiento del comando DROP es la inversa del comando CREATE. 
Por lo tanto podemos eliminar los objetos que hemos creado para almacenar nuestros datos. 
Para eliminar una estructura es tan simplemente como indicar el nombre de nuestro objeto.*/
DROP VIEW myVista;
DROP TABLE myTabla;
DROP SCHEMA myEsquema;

////////NOTES ABOUT VIDEO TUTORIAL
\l //show list databases
\q
\d //show tables
\d tableName //show columns of that table
CREATE DATABASE name;

/*FOR CONNECT TO DATABSE THORUGH COMMAND IS*/
psql --host localhost --port 5432 --username PedroPC University
//or
\c University

/*For create a table throught command, is almost the same thing in pgadmin
you just do a backspace after the
(
,
);
*/

/*Poner valores por default
Al comvertirlo en default, ya no es nesesario insertarlo en una inserccion de un objeto
*/
...
discounted numeric DEFAULT 0 NOT NULL,
...

/*INDICES*/
/*Estructura fisica de la tabla
-Incrementa la valocidad de busqueda
-no estan alojadas en la tablas
-utiliza algoritmo B-Trees
*/
CREATE UNIQUE INDEX title_idx ON films(title);



