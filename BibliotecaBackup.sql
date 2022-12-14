PGDMP                 
        z         
   Biblioteca    14.1    14.1 $    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    25436 
   Biblioteca    DATABASE     j   CREATE DATABASE "Biblioteca" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE "Biblioteca";
                postgres    false            ?            1255    25485    proteger_datos()    FUNCTION     z   CREATE FUNCTION public.proteger_datos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
RETURN NULL;
END
$$;
 '   DROP FUNCTION public.proteger_datos();
       public          postgres    false            ?            1255    25495    sp_grabar_operaciones()    FUNCTION     ?   CREATE FUNCTION public.sp_grabar_operaciones() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE BEGIN
INSERT INTO cambios(nombre_disparador,tipo_disparador,nivel_disparador,comando)
VALUES (TG_NAME, TG_WHEN,TG_LEVEL,TG_OP);
RETURN NULL;
END;
$$;
 .   DROP FUNCTION public.sp_grabar_operaciones();
       public          postgres    false            ?            1255    25497    sp_rellenar_datos()    FUNCTION     ?   CREATE FUNCTION public.sp_rellenar_datos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
NEW.fecha := 'ninguna';
NEW.revista  := 'ninguna';
RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.sp_rellenar_datos();
       public          postgres    false            ?            1259    25437    autor    TABLE     ?   CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nombre character varying(50) NOT NULL,
    nacionalidad character varying(50) NOT NULL,
    anio_nacimiento integer NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            ?            1259    25489    cambios    TABLE     ?   CREATE TABLE public.cambios (
    timestamp_ timestamp with time zone DEFAULT now(),
    nombre_disparador text,
    tipo_disparador text,
    nivel_disparador text,
    comando text
);
    DROP TABLE public.cambios;
       public         heap    postgres    false            ?            1259    25462    copia    TABLE     Z   CREATE TABLE public.copia (
    id_copia integer NOT NULL,
    numero integer NOT NULL
);
    DROP TABLE public.copia;
       public         heap    postgres    false            ?            1259    25457    edicion    TABLE     ?   CREATE TABLE public.edicion (
    id_edicion integer NOT NULL,
    isbn integer NOT NULL,
    fecha character varying(50) NOT NULL,
    revista character varying(50) NOT NULL
);
    DROP TABLE public.edicion;
       public         heap    postgres    false            ?            1259    25447    libro    TABLE     ?   CREATE TABLE public.libro (
    id_libro integer NOT NULL,
    titulo character varying(50) NOT NULL,
    genero character varying(50) NOT NULL,
    id_resena integer NOT NULL
);
    DROP TABLE public.libro;
       public         heap    postgres    false            ?            1259    25472    prestamo    TABLE     ?   CREATE TABLE public.prestamo (
    id_copia integer,
    id_usuario integer,
    fecha_prestamo date,
    fecha_devolucion date
);
    DROP TABLE public.prestamo;
       public         heap    postgres    false            ?            1259    25442    resena    TABLE     ?   CREATE TABLE public.resena (
    id_resena integer NOT NULL,
    fecha character varying(50) NOT NULL,
    revista character varying(50) NOT NULL
);
    DROP TABLE public.resena;
       public         heap    postgres    false            ?            1259    25467    usuario    TABLE     ?   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    cedula character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                      0    25437    autor 
   TABLE DATA           P   COPY public.autor (id_autor, nombre, nacionalidad, anio_nacimiento) FROM stdin;
    public          postgres    false    209   )                  0    25489    cambios 
   TABLE DATA           l   COPY public.cambios (timestamp_, nombre_disparador, tipo_disparador, nivel_disparador, comando) FROM stdin;
    public          postgres    false    216   9)                 0    25462    copia 
   TABLE DATA           1   COPY public.copia (id_copia, numero) FROM stdin;
    public          postgres    false    213   V)                 0    25457    edicion 
   TABLE DATA           C   COPY public.edicion (id_edicion, isbn, fecha, revista) FROM stdin;
    public          postgres    false    212   s)                 0    25447    libro 
   TABLE DATA           D   COPY public.libro (id_libro, titulo, genero, id_resena) FROM stdin;
    public          postgres    false    211   ?)                 0    25472    prestamo 
   TABLE DATA           Z   COPY public.prestamo (id_copia, id_usuario, fecha_prestamo, fecha_devolucion) FROM stdin;
    public          postgres    false    215   ?)                 0    25442    resena 
   TABLE DATA           ;   COPY public.resena (id_resena, fecha, revista) FROM stdin;
    public          postgres    false    210   ?)                 0    25467    usuario 
   TABLE DATA           N   COPY public.usuario (id_usuario, cedula, email, nombre, apellido) FROM stdin;
    public          postgres    false    214   ?)       |           2606    25441    autor autor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    209            ?           2606    25466    copia copia_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.copia
    ADD CONSTRAINT copia_pkey PRIMARY KEY (id_copia);
 :   ALTER TABLE ONLY public.copia DROP CONSTRAINT copia_pkey;
       public            postgres    false    213            ?           2606    25461    edicion edicion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.edicion
    ADD CONSTRAINT edicion_pkey PRIMARY KEY (id_edicion);
 >   ALTER TABLE ONLY public.edicion DROP CONSTRAINT edicion_pkey;
       public            postgres    false    212            ?           2606    25451    libro libro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id_libro);
 :   ALTER TABLE ONLY public.libro DROP CONSTRAINT libro_pkey;
       public            postgres    false    211            ~           2606    25446    resena resena_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.resena
    ADD CONSTRAINT resena_pkey PRIMARY KEY (id_resena);
 <   ALTER TABLE ONLY public.resena DROP CONSTRAINT resena_pkey;
       public            postgres    false    210            ?           2606    25471    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    214            ?           2620    25487    libro proteger_datoslibro    TRIGGER     x   CREATE TRIGGER proteger_datoslibro BEFORE DELETE ON public.libro FOR EACH ROW EXECUTE FUNCTION public.proteger_datos();
 2   DROP TRIGGER proteger_datoslibro ON public.libro;
       public          postgres    false    217    211            ?           2620    25488    usuario proteger_datosusuario    TRIGGER     |   CREATE TRIGGER proteger_datosusuario BEFORE DELETE ON public.usuario FOR EACH ROW EXECUTE FUNCTION public.proteger_datos();
 6   DROP TRIGGER proteger_datosusuario ON public.usuario;
       public          postgres    false    214    217            ?           2620    25496    autor tri_grabar_operaciones    TRIGGER     ?   CREATE TRIGGER tri_grabar_operaciones AFTER INSERT OR DELETE OR UPDATE ON public.autor FOR EACH STATEMENT EXECUTE FUNCTION public.sp_grabar_operaciones();
 5   DROP TRIGGER tri_grabar_operaciones ON public.autor;
       public          postgres    false    209    218            ?           2620    25498    resena tri_rellenar_datos    TRIGGER     ?   CREATE TRIGGER tri_rellenar_datos BEFORE INSERT OR UPDATE ON public.resena FOR EACH ROW EXECUTE FUNCTION public.sp_rellenar_datos();
 2   DROP TRIGGER tri_rellenar_datos ON public.resena;
       public          postgres    false    210    219            ?           2606    25475    prestamo fk_idcopia    FK CONSTRAINT     y   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_idcopia FOREIGN KEY (id_copia) REFERENCES public.copia(id_copia);
 =   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_idcopia;
       public          postgres    false    213    215    3204            ?           2606    25452    libro fk_idresena    FK CONSTRAINT     z   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT fk_idresena FOREIGN KEY (id_resena) REFERENCES public.resena(id_resena);
 ;   ALTER TABLE ONLY public.libro DROP CONSTRAINT fk_idresena;
       public          postgres    false    211    3198    210            ?           2606    25480    prestamo fk_idusuario    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 ?   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_idusuario;
       public          postgres    false    214    3206    215                  x?????? ? ?             x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?     