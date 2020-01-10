--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1+deb10u1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1+deb10u1)

-- Started on 2020-01-08 08:28:58 -04

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
-- TOC entry 196 (class 1259 OID 24577)
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
-- TOC entry 197 (class 1259 OID 24583)
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
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 197
-- Name: logs_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_log_seq OWNED BY public.logs.id_log;


--
-- TOC entry 226 (class 1259 OID 24724)
-- Name: seq_menu_rol; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_menu_rol
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_menu_rol OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24585)
-- Name: menu_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_rol (
    id_mrol bigint DEFAULT nextval('public.seq_menu_rol'::regclass) NOT NULL,
    id_rol integer,
    id_menu integer
);


ALTER TABLE public.menu_rol OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24588)
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
-- TOC entry 200 (class 1259 OID 24591)
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
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 200
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitudes_id_solicitud_seq OWNED BY public.solicitudes.id_solicitud;


--
-- TOC entry 201 (class 1259 OID 24593)
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
    estatus integer DEFAULT 4,
    id_servicio integer,
    id_motivo integer,
    id_pref integer,
    id_ces integer,
    observacion character varying(500),
    id_canal integer DEFAULT 0,
    id_analista integer
);


ALTER TABLE public.t_atencion OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 24601)
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
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_atencion_id_atencion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_atencion_id_atencion_seq OWNED BY public.t_atencion.id_atencion;


--
-- TOC entry 203 (class 1259 OID 24603)
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
-- TOC entry 204 (class 1259 OID 24607)
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
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 204
-- Name: t_canales_id_canal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_canales_id_canal_seq OWNED BY public.t_canales.id_canal;


--
-- TOC entry 205 (class 1259 OID 24609)
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
-- TOC entry 206 (class 1259 OID 24613)
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
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 206
-- Name: t_clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_clientes_id_cliente_seq OWNED BY public.t_clientes.id_cliente;


--
-- TOC entry 207 (class 1259 OID 24615)
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
-- TOC entry 208 (class 1259 OID 24618)
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
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 208
-- Name: t_estatus_id_estatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_estatus_id_estatus_seq OWNED BY public.t_estatus.id_estatus;


--
-- TOC entry 209 (class 1259 OID 24620)
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
-- TOC entry 210 (class 1259 OID 24625)
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
-- TOC entry 211 (class 1259 OID 24629)
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
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 211
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_motivos_id_motivo_seq OWNED BY public.t_motivos.id_motivo;


--
-- TOC entry 212 (class 1259 OID 24631)
-- Name: t_pto_pref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_pto_pref (
    id_pto_pre bigint NOT NULL,
    id_pto integer,
    id_pre integer
);


ALTER TABLE public.t_pto_pref OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24634)
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
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 213
-- Name: t_pto_pref_id_pto_pre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_pto_pref_id_pto_pre_seq OWNED BY public.t_pto_pref.id_pto_pre;


--
-- TOC entry 214 (class 1259 OID 24636)
-- Name: t_pto_serv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_pto_serv (
    id_pto_serv bigint NOT NULL,
    id_pto integer,
    id_servicio integer
);


ALTER TABLE public.t_pto_serv OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24639)
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
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 215
-- Name: t_pto_serv_id_pto_serv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_pto_serv_id_pto_serv_seq OWNED BY public.t_pto_serv.id_pto_serv;


--
-- TOC entry 216 (class 1259 OID 24641)
-- Name: t_ptos_atc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_ptos_atc (
    id_pto bigint NOT NULL,
    id_analista integer,
    nombre character varying(100),
    id_usuario integer,
    fecha_registro timestamp without time zone,
    ult_mod date,
    estatus integer DEFAULT 0,
    id_servicio integer,
    id_pref integer,
    id_ces integer
);


ALTER TABLE public.t_ptos_atc OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24645)
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
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 217
-- Name: t_ptos_atc_id_pto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_ptos_atc_id_pto_seq OWNED BY public.t_ptos_atc.id_pto;


--
-- TOC entry 218 (class 1259 OID 24647)
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
-- TOC entry 219 (class 1259 OID 24651)
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
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 219
-- Name: t_roles_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_roles_id_rol_seq OWNED BY public.t_roles.id_rol;


--
-- TOC entry 220 (class 1259 OID 24653)
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
-- TOC entry 221 (class 1259 OID 24657)
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
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 221
-- Name: t_servicios_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_servicios_id_servicio_seq OWNED BY public.t_servicios.id_servicio;


--
-- TOC entry 222 (class 1259 OID 24659)
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
-- TOC entry 223 (class 1259 OID 24663)
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
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 223
-- Name: t_tclientes_id_tcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_tclientes_id_tcliente_seq OWNED BY public.t_tclientes.id_tcliente;


--
-- TOC entry 224 (class 1259 OID 24665)
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
-- TOC entry 225 (class 1259 OID 24672)
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
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 225
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.t_usuarios_id_user_seq OWNED BY public.t_usuarios.id_user;


--
-- TOC entry 2866 (class 2604 OID 24674)
-- Name: logs id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id_log SET DEFAULT nextval('public.logs_id_log_seq'::regclass);


--
-- TOC entry 2868 (class 2604 OID 24675)
-- Name: solicitudes id_solicitud; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes ALTER COLUMN id_solicitud SET DEFAULT nextval('public.solicitudes_id_solicitud_seq'::regclass);


--
-- TOC entry 2871 (class 2604 OID 24676)
-- Name: t_atencion id_atencion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_atencion ALTER COLUMN id_atencion SET DEFAULT nextval('public.t_atencion_id_atencion_seq'::regclass);


--
-- TOC entry 2873 (class 2604 OID 24677)
-- Name: t_canales id_canal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_canales ALTER COLUMN id_canal SET DEFAULT nextval('public.t_canales_id_canal_seq'::regclass);


--
-- TOC entry 2875 (class 2604 OID 24678)
-- Name: t_clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.t_clientes_id_cliente_seq'::regclass);


--
-- TOC entry 2876 (class 2604 OID 24679)
-- Name: t_estatus id_estatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_estatus ALTER COLUMN id_estatus SET DEFAULT nextval('public.t_estatus_id_estatus_seq'::regclass);


