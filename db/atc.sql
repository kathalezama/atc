--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1+deb10u1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1+deb10u1)

-- Started on 2019-12-04 13:02:53 -04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 16999)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id_log bigint NOT NULL,
    id_usuario integer,
    fecha_registro timestamp without time zone,
    actividad character varying(100),
    sentencia character varying(700)
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16997)
-- Name: logs_id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_log_seq OWNER TO postgres;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 216
-- Name: logs_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_log_seq OWNED BY public.logs.id_log;


--
-- TOC entry 197 (class 1259 OID 16663)
-- Name: menu_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_rol (
    id_mrol bigint NOT NULL,
    id_rol integer,
    id_menu integer
);


ALTER TABLE public.menu_rol OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16747)
-- Name: solicitudes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitudes (
    id_solicitud bigint NOT NULL,
    id_cliente integer,
    id_usuario integer,
    id_pto integer,
    id_estatus integer,
    id_tcliente integer,
    num_atc character varying(100),
    tiempo character varying(10),
    fecha_registro timestamp without time zone,
    ult_mod date
);


ALTER TABLE public.solicitudes OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16745)
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitudes_id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitudes_id_solicitud_seq OWNER TO postgres;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 212
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitudes_id_solicitud_seq OWNED BY public.solicitudes.id_solicitud;


--
-- TOC entry 225 (class 1259 OID 33903)
-- Name: t_atencion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_atencion (
    id_atencion bigint NOT NULL,
    tiket character varying(30),
    id_cliente integer,
    id_pto integer,
    hora_recepcion character varying(30),
    hora_atc_i character varying(30),
    hora_atc_f character varying(30),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_atencion OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33901)
-- Name: t_atencion_id_atencion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_atencion_id_atencion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_atencion_id_atencion_seq OWNER TO postgres;

--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 224
-- Name: t_atencion_id_atencion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_atencion_id_atencion_seq OWNED BY public.t_atencion.id_atencion;


--
-- TOC entry 221 (class 1259 OID 25224)
-- Name: t_canales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_canales (
    id_canal bigint NOT NULL,
    canal character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_canales OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25222)
-- Name: t_canales_id_canal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_canales_id_canal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_canales_id_canal_seq OWNER TO postgres;

--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 220
-- Name: t_canales_id_canal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_canales_id_canal_seq OWNED BY public.t_canales.id_canal;


--
-- TOC entry 215 (class 1259 OID 16755)
-- Name: t_clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_clientes (
    id_cliente bigint NOT NULL,
    cedula integer,
    nombre_completo character varying(100),
    correo character varying(40),
    telefono character varying(40),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_clientes OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16753)
-- Name: t_clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_clientes_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 214
-- Name: t_clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_clientes_id_cliente_seq OWNED BY public.t_clientes.id_cliente;


--
-- TOC entry 207 (class 1259 OID 16709)
-- Name: t_estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_estatus (
    id_estatus bigint NOT NULL,
    estatus character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date
);


ALTER TABLE public.t_estatus OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16707)
-- Name: t_estatus_id_estatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_estatus_id_estatus_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_estatus_id_estatus_seq OWNER TO postgres;

--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 206
-- Name: t_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_estatus_id_estatus_seq OWNED BY public.t_estatus.id_estatus;


--
-- TOC entry 196 (class 1259 OID 16656)
-- Name: t_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_menu (
    id_menu bigint NOT NULL,
    id_padre integer DEFAULT 0,
    item character varying(50),
    icono character varying(50),
    orden integer,
    ruta character varying(200),
    hijos integer DEFAULT 0
);


ALTER TABLE public.t_menu OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25214)
-- Name: t_motivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_motivos (
    id_motivo bigint NOT NULL,
    motivo character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_motivos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25212)
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_motivos_id_motivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_motivos_id_motivo_seq OWNER TO postgres;

--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 218
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_motivos_id_motivo_seq OWNED BY public.t_motivos.id_motivo;


--
-- TOC entry 223 (class 1259 OID 33630)
-- Name: t_pto_pref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_pto_pref (
    id_pto_pre bigint NOT NULL,
    id_pto integer,
    id_pre integer
);


ALTER TABLE public.t_pto_pref OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33628)
-- Name: t_pto_pref_id_pto_pre_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_pto_pref_id_pto_pre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_pto_pref_id_pto_pre_seq OWNER TO postgres;

--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 222
-- Name: t_pto_pref_id_pto_pre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_pto_pref_id_pto_pre_seq OWNED BY public.t_pto_pref.id_pto_pre;


