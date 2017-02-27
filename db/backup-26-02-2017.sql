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
    actividades_antecedentes text,
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
1	Crear	create	2017-02-25 01:05:04.517521	2017-02-25 01:05:04.517521
2	Eliminar	destroy	2017-02-25 01:05:04.545191	2017-02-25 01:05:04.545191
3	Ver	show	2017-02-25 01:05:04.579658	2017-02-25 01:05:04.579658
4	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-02-25 01:05:04.611477	2017-02-25 01:05:04.611477
5	Index	index	2017-02-25 01:05:04.631888	2017-02-25 01:05:04.631888
6	Editar	update	2017-02-25 01:05:04.656436	2017-02-25 01:05:04.656436
7	Estadisticas	estadistica	2017-02-25 01:05:04.688067	2017-02-25 01:05:04.688067
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 7, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	--- []\n	2017-02-25 01:05:00.700729	2017-02-25 01:05:00.700729	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-02-25 01:05:00.752372	2017-02-25 01:05:00.752372	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-02-25 01:05:00.794638	2017-02-25 01:05:00.794638	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-02-25 01:05:00.829788	2017-02-25 01:05:00.829788	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-02-25 01:05:00.854838	2017-02-25 01:05:00.854838	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-02-25 01:05:00.891161	2017-02-25 01:05:00.891161	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-02-25 01:05:00.917942	2017-02-25 01:05:00.917942	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-02-25 01:05:00.938988	2017-02-25 01:05:00.938988	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-02-25 01:05:00.963059	2017-02-25 01:05:00.963059	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-02-25 01:05:00.990512	2017-02-25 01:05:00.990512	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-02-25 01:05:01.027364	2017-02-25 01:05:01.027364	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
2	\N	2017-02-25 01:05:02.982453	2017-02-25 01:05:02.982453	1	2	\N
3	\N	2017-02-25 01:05:03.036157	2017-02-25 01:05:03.036157	1	3	\N
4	\N	2017-02-25 01:05:03.092404	2017-02-25 01:05:03.092404	2	1	\N
5	\N	2017-02-25 01:05:03.14707	2017-02-25 01:05:03.14707	2	2	\N
6	\N	2017-02-25 01:05:03.203243	2017-02-25 01:05:03.203243	2	3	\N
7	\N	2017-02-25 01:05:03.247293	2017-02-25 01:05:03.247293	3	1	\N
8	\N	2017-02-25 01:05:03.293185	2017-02-25 01:05:03.293185	3	2	\N
9	\N	2017-02-25 01:05:03.349219	2017-02-25 01:05:03.349219	3	3	\N
10	\N	2017-02-25 01:05:03.40379	2017-02-25 01:05:03.40379	4	1	\N
11	\N	2017-02-25 01:05:03.458599	2017-02-25 01:05:03.458599	4	2	\N
12	\N	2017-02-25 01:05:03.50345	2017-02-25 01:05:03.50345	4	3	\N
13	\N	2017-02-25 01:05:03.548962	2017-02-25 01:05:03.548962	5	1	\N
14	\N	2017-02-25 01:05:03.592369	2017-02-25 01:05:03.592369	5	2	\N
15	\N	2017-02-25 01:05:03.638166	2017-02-25 01:05:03.638166	5	3	\N
16	\N	2017-02-25 01:05:03.692001	2017-02-25 01:05:03.692001	6	1	\N
17	\N	2017-02-25 01:05:03.747416	2017-02-25 01:05:03.747416	6	2	\N
18	\N	2017-02-25 01:05:03.804771	2017-02-25 01:05:03.804771	6	3	\N
19	\N	2017-02-25 01:05:03.859412	2017-02-25 01:05:03.859412	7	1	\N
20	\N	2017-02-25 01:05:03.915529	2017-02-25 01:05:03.915529	7	2	\N
21	\N	2017-02-25 01:05:03.971252	2017-02-25 01:05:03.971252	7	3	\N
22	\N	2017-02-25 01:05:04.026787	2017-02-25 01:05:04.026787	8	1	\N
23	\N	2017-02-25 01:05:04.082073	2017-02-25 01:05:04.082073	8	2	\N
24	\N	2017-02-25 01:05:04.126919	2017-02-25 01:05:04.126919	8	3	\N
25	\N	2017-02-25 01:05:04.181131	2017-02-25 01:05:04.181131	9	1	\N
26	\N	2017-02-25 01:05:04.226633	2017-02-25 01:05:04.226633	9	2	\N
27	\N	2017-02-25 01:05:04.269742	2017-02-25 01:05:04.269742	9	3	\N
28	\N	2017-02-25 01:05:04.315661	2017-02-25 01:05:04.315661	10	1	\N
29	\N	2017-02-25 01:05:04.369729	2017-02-25 01:05:04.369729	10	2	\N
30	\N	2017-02-25 01:05:04.414015	2017-02-25 01:05:04.414015	10	3	\N
1	2017-02-17	2017-02-25 01:05:02.907	2017-02-25 04:09:54.292309	1	1	1
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 30, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-02-25 01:04:58.93308	2017-02-25 01:04:58.93308
2	Rural	2017-02-25 01:04:58.961813	2017-02-25 01:04:58.961813
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
103	1	Proyecto	\N	\N	1	User	\N	update	---\npagWeb:\n- ''\n- procare.com\n	2	\N	127.0.0.1	9fa90d9e-47bb-480e-bb69-5c625628fc4b	2017-02-25 01:37:01.95489
104	1	ActividadProyecto	\N	\N	1	User	\N	update	---\nfechaVencimiento:\n- \n- 2017-02-17\nestado_id:\n- \n- 1\n	2	\N	127.0.0.1	ae61e923-0218-4135-b9d3-b2cf05f351c1	2017-02-25 04:09:54.321101
1	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	f2b27b0f-003a-42d9-af9d-8e3394fca130	2017-02-25 01:05:01.285955
2	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	50642312-a90c-42ed-b4e4-8ace43de74c6	2017-02-25 01:05:01.387928
3	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	eaa8ef84-4f29-472f-a026-a6afe2c375f5	2017-02-25 01:05:01.462056
4	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	ff3f06c0-26f5-4373-a27b-d8d23761ebf2	2017-02-25 01:05:01.540603
5	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	116426d9-7f5f-4b05-8e1f-dd25249100cc	2017-02-25 01:05:01.622025
6	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	56460b10-cc2a-4233-a3b8-1b17185c96fa	2017-02-25 01:05:01.698486
7	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	8ef8af4d-1849-4611-ba61-78594d0a8c05	2017-02-25 01:05:01.773842
8	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	efb53c03-1a0f-4bb4-a2b3-d45893653dfd	2017-02-25 01:05:01.85038
9	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	ac60915e-d285-44eb-9a64-50e9d7cfb614	2017-02-25 01:05:01.976622
10	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b2ee73c7-3f9d-4081-9272-7544ddf63f3f	2017-02-25 01:05:02.052829
11	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: \n	1	\N	\N	cbbfd222-e566-420c-a306-4880ebe33278	2017-02-25 01:05:02.93743
12	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: \n	1	\N	\N	04e10f76-8841-4445-8942-4e85a471edd1	2017-02-25 01:05:03.004891
13	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: \n	1	\N	\N	21c40643-32eb-4960-a202-b201b0270c73	2017-02-25 01:05:03.058256
14	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: \n	1	\N	\N	6775d22a-67f0-4438-b854-feb3a06b5d70	2017-02-25 01:05:03.113293
15	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: \n	1	\N	\N	d7c1020f-0e32-4a4b-b988-a84e0e09bbfd	2017-02-25 01:05:03.165069
16	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: \n	1	\N	\N	16d187eb-5302-407f-bb3e-544177b34d56	2017-02-25 01:05:03.220803
17	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: \n	1	\N	\N	41466485-012c-4a5d-9ded-3ec31d4a7038	2017-02-25 01:05:03.266613
18	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: \n	1	\N	\N	574f75b4-9760-40f2-ada2-56c0e9390fa7	2017-02-25 01:05:03.312996
19	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: \n	1	\N	\N	532f68b9-2d4d-427b-9b6a-d9b6a8d733eb	2017-02-25 01:05:03.368152
20	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: \n	1	\N	\N	c7c7d5b2-0433-484f-8cbc-ed3f0d418909	2017-02-25 01:05:03.424638
21	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: \n	1	\N	\N	f8792fc5-3f9a-4333-a55e-1ea629f8c4d8	2017-02-25 01:05:03.475278
22	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: \n	1	\N	\N	8ccd2629-efb2-47d3-8825-2c23f0873b3c	2017-02-25 01:05:03.520835
23	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: \n	1	\N	\N	cf471fc3-398c-440e-acf8-7d66c528797b	2017-02-25 01:05:03.567488
24	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: \n	1	\N	\N	14fd6ded-7779-4177-a184-21cdc4d99bf4	2017-02-25 01:05:03.610695
25	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: \n	1	\N	\N	03e922a8-7696-4e35-8e47-672a80cf7789	2017-02-25 01:05:03.660503
26	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: \n	1	\N	\N	8b8767da-8361-4ea9-b3e4-bdd6d7e7d537	2017-02-25 01:05:03.712418
27	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: \n	1	\N	\N	89cef35b-2ebd-4735-a94c-a55971928668	2017-02-25 01:05:03.766299
28	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: \n	1	\N	\N	44a3fc71-963d-4c7d-9b29-9015c2d592f8	2017-02-25 01:05:03.824026
29	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: \n	1	\N	\N	c6fb060b-9f7a-4b60-9d0b-2a0905a77fd1	2017-02-25 01:05:03.879513
30	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: \n	1	\N	\N	5ee62a9c-cfc7-4325-b683-a1c0b30829f4	2017-02-25 01:05:03.9364
31	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: \n	1	\N	\N	6f08b5fc-69be-413a-8224-050c1ba967a6	2017-02-25 01:05:03.989839
32	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: \n	1	\N	\N	7cae3ca9-d85f-4d4e-9638-dc01a0691650	2017-02-25 01:05:04.046332
33	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: \n	1	\N	\N	bdac6779-de3d-4eb5-989d-80e2a07b4d95	2017-02-25 01:05:04.099421
34	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: \n	1	\N	\N	d2d6e7a9-3384-4c67-b222-0483a94a0c8e	2017-02-25 01:05:04.145318
35	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: \n	1	\N	\N	64672573-8094-4742-81ae-77bdb722da94	2017-02-25 01:05:04.198978
36	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: \n	1	\N	\N	735aacb9-b30c-492f-a78f-3d31ecb33797	2017-02-25 01:05:04.243632
37	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: \n	1	\N	\N	c7b5368d-4813-4002-8131-bec54a7a675b	2017-02-25 01:05:04.288561
38	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: \n	1	\N	\N	dc8c237b-25a1-4e2c-b05b-0e9dc2094edd	2017-02-25 01:05:04.338847
39	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: \n	1	\N	\N	97d1f182-ff03-4854-b33d-9c3617a0dccd	2017-02-25 01:05:04.386867
40	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: \n	1	\N	\N	1fef5a81-401f-4d0a-a282-0ec762ebc000	2017-02-25 01:05:04.431802
41	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\nmonto: 200.0\n	1	\N	\N	17f6774f-b482-43d7-81d7-88b444575dea	2017-02-25 01:05:10.500835
42	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\nmonto: 200.0\n	1	\N	\N	7c709592-4c21-484f-a614-d2daefd3586a	2017-02-25 01:05:10.563028
43	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\nmonto: 200.0\n	1	\N	\N	1a9cffbc-959c-4bc1-a382-a2839becdc8e	2017-02-25 01:05:10.619899
44	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\nmonto: 200.0\n	1	\N	\N	7bc5d910-8fb2-43e9-9e65-d13a6f31107d	2017-02-25 01:05:10.679819
45	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\nmonto: 200.0\n	1	\N	\N	92c77a8d-5b8e-4c25-982d-ad77f54b9b7b	2017-02-25 01:05:10.743142
46	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\nmonto: 200.0\n	1	\N	\N	05448285-b087-4495-a3e0-005c4b7a276d	2017-02-25 01:05:10.808952
47	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\nmonto: 200.0\n	1	\N	\N	045d8891-b0c1-4068-9f0d-9c8bd3e09fd3	2017-02-25 01:05:10.863528
48	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\nmonto: 200.0\n	1	\N	\N	bb50df8b-c026-4a0b-982f-61457da59564	2017-02-25 01:05:10.920957
49	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\nmonto: 200.0\n	1	\N	\N	baaec11f-388a-445f-b3a7-132f6bd7d247	2017-02-25 01:05:10.975858
50	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\nmonto: 200.0\n	1	\N	\N	b002d625-9a36-4b33-a65e-82726f42545d	2017-02-25 01:05:11.031496
51	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\nmonto: 200.0\n	1	\N	\N	a41a87d7-af42-45f1-b170-a14782cbd195	2017-02-25 01:05:11.088486
52	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\nmonto: 200.0\n	1	\N	\N	78129d82-0a4f-4aa3-b91c-eed2a3b497ad	2017-02-25 01:05:11.142564
53	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 7\nproyecto_id: 1\n	1	\N	\N	19af471e-a145-45e8-94b5-f375dc45c4f0	2017-02-25 01:05:11.814829
54	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 8\nproyecto_id: 2\n	1	\N	\N	9601b3de-baa1-4d60-a4fc-4b6ae68866ce	2017-02-25 01:05:11.872419
55	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 10\nproyecto_id: 3\n	1	\N	\N	6fc24499-9041-4903-ae11-0485306773fd	2017-02-25 01:05:11.92685
56	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 12\nproyecto_id: 4\n	1	\N	\N	2d51d29e-68c8-4642-89e6-77542a93c23d	2017-02-25 01:05:11.983005
57	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 14\nproyecto_id: 5\n	1	\N	\N	06b1c10e-7f39-4bd0-98c1-c7b239a66f57	2017-02-25 01:05:12.041555
58	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 19\nproyecto_id: 6\n	1	\N	\N	35b480ac-0872-4df6-af47-57319212e469	2017-02-25 01:05:12.092229
59	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 18\nproyecto_id: 7\n	1	\N	\N	80884319-b197-4c12-b82f-7f2ee42cb7aa	2017-02-25 01:05:12.149199
60	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 21\nproyecto_id: 8\n	1	\N	\N	5a605aaa-79ad-4792-b143-a3030671f6cb	2017-02-25 01:05:12.20068
61	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 23\nproyecto_id: 9\n	1	\N	\N	c2510b78-aad2-4ef3-8145-29bb01416567	2017-02-25 01:05:12.246416
62	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 25\nproyecto_id: 10\n	1	\N	\N	4fa4b35f-79cf-4597-a2b2-6f52953688fd	2017-02-25 01:05:12.301287
63	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	39195d9f-2383-4a07-907f-016d05af1676	2017-02-25 01:05:12.48126
64	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	dc0f3c6d-5eef-458f-abd9-1a1a96e7bbf2	2017-02-25 01:05:12.621612
65	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	d54b66d6-7b20-45d9-9981-2650b055ff5a	2017-02-25 01:05:12.737131
66	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	dd73cb9e-bbc1-4903-b433-380643736f00	2017-02-25 01:05:12.815884
67	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	e2153a58-d3dd-4428-8d1b-ba3ea2672d51	2017-02-25 01:05:12.912168
68	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	0f2e7004-d570-4d5d-9f40-5eea405504bb	2017-02-25 01:05:13.015343
69	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	9af784a9-4aac-443f-a8c6-e8d57cea50ef	2017-02-25 01:05:13.096756
70	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	376a2ed5-7090-444c-b617-5d9f716dd174	2017-02-25 01:05:13.163288
71	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	36a7ffdf-0af8-4128-bf5a-99fca0d9cb4a	2017-02-25 01:05:13.248663
72	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	e17a868d-2592-4f1f-a536-17a499bc4843	2017-02-25 01:05:13.350652
73	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	9f887c84-2277-4534-a628-69e6537e64e5	2017-02-25 01:05:13.433095
74	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	e27351f0-adff-4298-a2b8-b1ee7cba6ae5	2017-02-25 01:05:13.511405
75	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	de828e47-fa67-45be-baf6-427eb8d29e60	2017-02-25 01:05:13.599536
76	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	0598cfc8-2f78-43b1-a609-3bee072a1fe6	2017-02-25 01:05:13.735102
77	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	1eba27c3-04bd-4013-ac55-920a3545ef5f	2017-02-25 01:05:13.824274
78	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	54a85e51-7bdd-4613-ac42-b296c3c3486a	2017-02-25 01:05:13.901126
79	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	26cd4c42-3a5e-4f32-9a0e-8c501c5ad475	2017-02-25 01:05:13.996194
80	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	9e1143bf-3d4b-4d66-a658-9cc308327aaa	2017-02-25 01:05:14.102907
81	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	988dd199-c99b-4499-9df1-1d2a08fbaa3f	2017-02-25 01:05:14.196241
82	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	c0914868-613d-4f94-8d6b-a5ea7a865ece	2017-02-25 01:05:14.264078
83	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	eae50e61-a943-47cd-9066-c67663bfe1e1	2017-02-25 01:05:14.359812
84	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	43ed23f8-9c55-4d64-8d36-a09e7761b2cb	2017-02-25 01:05:14.456456
85	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	8d9c87fe-01da-4053-b58f-a18dda037571	2017-02-25 01:05:14.548301
86	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	f866b091-8c86-497e-ab5b-4665fe26a137	2017-02-25 01:05:14.628427
87	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	90732d66-27d2-4a29-8855-227ef5a44fe0	2017-02-25 01:05:14.723732
88	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	eeabdea6-6ef2-4c5e-be57-9ea7bbf865d3	2017-02-25 01:05:14.827531
89	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	52e54eb5-eb09-4869-88cd-b83f48770706	2017-02-25 01:05:14.915729
90	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	cc7f6443-11b0-462e-a722-cdde26162b78	2017-02-25 01:05:14.988772
91	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	215476d6-70a6-4991-b304-619534d26092	2017-02-25 01:05:15.081237
92	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	acee8c09-ec1b-4792-95ae-7bbef665f792	2017-02-25 01:05:15.18047
93	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	4969a4d5-c686-480d-9221-e95be8d4cb7f	2017-02-25 01:05:15.27141
94	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	266abc6f-b4ce-4ec0-82b8-8975fe1a2e08	2017-02-25 01:05:15.348335
95	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	624e1c44-9cc3-41e1-89fa-a3dc5e4f1337	2017-02-25 01:05:15.436829
96	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	ed45fcc6-b297-4ada-b04c-dcc8d5483688	2017-02-25 01:05:15.537797
97	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	72430d79-7300-4fa3-aaee-7233a55873aa	2017-02-25 01:05:15.623747
98	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	7db393db-db01-4e2a-beae-b84ff6884644	2017-02-25 01:05:15.701543
99	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	80550d42-b97b-4ea8-b8ed-32b5ec642daf	2017-02-25 01:05:15.787615
100	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	a50f9653-2397-4e5c-baec-e90ffe360f3b	2017-02-25 01:05:15.89016
101	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	57d73845-01bf-4f7e-8d17-d7f77b6feb08	2017-02-25 01:05:15.983693
102	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	2af55197-5152-4c39-8cfa-ab43dfc8c6c8	2017-02-25 01:05:16.066007
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 104, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-02-25 01:04:58.77284	2017-02-25 01:04:58.77284	1	1
2	Apostoles	2017-02-25 01:04:58.814497	2017-02-25 01:04:58.814497	1	1
3	Bella Vista	2017-02-25 01:04:58.844811	2017-02-25 01:04:58.844811	2	1
4	Encarnación	2017-02-25 01:04:58.875646	2017-02-25 01:04:58.875646	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	200	2017-02-25 01:05:10.474051	2017-02-25 01:05:10.474051
2	CP-002	Cuota de Febrero	Febrero 2017	200	2017-02-25 01:05:10.545093	2017-02-25 01:05:10.545093
3	CP-003	Cuota de Marzo	Marzo 2017	200	2017-02-25 01:05:10.602065	2017-02-25 01:05:10.602065
4	CP-004	Cuota de Abril	Abril 2017	200	2017-02-25 01:05:10.660015	2017-02-25 01:05:10.660015
5	CP-005	Cuota de Mayo	Mayo 2017	200	2017-02-25 01:05:10.724167	2017-02-25 01:05:10.724167
6	CP-006	Cuota de Junio	Junio 2017	200	2017-02-25 01:05:10.791216	2017-02-25 01:05:10.791216
7	CP-007	Cuota de Julio	Julio 2017	200	2017-02-25 01:05:10.844817	2017-02-25 01:05:10.844817
8	CP-008	Cuota de Agosto	Agosto 2017	200	2017-02-25 01:05:10.903149	2017-02-25 01:05:10.903149
9	CP-009	Cuota de Septiembre	Septiembre 2017	200	2017-02-25 01:05:10.959372	2017-02-25 01:05:10.959372
10	CP-010	Cuota de Octubre	Octubre 2017	200	2017-02-25 01:05:11.012581	2017-02-25 01:05:11.012581
11	CP-011	Cuota de Noviembre	Noviembre 2017	200	2017-02-25 01:05:11.06819	2017-02-25 01:05:11.06819
12	CP-012	Cuota de Diciembre	Diciembre 2017	200	2017-02-25 01:05:11.125561	2017-02-25 01:05:11.125561
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, numero_abandono, tiempo_abandono, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
1	Peak-Startup-Logo.png	Peak Startup		30-54570225-4	ri	15	minutes	Av. Corrientes	4287			4401604	\N	peakstartup@gmail.com	2017-02-25 01:05:16.465356	2017-02-25 01:05:16.465356	1	1	1	1	\N
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
1	2017-01-01	2017-04-30	2017-02-25 01:05:11.783871	2017-02-25 01:05:11.783871	\N	7	1
2	2017-01-01	2017-04-30	2017-02-25 01:05:11.850673	2017-02-25 01:05:11.850673	\N	8	2
3	2017-01-01	2017-04-30	2017-02-25 01:05:11.906501	2017-02-25 01:05:11.906501	\N	10	3
4	2017-01-01	2017-04-30	2017-02-25 01:05:11.962031	2017-02-25 01:05:11.962031	\N	12	4
5	2017-01-01	2017-04-30	2017-02-25 01:05:12.018527	2017-02-25 01:05:12.018527	\N	14	5
6	2017-01-01	2017-04-30	2017-02-25 01:05:12.071352	2017-02-25 01:05:12.071352	\N	19	6
7	2017-01-01	2017-04-30	2017-02-25 01:05:12.128713	2017-02-25 01:05:12.128713	\N	18	7
8	2017-01-01	2017-04-30	2017-02-25 01:05:12.18262	2017-02-25 01:05:12.18262	\N	21	8
9	2017-01-01	2017-04-30	2017-02-25 01:05:12.226442	2017-02-25 01:05:12.226442	\N	23	9
10	2017-01-01	2017-04-30	2017-02-25 01:05:12.282505	2017-02-25 01:05:12.282505	\N	25	10
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 10, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
1	0	2017-02-25 01:05:16.137932	2017-02-25 01:05:16.137932	1
2	0	2017-02-25 01:05:16.166039	2017-02-25 01:05:16.166039	2
3	0	2017-02-25 01:05:16.186162	2017-02-25 01:05:16.186162	3
4	0	2017-02-25 01:05:16.210233	2017-02-25 01:05:16.210233	4
5	0	2017-02-25 01:05:16.232533	2017-02-25 01:05:16.232533	5
6	0	2017-02-25 01:05:16.252743	2017-02-25 01:05:16.252743	6
7	0	2017-02-25 01:05:16.27472	2017-02-25 01:05:16.27472	7
8	0	2017-02-25 01:05:16.298266	2017-02-25 01:05:16.298266	8
9	0	2017-02-25 01:05:16.320102	2017-02-25 01:05:16.320102	9
10	0	2017-02-25 01:05:16.344082	2017-02-25 01:05:16.344082	10
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 10, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
1	288	f	2017-02-25 01:05:12.450179	2017-02-25 01:05:12.450179	1	1	1	\N	\N
2	288	f	2017-02-25 01:05:12.600281	2017-02-25 01:05:12.600281	2	1	1	\N	\N
3	200	f	2017-02-25 01:05:12.71489	2017-02-25 01:05:12.71489	3	1	1	\N	\N
4	200	f	2017-02-25 01:05:12.794058	2017-02-25 01:05:12.794058	4	1	1	\N	\N
5	288	f	2017-02-25 01:05:12.888531	2017-02-25 01:05:12.888531	1	2	2	\N	\N
6	288	f	2017-02-25 01:05:12.994212	2017-02-25 01:05:12.994212	2	2	2	\N	\N
7	200	f	2017-02-25 01:05:13.078345	2017-02-25 01:05:13.078345	3	2	2	\N	\N
8	200	f	2017-02-25 01:05:13.143785	2017-02-25 01:05:13.143785	4	2	2	\N	\N
9	288	f	2017-02-25 01:05:13.22983	2017-02-25 01:05:13.22983	1	3	3	\N	\N
10	288	f	2017-02-25 01:05:13.326809	2017-02-25 01:05:13.326809	2	3	3	\N	\N
11	200	f	2017-02-25 01:05:13.413467	2017-02-25 01:05:13.413467	3	3	3	\N	\N
12	200	f	2017-02-25 01:05:13.490773	2017-02-25 01:05:13.490773	4	3	3	\N	\N
13	288	f	2017-02-25 01:05:13.580853	2017-02-25 01:05:13.580853	1	4	4	\N	\N
14	288	f	2017-02-25 01:05:13.715432	2017-02-25 01:05:13.715432	2	4	4	\N	\N
15	200	f	2017-02-25 01:05:13.803508	2017-02-25 01:05:13.803508	3	4	4	\N	\N
16	200	f	2017-02-25 01:05:13.880318	2017-02-25 01:05:13.880318	4	4	4	\N	\N
17	288	f	2017-02-25 01:05:13.972453	2017-02-25 01:05:13.972453	1	5	5	\N	\N
18	288	f	2017-02-25 01:05:14.082918	2017-02-25 01:05:14.082918	2	5	5	\N	\N
19	200	f	2017-02-25 01:05:14.174451	2017-02-25 01:05:14.174451	3	5	5	\N	\N
20	200	f	2017-02-25 01:05:14.243752	2017-02-25 01:05:14.243752	4	5	5	\N	\N
21	288	f	2017-02-25 01:05:14.33896	2017-02-25 01:05:14.33896	1	6	6	\N	\N
22	288	f	2017-02-25 01:05:14.436668	2017-02-25 01:05:14.436668	2	6	6	\N	\N
23	200	f	2017-02-25 01:05:14.526338	2017-02-25 01:05:14.526338	3	6	6	\N	\N
24	200	f	2017-02-25 01:05:14.6033	2017-02-25 01:05:14.6033	4	6	6	\N	\N
25	288	f	2017-02-25 01:05:14.702623	2017-02-25 01:05:14.702623	1	7	7	\N	\N
26	288	f	2017-02-25 01:05:14.805922	2017-02-25 01:05:14.805922	2	7	7	\N	\N
27	200	f	2017-02-25 01:05:14.894584	2017-02-25 01:05:14.894584	3	7	7	\N	\N
28	200	f	2017-02-25 01:05:14.968211	2017-02-25 01:05:14.968211	4	7	7	\N	\N
29	288	f	2017-02-25 01:05:15.060913	2017-02-25 01:05:15.060913	1	8	8	\N	\N
30	288	f	2017-02-25 01:05:15.157635	2017-02-25 01:05:15.157635	2	8	8	\N	\N
31	200	f	2017-02-25 01:05:15.24881	2017-02-25 01:05:15.24881	3	8	8	\N	\N
32	200	f	2017-02-25 01:05:15.32534	2017-02-25 01:05:15.32534	4	8	8	\N	\N
33	288	f	2017-02-25 01:05:15.415224	2017-02-25 01:05:15.415224	1	9	9	\N	\N
34	288	f	2017-02-25 01:05:15.516205	2017-02-25 01:05:15.516205	2	9	9	\N	\N
35	200	f	2017-02-25 01:05:15.603531	2017-02-25 01:05:15.603531	3	9	9	\N	\N
36	200	f	2017-02-25 01:05:15.679161	2017-02-25 01:05:15.679161	4	9	9	\N	\N
37	288	f	2017-02-25 01:05:15.76745	2017-02-25 01:05:15.76745	1	10	10	\N	\N
38	288	f	2017-02-25 01:05:15.87012	2017-02-25 01:05:15.87012	2	10	10	\N	\N
39	200	f	2017-02-25 01:05:15.964104	2017-02-25 01:05:15.964104	3	10	10	\N	\N
40	200	f	2017-02-25 01:05:16.045583	2017-02-25 01:05:16.045583	4	10	10	\N	\N
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
1	Finanzas	2017-02-25 01:04:59.09504	2017-02-25 01:04:59.09504
2	Recursos Humanos	2017-02-25 01:04:59.116173	2017-02-25 01:04:59.116173
3	Evaluación	2017-02-25 01:04:59.13972	2017-02-25 01:04:59.13972
4	Logística	2017-02-25 01:04:59.161975	2017-02-25 01:04:59.161975
5	Dirección	2017-02-25 01:04:59.183296	2017-02-25 01:04:59.183296
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-02-25 01:05:10.24337	2017-02-25 01:05:10.24337
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
1	Marketing	-	2017-02-25 14:21:49.6484	2017-02-25 14:21:49.6484
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 1, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-02-25 01:05:10.116253	2017-02-25 01:05:10.116253
2	Doing	f	1	\N	2017-02-25 01:05:10.143715	2017-02-25 01:05:10.143715
3	Done	t	2	\N	2017-02-25 01:05:10.180629	2017-02-25 01:05:10.180629
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-02-25 01:05:00.555205	2017-02-25 01:05:00.555205
2	Incubación	-	1	2017-02-25 01:05:00.584886	2017-02-25 01:05:00.584886
3	post incubacion	-	2	2017-02-25 01:05:00.605102	2017-02-25 01:05:00.605102
4	Cuarta etapa	-	\N	2017-02-25 01:05:00.627013	2017-02-25 01:05:00.627013
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
1	2017-02-25 04:09:54.363648	2017-02-25 04:09:54.365313	2017-02-25 04:09:54.411124	1	1	\N	1
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 1, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-02-25 01:05:10.311059	2017-02-25 01:05:10.311059
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
1	Actividad	2017-02-25 01:05:04.735699	2017-02-25 01:05:04.735699
2	Area	2017-02-25 01:05:04.763086	2017-02-25 01:05:04.763086
3	Ciudad	2017-02-25 01:05:04.785749	2017-02-25 01:05:04.785749
4	ConceptoDePago	2017-02-25 01:05:04.807891	2017-02-25 01:05:04.807891
5	Contacto	2017-02-25 01:05:04.828599	2017-02-25 01:05:04.828599
6	Contrato	2017-02-25 01:05:04.851325	2017-02-25 01:05:04.851325
7	Cuenta	2017-02-25 01:05:04.875132	2017-02-25 01:05:04.875132
8	Departamento	2017-02-25 01:05:04.896699	2017-02-25 01:05:04.896699
9	Descuento	2017-02-25 01:05:04.917819	2017-02-25 01:05:04.917819
10	Empleado	2017-02-25 01:05:04.940463	2017-02-25 01:05:04.940463
11	EspecialidadDeContacto	2017-02-25 01:05:04.962908	2017-02-25 01:05:04.962908
12	Estado	2017-02-25 01:05:04.983948	2017-02-25 01:05:04.983948
13	Etapa	2017-02-25 01:05:05.008115	2017-02-25 01:05:05.008115
14	Evento	2017-02-25 01:05:05.028318	2017-02-25 01:05:05.028318
15	EventoProyecto	2017-02-25 01:05:05.052135	2017-02-25 01:05:05.052135
16	MiembroEquipo	2017-02-25 01:05:05.075112	2017-02-25 01:05:05.075112
17	Pago	2017-02-25 01:05:05.094362	2017-02-25 01:05:05.094362
18	Pais	2017-02-25 01:05:05.117914	2017-02-25 01:05:05.117914
19	Provincia	2017-02-25 01:05:05.140251	2017-02-25 01:05:05.140251
20	Proyecto	2017-02-25 01:05:05.161523	2017-02-25 01:05:05.161523
21	Rol	2017-02-25 01:05:05.185886	2017-02-25 01:05:05.185886
22	RolDeEmpleado	2017-02-25 01:05:05.205812	2017-02-25 01:05:05.205812
23	TipoDocumento	2017-02-25 01:05:05.228326	2017-02-25 01:05:05.228326
24	TipoDePago	2017-02-25 01:05:05.250438	2017-02-25 01:05:05.250438
25	User	2017-02-25 01:05:05.274706	2017-02-25 01:05:05.274706
26	ActividadProyecto	2017-02-25 01:05:05.294709	2017-02-25 01:05:05.294709
27	CuotaPorCliente	2017-02-25 01:05:05.317766	2017-02-25 01:05:05.317766
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
1	Argentina	2017-02-25 01:04:58.429275	2017-02-25 01:04:58.429275
2	Paraguay	2017-02-25 01:04:58.46457	2017-02-25 01:04:58.46457
3	Brasil	2017-02-25 01:04:58.499227	2017-02-25 01:04:58.499227
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-02-25 01:05:05.386863	2017-02-25 01:05:05.386863	1	1
2	2017-02-25 01:05:05.413936	2017-02-25 01:05:05.413936	2	1
3	2017-02-25 01:05:05.437331	2017-02-25 01:05:05.437331	3	1
4	2017-02-25 01:05:05.458773	2017-02-25 01:05:05.458773	4	1
5	2017-02-25 01:05:05.481841	2017-02-25 01:05:05.481841	1	2
6	2017-02-25 01:05:05.503453	2017-02-25 01:05:05.503453	2	2
7	2017-02-25 01:05:05.525862	2017-02-25 01:05:05.525862	3	2
8	2017-02-25 01:05:05.548216	2017-02-25 01:05:05.548216	4	2
9	2017-02-25 01:05:05.56969	2017-02-25 01:05:05.56969	1	3
10	2017-02-25 01:05:05.592401	2017-02-25 01:05:05.592401	2	3
11	2017-02-25 01:05:05.614736	2017-02-25 01:05:05.614736	3	3
12	2017-02-25 01:05:05.636627	2017-02-25 01:05:05.636627	4	3
13	2017-02-25 01:05:05.659022	2017-02-25 01:05:05.659022	1	4
14	2017-02-25 01:05:05.681515	2017-02-25 01:05:05.681515	2	4
15	2017-02-25 01:05:05.702517	2017-02-25 01:05:05.702517	3	4
16	2017-02-25 01:05:05.725793	2017-02-25 01:05:05.725793	4	4
17	2017-02-25 01:05:05.74814	2017-02-25 01:05:05.74814	1	5
18	2017-02-25 01:05:05.769346	2017-02-25 01:05:05.769346	2	5
19	2017-02-25 01:05:05.793051	2017-02-25 01:05:05.793051	3	5
20	2017-02-25 01:05:05.814648	2017-02-25 01:05:05.814648	4	5
21	2017-02-25 01:05:05.837038	2017-02-25 01:05:05.837038	1	6
22	2017-02-25 01:05:05.859206	2017-02-25 01:05:05.859206	2	6
23	2017-02-25 01:05:05.880511	2017-02-25 01:05:05.880511	3	6
24	2017-02-25 01:05:05.902918	2017-02-25 01:05:05.902918	4	6
25	2017-02-25 01:05:05.925775	2017-02-25 01:05:05.925775	1	7
26	2017-02-25 01:05:05.948302	2017-02-25 01:05:05.948302	2	7
27	2017-02-25 01:05:05.970323	2017-02-25 01:05:05.970323	3	7
28	2017-02-25 01:05:05.99167	2017-02-25 01:05:05.99167	4	7
29	2017-02-25 01:05:06.014983	2017-02-25 01:05:06.014983	1	8
30	2017-02-25 01:05:06.035895	2017-02-25 01:05:06.035895	2	8
31	2017-02-25 01:05:06.070672	2017-02-25 01:05:06.070672	3	8
32	2017-02-25 01:05:06.092302	2017-02-25 01:05:06.092302	4	8
33	2017-02-25 01:05:06.125988	2017-02-25 01:05:06.125988	1	9
34	2017-02-25 01:05:06.148169	2017-02-25 01:05:06.148169	2	9
35	2017-02-25 01:05:06.192372	2017-02-25 01:05:06.192372	3	9
36	2017-02-25 01:05:06.214316	2017-02-25 01:05:06.214316	4	9
37	2017-02-25 01:05:06.237287	2017-02-25 01:05:06.237287	1	10
38	2017-02-25 01:05:06.259317	2017-02-25 01:05:06.259317	2	10
39	2017-02-25 01:05:06.281602	2017-02-25 01:05:06.281602	3	10
40	2017-02-25 01:05:06.303027	2017-02-25 01:05:06.303027	4	10
41	2017-02-25 01:05:06.326505	2017-02-25 01:05:06.326505	1	11
42	2017-02-25 01:05:06.348333	2017-02-25 01:05:06.348333	2	11
43	2017-02-25 01:05:06.369112	2017-02-25 01:05:06.369112	3	11
44	2017-02-25 01:05:06.392337	2017-02-25 01:05:06.392337	4	11
45	2017-02-25 01:05:06.414344	2017-02-25 01:05:06.414344	1	12
46	2017-02-25 01:05:06.437745	2017-02-25 01:05:06.437745	2	12
47	2017-02-25 01:05:06.459416	2017-02-25 01:05:06.459416	3	12
48	2017-02-25 01:05:06.481747	2017-02-25 01:05:06.481747	4	12
49	2017-02-25 01:05:06.502926	2017-02-25 01:05:06.502926	1	13
50	2017-02-25 01:05:06.524958	2017-02-25 01:05:06.524958	2	13
51	2017-02-25 01:05:06.547694	2017-02-25 01:05:06.547694	3	13
52	2017-02-25 01:05:06.570879	2017-02-25 01:05:06.570879	4	13
53	2017-02-25 01:05:06.592431	2017-02-25 01:05:06.592431	1	14
54	2017-02-25 01:05:06.614586	2017-02-25 01:05:06.614586	2	14
55	2017-02-25 01:05:06.637508	2017-02-25 01:05:06.637508	3	14
56	2017-02-25 01:05:06.658878	2017-02-25 01:05:06.658878	4	14
57	2017-02-25 01:05:06.682189	2017-02-25 01:05:06.682189	1	15
58	2017-02-25 01:05:06.704079	2017-02-25 01:05:06.704079	2	15
59	2017-02-25 01:05:06.724957	2017-02-25 01:05:06.724957	3	15
60	2017-02-25 01:05:06.747037	2017-02-25 01:05:06.747037	4	15
61	2017-02-25 01:05:06.770778	2017-02-25 01:05:06.770778	1	16
62	2017-02-25 01:05:06.791812	2017-02-25 01:05:06.791812	2	16
63	2017-02-25 01:05:06.815225	2017-02-25 01:05:06.815225	3	16
64	2017-02-25 01:05:06.837157	2017-02-25 01:05:06.837157	4	16
65	2017-02-25 01:05:06.858863	2017-02-25 01:05:06.858863	1	17
66	2017-02-25 01:05:06.881909	2017-02-25 01:05:06.881909	2	17
67	2017-02-25 01:05:06.903259	2017-02-25 01:05:06.903259	3	17
68	2017-02-25 01:05:06.925715	2017-02-25 01:05:06.925715	4	17
69	2017-02-25 01:05:06.948472	2017-02-25 01:05:06.948472	1	18
70	2017-02-25 01:05:06.970742	2017-02-25 01:05:06.970742	2	18
71	2017-02-25 01:05:06.991559	2017-02-25 01:05:06.991559	3	18
72	2017-02-25 01:05:07.014575	2017-02-25 01:05:07.014575	4	18
73	2017-02-25 01:05:07.037616	2017-02-25 01:05:07.037616	1	19
74	2017-02-25 01:05:07.05901	2017-02-25 01:05:07.05901	2	19
75	2017-02-25 01:05:07.081726	2017-02-25 01:05:07.081726	3	19
76	2017-02-25 01:05:07.102812	2017-02-25 01:05:07.102812	4	19
77	2017-02-25 01:05:07.124978	2017-02-25 01:05:07.124978	1	20
78	2017-02-25 01:05:07.148163	2017-02-25 01:05:07.148163	2	20
79	2017-02-25 01:05:07.171057	2017-02-25 01:05:07.171057	3	20
80	2017-02-25 01:05:07.192632	2017-02-25 01:05:07.192632	4	20
81	2017-02-25 01:05:07.213657	2017-02-25 01:05:07.213657	1	21
82	2017-02-25 01:05:07.237595	2017-02-25 01:05:07.237595	2	21
83	2017-02-25 01:05:07.259638	2017-02-25 01:05:07.259638	3	21
84	2017-02-25 01:05:07.282035	2017-02-25 01:05:07.282035	4	21
85	2017-02-25 01:05:07.302811	2017-02-25 01:05:07.302811	1	22
86	2017-02-25 01:05:07.325642	2017-02-25 01:05:07.325642	2	22
87	2017-02-25 01:05:07.348258	2017-02-25 01:05:07.348258	3	22
88	2017-02-25 01:05:07.371305	2017-02-25 01:05:07.371305	4	22
89	2017-02-25 01:05:07.392014	2017-02-25 01:05:07.392014	1	23
90	2017-02-25 01:05:07.415631	2017-02-25 01:05:07.415631	2	23
91	2017-02-25 01:05:07.437617	2017-02-25 01:05:07.437617	3	23
92	2017-02-25 01:05:07.53155	2017-02-25 01:05:07.53155	4	23
93	2017-02-25 01:05:07.559115	2017-02-25 01:05:07.559115	1	24
94	2017-02-25 01:05:07.582095	2017-02-25 01:05:07.582095	2	24
95	2017-02-25 01:05:07.60306	2017-02-25 01:05:07.60306	3	24
96	2017-02-25 01:05:07.626734	2017-02-25 01:05:07.626734	4	24
97	2017-02-25 01:05:07.682444	2017-02-25 01:05:07.682444	1	25
98	2017-02-25 01:05:07.704157	2017-02-25 01:05:07.704157	2	25
99	2017-02-25 01:05:07.726219	2017-02-25 01:05:07.726219	3	25
100	2017-02-25 01:05:07.748178	2017-02-25 01:05:07.748178	4	25
101	2017-02-25 01:05:07.781577	2017-02-25 01:05:07.781577	5	20
102	2017-02-25 01:05:07.803681	2017-02-25 01:05:07.803681	6	1
103	2017-02-25 01:05:07.837763	2017-02-25 01:05:07.837763	6	2
104	2017-02-25 01:05:07.859698	2017-02-25 01:05:07.859698	6	3
105	2017-02-25 01:05:07.89213	2017-02-25 01:05:07.89213	6	4
106	2017-02-25 01:05:07.915258	2017-02-25 01:05:07.915258	6	5
107	2017-02-25 01:05:07.947631	2017-02-25 01:05:07.947631	6	6
108	2017-02-25 01:05:07.97039	2017-02-25 01:05:07.97039	6	7
109	2017-02-25 01:05:08.003774	2017-02-25 01:05:08.003774	6	8
110	2017-02-25 01:05:08.026551	2017-02-25 01:05:08.026551	6	9
111	2017-02-25 01:05:08.048541	2017-02-25 01:05:08.048541	6	10
112	2017-02-25 01:05:08.070684	2017-02-25 01:05:08.070684	6	11
113	2017-02-25 01:05:08.092962	2017-02-25 01:05:08.092962	6	12
114	2017-02-25 01:05:08.115231	2017-02-25 01:05:08.115231	6	13
115	2017-02-25 01:05:08.137761	2017-02-25 01:05:08.137761	6	14
116	2017-02-25 01:05:08.159955	2017-02-25 01:05:08.159955	6	15
117	2017-02-25 01:05:08.18076	2017-02-25 01:05:08.18076	6	16
118	2017-02-25 01:05:08.203942	2017-02-25 01:05:08.203942	6	17
119	2017-02-25 01:05:08.226582	2017-02-25 01:05:08.226582	6	18
120	2017-02-25 01:05:08.248775	2017-02-25 01:05:08.248775	6	19
121	2017-02-25 01:05:08.270798	2017-02-25 01:05:08.270798	6	20
122	2017-02-25 01:05:08.293352	2017-02-25 01:05:08.293352	6	21
123	2017-02-25 01:05:08.315603	2017-02-25 01:05:08.315603	6	22
124	2017-02-25 01:05:08.337874	2017-02-25 01:05:08.337874	6	23
125	2017-02-25 01:05:08.359935	2017-02-25 01:05:08.359935	6	24
126	2017-02-25 01:05:08.382751	2017-02-25 01:05:08.382751	6	25
127	2017-02-25 01:05:08.404236	2017-02-25 01:05:08.404236	2	26
128	2017-02-25 01:05:08.42566	2017-02-25 01:05:08.42566	4	26
129	2017-02-25 01:05:08.44911	2017-02-25 01:05:08.44911	6	26
130	2017-02-25 01:05:08.470086	2017-02-25 01:05:08.470086	5	17
131	2017-02-25 01:05:08.493115	2017-02-25 01:05:08.493115	5	14
132	2017-02-25 01:05:08.515575	2017-02-25 01:05:08.515575	5	6
133	2017-02-25 01:05:08.538034	2017-02-25 01:05:08.538034	1	27
134	2017-02-25 01:05:08.560222	2017-02-25 01:05:08.560222	3	27
135	2017-02-25 01:05:08.581057	2017-02-25 01:05:08.581057	4	27
136	2017-02-25 01:05:08.604938	2017-02-25 01:05:08.604938	5	27
137	2017-02-25 01:05:08.627034	2017-02-25 01:05:08.627034	6	27
138	2017-02-25 01:05:08.64882	2017-02-25 01:05:08.64882	7	20
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
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	2017-02-25 01:04:59.569545	2017-02-25 01:04:59.569545	1	1	1	1	5	\N	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	2017-02-25 01:04:59.614554	2017-02-25 01:04:59.614554	1	1	1	1	4	\N	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	2017-02-25 01:04:59.646311	2017-02-25 01:04:59.646311	1	1	1	1	3	\N	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	2017-02-25 01:04:59.678689	2017-02-25 01:04:59.678689	1	1	1	1	2	\N	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	2017-02-25 01:04:59.713914	2017-02-25 01:04:59.713914	1	1	1	1	1	\N	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	2017-02-25 01:04:59.748732	2017-02-25 01:04:59.748732	1	1	1	1	4	\N	\N	7
7	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	2017-02-25 01:04:59.843138	2017-02-25 01:04:59.843138	1	1	2	2	\N	\N	1	\N
8	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	2017-02-25 01:04:59.878489	2017-02-25 01:04:59.878489	1	1	2	1	\N	\N	1	\N
9	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	2017-02-25 01:04:59.914427	2017-02-25 01:04:59.914427	1	1	2	1	\N	\N	1	\N
10	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	2017-02-25 01:04:59.94653	2017-02-25 01:04:59.94653	1	1	2	1	\N	\N	1	\N
11	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	2017-02-25 01:04:59.981275	2017-02-25 01:04:59.981275	1	1	2	1	\N	\N	1	\N
12	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	2017-02-25 01:05:00.012194	2017-02-25 01:05:00.012194	1	1	2	2	\N	\N	1	\N
13	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	2017-02-25 01:05:00.044195	2017-02-25 01:05:00.044195	1	1	2	1	\N	\N	1	\N
14	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	2017-02-25 01:05:00.081677	2017-02-25 01:05:00.081677	1	1	2	1	\N	\N	1	\N
15	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	2017-02-25 01:05:00.113775	2017-02-25 01:05:00.113775	1	1	2	1	\N	\N	1	\N
16	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	2017-02-25 01:05:00.148225	2017-02-25 01:05:00.148225	1	1	2	2	\N	\N	1	\N
17	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	2017-02-25 01:05:00.178813	2017-02-25 01:05:00.178813	1	1	2	1	\N	\N	1	\N
18	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	2017-02-25 01:05:00.212866	2017-02-25 01:05:00.212866	1	1	2	1	\N	\N	1	\N
19	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	2017-02-25 01:05:00.248655	2017-02-25 01:05:00.248655	1	1	2	1	\N	\N	1	\N
20	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	2017-02-25 01:05:00.283255	2017-02-25 01:05:00.283255	1	1	2	2	\N	\N	1	\N
21	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	2017-02-25 01:05:00.313123	2017-02-25 01:05:00.313123	1	1	2	1	\N	\N	1	\N
22	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	2017-02-25 01:05:00.346713	2017-02-25 01:05:00.346713	1	1	2	1	\N	\N	1	\N
23	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	2017-02-25 01:05:00.382342	2017-02-25 01:05:00.382342	1	1	2	1	\N	\N	1	\N
24	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	2017-02-25 01:05:00.424793	2017-02-25 01:05:00.424793	1	1	2	2	\N	\N	1	\N
25	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	2017-02-25 01:05:00.456418	2017-02-25 01:05:00.456418	1	1	2	1	\N	\N	1	\N
26	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	2017-02-25 01:05:00.490967	2017-02-25 01:05:00.490967	1	1	2	1	\N	\N	1	\N
27	CO-001	Berta	Rivera	33958772	1989-04-11	Leandro Gómez	5886			442002	bertarivera@gmail.com	Contacto	2017-02-25 14:23:40.852655	2017-02-25 14:23:40.852655	1	1	1	1	\N	1	1	\N
\.


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 27, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-02-25 01:05:02.123792	2017-02-25 01:05:02.123792	1	7
2	2017-02-25 01:05:02.14611	2017-02-25 01:05:02.14611	1	2
3	2017-02-25 01:05:02.16847	2017-02-25 01:05:02.16847	2	2
4	2017-02-25 01:05:02.19144	2017-02-25 01:05:02.19144	2	8
5	2017-02-25 01:05:02.213609	2017-02-25 01:05:02.213609	2	9
6	2017-02-25 01:05:02.234833	2017-02-25 01:05:02.234833	3	6
7	2017-02-25 01:05:02.25829	2017-02-25 01:05:02.25829	3	10
8	2017-02-25 01:05:02.280567	2017-02-25 01:05:02.280567	3	11
9	2017-02-25 01:05:02.303083	2017-02-25 01:05:02.303083	4	6
10	2017-02-25 01:05:02.3246	2017-02-25 01:05:02.3246	4	12
11	2017-02-25 01:05:02.347281	2017-02-25 01:05:02.347281	4	13
12	2017-02-25 01:05:02.369316	2017-02-25 01:05:02.369316	5	2
13	2017-02-25 01:05:02.390933	2017-02-25 01:05:02.390933	5	14
14	2017-02-25 01:05:02.412965	2017-02-25 01:05:02.412965	5	15
15	2017-02-25 01:05:02.436036	2017-02-25 01:05:02.436036	6	2
16	2017-02-25 01:05:02.45698	2017-02-25 01:05:02.45698	6	16
17	2017-02-25 01:05:02.479709	2017-02-25 01:05:02.479709	6	17
18	2017-02-25 01:05:02.535402	2017-02-25 01:05:02.535402	6	19
19	2017-02-25 01:05:02.556994	2017-02-25 01:05:02.556994	7	6
20	2017-02-25 01:05:02.580506	2017-02-25 01:05:02.580506	7	18
21	2017-02-25 01:05:02.602826	2017-02-25 01:05:02.602826	7	20
22	2017-02-25 01:05:02.638301	2017-02-25 01:05:02.638301	8	2
23	2017-02-25 01:05:02.669076	2017-02-25 01:05:02.669076	8	21
24	2017-02-25 01:05:02.691336	2017-02-25 01:05:02.691336	9	6
25	2017-02-25 01:05:02.71283	2017-02-25 01:05:02.71283	9	22
26	2017-02-25 01:05:02.736151	2017-02-25 01:05:02.736151	9	23
27	2017-02-25 01:05:02.75695	2017-02-25 01:05:02.75695	10	2
28	2017-02-25 01:05:02.780488	2017-02-25 01:05:02.780488	10	24
29	2017-02-25 01:05:02.802587	2017-02-25 01:05:02.802587	10	25
30	2017-02-25 01:05:02.824774	2017-02-25 01:05:02.824774	10	26
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 30, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-02-25 01:04:58.61221	2017-02-25 01:04:58.61221	1
2	Corrientes	2017-02-25 01:04:58.640758	2017-02-25 01:04:58.640758	1
3	Itapúa	2017-02-25 01:04:58.674467	2017-02-25 01:04:58.674467	2
4	Bahia	2017-02-25 01:04:58.708148	2017-02-25 01:04:58.708148	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-02-25 01:05:01.35467	2017-02-25 01:05:01.35467	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-02-25 01:05:01.430458	2017-02-25 01:05:01.430458	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-02-25 01:05:01.511905	2017-02-25 01:05:01.511905	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-02-25 01:05:01.589604	2017-02-25 01:05:01.589604	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-02-25 01:05:01.66711	2017-02-25 01:05:01.66711	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-02-25 01:05:01.744686	2017-02-25 01:05:01.744686	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-02-25 01:05:01.823246	2017-02-25 01:05:01.823246	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-02-25 01:05:01.950184	2017-02-25 01:05:01.950184	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-02-25 01:05:02.025079	2017-02-25 01:05:02.025079	1	1	1	1	1
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com	procare.com	2017-02-25 01:05:01.177003	2017-02-25 01:37:01.929227	1	1	1	1	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 10, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-02-25 01:05:08.706748	2017-02-25 01:05:08.706748
2	super_admin	2017-02-25 01:05:08.725104	2017-02-25 01:05:08.725104
3	Encargado de Proyectos (mentor)	2017-02-25 01:05:08.748879	2017-02-25 01:05:08.748879
4	Miembro de Equipo	2017-02-25 01:05:08.771195	2017-02-25 01:05:08.771195
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-02-25 01:04:59.241554	2017-02-25 01:04:59.241554	1
2	Encargado de recaudaciones e ingresos	2017-02-25 01:04:59.273561	2017-02-25 01:04:59.273561	1
3	Jefe de Recursos Humanos	2017-02-25 01:04:59.295855	2017-02-25 01:04:59.295855	2
4	Jefe de mercadeo	2017-02-25 01:04:59.318335	2017-02-25 01:04:59.318335	3
5	jefe de producción	2017-02-25 01:04:59.339833	2017-02-25 01:04:59.339833	3
6	Investigación y desarrollo	2017-02-25 01:04:59.362952	2017-02-25 01:04:59.362952	4
7	Capacitación - Mentoring	2017-02-25 01:04:59.384745	2017-02-25 01:04:59.384745	4
8	Director General	2017-02-25 01:04:59.405297	2017-02-25 01:04:59.405297	5
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
1	DNI	2017-02-25 01:04:59.016542	2017-02-25 01:04:59.016542
2	Libreta de Enrolamiento	2017-02-25 01:04:59.038229	2017-02-25 01:04:59.038229
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-02-25 01:05:10.375038	2017-02-25 01:05:10.375038
2	Saldo de cuenta	2017-02-25 01:05:10.39632	2017-02-25 01:05:10.39632
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	0	\N	\N	\N	\N	2017-02-25 01:05:09.545558	2017-02-25 01:05:09.545558	1	2
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-02-25 01:05:09.804148	2017-02-25 01:05:09.804148	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-02-25 01:05:10.054609	2017-02-25 01:05:10.054609	2	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-02-25 01:05:11.203758	2017-02-25 01:05:11.203758	1	1
2	2017-01-20	2017-02-25 01:05:11.226866	2017-02-25 01:05:11.226866	1	1
3	2017-02-10	2017-02-25 01:05:11.247955	2017-02-25 01:05:11.247955	2	1
4	2017-02-20	2017-02-25 01:05:11.270868	2017-02-25 01:05:11.270868	2	1
5	2017-03-10	2017-02-25 01:05:11.29265	2017-02-25 01:05:11.29265	3	1
6	2017-03-20	2017-02-25 01:05:11.314624	2017-02-25 01:05:11.314624	3	1
7	2017-04-10	2017-02-25 01:05:11.337841	2017-02-25 01:05:11.337841	4	1
8	2017-04-20	2017-02-25 01:05:11.359872	2017-02-25 01:05:11.359872	4	1
9	2017-05-10	2017-02-25 01:05:11.382373	2017-02-25 01:05:11.382373	5	1
10	2017-05-20	2017-02-25 01:05:11.404293	2017-02-25 01:05:11.404293	5	1
11	2017-06-10	2017-02-25 01:05:11.42717	2017-02-25 01:05:11.42717	6	1
12	2017-06-20	2017-02-25 01:05:11.448999	2017-02-25 01:05:11.448999	6	1
13	2017-07-10	2017-02-25 01:05:11.470649	2017-02-25 01:05:11.470649	7	1
14	2017-07-10	2017-02-25 01:05:11.493583	2017-02-25 01:05:11.493583	7	1
15	2017-08-10	2017-02-25 01:05:11.514725	2017-02-25 01:05:11.514725	8	1
16	2017-08-10	2017-02-25 01:05:11.53822	2017-02-25 01:05:11.53822	8	1
17	2017-09-10	2017-02-25 01:05:11.560532	2017-02-25 01:05:11.560532	9	1
18	2017-09-20	2017-02-25 01:05:11.582388	2017-02-25 01:05:11.582388	9	1
19	2017-10-10	2017-02-25 01:05:11.604679	2017-02-25 01:05:11.604679	10	1
20	2017-10-20	2017-02-25 01:05:11.626089	2017-02-25 01:05:11.626089	10	1
21	2017-11-10	2017-02-25 01:05:11.649463	2017-02-25 01:05:11.649463	11	1
22	2017-11-20	2017-02-25 01:05:11.670788	2017-02-25 01:05:11.670788	11	1
23	2017-12-10	2017-02-25 01:05:11.693835	2017-02-25 01:05:11.693835	12	1
24	2017-12-10	2017-02-25 01:05:11.715426	2017-02-25 01:05:11.715426	12	1
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