--
-- TOC entry 2880 (class 2604 OID 24680)
-- Name: t_motivos id_motivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_motivos ALTER COLUMN id_motivo SET DEFAULT nextval('public.t_motivos_id_motivo_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 24681)
-- Name: t_pto_pref id_pto_pre; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_pref ALTER COLUMN id_pto_pre SET DEFAULT nextval('public.t_pto_pref_id_pto_pre_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 24682)
-- Name: t_pto_serv id_pto_serv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_serv ALTER COLUMN id_pto_serv SET DEFAULT nextval('public.t_pto_serv_id_pto_serv_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 24683)
-- Name: t_ptos_atc id_pto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ptos_atc ALTER COLUMN id_pto SET DEFAULT nextval('public.t_ptos_atc_id_pto_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 24684)
-- Name: t_roles id_rol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles ALTER COLUMN id_rol SET DEFAULT nextval('public.t_roles_id_rol_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 24685)
-- Name: t_servicios id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_servicios ALTER COLUMN id_servicio SET DEFAULT nextval('public.t_servicios_id_servicio_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 24686)
-- Name: t_tclientes id_tcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tclientes ALTER COLUMN id_tcliente SET DEFAULT nextval('public.t_tclientes_id_tcliente_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 24687)
-- Name: t_usuarios id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios ALTER COLUMN id_user SET DEFAULT nextval('public.t_usuarios_id_user_seq'::regclass);


--
-- TOC entry 3048 (class 0 OID 24577)
-- Dependencies: 196
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id_log, id_usuario, fecha_registro, actividad, sentencia) FROM stdin;
140	8	2019-12-05 15:02:42	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
141	8	2019-12-05 15:03:13	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
142	8	2019-12-05 15:03:42	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
143	8	2019-12-05 15:20:42	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
144	8	2019-12-05 15:22:23	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
145	8	2019-12-05 15:23:00	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
146	8	2019-12-05 15:29:42	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus", "id_servicio", "id_pref", "id_ces") VALUES ('Oficina I', '11', '8', '2019-12-05', '0', '3', '1', NULL)
147	8	2019-12-05 15:39:12	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
148	8	2019-12-05 15:40:13	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '1'\nAND "estatus" = '0'\nAND "id_pref" = '1'
149	8	2019-12-05 15:41:40	Creación de ticket	SELECT *\nFROM "public"."t_ptos_atc"\nWHERE "id_servicio" = '3'\nAND "estatus" = '0'\nAND "id_pref" = '1'
150	8	2019-12-06 13:27:08	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
151	8	2019-12-07 17:22:20	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
152	8	2019-12-07 17:42:47	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('27067695', 'Ana Lezama', 'jmorales@live.com', '04142508158', '8', '2019-12-07', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES (25, '0', '17:42:47', 'A-7695', '8', '2019-12-07', '1', '9', '1', NULL)
153	8	2019-12-07 19:36:22	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
154	8	2019-12-07 22:11:45	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula"\nFROM "public"."t_usuarios"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
155	8	2019-12-07 23:50:20	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
156	11	2019-12-07 23:50:50	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'manito'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
157	8	2019-12-07 23:51:06	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
158	8	2019-12-08 11:27:38	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
159	8	2019-12-08 11:38:22	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('987654', '3', 'Prueb Punto ', 'kathylezama@live.com', '04127255879', 'punto', 'dbf8386ad34c7bac0e3f5f712756bfae', '8', '2019-12-08', '0')
160	8	2019-12-08 11:39:08	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
161	8	2019-12-08 11:39:37	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus", "id_servicio", "id_pref", "id_ces") VALUES ('prueba', '12', '8', '2019-12-08', '0', '1', NULL, NULL)
162	8	2019-12-08 11:39:53	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
163	8	2019-12-08 11:40:29	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('98765432', 'Prueba', 'kathylezama@live.com', '04127255879', '8', '2019-12-08', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES (26, '0', '11:40:29', 'P-5432', '8', '2019-12-08', '1', '3', NULL, NULL)
192	8	2019-12-09 08:29:09	Atc preferencial modificado	UPDATE "public"."t_tclientes" SET "tcliente" = NULL, "id_usuario" = '8', "ult_mod" = '2019-12-09'\nWHERE "id_tcliente" = '15'
164	12	2019-12-08 11:40:50	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
165	12	2019-12-08 11:59:06	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL\nWHERE "id_atencion" IS NULL
166	12	2019-12-08 11:59:13	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL\nWHERE "id_atencion" IS NULL
167	12	2019-12-08 12:00:38	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
168	12	2019-12-08 12:01:23	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL\nWHERE "id_atencion" = '15'
169	12	2019-12-08 12:02:29	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15'\nWHERE "id_atencion" IS NULL
170	12	2019-12-08 12:03:42	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15'\nWHERE "id_atencion" = '34'
171	12	2019-12-08 12:04:19	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15'\nWHERE "id_atencion" = '35'
172	12	2019-12-08 12:04:31	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15'\nWHERE "id_atencion" = '32'
173	8	2019-12-08 13:03:52	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
174	8	2019-12-08 13:50:49	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '13:50', 'K-2511', '8', '2019-12-08', '1', '4', NULL, NULL)
175	8	2019-12-08 13:54:48	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '13:54', 'E-5661', '8', '2019-12-08', '3', '7', '1', NULL)
176	8	2019-12-08 14:40:36	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
177	8	2019-12-08 21:59:24	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
178	12	2019-12-09 08:01:54	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
179	8	2019-12-09 08:02:06	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
180	8	2019-12-09 08:02:25	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '08:02', 'K-2511', '8', '2019-12-09', '1', '4', NULL, NULL)
181	12	2019-12-09 08:02:30	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:02'\nWHERE "id_atencion" = '38'
182	8	2019-12-09 08:04:06	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '08:04', 'K-2511', '8', '2019-12-09', '1', '10', NULL, NULL)
183	12	2019-12-09 08:04:24	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:04'\nWHERE "id_atencion" = '39'
184	8	2019-12-09 08:14:00	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '08:14', 'K-2511', '8', '2019-12-09', '1', '7', '1', NULL)
185	12	2019-12-09 08:18:43	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:18'\nWHERE "id_atencion" = '40'
186	8	2019-12-09 08:20:51	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '08:20', 'E-5661', '8', '2019-12-09', '1', '5', NULL, NULL)
187	8	2019-12-09 08:21:00	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '08:21', 'Z-9029', '8', '2019-12-09', '1', '14', NULL, NULL)
188	12	2019-12-09 08:21:10	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:21'\nWHERE "id_atencion" = '41'
189	12	2019-12-09 08:22:12	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:22'\nWHERE "id_atencion" = '42'
190	8	2019-12-09 08:24:03	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '08:24', 'K-2511', '8', '2019-12-09', '1', '6', NULL, NULL)
191	12	2019-12-09 08:27:11	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:27'\nWHERE "id_atencion" = '43'
193	8	2019-12-09 08:30:01	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '08:30', 'E-5661', '8', '2019-12-09', '1', '9', NULL, NULL)
194	12	2019-12-09 08:30:09	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:30'\nWHERE "id_atencion" = '44'
195	8	2019-12-09 08:35:44	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '08:35', 'K-2511', '8', '2019-12-09', '1', '7', NULL, NULL)
196	12	2019-12-09 08:35:51	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:35'\nWHERE "id_atencion" = '45'
197	8	2019-12-09 08:37:12	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '08:37', 'K-2511', '8', '2019-12-09', '1', '7', NULL, NULL)
198	8	2019-12-09 08:37:22	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '08:37', 'E-5661', '8', '2019-12-09', '1', '6', NULL, NULL)
199	12	2019-12-09 08:37:28	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:37'\nWHERE "id_atencion" = '46'
200	12	2019-12-09 08:41:02	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '08:41'\nWHERE "id_atencion" = '47'
201	8	2019-12-09 10:28:37	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '10:28', 'K-2511', '8', '2019-12-09', '1', '5', NULL, NULL)
202	12	2019-12-09 10:30:38	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
203	12	2019-12-09 10:31:00	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '10:31'\nWHERE "id_atencion" = '48'
204	8	2019-12-09 10:34:52	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '10:34', 'K-2511', '8', '2019-12-09', '1', '5', NULL, NULL)
205	12	2019-12-09 10:36:28	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '10:36'\nWHERE "id_atencion" = '49'
206	8	2019-12-09 10:40:57	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '10:40', 'E-5661', '8', '2019-12-09', '1', '6', NULL, NULL)
207	12	2019-12-09 10:43:42	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '10:43'\nWHERE "id_atencion" = '50'
208	8	2019-12-09 10:44:31	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '10:44', 'K-2511', '8', '2019-12-09', '1', '5', NULL, NULL)
209	12	2019-12-09 10:44:43	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '10:44'\nWHERE "id_atencion" = '51'
210	8	2019-12-09 11:41:46	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
211	8	2019-12-09 11:42:51	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('19226092', 'ericso', 'ericsonvelascos@gmail.com', '232423', '8', '2019-12-09', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES (27, '0', '11:42', 'E-6092', '8', '2019-12-09', '2', '16', NULL, '1')
212	8	2019-12-09 13:01:20	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '13:01', 'E-5661', '8', '2019-12-09', '3', '5', NULL, NULL)
213	12	2019-12-09 13:01:36	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
214	12	2019-12-09 13:02:04	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_servicios"."id_servicio" = '1'\nAND "t_atencion"."estatus" = '4'
215	8	2019-12-09 13:02:15	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '13:02', 'Z-9029', '8', '2019-12-09', '1', '6', NULL, NULL)
216	12	2019-12-09 13:02:18	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_servicios"."id_servicio" = '1'\nAND "t_atencion"."estatus" = '4'
217	12	2019-12-09 13:02:19	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '13:02'\nWHERE "id_atencion" = '54'
218	8	2019-12-11 09:17:21	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
219	8	2019-12-11 09:35:21	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_servicios"."id_servicio" IS NULL\nAND "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
220	8	2019-12-11 09:45:13	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_servicios"."id_servicio" IS NULL\nAND "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
221	8	2019-12-11 09:48:31	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '09:48', 'K-2511', '8', '2019-12-11', '2', '4', '1', NULL)
222	8	2019-12-11 09:48:45	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
223	8	2019-12-11 09:48:45	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '09:48'\nWHERE "id_atencion" = '55'
224	8	2019-12-11 09:51:30	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
225	8	2019-12-11 09:51:30	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '09:51'\nWHERE "id_atencion" = '55'
226	8	2019-12-11 09:52:37	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
227	8	2019-12-11 09:52:37	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '09:52'\nWHERE "id_atencion" = '55'
228	8	2019-12-11 10:03:10	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_servicios"."id_servicio" IS NULL\nAND "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
229	8	2019-12-11 10:03:22	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
230	8	2019-12-11 10:03:22	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '10:03'\nWHERE "id_atencion" = '55'
231	8	2019-12-11 10:03:32	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'esto es una prueba', "hora_recepcion" = '10:03', "estatus" = '6'\nWHERE "id_atencion" = '55'
232	8	2019-12-11 10:48:19	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
233	8	2019-12-11 10:48:26	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
234	8	2019-12-11 10:48:29	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
235	8	2019-12-11 11:05:20	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
236	8	2019-12-11 11:05:31	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '11:05', 'K-2511', '8', '2019-12-11', '3', '5', NULL, NULL)
237	8	2019-12-11 11:05:41	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '11:05', 'E-5661', '8', '2019-12-11', '3', '4', NULL, NULL)
238	8	2019-12-11 11:05:49	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '11:05', 'Z-9029', '8', '2019-12-11', '3', '5', NULL, NULL)
239	8	2019-12-11 11:06:04	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('24', '0', '11:06', 'K-3123', '8', '2019-12-11', '3', '6', NULL, NULL)
240	8	2019-12-11 11:06:20	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('23', '0', '11:06', 'J-1381', '8', '2019-12-11', '3', '10', NULL, NULL)
241	8	2019-12-11 11:16:16	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('14953533', 'Kelly', 'jmorales@live.com', '04127255879', '8', '2019-12-11', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES (28, '0', '11:16', 'K-3533', '8', '2019-12-11', '1', '5', NULL, NULL)
242	8	2019-12-11 12:28:44	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
243	8	2019-12-11 13:44:09	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
244	8	2019-12-11 14:34:49	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_servicios"."id_servicio" IS NULL\nAND "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
245	8	2019-12-11 14:35:00	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
246	8	2019-12-11 14:35:00	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '14:35'\nWHERE "id_atencion" = '56'
247	8	2019-12-11 14:42:31	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
248	8	2019-12-11 14:42:31	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '14:42'\nWHERE "id_atencion" = '57'
249	8	2019-12-11 14:55:11	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
250	8	2019-12-11 14:55:11	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '14:55'\nWHERE "id_atencion" = '58'
251	8	2019-12-11 14:55:12	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
252	8	2019-12-11 14:55:12	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '14:55'\nWHERE "id_atencion" = '59'
253	8	2019-12-11 14:56:13	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'hjkl', "hora_atc_f" = '14:56', "estatus" = '6'\nWHERE "id_atencion" = '59'
254	8	2019-12-11 14:56:17	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'hjkl', "hora_atc_f" = '14:56', "estatus" = '6'\nWHERE "id_atencion" = '59'
255	8	2019-12-11 15:55:48	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '15:55', 'K-2511', '8', '2019-12-11', '1', '5', NULL, NULL)
256	8	2019-12-11 15:56:07	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
257	8	2019-12-11 15:56:07	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '15:56'\nWHERE "id_atencion" = '60'
258	8	2019-12-11 15:57:05	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'bdzgfb', "hora_atc_f" = '15:57', "estatus" = '6'\nWHERE "id_atencion" = '60'
259	8	2019-12-11 15:58:51	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
260	8	2019-12-11 15:58:51	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '15:58'\nWHERE "id_atencion" = '61'
261	8	2019-12-11 16:00:24	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'kjhkjhj', "hora_atc_f" = '16:00', "estatus" = '6'\nWHERE "id_atencion" = '61'
262	8	2019-12-11 16:02:20	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
263	8	2019-12-11 16:02:20	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '16:02'\nWHERE "id_atencion" = '62'
264	8	2019-12-11 16:10:45	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
265	8	2019-12-12 08:08:35	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
266	8	2019-12-12 15:34:34	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
267	8	2019-12-16 09:24:51	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
268	8	2019-12-16 10:40:10	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
269	8	2019-12-16 10:44:11	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
270	8	2019-12-16 10:50:09	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
271	8	2019-12-16 10:50:21	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '10:50', 'K-2511', '8', '2019-12-16', '1', '5', NULL, NULL)
272	8	2019-12-16 10:50:33	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
273	8	2019-12-16 10:50:33	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '10:50'\nWHERE "id_atencion" = '63'
274	8	2019-12-16 10:51:28	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '10:51', "estatus" = '6'\nWHERE "id_atencion" = '63'
275	8	2019-12-16 11:09:38	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
276	8	2019-12-16 11:34:37	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '11:34', 'E-5661', '8', '2019-12-16', '3', '21', NULL, NULL)
277	8	2019-12-16 11:35:34	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
278	8	2019-12-16 11:35:34	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '11:35'\nWHERE "id_atencion" = '64'
279	8	2019-12-16 11:36:48	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '11:36', 'K-2511', '8', '2019-12-16', '3', '21', NULL, NULL)
280	8	2019-12-16 11:36:54	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '11:36', "estatus" = '6'\nWHERE "id_atencion" = '64'
281	8	2019-12-16 11:37:42	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
282	8	2019-12-16 11:37:42	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '11:37'\nWHERE "id_atencion" = '65'
283	8	2019-12-16 11:39:57	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '11:39', "estatus" = '6'\nWHERE "id_atencion" = '65'
284	8	2019-12-16 11:40:50	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '11:40', 'K-2511', '8', '2019-12-16', '2', '20', NULL, NULL)
285	8	2019-12-16 11:41:04	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '11:41', 'E-5661', '8', '2019-12-16', '3', '19', NULL, NULL)
286	8	2019-12-16 11:41:23	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '11:41', 'Z-9029', '8', '2019-12-16', '2', '17', NULL, NULL)
287	8	2019-12-16 11:41:37	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('28', '0', '11:41', 'K-3533', '8', '2019-12-16', '3', '18', NULL, NULL)
288	12	2019-12-16 11:42:19	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
289	12	2019-12-16 11:42:34	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
290	12	2019-12-16 11:42:34	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '11:42'\nWHERE "id_atencion" = '66'
291	8	2019-12-16 11:42:38	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
292	8	2019-12-16 11:42:38	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '11:42'\nWHERE "id_atencion" = '67'
293	8	2019-12-16 11:43:34	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '11:43', "estatus" = '6'\nWHERE "id_atencion" = '67'
294	12	2019-12-16 11:43:37	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '11:43', "estatus" = '6'\nWHERE "id_atencion" = '66'
295	12	2019-12-16 11:44:22	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
296	12	2019-12-16 11:44:22	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '11:44'\nWHERE "id_atencion" = '68'
297	12	2019-12-16 11:46:28	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '11:46', "estatus" = '6'\nWHERE "id_atencion" = '68'
298	12	2019-12-16 11:46:56	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
299	12	2019-12-16 11:46:56	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '11:46'\nWHERE "id_atencion" = '69'
300	12	2019-12-16 11:47:08	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '11:47', "estatus" = '7'\nWHERE "id_atencion" = '69'
301	8	2019-12-16 14:45:31	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
302	8	2019-12-16 14:46:04	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '14:46', 'K-2511', '8', '2019-12-16', '2', '19', NULL, NULL)
303	8	2019-12-16 14:46:16	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '14:46', 'Z-9029', '8', '2019-12-16', '2', '17', NULL, NULL)
304	8	2019-12-16 14:46:30	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '14:46', 'E-5661', '8', '2019-12-16', '3', '17', NULL, NULL)
305	8	2019-12-16 14:46:58	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('23', '0', '14:46', 'J-1381', '8', '2019-12-16', '2', '22', NULL, NULL)
306	8	2019-12-16 14:48:04	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('25', '0', '14:48', 'A-7695', '8', '2019-12-16', '3', '20', NULL, NULL)
307	8	2019-12-16 14:48:22	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('24', '0', '14:48', 'K-3123', '8', '2019-12-16', '2', '19', NULL, NULL)
308	8	2019-12-16 14:48:49	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('26', '0', '14:48', 'P-5432', '8', '2019-12-16', '2', '17', NULL, NULL)
309	8	2019-12-16 14:49:05	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('27', '0', '14:49', 'E-6092', '8', '2019-12-16', '3', '20', NULL, NULL)
310	8	2019-12-16 14:49:15	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
311	8	2019-12-16 14:49:15	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '14:49'\nWHERE "id_atencion" = '70'
312	8	2019-12-16 15:05:30	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '15:05', "estatus" = '7'\nWHERE "id_atencion" = '70'
313	8	2019-12-16 15:05:34	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
314	8	2019-12-16 15:05:34	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "hora_atc_i" = '15:05'\nWHERE "id_atencion" = '71'
315	12	2019-12-16 15:06:25	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
316	12	2019-12-16 15:06:35	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
317	12	2019-12-16 15:06:36	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '15:06'\nWHERE "id_atencion" = '72'
318	12	2019-12-16 15:07:57	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '15:07', "estatus" = '7'\nWHERE "id_atencion" = '72'
319	12	2019-12-16 15:08:01	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
320	12	2019-12-16 15:08:01	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '15:08'\nWHERE "id_atencion" = '73'
321	12	2019-12-16 15:09:10	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '15:09', "estatus" = '7'\nWHERE "id_atencion" = '73'
322	12	2019-12-16 15:09:14	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
323	12	2019-12-16 15:09:14	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "hora_atc_i" = '15:09'\nWHERE "id_atencion" = '74'
324	12	2019-12-16 15:10:28	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '15:10', "estatus" = '6'\nWHERE "id_atencion" = '74'
325	8	2019-12-17 22:23:23	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
326	8	2019-12-18 10:32:37	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
327	8	2019-12-18 10:33:03	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '10:33', 'K-2511', '8', '2019-12-18', '2', '5', NULL, NULL)
328	8	2019-12-18 10:33:13	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('21', '0', '10:33', 'E-5661', '8', '2019-12-18', '3', '10', NULL, NULL)
329	8	2019-12-18 10:33:24	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('28', '0', '10:33', 'K-3533', '8', '2019-12-18', '3', '7', NULL, NULL)
330	8	2019-12-18 10:33:37	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('23', '0', '10:33', 'J-1381', '8', '2019-12-18', '3', '11', NULL, NULL)
331	8	2019-12-18 10:33:57	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '10:33', 'Z-9029', '8', '2019-12-18', '1', '12', NULL, NULL)
332	8	2019-12-18 10:34:07	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('24', '0', '10:34', 'K-3123', '8', '2019-12-18', '3', '18', NULL, NULL)
333	12	2019-12-18 10:35:08	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
334	12	2019-12-18 10:35:17	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
335	12	2019-12-18 10:35:17	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '10:35'\nWHERE "id_atencion" = '78'
336	12	2019-12-18 10:37:56	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'Hola esto es una prueba', "hora_atc_f" = '10:37', "estatus" = '6'\nWHERE "id_atencion" = '78'
337	12	2019-12-18 10:38:02	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
338	12	2019-12-18 10:38:02	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '10:38'\nWHERE "id_atencion" = '79'
339	12	2019-12-18 10:41:47	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'holaaaaaaaaaaaaaaaa enfermera', "hora_atc_f" = '10:41', "estatus" = '6'\nWHERE "id_atencion" = '79'
340	12	2019-12-18 10:44:19	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
341	12	2019-12-18 10:44:19	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '10:44'\nWHERE "id_atencion" = '80'
342	12	2019-12-18 10:44:26	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'no se presento', "hora_atc_f" = '10:44', "estatus" = '7'\nWHERE "id_atencion" = '80'
343	12	2019-12-18 10:44:45	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
344	12	2019-12-18 10:44:45	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '10:44'\nWHERE "id_atencion" = '81'
345	12	2019-12-18 10:49:13	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'ryhurs ytrgf htyue6 y7uhdt5uj 5edyu7 ', "hora_atc_f" = '10:49', "estatus" = '6'\nWHERE "id_atencion" = '81'
346	12	2019-12-18 10:50:35	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
347	12	2019-12-18 10:50:35	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '10:50'\nWHERE "id_atencion" = '82'
348	12	2019-12-18 10:51:28	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'qazxswedc vfrtgb bgtyhn mjuik, .lom ', "hora_atc_f" = '10:51', "estatus" = '6'\nWHERE "id_atencion" = '82'
349	12	2019-12-18 10:51:33	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
350	12	2019-12-18 10:51:33	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '10:51'\nWHERE "id_atencion" = '83'
351	12	2019-12-18 10:53:07	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '10:53', "estatus" = '6'\nWHERE "id_atencion" = '83'
352	12	2019-12-18 10:53:13	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
353	8	2019-12-18 13:20:52	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
354	8	2019-12-18 13:21:27	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('27607695', 'Eduardo', 'jmorales@live.com', '04142508158', '8', '2019-12-18', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES (29, '0', '13:21', 'E-7695', '8', '2019-12-18', '1', '3', NULL, NULL)
355	8	2019-12-18 13:21:45	Creación de ticket	INSERT INTO "public"."t_clientes" ("cedula", "nombre_completo", "correo", "telefono", "id_usuario", "fecha_registro", "estatus") VALUES ('141414', 'katherine Lezama', 'q@q.com', '04142508158', '8', '2019-12-18', '0'); INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES (30, '0', '13:21', 'K-1414', '8', '2019-12-18', '2', '3', NULL, NULL)
356	12	2019-12-18 13:22:04	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
357	12	2019-12-18 13:22:16	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
358	12	2019-12-18 13:22:16	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '13:22'\nWHERE "id_atencion" = '84'
359	12	2019-12-18 13:23:31	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'mklmklmkl mkl mkl mkl mkl mkl oht vfg bhjn bhgv cdfb nkjb hb bbbbbv bvjhvb b vb vb b hvb h b hbvghvb ghvb n bnvnb vggbvgv hgvg bjb hgvggb ghvg bgvb bvjh ghvjhb  gvbjgvgb gvjbvgvhbbb gvhbvjgvv gvbvjgvh fgc       vc f', "hora_atc_f" = '13:23', "estatus" = '6'\nWHERE "id_atencion" = '84'
360	12	2019-12-18 13:23:37	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
361	12	2019-12-18 13:23:37	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '13:23'\nWHERE "id_atencion" = '85'
362	12	2019-12-18 13:24:47	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = 'qwe rtyu iopas df ghj klzx cvbnm mko lpokj ijnbhu gfgfd gfvhtfdds gfdsfffff fg fthv tgvf tf ffgghf gjfv gv fvfgvvyff  gfv f vvtv tuf ft vut fgvufv fv v gv gv gvgv gv gvgvgvvgvvgvgvg gv gv gv gv gv gv gvtyfgt ftgyfv  tygfv tyg vigtyfv gty gtbyfv tygfv igtfv gtfv gt             gt', "hora_atc_f" = '13:24', "estatus" = '6'\nWHERE "id_atencion" = '85'
363	8	2019-12-19 09:55:13	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
364	8	2019-12-19 13:22:56	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '13:22', 'K-2511', '8', '2019-12-19', '2', '23', NULL, NULL)
365	8	2019-12-19 13:24:50	Creación de ticket otros canales	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces", "observacion", "hora_atc_f", "estatus") VALUES ('21', '0', '13:24', 'E-5661', '8', '2019-12-19', '3', '20', NULL, NULL, 'fhyjdyrhj', '13:24', '6')
366	8	2019-12-19 13:28:10	Creación de ticket otros canales	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces", "observacion", "hora_atc_f", "estatus") VALUES ('22', '0', '13:27', 'Z-9029', '8', '2019-12-19', '3', '19', NULL, NULL, 'wqaedwqdqsede', '13:28', '6')
367	8	2019-12-19 13:48:56	Creación de ticket otros canales	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces", "id_canal", "observacion", "hora_atc_f", "hora_atc_i", "estatus") VALUES ('24', '0', '13:48', 'K-3123', '8', '2019-12-19', '2', '20', NULL, NULL, '4', 'kjgjhgvjfghf', '13:48', '13:48', '6')
368	8	2019-12-20 08:37:51	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
369	8	2019-12-20 08:37:57	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
370	8	2019-12-20 08:38:08	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
371	8	2019-12-20 08:44:51	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
372	8	2019-12-23 12:41:27	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
373	8	2019-12-25 15:00:53	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
374	8	2019-12-25 15:01:30	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '15:01', 'K-2511', '8', '2019-12-25', '2', '21', NULL, NULL)
406	8	2019-12-25 15:06:43	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
407	8	2019-12-25 15:10:42	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
408	8	2019-12-25 15:10:58	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('24', '0', '15:10', 'K-3123', '8', '2019-12-25', '3', '21', NULL, NULL)
409	8	2019-12-25 15:11:14	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('22', '0', '15:11', 'Z-9029', '8', '2019-12-25', '2', '21', NULL, NULL)
410	8	2019-12-25 15:17:45	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
411	12	2019-12-25 15:18:15	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'punto'\nAND "t_usuarios"."clave" = 'dbf8386ad34c7bac0e3f5f712756bfae'\nAND "t_usuarios"."estatus" = '0'
412	12	2019-12-25 15:18:31	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
413	12	2019-12-25 15:18:31	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = '15', "id_analista" = '12', "hora_atc_i" = '15:18'\nWHERE "id_atencion" = '90'
414	8	2019-12-25 15:19:04	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
415	8	2019-12-25 15:19:05	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "id_analista" = '8', "hora_atc_i" = '15:19'\nWHERE "id_atencion" = '123'
416	8	2019-12-25 15:30:05	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
417	8	2019-12-25 15:30:31	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
418	8	2019-12-25 15:30:31	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "id_analista" = '8', "hora_atc_i" = '15:30'\nWHERE "id_atencion" = '124'
419	8	2019-12-25 15:49:26	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
420	8	2019-12-25 21:45:57	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
421	8	2019-12-26 00:36:39	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
422	\N	2019-12-26 02:56:36	Perfil de Usuario	SELECT LASTVAL() AS ins_id
423	\N	2019-12-26 03:01:02	Perfil de Usuario	SELECT LASTVAL() AS ins_id
424	\N	2019-12-26 03:05:28	Perfil de Usuario	SELECT LASTVAL() AS ins_id
425	\N	2019-12-26 03:09:29	Creación de Usuario	INSERT INTO "public"."t_usuarios" ("cedula", "id_rol", "nombre_completo", "correo", "telefono", "username", "clave", "id_usuario", "fecha_registro", "estatus") VALUES ('1', '8', ' ', 'katy@live.com', '111111', 'u', '7b774effe4a349c6dd82ad4f4f21d34c', NULL, '2019-12-26', '0')
426	13	2019-12-26 03:09:45	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'u'\nAND "t_usuarios"."clave" = '7b774effe4a349c6dd82ad4f4f21d34c'\nAND "t_usuarios"."estatus" = '0'
427	8	2019-12-26 06:38:38	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
428	8	2019-12-26 13:37:25	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
429	8	2019-12-26 13:45:13	Creación de punto de atención	INSERT INTO "public"."t_ptos_atc" ("nombre", "id_analista", "id_usuario", "fecha_registro", "estatus", "id_servicio", "id_pref", "id_ces") VALUES ('Front 1', '6', '8', '2019-12-26', '0', '2', NULL, NULL)
430	8	2019-12-26 13:47:52	Creación de ticket	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces") VALUES ('20', '0', '13:47', 'K-2511', '8', '2019-12-26', '3', '9', NULL, NULL)
431	8	2019-12-26 13:48:26	Llamando cliente	SELECT "id_atencion", "nombre_completo", "telefono", "correo", "cedula", "t_servicios"."nombre", "motivo"\nFROM "public"."t_atencion"\nLEFT JOIN "t_clientes" ON "t_clientes"."id_cliente" = "t_atencion"."id_cliente"\nLEFT JOIN "t_servicios" ON "t_servicios"."id_servicio" = "t_atencion"."id_servicio"\nLEFT JOIN "t_motivos" ON "t_motivos"."id_motivo" = "t_atencion"."id_motivo"\nWHERE "t_atencion"."estatus" = '4'\nORDER BY "id_ces" ASC, "id_pref" ASC, "hora_recepcion" ASC
432	8	2019-12-26 13:48:26	Llamando cliente	UPDATE "public"."t_atencion" SET "estatus" = '5', "id_pto" = NULL, "id_analista" = '8', "hora_atc_i" = '13:48'\nWHERE "id_atencion" = '125'
433	8	2019-12-26 13:50:29	Creación de ticket	UPDATE "public"."t_atencion" SET "observacion" = '', "hora_atc_f" = '13:50', "estatus" = '6'\nWHERE "id_atencion" = '125'
434	8	2019-12-26 13:51:48	Creación de ticket otros canales	; INSERT INTO "public"."t_atencion" ("id_cliente", "id_pto", "hora_recepcion", "tiket", "id_usuario", "fecha_registro", "id_servicio", "id_motivo", "id_pref", "id_ces", "id_canal", "observacion", "hora_atc_f", "hora_atc_i", "estatus") VALUES ('24', '0', '13:51', 'K-3123', '8', '2019-12-26', '3', '19', NULL, NULL, '5', '', '13:51', '13:51', '6')
435	8	2020-01-07 21:26:47	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
436	8	2020-01-07 22:30:16	Perfil de Usuario	SELECT LASTVAL() AS ins_id
437	8	2020-01-08 05:30:34	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
438	8	2020-01-08 05:55:22	Inicio de sesión	SELECT "id_user", "id_rol", "nombre_completo", "correo", "telefono", "username", "cedula", "id_servicio", "id_pref", "id_ces", "id_pto"\nFROM "public"."t_usuarios"\nLEFT JOIN "t_ptos_atc" ON "t_ptos_atc"."id_analista" = "t_usuarios"."id_user"\nWHERE "t_usuarios"."username" = 'admin'\nAND "t_usuarios"."clave" = 'e10adc3949ba59abbe56e057f20f883e'\nAND "t_usuarios"."estatus" = '0'
\.


