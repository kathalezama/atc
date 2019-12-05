CREATE TABLE public.t_menu
(
  id_menu bigint NOT NULL,
  id_padre integer DEFAULT 0,
  item character varying(50),
  icono character varying(50),
  orden integer,
  ruta character varying(200),
  hijos integer DEFAULT 0,
  CONSTRAINT pk_menu PRIMARY KEY (id_menu)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.t_menu
  OWNER TO postgres;

CREATE TABLE public.menu_rol
(
  id_mrol bigint NOT NULL,
  id_rol integer,
  id_menu integer,
  CONSTRAINT pk_mrol PRIMARY KEY (id_mrol)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.menu_rol
  OWNER TO postgres;

CREATE TABLE public.t_roles
(
  id_rol bigserial NOT NULL,
  rol character varying(40),
  observacion character varying(300),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod timestamp without time zone,
  estatus_rol integer DEFAULT 0,
  CONSTRAINT pk_rol PRIMARY KEY (id_rol)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.t_roles
  OWNER TO postgres;

CREATE TABLE public.t_usuarios
(
  id_user bigserial NOT NULL ,
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
  CONSTRAINT pk_user PRIMARY KEY (id_user)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.t_usuarios
  OWNER TO postgres;

CREATE TABLE public.t_ptos_atc
(
  id_pto bigserial NOT NULL,
  id_analista integer,
  nombre character varying(100),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_pto PRIMARY KEY (id_pto)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.t_ptos_atc
  OWNER TO postgres;

CREATE TABLE public.t_servicios
(
  id_servicio bigserial NOT NULL,
  nombre character varying(100),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_servicio PRIMARY KEY (id_servicio)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.t_servicios
  OWNER TO postgres;



CREATE TABLE public.t_estatus
(
  id_estatus bigserial NOT NULL,
  estatus character varying(100),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  CONSTRAINT id_estatus PRIMARY KEY (id_estatus)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.t_estatus
  OWNER TO postgres;

CREATE TABLE public.t_tclientes
(
  id_tcliente bigserial NOT NULL,
  tcliente character varying(100),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  CONSTRAINT id_tcliente PRIMARY KEY (id_tcliente)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.t_tclientes
  OWNER TO postgres;

CREATE TABLE public.t_pto_serv
(
  id_pto_serv bigserial NOT NULL,
  id_pto integer,
  id_servicio integer,
  CONSTRAINT id_pto_serv PRIMARY KEY (id_pto_serv)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.t_pto_serv
  OWNER TO postgres;


CREATE TABLE public.logs
(
  id_log bigserial NOT NULL,
  id_usuario integer,
  fecha_registro timestamp without time zone,
  actividad character varying(100),
  sentencia character varying(700),
  CONSTRAINT id_log PRIMARY KEY (id_log)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.logs
  OWNER TO postgres;

-- /////////////////////////////////////////////////////////////////////////


CREATE TABLE public.solicitudes
(
  id_solicitud bigserial NOT NULL,
  id_cliente integer,
  id_usuario integer,
  id_pto integer,
  id_estatus integer,
  id_tcliente integer,
  num_atc character varying(100),
  tiempo character varying(10),
  fecha_registro timestamp without time zone,
  ult_mod date,
  CONSTRAINT id_solicitud PRIMARY KEY (id_solicitud)
)
WITH (
  OIDS=FALSE
);

ALTER TABLE public.id_solicitud
  OWNER TO postgres;

CREATE TABLE public.t_clientes
(
  id_cliente bigserial NOT NULL ,
  cedula integer,
  nombre_completo character varying(100),
  correo character varying(40),
  telefono character varying(40),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_clientev PRIMARY KEY (id_cliente)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.t_clientes
  OWNER TO postgres;
