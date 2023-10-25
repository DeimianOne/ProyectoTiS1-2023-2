PGDMP  $    ;            	    {        	   proy-tis1    16.0    16.0 E    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    16398 	   proy-tis1    DATABASE     ~   CREATE DATABASE "proy-tis1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "proy-tis1";
                postgres    false            �            1259    16537    calificacion    TABLE     �   CREATE TABLE public.calificacion (
    cod_calificacion bigint NOT NULL,
    rut_usuario bigint NOT NULL,
    calificacion smallint NOT NULL,
    comentario character varying(500)
);
     DROP TABLE public.calificacion;
       public         heap    postgres    false            �            1259    16453    comuna    TABLE     �   CREATE TABLE public.comuna (
    cod_comuna bigint NOT NULL,
    cod_region bigint NOT NULL,
    nombre_comuna character varying(50) NOT NULL
);
    DROP TABLE public.comuna;
       public         heap    postgres    false            �            1259    16434    departamento    TABLE     �   CREATE TABLE public.departamento (
    cod_departamento bigint NOT NULL,
    cod_municipalidad bigint NOT NULL,
    nombre_departamento character varying(50) NOT NULL,
    telefono_departamento bigint NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    16427 	   direccion    TABLE     �   CREATE TABLE public.direccion (
    rut_usuario bigint NOT NULL,
    cod_direccion bigint NOT NULL,
    cod_comuna bigint NOT NULL,
    calle character varying NOT NULL,
    numero smallint NOT NULL,
    numero_departamento smallint
);
    DROP TABLE public.direccion;
       public         heap    postgres    false            �            1259    16473    encargado_departamento    TABLE     v   CREATE TABLE public.encargado_departamento (
    cod_departamento bigint NOT NULL,
    rut_usuario bigint NOT NULL
);
 *   DROP TABLE public.encargado_departamento;
       public         heap    postgres    false            �            1259    16439    municipalidad    TABLE     �   CREATE TABLE public.municipalidad (
    cod_municipalidad bigint NOT NULL,
    cod_comuna bigint NOT NULL,
    direccion_municipalidad character varying NOT NULL,
    correo_municipalidad character varying NOT NULL
);
 !   DROP TABLE public.municipalidad;
       public         heap    postgres    false            �            1259    16532    permiso    TABLE     �   CREATE TABLE public.permiso (
    cod_permiso bigint NOT NULL,
    nombre_permiso character varying(30) NOT NULL,
    descripcion_permiso character varying(50)
);
    DROP TABLE public.permiso;
       public         heap    postgres    false            �            1259    16446    proyecto    TABLE     !  CREATE TABLE public.proyecto (
    cod_proyecto bigint NOT NULL,
    cod_departamento bigint NOT NULL,
    nombre_proyecto character varying(50) NOT NULL,
    descripcion_proyecto character varying(500) NOT NULL,
    fecha_inicio_proyecto date,
    fecha_termino_estimada_proyecto date
);
    DROP TABLE public.proyecto;
       public         heap    postgres    false            �            1259    16458    region    TABLE     q   CREATE TABLE public.region (
    cod_region bigint NOT NULL,
    nombre_region character varying(50) NOT NULL
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    16408 	   respuesta    TABLE     �   CREATE TABLE public.respuesta (
    cod_respuesta bigint NOT NULL,
    cod_ticket bigint NOT NULL,
    rut_usuario bigint NOT NULL,
    detalles_respuesta text NOT NULL,
    fecha_hora_envio_respuesta timestamp without time zone
);
    DROP TABLE public.respuesta;
       public         heap    postgres    false            �            1259    16527    rol    TABLE     h   CREATE TABLE public.rol (
    cod_rol bigint NOT NULL,
    nombre_rol character varying(30) NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false            �            1259    16599    rol_permiso    TABLE     b   CREATE TABLE public.rol_permiso (
    cod_permiso bigint NOT NULL,
    cod_rol bigint NOT NULL
);
    DROP TABLE public.rol_permiso;
       public         heap    postgres    false            �            1259    16415    suscripcion    TABLE     e   CREATE TABLE public.suscripcion (
    cod_ticket bigint NOT NULL,
    rut_usuario bigint NOT NULL
);
    DROP TABLE public.suscripcion;
       public         heap    postgres    false            �            1259    16400    ticket    TABLE     N  CREATE TABLE public.ticket (
    cod_ticket integer NOT NULL,
    cod_departamento bigint NOT NULL,
    rut_usuario bigint NOT NULL,
    tipo_solicitud character varying,
    detalles_solicitud text,
    estado_solicitud character varying,
    visibilidad_solicitud boolean,
    fecha_hora_envio_ticket timestamp without time zone
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            �            1259    16399    ticket_cod_ticket_seq    SEQUENCE     �   CREATE SEQUENCE public.ticket_cod_ticket_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ticket_cod_ticket_seq;
       public          postgres    false    216            *           0    0    ticket_cod_ticket_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ticket_cod_ticket_seq OWNED BY public.ticket.cod_ticket;
          public          postgres    false    215            �            1259    16420    usuario    TABLE     1  CREATE TABLE public.usuario (
    rut_usuario bigint NOT NULL,
    nombre_usuario character varying NOT NULL,
    correo_electronico_usuario character varying NOT NULL,
    correo_electronico_tercero character varying,
    telefono_usuario bigint,
    telefono_tercero bigint,
    cod_direccion bigint
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    16522    usuario_rol    TABLE     b   CREATE TABLE public.usuario_rol (
    cod_rol bigint NOT NULL,
    rut_usuario bigint NOT NULL
);
    DROP TABLE public.usuario_rol;
       public         heap    postgres    false            V           2604    16403    ticket cod_ticket    DEFAULT     v   ALTER TABLE ONLY public.ticket ALTER COLUMN cod_ticket SET DEFAULT nextval('public.ticket_cod_ticket_seq'::regclass);
 @   ALTER TABLE public.ticket ALTER COLUMN cod_ticket DROP DEFAULT;
       public          postgres    false    216    215    216            "          0    16537    calificacion 
   TABLE DATA           _   COPY public.calificacion (cod_calificacion, rut_usuario, calificacion, comentario) FROM stdin;
    public          postgres    false    230   U                 0    16453    comuna 
   TABLE DATA           G   COPY public.comuna (cod_comuna, cod_region, nombre_comuna) FROM stdin;
    public          postgres    false    224   <U                 0    16434    departamento 
   TABLE DATA           w   COPY public.departamento (cod_departamento, cod_municipalidad, nombre_departamento, telefono_departamento) FROM stdin;
    public          postgres    false    221   YU                 0    16427 	   direccion 
   TABLE DATA           o   COPY public.direccion (rut_usuario, cod_direccion, cod_comuna, calle, numero, numero_departamento) FROM stdin;
    public          postgres    false    220   vU                 0    16473    encargado_departamento 
   TABLE DATA           O   COPY public.encargado_departamento (cod_departamento, rut_usuario) FROM stdin;
    public          postgres    false    226   �U                 0    16439    municipalidad 
   TABLE DATA           u   COPY public.municipalidad (cod_municipalidad, cod_comuna, direccion_municipalidad, correo_municipalidad) FROM stdin;
    public          postgres    false    222   �U       !          0    16532    permiso 
   TABLE DATA           S   COPY public.permiso (cod_permiso, nombre_permiso, descripcion_permiso) FROM stdin;
    public          postgres    false    229   �U                 0    16446    proyecto 
   TABLE DATA           �   COPY public.proyecto (cod_proyecto, cod_departamento, nombre_proyecto, descripcion_proyecto, fecha_inicio_proyecto, fecha_termino_estimada_proyecto) FROM stdin;
    public          postgres    false    223   �U                 0    16458    region 
   TABLE DATA           ;   COPY public.region (cod_region, nombre_region) FROM stdin;
    public          postgres    false    225   V                 0    16408 	   respuesta 
   TABLE DATA           {   COPY public.respuesta (cod_respuesta, cod_ticket, rut_usuario, detalles_respuesta, fecha_hora_envio_respuesta) FROM stdin;
    public          postgres    false    217   $V                  0    16527    rol 
   TABLE DATA           2   COPY public.rol (cod_rol, nombre_rol) FROM stdin;
    public          postgres    false    228   AV       #          0    16599    rol_permiso 
   TABLE DATA           ;   COPY public.rol_permiso (cod_permiso, cod_rol) FROM stdin;
    public          postgres    false    231   ^V                 0    16415    suscripcion 
   TABLE DATA           >   COPY public.suscripcion (cod_ticket, rut_usuario) FROM stdin;
    public          postgres    false    218   {V                 0    16400    ticket 
   TABLE DATA           �   COPY public.ticket (cod_ticket, cod_departamento, rut_usuario, tipo_solicitud, detalles_solicitud, estado_solicitud, visibilidad_solicitud, fecha_hora_envio_ticket) FROM stdin;
    public          postgres    false    216   �V                 0    16420    usuario 
   TABLE DATA           �   COPY public.usuario (rut_usuario, nombre_usuario, correo_electronico_usuario, correo_electronico_tercero, telefono_usuario, telefono_tercero, cod_direccion) FROM stdin;
    public          postgres    false    219   �V                 0    16522    usuario_rol 
   TABLE DATA           ;   COPY public.usuario_rol (cod_rol, rut_usuario) FROM stdin;
    public          postgres    false    227   �V       +           0    0    ticket_cod_ticket_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ticket_cod_ticket_seq', 1, false);
          public          postgres    false    215            t           2606    16543    calificacion calificacion_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (cod_calificacion);
 H   ALTER TABLE ONLY public.calificacion DROP CONSTRAINT calificacion_pkey;
       public            postgres    false    230            h           2606    16457    comuna comuna_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (cod_comuna);
 <   ALTER TABLE ONLY public.comuna DROP CONSTRAINT comuna_pkey;
       public            postgres    false    224            b           2606    16546    departamento departamento_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (cod_departamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    221            `           2606    16433    direccion direccion_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT direccion_pkey PRIMARY KEY (cod_direccion, rut_usuario);
 B   ALTER TABLE ONLY public.direccion DROP CONSTRAINT direccion_pkey;
       public            postgres    false    220    220            l           2606    16559 2   encargado_departamento encargado_departamento_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.encargado_departamento
    ADD CONSTRAINT encargado_departamento_pkey PRIMARY KEY (cod_departamento, rut_usuario);
 \   ALTER TABLE ONLY public.encargado_departamento DROP CONSTRAINT encargado_departamento_pkey;
       public            postgres    false    226    226            d           2606    16491     municipalidad municipalidad_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.municipalidad
    ADD CONSTRAINT municipalidad_pkey PRIMARY KEY (cod_municipalidad);
 J   ALTER TABLE ONLY public.municipalidad DROP CONSTRAINT municipalidad_pkey;
       public            postgres    false    222            r           2606    16536    permiso permiso_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (cod_permiso);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public            postgres    false    229            f           2606    16452    proyecto proyecto_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (cod_proyecto);
 @   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT proyecto_pkey;
       public            postgres    false    223            j           2606    16462    region region_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (cod_region);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    225            Z           2606    16414    respuesta respuesta_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_pkey PRIMARY KEY (cod_respuesta);
 B   ALTER TABLE ONLY public.respuesta DROP CONSTRAINT respuesta_pkey;
       public            postgres    false    217            v           2606    16603    rol_permiso rol_permiso_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.rol_permiso
    ADD CONSTRAINT rol_permiso_pkey PRIMARY KEY (cod_permiso, cod_rol);
 F   ALTER TABLE ONLY public.rol_permiso DROP CONSTRAINT rol_permiso_pkey;
       public            postgres    false    231    231            p           2606    16531    rol rol_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (cod_rol);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public            postgres    false    228            \           2606    16419    suscripcion suscripcion_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT suscripcion_pkey PRIMARY KEY (cod_ticket, rut_usuario);
 F   ALTER TABLE ONLY public.suscripcion DROP CONSTRAINT suscripcion_pkey;
       public            postgres    false    218    218            X           2606    16407    ticket ticket_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (cod_ticket);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    216            ^           2606    16426    usuario usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (rut_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    219            n           2606    16526    usuario_rol usuario_rol_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT usuario_rol_pkey PRIMARY KEY (cod_rol, rut_usuario);
 F   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT usuario_rol_pkey;
       public            postgres    false    227    227            {           2606    16594    municipalidad comunaFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.municipalidad
    ADD CONSTRAINT "comunaFK" FOREIGN KEY (cod_comuna) REFERENCES public.comuna(cod_comuna) NOT VALID;
 B   ALTER TABLE ONLY public.municipalidad DROP CONSTRAINT "comunaFK";
       public          postgres    false    222    224    4712            |           2606    16553    proyecto departamentoFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT "departamentoFK" FOREIGN KEY (cod_departamento) REFERENCES public.departamento(cod_departamento) NOT VALID;
 C   ALTER TABLE ONLY public.proyecto DROP CONSTRAINT "departamentoFK";
       public          postgres    false    223    4706    221            ~           2606    16564 %   encargado_departamento departamentoFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.encargado_departamento
    ADD CONSTRAINT "departamentoFK" FOREIGN KEY (cod_departamento) REFERENCES public.departamento(cod_departamento) NOT VALID;
 Q   ALTER TABLE ONLY public.encargado_departamento DROP CONSTRAINT "departamentoFK";
       public          postgres    false    226    221    4706                       2606    16569 "   encargado_departamento encargadoFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.encargado_departamento
    ADD CONSTRAINT "encargadoFK" FOREIGN KEY (rut_usuario) REFERENCES public.usuario(rut_usuario) ON UPDATE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public.encargado_departamento DROP CONSTRAINT "encargadoFK";
       public          postgres    false    226    219    4702            �           2606    16604    rol_permiso permisoFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.rol_permiso
    ADD CONSTRAINT "permisoFK" FOREIGN KEY (cod_permiso) REFERENCES public.permiso(cod_permiso) NOT VALID;
 A   ALTER TABLE ONLY public.rol_permiso DROP CONSTRAINT "permisoFK";
       public          postgres    false    4722    231    229            }           2606    16589    comuna regionFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT "regionFK" FOREIGN KEY (cod_region) REFERENCES public.region(cod_region) NOT VALID;
 ;   ALTER TABLE ONLY public.comuna DROP CONSTRAINT "regionFK";
       public          postgres    false    225    4714    224            �           2606    16609    rol_permiso rolFK    FK CONSTRAINT        ALTER TABLE ONLY public.rol_permiso
    ADD CONSTRAINT "rolFK" FOREIGN KEY (cod_rol) REFERENCES public.rol(cod_rol) NOT VALID;
 =   ALTER TABLE ONLY public.rol_permiso DROP CONSTRAINT "rolFK";
       public          postgres    false    228    4720    231            �           2606    16619    usuario_rol rolFK    FK CONSTRAINT        ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT "rolFK" FOREIGN KEY (cod_rol) REFERENCES public.rol(cod_rol) NOT VALID;
 =   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT "rolFK";
       public          postgres    false    227    4720    228            x           2606    16574    suscripcion ticketFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT "ticketFK" FOREIGN KEY (cod_ticket) REFERENCES public.ticket(cod_ticket) ON UPDATE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.suscripcion DROP CONSTRAINT "ticketFK";
       public          postgres    false    216    218    4696            w           2606    16584    respuesta ticketFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT "ticketFK" FOREIGN KEY (cod_ticket) REFERENCES public.ticket(cod_ticket) NOT VALID;
 >   ALTER TABLE ONLY public.respuesta DROP CONSTRAINT "ticketFK";
       public          postgres    false    216    217    4696            y           2606    16579    suscripcion usuarioFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT "usuarioFK" FOREIGN KEY (rut_usuario) REFERENCES public.usuario(rut_usuario) ON UPDATE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public.suscripcion DROP CONSTRAINT "usuarioFK";
       public          postgres    false    219    218    4702            �           2606    16614    usuario_rol usuarioFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT "usuarioFK" FOREIGN KEY (rut_usuario) REFERENCES public.usuario(rut_usuario) NOT VALID;
 A   ALTER TABLE ONLY public.usuario_rol DROP CONSTRAINT "usuarioFK";
       public          postgres    false    219    227    4702            z           2606    16624    direccion usuarioFK    FK CONSTRAINT     �   ALTER TABLE ONLY public.direccion
    ADD CONSTRAINT "usuarioFK" FOREIGN KEY (rut_usuario) REFERENCES public.usuario(rut_usuario) NOT VALID;
 ?   ALTER TABLE ONLY public.direccion DROP CONSTRAINT "usuarioFK";
       public          postgres    false    219    4702    220            "      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      !      x������ � �            x������ � �            x������ � �            x������ � �             x������ � �      #      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     