--
-- TOC entry 3050 (class 0 OID 24585)
-- Dependencies: 198
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
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
20	7	3
21	8	3
22	8	4
23	8	6
24	8	8
25	8	9
26	8	10
27	8	14
28	8	15
29	8	16
30	9	3
31	9	4
32	9	6
33	9	8
34	9	9
35	9	10
\.


--
-- TOC entry 3051 (class 0 OID 24588)
-- Dependencies: 199
-- Data for Name: solicitudes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitudes (id_solicitud, id_cliente, id_usuario, id_pto, id_estatus, id_tcliente, num_atc, tiempo, fecha_registro, ult_mod) FROM stdin;
\.


--
-- TOC entry 3053 (class 0 OID 24593)
-- Dependencies: 201
-- Data for Name: t_atencion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_atencion (id_atencion, tiket, id_cliente, id_pto, hora_recepcion, hora_atc_i, hora_atc_f, id_usuario, fecha_registro, estatus, id_servicio, id_motivo, id_pref, id_ces, observacion, id_canal, id_analista) FROM stdin;
78	K-2511	20	15	10:33	10:35	10:37	8	2019-12-18 00:00:00	6	2	5	\N	\N	Hola esto es una prueba	0	12
79	E-5661	21	15	10:33	10:38	10:41	8	2019-12-18 00:00:00	6	3	10	\N	\N	holaaaaaaaaaaaaaaaa enfermera	0	12
80	K-3533	28	15	10:33	10:44	10:44	8	2019-12-18 00:00:00	7	3	7	\N	\N	no se presento	0	12
81	J-1381	23	15	10:33	10:44	10:49	8	2019-12-18 00:00:00	6	3	11	\N	\N	ryhurs ytrgf htyue6 y7uhdt5uj 5edyu7 	0	12
82	Z-9029	22	15	10:33	10:50	10:51	8	2019-12-18 00:00:00	6	1	12	\N	\N	qazxswedc vfrtgb bgtyhn mjuik, .lom 	0	12
83	K-3123	24	15	10:34	10:51	10:53	8	2019-12-18 00:00:00	6	3	18	\N	\N		0	12
84	E-7695	29	15	13:21	13:22	13:23	8	2019-12-18 00:00:00	6	1	3	\N	\N	mklmklmkl mkl mkl mkl mkl mkl oht vfg bhjn bhgv cdfb nkjb hb bbbbbv bvjhvb b vb vb b hvb h b hbvghvb ghvb n bnvnb vggbvgv hgvg bjb hgvggb ghvg bgvb bvjh ghvjhb  gvbjgvgb gvjbvgvhbbb gvhbvjgvv gvbvjgvh fgc       vc f	0	12
85	K-1414	30	15	13:21	13:23	13:24	8	2019-12-18 00:00:00	6	2	3	\N	\N	qwe rtyu iopas df ghj klzx cvbnm mko lpokj ijnbhu gfgfd gfvhtfdds gfdsfffff fg fthv tgvf tf ffgghf gjfv gv fvfgvvyff  gfv f vvtv tuf ft vut fgvufv fv v gv gv gvgv gv gvgvgvvgvvgvgvg gv gv gv gv gv gv gvtyfgt ftgyfv  tygfv tyg vigtyfv gty gtbyfv tygfv igtfv gtfv gt             gt	0	12
87	E-5661	21	15	13:23	13:23	13:24	8	2019-12-19 00:00:00	6	3	20	\N	\N	fhyjdyrhj	4	12
88	Z-9029	22	15	13:27	13:27	13:28	8	2019-12-19 00:00:00	6	3	19	\N	\N	wqaedwqdqsede	4	12
89	K-3123	24	15	13:48	13:48	13:48	8	2019-12-19 00:00:00	6	2	20	\N	\N	kjgjhgvjfghf	4	12
90	K-2511	20	15	15:01	15:18	\N	8	2019-12-25 00:00:00	8	2	21	\N	\N	\N	0	12
123	K-3123	24	\N	15:10	15:19	\N	8	2019-12-25 00:00:00	8	3	21	\N	\N	\N	0	8
124	Z-9029	22	\N	15:11	15:30	\N	8	2019-12-25 00:00:00	8	2	21	\N	\N	\N	0	8
125	K-2511	20	\N	13:47	13:48	13:50	8	2019-12-26 00:00:00	6	3	9	\N	\N		0	8
126	K-3123	24	0	13:51	13:51	13:51	8	2019-12-26 00:00:00	6	3	19	\N	\N		5	\N
\.


