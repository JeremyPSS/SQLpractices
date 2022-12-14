PGDMP     -                    z         
   Ferreteria    14.1    14.1 ?    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    25530 
   Ferreteria    DATABASE     j   CREATE DATABASE "Ferreteria" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE "Ferreteria";
                postgres    false            ?            1259    25596 	   categoria    TABLE     ?   CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(50),
    descripcion character varying(50)
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            ?            1259    25536    cliente    TABLE     ?   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(50),
    apellido_cliente character varying(50),
    telefono character varying(25),
    email character varying(50),
    id_direccion integer NOT NULL
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            ?            1259    25674    detalle_factura    TABLE     ?   CREATE TABLE public.detalle_factura (
    num_detalle integer NOT NULL,
    num_factura integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad double precision,
    precio money
);
 #   DROP TABLE public.detalle_factura;
       public         heap    postgres    false            ?            1259    25531 	   direccion    TABLE     ?   CREATE TABLE public.direccion (
    id_direccion integer NOT NULL,
    ciudad character varying(50),
    calles character varying(50)
);
    DROP TABLE public.direccion;
       public         heap    postgres    false            ?            1259    25551    empleado    TABLE     ,  CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    cedula integer,
    nombre_empleado character varying(50),
    apellido character varying(50),
    telefono character varying(25),
    email character varying(50),
    id_direccion integer NOT NULL,
    id_tipo integer NOT NULL
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            ?            1259    25624    envios    TABLE     ?   CREATE TABLE public.envios (
    id_envio integer NOT NULL,
    telefono character varying(25),
    id_producto integer NOT NULL,
    id_transportista integer NOT NULL,
    id_direccion integer NOT NULL
);
    DROP TABLE public.envios;
       public         heap    postgres    false            ?            1259    25649    factura    TABLE     ?   CREATE TABLE public.factura (
    num_factura integer NOT NULL,
    fecha date,
    id_cliente integer NOT NULL,
    id_producto integer NOT NULL,
    num_pago integer NOT NULL,
    id_empleado integer NOT NULL
);
    DROP TABLE public.factura;
       public         heap    postgres    false            ?            1259    25644 	   modo_pago    TABLE     ?   CREATE TABLE public.modo_pago (
    num_pago integer NOT NULL,
    nombre_num_pago character varying(50),
    detalle_num_pago character varying(50)
);
    DROP TABLE public.modo_pago;
       public         heap    postgres    false            ?            1259    25601    producto    TABLE     ?   CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    nombre_producto character varying(50),
    precio money,
    stock integer,
    id_categoria integer NOT NULL
);
    DROP TABLE public.producto;
       public         heap    postgres    false            ?            1259    25611    producto_proveedor    TABLE     ?   CREATE TABLE public.producto_proveedor (
    fecha_entrega date,
    id_producto integer NOT NULL,
    id_proveedor integer NOT NULL
);
 &   DROP TABLE public.producto_proveedor;
       public         heap    postgres    false            ?            1259    25586 	   proveedor    TABLE     ?   CREATE TABLE public.proveedor (
    id_proveedor integer NOT NULL,
    nombre_proveedor character varying(50),
    telefono character varying(25),
    email character varying(50),
    id_direccion integer NOT NULL
);
    DROP TABLE public.proveedor;
       public         heap    postgres    false            ?            1259    25566    sucursal    TABLE     ?   CREATE TABLE public.sucursal (
    id_sucursal integer NOT NULL,
    nombre_sucursal character varying(50),
    id_direccion integer NOT NULL
);
    DROP TABLE public.sucursal;
       public         heap    postgres    false            ?            1259    25546    tipo    TABLE     |   CREATE TABLE public.tipo (
    id_tipo integer NOT NULL,
    rol character varying(50),
    estado character varying(50)
);
    DROP TABLE public.tipo;
       public         heap    postgres    false            ?            1259    25576    transportista    TABLE     ?   CREATE TABLE public.transportista (
    id_transportista integer NOT NULL,
    cedula character varying(50),
    nombre_transportista character varying(50),
    telefono character varying(25),
    id_direccion integer NOT NULL
);
 !   DROP TABLE public.transportista;
       public         heap    postgres    false            M          0    25596 	   categoria 
   TABLE DATA           P   COPY public.categoria (id_categoria, nombre_categoria, descripcion) FROM stdin;
    public          postgres    false    216   QN       G          0    25536    cliente 
   TABLE DATA           n   COPY public.cliente (id_cliente, nombre_cliente, apellido_cliente, telefono, email, id_direccion) FROM stdin;
    public          postgres    false    210   ?N       S          0    25674    detalle_factura 
   TABLE DATA           b   COPY public.detalle_factura (num_detalle, num_factura, id_producto, cantidad, precio) FROM stdin;
    public          postgres    false    222   ?N       F          0    25531 	   direccion 
   TABLE DATA           A   COPY public.direccion (id_direccion, ciudad, calles) FROM stdin;
    public          postgres    false    209    O       I          0    25551    empleado 
   TABLE DATA           z   COPY public.empleado (id_empleado, cedula, nombre_empleado, apellido, telefono, email, id_direccion, id_tipo) FROM stdin;
    public          postgres    false    212   O       P          0    25624    envios 
   TABLE DATA           a   COPY public.envios (id_envio, telefono, id_producto, id_transportista, id_direccion) FROM stdin;
    public          postgres    false    219   :O       R          0    25649    factura 
   TABLE DATA           e   COPY public.factura (num_factura, fecha, id_cliente, id_producto, num_pago, id_empleado) FROM stdin;
    public          postgres    false    221   WO       Q          0    25644 	   modo_pago 
   TABLE DATA           P   COPY public.modo_pago (num_pago, nombre_num_pago, detalle_num_pago) FROM stdin;
    public          postgres    false    220   tO       N          0    25601    producto 
   TABLE DATA           ]   COPY public.producto (id_producto, nombre_producto, precio, stock, id_categoria) FROM stdin;
    public          postgres    false    217   ?O       O          0    25611    producto_proveedor 
   TABLE DATA           V   COPY public.producto_proveedor (fecha_entrega, id_producto, id_proveedor) FROM stdin;
    public          postgres    false    218   ?P       L          0    25586 	   proveedor 
   TABLE DATA           b   COPY public.proveedor (id_proveedor, nombre_proveedor, telefono, email, id_direccion) FROM stdin;
    public          postgres    false    215   ?P       J          0    25566    sucursal 
   TABLE DATA           N   COPY public.sucursal (id_sucursal, nombre_sucursal, id_direccion) FROM stdin;
    public          postgres    false    213   ?P       H          0    25546    tipo 
   TABLE DATA           4   COPY public.tipo (id_tipo, rol, estado) FROM stdin;
    public          postgres    false    211   ?P       K          0    25576    transportista 
   TABLE DATA           o   COPY public.transportista (id_transportista, cedula, nombre_transportista, telefono, id_direccion) FROM stdin;
    public          postgres    false    214   Q       ?           2606    25600    categoria categoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    216            ?           2606    25540    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    210            ?           2606    25678 $   detalle_factura detalle_factura_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT detalle_factura_pkey PRIMARY KEY (num_detalle);
 N   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT detalle_factura_pkey;
       public            postgres    false    222            ?           2606    25535    direccion direccion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (id_direccion);
 B   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_pkey;
       public            postgres    false    209            ?           2606    25555    empleado empleado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    212            ?           2606    25628    envios envios_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.envios
    ADD CONSTRAINT envios_pkey PRIMARY KEY (id_envio);
 <   ALTER TABLE ONLY public.envios DROP CONSTRAINT envios_pkey;
       public            postgres    false    219            ?           2606    25653    factura factura_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (num_factura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    221            ?           2606    25648    modo_pago modo_pago_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.modo_pago
    ADD CONSTRAINT modo_pago_pkey PRIMARY KEY (num_pago);
 B   ALTER TABLE ONLY public.modo_pago DROP CONSTRAINT modo_pago_pkey;
       public            postgres    false    220            ?           2606    25605    producto producto_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto);
 @   ALTER TABLE ONLY public.producto DROP CONSTRAINT producto_pkey;
       public            postgres    false    217            ?           2606    25590    proveedor proveedor_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id_proveedor);
 B   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT proveedor_pkey;
       public            postgres    false    215            ?           2606    25570    sucursal sucursal_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id_sucursal);
 @   ALTER TABLE ONLY public.sucursal DROP CONSTRAINT sucursal_pkey;
       public            postgres    false    213            ?           2606    25550    tipo tipo_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.tipo
    ADD CONSTRAINT tipo_pkey PRIMARY KEY (id_tipo);
 8   ALTER TABLE ONLY public.tipo DROP CONSTRAINT tipo_pkey;
       public            postgres    false    211            ?           2606    25580     transportista transportista_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT transportista_pkey PRIMARY KEY (id_transportista);
 J   ALTER TABLE ONLY public.transportista DROP CONSTRAINT transportista_pkey;
       public            postgres    false    214            ?           2606    25606    producto fk_id_categoria    FK CONSTRAINT     ?   ALTER TABLE ONLY public.producto
    ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);
 B   ALTER TABLE ONLY public.producto DROP CONSTRAINT fk_id_categoria;
       public          postgres    false    216    217    3230            ?           2606    25664    factura fk_id_cliente    FK CONSTRAINT     ?   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);
 ?   ALTER TABLE ONLY public.factura DROP CONSTRAINT fk_id_cliente;
       public          postgres    false    210    221    3218            ?           2606    25541    cliente fk_id_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT fk_id_direccion FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 A   ALTER TABLE ONLY public.cliente DROP CONSTRAINT fk_id_direccion;
       public          postgres    false    210    3216    209            ?           2606    25556    empleado fk_id_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT fk_id_direccion FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 B   ALTER TABLE ONLY public.empleado DROP CONSTRAINT fk_id_direccion;
       public          postgres    false    212    209    3216            ?           2606    25571    sucursal fk_id_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT fk_id_direccion FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 B   ALTER TABLE ONLY public.sucursal DROP CONSTRAINT fk_id_direccion;
       public          postgres    false    209    213    3216            ?           2606    25581    transportista fk_id_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.transportista
    ADD CONSTRAINT fk_id_direccion FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 G   ALTER TABLE ONLY public.transportista DROP CONSTRAINT fk_id_direccion;
       public          postgres    false    214    3216    209            ?           2606    25591    proveedor fk_id_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT fk_id_direccion FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 C   ALTER TABLE ONLY public.proveedor DROP CONSTRAINT fk_id_direccion;
       public          postgres    false    3216    215    209            ?           2606    25634    envios fk_id_direccion    FK CONSTRAINT     ?   ALTER TABLE ONLY public.envios
    ADD CONSTRAINT fk_id_direccion FOREIGN KEY (id_direccion) REFERENCES public.direccion(id_direccion);
 @   ALTER TABLE ONLY public.envios DROP CONSTRAINT fk_id_direccion;
       public          postgres    false    219    209    3216            ?           2606    25659    factura fk_id_empleado    FK CONSTRAINT     ?   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado);
 @   ALTER TABLE ONLY public.factura DROP CONSTRAINT fk_id_empleado;
       public          postgres    false    221    3222    212            ?           2606    25614 !   producto_proveedor fk_id_producto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 K   ALTER TABLE ONLY public.producto_proveedor DROP CONSTRAINT fk_id_producto;
       public          postgres    false    217    218    3232            ?           2606    25629    envios fk_id_producto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.envios
    ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 ?   ALTER TABLE ONLY public.envios DROP CONSTRAINT fk_id_producto;
       public          postgres    false    217    3232    219            ?           2606    25654    factura fk_id_producto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 @   ALTER TABLE ONLY public.factura DROP CONSTRAINT fk_id_producto;
       public          postgres    false    3232    221    217            ?           2606    25679    detalle_factura fk_id_producto    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES public.producto(id_producto);
 H   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT fk_id_producto;
       public          postgres    false    3232    217    222            ?           2606    25619 "   producto_proveedor fk_id_proveedor    FK CONSTRAINT     ?   ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT fk_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES public.proveedor(id_proveedor);
 L   ALTER TABLE ONLY public.producto_proveedor DROP CONSTRAINT fk_id_proveedor;
       public          postgres    false    215    218    3228            ?           2606    25561    empleado fk_id_tipo    FK CONSTRAINT     v   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT fk_id_tipo FOREIGN KEY (id_tipo) REFERENCES public.tipo(id_tipo);
 =   ALTER TABLE ONLY public.empleado DROP CONSTRAINT fk_id_tipo;
       public          postgres    false    212    211    3220            ?           2606    25639    envios fk_id_transportista    FK CONSTRAINT     ?   ALTER TABLE ONLY public.envios
    ADD CONSTRAINT fk_id_transportista FOREIGN KEY (id_transportista) REFERENCES public.transportista(id_transportista);
 D   ALTER TABLE ONLY public.envios DROP CONSTRAINT fk_id_transportista;
       public          postgres    false    214    3226    219            ?           2606    25684    detalle_factura fk_num_factura    FK CONSTRAINT     ?   ALTER TABLE ONLY public.detalle_factura
    ADD CONSTRAINT fk_num_factura FOREIGN KEY (num_factura) REFERENCES public.factura(num_factura);
 H   ALTER TABLE ONLY public.detalle_factura DROP CONSTRAINT fk_num_factura;
       public          postgres    false    3238    221    222            ?           2606    25669    factura fk_num_pago    FK CONSTRAINT     }   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT fk_num_pago FOREIGN KEY (num_pago) REFERENCES public.modo_pago(num_pago);
 =   ALTER TABLE ONLY public.factura DROP CONSTRAINT fk_num_pago;
       public          postgres    false    221    220    3236            M   e   x?E??	?@?ki?? ?xH??͏$??9?????c??{??3????6?G???&??O???HW(?-??>PM??Ux??f22?h?:?M??`???},?      G      x?????? ? ?      S      x?????? ? ?      F      x?????? ? ?      I      x?????? ? ?      P      x?????? ? ?      R      x?????? ? ?      Q      x?????? ? ?      N   ?   x?M?1k?0??ӯ??1I??d,J?CKCh?.?h???v	??9??hxﻧw????;????9(t?R
*Zx?)FdQ%?$??S?~f???al????*15?޷?i?eN?????Q}??LnY???.?S$?R???@?knns??z???1K??????tE?D?
????X???o^?FfVM?O8??LI??/Ȏ?cKqه	?NP	}?!????g???#>?7\2b?      O      x?????? ? ?      L      x?????? ? ?      J      x?????? ? ?      H      x?????? ? ?      K      x?????? ? ?     