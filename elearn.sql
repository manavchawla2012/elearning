PGDMP
     
                     x            elearn #   11.5 (Ubuntu 11.5-0ubuntu0.19.04.1) #   11.5 (Ubuntu 11.5-0ubuntu0.19.04.1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    16388    elearn    DATABASE     l   CREATE DATABASE elearn WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_IN' LC_CTYPE = 'en_IN';
    DROP DATABASE elearn;
             manav    false            �            1259    16445 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         manav    false            �            1259    16443    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       manav    false    205            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       manav    false    204            �            1259    16455    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         manav    false            �            1259    16453    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       manav    false    207            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       manav    false    206            �            1259    16437    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         manav    false            �            1259    16435    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       manav    false    203            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       manav    false    202            �            1259    16463 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         manav    false            �            1259    16473    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         manav    false            �            1259    16471    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       manav    false    211            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       manav    false    210            �            1259    16461    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       manav    false    209            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       manav    false    208            �            1259    16481    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         manav    false            �            1259    16479 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       manav    false    213            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       manav    false    212            �            1259    16695 
   device_id_seq    SEQUENCE     v   CREATE SEQUENCE public.device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.device_id_seq;
       public       manav    false            �            1259    16687    devices    TABLE       CREATE TABLE public.devices (
    updated_at timestamp without time zone[],
    name character varying NOT NULL,
    id bigint DEFAULT nextval('public.device_id_seq'::regclass) NOT NULL,
    created_at timestamp without time zone[] NOT NULL,
    md5 character varying NOT NULL
);
    DROP TABLE public.devices;
       public         manav    false    230            �            1259    16541    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         manav    false            �            1259    16539    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       manav    false    215            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       manav    false    214            �            1259    16427    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         manav    false            �            1259    16425    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       manav    false    201            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       manav    false    200            �            1259    16416    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         manav    false            �            1259    16414    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       manav    false    199            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       manav    false    198            �            1259    16572    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         manav    false            �            1259    16596    role_id_seq    SEQUENCE     t   CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public       manav    false            �            1259    16583    roles    TABLE     �   CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.role_id_seq'::regclass) NOT NULL,
    name character varying(40) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.roles;
       public         manav    false    218            �           0    0    TABLE roles    COMMENT     <   COMMENT ON TABLE public.roles IS 'Table for storing Roles';
            public       manav    false    217            �            1259    16700 	   short_url    TABLE       CREATE TABLE public.short_url (
    id integer NOT NULL,
    path character varying NOT NULL,
    parameters character varying,
    expiery_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    md5 character varying NOT NULL
);
    DROP TABLE public.short_url;
       public         manav    false            �            1259    16698    short_url_id_seq    SEQUENCE     �   ALTER TABLE public.short_url ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.short_url_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       manav    false    232            �            1259    16607    social_auth_association    TABLE     <  CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);
 +   DROP TABLE public.social_auth_association;
       public         manav    false            �            1259    16605    social_auth_association_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.social_auth_association_id_seq;
       public       manav    false    220            �           0    0    social_auth_association_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;
            public       manav    false    219            �            1259    16618    social_auth_code    TABLE     �   CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.social_auth_code;
       public         manav    false            �            1259    16616    social_auth_code_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.social_auth_code_id_seq;
       public       manav    false    222            �           0    0    social_auth_code_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;
            public       manav    false    221            �            1259    16626    social_auth_nonce    TABLE     �   CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);
 %   DROP TABLE public.social_auth_nonce;
       public         manav    false            �            1259    16624    social_auth_nonce_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.social_auth_nonce_id_seq;
       public       manav    false    224            �           0    0    social_auth_nonce_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;
            public       manav    false    223            �            1259    16668    social_auth_partial    TABLE     T  CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);
 '   DROP TABLE public.social_auth_partial;
       public         manav    false            �            1259    16666    social_auth_partial_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.social_auth_partial_id_seq;
       public       manav    false    228            �           0    0    social_auth_partial_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;
            public       manav    false    227            �            1259    16634    social_auth_usersocialauth    TABLE     �   CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);
 .   DROP TABLE public.social_auth_usersocialauth;
       public         manav    false            �            1259    16632 !   social_auth_usersocialauth_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.social_auth_usersocialauth_id_seq;
       public       manav    false    226            �           0    0 !   social_auth_usersocialauth_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;
            public       manav    false    225            �            1259    16401    users    TABLE     /  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(50) NOT NULL,
    first_name character varying(40) NOT NULL,
    phone bigint,
    email character varying(40),
    state character varying(30),
    country character varying(40),
    created_at timestamp without time zone,
    last_name character varying(40) NOT NULL,
    role_id integer NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    last_login timestamp without time zone,
    gender character varying
);
    DROP TABLE public.users;
       public         manav    false            �            1259    16399    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       manav    false    197            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       manav    false    196            q           2604    16448 
   auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       manav    false    205    204    205            r           2604    16458    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       manav    false    207    206    207            p           2604    16440    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       manav    false    202    203    203            s           2604    16466    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       manav    false    208    209    209            t           2604    16476    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       manav    false    210    211    211            u           2604    16484    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       manav    false    213    212    213            v           2604    16544    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       manav    false    214    215    215            o           2604    16430    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       manav    false    200    201    201            n           2604    16419    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       manav    false    199    198    199            y           2604    16610    social_auth_association id    DEFAULT     �   ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);
 I   ALTER TABLE public.social_auth_association ALTER COLUMN id DROP DEFAULT;
       public       manav    false    219    220    220            z           2604    16621    social_auth_code id    DEFAULT     z   ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);
 B   ALTER TABLE public.social_auth_code ALTER COLUMN id DROP DEFAULT;
       public       manav    false    221    222    222            {           2604    16629    social_auth_nonce id    DEFAULT     |   ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);
 C   ALTER TABLE public.social_auth_nonce ALTER COLUMN id DROP DEFAULT;
       public       manav    false    223    224    224            }           2604    16671    social_auth_partial id    DEFAULT     �   ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);
 E   ALTER TABLE public.social_auth_partial ALTER COLUMN id DROP DEFAULT;
       public       manav    false    228    227    228            |           2604    16637    social_auth_usersocialauth id    DEFAULT     �   ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);
 L   ALTER TABLE public.social_auth_usersocialauth ALTER COLUMN id DROP DEFAULT;
       public       manav    false    225    226    226            m           2604    16404    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       manav    false    196    197    197            b          0    16445 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       manav    false    205   ��       d          0    16455    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       manav    false    207   ��       `          0    16437    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       manav    false    203   ��       f          0    16463 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       manav    false    209   �       h          0    16473    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       manav    false    211   )�       j          0    16481    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       manav    false    213   F�       z          0    16687    devices 
   TABLE DATA               H   COPY public.devices (updated_at, name, id, created_at, md5) FROM stdin;
    public       manav    false    229   c�       l          0    16541    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       manav    false    215   ��       ^          0    16427    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       manav    false    201   ��       \          0    16416    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       manav    false    199   �       m          0    16572    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       manav    false    216   ��       n          0    16583    roles 
   TABLE DATA               A   COPY public.roles (id, name, created_at, updated_at) FROM stdin;
    public       manav    false    217   ��       }          0    16700 	   short_url 
   TABLE DATA               X   COPY public.short_url (id, path, parameters, expiery_date, created_at, md5) FROM stdin;
    public       manav    false    232   �       q          0    16607    social_auth_association 
   TABLE DATA               o   COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
    public       manav    false    220   ��       s          0    16618    social_auth_code 
   TABLE DATA               R   COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
    public       manav    false    222   ��       u          0    16626    social_auth_nonce 
   TABLE DATA               N   COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
    public       manav    false    224    �       y          0    16668    social_auth_partial 
   TABLE DATA               _   COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
    public       manav    false    228   �       w          0    16634    social_auth_usersocialauth 
   TABLE DATA               \   COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
    public       manav    false    226   :�       Z          0    16401    users 
   TABLE DATA               �   COPY public.users (id, username, password, first_name, phone, email, state, country, created_at, last_name, role_id, updated_at, last_login, gender) FROM stdin;
    public       manav    false    197   W�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       manav    false    204            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       manav    false    206            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 24, true);
            public       manav    false    202            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       manav    false    210            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
            public       manav    false    208            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       manav    false    212            �           0    0 
   device_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.device_id_seq', 1, false);
            public       manav    false    230            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
            public       manav    false    214            �           0    0    django_content_type_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.django_content_type_id_seq', 6, true);
            public       manav    false    200            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 52, true);
            public       manav    false    198            �           0    0    role_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.role_id_seq', 3, true);
            public       manav    false    218            �           0    0    short_url_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.short_url_id_seq', 6, true);
            public       manav    false    231            �           0    0    social_auth_association_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);
            public       manav    false    219            �           0    0    social_auth_code_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);
            public       manav    false    221            �           0    0    social_auth_nonce_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);
            public       manav    false    223            �           0    0    social_auth_partial_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);
            public       manav    false    227            �           0    0 !   social_auth_usersocialauth_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);
            public       manav    false    225            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
            public       manav    false    196            �           2606    16570    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         manav    false    205            �           2606    16497 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         manav    false    207    207            �           2606    16460 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         manav    false    207            �           2606    16450    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         manav    false    205            �           2606    16488 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         manav    false    203    203            �           2606    16442 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         manav    false    203            �           2606    16478 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         manav    false    211            �           2606    16512 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         manav    false    211    211            �           2606    16468    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         manav    false    209            �           2606    16486 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         manav    false    213            �           2606    16526 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         manav    false    213    213            �           2606    16564     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         manav    false    209            �           2606    16694    devices devices_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey;
       public         manav    false    229            �           2606    16550 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         manav    false    215            �           2606    16434 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         manav    false    201    201            �           2606    16432 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         manav    false    201            �           2606    16424 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         manav    false    199            �           2606    16579 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         manav    false    216            �           2606    16589    roles name_unq 
   CONSTRAINT     I   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT name_unq UNIQUE (name);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT name_unq;
       public         manav    false    217            �           2606    16587    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         manav    false    217            �           2606    16707    short_url short_url_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.short_url
    ADD CONSTRAINT short_url_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.short_url DROP CONSTRAINT short_url_pkey;
       public         manav    false    232            �           2606    16615 4   social_auth_association social_auth_association_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.social_auth_association DROP CONSTRAINT social_auth_association_pkey;
       public         manav    false    220            �           2606    16665 O   social_auth_association social_auth_association_server_url_handle_078befa2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);
 y   ALTER TABLE ONLY public.social_auth_association DROP CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq;
       public         manav    false    220    220            �           2606    16663 :   social_auth_code social_auth_code_email_code_801b2d02_uniq 
   CONSTRAINT     |   ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);
 d   ALTER TABLE ONLY public.social_auth_code DROP CONSTRAINT social_auth_code_email_code_801b2d02_uniq;
       public         manav    false    222    222            �           2606    16623 &   social_auth_code social_auth_code_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.social_auth_code DROP CONSTRAINT social_auth_code_pkey;
       public         manav    false    222            �           2606    16631 (   social_auth_nonce social_auth_nonce_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.social_auth_nonce DROP CONSTRAINT social_auth_nonce_pkey;
       public         manav    false    224            �           2606    16648 K   social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);
 u   ALTER TABLE ONLY public.social_auth_nonce DROP CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq;
       public         manav    false    224    224    224            �           2606    16677 ,   social_auth_partial social_auth_partial_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.social_auth_partial DROP CONSTRAINT social_auth_partial_pkey;
       public         manav    false    228            �           2606    16642 :   social_auth_usersocialauth social_auth_usersocialauth_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.social_auth_usersocialauth DROP CONSTRAINT social_auth_usersocialauth_pkey;
       public         manav    false    226            �           2606    16644 P   social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);
 z   ALTER TABLE ONLY public.social_auth_usersocialauth DROP CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq;
       public         manav    false    226    226            �           2606    16408    users uname_unq 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uname_unq UNIQUE (username);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT uname_unq;
       public         manav    false    197            �           2606    16406    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         manav    false    197            �           1259    16571    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         manav    false    205            �           1259    16508 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         manav    false    207            �           1259    16509 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         manav    false    207            �           1259    16494 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         manav    false    203            �           1259    16524 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         manav    false    211            �           1259    16523 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         manav    false    211            �           1259    16538 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         manav    false    213            �           1259    16537 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         manav    false    213            �           1259    16565     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         manav    false    209            �           1259    16561 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         manav    false    215            �           1259    16562 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         manav    false    215            �           1259    16581 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         manav    false    216            �           1259    16580 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         manav    false    216            �           1259    16595    fki_role_id    INDEX     @   CREATE INDEX fki_role_id ON public.users USING btree (role_id);
    DROP INDEX public.fki_role_id;
       public         manav    false    197            �           1259    16649    social_auth_code_code_a2393167    INDEX     [   CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);
 2   DROP INDEX public.social_auth_code_code_a2393167;
       public         manav    false    222            �           1259    16650 #   social_auth_code_code_a2393167_like    INDEX     t   CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);
 7   DROP INDEX public.social_auth_code_code_a2393167_like;
       public         manav    false    222            �           1259    16681 #   social_auth_code_timestamp_176b341f    INDEX     g   CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");
 7   DROP INDEX public.social_auth_code_timestamp_176b341f;
       public         manav    false    222            �           1259    16683 &   social_auth_partial_timestamp_50f2119f    INDEX     m   CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");
 :   DROP INDEX public.social_auth_partial_timestamp_50f2119f;
       public         manav    false    228            �           1259    16678 "   social_auth_partial_token_3017fea3    INDEX     c   CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);
 6   DROP INDEX public.social_auth_partial_token_3017fea3;
       public         manav    false    228            �           1259    16679 '   social_auth_partial_token_3017fea3_like    INDEX     |   CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);
 ;   DROP INDEX public.social_auth_partial_token_3017fea3_like;
       public         manav    false    228            �           1259    16656 +   social_auth_usersocialauth_user_id_17d28448    INDEX     u   CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);
 ?   DROP INDEX public.social_auth_usersocialauth_user_id_17d28448;
       public         manav    false    226            �           2606    16503 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       manav    false    2959    207    203            �           2606    16498 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       manav    false    2964    205    207            �           2606    16489 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       manav    false    201    203    2954            �           2606    16518 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       manav    false    211    2964    205            �           2606    16513 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       manav    false    211    2972    209            �           2606    16532 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       manav    false    213    2959    203            �           2606    16527 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       manav    false    2972    213    209            �           2606    16551 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       manav    false    201    215    2954            �           2606    16556 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       manav    false    2972    215    209            �           2606    16590 
   users role_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 7   ALTER TABLE ONLY public.users DROP CONSTRAINT role_id;
       public       manav    false    217    197    2999            �           2606    16657 R   social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_users_id 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_users_id FOREIGN KEY (user_id) REFERENCES public.users(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.social_auth_usersocialauth DROP CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_users_id;
       public       manav    false    2948    226    197            b   
   x������ � �      d   
   x������ � �      `   
  x�]�K��0��ur
