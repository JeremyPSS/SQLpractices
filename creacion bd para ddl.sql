-- PARA CREAR LA BASE DE DATOS:

CREATE DATABASE Hollywood;

-- o se puede utilizar:

CREATE DATABASE hollywood
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Spain.1252'
       LC_CTYPE = 'Spanish_Spain.1252'
       CONNECTION LIMIT = -1;

-- PARA CREAR TABLAS UBICARSE EN LA BASE DE DATOS DONDE DESEA CREAR LA TABLA ***

-- Para crear una tabla con la llave principal

CREATE TABLE directores (cod_dir char(4) CONSTRAINT pk_cod_dir PRIMARY KEY,
			nom_dir varchar(30),
			naciona_act varchar(15) DEFAULT 'Desconocido');



CREATE TABLE actores (cod_act char(4) CONSTRAINT pk_cod_act PRIMARY KEY,
			nom_act varchar(30),
			nom_rea_act varchar(30),
			fec_nac_act date,
			fec_mue_act date NULL,
			naciona_act varchar(15) DEFAULT 'Desconocido');

CREATE TABLE generos (cod_gen char(4) CONSTRAINT pk_cod_gen PRIMARY KEY,
                      nom_gen varchar(20));

-- Para crear una tabla (sin llave principal, omitida por propósitos educativos)

CREATE TABLE socios    (num_soc char(4),
			ape_soc varchar(30),
			nom_soc varchar(30),
			dir_soc varchar(30),
			tel_soc varchar(9),
			ciu_soc varchar(15),
			gen_soc char(1),
			est_civ_soc varchar(11),
			can_pel_soc smallint,
			tipo_soc char(1),
			fec_nac_soc date);



--* Para adicionar constraints a la tabla

ALTER TABLE socios ADD CONSTRAINT pk_num_soc PRIMARY KEY (num_soc);  -- adiciona llave principal

-- Para crear una tabla con llave 

CREATE TABLE peliculas (cod_pel char(4) CONSTRAINT pk_cod_pel PRIMARY KEY, 
                        tit_pel varchar(30), 
                        tit_es_pel varchar(30),
                        anio_pel smallint, 
                        subti_pel bit, 
                        cat_pel varchar(10),
                        dur_pel  varchar(5), 
                        resumen_pel varchar(200), 
                        cod_dir char(4),
                        cod_gen char(4) );


-- Para adicionar campos o constraints... a una tabla...

ALTER TABLE peliculas ADD produc_pel varchar(30) NULL;		-- adiciona campos
ALTER TABLE peliculas ADD CONSTRAINT fk_cod_gen_pel FOREIGN KEY (cod_gen) REFERENCES generos(cod_gen);  -- adiciona llave ajena
ALTER TABLE peliculas ADD CONSTRAINT fk_cod_dir_pel FOREIGN KEY (cod_dir) REFERENCES "directores"(cod_dir);
-- Para crear campos con más de 1 llave ajena...

CREATE TABLE cintas (cod_cd char(4) CONSTRAINT pk_cod_cd PRIMARY KEY,
		  cod_pel char(4), CONSTRAINT fk_cod_pel_cds FOREIGN KEY (cod_pel)
                                  REFERENCES peliculas(cod_pel),
		  cant_cd integer,
	 	  for_cd varchar(5),
		  estado_cd varchar(10),
		  can_pr_cd integer);


CREATE TABLE alquiler  (cod_cd char(4), CONSTRAINT fk_cod_cd_alquiler FOREIGN KEY (cod_cd)
					REFERENCES cintas(cod_cd),
			num_soc char(4), CONSTRAINT fd_num_soc_alquiler FOREIGN KEY (num_soc)
					REFERENCES socios(num_soc),
			fec_alq date,
			fec_dev_al date);
			


CREATE TABLE det_ac_pel (cod_pel char(4), CONSTRAINT fk_cod_pel_det FOREIGN KEY (cod_pel)
					REFERENCES peliculas(cod_pel),
			 cod_act char(4), CONSTRAINT fk_cod_ac_det FOREIGN KEY (cod_act)
					REFERENCES actores(cod_act),
			 pap_ac_pel varchar(20),
			 tipo_papel varchar(10));


CREATE TABLE lista_espera (cod_pel char(4), CONSTRAINT fk_cod_pel_det FOREIGN KEY(cod_pel)
					REFERENCES peliculas(cod_pel),
			 num_soc char(4), CONSTRAINT fk_cod_soc_det FOREIGN KEY(num_soc)
					REFERENCES socios(num_soc),
			 fecha_esp date);

CREATE TABLE det_soc_gen (num_soc char(4), CONSTRAINT fk_num_soc_det FOREIGN KEY (num_soc)
					REFERENCES socios(num_soc),
			  cod_gen char(4), CONSTRAINT fk_cod_gen_det FOREIGN KEY (cod_gen)
					REFERENCES generos(cod_gen));

CREATE TABLE det_soc_act (num_soc char(4), CONSTRAINT fk_num_soc_det FOREIGN KEY(num_soc)
					REFERENCES socios(num_soc),
			  cod_act char(4), CONSTRAINT fk_cod_act_det FOREIGN KEY(cod_act)
					REFERENCES actores(cod_act));

CREATE TABLE det_soc_dir (num_soc char(4), CONSTRAINT fk_num_soc_det FOREIGN KEY(num_soc)
					REFERENCES socios(num_soc),
			  cod_dir char(4), CONSTRAINT fk_cod_dir_det FOREIGN KEY(cod_dir)
					REFERENCES directores(cod_dir));
					

