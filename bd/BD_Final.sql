PGDMP  .    /                }            Back    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    17178    Back    DATABASE     l   CREATE DATABASE "Back" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-AR';
    DROP DATABASE "Back";
                     postgres    false            �            1259    17191    recuperacion    TABLE     �   CREATE TABLE public.recuperacion (
    id integer NOT NULL,
    id_usuario integer NOT NULL,
    codigo character varying(10) NOT NULL,
    usado boolean DEFAULT false
);
     DROP TABLE public.recuperacion;
       public         heap r       postgres    false            �            1259    17190    recuperacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.recuperacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.recuperacion_id_seq;
       public               postgres    false    220            �           0    0    recuperacion_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.recuperacion_id_seq OWNED BY public.recuperacion.id;
          public               postgres    false    219            �            1259    17180    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    gmail character varying(150) NOT NULL,
    contra_hash text NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    17179    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    218            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    217            '           2604    17194    recuperacion id    DEFAULT     r   ALTER TABLE ONLY public.recuperacion ALTER COLUMN id SET DEFAULT nextval('public.recuperacion_id_seq'::regclass);
 >   ALTER TABLE public.recuperacion ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            &           2604    17183    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    17191    recuperacion 
   TABLE DATA           E   COPY public.recuperacion (id, id_usuario, codigo, usado) FROM stdin;
    public               postgres    false    220   �       �          0    17180    usuarios 
   TABLE DATA           L   COPY public.usuarios (id, nombre, apellido, gmail, contra_hash) FROM stdin;
    public               postgres    false    218   �       �           0    0    recuperacion_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.recuperacion_id_seq', 1, false);
          public               postgres    false    219            �           0    0    usuarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.usuarios_id_seq', 1, false);
          public               postgres    false    217            .           2606    17197    recuperacion recuperacion_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.recuperacion
    ADD CONSTRAINT recuperacion_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.recuperacion DROP CONSTRAINT recuperacion_pkey;
       public                 postgres    false    220            *           2606    17189    usuarios usuarios_gmail_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_gmail_key UNIQUE (gmail);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_gmail_key;
       public                 postgres    false    218            ,           2606    17187    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    218            /           2606    17198    recuperacion fk_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.recuperacion
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.recuperacion DROP CONSTRAINT fk_usuario;
       public               postgres    false    4652    220    218            �      x������ � �      �      x������ � �     