N0j£�z�Q�B�b�:�h�����I�%��o��i�g�f��c�Y����G�<��ЂRq�0G��f
�a����[�m��Le���4u}0�x`+� �	{�}�R��NT����v�����֝d�~O]D�l�	�����<,�����ӺB�[ZA)���T���qu�<�͏>��_��� ��m�.2�)H���:x�ޟ8�1WY��'���`:Y��;�LL�vf���x댰j'�k�2�      f   
   x������ � �      h   
   x������ � �      j   
   x������ � �      z   
   x������ � �      l   
   x������ � �      ^   W   x�M�K
�0�y����M�P�C�.z{E��LOn�!љ='���\��
K�!'�o�k��JU̴�d�f���)?�~��pM^%�      \   �  x���Mr�0����O�ҿZ���J��a
"�~���l�A����6���`�!�u�V�2uFA������3c90,������VYi��X�g�<�DJ%�e�+�QmF�~���X���m�R��6ޖ�5��% �BE݄��?La��&�Rզ��׶1U��k�^}�C)9l��,FD_jb�i��@�P�B��p�#�r�c$�8b��I�&�����	�e���i/n"	ݙ�AXD.$ ��\m˥.\i��;x�t;�*��;��-��' �1A�����E����1��l˿]1ʢ7��
��!g�s�l�9��`z�
's��s04�+)	� ��������a�d����p��qΥ�i�P������e�2�/��\Et�.���h܇��Dpd#��n��9t�Ln��W��o�����UEhm��B�.�6^����AO_�3���X�8"��G{U�Xظ��d�E{Kkg�������mnW8����h�ޔ���|%�Σ׌e�7����*��}��(��g�7cj3�i�U�q��}N�<+�@"���X�iH�����}�J� �8�.���Ui��[�l߻^��5�˃�0�y����U!1�Lm�:D�a�EiEFwڥwcw��B�QO��X�]���w��EZ��"9��-�K��?y'�2l[���N���!��      m   �   x�m̻n�0 @�9|E�*�8F�@��(4��B�	�!��Ą�o�Щ���Zp3��z�}�ݩ��'���ޛ}���ӍZ@VQ"
�IaJ]�CM�����r���{L#1��⥽ߵ�9.gɳc]�U��)UVq�6�-g}��JT�CVĤzT�b��ٓa����������(8��Ρb�L���y+���;�W��(dԸBFjCdDg��+X�F�� � �
�\�%��8/�q�rb�      n   A   x�3�tL��̋��4202�50�52U00�21�20�&�e�RZ�_D�zcN��Ģ�T�u��qqq ��>      }   �   x����
�0E��W�r#M��4��M�)
J����`6�J7]].���U�������\���G<�<~�J�ҹt�j��!EdK��'�Ȱ�ە��!��.I�,�$���9{#����]�`= K��7���{
j$��5�?�?����c>�	��      q   
   x������ � �      s   
   x������ � �      u   
   x������ � �      y   
   x������ � �      w   
   x������ � �      Z   �   x���Mn�@�s�\ #��3�X��q���vQ8>!�@����w���&����IE�P��L.��E���0�n�v�>�EI)iK��q�������226�
�5Ŭ)S0�������A�ꬑ4D5Zˊ�%6���8T�o�Ϟ~e��X6�_�p[�4��k�8/�E�W�5.�9����IGC�V�>TUu*�W�     