--
-- TOC entry 209 (class 1259 OID 16725)
-- Name: t_pto_serv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_pto_serv (
    id_pto_serv bigint NOT NULL,
    id_pto integer,
    id_servicio integer
);


ALTER TABLE public.t_pto_serv OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16723)
-- Name: t_pto_serv_id_pto_serv_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_pto_serv_id_pto_serv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_pto_serv_id_pto_serv_seq OWNER TO postgres;

--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 208
-- Name: t_pto_serv_id_pto_serv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_pto_serv_id_pto_serv_seq OWNED BY public.t_pto_serv.id_pto_serv;


--
-- TOC entry 203 (class 1259 OID 16691)
-- Name: t_ptos_atc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_ptos_atc (
    id_pto bigint NOT NULL,
    id_analista integer,
    nombre character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_ptos_atc OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16689)
-- Name: t_ptos_atc_id_pto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_ptos_atc_id_pto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ptos_atc_id_pto_seq OWNER TO postgres;

--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_ptos_atc_id_pto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_ptos_atc_id_pto_seq OWNED BY public.t_ptos_atc.id_pto;


--
-- TOC entry 199 (class 1259 OID 16670)
-- Name: t_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_roles (
    id_rol bigint NOT NULL,
    rol character varying(40),
    observacion character varying(300),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod timestamp without time zone,
    estatus_rol integer DEFAULT 0
);


ALTER TABLE public.t_roles OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16668)
-- Name: t_roles_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_roles_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_roles_id_rol_seq OWNER TO postgres;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 198
-- Name: t_roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_roles_id_rol_seq OWNED BY public.t_roles.id_rol;


--
-- TOC entry 205 (class 1259 OID 16700)
-- Name: t_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_servicios (
    id_servicio bigint NOT NULL,
    nombre character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_servicios OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16698)
-- Name: t_servicios_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_servicios_id_servicio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_servicios_id_servicio_seq OWNER TO postgres;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 204
-- Name: t_servicios_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_servicios_id_servicio_seq OWNED BY public.t_servicios.id_servicio;


--
-- TOC entry 211 (class 1259 OID 16739)
-- Name: t_tclientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_tclientes (
    id_tcliente bigint NOT NULL,
    tcliente character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0
);


ALTER TABLE public.t_tclientes OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16737)
-- Name: t_tclientes_id_tcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_tclientes_id_tcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_tclientes_id_tcliente_seq OWNER TO postgres;

--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 210
-- Name: t_tclientes_id_tcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_tclientes_id_tcliente_seq OWNED BY public.t_tclientes.id_tcliente;


--
-- TOC entry 201 (class 1259 OID 16679)
-- Name: t_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_usuarios (
    id_user bigint NOT NULL,
    id_rol integer,
    nombre_completo character varying(100),
    correo character varying(40),
    telefono character varying(40),
    username character varying(20),
    clave character varying(300),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0,
    cedula integer
);


ALTER TABLE public.t_usuarios OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16677)
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.t_usuarios_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_usuarios_id_user_seq OWNER TO postgres;

--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 200
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_usuarios_id_user_seq OWNED BY public.t_usuarios.id_user;


