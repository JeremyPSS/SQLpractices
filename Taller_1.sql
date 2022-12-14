PGDMP     
                    z         
   Biblioteca    14.3    14.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    41005 
   Biblioteca    DATABASE     i   CREATE DATABASE "Biblioteca" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE "Biblioteca";
                postgres    false            ?            1255    41067    proteger_datos()    FUNCTION     z   CREATE FUNCTION public.proteger_datos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
RETURN NULL;
END
$$;
 '   DROP FUNCTION public.proteger_datos();
       public          postgres    false            ?            1259    41029    autor    TABLE     ?   CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nombre character varying(50) NOT NULL,
    nacionalidad character varying(50) NOT NULL,
    anio_nacimiento integer NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            ?            1259    41044    copia    TABLE     Z   CREATE TABLE public.copia (
    id_copia integer NOT NULL,
    numero integer NOT NULL
);
    DROP TABLE public.copia;
       public         heap    postgres    false            ?            1259    41034    edicion    TABLE     ?   CREATE TABLE public.edicion (
    id_edicion integer NOT NULL,
    isbn integer NOT NULL,
    fecha character varying(50) NOT NULL,
    revista character varying(50) NOT NULL
);
    DROP TABLE public.edicion;
       public         heap    postgres    false            ?            1259    41039    libro    TABLE     ?   CREATE TABLE public.libro (
    id_libro integer NOT NULL,
    titulo character varying(50) NOT NULL,
    genero character varying(50) NOT NULL
);
    DROP TABLE public.libro;
       public         heap    postgres    false            ?            1259    41054    prestamo    TABLE     ?   CREATE TABLE public.prestamo (
    id_copia integer,
    id_usuario integer,
    fecha_prestamo date,
    fecha_devolucion date
);
    DROP TABLE public.prestamo;
       public         heap    postgres    false            ?            1259    41049    usuario    TABLE     ?   CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    cedula character varying(10) NOT NULL,
    email character varying(100) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                      0    41029    autor 
   TABLE DATA           P   COPY public.autor (id_autor, nombre, nacionalidad, anio_nacimiento) FROM stdin;
    public          postgres    false    209   ?                 0    41044    copia 
   TABLE DATA           1   COPY public.copia (id_copia, numero) FROM stdin;
    public          postgres    false    212   ?                 0    41034    edicion 
   TABLE DATA           C   COPY public.edicion (id_edicion, isbn, fecha, revista) FROM stdin;
    public          postgres    false    210                    0    41039    libro 
   TABLE DATA           9   COPY public.libro (id_libro, titulo, genero) FROM stdin;
    public          postgres    false    211   %                 0    41054    prestamo 
   TABLE DATA           Z   COPY public.prestamo (id_copia, id_usuario, fecha_prestamo, fecha_devolucion) FROM stdin;
    public          postgres    false    214   B                 0    41049    usuario 
   TABLE DATA           N   COPY public.usuario (id_usuario, cedula, email, nombre, apellido) FROM stdin;
    public          postgres    false    213   _       q           2606    41033    autor autor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    209            w           2606    41048    copia copia_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.copia
    ADD CONSTRAINT copia_pkey PRIMARY KEY (id_copia);
 :   ALTER TABLE ONLY public.copia DROP CONSTRAINT copia_pkey;
       public            postgres    false    212            s           2606    41038    edicion edicion_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.edicion
    ADD CONSTRAINT edicion_pkey PRIMARY KEY (id_edicion);
 >   ALTER TABLE ONLY public.edicion DROP CONSTRAINT edicion_pkey;
       public            postgres    false    210            u           2606    41043    libro libro_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id_libro);
 :   ALTER TABLE ONLY public.libro DROP CONSTRAINT libro_pkey;
       public            postgres    false    211            y           2606    41053    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    213            |           2620    41070    autor proteger_datosautor    TRIGGER     x   CREATE TRIGGER proteger_datosautor BEFORE DELETE ON public.autor FOR EACH ROW EXECUTE FUNCTION public.proteger_datos();
 2   DROP TRIGGER proteger_datosautor ON public.autor;
       public          postgres    false    209    215            }           2620    41068    libro proteger_datoslibro    TRIGGER     x   CREATE TRIGGER proteger_datoslibro BEFORE DELETE ON public.libro FOR EACH ROW EXECUTE FUNCTION public.proteger_datos();
 2   DROP TRIGGER proteger_datoslibro ON public.libro;
       public          postgres    false    211    215                       2620    41071    prestamo proteger_datosprestamo    TRIGGER     ~   CREATE TRIGGER proteger_datosprestamo BEFORE DELETE ON public.prestamo FOR EACH ROW EXECUTE FUNCTION public.proteger_datos();
 8   DROP TRIGGER proteger_datosprestamo ON public.prestamo;
       public          postgres    false    214    215            ~           2620    41069    usuario proteger_datosusuario    TRIGGER     |   CREATE TRIGGER proteger_datosusuario BEFORE DELETE ON public.usuario FOR EACH ROW EXECUTE FUNCTION public.proteger_datos();
 6   DROP TRIGGER proteger_datosusuario ON public.usuario;
       public          postgres    false    215    213            z           2606    41057    prestamo fk_idcopia    FK CONSTRAINT     y   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_idcopia FOREIGN KEY (id_copia) REFERENCES public.copia(id_copia);
 =   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_idcopia;
       public          postgres    false    212    3191    214            {           2606    41062    prestamo fk_idusuario    FK CONSTRAINT     ?   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);
 ?   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_idusuario;
       public          postgres    false    213    3193    214                  x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?     