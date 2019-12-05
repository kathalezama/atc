CREATE TABLE public.table_banco
(
  id_banco bigserial NOT NULL,
  banco character varying(100),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_banco PRIMARY KEY (id_banco)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.table_banco
  OWNER TO postgres;

 --///////////////////////////////////////////////////////

 CREATE TABLE public.table_moneda
(
  id_moneda bigserial NOT NULL,
  moneda character varying(100),
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_moneda PRIMARY KEY (id_moneda)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.table_moneda
  OWNER TO postgres;

  --///////////////////////////////////////////////////////

 CREATE TABLE public.table_tipo_movimiento
(
  id_tmov bigserial NOT NULL,
  t_mov character varying(100),
  condicion integer,
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_tmov PRIMARY KEY (id_tmov)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.table_tipo_movimiento
  OWNER TO postgres;

  --///////////////////////////////////////////////////////

 CREATE TABLE public.table_cuentas
(
  id_cuenta bigserial NOT NULL,
  nombre character varying(100),
  saldo double precision,
  saldoi double precision,
  id_banco integer,
  id_moneda integer,
  id_usuario integer,
  fecha_registro timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_cuenta PRIMARY KEY (id_cuenta)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.table_cuentas
  OWNER TO postgres;

  --///////////////////////////////////////////////////////

 CREATE TABLE public.table_movimientos
(
  id_movimiento bigserial NOT NULL,
  monto double precision,
  tipo_movimiento integer,
  id_cuenta integer,
  concepto character varying(100),
  saldoi double precision,
  saldof double precision,
  id_usuario integer,
  fecha_registro timestamp without time zone,
  fecha timestamp without time zone,
  ult_mod date,
  estatus integer DEFAULT 0,
  CONSTRAINT id_movimiento PRIMARY KEY (id_movimiento)
)
WITH (
  OIDS=FALSE
);


ALTER TABLE public.table_movimientos
  OWNER TO postgres;