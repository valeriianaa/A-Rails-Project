--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acciones; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE acciones (
    id integer NOT NULL,
    nombre character varying,
    key_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE acciones OWNER TO ana;

--
-- Name: acciones_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE acciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acciones_id_seq OWNER TO ana;

--
-- Name: acciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE acciones_id_seq OWNED BY acciones.id;


--
-- Name: actividades; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE actividades (
    id integer NOT NULL,
    nombre character varying,
    descripcion text,
    obligatorio boolean,
    "actividadesAntecedentes" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    etapa_id integer
);


ALTER TABLE actividades OWNER TO ana;

--
-- Name: actividades_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE actividades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actividades_id_seq OWNER TO ana;

--
-- Name: actividades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE actividades_id_seq OWNED BY actividades.id;


--
-- Name: actividades_proyectos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE actividades_proyectos (
    id integer NOT NULL,
    "fechaVencimiento" date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    proyecto_id integer,
    actividad_id integer,
    estado_id integer
);


ALTER TABLE actividades_proyectos OWNER TO ana;

--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE actividades_proyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actividades_proyectos_id_seq OWNER TO ana;

--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE actividades_proyectos_id_seq OWNED BY actividades_proyectos.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE areas OWNER TO ana;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE areas_id_seq OWNER TO ana;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp without time zone
);


ALTER TABLE audits OWNER TO ana;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE audits_id_seq OWNER TO ana;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE audits_id_seq OWNED BY audits.id;


--
-- Name: ciudades; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE ciudades (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provincia_id integer,
    pais_id integer
);


ALTER TABLE ciudades OWNER TO ana;

--
-- Name: ciudades_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE ciudades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ciudades_id_seq OWNER TO ana;

--
-- Name: ciudades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE ciudades_id_seq OWNED BY ciudades.id;