--
-- TOC entry 2880 (class 2604 OID 17002)
-- Name: logs id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id_log SET DEFAULT nextval('public.logs_id_log_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 16750)
-- Name: solicitudes id_solicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes ALTER COLUMN id_solicitud SET DEFAULT nextval('public.solicitudes_id_solicitud_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 33906)
-- Name: t_atencion id_atencion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_atencion ALTER COLUMN id_atencion SET DEFAULT nextval('public.t_atencion_id_atencion_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 25227)
-- Name: t_canales id_canal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_canales ALTER COLUMN id_canal SET DEFAULT nextval('public.t_canales_id_canal_seq'::regclass);


--
-- TOC entry 2878 (class 2604 OID 16758)
-- Name: t_clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.t_clientes_id_cliente_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 16712)
-- Name: t_estatus id_estatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('public.t_estatus_id_estatus_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 25217)
-- Name: t_motivos id_motivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_motivos ALTER COLUMN id_motivo SET DEFAULT nextval('public.t_motivos_id_motivo_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 33633)
-- Name: t_pto_pref id_pto_pre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_pref ALTER COLUMN id_pto_pre SET DEFAULT nextval('public.t_pto_pref_id_pto_pre_seq'::regclass);


--
-- TOC entry 2874 (class 2604 OID 16728)
-- Name: t_pto_serv id_pto_serv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_serv ALTER COLUMN id_pto_serv SET DEFAULT nextval('public.t_pto_serv_id_pto_serv_seq'::regclass);


--
-- TOC entry 2869 (class 2604 OID 16694)
-- Name: t_ptos_atc id_pto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ptos_atc ALTER COLUMN id_pto SET DEFAULT nextval('public.t_ptos_atc_id_pto_seq'::regclass);


--
-- TOC entry 2865 (class 2604 OID 16673)
-- Name: t_roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles ALTER COLUMN id_rol SET DEFAULT nextval('public.t_roles_id_rol_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 16703)
-- Name: t_servicios id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_servicios ALTER COLUMN id_servicio SET DEFAULT nextval('public.t_servicios_id_servicio_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 16742)
-- Name: t_tclientes id_tcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tclientes ALTER COLUMN id_tcliente SET DEFAULT nextval('public.t_tclientes_id_tcliente_seq'::regclass);


--
-- TOC entry 2867 (class 2604 OID 16682)
-- Name: t_usuarios id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id_user SET DEFAULT nextval('public.t_usuarios_id_user_seq'::regclass);


--
-- TOC entry 3064 (class 0 OID 16999)
-- Dependencies: 217
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id_log, id_usuario, fecha_registro, actividad, sentencia) FROM stdin;
29	8	2019-11-18 09:17:42	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
27	8	2019-11-16 17:25:25	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '3'
26	8	2019-11-16 17:25:11	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('21072511', '1', 'Leza,a Katherine', 'klezama@grupobinar.com', '04127255789', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '0', '2019-11-16', '0')
25	8	2019-11-15 16:23:42	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES (NULL, NULL, ' ', NULL, NULL, NULL, 'd41d8cd98f00b204e9800998ecf8427e', '0', '2019-11-15', '0')
24	8	2019-11-15 11:00:23	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = 'e10adc3949ba59abbe56e057f20f883e'\nWHERE "id_user" = '1'
23	8	2019-11-15 11:00:09	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '1'
22	8	2019-11-15 11:00:03	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '1'
21	8	2019-11-15 10:59:57	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '1'
20	8	2019-11-15 10:56:09	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = '202cb962ac59075b964b07152d234b70'\nWHERE "id_user" = '1'
18	8	2019-11-15 10:55:17	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = '123456'\nWHERE "id_user" = '1'
19	8	2019-11-15 10:55:41	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = '123456'\nWHERE "id_user" = '1'
17	8	2019-11-15 10:51:27	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = '123456'\nWHERE "id_user" IS NULL
16	8	2019-11-14 11:11:29	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '6'
15	8	2019-11-14 11:11:26	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '3'
14	8	2019-11-14 11:11:17	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '3'
13	8	2019-11-14 11:11:10	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '3'
12	8	2019-11-14 11:11:05	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '3'
11	8	2019-11-14 11:10:16	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '6'
10	8	2019-11-14 11:10:06	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '3'
9	8	2019-11-14 11:10:03	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '1'
8	8	2019-11-14 11:08:24	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '6'
7	8	2019-11-14 11:08:07	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '3'
6	8	2019-11-14 11:08:04	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '1'
5	8	2019-11-14 11:04:46	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '1'
4	8	2019-11-14 10:54:23	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '3'
1	8	2019-11-14 10:50:44	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('10489029', '3', 'Parra Zulma', 'zparra@gmail.com', '04142508158', 'zparra', '123456', '0', '2019-11-14', '0')
30	8	2019-11-18 09:21:20	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '3'
31	8	2019-11-18 09:55:58	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
32	8	2019-11-18 10:18:33	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
33	8	2019-11-18 10:40:07	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
95	8	2019-12-03 10:15:54	Usuario Modificado	UPDATE "public"."t_usuarios" SET "id_rol" = '3', "nombre_completo" = 'Parra Kelly', "correo" = 'kellyp@gmial.com', "telefono" = '04127255879', "id_usuario" = '8', "ult_mod" = '2019-12-03'\nWHERE "id_user" = '10'
34	8	2019-11-18 10:40:21	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
37	8	2019-11-18 11:42:32	Creación de Motivo	INSERT INTO "public"."t_motivos" ("motivo", "id_usuario", "fecha_registro", "estatus") VALUES ('Prueba', '8', '2019-11-18', '0')
40	8	2019-11-18 11:47:59	Inactivar Motivo	UPDATE "public"."t_motivos" SET "estatus" = '1'\nWHERE "id_motivo" = '27'
41	8	2019-11-18 11:49:37	Activar Motivo	UPDATE "public"."t_motivos" SET "estatus" = '0'\nWHERE "id_motivo" = '27'
42	8	2019-11-18 12:40:14	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
43	8	2019-11-18 12:45:06	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
44	8	2019-11-18 13:58:10	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = 'd41d8cd98f00b204e9800998ecf8427e'\nWHERE "id_user" IS NULL
45	8	2019-11-18 15:04:30	Creación de Motivo	INSERT INTO "public"."t_motivos" ("motivo", "id_usuario", "fecha_registro", "estatus") VALUES ('Prueba', '8', '2019-11-18', '0')
46	8	2019-11-18 15:05:36	Creación de canal de atc	INSERT INTO "public"."t_canales" ("canal", "id_usuario", "fecha_registro", "estatus") VALUES ('prueba', '8', '2019-11-18', '0')
47	8	2019-11-18 15:06:37	Inactivar Motivo	UPDATE "public"."t_canales" SET "estatus" = '1'\nWHERE "id_canal" = '8'
48	8	2019-11-18 15:06:46	Activar Motivo	UPDATE "public"."t_canales" SET "estatus" = '0'\nWHERE "id_canal" = '8'
49	8	2019-11-19 09:32:20	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
50	8	2019-11-19 09:41:52	Creación de atencion preferencial	INSERT INTO "public"."t_tclientes" ("tcliente", "id_usuario", "fecha_registro", "estatus") VALUES ('prueba', '8', '2019-11-19', '0')
51	8	2019-11-19 09:43:50	Inactivar Motivo	UPDATE "public"."t_tclientes" SET "estatus" = '1'\nWHERE "id_tcliente" = '1'
52	8	2019-11-19 09:43:57	Activar Motivo	UPDATE "public"."t_tclientes" SET "estatus" = '0'\nWHERE "id_tcliente" = '1'
53	8	2019-11-19 09:44:01	Inactivar Motivo	UPDATE "public"."t_tclientes" SET "estatus" = '1'\nWHERE "id_tcliente" = '5'
54	8	2019-11-19 09:55:37	Inactivar Motivo	UPDATE "public"."t_motivos" SET "estatus" = '1'\nWHERE "id_motivo" = '28'
55	8	2019-11-19 13:55:58	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
56	8	2019-11-19 14:16:06	Creación de atencion preferencial	INSERT INTO "public"."t_servicios" ("nombre", "id_usuario", "fecha_registro", "estatus") VALUES ('prueba', '8', '2019-11-19', '0')
57	8	2019-11-19 14:17:39	Inactivar servicio	UPDATE "public"."t_servicios" SET "estatus" = '1'\nWHERE "id_servicio" = '1'
58	8	2019-11-19 14:17:45	Activar servicio	UPDATE "public"."t_servicios" SET "estatus" = '0'\nWHERE "id_servicio" = '1'
59	8	2019-11-19 14:17:52	Inactivar servicio	UPDATE "public"."t_servicios" SET "estatus" = '1'\nWHERE "id_servicio" = '4'
60	8	2019-11-19 14:23:33	Atc preferencial modificado	UPDATE "public"."t_tclientes" SET "tcliente" = NULL, "id_usuario" = '8', "ult_mod" = '2019-11-19'\nWHERE "id_tcliente" = '4'
61	8	2019-11-19 14:24:09	Atc preferencial modificado	UPDATE "public"."t_tclientes" SET "tcliente" = 'Clientes especiales', "id_usuario" = '8', "ult_mod" = '2019-11-19'\nWHERE "id_tcliente" = '4'
62	8	2019-11-19 14:25:13	servicio modificado	UPDATE "public"."t_servicios" SET "nombre" = 'prueba..', "id_usuario" = '8', "ult_mod" = '2019-11-19'\nWHERE "id_servicio" = '4'
63	8	2019-11-19 14:26:17	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
64	8	2019-11-19 14:29:33	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('19226092', '1', 'Velasco Ericson', 'ericsonvelascos@gmail.com', '04242661784', 'ericsoncy', 'e10adc3949ba59abbe56e057f20f883e', '8', '2019-11-19', '0')
65	8	2019-11-19 14:30:14	Usuario Modificado	UPDATE "public"."t_usuarios" SET "id_rol" = '1', "nombre_completo" = 'Velasco Ericson', "correo" = 'ericsonvelascos@gmail.com', "telefono" = '04242661784', "id_usuario" = '8', "ult_mod" = '2019-11-19'\nWHERE "id_user" = '9'
66	8	2019-11-19 14:30:36	Cambio de clave	UPDATE "public"."t_usuarios" SET "clave" = '827ccb0eea8a706c4c34a16891f84e7b'\nWHERE "id_user" = '9'
67	8	2019-11-19 14:31:00	Bloquear Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '2'\nWHERE "id_user" = '6'
68	9	2019-11-19 14:34:15	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'ericsoncy'\nAND "t_usuarios"."clave" = '827ccb0eea8a706c4c34a16891f84e7b'\nAND "t_usuarios"."estatus" = '0'
69	9	2019-11-20 14:56:45	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'ericsoncy'\nAND "t_usuarios"."clave" = '827ccb0eea8a706c4c34a16891f84e7b'\nAND "t_usuarios"."estatus" = '0'
70	8	2019-11-21 10:29:56	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
71	8	2019-11-21 14:44:20	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
72	8	2019-11-22 12:06:31	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
73	8	2019-11-22 13:25:59	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
74	8	2019-11-22 14:40:36	Activar Usuario	UPDATE "public"."t_usuarios" SET "estatus" = '0'\nWHERE "id_user" = '6'
75	8	2019-11-22 15:23:02	Creación de punto de atencion	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('q', '6', '8', '2019-11-22', '0')
76	8	2019-11-22 15:23:12	Creación de punto de atencion	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('q', '6', '8', '2019-11-22', '0')
77	8	2019-11-22 15:23:23	Creación de punto de atencion	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('q', '6', '8', '2019-11-22', '0')
78	8	2019-11-22 15:24:11	Creación de punto de atencion	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('q', '6', '8', '2019-11-22', '0')
79	8	2019-11-22 15:26:13	Creación de punto de atencion	SELECT LASTVAL() AS ins_id
80	8	2019-11-25 09:42:33	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
81	8	2019-11-25 10:00:00	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('prueba', '6', '8', '2019-11-25', '0') INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (8, '2') INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (8, '3') INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (8, '1')
82	8	2019-11-25 10:16:16	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('Taquilla 1', '6', '8', '2019-11-25', '0'); INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (9, '2'); INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (9, '3'); INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (9, '1'); INSERT INTO "public"."t_pto_serv" ("id_pto", "id_servicio") VALUES (9, '2')
83	8	2019-11-25 13:53:17	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
84	8	2019-11-26 10:13:16	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
85	8	2019-11-26 15:10:13	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
86	8	2019-11-26 15:33:03	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('Oficina 1', '6', '8', '2019-11-26', '0'); INSERT INTO "public"."t_pto_serv" ("id_pto", "id_servicio") VALUES (10, '3')
87	8	2019-11-27 14:38:26	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
88	8	2019-11-27 21:16:37	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
89	8	2019-11-28 10:27:10	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
90	8	2019-11-28 10:47:26	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
91	8	2019-11-28 14:42:21	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
92	8	2019-12-02 12:54:17	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
93	8	2019-12-03 09:57:10	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
94	8	2019-12-03 10:15:28	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('14953533', '1', 'Parra Kelly', 'kellyp@gmial.com', '04127255879', 'kelly', 'e10adc3949ba59abbe56e057f20f883e', '8', '2019-12-03', '0')
96	8	2019-12-03 10:16:56	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('10381381', '3', 'Morales Jose', 'jmorales@live.com', '04127255879', 'manito', 'e10adc3949ba59abbe56e057f20f883e', '8', '2019-12-03', '0')
97	8	2019-12-03 11:03:55	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES ('Recepcion', '11', '8', '2019-12-03', '0'); INSERT INTO "public"."t_pto_serv" ("id_pto", "id_servicio") VALUES (11, '1')
98	8	2019-12-03 11:07:44	Inactivar punto de atención	UPDATE "public"."t_ptos_atc" SET "estatus" = '1'\nWHERE "id_pto" = '9'
99	8	2019-12-03 11:07:55	Inactivar punto de atención	UPDATE "public"."t_ptos_atc" SET "estatus" = '1'\nWHERE "id_pto" = '9'
100	8	2019-12-03 11:10:44	Activar punto de atención	UPDATE "public"."t_ptos_atc" SET "estatus" = '0'\nWHERE "id_pto" = '9'
101	8	2019-12-03 11:15:29	Inactivar punto de atención	UPDATE "public"."t_ptos_atc" SET "estatus" = '1'\nWHERE "id_pto" = '9'
102	8	2019-12-03 11:15:35	Activar punto de atención	UPDATE "public"."t_ptos_atc" SET "estatus" = '0'\nWHERE "id_pto" = '9'
103	8	2019-12-03 13:42:46	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
104	8	2019-12-03 19:25:35	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
105	8	2019-12-04 08:54:05	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
106	8	2019-12-04 09:47:43	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
107	8	2019-12-04 10:47:23	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
108	8	2019-12-04 10:47:56	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus") VALUES (NULL, NULL, '8', '2019-12-04', '0'); INSERT INTO "public"."t_pto_pref" ("id_pto", "id_pre") VALUES (12, '1'); INSERT INTO "public"."t_pto_serv" ("id_pto", "id_servicio") VALUES (12, '2')
109	8	2019-12-04 10:48:09	Inactivar punto de atención	UPDATE "public"."t_ptos_atc" SET "estatus" = '1'\nWHERE "id_pto" = '12'
110	8	2019-12-04 10:53:04	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('21072511', 'katherine', NULL, NULL, '8', '2019-12-04', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "estatus") VALUES (1, '0', '10:53:04', 'K-2511', '8', '2019-12-04', '0')
111	8	2019-12-04 10:54:04	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('123123', 'Eduardo', NULL, NULL, '8', '2019-12-04', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "estatus") VALUES (2, '0', '10:54:04', 'E-3123', '8', '2019-12-04', '0')
\.


--
-- TOC entry 3044 (class 0 OID 16663)
-- Dependencies: 197
-- Data for Name: menu_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_rol (id_mrol, id_rol, id_menu) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
8	1	8
9	1	9
10	1	10
11	1	11
\.


--
-- TOC entry 3060 (class 0 OID 16747)
-- Dependencies: 213
-- Data for Name: solicitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitudes (id_solicitud, id_cliente, id_usuario, id_pto, id_estatus, id_tcliente, num_atc, tiempo, fecha_registro, ult_mod) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 33903)
-- Dependencies: 225
-- Data for Name: t_atencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_atencion (id_atencion, tiket, id_cliente, id_pto, hora_recepcion, hora_atc_i, hora_atc_f, id_usuario, fecha_registro, estatus) FROM stdin;
1	K-2511	1	0	10:53:04	\N	\N	8	2019-12-04 00:00:00	0
2	E-3123	2	0	10:54:04	\N	\N	8	2019-12-04 00:00:00	0
\.


--
-- TOC entry 3068 (class 0 OID 25224)
-- Dependencies: 221
-- Data for Name: t_canales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_canales (id_canal, canal, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
2	LLAMADA SALIENTE 	\N	\N	\N	0
3	WHATSAPP 0424-1400791	\N	\N	\N	0
4	WHATSAPP 0424-1768114	\N	\N	\N	0
5	CORREO	\N	\N	\N	0
6	CORREO PAGINA WEB	\N	\N	\N	0
7	MENSAJE DE VOZ	\N	\N	\N	0
8	prueba	8	2019-11-18 00:00:00	\N	0
1	LLAMADA ENTRANTE.	8	\N	2019-11-18	0
\.


--
-- TOC entry 3062 (class 0 OID 16755)
-- Dependencies: 215
-- Data for Name: t_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_clientes (id_cliente, cedula, nombre_completo, correo, telefono, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
1	21072511	katherine	\N	\N	8	2019-12-04 00:00:00	\N	0
2	123123	Eduardo	\N	\N	8	2019-12-04 00:00:00	\N	0
\.


--
-- TOC entry 3054 (class 0 OID 16709)
-- Dependencies: 207
-- Data for Name: t_estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_estatus (id_estatus, estatus, id_usuario, fecha_registro, ult_mod) FROM stdin;
0	Activo	\N	\N	\N
1	Inactivo	\N	\N	\N
2	Bloqueado	\N	\N	\N
4	En espera	\N	\N	\N
5	Atendido	\N	\N	\N
\.


--
-- TOC entry 3043 (class 0 OID 16656)
-- Dependencies: 196
-- Data for Name: t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_menu (id_menu, id_padre, item, icono, orden, ruta, hijos) FROM stdin;
2	1	Crear Usuario	\N	1	index.php/usuarios/	0
4	3	Motivo de la visita	\N	1	index.php/motivos	0
5	1	Perfile	\N	2	index.php/usuarios/perfiles	0
1	0	Usuarios	\N	2	#	1
3	0	Configuración	\N	1	#	1
6	3	Canales de atención	\N	2	index.php/canales	0
8	3	Atención preferencial	\N	4	index.php/preferencial	0
9	3	Servicios	\N	5	index.php/servicios	0
10	3	Puntos de atención	\N	6	index.php/puntos	0
11	0	Recepcion	\N	3	index.php/recepcion	0
\.


--
-- TOC entry 3066 (class 0 OID 25214)
-- Dependencies: 219
-- Data for Name: t_motivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_motivos (id_motivo, motivo, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
3	CUADRO DE POLIZA	\N	\N	\N	0
4	REINTEGRO	\N	\N	\N	0
5	CAJA	\N	\N	\N	0
6	ANULACION DE POLIZA	\N	\N	\N	0
7	EXCLUSIÓN	\N	\N	\N	0
8	INCLUSIÓN 	\N	\N	\N	0
9	SMS POR RECHAZO	\N	\N	\N	0
10	PAGAR PÓLIZA-CAJA	\N	\N	\N	0
11	ENTREGA DE DOCUMENTOS	\N	\N	\N	0
12	ACTUALIZACION DATOS	\N	\N	\N	0
13	REEMBOLSO	\N	\N	\N	0
14	CONSULTA DE POLIZA	\N	\N	\N	0
15	INF. PLANES Y SERVICIOS	\N	\N	\N	0
16	CAMBIO DOMICILIACIÓN BANCARIA	\N	\N	\N	0
17	CORRECION DE DATOS	\N	\N	\N	0
18	CAMBIO DE TOMADOR 	\N	\N	\N	0
19	EMISION DE POLIZA 	\N	\N	\N	0
20	RENOVACION DE POLIZA	\N	\N	\N	0
21	COBROS DOBLES	\N	\N	\N	0
22	EXCLUSION Y CAMBIO DOM BANCARIA	\N	\N	\N	0
23	OTRO	\N	\N	\N	0
1	ESTADO ACTUAL DE POLIZA.	8	\N	2019-11-18	0
2	AUMENTO DE SUMA ASEGURADA.	8	\N	2019-11-18	0
28	Prueba	8	2019-11-18 00:00:00	\N	1
\.


--
-- TOC entry 3070 (class 0 OID 33630)
-- Dependencies: 223
-- Data for Name: t_pto_pref; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_pto_pref (id_pto_pre, id_pto, id_pre) FROM stdin;
4	9	2
5	9	3
6	9	1
7	12	1
\.


--
-- TOC entry 3056 (class 0 OID 16725)
-- Dependencies: 209
-- Data for Name: t_pto_serv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_pto_serv (id_pto_serv, id_pto, id_servicio) FROM stdin;
1	9	2
2	10	3
3	11	1
4	12	2
\.


--
-- TOC entry 3050 (class 0 OID 16691)
-- Dependencies: 203
-- Data for Name: t_ptos_atc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ptos_atc (id_pto, id_analista, nombre, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
10	10	Oficina 1	8	2019-11-26 00:00:00	\N	0
11	11	Recepcion	8	2019-12-03 00:00:00	\N	0
9	6	Taquilla 1	8	2019-11-25 00:00:00	\N	0
12	\N	\N	8	2019-12-04 00:00:00	\N	1
\.


--
-- TOC entry 3046 (class 0 OID 16670)
-- Dependencies: 199
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_roles (id_rol, rol, observacion, id_usuario, fecha_registro, ult_mod, estatus_rol) FROM stdin;
1	Administrador	\N	\N	\N	\N	0
2	Recepcionista	\N	\N	\N	\N	0
3	Punto de atencion	\N	\N	\N	\N	0
\.


--
-- TOC entry 3052 (class 0 OID 16700)
-- Dependencies: 205
-- Data for Name: t_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_servicios (id_servicio, nombre, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
2	Poliza Funeraria	\N	\N	\N	0
3	RCV	\N	\N	\N	0
1	Poliza de vida	\N	\N	\N	0
4	prueba..	8	2019-11-19 00:00:00	2019-11-19	1
\.


--
-- TOC entry 3058 (class 0 OID 16739)
-- Dependencies: 211
-- Data for Name: t_tclientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_tclientes (id_tcliente, tcliente, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
2	Mujeres embarazadas	\N	\N	\N	0
3	Adultos con discapacidad	\N	\N	\N	0
1	Tercera edad.	8	\N	2019-11-19	0
5	prueba	8	2019-11-19 00:00:00	\N	1
4	Clientes especiales	8	\N	2019-11-19	0
\.


--
-- TOC entry 3048 (class 0 OID 16679)
-- Dependencies: 201
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_usuarios (id_user, id_rol, nombre_completo, correo, telefono, username, clave, id_usuario, fecha_registro, ult_mod, estatus, cedula) FROM stdin;
8	1	Lezama Katherine	klezama@grupobinar.com	04127255789	admin	e10adc3949ba59abbe56e057f20f883e	0	2019-11-16 00:00:00	2019-11-16	0	21072511
3	2	Parejo Eduardo	eparejo@gmail.com	04127255879	eduardo	123456	0	2019-11-14 00:00:00	2019-11-15	0	5535661
9	1	Velasco Ericson	ericsonvelascos@gmail.com	04242661784	ericsoncy	827ccb0eea8a706c4c34a16891f84e7b	8	2019-11-19 00:00:00	2019-11-19	0	19226092
6	3	Parra Zulma	zparra@gmail.com	04142508158	zparra	123456	0	2019-11-14 00:00:00	\N	0	10489029
10	3	Parra Kelly	kellyp@gmial.com	04127255879	kelly	e10adc3949ba59abbe56e057f20f883e	8	2019-12-03 00:00:00	2019-12-03	0	14953533
11	3	Morales Jose	jmorales@live.com	04127255879	manito	e10adc3949ba59abbe56e057f20f883e	8	2019-12-03 00:00:00	\N	0	10381381
\.


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 216
-- Name: logs_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_log_seq', 111, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 212
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_id_solicitud_seq', 1, false);


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 224
-- Name: t_atencion_id_atencion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_atencion_id_atencion_seq', 2, true);


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 220
-- Name: t_canales_id_canal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_canales_id_canal_seq', 8, true);


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 214
-- Name: t_clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_clientes_id_cliente_seq', 2, true);


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 206
-- Name: t_estatus_id_estatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_estatus_id_estatus_seq', 5, true);


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 218
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_motivos_id_motivo_seq', 28, true);


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 222
-- Name: t_pto_pref_id_pto_pre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_pto_pref_id_pto_pre_seq', 7, true);


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 208
-- Name: t_pto_serv_id_pto_serv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_pto_serv_id_pto_serv_seq', 4, true);


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_ptos_atc_id_pto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_ptos_atc_id_pto_seq', 12, true);


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 198
-- Name: t_roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_roles_id_rol_seq', 3, true);


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 204
-- Name: t_servicios_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_servicios_id_servicio_seq', 4, true);


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 210
-- Name: t_tclientes_id_tcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tclientes_id_tcliente_seq', 5, true);


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 200
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_usuarios_id_user_seq', 11, true);


--
-- TOC entry 2895 (class 2606 OID 17092)
-- Name: t_usuarios cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT cedula UNIQUE (cedula);


--
-- TOC entry 2921 (class 2606 OID 33909)
-- Name: t_atencion id_atencion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_atencion
    ADD CONSTRAINT id_atencion PRIMARY KEY (id_atencion);


--
-- TOC entry 2917 (class 2606 OID 25230)
-- Name: t_canales id_canal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_canales
    ADD CONSTRAINT id_canal PRIMARY KEY (id_canal);


--
-- TOC entry 2911 (class 2606 OID 16761)
-- Name: t_clientes id_clientev; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT id_clientev PRIMARY KEY (id_cliente);


--
-- TOC entry 2903 (class 2606 OID 16714)
-- Name: t_estatus id_estatus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_estatus
    ADD CONSTRAINT id_estatus PRIMARY KEY (id_estatus);


--
-- TOC entry 2913 (class 2606 OID 17007)
-- Name: logs id_log; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT id_log PRIMARY KEY (id_log);


--
-- TOC entry 2915 (class 2606 OID 25219)
-- Name: t_motivos id_motivo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_motivos
    ADD CONSTRAINT id_motivo PRIMARY KEY (id_motivo);


--
-- TOC entry 2899 (class 2606 OID 16697)
-- Name: t_ptos_atc id_pto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ptos_atc
    ADD CONSTRAINT id_pto PRIMARY KEY (id_pto);


--
-- TOC entry 2919 (class 2606 OID 33635)
-- Name: t_pto_pref id_pto_pre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_pref
    ADD CONSTRAINT id_pto_pre PRIMARY KEY (id_pto_pre);


--
-- TOC entry 2905 (class 2606 OID 16730)
-- Name: t_pto_serv id_pto_serv; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_serv
    ADD CONSTRAINT id_pto_serv PRIMARY KEY (id_pto_serv);


--
-- TOC entry 2901 (class 2606 OID 16706)
-- Name: t_servicios id_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_servicios
    ADD CONSTRAINT id_servicio PRIMARY KEY (id_servicio);


--
-- TOC entry 2909 (class 2606 OID 16752)
-- Name: solicitudes id_solicitud; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT id_solicitud PRIMARY KEY (id_solicitud);


--
-- TOC entry 2907 (class 2606 OID 16744)
-- Name: t_tclientes id_tclientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tclientes
    ADD CONSTRAINT id_tclientes PRIMARY KEY (id_tcliente);


--
-- TOC entry 2889 (class 2606 OID 16662)
-- Name: t_menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- TOC entry 2891 (class 2606 OID 16667)
-- Name: menu_rol pk_mrol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT pk_mrol PRIMARY KEY (id_mrol);


--
-- TOC entry 2893 (class 2606 OID 16676)
-- Name: t_roles pk_rol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);


--
-- TOC entry 2897 (class 2606 OID 16688)
-- Name: t_usuarios pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);


-- Completed on 2019-12-04 13:02:54 -04

--
-- PostgreSQL database dump complete
--

