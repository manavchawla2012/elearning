PGDMP     /                    x            elearn #   11.5 (Ubuntu 11.5-0ubuntu0.19.04.1) #   11.5 (Ubuntu 11.5-0ubuntu0.19.04.1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16388    elearn    DATABASE     l   CREATE DATABASE elearn WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_IN' LC_CTYPE = 'en_IN';
    DROP DATABASE elearn;
             manav    false            �          0    16401    users 
   TABLE DATA               �   COPY public.users (id, username, password, first_name, phone, email, state, country, created_at, last_name, role_id, updated_at, last_login, gender) FROM stdin;
    public       manav    false    197   3       �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
            public       manav    false    196            �   C  x����N1E��W�����*��K6I:���>���((^�^��6��ܕGA��0�R	Eba�JMA��h������d�
,��r��m;����  X -(�1u�Z����n�Ӧ>�$^��	:�1�����6�������c;�,��>���>���#L�@GQ�p��/��!GI�-��~����J�T1n����	�KS,��2�5B�<��1�d5�)��%���H�8�3�U�S�o{7�i�N��vۡ��}`=�����f+�T0c�ز�g��1����_��E5!�c>��.i�d�y�	��l6{�ϴ�     