--
-- Name: conceptos_de_pago; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE conceptos_de_pago (
    id integer NOT NULL,
    codigo character varying,
    nombre character varying,
    descripcion text,
    monto double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE conceptos_de_pago OWNER TO ana;

--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE conceptos_de_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conceptos_de_pago_id_seq OWNER TO ana;

--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE conceptos_de_pago_id_seq OWNED BY conceptos_de_pago.id;


--
-- Name: configuraciones; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE configuraciones (
    id integer NOT NULL,
    logo character varying,
    nombre character varying,
    eslogan character varying,
    cuit character varying,
    condicion_iva character varying,
    numero_abandono integer,
    tiempo_abandono character varying,
    calle character varying,
    nro_domicilio character varying,
    piso character varying,
    dpto character varying,
    telefono character varying,
    email character varying,
    pag_web character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pais_id integer,
    provincia_id integer,
    ciudad_id integer,
    area_id integer,
    logotipo character varying
);


ALTER TABLE configuraciones OWNER TO ana;

--
-- Name: configuraciones_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE configuraciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuraciones_id_seq OWNER TO ana;

--
-- Name: configuraciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE configuraciones_id_seq OWNED BY configuraciones.id;


--
-- Name: contactos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE contactos (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE contactos OWNER TO ana;

--
-- Name: contactos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE contactos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contactos_id_seq OWNER TO ana;

--
-- Name: contactos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE contactos_id_seq OWNED BY contactos.id;


--
-- Name: contratos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE contratos (
    id integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    persona_proyecto_id integer,
    persona_id integer,
    proyecto_id integer
);


ALTER TABLE contratos OWNER TO ana;

--
-- Name: contratos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE contratos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contratos_id_seq OWNER TO ana;

--
-- Name: contratos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE contratos_id_seq OWNED BY contratos.id;


--
-- Name: cuentas; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE cuentas (
    id integer NOT NULL,
    saldo double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    proyecto_id integer
);


ALTER TABLE cuentas OWNER TO ana;

--
-- Name: cuentas_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cuentas_id_seq OWNER TO ana;

--
-- Name: cuentas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE cuentas_id_seq OWNED BY cuentas.id;


--
-- Name: cuotas_por_cliente; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE cuotas_por_cliente (
    id integer NOT NULL,
    "montoTotal" double precision,
    estado boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    concepto_de_pago_id integer,
    proyecto_id integer,
    contrato_id integer,
    pago_id integer,
    descuento_id integer
);


ALTER TABLE cuotas_por_cliente OWNER TO ana;

--
-- Name: cuotas_por_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE cuotas_por_cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cuotas_por_cliente_id_seq OWNER TO ana;

--
-- Name: cuotas_por_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE cuotas_por_cliente_id_seq OWNED BY cuotas_por_cliente.id;


--
-- Name: db_backups; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE db_backups (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE db_backups OWNER TO ana;

--
-- Name: db_backups_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE db_backups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE db_backups_id_seq OWNER TO ana;

--
-- Name: db_backups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE db_backups_id_seq OWNED BY db_backups.id;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE departamentos (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE departamentos OWNER TO ana;

--
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE departamentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE departamentos_id_seq OWNER TO ana;

--
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE departamentos_id_seq OWNED BY departamentos.id;


--
-- Name: descuentos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE descuentos (
    id integer NOT NULL,
    nombre character varying,
    descripcion text,
    porcentaje double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE descuentos OWNER TO ana;

--
-- Name: descuentos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE descuentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE descuentos_id_seq OWNER TO ana;

--
-- Name: descuentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE descuentos_id_seq OWNED BY descuentos.id;


--
-- Name: empleados; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE empleados (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE empleados OWNER TO ana;

--
-- Name: empleados_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE empleados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empleados_id_seq OWNER TO ana;

--
-- Name: empleados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE empleados_id_seq OWNED BY empleados.id;


--
-- Name: especialidades_de_contacto; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE especialidades_de_contacto (
    id integer NOT NULL,
    nombre character varying,
    descripcion text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE especialidades_de_contacto OWNER TO ana;

--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE especialidades_de_contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE especialidades_de_contacto_id_seq OWNER TO ana;

--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE especialidades_de_contacto_id_seq OWNED BY especialidades_de_contacto.id;


--
-- Name: estados; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE estados (
    id integer NOT NULL,
    nombre character varying,
    ultimo boolean,
    previous integer,
    color character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE estados OWNER TO ana;

--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE estados_id_seq OWNER TO ana;

--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE estados_id_seq OWNED BY estados.id;


--
-- Name: etapas; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE etapas (
    id integer NOT NULL,
    nombre character varying,
    descripcion text,
    "etapaAnterior" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE etapas OWNER TO ana;

--
-- Name: etapas_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE etapas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE etapas_id_seq OWNER TO ana;

--
-- Name: etapas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE etapas_id_seq OWNED BY etapas.id;


--
-- Name: eventos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE eventos (
    id integer NOT NULL,
    codigo character varying,
    nombre character varying,
    descripcion text,
    dia date,
    hora time without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    contacto_id integer,
    persona_id integer
);


ALTER TABLE eventos OWNER TO ana;

--
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos_id_seq OWNER TO ana;

--
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE eventos_id_seq OWNED BY eventos.id;


--
-- Name: eventos_proyectos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE eventos_proyectos (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    proyecto_id integer,
    evento_id integer
);


ALTER TABLE eventos_proyectos OWNER TO ana;

--
-- Name: eventos_proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE eventos_proyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos_proyectos_id_seq OWNER TO ana;

--
-- Name: eventos_proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE eventos_proyectos_id_seq OWNED BY eventos_proyectos.id;


--
-- Name: historiales; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE historiales (
    id integer NOT NULL,
    "fechaHora" timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    actividad_proyecto_id integer,
    estado_id integer,
    proyecto_id integer,
    user_id integer
);


ALTER TABLE historiales OWNER TO ana;

--
-- Name: historiales_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE historiales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historiales_id_seq OWNER TO ana;

--
-- Name: historiales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE historiales_id_seq OWNED BY historiales.id;


--
-- Name: intereses; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE intereses (
    id integer NOT NULL,
    nombre character varying,
    descripcion text,
    porcentaje double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE intereses OWNER TO ana;

--
-- Name: intereses_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE intereses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE intereses_id_seq OWNER TO ana;

--
-- Name: intereses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE intereses_id_seq OWNED BY intereses.id;


--
-- Name: miembros_equipo; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE miembros_equipo (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE miembros_equipo OWNER TO ana;

--
-- Name: miembros_equipo_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE miembros_equipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE miembros_equipo_id_seq OWNER TO ana;

--
-- Name: miembros_equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE miembros_equipo_id_seq OWNED BY miembros_equipo.id;


--
-- Name: modelos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE modelos (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE modelos OWNER TO ana;

--
-- Name: modelos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE modelos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modelos_id_seq OWNER TO ana;

--
-- Name: modelos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE modelos_id_seq OWNED BY modelos.id;


--
-- Name: pagos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE pagos (
    id integer NOT NULL,
    fecha date,
    monto double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tipo_de_pago_id integer,
    proyecto_id integer,
    persona_id integer,
    cuenta_id integer
);


ALTER TABLE pagos OWNER TO ana;

--
-- Name: pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE pagos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pagos_id_seq OWNER TO ana;

--
-- Name: pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE pagos_id_seq OWNED BY pagos.id;


--
-- Name: pagos_metodos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE pagos_metodos (
    id integer NOT NULL,
    monto double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pago_id integer,
    tipo_de_pago_id integer
);


ALTER TABLE pagos_metodos OWNER TO ana;

--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE pagos_metodos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pagos_metodos_id_seq OWNER TO ana;

--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE pagos_metodos_id_seq OWNED BY pagos_metodos.id;


--
-- Name: paises; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE paises (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE paises OWNER TO ana;

--
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paises_id_seq OWNER TO ana;

--
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE paises_id_seq OWNED BY paises.id;


--
-- Name: permisos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE permisos (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    accion_id integer,
    modelo_id integer
);


ALTER TABLE permisos OWNER TO ana;

--
-- Name: permisos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE permisos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permisos_id_seq OWNER TO ana;

--
-- Name: permisos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE permisos_id_seq OWNED BY permisos.id;


--
-- Name: permisos_roles; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE permisos_roles (
    permiso_id integer,
    rol_id integer
);


ALTER TABLE permisos_roles OWNER TO ana;

--
-- Name: personas; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE personas (
    id integer NOT NULL,
    codigo character varying,
    nombre character varying,
    apellido character varying,
    "nroIdentificacion" character varying,
    "fechaNacimiento" date,
    calle character varying,
    "nroDomicilio" character varying,
    piso character varying,
    dpto character varying,
    telefono character varying,
    email character varying,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pais_id integer,
    provincia_id integer,
    ciudad_id integer,
    tipo_documento_id integer,
    departamento_id integer,
    especialidad_de_contacto_id integer,
    area_id integer,
    rol_de_empleado_id integer
);


ALTER TABLE personas OWNER TO ana;

--
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_id_seq OWNER TO ana;

--
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE personas_id_seq OWNED BY personas.id;


--
-- Name: personas_proyectos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE personas_proyectos (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    proyecto_id integer,
    persona_id integer
);


ALTER TABLE personas_proyectos OWNER TO ana;

--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE personas_proyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_proyectos_id_seq OWNER TO ana;

--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE personas_proyectos_id_seq OWNED BY personas_proyectos.id;


--
-- Name: provincias; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE provincias (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pais_id integer
);


ALTER TABLE provincias OWNER TO ana;

--
-- Name: provincias_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE provincias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE provincias_id_seq OWNER TO ana;

--
-- Name: provincias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE provincias_id_seq OWNED BY provincias.id;


--
-- Name: proyectos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE proyectos (
    id integer NOT NULL,
    codigo character varying,
    nombre character varying,
    descripcion text,
    calle character varying,
    "nroDomicilio" character varying,
    piso character varying,
    dpto character varying,
    telefono character varying,
    email character varying,
    "pagWeb" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pais_id integer,
    provincia_id integer,
    ciudad_id integer,
    etapa_id integer,
    area_id integer
);


ALTER TABLE proyectos OWNER TO ana;

--
-- Name: proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE proyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proyectos_id_seq OWNER TO ana;

--
-- Name: proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE proyectos_id_seq OWNED BY proyectos.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE roles OWNER TO ana;

--
-- Name: roles_de_empleados; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE roles_de_empleados (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    departamento_id integer
);


ALTER TABLE roles_de_empleados OWNER TO ana;

--
-- Name: roles_de_empleados_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE roles_de_empleados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_de_empleados_id_seq OWNER TO ana;

--
-- Name: roles_de_empleados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE roles_de_empleados_id_seq OWNED BY roles_de_empleados.id;


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO ana;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO ana;

--
-- Name: systemsettings; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE systemsettings (
    id integer NOT NULL,
    tipo_de_pago_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE systemsettings OWNER TO ana;

--
-- Name: systemsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE systemsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE systemsettings_id_seq OWNER TO ana;

--
-- Name: systemsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE systemsettings_id_seq OWNED BY systemsettings.id;


--
-- Name: tipo_documentos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE tipo_documentos (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tipo_documentos OWNER TO ana;

--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE tipo_documentos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_documentos_id_seq OWNER TO ana;

--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE tipo_documentos_id_seq OWNED BY tipo_documentos.id;


--
-- Name: tipos_de_pago; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE tipos_de_pago (
    id integer NOT NULL,
    nombre character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tipos_de_pago OWNER TO ana;

--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE tipos_de_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipos_de_pago_id_seq OWNER TO ana;

--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE tipos_de_pago_id_seq OWNED BY tipos_de_pago.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    persona_id integer,
    rol_id integer
);


ALTER TABLE users OWNER TO ana;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO ana;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vencimientos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE vencimientos (
    id integer NOT NULL,
    fecha date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    concepto_de_pago_id integer,
    interes_id integer
);


ALTER TABLE vencimientos OWNER TO ana;

--
-- Name: vencimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE vencimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vencimientos_id_seq OWNER TO ana;

--
-- Name: vencimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE vencimientos_id_seq OWNED BY vencimientos.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY acciones ALTER COLUMN id SET DEFAULT nextval('acciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY actividades ALTER COLUMN id SET DEFAULT nextval('actividades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY actividades_proyectos ALTER COLUMN id SET DEFAULT nextval('actividades_proyectos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY audits ALTER COLUMN id SET DEFAULT nextval('audits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY ciudades ALTER COLUMN id SET DEFAULT nextval('ciudades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY conceptos_de_pago ALTER COLUMN id SET DEFAULT nextval('conceptos_de_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY configuraciones ALTER COLUMN id SET DEFAULT nextval('configuraciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY contactos ALTER COLUMN id SET DEFAULT nextval('contactos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY contratos ALTER COLUMN id SET DEFAULT nextval('contratos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuentas ALTER COLUMN id SET DEFAULT nextval('cuentas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuotas_por_cliente ALTER COLUMN id SET DEFAULT nextval('cuotas_por_cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY db_backups ALTER COLUMN id SET DEFAULT nextval('db_backups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY departamentos ALTER COLUMN id SET DEFAULT nextval('departamentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY descuentos ALTER COLUMN id SET DEFAULT nextval('descuentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY empleados ALTER COLUMN id SET DEFAULT nextval('empleados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY especialidades_de_contacto ALTER COLUMN id SET DEFAULT nextval('especialidades_de_contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY estados ALTER COLUMN id SET DEFAULT nextval('estados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY etapas ALTER COLUMN id SET DEFAULT nextval('etapas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos ALTER COLUMN id SET DEFAULT nextval('eventos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos_proyectos ALTER COLUMN id SET DEFAULT nextval('eventos_proyectos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY historiales ALTER COLUMN id SET DEFAULT nextval('historiales_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY intereses ALTER COLUMN id SET DEFAULT nextval('intereses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY miembros_equipo ALTER COLUMN id SET DEFAULT nextval('miembros_equipo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY modelos ALTER COLUMN id SET DEFAULT nextval('modelos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos ALTER COLUMN id SET DEFAULT nextval('pagos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos_metodos ALTER COLUMN id SET DEFAULT nextval('pagos_metodos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY paises ALTER COLUMN id SET DEFAULT nextval('paises_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY permisos ALTER COLUMN id SET DEFAULT nextval('permisos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_proyectos ALTER COLUMN id SET DEFAULT nextval('personas_proyectos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY provincias ALTER COLUMN id SET DEFAULT nextval('provincias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos ALTER COLUMN id SET DEFAULT nextval('proyectos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY roles_de_empleados ALTER COLUMN id SET DEFAULT nextval('roles_de_empleados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY systemsettings ALTER COLUMN id SET DEFAULT nextval('systemsettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY tipo_documentos ALTER COLUMN id SET DEFAULT nextval('tipo_documentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY tipos_de_pago ALTER COLUMN id SET DEFAULT nextval('tipos_de_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY vencimientos ALTER COLUMN id SET DEFAULT nextval('vencimientos_id_seq'::regclass);


--
-- Data for Name: acciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY acciones (id, nombre, key_name, created_at, updated_at) FROM stdin;
1	Crear	create	2017-02-23 04:10:24.80666	2017-02-23 04:10:24.80666
2	Eliminar	destroy	2017-02-23 04:10:24.829549	2017-02-23 04:10:24.829549
3	Ver	show	2017-02-23 04:10:24.852099	2017-02-23 04:10:24.852099
4	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-02-23 04:10:24.87469	2017-02-23 04:10:24.87469
5	Index	index	2017-02-23 04:10:24.896762	2017-02-23 04:10:24.896762
6	Editar	update	2017-02-23 04:10:24.919805	2017-02-23 04:10:24.919805
7	Estadisticas	estadistica	2017-02-23 04:10:24.955002	2017-02-23 04:10:24.955002
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 7, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, "actividadesAntecedentes", created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	--- []\n	2017-02-23 04:10:21.197956	2017-02-23 04:10:21.197956	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-02-23 04:10:21.228894	2017-02-23 04:10:21.228894	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-02-23 04:10:21.263354	2017-02-23 04:10:21.263354	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-02-23 04:10:21.29144	2017-02-23 04:10:21.29144	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-02-23 04:10:21.318061	2017-02-23 04:10:21.318061	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-02-23 04:10:21.351432	2017-02-23 04:10:21.351432	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-02-23 04:10:21.38286	2017-02-23 04:10:21.38286	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-02-23 04:10:21.405401	2017-02-23 04:10:21.405401	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-02-23 04:10:21.425593	2017-02-23 04:10:21.425593	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n- '2'\n- '3'\n	2017-02-23 04:10:21.450512	2017-02-23 04:10:21.450512	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '1'\n- '2'\n- '3'\n	2017-02-23 04:10:21.482988	2017-02-23 04:10:21.482988	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-02-23 04:10:23.278762	2017-02-23 04:10:23.278762	1	1	\N
2	\N	2017-02-23 04:10:23.334579	2017-02-23 04:10:23.334579	1	2	\N
3	\N	2017-02-23 04:10:23.378525	2017-02-23 04:10:23.378525	1	3	\N
4	\N	2017-02-23 04:10:23.434284	2017-02-23 04:10:23.434284	2	1	\N
5	\N	2017-02-23 04:10:23.490924	2017-02-23 04:10:23.490924	2	2	\N
6	\N	2017-02-23 04:10:23.54659	2017-02-23 04:10:23.54659	2	3	\N
7	\N	2017-02-23 04:10:23.601746	2017-02-23 04:10:23.601746	3	1	\N
8	\N	2017-02-23 04:10:23.646483	2017-02-23 04:10:23.646483	3	2	\N
9	\N	2017-02-23 04:10:23.689699	2017-02-23 04:10:23.689699	3	3	\N
10	\N	2017-02-23 04:10:23.735094	2017-02-23 04:10:23.735094	4	1	\N
11	\N	2017-02-23 04:10:23.789819	2017-02-23 04:10:23.789819	4	2	\N
12	\N	2017-02-23 04:10:23.833972	2017-02-23 04:10:23.833972	4	3	\N
13	\N	2017-02-23 04:10:23.878966	2017-02-23 04:10:23.878966	5	1	\N
14	\N	2017-02-23 04:10:23.935821	2017-02-23 04:10:23.935821	5	2	\N
15	\N	2017-02-23 04:10:23.978589	2017-02-23 04:10:23.978589	5	3	\N
16	\N	2017-02-23 04:10:24.022859	2017-02-23 04:10:24.022859	6	1	\N
17	\N	2017-02-23 04:10:24.067296	2017-02-23 04:10:24.067296	6	2	\N
18	\N	2017-02-23 04:10:24.124457	2017-02-23 04:10:24.124457	6	3	\N
19	\N	2017-02-23 04:10:24.178537	2017-02-23 04:10:24.178537	7	1	\N
20	\N	2017-02-23 04:10:24.22286	2017-02-23 04:10:24.22286	7	2	\N
21	\N	2017-02-23 04:10:24.268233	2017-02-23 04:10:24.268233	7	3	\N
22	\N	2017-02-23 04:10:24.325179	2017-02-23 04:10:24.325179	8	1	\N
23	\N	2017-02-23 04:10:24.378544	2017-02-23 04:10:24.378544	8	2	\N
24	\N	2017-02-23 04:10:24.422822	2017-02-23 04:10:24.422822	8	3	\N
25	\N	2017-02-23 04:10:24.468507	2017-02-23 04:10:24.468507	9	1	\N
26	\N	2017-02-23 04:10:24.511966	2017-02-23 04:10:24.511966	9	2	\N
27	\N	2017-02-23 04:10:24.556747	2017-02-23 04:10:24.556747	9	3	\N
28	\N	2017-02-23 04:10:24.614064	2017-02-23 04:10:24.614064	10	1	\N
29	\N	2017-02-23 04:10:24.669058	2017-02-23 04:10:24.669058	10	2	\N
30	\N	2017-02-23 04:10:24.724623	2017-02-23 04:10:24.724623	10	3	\N
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 30, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-02-23 04:10:19.426752	2017-02-23 04:10:19.426752
2	Rural	2017-02-23 04:10:19.447994	2017-02-23 04:10:19.447994
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
1	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	f6b6864c-abb2-4787-bd10-5bb0fe4f0d79	2017-02-23 04:10:21.743552
2	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	5c9f6183-be0e-4c6f-936a-e218d8a14457	2017-02-23 04:10:21.874925
3	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	eb0eb5e0-9924-49f9-b85e-911e85c9d2aa	2017-02-23 04:10:21.947132
4	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	3fae0bdc-14b0-4a28-b67c-9a8b5c41a4e7	2017-02-23 04:10:22.028005
5	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b41cd059-e04c-4837-953c-171e2ace98f8	2017-02-23 04:10:22.105509
6	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	d5c49702-531b-43d3-9cfe-5c90973ad361	2017-02-23 04:10:22.181902
7	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	2be6c788-b7b6-4164-b135-83616ea6c6b2	2017-02-23 04:10:22.255215
8	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	8c62d61b-b776-4b87-aa4d-ea6c6ea1473b	2017-02-23 04:10:22.321014
9	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	573e09e3-fe71-454c-945a-c75537b340a5	2017-02-23 04:10:22.391045
10	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	c14e9558-8478-47c9-a6ea-90808f42da99	2017-02-23 04:10:22.457071
11	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: \n	1	\N	\N	1dbab45e-9476-440a-bf31-5933c4b3b54d	2017-02-23 04:10:23.305915
12	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: \n	1	\N	\N	01c4456c-990f-4716-bec2-fcf664779178	2017-02-23 04:10:23.353597
13	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: \n	1	\N	\N	32755d36-eaeb-4d05-9aef-0fb92d70b52c	2017-02-23 04:10:23.398251
14	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: \n	1	\N	\N	9f35b7b7-cd22-42a5-a6dd-9a4bf3235d0d	2017-02-23 04:10:23.460065
15	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: \n	1	\N	\N	b242d99c-22f0-4bfb-ab3e-086bd6f92475	2017-02-23 04:10:23.509417
16	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: \n	1	\N	\N	ddb88595-9284-45a7-ae51-c3e030aa195c	2017-02-23 04:10:23.568689
17	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: \n	1	\N	\N	39ba804f-6067-44f6-883e-3215ce8c5a20	2017-02-23 04:10:23.618756
18	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: \n	1	\N	\N	ecb73805-928b-4270-9fb7-ba6435a6e614	2017-02-23 04:10:23.663782
19	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: \n	1	\N	\N	c0646fd0-ad0d-4c22-86ce-8e44757dc4e8	2017-02-23 04:10:23.708366
20	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: \n	1	\N	\N	1041fca3-65f5-489c-95ed-13bffa19a7c5	2017-02-23 04:10:23.754768
21	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: \n	1	\N	\N	f50a0b13-47d3-49bc-9f99-2d47d04e506f	2017-02-23 04:10:23.807909
22	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: \n	1	\N	\N	d1b077b2-96a6-4abb-acf8-7ce82ad1a088	2017-02-23 04:10:23.851204
23	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: \n	1	\N	\N	ebddbffa-d3c9-412f-95ac-56026be80dd2	2017-02-23 04:10:23.900147
24	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: \n	1	\N	\N	2fde1638-e1aa-4fd9-afec-362d946c0b3f	2017-02-23 04:10:23.953009
25	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: \n	1	\N	\N	5e06fbf3-68fc-4e81-868c-97648a5f3216	2017-02-23 04:10:23.995955
26	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: \n	1	\N	\N	ea1f3c1c-6126-42a8-9031-fffa9f63e62e	2017-02-23 04:10:24.04017
27	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: \n	1	\N	\N	c319fb7a-0721-4443-a88b-651af3498de5	2017-02-23 04:10:24.089229
28	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: \n	1	\N	\N	c677286d-51b8-442b-bb19-ca99d927af6a	2017-02-23 04:10:24.143214
29	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: \n	1	\N	\N	73ace621-66ee-4f75-a2d8-2d1afe2845ac	2017-02-23 04:10:24.195479
30	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: \n	1	\N	\N	a73fb0c2-c23c-4216-a217-332980e887fb	2017-02-23 04:10:24.239751
31	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: \n	1	\N	\N	3f4a4bd3-2dbc-4388-80f9-692c30da5271	2017-02-23 04:10:24.291181
32	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: \n	1	\N	\N	60bbc797-3af6-4777-b05b-47e269f379ce	2017-02-23 04:10:24.346147
33	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: \n	1	\N	\N	4ba1a113-60ca-4138-9334-78dd2687447d	2017-02-23 04:10:24.395304
34	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: \n	1	\N	\N	fbed88ea-4832-4f07-bb27-9ba9c6b4eb3f	2017-02-23 04:10:24.441306
35	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: \n	1	\N	\N	a89fd481-6eb6-4bab-8128-e28dba1be8f6	2017-02-23 04:10:24.48763
36	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: \n	1	\N	\N	a8a2269c-7ddc-41ab-bb0a-ab373ee8aa0c	2017-02-23 04:10:24.530778
37	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: \n	1	\N	\N	5cc40068-3dbc-4ebd-b7f2-464db4ad8bc1	2017-02-23 04:10:24.574893
38	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: \n	1	\N	\N	3b1c4199-e6ab-4247-a183-fd381cc0f94b	2017-02-23 04:10:24.632997
39	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: \n	1	\N	\N	564e97f0-e85a-4097-83f0-bf89a2fb89ff	2017-02-23 04:10:24.68583
40	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: \n	1	\N	\N	34e3605a-4a18-47e2-b580-c1dcd28ddf4b	2017-02-23 04:10:24.743423
41	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\nmonto: 200.0\n	1	\N	\N	183ca949-0c18-4ab9-b4d1-e937806be0de	2017-02-23 04:10:30.880964
42	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\nmonto: 200.0\n	1	\N	\N	92a308c3-a683-4db7-ba29-7c404bf6b257	2017-02-23 04:10:30.940867
43	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\nmonto: 200.0\n	1	\N	\N	85a59d5a-7f94-4d1a-857c-9a3e8ffd4eed	2017-02-23 04:10:30.996441
44	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\nmonto: 200.0\n	1	\N	\N	f67de5c8-e8ac-44d8-a742-fe3aaf7aa080	2017-02-23 04:10:31.051045
45	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\nmonto: 200.0\n	1	\N	\N	82b63182-04d7-4662-a273-0ac711c6763b	2017-02-23 04:10:31.109588
46	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\nmonto: 200.0\n	1	\N	\N	92db50eb-c7e7-4f1c-be94-700f6eb443ad	2017-02-23 04:10:31.174959
47	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\nmonto: 200.0\n	1	\N	\N	bef214d7-46fc-48de-a721-d735ef651970	2017-02-23 04:10:31.22868
48	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\nmonto: 200.0\n	1	\N	\N	18e517a2-bb9a-48b6-b3ae-a96e4e73c84b	2017-02-23 04:10:31.285864
49	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\nmonto: 200.0\n	1	\N	\N	a59981f6-398d-44d0-9028-5d2d0746f7aa	2017-02-23 04:10:31.339795
50	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\nmonto: 200.0\n	1	\N	\N	53ca830c-0dc1-49de-97c2-d64f72608015	2017-02-23 04:10:31.396781
51	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\nmonto: 200.0\n	1	\N	\N	f1bbd9f4-e369-453a-9439-c4b4377d0d5c	2017-02-23 04:10:31.452179
52	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\nmonto: 200.0\n	1	\N	\N	5957c51b-5264-4bf8-8879-5ea705cd6ff0	2017-02-23 04:10:31.507235
53	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 7\nproyecto_id: 1\n	1	\N	\N	0b9d4e8f-1a50-4584-a31f-ebf82843aa55	2017-02-23 04:10:32.182742
54	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 8\nproyecto_id: 2\n	1	\N	\N	fdf0b891-398e-4226-8f40-eceb32a5a01b	2017-02-23 04:10:32.233236
55	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 10\nproyecto_id: 3\n	1	\N	\N	12c60d5c-8109-42b9-942e-52610d16f86f	2017-02-23 04:10:32.293081
56	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 12\nproyecto_id: 4\n	1	\N	\N	3e873319-7f67-4c21-9b0b-9e4e726a23e1	2017-02-23 04:10:32.345795
57	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 14\nproyecto_id: 5\n	1	\N	\N	8dc65315-b833-4ff1-b9ed-fb7dc3784af6	2017-02-23 04:10:32.402466
58	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 19\nproyecto_id: 6\n	1	\N	\N	5445686d-95ad-4cc9-b197-d08827c475b5	2017-02-23 04:10:32.45628
59	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 18\nproyecto_id: 7\n	1	\N	\N	a4a3049e-2526-4259-a8a6-b36c36a526d6	2017-02-23 04:10:32.510055
60	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 21\nproyecto_id: 8\n	1	\N	\N	b7765c55-ab04-4e63-a047-c78e72c30705	2017-02-23 04:10:32.55965
61	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 23\nproyecto_id: 9\n	1	\N	\N	ab2a519c-ca75-4b93-bd7b-81a02b7eb00b	2017-02-23 04:10:32.613108
62	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 25\nproyecto_id: 10\n	1	\N	\N	f3513998-b64f-4e30-b53e-413f7484348a	2017-02-23 04:10:32.666396
63	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	984fe77b-6220-4af0-9cbe-dc3987bef812	2017-02-23 04:10:32.862739
64	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	7f366bf8-7a90-452a-8f72-761a5bad74af	2017-02-23 04:10:32.981679
65	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	0c3a78db-bf26-4abc-8880-2b9eeb4a793c	2017-02-23 04:10:33.069499
66	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	94953ea0-f1fc-445b-af55-70758e4bf593	2017-02-23 04:10:33.137994
67	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	cef20315-198a-47fd-bbc9-6fc97384b533	2017-02-23 04:10:33.230012
68	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	3b806465-2312-464c-b2f4-4e1dda5de0f5	2017-02-23 04:10:33.333553
69	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	d642a76c-983c-497c-b9d1-2acef5143e7e	2017-02-23 04:10:33.419017
70	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	9df45b0c-1ee8-4e85-9408-39a2db2ad5d9	2017-02-23 04:10:33.492859
71	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	79866af6-5f80-47a5-b5e6-740cce85884f	2017-02-23 04:10:33.576603
72	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	4eb9a759-a4e2-445d-9236-aed6a46d0962	2017-02-23 04:10:33.676901
73	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	9fc84674-b17b-46fc-ad0d-9d9ce60e7841	2017-02-23 04:10:33.765738
74	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	d164d21f-6718-4347-92a9-96362cd79bfb	2017-02-23 04:10:33.873469
75	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	6e979451-aff6-4459-9bd7-d9d0e60b678c	2017-02-23 04:10:33.963093
76	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	a6121a21-ea55-454e-8697-b8edbf6befeb	2017-02-23 04:10:34.068
77	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	d3b4155d-8169-4178-a6cf-5f2281b04287	2017-02-23 04:10:34.165529
78	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	bdd01a4d-1016-439a-baf4-b048d823b09b	2017-02-23 04:10:34.24196
79	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	ea5fb915-81d6-4c9e-bcf3-5b3d22657c3d	2017-02-23 04:10:34.331759
80	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	fe29f94b-f59b-45f3-8e81-163186ccdf10	2017-02-23 04:10:34.489193
81	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	fe2891f6-2fe4-4a43-a508-f9db73581167	2017-02-23 04:10:34.59338
82	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	ff7aa00d-5f0c-4bac-a0f3-d13a14d4828e	2017-02-23 04:10:34.677987
83	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	d6b4ac00-10c3-4172-bc64-c6134a27635d	2017-02-23 04:10:34.768438
84	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	e78ab0ba-f42c-45e2-acf7-aeefbea97a91	2017-02-23 04:10:34.870334
85	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	d5b79c08-c158-4c28-9b36-6c1f88633422	2017-02-23 04:10:34.955052
86	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	38dbb188-7a47-48cb-a370-9c19cd8130a2	2017-02-23 04:10:35.031913
87	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	79327686-6655-47e9-8f09-0a4e5492c6be	2017-02-23 04:10:35.123135
88	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	65942d3c-1427-431f-a7e8-0d674d5d86f6	2017-02-23 04:10:35.223396
89	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	e345d966-4fe3-4375-98a5-a6e42763b0bd	2017-02-23 04:10:35.311868
90	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	885c4bc3-603e-43dd-ab5c-8ca33120d3d6	2017-02-23 04:10:35.387107
91	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	030bdf56-fb0d-4d3e-8fac-446bec45a468	2017-02-23 04:10:35.479054
92	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	662badc9-4d8f-430d-ba5f-851d23ec01d1	2017-02-23 04:10:35.593323
93	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	e2113ef4-ef38-430f-b36e-12aa8f519335	2017-02-23 04:10:35.687801
94	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	f7fe138d-06fb-4328-b714-98965cf69a56	2017-02-23 04:10:35.760661
95	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	c22bdb06-1b28-4792-85b8-4ba89e89f822	2017-02-23 04:10:35.853587
96	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	c0a28251-faa3-47ea-816c-75a86468f01c	2017-02-23 04:10:35.953678
97	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	58608cee-2e71-4b49-bced-9da9be5fa467	2017-02-23 04:10:36.048065
98	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	8576171d-5f92-4803-aae1-8cd5d2d5d22d	2017-02-23 04:10:36.120885
99	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	efb330a0-3529-4cd4-b9e0-851f7b80a17b	2017-02-23 04:10:36.209433
100	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	5a237a90-1db6-4632-93c9-ea4981d1e8e3	2017-02-23 04:10:36.31135
101	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	8e468cdb-0f46-4dd5-8a44-338561d1ecd8	2017-02-23 04:10:36.402518
102	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	826bb11d-5c0d-4c0e-9e6c-831327730f70	2017-02-23 04:10:36.477275
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 102, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-02-23 04:10:19.259609	2017-02-23 04:10:19.259609	1	1
2	Apostoles	2017-02-23 04:10:19.299955	2017-02-23 04:10:19.299955	1	1
3	Bella Vista	2017-02-23 04:10:19.333826	2017-02-23 04:10:19.333826	2	1
4	Encarnación	2017-02-23 04:10:19.377869	2017-02-23 04:10:19.377869	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	200	2017-02-23 04:10:30.853545	2017-02-23 04:10:30.853545
2	CP-002	Cuota de Febrero	Febrero 2017	200	2017-02-23 04:10:30.923831	2017-02-23 04:10:30.923831
3	CP-003	Cuota de Marzo	Marzo 2017	200	2017-02-23 04:10:30.977197	2017-02-23 04:10:30.977197
4	CP-004	Cuota de Abril	Abril 2017	200	2017-02-23 04:10:31.032998	2017-02-23 04:10:31.032998
5	CP-005	Cuota de Mayo	Mayo 2017	200	2017-02-23 04:10:31.091202	2017-02-23 04:10:31.091202
6	CP-006	Cuota de Junio	Junio 2017	200	2017-02-23 04:10:31.155471	2017-02-23 04:10:31.155471
7	CP-007	Cuota de Julio	Julio 2017	200	2017-02-23 04:10:31.211965	2017-02-23 04:10:31.211965
8	CP-008	Cuota de Agosto	Agosto 2017	200	2017-02-23 04:10:31.268265	2017-02-23 04:10:31.268265
9	CP-009	Cuota de Septiembre	Septiembre 2017	200	2017-02-23 04:10:31.322751	2017-02-23 04:10:31.322751
10	CP-010	Cuota de Octubre	Octubre 2017	200	2017-02-23 04:10:31.379892	2017-02-23 04:10:31.379892
11	CP-011	Cuota de Noviembre	Noviembre 2017	200	2017-02-23 04:10:31.434051	2017-02-23 04:10:31.434051
12	CP-012	Cuota de Diciembre	Diciembre 2017	200	2017-02-23 04:10:31.488666	2017-02-23 04:10:31.488666
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, numero_abandono, tiempo_abandono, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
1	Peak-Startup-Logo.png	Peak Startup		30-54570225-4	ri	15	minutes	Av. Corrientes	4287			4401604	\N	peakstartup@gmail.com	2017-02-23 04:10:36.87157	2017-02-23 04:10:36.87157	1	1	1	1	\N
\.


--
-- Name: configuraciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('configuraciones_id_seq', 1, true);


--
-- Data for Name: contactos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY contactos (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: contactos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contactos_id_seq', 1, false);


--
-- Data for Name: contratos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY contratos (id, fecha_inicio, fecha_fin, created_at, updated_at, persona_proyecto_id, persona_id, proyecto_id) FROM stdin;
1	2017-01-01	2017-04-30	2017-02-23 04:10:32.151829	2017-02-23 04:10:32.151829	\N	7	1
2	2017-01-01	2017-04-30	2017-02-23 04:10:32.21327	2017-02-23 04:10:32.21327	\N	8	2
3	2017-01-01	2017-04-30	2017-02-23 04:10:32.270718	2017-02-23 04:10:32.270718	\N	10	3
4	2017-01-01	2017-04-30	2017-02-23 04:10:32.32607	2017-02-23 04:10:32.32607	\N	12	4
5	2017-01-01	2017-04-30	2017-02-23 04:10:32.382059	2017-02-23 04:10:32.382059	\N	14	5
6	2017-01-01	2017-04-30	2017-02-23 04:10:32.435828	2017-02-23 04:10:32.435828	\N	19	6
7	2017-01-01	2017-04-30	2017-02-23 04:10:32.491651	2017-02-23 04:10:32.491651	\N	18	7
8	2017-01-01	2017-04-30	2017-02-23 04:10:32.536115	2017-02-23 04:10:32.536115	\N	21	8
9	2017-01-01	2017-04-30	2017-02-23 04:10:32.592377	2017-02-23 04:10:32.592377	\N	23	9
10	2017-01-01	2017-04-30	2017-02-23 04:10:32.647448	2017-02-23 04:10:32.647448	\N	25	10
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 10, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
1	0	2017-02-23 04:10:36.55025	2017-02-23 04:10:36.55025	1
2	0	2017-02-23 04:10:36.573715	2017-02-23 04:10:36.573715	2
3	0	2017-02-23 04:10:36.596864	2017-02-23 04:10:36.596864	3
4	0	2017-02-23 04:10:36.617758	2017-02-23 04:10:36.617758	4
5	0	2017-02-23 04:10:36.641277	2017-02-23 04:10:36.641277	5
6	0	2017-02-23 04:10:36.66293	2017-02-23 04:10:36.66293	6
7	0	2017-02-23 04:10:36.684806	2017-02-23 04:10:36.684806	7
8	0	2017-02-23 04:10:36.706302	2017-02-23 04:10:36.706302	8
9	0	2017-02-23 04:10:36.729437	2017-02-23 04:10:36.729437	9
10	0	2017-02-23 04:10:36.753322	2017-02-23 04:10:36.753322	10
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 10, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
1	288	f	2017-02-23 04:10:32.828149	2017-02-23 04:10:32.828149	1	1	1	\N	\N
2	288	f	2017-02-23 04:10:32.962518	2017-02-23 04:10:32.962518	2	1	1	\N	\N
3	200	f	2017-02-23 04:10:33.047324	2017-02-23 04:10:33.047324	3	1	1	\N	\N
4	200	f	2017-02-23 04:10:33.119269	2017-02-23 04:10:33.119269	4	1	1	\N	\N
5	288	f	2017-02-23 04:10:33.210981	2017-02-23 04:10:33.210981	1	2	2	\N	\N
6	288	f	2017-02-23 04:10:33.312059	2017-02-23 04:10:33.312059	2	2	2	\N	\N
7	200	f	2017-02-23 04:10:33.400514	2017-02-23 04:10:33.400514	3	2	2	\N	\N
8	200	f	2017-02-23 04:10:33.47276	2017-02-23 04:10:33.47276	4	2	2	\N	\N
9	288	f	2017-02-23 04:10:33.557544	2017-02-23 04:10:33.557544	1	3	3	\N	\N
10	288	f	2017-02-23 04:10:33.658213	2017-02-23 04:10:33.658213	2	3	3	\N	\N
11	200	f	2017-02-23 04:10:33.745974	2017-02-23 04:10:33.745974	3	3	3	\N	\N
12	200	f	2017-02-23 04:10:33.818939	2017-02-23 04:10:33.818939	4	3	3	\N	\N
13	288	f	2017-02-23 04:10:33.942987	2017-02-23 04:10:33.942987	1	4	4	\N	\N
14	288	f	2017-02-23 04:10:34.046332	2017-02-23 04:10:34.046332	2	4	4	\N	\N
15	200	f	2017-02-23 04:10:34.146299	2017-02-23 04:10:34.146299	3	4	4	\N	\N
16	200	f	2017-02-23 04:10:34.22129	2017-02-23 04:10:34.22129	4	4	4	\N	\N
17	288	f	2017-02-23 04:10:34.309713	2017-02-23 04:10:34.309713	1	5	5	\N	\N
18	288	f	2017-02-23 04:10:34.469497	2017-02-23 04:10:34.469497	2	5	5	\N	\N
19	200	f	2017-02-23 04:10:34.57223	2017-02-23 04:10:34.57223	3	5	5	\N	\N
20	200	f	2017-02-23 04:10:34.657059	2017-02-23 04:10:34.657059	4	5	5	\N	\N
21	288	f	2017-02-23 04:10:34.742904	2017-02-23 04:10:34.742904	1	6	6	\N	\N
22	288	f	2017-02-23 04:10:34.847124	2017-02-23 04:10:34.847124	2	6	6	\N	\N
23	200	f	2017-02-23 04:10:34.932606	2017-02-23 04:10:34.932606	3	6	6	\N	\N
24	200	f	2017-02-23 04:10:35.012436	2017-02-23 04:10:35.012436	4	6	6	\N	\N
25	288	f	2017-02-23 04:10:35.101075	2017-02-23 04:10:35.101075	1	7	7	\N	\N
26	288	f	2017-02-23 04:10:35.203778	2017-02-23 04:10:35.203778	2	7	7	\N	\N
27	200	f	2017-02-23 04:10:35.290344	2017-02-23 04:10:35.290344	3	7	7	\N	\N
28	200	f	2017-02-23 04:10:35.36504	2017-02-23 04:10:35.36504	4	7	7	\N	\N
29	288	f	2017-02-23 04:10:35.458216	2017-02-23 04:10:35.458216	1	8	8	\N	\N
30	288	f	2017-02-23 04:10:35.5718	2017-02-23 04:10:35.5718	2	8	8	\N	\N
31	200	f	2017-02-23 04:10:35.666212	2017-02-23 04:10:35.666212	3	8	8	\N	\N
32	200	f	2017-02-23 04:10:35.741535	2017-02-23 04:10:35.741535	4	8	8	\N	\N
33	288	f	2017-02-23 04:10:35.833477	2017-02-23 04:10:35.833477	1	9	9	\N	\N
34	288	f	2017-02-23 04:10:35.934405	2017-02-23 04:10:35.934405	2	9	9	\N	\N
35	200	f	2017-02-23 04:10:36.028905	2017-02-23 04:10:36.028905	3	9	9	\N	\N
36	200	f	2017-02-23 04:10:36.098839	2017-02-23 04:10:36.098839	4	9	9	\N	\N
37	288	f	2017-02-23 04:10:36.189684	2017-02-23 04:10:36.189684	1	10	10	\N	\N
38	288	f	2017-02-23 04:10:36.289357	2017-02-23 04:10:36.289357	2	10	10	\N	\N
39	200	f	2017-02-23 04:10:36.380442	2017-02-23 04:10:36.380442	3	10	10	\N	\N
40	200	f	2017-02-23 04:10:36.45574	2017-02-23 04:10:36.45574	4	10	10	\N	\N
\.


--
-- Name: cuotas_por_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuotas_por_cliente_id_seq', 40, true);


--
-- Data for Name: db_backups; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY db_backups (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: db_backups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('db_backups_id_seq', 1, false);


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY departamentos (id, nombre, created_at, updated_at) FROM stdin;
1	Finanzas	2017-02-23 04:10:19.576599	2017-02-23 04:10:19.576599
2	Recursos Humanos	2017-02-23 04:10:19.604823	2017-02-23 04:10:19.604823
3	Evaluación	2017-02-23 04:10:19.623993	2017-02-23 04:10:19.623993
4	Logística	2017-02-23 04:10:19.648243	2017-02-23 04:10:19.648243
5	Dirección	2017-02-23 04:10:19.671193	2017-02-23 04:10:19.671193
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-02-23 04:10:30.619928	2017-02-23 04:10:30.619928
\.


--
-- Name: descuentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('descuentos_id_seq', 1, true);


--
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY empleados (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: empleados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('empleados_id_seq', 1, false);


--
-- Data for Name: especialidades_de_contacto; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY especialidades_de_contacto (id, nombre, descripcion, created_at, updated_at) FROM stdin;
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 1, false);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-02-23 04:10:30.497573	2017-02-23 04:10:30.497573
2	Doing	f	1	\N	2017-02-23 04:10:30.530165	2017-02-23 04:10:30.530165
3	Done	t	2	\N	2017-02-23 04:10:30.565208	2017-02-23 04:10:30.565208
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-02-23 04:10:21.056725	2017-02-23 04:10:21.056725
2	Incubación	-	1	2017-02-23 04:10:21.083061	2017-02-23 04:10:21.083061
3	post incubacion	-	2	2017-02-23 04:10:21.10305	2017-02-23 04:10:21.10305
4	Cuarta etapa	-	\N	2017-02-23 04:10:21.127499	2017-02-23 04:10:21.127499
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at, contacto_id, persona_id) FROM stdin;
\.


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_id_seq', 1, false);


--
-- Data for Name: eventos_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_proyectos (id, created_at, updated_at, proyecto_id, evento_id) FROM stdin;
\.


--
-- Name: eventos_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_proyectos_id_seq', 1, false);


--
-- Data for Name: historiales; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY historiales (id, "fechaHora", created_at, updated_at, actividad_proyecto_id, estado_id, proyecto_id, user_id) FROM stdin;
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 1, false);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-02-23 04:10:30.685946	2017-02-23 04:10:30.685946
\.


--
-- Name: intereses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('intereses_id_seq', 1, true);


--
-- Data for Name: miembros_equipo; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY miembros_equipo (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: miembros_equipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('miembros_equipo_id_seq', 1, false);


--
-- Data for Name: modelos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY modelos (id, nombre, created_at, updated_at) FROM stdin;
1	Actividad	2017-02-23 04:10:25.014844	2017-02-23 04:10:25.014844
2	Area	2017-02-23 04:10:25.03894	2017-02-23 04:10:25.03894
3	Ciudad	2017-02-23 04:10:25.060846	2017-02-23 04:10:25.060846
4	ConceptoDePago	2017-02-23 04:10:25.082919	2017-02-23 04:10:25.082919
5	Contacto	2017-02-23 04:10:25.104161	2017-02-23 04:10:25.104161
6	Contrato	2017-02-23 04:10:25.127414	2017-02-23 04:10:25.127414
7	Cuenta	2017-02-23 04:10:25.148241	2017-02-23 04:10:25.148241
8	Departamento	2017-02-23 04:10:25.170704	2017-02-23 04:10:25.170704
9	Descuento	2017-02-23 04:10:25.194625	2017-02-23 04:10:25.194625
10	Empleado	2017-02-23 04:10:25.216739	2017-02-23 04:10:25.216739
11	EspecialidadDeContacto	2017-02-23 04:10:25.238907	2017-02-23 04:10:25.238907
12	Estado	2017-02-23 04:10:25.259753	2017-02-23 04:10:25.259753
13	Etapa	2017-02-23 04:10:25.28418	2017-02-23 04:10:25.28418
14	Evento	2017-02-23 04:10:25.304472	2017-02-23 04:10:25.304472
15	EventoProyecto	2017-02-23 04:10:25.332273	2017-02-23 04:10:25.332273
16	MiembroEquipo	2017-02-23 04:10:25.36127	2017-02-23 04:10:25.36127
17	Pago	2017-02-23 04:10:25.383002	2017-02-23 04:10:25.383002
18	Pais	2017-02-23 04:10:25.404426	2017-02-23 04:10:25.404426
19	Provincia	2017-02-23 04:10:25.426185	2017-02-23 04:10:25.426185
20	Proyecto	2017-02-23 04:10:25.448168	2017-02-23 04:10:25.448168
21	Rol	2017-02-23 04:10:25.504191	2017-02-23 04:10:25.504191
22	RolDeEmpleado	2017-02-23 04:10:25.528097	2017-02-23 04:10:25.528097
23	TipoDocumento	2017-02-23 04:10:25.547994	2017-02-23 04:10:25.547994
24	TipoDePago	2017-02-23 04:10:25.570638	2017-02-23 04:10:25.570638
25	User	2017-02-23 04:10:25.593408	2017-02-23 04:10:25.593408
26	ActividadProyecto	2017-02-23 04:10:25.617473	2017-02-23 04:10:25.617473
27	CuotaPorCliente	2017-02-23 04:10:25.639704	2017-02-23 04:10:25.639704
\.


--
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('modelos_id_seq', 27, true);


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos (id, fecha, monto, created_at, updated_at, tipo_de_pago_id, proyecto_id, persona_id, cuenta_id) FROM stdin;
\.


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_id_seq', 1, false);


--
-- Data for Name: pagos_metodos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos_metodos (id, monto, created_at, updated_at, pago_id, tipo_de_pago_id) FROM stdin;
\.


--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_metodos_id_seq', 1, false);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY paises (id, nombre, created_at, updated_at) FROM stdin;
1	Argentina	2017-02-23 04:10:18.999573	2017-02-23 04:10:18.999573
2	Paraguay	2017-02-23 04:10:19.036051	2017-02-23 04:10:19.036051
3	Brasil	2017-02-23 04:10:19.058924	2017-02-23 04:10:19.058924
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-02-23 04:10:25.703318	2017-02-23 04:10:25.703318	1	1
2	2017-02-23 04:10:25.73471	2017-02-23 04:10:25.73471	2	1
3	2017-02-23 04:10:25.757061	2017-02-23 04:10:25.757061	3	1
4	2017-02-23 04:10:25.778384	2017-02-23 04:10:25.778384	4	1
5	2017-02-23 04:10:25.801515	2017-02-23 04:10:25.801515	1	2
6	2017-02-23 04:10:25.822582	2017-02-23 04:10:25.822582	2	2
7	2017-02-23 04:10:25.845939	2017-02-23 04:10:25.845939	3	2
8	2017-02-23 04:10:25.867639	2017-02-23 04:10:25.867639	4	2
9	2017-02-23 04:10:25.889032	2017-02-23 04:10:25.889032	1	3
10	2017-02-23 04:10:25.912142	2017-02-23 04:10:25.912142	2	3
11	2017-02-23 04:10:25.933913	2017-02-23 04:10:25.933913	3	3
12	2017-02-23 04:10:25.956194	2017-02-23 04:10:25.956194	4	3
13	2017-02-23 04:10:25.979201	2017-02-23 04:10:25.979201	1	4
14	2017-02-23 04:10:26.001569	2017-02-23 04:10:26.001569	2	4
15	2017-02-23 04:10:26.022399	2017-02-23 04:10:26.022399	3	4
16	2017-02-23 04:10:26.045953	2017-02-23 04:10:26.045953	4	4
17	2017-02-23 04:10:26.06748	2017-02-23 04:10:26.06748	1	5
18	2017-02-23 04:10:26.090388	2017-02-23 04:10:26.090388	2	5
19	2017-02-23 04:10:26.112139	2017-02-23 04:10:26.112139	3	5
20	2017-02-23 04:10:26.134943	2017-02-23 04:10:26.134943	4	5
21	2017-02-23 04:10:26.1554	2017-02-23 04:10:26.1554	1	6
22	2017-02-23 04:10:26.178401	2017-02-23 04:10:26.178401	2	6
23	2017-02-23 04:10:26.201537	2017-02-23 04:10:26.201537	3	6
24	2017-02-23 04:10:26.222375	2017-02-23 04:10:26.222375	4	6
25	2017-02-23 04:10:26.244778	2017-02-23 04:10:26.244778	1	7
26	2017-02-23 04:10:26.267932	2017-02-23 04:10:26.267932	2	7
27	2017-02-23 04:10:26.290328	2017-02-23 04:10:26.290328	3	7
28	2017-02-23 04:10:26.312345	2017-02-23 04:10:26.312345	4	7
29	2017-02-23 04:10:26.333719	2017-02-23 04:10:26.333719	1	8
30	2017-02-23 04:10:26.357042	2017-02-23 04:10:26.357042	2	8
31	2017-02-23 04:10:26.379192	2017-02-23 04:10:26.379192	3	8
32	2017-02-23 04:10:26.401418	2017-02-23 04:10:26.401418	4	8
33	2017-02-23 04:10:26.422468	2017-02-23 04:10:26.422468	1	9
34	2017-02-23 04:10:26.446135	2017-02-23 04:10:26.446135	2	9
35	2017-02-23 04:10:26.467379	2017-02-23 04:10:26.467379	3	9
36	2017-02-23 04:10:26.490511	2017-02-23 04:10:26.490511	4	9
37	2017-02-23 04:10:26.512627	2017-02-23 04:10:26.512627	1	10
38	2017-02-23 04:10:26.534366	2017-02-23 04:10:26.534366	2	10
39	2017-02-23 04:10:26.556917	2017-02-23 04:10:26.556917	3	10
40	2017-02-23 04:10:26.578828	2017-02-23 04:10:26.578828	4	10
41	2017-02-23 04:10:26.601512	2017-02-23 04:10:26.601512	1	11
42	2017-02-23 04:10:26.622661	2017-02-23 04:10:26.622661	2	11
43	2017-02-23 04:10:26.644759	2017-02-23 04:10:26.644759	3	11
44	2017-02-23 04:10:26.667624	2017-02-23 04:10:26.667624	4	11
45	2017-02-23 04:10:26.690666	2017-02-23 04:10:26.690666	1	12
46	2017-02-23 04:10:26.712797	2017-02-23 04:10:26.712797	2	12
47	2017-02-23 04:10:26.734884	2017-02-23 04:10:26.734884	3	12
48	2017-02-23 04:10:26.778449	2017-02-23 04:10:26.778449	4	12
49	2017-02-23 04:10:26.800893	2017-02-23 04:10:26.800893	1	13
50	2017-02-23 04:10:26.824033	2017-02-23 04:10:26.824033	2	13
51	2017-02-23 04:10:26.845099	2017-02-23 04:10:26.845099	3	13
52	2017-02-23 04:10:26.868234	2017-02-23 04:10:26.868234	4	13
53	2017-02-23 04:10:26.888943	2017-02-23 04:10:26.888943	1	14
54	2017-02-23 04:10:26.912412	2017-02-23 04:10:26.912412	2	14
55	2017-02-23 04:10:26.934571	2017-02-23 04:10:26.934571	3	14
56	2017-02-23 04:10:26.957109	2017-02-23 04:10:26.957109	4	14
57	2017-02-23 04:10:26.978691	2017-02-23 04:10:26.978691	1	15
58	2017-02-23 04:10:27.000598	2017-02-23 04:10:27.000598	2	15
59	2017-02-23 04:10:27.023326	2017-02-23 04:10:27.023326	3	15
60	2017-02-23 04:10:27.044975	2017-02-23 04:10:27.044975	4	15
61	2017-02-23 04:10:27.068449	2017-02-23 04:10:27.068449	1	16
62	2017-02-23 04:10:27.090598	2017-02-23 04:10:27.090598	2	16
63	2017-02-23 04:10:27.112812	2017-02-23 04:10:27.112812	3	16
64	2017-02-23 04:10:27.134499	2017-02-23 04:10:27.134499	4	16
65	2017-02-23 04:10:27.157475	2017-02-23 04:10:27.157475	1	17
66	2017-02-23 04:10:27.178951	2017-02-23 04:10:27.178951	2	17
67	2017-02-23 04:10:27.202046	2017-02-23 04:10:27.202046	3	17
68	2017-02-23 04:10:27.324229	2017-02-23 04:10:27.324229	4	17
69	2017-02-23 04:10:27.368397	2017-02-23 04:10:27.368397	1	18
70	2017-02-23 04:10:27.389515	2017-02-23 04:10:27.389515	2	18
71	2017-02-23 04:10:27.412569	2017-02-23 04:10:27.412569	3	18
72	2017-02-23 04:10:27.43441	2017-02-23 04:10:27.43441	4	18
73	2017-02-23 04:10:27.457405	2017-02-23 04:10:27.457405	1	19
74	2017-02-23 04:10:27.478933	2017-02-23 04:10:27.478933	2	19
75	2017-02-23 04:10:27.502125	2017-02-23 04:10:27.502125	3	19
76	2017-02-23 04:10:27.522845	2017-02-23 04:10:27.522845	4	19
77	2017-02-23 04:10:27.54635	2017-02-23 04:10:27.54635	1	20
78	2017-02-23 04:10:27.568137	2017-02-23 04:10:27.568137	2	20
79	2017-02-23 04:10:27.590803	2017-02-23 04:10:27.590803	3	20
80	2017-02-23 04:10:27.612856	2017-02-23 04:10:27.612856	4	20
81	2017-02-23 04:10:27.634201	2017-02-23 04:10:27.634201	1	21
82	2017-02-23 04:10:27.656288	2017-02-23 04:10:27.656288	2	21
83	2017-02-23 04:10:27.679683	2017-02-23 04:10:27.679683	3	21
84	2017-02-23 04:10:27.700355	2017-02-23 04:10:27.700355	4	21
85	2017-02-23 04:10:27.724071	2017-02-23 04:10:27.724071	1	22
86	2017-02-23 04:10:27.746417	2017-02-23 04:10:27.746417	2	22
87	2017-02-23 04:10:27.768536	2017-02-23 04:10:27.768536	3	22
88	2017-02-23 04:10:27.789777	2017-02-23 04:10:27.789777	4	22
89	2017-02-23 04:10:27.813055	2017-02-23 04:10:27.813055	1	23
90	2017-02-23 04:10:27.834484	2017-02-23 04:10:27.834484	2	23
91	2017-02-23 04:10:27.85746	2017-02-23 04:10:27.85746	3	23
92	2017-02-23 04:10:27.878629	2017-02-23 04:10:27.878629	4	23
93	2017-02-23 04:10:27.901994	2017-02-23 04:10:27.901994	1	24
94	2017-02-23 04:10:27.923496	2017-02-23 04:10:27.923496	2	24
95	2017-02-23 04:10:27.945039	2017-02-23 04:10:27.945039	3	24
96	2017-02-23 04:10:27.967825	2017-02-23 04:10:27.967825	4	24
97	2017-02-23 04:10:27.990019	2017-02-23 04:10:27.990019	1	25
98	2017-02-23 04:10:28.01333	2017-02-23 04:10:28.01333	2	25
99	2017-02-23 04:10:28.034917	2017-02-23 04:10:28.034917	3	25
100	2017-02-23 04:10:28.057666	2017-02-23 04:10:28.057666	4	25
101	2017-02-23 04:10:28.078596	2017-02-23 04:10:28.078596	5	20
102	2017-02-23 04:10:28.101741	2017-02-23 04:10:28.101741	6	1
103	2017-02-23 04:10:28.124284	2017-02-23 04:10:28.124284	6	2
104	2017-02-23 04:10:28.145351	2017-02-23 04:10:28.145351	6	3
105	2017-02-23 04:10:28.168032	2017-02-23 04:10:28.168032	6	4
106	2017-02-23 04:10:28.191128	2017-02-23 04:10:28.191128	6	5
107	2017-02-23 04:10:28.213006	2017-02-23 04:10:28.213006	6	6
108	2017-02-23 04:10:28.234854	2017-02-23 04:10:28.234854	6	7
109	2017-02-23 04:10:28.257877	2017-02-23 04:10:28.257877	6	8
110	2017-02-23 04:10:28.279407	2017-02-23 04:10:28.279407	6	9
111	2017-02-23 04:10:28.300807	2017-02-23 04:10:28.300807	6	10
112	2017-02-23 04:10:28.323509	2017-02-23 04:10:28.323509	6	11
113	2017-02-23 04:10:28.345374	2017-02-23 04:10:28.345374	6	12
114	2017-02-23 04:10:28.368604	2017-02-23 04:10:28.368604	6	13
115	2017-02-23 04:10:28.390767	2017-02-23 04:10:28.390767	6	14
116	2017-02-23 04:10:28.413349	2017-02-23 04:10:28.413349	6	15
117	2017-02-23 04:10:28.435394	2017-02-23 04:10:28.435394	6	16
118	2017-02-23 04:10:28.456619	2017-02-23 04:10:28.456619	6	17
119	2017-02-23 04:10:28.47868	2017-02-23 04:10:28.47868	6	18
120	2017-02-23 04:10:28.501105	2017-02-23 04:10:28.501105	6	19
121	2017-02-23 04:10:28.52419	2017-02-23 04:10:28.52419	6	20
122	2017-02-23 04:10:28.546022	2017-02-23 04:10:28.546022	6	21
123	2017-02-23 04:10:28.569231	2017-02-23 04:10:28.569231	6	22
124	2017-02-23 04:10:28.590731	2017-02-23 04:10:28.590731	6	23
125	2017-02-23 04:10:28.612274	2017-02-23 04:10:28.612274	6	24
126	2017-02-23 04:10:28.634773	2017-02-23 04:10:28.634773	6	25
127	2017-02-23 04:10:28.656746	2017-02-23 04:10:28.656746	2	26
128	2017-02-23 04:10:28.67879	2017-02-23 04:10:28.67879	4	26
129	2017-02-23 04:10:28.702235	2017-02-23 04:10:28.702235	6	26
130	2017-02-23 04:10:28.724581	2017-02-23 04:10:28.724581	5	17
131	2017-02-23 04:10:28.745657	2017-02-23 04:10:28.745657	5	14
132	2017-02-23 04:10:28.769223	2017-02-23 04:10:28.769223	5	6
133	2017-02-23 04:10:28.790263	2017-02-23 04:10:28.790263	1	27
134	2017-02-23 04:10:28.813415	2017-02-23 04:10:28.813415	3	27
135	2017-02-23 04:10:28.835474	2017-02-23 04:10:28.835474	4	27
136	2017-02-23 04:10:28.857635	2017-02-23 04:10:28.857635	5	27
137	2017-02-23 04:10:28.87901	2017-02-23 04:10:28.87901	6	27
138	2017-02-23 04:10:28.902231	2017-02-23 04:10:28.902231	7	20
\.


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('permisos_id_seq', 138, true);


--
-- Data for Name: permisos_roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos_roles (permiso_id, rol_id) FROM stdin;
77	3
78	3
79	3
80	3
101	3
80	4
101	4
121	3
37	1
38	1
39	1
40	1
111	1
77	1
78	1
79	1
80	1
101	1
121	1
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas (id, codigo, nombre, apellido, "nroIdentificacion", "fechaNacimiento", calle, "nroDomicilio", piso, dpto, telefono, email, type, created_at, updated_at, pais_id, provincia_id, ciudad_id, tipo_documento_id, departamento_id, especialidad_de_contacto_id, area_id, rol_de_empleado_id) FROM stdin;
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	2017-02-23 04:10:20.063618	2017-02-23 04:10:20.063618	1	1	1	1	5	\N	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	2017-02-23 04:10:20.109779	2017-02-23 04:10:20.109779	1	1	1	1	4	\N	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	2017-02-23 04:10:20.143123	2017-02-23 04:10:20.143123	1	1	1	1	3	\N	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	2017-02-23 04:10:20.176557	2017-02-23 04:10:20.176557	1	1	1	1	2	\N	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	2017-02-23 04:10:20.21462	2017-02-23 04:10:20.21462	1	1	1	1	1	\N	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	2017-02-23 04:10:20.257247	2017-02-23 04:10:20.257247	1	1	1	1	4	\N	\N	7
7	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	2017-02-23 04:10:20.339409	2017-02-23 04:10:20.339409	1	1	2	2	\N	\N	1	\N
8	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	2017-02-23 04:10:20.379544	2017-02-23 04:10:20.379544	1	1	2	1	\N	\N	1	\N
9	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	2017-02-23 04:10:20.409016	2017-02-23 04:10:20.409016	1	1	2	1	\N	\N	1	\N
10	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	2017-02-23 04:10:20.443399	2017-02-23 04:10:20.443399	1	1	2	1	\N	\N	1	\N
11	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	2017-02-23 04:10:20.47664	2017-02-23 04:10:20.47664	1	1	2	1	\N	\N	1	\N
12	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	2017-02-23 04:10:20.512433	2017-02-23 04:10:20.512433	1	1	2	2	\N	\N	1	\N
13	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	2017-02-23 04:10:20.547732	2017-02-23 04:10:20.547732	1	1	2	1	\N	\N	1	\N
14	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	2017-02-23 04:10:20.576977	2017-02-23 04:10:20.576977	1	1	2	1	\N	\N	1	\N
15	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	2017-02-23 04:10:20.60972	2017-02-23 04:10:20.60972	1	1	2	1	\N	\N	1	\N
16	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	2017-02-23 04:10:20.645521	2017-02-23 04:10:20.645521	1	1	2	2	\N	\N	1	\N
17	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	2017-02-23 04:10:20.679821	2017-02-23 04:10:20.679821	1	1	2	1	\N	\N	1	\N
18	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	2017-02-23 04:10:20.724911	2017-02-23 04:10:20.724911	1	1	2	1	\N	\N	1	\N
19	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	2017-02-23 04:10:20.754673	2017-02-23 04:10:20.754673	1	1	2	1	\N	\N	1	\N
20	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	2017-02-23 04:10:20.789327	2017-02-23 04:10:20.789327	1	1	2	2	\N	\N	1	\N
21	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	2017-02-23 04:10:20.823326	2017-02-23 04:10:20.823326	1	1	2	1	\N	\N	1	\N
22	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	2017-02-23 04:10:20.85385	2017-02-23 04:10:20.85385	1	1	2	1	\N	\N	1	\N
23	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	2017-02-23 04:10:20.888613	2017-02-23 04:10:20.888613	1	1	2	1	\N	\N	1	\N
24	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	2017-02-23 04:10:20.921798	2017-02-23 04:10:20.921798	1	1	2	2	\N	\N	1	\N
25	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	2017-02-23 04:10:20.956948	2017-02-23 04:10:20.956948	1	1	2	1	\N	\N	1	\N
26	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	2017-02-23 04:10:20.990333	2017-02-23 04:10:20.990333	1	1	2	1	\N	\N	1	\N
\.


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 26, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-02-23 04:10:22.546363	2017-02-23 04:10:22.546363	1	7
2	2017-02-23 04:10:22.577331	2017-02-23 04:10:22.577331	1	2
3	2017-02-23 04:10:22.599555	2017-02-23 04:10:22.599555	2	2
4	2017-02-23 04:10:22.62148	2017-02-23 04:10:22.62148	2	8
5	2017-02-23 04:10:22.644481	2017-02-23 04:10:22.644481	2	9
6	2017-02-23 04:10:22.666616	2017-02-23 04:10:22.666616	3	6
7	2017-02-23 04:10:22.689261	2017-02-23 04:10:22.689261	3	10
8	2017-02-23 04:10:22.710719	2017-02-23 04:10:22.710719	3	11
9	2017-02-23 04:10:22.732271	2017-02-23 04:10:22.732271	4	6
10	2017-02-23 04:10:22.755189	2017-02-23 04:10:22.755189	4	12
11	2017-02-23 04:10:22.778153	2017-02-23 04:10:22.778153	4	13
12	2017-02-23 04:10:22.799958	2017-02-23 04:10:22.799958	5	2
13	2017-02-23 04:10:22.821812	2017-02-23 04:10:22.821812	5	14
14	2017-02-23 04:10:22.844569	2017-02-23 04:10:22.844569	5	15
15	2017-02-23 04:10:22.867484	2017-02-23 04:10:22.867484	6	2
16	2017-02-23 04:10:22.888828	2017-02-23 04:10:22.888828	6	16
17	2017-02-23 04:10:22.911695	2017-02-23 04:10:22.911695	6	17
18	2017-02-23 04:10:22.933664	2017-02-23 04:10:22.933664	6	19
19	2017-02-23 04:10:22.95518	2017-02-23 04:10:22.95518	7	6
20	2017-02-23 04:10:22.976766	2017-02-23 04:10:22.976766	7	18
21	2017-02-23 04:10:22.99973	2017-02-23 04:10:22.99973	7	20
22	2017-02-23 04:10:23.02306	2017-02-23 04:10:23.02306	8	2
23	2017-02-23 04:10:23.044552	2017-02-23 04:10:23.044552	8	21
24	2017-02-23 04:10:23.066341	2017-02-23 04:10:23.066341	9	6
25	2017-02-23 04:10:23.089078	2017-02-23 04:10:23.089078	9	22
26	2017-02-23 04:10:23.110508	2017-02-23 04:10:23.110508	9	23
27	2017-02-23 04:10:23.134179	2017-02-23 04:10:23.134179	10	2
28	2017-02-23 04:10:23.155177	2017-02-23 04:10:23.155177	10	24
29	2017-02-23 04:10:23.17674	2017-02-23 04:10:23.17674	10	25
30	2017-02-23 04:10:23.200341	2017-02-23 04:10:23.200341	10	26
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 30, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-02-23 04:10:19.120542	2017-02-23 04:10:19.120542	1
2	Corrientes	2017-02-23 04:10:19.149705	2017-02-23 04:10:19.149705	1
3	Itapúa	2017-02-23 04:10:19.170466	2017-02-23 04:10:19.170466	2
4	Bahia	2017-02-23 04:10:19.194093	2017-02-23 04:10:19.194093	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-02-23 04:10:21.636122	2017-02-23 04:10:21.636122	1	1	1	1	1
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-02-23 04:10:21.839619	2017-02-23 04:10:21.839619	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-02-23 04:10:21.920753	2017-02-23 04:10:21.920753	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-02-23 04:10:21.997786	2017-02-23 04:10:21.997786	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-02-23 04:10:22.07477	2017-02-23 04:10:22.07477	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-02-23 04:10:22.152892	2017-02-23 04:10:22.152892	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-02-23 04:10:22.227438	2017-02-23 04:10:22.227438	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-02-23 04:10:22.294901	2017-02-23 04:10:22.294901	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-02-23 04:10:22.364789	2017-02-23 04:10:22.364789	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-02-23 04:10:22.427906	2017-02-23 04:10:22.427906	1	1	1	1	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 10, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-02-23 04:10:28.963986	2017-02-23 04:10:28.963986
2	super_admin	2017-02-23 04:10:29.013329	2017-02-23 04:10:29.013329
3	Encargado de Proyectos (mentor)	2017-02-23 04:10:29.034389	2017-02-23 04:10:29.034389
4	Miembro de Equipo	2017-02-23 04:10:29.0566	2017-02-23 04:10:29.0566
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-02-23 04:10:19.728675	2017-02-23 04:10:19.728675	1
2	Encargado de recaudaciones e ingresos	2017-02-23 04:10:19.757861	2017-02-23 04:10:19.757861	1
3	Jefe de Recursos Humanos	2017-02-23 04:10:19.782929	2017-02-23 04:10:19.782929	2
4	Jefe de mercadeo	2017-02-23 04:10:19.802776	2017-02-23 04:10:19.802776	3
5	jefe de producción	2017-02-23 04:10:19.826934	2017-02-23 04:10:19.826934	3
6	Investigación y desarrollo	2017-02-23 04:10:19.860617	2017-02-23 04:10:19.860617	4
7	Capacitación - Mentoring	2017-02-23 04:10:19.880829	2017-02-23 04:10:19.880829	4
8	Director General	2017-02-23 04:10:19.903115	2017-02-23 04:10:19.903115	5
\.


--
-- Name: roles_de_empleados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('roles_de_empleados_id_seq', 8, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('roles_id_seq', 4, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY schema_migrations (version) FROM stdin;
20161009233323
20161011214708
20161015144816
20161015144938
20161015144958
20161015145854
20161015145908
20161015150725
20161015201011
20161015201014
20161015201030
20161015201716
20161015202247
20161015203654
20161015210022
20161015210153
20161015210324
20161017171956
20161017171959
20161017172002
20161017213659
20161019183003
20161022200209
20161022201237
20161022201302
20161024210720
20161024210838
20161024210908
20161024231324
20161025222205
20161025222210
20161025223114
20161025223117
20161026005622
20161026005626
20161026005631
20161026005902
20161026005907
20161026124258
20161026124310
20161108182849
20161108182908
20161108183035
20161108194433
20161114023051
20161115005710
20161115040317
20161115042914
20161115042918
20161119232521
20161120062842
20161121043636
20161122023440
20161122023733
20161122023738
20161122024317
20161123040110
20161123083450
20161123083454
20161205072019
20161205073140
20161205073154
20161205073159
20170117183346
20170117183351
20170117183355
20170117183416
20170119182932
20170119182937
20170125204044
20170126203817
20170126222906
20170131051756
20170131055911
20170131055914
20170131055918
20170131055922
20170204063745
20170204063809
20170204063912
20170204194430
20170204194448
20170207033921
20170213202210
20170213202359
20170214004235
20170215194229
20170215214353
20170215215231
20170215215248
20170215215252
20170215215256
20170215215300
20170217035106
20170218172754
20170219065311
20170220221623
20170221123343
\.


--
-- Data for Name: systemsettings; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY systemsettings (id, tipo_de_pago_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, false);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-02-23 04:10:19.500985	2017-02-23 04:10:19.500985
2	Libreta de Enrolamiento	2017-02-23 04:10:19.526528	2017-02-23 04:10:19.526528
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-02-23 04:10:30.751128	2017-02-23 04:10:30.751128
2	Saldo de cuenta	2017-02-23 04:10:30.774028	2017-02-23 04:10:30.774028
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-02-23 04:10:30.165047	2017-02-23 04:10:30.165047	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-02-23 04:10:30.42595	2017-02-23 04:10:30.42595	2	1
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	1	2017-02-23 04:43:28.67752	2017-02-23 04:43:28.67752	127.0.0.1	127.0.0.1	2017-02-23 04:10:29.914718	2017-02-23 04:43:28.681934	1	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-02-23 04:10:31.57088	2017-02-23 04:10:31.57088	1	1
2	2017-01-20	2017-02-23 04:10:31.591123	2017-02-23 04:10:31.591123	1	1
3	2017-02-10	2017-02-23 04:10:31.613398	2017-02-23 04:10:31.613398	2	1
4	2017-02-20	2017-02-23 04:10:31.634518	2017-02-23 04:10:31.634518	2	1
5	2017-03-10	2017-02-23 04:10:31.657242	2017-02-23 04:10:31.657242	3	1
6	2017-03-20	2017-02-23 04:10:31.680146	2017-02-23 04:10:31.680146	3	1
7	2017-04-10	2017-02-23 04:10:31.701472	2017-02-23 04:10:31.701472	4	1
8	2017-04-20	2017-02-23 04:10:31.724976	2017-02-23 04:10:31.724976	4	1
9	2017-05-10	2017-02-23 04:10:31.74698	2017-02-23 04:10:31.74698	5	1
10	2017-05-20	2017-02-23 04:10:31.769307	2017-02-23 04:10:31.769307	5	1
11	2017-06-10	2017-02-23 04:10:31.790867	2017-02-23 04:10:31.790867	6	1
12	2017-06-20	2017-02-23 04:10:31.813852	2017-02-23 04:10:31.813852	6	1
13	2017-07-10	2017-02-23 04:10:31.834675	2017-02-23 04:10:31.834675	7	1
14	2017-07-10	2017-02-23 04:10:31.858371	2017-02-23 04:10:31.858371	7	1
15	2017-08-10	2017-02-23 04:10:31.880341	2017-02-23 04:10:31.880341	8	1
16	2017-08-10	2017-02-23 04:10:31.901688	2017-02-23 04:10:31.901688	8	1
17	2017-09-10	2017-02-23 04:10:31.924759	2017-02-23 04:10:31.924759	9	1
18	2017-09-20	2017-02-23 04:10:31.946179	2017-02-23 04:10:31.946179	9	1
19	2017-10-10	2017-02-23 04:10:31.969377	2017-02-23 04:10:31.969377	10	1
20	2017-10-20	2017-02-23 04:10:31.990281	2017-02-23 04:10:31.990281	10	1
21	2017-11-10	2017-02-23 04:10:32.01405	2017-02-23 04:10:32.01405	11	1
22	2017-11-20	2017-02-23 04:10:32.036101	2017-02-23 04:10:32.036101	11	1
23	2017-12-10	2017-02-23 04:10:32.056995	2017-02-23 04:10:32.056995	12	1
24	2017-12-10	2017-02-23 04:10:32.079847	2017-02-23 04:10:32.079847	12	1
\.


--
-- Name: vencimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('vencimientos_id_seq', 24, true);


--
-- Name: acciones_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY acciones
    ADD CONSTRAINT acciones_pkey PRIMARY KEY (id);


--
-- Name: actividades_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY actividades
    ADD CONSTRAINT actividades_pkey PRIMARY KEY (id);


--
-- Name: actividades_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY actividades_proyectos
    ADD CONSTRAINT actividades_proyectos_pkey PRIMARY KEY (id);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: audits_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id);


--
-- Name: conceptos_de_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY conceptos_de_pago
    ADD CONSTRAINT conceptos_de_pago_pkey PRIMARY KEY (id);


--
-- Name: configuraciones_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT configuraciones_pkey PRIMARY KEY (id);


--
-- Name: contactos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY contactos
    ADD CONSTRAINT contactos_pkey PRIMARY KEY (id);


--
-- Name: contratos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (id);


--
-- Name: cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id);


--
-- Name: cuotas_por_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY cuotas_por_cliente
    ADD CONSTRAINT cuotas_por_cliente_pkey PRIMARY KEY (id);


--
-- Name: db_backups_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY db_backups
    ADD CONSTRAINT db_backups_pkey PRIMARY KEY (id);


--
-- Name: departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- Name: descuentos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY descuentos
    ADD CONSTRAINT descuentos_pkey PRIMARY KEY (id);


--
-- Name: empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id);


--
-- Name: especialidades_de_contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY especialidades_de_contacto
    ADD CONSTRAINT especialidades_de_contacto_pkey PRIMARY KEY (id);


--
-- Name: estados_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: etapas_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY etapas
    ADD CONSTRAINT etapas_pkey PRIMARY KEY (id);


--
-- Name: eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: eventos_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY eventos_proyectos
    ADD CONSTRAINT eventos_proyectos_pkey PRIMARY KEY (id);


--
-- Name: historiales_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT historiales_pkey PRIMARY KEY (id);


--
-- Name: intereses_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY intereses
    ADD CONSTRAINT intereses_pkey PRIMARY KEY (id);


--
-- Name: miembros_equipo_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY miembros_equipo
    ADD CONSTRAINT miembros_equipo_pkey PRIMARY KEY (id);


--
-- Name: modelos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY modelos
    ADD CONSTRAINT modelos_pkey PRIMARY KEY (id);


--
-- Name: pagos_metodos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY pagos_metodos
    ADD CONSTRAINT pagos_metodos_pkey PRIMARY KEY (id);


--
-- Name: pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);


--
-- Name: paises_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- Name: permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT permisos_pkey PRIMARY KEY (id);


--
-- Name: personas_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- Name: personas_proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY personas_proyectos
    ADD CONSTRAINT personas_proyectos_pkey PRIMARY KEY (id);


--
-- Name: provincias_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (id);


--
-- Name: proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id);


--
-- Name: roles_de_empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY roles_de_empleados
    ADD CONSTRAINT roles_de_empleados_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: systemsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY systemsettings
    ADD CONSTRAINT systemsettings_pkey PRIMARY KEY (id);


--
-- Name: tipo_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY tipo_documentos
    ADD CONSTRAINT tipo_documentos_pkey PRIMARY KEY (id);


--
-- Name: tipos_de_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY tipos_de_pago
    ADD CONSTRAINT tipos_de_pago_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vencimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY vencimientos
    ADD CONSTRAINT vencimientos_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX associated_index ON audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX auditable_index ON audits USING btree (auditable_id, auditable_type);


--
-- Name: index_actividades_on_etapa_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_actividades_on_etapa_id ON actividades USING btree (etapa_id);


--
-- Name: index_actividades_proyectos_on_actividad_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_actividades_proyectos_on_actividad_id ON actividades_proyectos USING btree (actividad_id);


--
-- Name: index_actividades_proyectos_on_estado_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_actividades_proyectos_on_estado_id ON actividades_proyectos USING btree (estado_id);


--
-- Name: index_actividades_proyectos_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_actividades_proyectos_on_proyecto_id ON actividades_proyectos USING btree (proyecto_id);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_audits_on_created_at ON audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_audits_on_request_uuid ON audits USING btree (request_uuid);


--
-- Name: index_ciudades_on_pais_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_ciudades_on_pais_id ON ciudades USING btree (pais_id);


--
-- Name: index_ciudades_on_provincia_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_ciudades_on_provincia_id ON ciudades USING btree (provincia_id);


--
-- Name: index_configuraciones_on_area_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_configuraciones_on_area_id ON configuraciones USING btree (area_id);


--
-- Name: index_configuraciones_on_ciudad_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_configuraciones_on_ciudad_id ON configuraciones USING btree (ciudad_id);


--
-- Name: index_configuraciones_on_pais_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_configuraciones_on_pais_id ON configuraciones USING btree (pais_id);


--
-- Name: index_configuraciones_on_provincia_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_configuraciones_on_provincia_id ON configuraciones USING btree (provincia_id);


--
-- Name: index_contratos_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_contratos_on_persona_id ON contratos USING btree (persona_id);


--
-- Name: index_contratos_on_persona_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_contratos_on_persona_proyecto_id ON contratos USING btree (persona_proyecto_id);


--
-- Name: index_contratos_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_contratos_on_proyecto_id ON contratos USING btree (proyecto_id);


--
-- Name: index_cuentas_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_cuentas_on_proyecto_id ON cuentas USING btree (proyecto_id);


--
-- Name: index_cuotas_por_cliente_on_concepto_de_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_cuotas_por_cliente_on_concepto_de_pago_id ON cuotas_por_cliente USING btree (concepto_de_pago_id);


--
-- Name: index_cuotas_por_cliente_on_contrato_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_cuotas_por_cliente_on_contrato_id ON cuotas_por_cliente USING btree (contrato_id);


--
-- Name: index_cuotas_por_cliente_on_descuento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_cuotas_por_cliente_on_descuento_id ON cuotas_por_cliente USING btree (descuento_id);


--
-- Name: index_cuotas_por_cliente_on_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_cuotas_por_cliente_on_pago_id ON cuotas_por_cliente USING btree (pago_id);


--
-- Name: index_cuotas_por_cliente_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_cuotas_por_cliente_on_proyecto_id ON cuotas_por_cliente USING btree (proyecto_id);


--
-- Name: index_eventos_on_contacto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_eventos_on_contacto_id ON eventos USING btree (contacto_id);


--
-- Name: index_eventos_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_eventos_on_persona_id ON eventos USING btree (persona_id);


--
-- Name: index_eventos_proyectos_on_evento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_eventos_proyectos_on_evento_id ON eventos_proyectos USING btree (evento_id);


--
-- Name: index_eventos_proyectos_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_eventos_proyectos_on_proyecto_id ON eventos_proyectos USING btree (proyecto_id);


--
-- Name: index_historiales_on_actividad_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_historiales_on_actividad_proyecto_id ON historiales USING btree (actividad_proyecto_id);


--
-- Name: index_historiales_on_estado_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_historiales_on_estado_id ON historiales USING btree (estado_id);


--
-- Name: index_historiales_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_historiales_on_proyecto_id ON historiales USING btree (proyecto_id);


--
-- Name: index_historiales_on_user_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_historiales_on_user_id ON historiales USING btree (user_id);


--
-- Name: index_pagos_metodos_on_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_metodos_on_pago_id ON pagos_metodos USING btree (pago_id);


--
-- Name: index_pagos_metodos_on_tipo_de_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_metodos_on_tipo_de_pago_id ON pagos_metodos USING btree (tipo_de_pago_id);


--
-- Name: index_pagos_on_cuenta_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_on_cuenta_id ON pagos USING btree (cuenta_id);


--
-- Name: index_pagos_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_on_persona_id ON pagos USING btree (persona_id);


--
-- Name: index_pagos_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_on_proyecto_id ON pagos USING btree (proyecto_id);


--
-- Name: index_pagos_on_tipo_de_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_on_tipo_de_pago_id ON pagos USING btree (tipo_de_pago_id);


--
-- Name: index_permisos_on_accion_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_permisos_on_accion_id ON permisos USING btree (accion_id);


--
-- Name: index_permisos_on_modelo_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_permisos_on_modelo_id ON permisos USING btree (modelo_id);


--
-- Name: index_permisos_roles_on_permiso_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_permisos_roles_on_permiso_id ON permisos_roles USING btree (permiso_id);


--
-- Name: index_permisos_roles_on_rol_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_permisos_roles_on_rol_id ON permisos_roles USING btree (rol_id);


--
-- Name: index_personas_on_area_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_area_id ON personas USING btree (area_id);


--
-- Name: index_personas_on_ciudad_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_ciudad_id ON personas USING btree (ciudad_id);


--
-- Name: index_personas_on_departamento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_departamento_id ON personas USING btree (departamento_id);


--
-- Name: index_personas_on_especialidad_de_contacto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_especialidad_de_contacto_id ON personas USING btree (especialidad_de_contacto_id);


--
-- Name: index_personas_on_pais_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_pais_id ON personas USING btree (pais_id);


--
-- Name: index_personas_on_provincia_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_provincia_id ON personas USING btree (provincia_id);


--
-- Name: index_personas_on_rol_de_empleado_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_rol_de_empleado_id ON personas USING btree (rol_de_empleado_id);


--
-- Name: index_personas_on_tipo_documento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_on_tipo_documento_id ON personas USING btree (tipo_documento_id);


--
-- Name: index_personas_proyectos_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_proyectos_on_persona_id ON personas_proyectos USING btree (persona_id);


--
-- Name: index_personas_proyectos_on_proyecto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_proyectos_on_proyecto_id ON personas_proyectos USING btree (proyecto_id);


--
-- Name: index_provincias_on_pais_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_provincias_on_pais_id ON provincias USING btree (pais_id);


--
-- Name: index_proyectos_on_area_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_proyectos_on_area_id ON proyectos USING btree (area_id);


--
-- Name: index_proyectos_on_ciudad_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_proyectos_on_ciudad_id ON proyectos USING btree (ciudad_id);


--
-- Name: index_proyectos_on_etapa_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_proyectos_on_etapa_id ON proyectos USING btree (etapa_id);


--
-- Name: index_proyectos_on_pais_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_proyectos_on_pais_id ON proyectos USING btree (pais_id);


--
-- Name: index_proyectos_on_provincia_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_proyectos_on_provincia_id ON proyectos USING btree (provincia_id);


--
-- Name: index_roles_de_empleados_on_departamento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_roles_de_empleados_on_departamento_id ON roles_de_empleados USING btree (departamento_id);


--
-- Name: index_systemsettings_on_tipo_de_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_systemsettings_on_tipo_de_pago_id ON systemsettings USING btree (tipo_de_pago_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_users_on_persona_id ON users USING btree (persona_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_rol_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_users_on_rol_id ON users USING btree (rol_id);


--
-- Name: index_vencimientos_on_concepto_de_pago_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_vencimientos_on_concepto_de_pago_id ON vencimientos USING btree (concepto_de_pago_id);


--
-- Name: index_vencimientos_on_interes_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_vencimientos_on_interes_id ON vencimientos USING btree (interes_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX user_index ON audits USING btree (user_id, user_type);


--
-- Name: fk_rails_03cee5ca1f; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT fk_rails_03cee5ca1f FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: fk_rails_1797a78ccf; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos_proyectos
    ADD CONSTRAINT fk_rails_1797a78ccf FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_18a6d88f99; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuotas_por_cliente
    ADD CONSTRAINT fk_rails_18a6d88f99 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_195f8caa9c; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT fk_rails_195f8caa9c FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- Name: fk_rails_1a0f507917; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_rails_1a0f507917 FOREIGN KEY (ciudad_id) REFERENCES ciudades(id);


--
-- Name: fk_rails_1f5cadf567; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos_metodos
    ADD CONSTRAINT fk_rails_1f5cadf567 FOREIGN KEY (tipo_de_pago_id) REFERENCES tipos_de_pago(id);


--
-- Name: fk_rails_20dba3878d; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT fk_rails_20dba3878d FOREIGN KEY (accion_id) REFERENCES acciones(id);


--
-- Name: fk_rails_27f90b2015; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT fk_rails_27f90b2015 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_282b30ddc1; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY systemsettings
    ADD CONSTRAINT fk_rails_282b30ddc1 FOREIGN KEY (tipo_de_pago_id) REFERENCES tipos_de_pago(id);


--
-- Name: fk_rails_320259023e; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos_metodos
    ADD CONSTRAINT fk_rails_320259023e FOREIGN KEY (pago_id) REFERENCES pagos(id);


--
-- Name: fk_rails_352f8f25d4; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT fk_rails_352f8f25d4 FOREIGN KEY (actividad_proyecto_id) REFERENCES actividades_proyectos(id);


--
-- Name: fk_rails_396d8e5cb2; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_rails_396d8e5cb2 FOREIGN KEY (etapa_id) REFERENCES etapas(id);


--
-- Name: fk_rails_3a0687d0f0; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT fk_rails_3a0687d0f0 FOREIGN KEY (ciudad_id) REFERENCES ciudades(id);


--
-- Name: fk_rails_3a5ddfab03; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuotas_por_cliente
    ADD CONSTRAINT fk_rails_3a5ddfab03 FOREIGN KEY (descuento_id) REFERENCES descuentos(id);


--
-- Name: fk_rails_3bb727882f; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_3bb727882f FOREIGN KEY (rol_id) REFERENCES roles(id);


--
-- Name: fk_rails_3ef7066778; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY vencimientos
    ADD CONSTRAINT fk_rails_3ef7066778 FOREIGN KEY (interes_id) REFERENCES intereses(id);


--
-- Name: fk_rails_42b95c8542; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT fk_rails_42b95c8542 FOREIGN KEY (estado_id) REFERENCES estados(id);


--
-- Name: fk_rails_4396467205; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY provincias
    ADD CONSTRAINT fk_rails_4396467205 FOREIGN KEY (pais_id) REFERENCES paises(id);


--
-- Name: fk_rails_4908c4f0b1; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_rails_4908c4f0b1 FOREIGN KEY (pais_id) REFERENCES paises(id);


--
-- Name: fk_rails_495309cfa6; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY actividades_proyectos
    ADD CONSTRAINT fk_rails_495309cfa6 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_4d17636b98; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_4d17636b98 FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documentos(id);


--
-- Name: fk_rails_503807ad00; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT fk_rails_503807ad00 FOREIGN KEY (provincia_id) REFERENCES provincias(id);


--
-- Name: fk_rails_526dab4824; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos
    ADD CONSTRAINT fk_rails_526dab4824 FOREIGN KEY (contacto_id) REFERENCES contactos(id);


--
-- Name: fk_rails_5581ba6a88; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY vencimientos
    ADD CONSTRAINT fk_rails_5581ba6a88 FOREIGN KEY (concepto_de_pago_id) REFERENCES conceptos_de_pago(id);


--
-- Name: fk_rails_58967053a7; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos
    ADD CONSTRAINT fk_rails_58967053a7 FOREIGN KEY (cuenta_id) REFERENCES cuentas(id);


--
-- Name: fk_rails_59cf6f4d0c; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY actividades
    ADD CONSTRAINT fk_rails_59cf6f4d0c FOREIGN KEY (etapa_id) REFERENCES etapas(id);


--
-- Name: fk_rails_68fe23a962; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_68fe23a962 FOREIGN KEY (ciudad_id) REFERENCES ciudades(id);


--
-- Name: fk_rails_712197ee76; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_712197ee76 FOREIGN KEY (provincia_id) REFERENCES provincias(id);


--
-- Name: fk_rails_7a97d5637b; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos
    ADD CONSTRAINT fk_rails_7a97d5637b FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- Name: fk_rails_7cda5a9a68; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT fk_rails_7cda5a9a68 FOREIGN KEY (modelo_id) REFERENCES modelos(id);


--
-- Name: fk_rails_81bcdb8443; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_81bcdb8443 FOREIGN KEY (rol_de_empleado_id) REFERENCES roles_de_empleados(id);


--
-- Name: fk_rails_88ccacd263; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuotas_por_cliente
    ADD CONSTRAINT fk_rails_88ccacd263 FOREIGN KEY (contrato_id) REFERENCES contratos(id);


--
-- Name: fk_rails_8ccdd5cb4d; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT fk_rails_8ccdd5cb4d FOREIGN KEY (pais_id) REFERENCES paises(id);


--
-- Name: fk_rails_910b185b0a; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_rails_910b185b0a FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: fk_rails_9fc2511f21; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_9fc2511f21 FOREIGN KEY (pais_id) REFERENCES paises(id);


--
-- Name: fk_rails_a3e1d94c15; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuotas_por_cliente
    ADD CONSTRAINT fk_rails_a3e1d94c15 FOREIGN KEY (concepto_de_pago_id) REFERENCES conceptos_de_pago(id);


--
-- Name: fk_rails_a9c621341e; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_proyectos
    ADD CONSTRAINT fk_rails_a9c621341e FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- Name: fk_rails_ac1b883b99; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY contratos
    ADD CONSTRAINT fk_rails_ac1b883b99 FOREIGN KEY (persona_proyecto_id) REFERENCES personas_proyectos(id);


--
-- Name: fk_rails_ad63f5f655; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_rails_ad63f5f655 FOREIGN KEY (provincia_id) REFERENCES provincias(id);


--
-- Name: fk_rails_add25bd789; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos
    ADD CONSTRAINT fk_rails_add25bd789 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_b44d5bce34; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuentas
    ADD CONSTRAINT fk_rails_b44d5bce34 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_b4de374130; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos
    ADD CONSTRAINT fk_rails_b4de374130 FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- Name: fk_rails_becbb4c8e3; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY cuotas_por_cliente
    ADD CONSTRAINT fk_rails_becbb4c8e3 FOREIGN KEY (pago_id) REFERENCES pagos(id);


--
-- Name: fk_rails_bf2624e44c; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT fk_rails_bf2624e44c FOREIGN KEY (provincia_id) REFERENCES provincias(id);


--
-- Name: fk_rails_c6c420ca25; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT fk_rails_c6c420ca25 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c78c6fb82d; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_c78c6fb82d FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- Name: fk_rails_cdab4f42c3; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_proyectos
    ADD CONSTRAINT fk_rails_cdab4f42c3 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_d70f0787d5; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY actividades_proyectos
    ADD CONSTRAINT fk_rails_d70f0787d5 FOREIGN KEY (estado_id) REFERENCES estados(id);


--
-- Name: fk_rails_dbaca4d49e; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY roles_de_empleados
    ADD CONSTRAINT fk_rails_dbaca4d49e FOREIGN KEY (departamento_id) REFERENCES departamentos(id);


--
-- Name: fk_rails_dde07ae989; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT fk_rails_dde07ae989 FOREIGN KEY (pais_id) REFERENCES paises(id);


--
-- Name: fk_rails_e15f56df07; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_e15f56df07 FOREIGN KEY (departamento_id) REFERENCES departamentos(id);


--
-- Name: fk_rails_e23fbe9a11; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos_proyectos
    ADD CONSTRAINT fk_rails_e23fbe9a11 FOREIGN KEY (evento_id) REFERENCES eventos(id);


--
-- Name: fk_rails_e8465b472a; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_e8465b472a FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: fk_rails_eb91da59f4; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_eb91da59f4 FOREIGN KEY (especialidad_de_contacto_id) REFERENCES especialidades_de_contacto(id);


--
-- Name: fk_rails_f0fa5f9857; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT fk_rails_f0fa5f9857 FOREIGN KEY (proyecto_id) REFERENCES proyectos(id);


--
-- Name: fk_rails_fed47a6acf; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos
    ADD CONSTRAINT fk_rails_fed47a6acf FOREIGN KEY (tipo_de_pago_id) REFERENCES tipos_de_pago(id);


--
-- Name: fk_rails_ffd8949aae; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY actividades_proyectos
    ADD CONSTRAINT fk_rails_ffd8949aae FOREIGN KEY (actividad_id) REFERENCES actividades(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