--
-- TOC entry 3055 (class 0 OID 24603)
-- Dependencies: 203
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
-- TOC entry 3057 (class 0 OID 24609)
-- Dependencies: 205
-- Data for Name: t_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_clientes (id_cliente, cedula, nombre_completo, correo, telefono, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
20	21072511	katherine Lezama	kathylezama@live.com	04127255879	8	2019-12-05 00:00:00	\N	0
21	5535661	Eduardo	jmorales@live.com	04142508158	8	2019-12-05 00:00:00	\N	0
22	10489029	Zulma	jmorales@live.com	04142508158	8	2019-12-05 00:00:00	\N	0
23	10381381	Jose Morales	jmorales@live.com	04142508158	8	2019-12-05 00:00:00	\N	0
24	123123	Kelly	jmorales@live.com	04142508158	8	2019-12-05 00:00:00	\N	0
25	27067695	Ana Lezama	jmorales@live.com	04142508158	8	2019-12-07 00:00:00	\N	0
26	98765432	Prueba	kathylezama@live.com	04127255879	8	2019-12-08 00:00:00	\N	0
27	19226092	ericso	ericsonvelascos@gmail.com	232423	8	2019-12-09 00:00:00	\N	0
28	14953533	Kelly	jmorales@live.com	04127255879	8	2019-12-11 00:00:00	\N	0
29	27607695	Eduardo	jmorales@live.com	04142508158	8	2019-12-18 00:00:00	\N	0
30	141414	katherine Lezama	q@q.com	04142508158	8	2019-12-18 00:00:00	\N	0
\.


--
-- TOC entry 3059 (class 0 OID 24615)
-- Dependencies: 207
-- Data for Name: t_estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_estatus (id_estatus, estatus, id_usuario, fecha_registro, ult_mod) FROM stdin;
0	Activo	\N	\N	\N
1	Inactivo	\N	\N	\N
2	Bloqueado	\N	\N	\N
4	En espera	\N	\N	\N
5	Llamado	\N	\N	\N
6	Atendido	\N	\N	\N
7	No atendido	\N	\N	\N
8	Atendiendo	\N	\N	\N
\.


--
-- TOC entry 3061 (class 0 OID 24620)
-- Dependencies: 209
-- Data for Name: t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_menu (id_menu, id_padre, item, icono, orden, ruta, hijos) FROM stdin;
2	1	Crear Usuario	\N	1	index.php/usuarios/	0
4	3	Motivo de la visita	\N	1	index.php/motivos	0
1	0	Usuarios	\N	2	#	1
3	0	Configuración	\N	1	#	1
6	3	Canales de atención	\N	2	index.php/canales	0
8	3	Atención preferencial	\N	4	index.php/preferencial	0
9	3	Servicios	\N	5	index.php/servicios	0
10	3	Puntos de atención	\N	6	index.php/puntos	0
12	0	Atención	\N	4	index.php/atencion	0
11	0	Recepción	\N	3	index.php/recepcion	0
13	0	Monitor	\N	5	index.php/recepcion/monitor	0
14	0	Reportes	\N	6	#	1
15	14	Front Office	\N	1	index.php/reportes/v_ensitio	0
17	0	Otros Canales	\N	4	index.php/atencion_	0
16	14	Back Office	\N	2	index.php/reportes/v_otroscanales	0
5	1	Perfiles	\N	2	index.php/usuarios/perfiles	0
\.


--
-- TOC entry 3062 (class 0 OID 24625)
-- Dependencies: 210
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
-- TOC entry 3064 (class 0 OID 24631)
-- Dependencies: 212
-- Data for Name: t_pto_pref; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_pto_pref (id_pto_pre, id_pto, id_pre) FROM stdin;
\.


--
-- TOC entry 3066 (class 0 OID 24636)
-- Dependencies: 214
-- Data for Name: t_pto_serv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_pto_serv (id_pto_serv, id_pto, id_servicio) FROM stdin;
\.


--
-- TOC entry 3068 (class 0 OID 24641)
-- Dependencies: 216
-- Data for Name: t_ptos_atc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_ptos_atc (id_pto, id_analista, nombre, id_usuario, fecha_registro, ult_mod, estatus, id_servicio, id_pref, id_ces) FROM stdin;
13	10	Taquilla 1	8	2019-12-04 00:00:00	\N	0	3	1	\N
14	11	Oficina I	8	2019-12-05 00:00:00	\N	0	3	1	\N
15	12	Taquilla 4	8	2019-12-08 00:00:00	\N	0	1	\N	\N
16	6	Front 1	8	2019-12-26 00:00:00	\N	0	2	\N	\N
\.


--
-- TOC entry 3070 (class 0 OID 24647)
-- Dependencies: 218
-- Data for Name: t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_roles (id_rol, rol, observacion, id_usuario, fecha_registro, ult_mod, estatus_rol) FROM stdin;
1	Administrador	\N	\N	\N	\N	0
2	Recepcionista	\N	\N	\N	\N	0
3	Punto de atencion	\N	\N	\N	\N	0
\.


--
-- TOC entry 3072 (class 0 OID 24653)
-- Dependencies: 220
-- Data for Name: t_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_servicios (id_servicio, nombre, id_usuario, fecha_registro, ult_mod, estatus) FROM stdin;
2	Poliza Funeraria	\N	\N	\N	0
3	RCV	\N	\N	\N	0
1	Poliza de vida	\N	\N	\N	0
4	prueba..	8	2019-11-19 00:00:00	2019-11-19	1
\.


--
-- TOC entry 3074 (class 0 OID 24659)
-- Dependencies: 222
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
-- TOC entry 3076 (class 0 OID 24665)
-- Dependencies: 224
-- Data for Name: t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_usuarios (id_user, id_rol, nombre_completo, correo, telefono, username, clave, id_usuario, fecha_registro, ult_mod, estatus, cedula) FROM stdin;
12	3	Prueb Punto	kathylezama@live.com	04127255879	punto	dbf8386ad34c7bac0e3f5f712756bfae	8	2019-12-08 00:00:00	\N	0	987654
10	3	Parra Kelly	kellyp@gmial.com	04127255879	kelly	e10adc3949ba59abbe56e057f20f883e	8	2019-12-03 00:00:00	2019-12-03	0	14953533
8	1	Lezama Katherine	klezama@grupobinar.com	04127255789	admin	e10adc3949ba59abbe56e057f20f883e	0	2019-11-16 00:00:00	2019-11-16	0	21072511
3	2	Parejo Eduardo	eparejo@gmail.com	04127255879	eduardo	123456	0	2019-11-14 00:00:00	2019-11-15	0	5535661
9	1	Velasco Ericson	ericsonvelascos@gmail.com	04242661784	ericsoncy	827ccb0eea8a706c4c34a16891f84e7b	8	2019-11-19 00:00:00	2019-11-19	0	19226092
11	3	Morales Jose	jmorales@live.com	04127255879	manito	e10adc3949ba59abbe56e057f20f883e	8	2019-12-03 00:00:00	\N	0	10381381
6	3	Parra Zulma	zparra@gmail.com	04142508158	zparra	123456	0	2019-11-14 00:00:00	\N	0	10489029
13	8	 	katy@live.com	111111	u	7b774effe4a349c6dd82ad4f4f21d34c	\N	2019-12-26 00:00:00	\N	0	1
\.


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 197
-- Name: logs_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_log_seq', 438, true);


--
-- TOC entry 3099 (class 0 OID 0)
-- Dependencies: 226
-- Name: seq_menu_rol; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_menu_rol', 35, true);


--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 200
-- Name: solicitudes_id_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_id_solicitud_seq', 1, false);


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 202
-- Name: t_atencion_id_atencion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_atencion_id_atencion_seq', 126, true);


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 204
-- Name: t_canales_id_canal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_canales_id_canal_seq', 8, true);


--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 206
-- Name: t_clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_clientes_id_cliente_seq', 30, true);


--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 208
-- Name: t_estatus_id_estatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_estatus_id_estatus_seq', 6, true);


--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 211
-- Name: t_motivos_id_motivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_motivos_id_motivo_seq', 28, true);


--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 213
-- Name: t_pto_pref_id_pto_pre_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_pto_pref_id_pto_pre_seq', 7, true);


--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 215
-- Name: t_pto_serv_id_pto_serv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_pto_serv_id_pto_serv_seq', 4, true);


--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 217
-- Name: t_ptos_atc_id_pto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_ptos_atc_id_pto_seq', 16, true);


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 219
-- Name: t_roles_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_roles_id_rol_seq', 9, true);


--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 221
-- Name: t_servicios_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_servicios_id_servicio_seq', 4, true);


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 223
-- Name: t_tclientes_id_tcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_tclientes_id_tcliente_seq', 5, true);


--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 225
-- Name: t_usuarios_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.t_usuarios_id_user_seq', 13, true);


--
-- TOC entry 2924 (class 2606 OID 24689)
-- Name: t_usuarios cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT cedula UNIQUE (cedula);


--
-- TOC entry 2900 (class 2606 OID 24691)
-- Name: t_atencion id_atencion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_atencion
    ADD CONSTRAINT id_atencion PRIMARY KEY (id_atencion);


--
-- TOC entry 2902 (class 2606 OID 24693)
-- Name: t_canales id_canal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_canales
    ADD CONSTRAINT id_canal PRIMARY KEY (id_canal);


--
-- TOC entry 2904 (class 2606 OID 24695)
-- Name: t_clientes id_clientev; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_clientes
    ADD CONSTRAINT id_clientev PRIMARY KEY (id_cliente);


--
-- TOC entry 2906 (class 2606 OID 24697)
-- Name: t_estatus id_estatus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_estatus
    ADD CONSTRAINT id_estatus PRIMARY KEY (id_estatus);


--
-- TOC entry 2894 (class 2606 OID 24699)
-- Name: logs id_log; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT id_log PRIMARY KEY (id_log);


--
-- TOC entry 2910 (class 2606 OID 24701)
-- Name: t_motivos id_motivo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_motivos
    ADD CONSTRAINT id_motivo PRIMARY KEY (id_motivo);


--
-- TOC entry 2916 (class 2606 OID 24703)
-- Name: t_ptos_atc id_pto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_ptos_atc
    ADD CONSTRAINT id_pto PRIMARY KEY (id_pto);


--
-- TOC entry 2912 (class 2606 OID 24705)
-- Name: t_pto_pref id_pto_pre; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_pref
    ADD CONSTRAINT id_pto_pre PRIMARY KEY (id_pto_pre);


--
-- TOC entry 2914 (class 2606 OID 24707)
-- Name: t_pto_serv id_pto_serv; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_pto_serv
    ADD CONSTRAINT id_pto_serv PRIMARY KEY (id_pto_serv);


--
-- TOC entry 2920 (class 2606 OID 24709)
-- Name: t_servicios id_servicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_servicios
    ADD CONSTRAINT id_servicio PRIMARY KEY (id_servicio);


--
-- TOC entry 2898 (class 2606 OID 24711)
-- Name: solicitudes id_solicitud; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes
    ADD CONSTRAINT id_solicitud PRIMARY KEY (id_solicitud);


--
-- TOC entry 2922 (class 2606 OID 24713)
-- Name: t_tclientes id_tclientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_tclientes
    ADD CONSTRAINT id_tclientes PRIMARY KEY (id_tcliente);


--
-- TOC entry 2908 (class 2606 OID 24715)
-- Name: t_menu pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- TOC entry 2896 (class 2606 OID 24717)
-- Name: menu_rol pk_mrol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT pk_mrol PRIMARY KEY (id_mrol);


--
-- TOC entry 2918 (class 2606 OID 24719)
-- Name: t_roles pk_rol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_roles
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);


--
-- TOC entry 2926 (class 2606 OID 24721)
-- Name: t_usuarios pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_usuarios
    ADD CONSTRAINT pk_user PRIMARY KEY (id_user);


-- Completed on 2020-01-08 08:28:58 -04

--
-- PostgreSQL database dump complete
--

