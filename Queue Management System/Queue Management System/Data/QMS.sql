PGDMP     :    *    	            {            QMS    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24849    QMS    DATABASE     x   CREATE DATABASE "QMS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Kenya.1252';
    DROP DATABASE "QMS";
                postgres    false            �            1259    24850    appusers    TABLE     �   CREATE TABLE public.appusers (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    password text NOT NULL,
    role character varying(128) NOT NULL,
    servicepointid integer
);
    DROP TABLE public.appusers;
       public         heap    postgres    false            �            1259    24855    queue    TABLE     )  CREATE TABLE public.queue (
    id integer NOT NULL,
    servicepointid integer NOT NULL,
    status integer,
    createdat timestamp without time zone DEFAULT now(),
    updatedat time without time zone,
    completedat time without time zone,
    waitingtime integer,
    servicetime integer
);
    DROP TABLE public.queue;
       public         heap    postgres    false            �            1259    24859    quelist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quelist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.quelist_id_seq;
       public          postgres    false    215                       0    0    quelist_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.quelist_id_seq OWNED BY public.queue.id;
          public          postgres    false    216            �            1259    24860    servicepoints    TABLE        CREATE TABLE public.servicepoints (
    id integer NOT NULL,
    name character varying(128),
    serviceproviderid integer
);
 !   DROP TABLE public.servicepoints;
       public         heap    postgres    false            �            1259    24863    servicepoints_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicepoints_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.servicepoints_id_seq;
       public          postgres    false    217                       0    0    servicepoints_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.servicepoints_id_seq OWNED BY public.servicepoints.id;
          public          postgres    false    218            �            1259    24864    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    214                       0    0    users_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.users_id_seq OWNED BY public.appusers.id;
          public          postgres    false    219            o           2604    24865    appusers id    DEFAULT     g   ALTER TABLE ONLY public.appusers ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 :   ALTER TABLE public.appusers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    214            p           2604    24866    queue id    DEFAULT     f   ALTER TABLE ONLY public.queue ALTER COLUMN id SET DEFAULT nextval('public.quelist_id_seq'::regclass);
 7   ALTER TABLE public.queue ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            r           2604    24867    servicepoints id    DEFAULT     t   ALTER TABLE ONLY public.servicepoints ALTER COLUMN id SET DEFAULT nextval('public.servicepoints_id_seq'::regclass);
 ?   ALTER TABLE public.servicepoints ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217                      0    24850    appusers 
   TABLE DATA           L   COPY public.appusers (id, name, password, role, servicepointid) FROM stdin;
    public          postgres    false    214   �!                 0    24855    queue 
   TABLE DATA           x   COPY public.queue (id, servicepointid, status, createdat, updatedat, completedat, waitingtime, servicetime) FROM stdin;
    public          postgres    false    215   C"                 0    24860    servicepoints 
   TABLE DATA           D   COPY public.servicepoints (id, name, serviceproviderid) FROM stdin;
    public          postgres    false    217   �#                  0    0    quelist_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.quelist_id_seq', 681, true);
          public          postgres    false    216                       0    0    servicepoints_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.servicepoints_id_seq', 26, true);
          public          postgres    false    218                       0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 37, true);
          public          postgres    false    219            x           2606    24869    queue quelist_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.queue
    ADD CONSTRAINT quelist_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.queue DROP CONSTRAINT quelist_pkey;
       public            postgres    false    215            z           2606    24871 $   servicepoints servicepoints_name_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.servicepoints
    ADD CONSTRAINT servicepoints_name_key UNIQUE (name);
 N   ALTER TABLE ONLY public.servicepoints DROP CONSTRAINT servicepoints_name_key;
       public            postgres    false    217            |           2606    24873     servicepoints servicepoints_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.servicepoints
    ADD CONSTRAINT servicepoints_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.servicepoints DROP CONSTRAINT servicepoints_pkey;
       public            postgres    false    217            t           2606    24875    appusers unique_name 
   CONSTRAINT     O   ALTER TABLE ONLY public.appusers
    ADD CONSTRAINT unique_name UNIQUE (name);
 >   ALTER TABLE ONLY public.appusers DROP CONSTRAINT unique_name;
       public            postgres    false    214            v           2606    24877    appusers users_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.appusers
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.appusers DROP CONSTRAINT users_pkey;
       public            postgres    false    214            }           2606    24878    appusers fk_servicepointid    FK CONSTRAINT     �   ALTER TABLE ONLY public.appusers
    ADD CONSTRAINT fk_servicepointid FOREIGN KEY (servicepointid) REFERENCES public.servicepoints(id);
 D   ALTER TABLE ONLY public.appusers DROP CONSTRAINT fk_servicepointid;
       public          postgres    false    214    3196    217            ~           2606    24883 !   queue quelist_servicepointid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.queue
    ADD CONSTRAINT quelist_servicepointid_fkey FOREIGN KEY (servicepointid) REFERENCES public.servicepoints(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.queue DROP CONSTRAINT quelist_servicepointid_fkey;
       public          postgres    false    217    3196    215                       2606    24888 2   servicepoints servicepoints_serviceproviderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicepoints
    ADD CONSTRAINT servicepoints_serviceproviderid_fkey FOREIGN KEY (serviceproviderid) REFERENCES public.appusers(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.servicepoints DROP CONSTRAINT servicepoints_serviceproviderid_fkey;
       public          postgres    false    217    3190    214               c   x�3�tL��̃��F�P�!��_iQq�!����e&�*�e���C䡪��+3�2��CUcWf�e
���6��̄�"Um�]�)W� _�D�         C  x�u��m�@D��*Ҁ	އjI�u�-��!� ���<�~Yد}a]�9�R�K�e����"�>��������H�'��Q���$��?����.I�0��Z�����r���s���kL���Z���n��A�0(�YOݧǥ���[�1�f�/7����(DW���Ǆ�m��eo��fJg Js�U]�ֵ8K�լ��4�R�F{1�5r�frm ����x�	�L�~O$���8U����2~`FV�ٯ(V��v�ز1�!T�.��ĜP&�s�� ��'�|��]iҳ
c��篡]��$��p���m��         V   x��;� ���aL������YQ\���)gĜ��T��,0d�hRBJQ.X�X���5k�#��f}�����ۢ�P0�>����     