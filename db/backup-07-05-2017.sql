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
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE eventos OWNER TO ana;

--
-- Name: eventos_especialidades; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE eventos_especialidades (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    especialidad_de_contacto_id integer,
    evento_id integer
);


ALTER TABLE eventos_especialidades OWNER TO ana;

--
-- Name: eventos_especialidades_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE eventos_especialidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eventos_especialidades_id_seq OWNER TO ana;

--
-- Name: eventos_especialidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE eventos_especialidades_id_seq OWNED BY eventos_especialidades.id;


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
    area_id integer,
    rol_de_empleado_id integer
);


ALTER TABLE personas OWNER TO ana;

--
-- Name: personas_especialidades; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE personas_especialidades (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    persona_id integer,
    especialidad_de_contacto_id integer
);


ALTER TABLE personas_especialidades OWNER TO ana;

--
-- Name: personas_especialidades_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE personas_especialidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_especialidades_id_seq OWNER TO ana;

--
-- Name: personas_especialidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE personas_especialidades_id_seq OWNED BY personas_especialidades.id;


--
-- Name: personas_eventos; Type: TABLE; Schema: public; Owner: ana; Tablespace: 
--

CREATE TABLE personas_eventos (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    evento_id integer,
    persona_id integer
);


ALTER TABLE personas_eventos OWNER TO ana;

--
-- Name: personas_eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: ana
--

CREATE SEQUENCE personas_eventos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_eventos_id_seq OWNER TO ana;

--
-- Name: personas_eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ana
--

ALTER SEQUENCE personas_eventos_id_seq OWNED BY personas_eventos.id;


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
    numero_abandono integer,
    tiempo_abandono character varying,
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

ALTER TABLE ONLY eventos_especialidades ALTER COLUMN id SET DEFAULT nextval('eventos_especialidades_id_seq'::regclass);


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

ALTER TABLE ONLY personas_especialidades ALTER COLUMN id SET DEFAULT nextval('personas_especialidades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_eventos ALTER COLUMN id SET DEFAULT nextval('personas_eventos_id_seq'::regclass);


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
1	Crear	create	2017-05-06 20:15:14.744037	2017-05-06 20:15:14.744037
2	Eliminar	destroy	2017-05-06 20:15:14.779995	2017-05-06 20:15:14.779995
3	Ver	show	2017-05-06 20:15:14.814858	2017-05-06 20:15:14.814858
4	Index	index	2017-05-06 20:15:14.848164	2017-05-06 20:15:14.848164
5	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-05-06 20:15:14.886494	2017-05-06 20:15:14.886494
6	Editar	update	2017-05-06 20:15:14.912317	2017-05-06 20:15:14.912317
7	Estadisticas	estadistica	2017-05-06 20:15:14.939297	2017-05-06 20:15:14.939297
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 7, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	--- []\n	2017-05-06 20:15:10.260072	2017-05-06 20:15:10.260072	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-05-06 20:15:10.349345	2017-05-06 20:15:10.349345	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-05-06 20:15:10.499869	2017-05-06 20:15:10.499869	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-05-06 20:15:10.574003	2017-05-06 20:15:10.574003	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-05-06 20:15:10.649217	2017-05-06 20:15:10.649217	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-05-06 20:15:10.726444	2017-05-06 20:15:10.726444	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-05-06 20:15:10.797064	2017-05-06 20:15:10.797064	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-05-06 20:15:10.871497	2017-05-06 20:15:10.871497	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-05-06 20:15:10.945127	2017-05-06 20:15:10.945127	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-05-06 20:15:11.018847	2017-05-06 20:15:11.018847	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-05-06 20:15:11.100943	2017-05-06 20:15:11.100943	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-05-06 20:15:21.644704	2017-05-06 20:15:21.644704	1	1	3
2	\N	2017-05-06 20:15:21.708325	2017-05-06 20:15:21.708325	1	2	3
3	\N	2017-05-06 20:15:21.763747	2017-05-06 20:15:21.763747	1	3	2
4	\N	2017-05-06 20:15:21.840469	2017-05-06 20:15:21.840469	2	1	3
5	\N	2017-05-06 20:15:21.899743	2017-05-06 20:15:21.899743	2	2	3
6	\N	2017-05-06 20:15:21.96505	2017-05-06 20:15:21.96505	2	3	2
7	\N	2017-05-06 20:15:22.030897	2017-05-06 20:15:22.030897	3	1	3
8	\N	2017-05-06 20:15:22.088515	2017-05-06 20:15:22.088515	3	2	3
9	\N	2017-05-06 20:15:22.151552	2017-05-06 20:15:22.151552	3	3	2
10	\N	2017-05-06 20:15:22.20835	2017-05-06 20:15:22.20835	4	1	3
11	\N	2017-05-06 20:15:22.274473	2017-05-06 20:15:22.274473	4	2	3
12	\N	2017-05-06 20:15:22.340731	2017-05-06 20:15:22.340731	4	3	2
13	\N	2017-05-06 20:15:22.39685	2017-05-06 20:15:22.39685	5	1	3
14	\N	2017-05-06 20:15:22.455292	2017-05-06 20:15:22.455292	5	2	3
15	\N	2017-05-06 20:15:22.529384	2017-05-06 20:15:22.529384	5	3	2
16	\N	2017-05-06 20:15:22.586444	2017-05-06 20:15:22.586444	6	1	3
17	\N	2017-05-06 20:15:22.651549	2017-05-06 20:15:22.651549	6	2	3
18	\N	2017-05-06 20:15:22.707449	2017-05-06 20:15:22.707449	6	3	2
19	\N	2017-05-06 20:15:22.808106	2017-05-06 20:15:22.808106	7	1	3
20	\N	2017-05-06 20:15:22.852926	2017-05-06 20:15:22.852926	7	2	3
21	\N	2017-05-06 20:15:22.908551	2017-05-06 20:15:22.908551	7	3	2
22	\N	2017-05-06 20:15:22.968508	2017-05-06 20:15:22.968508	8	1	3
23	\N	2017-05-06 20:15:23.033157	2017-05-06 20:15:23.033157	8	2	3
24	\N	2017-05-06 20:15:23.096919	2017-05-06 20:15:23.096919	8	3	2
25	\N	2017-05-06 20:15:23.143823	2017-05-06 20:15:23.143823	9	1	3
26	\N	2017-05-06 20:15:23.218514	2017-05-06 20:15:23.218514	9	2	3
27	\N	2017-05-06 20:15:23.362955	2017-05-06 20:15:23.362955	9	3	2
28	\N	2017-05-06 20:15:23.418638	2017-05-06 20:15:23.418638	10	1	3
29	\N	2017-05-06 20:15:23.474729	2017-05-06 20:15:23.474729	10	2	3
30	\N	2017-05-06 20:15:23.542349	2017-05-06 20:15:23.542349	10	3	2
31	\N	2017-05-06 20:15:23.608057	2017-05-06 20:15:23.608057	11	1	3
32	\N	2017-05-06 20:15:23.686075	2017-05-06 20:15:23.686075	11	2	3
33	\N	2017-05-06 20:15:23.757088	2017-05-06 20:15:23.757088	11	3	2
34	\N	2017-05-06 20:15:23.810915	2017-05-06 20:15:23.810915	12	1	3
35	\N	2017-05-06 20:15:23.874651	2017-05-06 20:15:23.874651	12	2	3
36	\N	2017-05-06 20:15:23.952493	2017-05-06 20:15:23.952493	12	3	2
37	\N	2017-05-06 20:15:24.019036	2017-05-06 20:15:24.019036	13	1	3
38	\N	2017-05-06 20:15:24.074496	2017-05-06 20:15:24.074496	13	2	3
39	\N	2017-05-06 20:15:24.130289	2017-05-06 20:15:24.130289	13	3	2
40	\N	2017-05-06 20:15:24.186424	2017-05-06 20:15:24.186424	14	1	3
41	\N	2017-05-06 20:15:24.251892	2017-05-06 20:15:24.251892	14	2	3
42	\N	2017-05-06 20:15:24.308043	2017-05-06 20:15:24.308043	14	3	2
43	\N	2017-05-06 20:15:24.374268	2017-05-06 20:15:24.374268	15	1	3
44	\N	2017-05-06 20:15:24.452365	2017-05-06 20:15:24.452365	15	2	3
45	\N	2017-05-06 20:15:24.507434	2017-05-06 20:15:24.507434	15	3	2
46	\N	2017-05-06 20:15:24.563568	2017-05-06 20:15:24.563568	16	1	3
47	\N	2017-05-06 20:15:24.6192	2017-05-06 20:15:24.6192	16	2	3
48	\N	2017-05-06 20:15:24.677542	2017-05-06 20:15:24.677542	16	3	2
49	\N	2017-05-06 20:15:24.740915	2017-05-06 20:15:24.740915	17	1	3
50	\N	2017-05-06 20:15:24.808303	2017-05-06 20:15:24.808303	17	2	3
51	\N	2017-05-06 20:15:24.87479	2017-05-06 20:15:24.87479	17	3	2
52	\N	2017-05-06 20:15:24.94257	2017-05-06 20:15:24.94257	18	1	3
53	\N	2017-05-06 20:15:24.998492	2017-05-06 20:15:24.998492	18	2	3
54	\N	2017-05-06 20:15:25.064711	2017-05-06 20:15:25.064711	18	3	2
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 54, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-05-06 20:14:58.122164	2017-05-06 20:14:58.122164
2	Rural	2017-05-06 20:14:58.147184	2017-05-06 20:14:58.147184
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
337	101	Persona	\N	\N	1	User	\N	create	---\ncodigo: '1234'\nnombre: 'Ana '\napellido: Canteros\nnroIdentificacion: '71645800'\nfechaNacimiento: 2017-05-03\ncalle: '124'\nnroDomicilio: '1241'\npiso: ''\ndpto: ''\ntelefono: ''\nemail: valeriana@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	127.0.0.1	f0ff0c83-d4d0-4a4b-85f1-4d0d3cac112c	2017-05-07 03:37:42.28161
319	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	e967894a-d413-4e55-97de-4684d7488c60	2017-05-06 20:15:40.009001
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	4277b775-7496-4133-9b66-0cd0a9affc89	2017-05-06 20:14:58.397677
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	2d36a840-19b5-4add-a0c0-2a126a335480	2017-05-06 20:14:58.501541
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	b0032d68-3d8b-4b30-8bee-8287e13456a4	2017-05-06 20:14:58.575785
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	074ad828-8205-4bc8-bc6c-7ed470f72a5f	2017-05-06 20:14:58.638403
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	2c05fea9-07c0-476f-9b02-36d995c4e1c8	2017-05-06 20:14:58.694668
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	c0795197-897b-4997-abcf-a2b8939bd8d0	2017-05-06 20:14:58.804235
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	40edcb4f-a069-4d7d-85eb-7b6c041935cd	2017-05-06 20:14:58.872265
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	df06ed78-3996-45fc-aa01-41cf88f9a733	2017-05-06 20:14:58.926471
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	31694eb5-6edb-4032-ae11-9b77a48f5d7f	2017-05-06 20:14:58.996596
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	d383ba51-a42c-44f8-a37a-6b11f6fab811	2017-05-06 20:14:59.061536
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	a0bbab7a-73b1-4c87-972e-a4fac948fadc	2017-05-06 20:14:59.129419
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	a835f11c-7852-4162-a3f4-90745e3f3acf	2017-05-06 20:14:59.20018
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	63456ca7-c2e4-435b-ae18-6e6042ca14f2	2017-05-06 20:14:59.273672
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	4eace9d4-bc34-4e0d-9f1d-e15c03bef500	2017-05-06 20:14:59.586915
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	c380385f-8c55-4e01-854e-e946a3ab8057	2017-05-06 20:14:59.735327
171	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	1b928cab-6117-430f-b06f-46d86d9bbc32	2017-05-06 20:15:22.993708
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	5f6069e1-bfc5-4eb1-a876-a5248ba767d9	2017-05-06 20:14:59.830696
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	f35d11ca-66ec-436e-9476-bc2896a1a306	2017-05-06 20:14:59.916256
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	b717169f-7c0b-4d47-807e-78b7a83ddb84	2017-05-06 20:15:00.01628
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	9a3eb2ad-1c66-4f29-8634-365b57429cd0	2017-05-06 20:15:00.134697
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-007\nnombre: Maria\napellido: Gonzalez\nnroIdentificacion: '36134076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mg@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	2a2dca0e-2c1c-4d2e-b43f-0c6cf65eede0	2017-05-06 20:15:00.256625
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-008\nnombre: Elena\napellido: Ceballos\nnroIdentificacion: '25198461'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: ec@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	47a3e8ea-623b-4ef7-a80a-3ab21ab055e7	2017-05-06 20:15:00.359407
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-009\nnombre: Alberto\napellido: Padilla\nnroIdentificacion: '33843657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: ap@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	d1d17636-d66b-47f9-a9c8-d5d57fdb63fa	2017-05-06 20:15:00.45986
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-010\nnombre: Fernando\napellido: Gonzalez\nnroIdentificacion: '33980912'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: fg@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	ccac6265-a450-43f1-b09e-5f3f5abb7aa9	2017-05-06 20:15:00.570856
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-011\nnombre: Tiago\napellido: Gonzalez\nnroIdentificacion: '38187222'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: tiagogonzales@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	c5fb2da3-3fa5-4909-842e-b07923edb3ee	2017-05-06 20:15:00.687826
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-012\nnombre: Cintia\napellido: Castro\nnroIdentificacion: '22612413'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cintiacastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	77948482-0efc-4e3c-b049-79a17f30a44b	2017-05-06 20:15:00.794882
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-013\nnombre: Josefina\napellido: Jardin\nnroIdentificacion: '36025176'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: josefinajardin@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	192747e7-469c-44fc-91c9-29494b31afff	2017-05-06 20:15:00.896038
158	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	78502591-21cb-42c8-a2b9-643bc057d9e7	2017-05-06 20:15:22.173179
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-014\nnombre: Diana\napellido: Rivas\nnroIdentificacion: '25948001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: dianarivas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4f404f11-9700-49d3-a99a-a995e74c6822	2017-05-06 20:15:00.99101
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-015\nnombre: Dario\napellido: Gonzalez\nnroIdentificacion: '33880019'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: dariogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	7fd03d2e-f24e-4f47-aac8-c0e918463942	2017-05-06 20:15:01.097838
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-016\nnombre: Ciro\napellido: Zamora\nnroIdentificacion: '33983707'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: cirozamora@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	dc260b21-c3d1-4c39-ad10-2171adadae03	2017-05-06 20:15:01.195953
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-017\nnombre: Zoe\napellido: Vazquez\nnroIdentificacion: '3818104'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoevazquez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	d1093df4-dbf6-4472-a136-7435eb6a2b30	2017-05-06 20:15:01.29383
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-018\nnombre: Cristian\napellido: Gonzalez\nnroIdentificacion: '22659193'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cristiangonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2bd6f998-491d-4d88-a9e3-d6afe92eda52	2017-05-06 20:15:01.393888
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-019\nnombre: Ana\napellido: Manfrin\nnroIdentificacion: '36222076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: anamanfrin@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	e219168f-422c-4b76-9c8a-89917beb35b2	2017-05-06 20:15:01.498122
172	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	0f921e8d-ca7b-4672-855f-13c769392286	2017-05-06 20:15:23.057385
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-020\nnombre: Martina\napellido: Adamo\nnroIdentificacion: '25841001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaadamo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	fdcf02b0-dbbd-4fd9-8a42-734acb4a828d	2017-05-06 20:15:01.604708
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-021\nnombre: Roberto\napellido: Milani\nnroIdentificacion: '33880333'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: robertomilani@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	970b0d0b-e7c7-4f41-95d0-8e9201aff565	2017-05-06 20:15:01.692942
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-022\nnombre: Victor\napellido: Gonzalez\nnroIdentificacion: '33984447'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	836b081e-8d7a-474d-b026-19ef6fd08a98	2017-05-06 20:15:01.803513
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-023\nnombre: Alejandro\napellido: Cambril\nnroIdentificacion: '38113409'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: alejandrocambril@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	8599e6af-094b-4f80-abc2-7ae07b184ecc	2017-05-06 20:15:01.924898
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-024\nnombre: Luis\napellido: Rizzo\nnroIdentificacion: '22543493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luisrizzo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	c83c4299-b412-453f-b0e6-a8ae3b52db05	2017-05-06 20:15:02.029137
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-025\nnombre: Mario\napellido: Rosas\nnroIdentificacion: '36060986'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mariorosas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	6db24673-ae61-421e-ac26-9b2eaab716c9	2017-05-06 20:15:02.115528
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-026\nnombre: Analia\napellido: Granados\nnroIdentificacion: '25131701'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: analiagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4cfbd392-f47f-4e65-9bd7-5c6752a068f6	2017-05-06 20:15:02.226887
40	27	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-027\nnombre: Leonor\napellido: Gonzalez\nnroIdentificacion: '33888717'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: leonorgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	fca6cab7-16a6-44ef-bdc6-55910789000f	2017-05-06 20:15:02.346172
41	28	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-028\nnombre: Victor\napellido: Baresi\nnroIdentificacion: '33928407'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorbaresi@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	618b43c5-80d0-47f5-835f-c5eed20da9da	2017-05-06 20:15:02.47318
42	29	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-029\nnombre: Silvana\napellido: Lazzaga\nnroIdentificacion: '38918849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: silvanalazzaga@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	69ddfc87-10a8-4bad-9beb-49e9a2c97ad5	2017-05-06 20:15:02.558201
43	30	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-030\nnombre: Juana\napellido: Calabrese\nnroIdentificacion: '220192493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: janacalabrese@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	52091b99-bf9a-4696-9ff1-5fea7b14df2f	2017-05-06 20:15:02.658071
44	31	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-031\nnombre: Juliana\napellido: Lombardi\nnroIdentificacion: '38613849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: julianalombardi@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	b9de785c-65b0-40d5-aabc-74ba23274447	2017-05-06 20:15:02.752293
45	32	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-032\nnombre: Enrique\napellido: Cano\nnroIdentificacion: '22451493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: enriquecano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	117ee8e3-5041-4dfa-9fed-94863fe39ded	2017-05-06 20:15:02.862598
46	33	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-033\nnombre: Gilda\napellido: Lombarde\nnroIdentificacion: '36064356'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: gildalombarde@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	13cef7a5-d68a-4645-9a52-95654b08e7a1	2017-05-06 20:15:02.966661
47	34	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-034\nnombre: Martin\napellido: Bande\nnroIdentificacion: '25124501'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinbande@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	de02e46b-906c-4c67-ad3a-508aa7fa8405	2017-05-06 20:15:03.064889
48	35	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-035\nnombre: Gabriel\napellido: Ferruccio\nnroIdentificacion: '33451657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: gabrielferuccio@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	d5443280-11c8-4e5d-8ae1-9298747eab82	2017-05-06 20:15:03.162076
49	36	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-036\nnombre: Juan\napellido: Mazzanti\nnroIdentificacion: '33956107'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: juanmazzanti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	58cd617b-8b98-40a1-b3c9-99079cd83fec	2017-05-06 20:15:03.270853
50	37	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-037\nnombre: Karina\napellido: Fiorentino\nnroIdentificacion: '38663849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: karinafiorentino@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	6bc95315-28f4-40b5-8296-00c17ffbac53	2017-05-06 20:15:03.355984
51	38	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-038\nnombre: Osvaldo\napellido: Pagnotto\nnroIdentificacion: '22019493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: osvaldopagnotto@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	b6996bf5-1bb9-4e40-a2a6-08f2a97f8ddd	2017-05-06 20:15:03.458068
52	39	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-039\nnombre: Margarita\napellido: Giordano\nnroIdentificacion: '36068886'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: margaritagiordano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	c3713bea-b6e5-4359-98a2-c94e86dd0219	2017-05-06 20:15:03.548964
53	40	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-040\nnombre: Rosa\napellido: Napolitano\nnroIdentificacion: '2576401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: rosanapolitano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	74df7ed3-aeb6-4237-bfe6-270145f483b5	2017-05-06 20:15:03.639916
54	41	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-041\nnombre: Magdalena\napellido: Bruno\nnroIdentificacion: '38817849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: mardalenabruno@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	1fa0fd6f-69d2-4a9d-944c-f1ebfa20eff7	2017-05-06 20:15:03.747153
55	42	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-042\nnombre: Mauricio\napellido: Costa\nnroIdentificacion: '22755493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: mauriciocosta@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4217a73d-ded0-4c7e-be51-bdb9442156c0	2017-05-06 20:15:03.857929
56	43	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-043\nnombre: Ivan\napellido: Costas\nnroIdentificacion: '36755076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: ivancostas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	fd9cd428-cce7-49d1-bdf3-60f6af194ab8	2017-05-06 20:15:03.948592
57	44	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-044\nnombre: Pablo\napellido: Davide\nnroIdentificacion: '251934401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: pablodavide@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	86cf58ee-5750-4f24-9458-ddfb635e70ea	2017-05-06 20:15:04.045456
58	45	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-045\nnombre: Nicolas\napellido: Medina\nnroIdentificacion: '33801927'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: nicolasmedina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	2117c21a-1ff3-4b5a-b27b-9ea8c386c372	2017-05-06 20:15:04.148343
59	46	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-046\nnombre: Celeste\napellido: Milano\nnroIdentificacion: '35122307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: celestemilano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	2e6dd5f4-815e-4f06-81b7-c7fb1852c746	2017-05-06 20:15:04.257614
60	47	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-047\nnombre: Sebastian\napellido: Schiavone\nnroIdentificacion: '38175649'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: sebastianschiavone@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	f2c68e37-77a3-4609-9cc7-ae5c63a5a209	2017-05-06 20:15:04.372233
61	48	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-048\nnombre: Ruben\napellido: Almedina\nnroIdentificacion: '22891493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: rubenalmedina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2bfaf77d-364a-4b4f-a910-c4bda349b5ab	2017-05-06 20:15:04.480736
62	49	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-049\nnombre: Cristian\napellido: Camiño\nnroIdentificacion: '36093716'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: cristiancamiño@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	8d71f5ad-2095-45d4-8e2d-b148e79c2ab7	2017-05-06 20:15:04.580492
63	50	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-050\nnombre: Monica\napellido: Conti\nnroIdentificacion: '25888001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: monicaconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	030394d5-0faf-47b5-8477-cb1b8c5e2cbe	2017-05-06 20:15:04.682096
64	51	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ef44d66b-3460-419f-85ef-69e4b7e0cf3b	2017-05-06 20:15:04.889336
65	52	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	85f96721-67b8-4fc9-a36b-219ae7636f67	2017-05-06 20:15:04.983635
66	53	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ae6a6b36-ab3f-403d-9f85-5ff94510529d	2017-05-06 20:15:05.068646
67	54	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8b5fff22-acaa-48b8-8a38-2c282e712428	2017-05-06 20:15:05.173522
127	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	0e1f07cc-0bb5-4da9-acf5-175a2b9dd724	2017-05-06 20:15:11.045135
68	55	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9ab89b1a-64ec-4222-ac2b-f2bb78db26b9	2017-05-06 20:15:05.279331
69	56	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	908eb1cd-2431-4855-9cfe-6e32cfa0e387	2017-05-06 20:15:05.449989
70	57	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cdca4c8b-f12e-4ea6-862c-6242319c55ba	2017-05-06 20:15:05.547443
71	58	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8e754027-59b5-41d3-b6ef-8218a249f3ca	2017-05-06 20:15:05.636066
72	59	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5f2bcc21-5fd0-4876-869b-a61f6106f337	2017-05-06 20:15:05.742125
73	60	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	95205bed-35d9-45fc-9fc8-70427532fe1a	2017-05-06 20:15:05.841355
74	61	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	be262b5b-2098-4da6-bf54-7437f08a04a6	2017-05-06 20:15:05.942492
75	62	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	89f9c603-8c37-4ac0-bd76-0fe17287e934	2017-05-06 20:15:06.047721
76	63	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	16fa19bc-0211-436b-9b0b-de41926e38d0	2017-05-06 20:15:06.150742
77	64	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	dec110fd-6163-479e-933f-a61461fcd4c8	2017-05-06 20:15:06.233614
78	65	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f6603364-2ba4-4c46-8cad-da97ee3d2599	2017-05-06 20:15:06.326559
79	66	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	04ff4a23-cb0b-42a9-a6fc-69056f05b9f8	2017-05-06 20:15:06.420075
80	67	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b33fcaef-45df-4061-ab58-d26919c0992b	2017-05-06 20:15:06.509842
81	68	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4dbaec6f-b055-426a-a8fb-06aa459a00aa	2017-05-06 20:15:06.617761
82	69	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ddd0d7fa-84c8-4955-b8d2-40741d6ad89b	2017-05-06 20:15:06.72742
83	70	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	aa10307d-47e2-4a53-8d8c-82df8ed2d216	2017-05-06 20:15:06.818896
84	71	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-021\nnombre: Lidia\napellido: Delucci\nnroIdentificacion: '28088944'\nfechaNacimiento: 1981-01-29\ncalle: Chile\nnroDomicilio: '6144'\npiso: ''\ndpto: ''\ntelefono: '481898'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	08968aba-bcf7-4a80-85c3-a2eefb0c2977	2017-05-06 20:15:06.924618
85	72	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-022\nnombre: Leonor\napellido: Gomez Santos\nnroIdentificacion: '40560231'\nfechaNacimiento: 1996-03-13\ncalle: Plaza Mayor\nnroDomicilio: '2637'\npiso: ''\ndpto: ''\ntelefono: '4536662'\nemail: leonorgs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4ea3f366-7ea3-4908-a46b-8bef88b9c998	2017-05-06 20:15:07.027537
86	73	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-023\nnombre: Lara\napellido: Gonçalves\nnroIdentificacion: '29075344'\nfechaNacimiento: 1980-07-19\ncalle: España\nnroDomicilio: '1415'\npiso: ''\ndpto: ''\ntelefono: '4498457'\nemail: laragoncalves@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7751a788-e3b3-42ec-bfe4-5dace22b3fff	2017-05-06 20:15:07.117713
87	74	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-024\nnombre: Martin\napellido: Diaz\nnroIdentificacion: '26070390'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: martindiaz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1acfbfe0-3c19-4d22-9fe5-994c297e4033	2017-05-06 20:15:07.224318
88	75	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-025\nnombre: Marina\napellido: Diaz\nnroIdentificacion: '26070394'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: marinadiaz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1ce02f8d-3130-4e43-8557-9cdbef090561	2017-05-06 20:15:07.338797
89	76	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-026\nnombre: Gerardo\napellido: Urbina\nnroIdentificacion: '29234987'\nfechaNacimiento: 1980-05-31\ncalle: "Álamo"\nnroDomicilio: '6162'\npiso: ''\ndpto: ''\ntelefono: '455433'\nemail: gerardou@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	52b556f9-9458-4e28-9b45-8c16855d3887	2017-05-06 20:15:07.430599
90	77	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-027\nnombre: Silvio\napellido: Quiroz\nnroIdentificacion: '35465922'\nfechaNacimiento: 1990-02-27\ncalle: "Álamo"\nnroDomicilio: '2128'\npiso: ''\ndpto: ''\ntelefono: '415176'\nemail: silvioquiroz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e9c1b4e6-ca42-4b15-9625-940c840a2190	2017-05-06 20:15:07.515709
91	78	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-028\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '33457976'\nfechaNacimiento: 1987-12-19\ncalle: Alem\nnroDomicilio: '123'\npiso: ''\ndpto: ''\ntelefono: '451912'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7fe20a89-b858-43f1-92c0-c4ed7b9e36b3	2017-05-06 20:15:07.606393
92	79	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-029\nnombre: Leonardo\napellido: Rios\nnroIdentificacion: '29524865'\nfechaNacimiento: 1981-11-30\ncalle: Concepcion\nnroDomicilio: '5139'\npiso: ''\ndpto: ''\ntelefono: '4590871'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	066fe270-f52a-4847-a7f0-fe2a000b84bc	2017-05-06 20:15:07.698576
93	80	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-030\nnombre: Ubaldo\napellido: Gomez\nnroIdentificacion: '34123456'\nfechaNacimiento: 1990-04-08\ncalle: Entre Rios\nnroDomicilio: '1235'\npiso: ''\ndpto: ''\ntelefono: '456798'\nemail: ubaldogomez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9eab38e3-43c5-4b4c-ae7a-bcd03e87a165	2017-05-06 20:15:07.78689
94	81	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-031\nnombre: Silvio\napellido: Gonzalez\nnroIdentificacion: '29092236'\nfechaNacimiento: 1980-05-16\ncalle: Cordoba\nnroDomicilio: '7213'\npiso: ''\ndpto: ''\ntelefono: '4501923'\nemail: silviogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a16dd50e-ca24-4574-b925-eb4057ad0c34	2017-05-06 20:15:07.893516
95	82	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-032\nnombre: Rosa\napellido: Fernandez\nnroIdentificacion: '20112254'\nfechaNacimiento: 1968-09-13\ncalle: San Martin\nnroDomicilio: '1028'\npiso: ''\ndpto: ''\ntelefono: '4567895'\nemail: rosafernandez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	220fcd0e-1b42-4431-bf9a-d06df22c2da8	2017-05-06 20:15:07.984125
96	83	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-033\nnombre: Alejandro\napellido: Fernandez\nnroIdentificacion: '20998871'\nfechaNacimiento: 1987-05-16\ncalle: Santa Fe\nnroDomicilio: '4812'\npiso: ''\ndpto: ''\ntelefono: '4311235'\nemail: alefernandez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	96052650-d20d-4689-a037-85a84414738f	2017-05-06 20:15:08.086452
97	84	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-034\nnombre: Hugo\napellido: Rios\nnroIdentificacion: '40034940'\nfechaNacimiento: 1998-11-30\ncalle: Alvear\nnroDomicilio: '5028'\npiso: ''\ndpto: ''\ntelefono: '481341'\nemail: hugorios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7e04e2da-6fb9-4f76-ac95-1841a24daf6a	2017-05-06 20:15:08.182774
98	85	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-035\nnombre: Mario\napellido: Garcia\nnroIdentificacion: '24654447'\nfechaNacimiento: 1976-04-08\ncalle: Roca\nnroDomicilio: '193'\npiso: ''\ndpto: ''\ntelefono: '4212351'\nemail: mariogarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	dae2b52f-263a-4944-9d36-a95c06945001	2017-05-06 20:15:08.323029
99	86	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-036\nnombre: Marina\napellido: Moralez\nnroIdentificacion: '36421952'\nfechaNacimiento: 1992-08-19\ncalle: Ucrania\nnroDomicilio: '9371'\npiso: ''\ndpto: ''\ntelefono: '451241'\nemail: marimamoralez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c1296608-9cd1-448f-96ca-fb14811dc644	2017-05-06 20:15:08.425837
100	87	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-037\nnombre: Silvina\napellido: Portillo\nnroIdentificacion: '26498388'\nfechaNacimiento: 1976-06-05\ncalle: Av Queirel\nnroDomicilio: '7621'\npiso: ''\ndpto: ''\ntelefono: '431214'\nemail: silvinaportillo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9516a0a7-84c8-4482-a1ba-6008b13255f6	2017-05-06 20:15:08.527914
101	88	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-038\nnombre: Maria\napellido: Maciel\nnroIdentificacion: '33428434'\nfechaNacimiento: 1989-09-04\ncalle: Paraguay\nnroDomicilio: '600'\npiso: ''\ndpto: ''\ntelefono: '4761602'\nemail: mariamaciel@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5c3dcd84-4ab4-4d69-b615-cdf5aba03b82	2017-05-06 20:15:08.631688
102	89	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-039\nnombre: Angeles\napellido: Granados\nnroIdentificacion: '31452518'\nfechaNacimiento: 1981-04-09\ncalle: Uruguay\nnroDomicilio: '12'\npiso: ''\ndpto: ''\ntelefono: '481858'\nemail: angelesgranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6a3b2bc3-88d2-4896-ab1a-f530e77e1758	2017-05-06 20:15:08.72173
103	90	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-040\nnombre: Cintia\napellido: Gutierrez\nnroIdentificacion: '29701192'\nfechaNacimiento: 1992-11-05\ncalle: Av Roca\nnroDomicilio: '464'\npiso: ''\ndpto: ''\ntelefono: '483498'\nemail: cintiagutierrez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0565b3b2-1501-4233-b7bc-e25f8db5081d	2017-05-06 20:15:08.818148
104	91	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-041\nnombre: David\napellido: Sedillo\nnroIdentificacion: '36371823'\nfechaNacimiento: 1975-07-23\ncalle: Centenario\nnroDomicilio: '6135'\npiso: ''\ndpto: ''\ntelefono: '481018'\nemail: davidsedillo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3b6695fa-0960-44ca-8154-08b8e6fefe20	2017-05-06 20:15:08.915089
105	92	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-042\nnombre: Sofia\napellido: Garcia\nnroIdentificacion: '25370180'\nfechaNacimiento: 1998-01-13\ncalle: Las Flores\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '409498'\nemail: sofiagarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d1b5217b-7d16-41af-9517-e2fa5b391c58	2017-05-06 20:15:09.014777
106	93	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-043\nnombre: Alicia\napellido: Villalba\nnroIdentificacion: '27455263'\nfechaNacimiento: 1979-04-17\ncalle: Las Palmeras\nnroDomicilio: '9876'\npiso: ''\ndpto: ''\ntelefono: '420184'\nemail: alivillalba@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	03d2467a-bf58-45b2-a90b-97ba60d29c38	2017-05-06 20:15:09.118096
107	94	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-044\nnombre: Luis\napellido: Gonzalez\nnroIdentificacion: '36182911'\nfechaNacimiento: 1992-06-19\ncalle: Las Orquideas\nnroDomicilio: '900'\npiso: ''\ndpto: ''\ntelefono: '495712'\nemail: luisgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e45accee-e4b6-4fa0-9f26-2ffacf3787a9	2017-05-06 20:15:09.219527
108	95	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-045\nnombre: Ernesto\napellido: Da Luz\nnroIdentificacion: '30346514'\nfechaNacimiento: 1983-06-19\ncalle: Rosas\nnroDomicilio: '2463'\npiso: ''\ndpto: ''\ntelefono: '413048'\nemail: ernestodaluz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6dd6b5fc-cb48-48af-ba5b-13dbc5d36e77	2017-05-06 20:15:09.303426
109	96	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-046\nnombre: Luciano\napellido: Garcia\nnroIdentificacion: '39019733'\nfechaNacimiento: 1996-03-13\ncalle: Colon\nnroDomicilio: '8123'\npiso: ''\ndpto: ''\ntelefono: '412451'\nemail: lucianogarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9722c6b4-a4a8-4c9c-a892-671a26c7928a	2017-05-06 20:15:09.399745
110	97	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-047\nnombre: Gerardo\napellido: Cano\nnroIdentificacion: '29232117'\nfechaNacimiento: 1980-07-19\ncalle: Escuelita\nnroDomicilio: '9173'\npiso: ''\ndpto: ''\ntelefono: '462093'\nemail: gerardocano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6ea7ac86-213d-4936-8e66-65df387d733b	2017-05-06 20:15:09.510552
111	98	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-048\nnombre: Hector\napellido: Rincon\nnroIdentificacion: '29222287'\nfechaNacimiento: 1980-05-31\ncalle: Japon\nnroDomicilio: '2546'\npiso: ''\ndpto: ''\ntelefono: '471927'\nemail: hectorrincon@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	248e5d40-326e-4996-adf3-f9a99cb75df6	2017-05-06 20:15:09.609649
112	99	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-049\nnombre: Alberto\napellido: Gonzalez\nnroIdentificacion: '35225922'\nfechaNacimiento: 1990-02-27\ncalle: Colombia\nnroDomicilio: '2871'\npiso: ''\ndpto: ''\ntelefono: '431570'\nemail: albertogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	746d1b6e-37c6-440e-b71d-7759c02f190c	2017-05-06 20:15:09.696789
113	100	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-050\nnombre: Roberto\napellido: Lujan\nnroIdentificacion: '35461122'\nfechaNacimiento: 1990-05-27\ncalle: Noruega\nnroDomicilio: '1980'\npiso: ''\ndpto: ''\ntelefono: '401938'\nemail: robertolujan@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	746a48bc-42a3-495d-a7a4-65ff4566ed2a	2017-05-06 20:15:09.800701
114	1	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Pre incubacion\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	4c62a445-8c70-481f-b85b-35674a3a7333	2017-05-06 20:15:09.934071
115	2	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Incubación\ndescripcion: "-"\netapaAnterior: 1\n	1	\N	\N	cb7b0321-69f8-4398-b3a6-69639e937e3a	2017-05-06 20:15:10.007143
116	3	Etapa	\N	\N	1	\N	\N	create	---\nnombre: post incubacion\ndescripcion: "-"\netapaAnterior: 2\n	1	\N	\N	d450e22c-e7f6-4309-bfc2-866c92f5e2ec	2017-05-06 20:15:10.078285
117	4	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Cuarta etapa\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	4b0bddba-9353-42ac-9a45-c84a653b07fb	2017-05-06 20:15:10.140885
118	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: []\netapa_id: 1\n	1	\N	\N	5c4487d9-827c-4397-bfa8-7e783d49aedb	2017-05-06 20:15:10.290072
119	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	459d30fe-f4b1-4316-94b2-98420f0fa5ef	2017-05-06 20:15:10.379931
120	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	6b802376-dd3f-4efd-9015-dc811250915b	2017-05-06 20:15:10.529198
121	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	9a0f413c-50c1-4bf9-9d4b-d11870fd0fd2	2017-05-06 20:15:10.599407
122	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	632c8575-32b5-4473-b818-7806a321160f	2017-05-06 20:15:10.675814
123	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	52d5b13f-47b2-4566-b1de-5e8561fec6ad	2017-05-06 20:15:10.759111
124	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	7d05e396-b3de-44c6-828e-748c330625c9	2017-05-06 20:15:10.827358
125	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	8b6eef18-7674-419d-8732-47e9158086e4	2017-05-06 20:15:10.899274
126	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	cfd08fb5-851b-4184-823c-6d46fcacb824	2017-05-06 20:15:10.969915
128	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	7b81bd0b-6541-4ab9-bc82-54545a3b9cae	2017-05-06 20:15:11.128562
129	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	df314e33-250a-4767-ac13-941b8b0f3b2c	2017-05-06 20:15:11.487462
130	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	9ab62aef-d7fc-4932-9929-2561d9aaa40b	2017-05-06 20:15:11.637111
131	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	8bc89589-bd9c-466e-8280-ffe476ddae79	2017-05-06 20:15:11.731849
132	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	6e4675bc-50df-43d2-9bd1-21394aa5df2c	2017-05-06 20:15:11.81246
133	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	991717bd-3d0e-4100-9d4d-62335c9c9e9e	2017-05-06 20:15:11.895004
134	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	9f166d4c-eb09-40e4-abba-1545019fea19	2017-05-06 20:15:11.984014
135	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	054c370a-cbe8-4d7d-b327-ae0c9db5dd2e	2017-05-06 20:15:12.086528
136	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	df4f2eed-b2ca-4574-bc9f-291278a34e92	2017-05-06 20:15:12.175023
137	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	ca42211c-b99f-4916-b26f-01fd429b2f81	2017-05-06 20:15:12.261491
138	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	9064e9d9-9f8c-4057-bc12-9b960bce1952	2017-05-06 20:15:12.359242
139	11	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-011\nnombre: Percentil\ndescripcion: Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes\n  en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para\n  hacerlo en escala y poder ganar dinero con ello.\ncalle: España\nnroDomicilio: '422'\npiso: ''\ndpto: ''\ntelefono: '4590432'\nemail: percentil@gmail.com\npagWeb: percentil.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	0ebdf621-3318-45ff-9dda-32dd1d9dbd28	2017-05-06 20:15:12.462448
140	12	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-012\nnombre: EmbryoTools\ndescripcion: " Son una referencia mundial en reproducción asistida. Trabajan en cuatro\n  ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos,\n  porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante\n  práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan\n  es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción\n  asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de\n  los productos que vayan a entrar en contacto con embriones humanos y por último\n  trabajan en la reproducción asistida en veterinaria."\ncalle: Mariano Moreno\nnroDomicilio: '4122'\npiso: ''\ndpto: ''\ntelefono: '465888'\nemail: embryotools@gmail.com\npagWeb: embryotools.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	593edb0f-6af3-4628-a8f1-6390052e8e7f	2017-05-06 20:15:12.551829
141	13	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-013\nnombre: Aplázame\ndescripcion: " Es un método de pago que se integra en el proceso de compra del comercio\n  electrónico y permite a los clientes de las tiendas online comprar con un crédito\n  instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su\n  método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando\n  para hacerlo en breve."\ncalle: Av. San Martin\nnroDomicilio: '4532'\npiso: ''\ndpto: ''\ntelefono: '453222'\nemail: aplazame@gmail.com\npagWeb: aplazame.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b228e499-790c-41ff-b6ab-c43a691e63ab	2017-05-06 20:15:12.646828
170	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	00a24bb3-415a-4a27-8310-fe37e06a9e7f	2017-05-06 20:15:22.932081
142	14	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-014\nnombre: BrioAgro Technologies\ndescripcion: Deesarrollo de una tecnología para que el agricultor controle su explotación.\n  El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor,\n  a través de su dispositivo, se conecta a la nube para acceder a la información de\n  su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier\n  cambio en sus variables.\ncalle: 'Colon '\nnroDomicilio: '555'\npiso: ''\ndpto: ''\ntelefono: '4651244'\nemail: bioagro@gmail.com\npagWeb: bioagro.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	087fb8ad-306d-4c13-80d2-a8642595eed6	2017-05-06 20:15:12.734984
143	15	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-015\nnombre: Braingaze\ndescripcion: La tecnología desarrollada detecta un pequeño movimiento ocular que permite\n  determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad\n  (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y\n  dislexia.\ncalle: Miami\nnroDomicilio: '708'\npiso: ''\ndpto: ''\ntelefono: '490123'\nemail: baringaze@gmail.com\npagWeb: braingaze.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	2c82b60c-62f2-4fc1-9cd1-0f462b47a4d8	2017-05-06 20:15:12.826455
144	16	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-016\nnombre: CreatorStats\ndescripcion: Mejoran la métrica de los ‘youtubers’.\ncalle: Inglaterra\nnroDomicilio: '200'\npiso: ''\ndpto: ''\ntelefono: '15432510'\nemail: creatorstats@gmail.com\npagWeb: creatorstats.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	caa7af96-ed6a-4235-bfa6-b13c0fb1cac2	2017-05-06 20:15:12.92006
145	17	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-017\nnombre: Alzhup\ndescripcion: Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar\n  de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología\n  como vehículo para que la solución sea accesible a todo el mundo. Implementan a\n  nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado\n  ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados\n  científicamente. Y también, herramientas para la memoria, capaces de personalizar\n  dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo\n  mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro\n  almacena los recuerdos y que difiere de los sistemas actuales computarizados.\ncalle: Constitucion\nnroDomicilio: '2222'\npiso: ''\ndpto: ''\ntelefono: '467632'\nemail: alzhup@gmail.com\npagWeb: alzhup.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	621ec4d1-9931-48b3-8e60-22886bcee931	2017-05-06 20:15:13.011439
146	18	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-018\nnombre: Axter Aerospace\ndescripcion: Están desarrollando un sistema de propulsión híbrida para las avionetas,\n  que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso\n  trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración\n  con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto\n  se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU.\n  De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción\n  y ensamblado.\ncalle: Ayacucho\nnroDomicilio: '9200'\npiso: ''\ndpto: ''\ntelefono: '432111'\nemail: axteraerospace@gmail.com\npagWeb: axteraerospace.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	ad4202b2-887d-4fd5-9dea-ae46ff34a786	2017-05-06 20:15:13.088573
147	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	173a06de-bcb3-4406-b369-f442e0c6bbeb	2017-05-06 20:15:21.421512
148	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	4d063b38-342a-4c72-a0b5-d55e873a1a66	2017-05-06 20:15:21.492086
149	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	f69794b8-c83f-406c-9f3f-6445543ad60b	2017-05-06 20:15:21.550981
150	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c6f3fc80-269f-41ee-addc-b3a785b70a4c	2017-05-06 20:15:21.673758
151	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a9bae0cb-6a21-45e8-9772-a31dc52f912a	2017-05-06 20:15:21.731407
152	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	daf19acf-3c2f-48af-b50b-d0c3de6d3217	2017-05-06 20:15:21.798908
153	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	bf3e4880-f031-4890-829b-0e781f68ec70	2017-05-06 20:15:21.864677
154	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	99454805-771e-48e3-9834-d1c8a148be12	2017-05-06 20:15:21.932338
155	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0dc0fa2f-35b5-4590-9eaa-4e5a04073ee9	2017-05-06 20:15:21.992158
156	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	21fc04e3-1a94-45ad-94f6-a249260fb16e	2017-05-06 20:15:22.055993
157	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	163c4d69-1855-4b6a-aaf7-9a12a3ce7ddd	2017-05-06 20:15:22.117507
159	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	402d25ac-8741-4aea-8d0c-f51e39f824ed	2017-05-06 20:15:22.231089
160	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	dd5e2de2-ded8-4530-a60d-bef717dde9e1	2017-05-06 20:15:22.302222
161	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	3e336c77-0355-4c0b-9dab-b3901fd73613	2017-05-06 20:15:22.361892
162	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	60b635c5-f812-4fc4-a3e1-51a826add67c	2017-05-06 20:15:22.421033
163	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	91459dca-572a-4133-966d-f5f8c312590b	2017-05-06 20:15:22.481653
164	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	1df65c60-a8ff-4a81-aa96-1c305b231650	2017-05-06 20:15:22.55015
165	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	e0d69c03-5d09-452b-ab2a-feee3ceb8685	2017-05-06 20:15:22.614571
166	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	aefc39b4-3cc4-4b0d-817b-26d2bd821a1a	2017-05-06 20:15:22.671537
167	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	cd637740-b7a3-4f29-844d-e34e7f31b88d	2017-05-06 20:15:22.728933
168	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	30205387-68ee-4348-b7c5-43e8366ddef0	2017-05-06 20:15:22.826265
169	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a5d8d7d6-8b7e-4b08-90b3-ddbbc37e14d5	2017-05-06 20:15:22.870723
173	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	d7905b8e-647a-4a98-b12c-839bcb2f62bd	2017-05-06 20:15:23.115073
174	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	5762426b-2729-4cda-b0fa-67a14a9d05f4	2017-05-06 20:15:23.167998
175	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a3481908-6d57-4072-913a-c7ceca90ec96	2017-05-06 20:15:23.327208
176	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	66a3c6b7-0282-4c68-9136-0d5e07ad0cfa	2017-05-06 20:15:23.383865
177	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	72ade289-6ebc-4938-ad64-0e693ee383b1	2017-05-06 20:15:23.441503
178	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	c8a535f0-8052-4d2c-9701-8a4cfde2668d	2017-05-06 20:15:23.50112
179	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	4d026000-3c44-42f1-8c30-db60e19bf618	2017-05-06 20:15:23.565919
180	31	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	087261c7-847c-4a05-9e4e-a4dce740f107	2017-05-06 20:15:23.639105
181	32	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b8e2418f-a613-4443-992c-b00bd0913a91	2017-05-06 20:15:23.708856
182	33	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	af265f47-3a72-41b5-a89d-e2b55858a20e	2017-05-06 20:15:23.776772
183	34	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	fc95d4ca-090e-40e6-814b-706727762411	2017-05-06 20:15:23.833726
184	35	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	ae8b313e-1de0-49d6-ac44-6cc924dc2f1c	2017-05-06 20:15:23.903214
185	36	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	99c03b6d-611d-4c6b-b65c-df268d8eda51	2017-05-06 20:15:23.982202
186	37	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	392fabe4-b398-4fd5-ad09-619ea76e3141	2017-05-06 20:15:24.042311
187	38	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	fd628c87-5a39-44b9-860a-dbf2fc0b4c79	2017-05-06 20:15:24.094412
188	39	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	abcb62e4-cc91-4ecc-83a3-fa6a2dd7b337	2017-05-06 20:15:24.152815
189	40	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	ca7f3db4-b75c-4bb3-bb52-78624f6d7bf0	2017-05-06 20:15:24.209519
190	41	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	67c665fb-2b06-4461-a61f-5ff314a049cc	2017-05-06 20:15:24.278865
191	42	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	c6766105-9b5c-4727-95f4-cff17b732afe	2017-05-06 20:15:24.332814
192	43	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	7b8572d2-65ce-487f-b237-b19f41bcdb33	2017-05-06 20:15:24.394237
193	44	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	8fc4b446-268c-415c-a495-108226a3860d	2017-05-06 20:15:24.473841
194	45	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	8d833fed-7881-4c62-bcbb-597be581c7e5	2017-05-06 20:15:24.533566
195	46	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	4a050eb9-b2d8-46fa-ae38-1f559fd78675	2017-05-06 20:15:24.586251
196	47	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	63560257-dc0f-47f9-9603-1c0bbaa0e17a	2017-05-06 20:15:24.643088
197	48	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	4c91aaed-8205-4e57-86a2-ee44872b5476	2017-05-06 20:15:24.709976
198	49	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	db0ace37-cc00-4452-b2e9-9f63b17a9d6b	2017-05-06 20:15:24.769738
199	50	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	51aec72d-25b0-4f4e-be66-242ce04181dd	2017-05-06 20:15:24.832207
200	51	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	b9df509f-a45a-41ea-9333-58e03bb9049a	2017-05-06 20:15:24.904455
201	52	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	dc3af84a-fff7-407b-a5a6-e82c75de85cc	2017-05-06 20:15:24.967312
202	53	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	f049a9b4-734a-4967-af75-0593c9592cf7	2017-05-06 20:15:25.033181
203	54	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	3a872ee0-31e4-41df-9a70-2234a42a8150	2017-05-06 20:15:25.090911
204	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	49fa4865-0f31-4051-aae7-63cae4c86a30	2017-05-06 20:15:28.662291
205	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	3d11236c-f4d7-4b31-83a2-7e14d4e2d00a	2017-05-06 20:15:28.766583
206	1	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Efectivo\n	1	\N	\N	0de81f44-b0c0-4720-bc26-b2519c528a94	2017-05-06 20:15:28.882416
207	2	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta de crédito Visa\n	1	\N	\N	d5ae2573-cd1a-4990-a79e-0086477fdc32	2017-05-06 20:15:28.933745
208	3	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta Naranja\n	1	\N	\N	39427776-a921-453c-90b3-d220427e36e4	2017-05-06 20:15:28.996537
209	4	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Saldo de cuenta\n	1	\N	\N	006c31b5-6044-4e9a-867b-95af04b66c4a	2017-05-06 20:15:29.055304
210	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\nmonto: 200.0\n	1	\N	\N	9f6ccffa-b216-4523-8100-d39622ce1328	2017-05-06 20:15:29.262178
211	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\nmonto: 200.0\n	1	\N	\N	56176b51-4717-4fa8-a28e-15ca03747fd9	2017-05-06 20:15:29.327749
212	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\nmonto: 200.0\n	1	\N	\N	fd2f8622-b719-4822-9c98-631af602f0c8	2017-05-06 20:15:29.388075
213	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\nmonto: 200.0\n	1	\N	\N	136095ce-abe5-48b9-ad61-4f3f74dfe300	2017-05-06 20:15:29.550517
214	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\nmonto: 200.0\n	1	\N	\N	1ad26689-3b76-4011-8511-7c67c29a25ce	2017-05-06 20:15:29.765363
215	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\nmonto: 200.0\n	1	\N	\N	189b43cc-17f4-4f3e-b281-ced7eec1f7c3	2017-05-06 20:15:29.941828
216	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\nmonto: 200.0\n	1	\N	\N	20fed628-8383-4417-9603-061d949a059f	2017-05-06 20:15:30.007139
217	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\nmonto: 200.0\n	1	\N	\N	f2edde5a-e927-4384-8565-b1c8fb0d3a58	2017-05-06 20:15:30.073797
218	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\nmonto: 200.0\n	1	\N	\N	8a5a1169-8cc8-442f-9614-fba235634282	2017-05-06 20:15:30.13854
219	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\nmonto: 200.0\n	1	\N	\N	549a1ff0-4919-45a3-b8f3-898f1771fa5a	2017-05-06 20:15:30.198897
220	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\nmonto: 200.0\n	1	\N	\N	75726551-1c4d-49ae-8baf-464f9889890f	2017-05-06 20:15:30.263122
221	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\nmonto: 200.0\n	1	\N	\N	60055264-9d05-4e7f-a228-1371186d6a35	2017-05-06 20:15:30.330639
222	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 51\nproyecto_id: 1\n	1	\N	\N	2678cb61-7ed1-4cd9-ace1-8ea00e1ffe8d	2017-05-06 20:15:31.001933
223	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 52\nproyecto_id: 2\n	1	\N	\N	be8ab89e-77b2-45aa-af98-d787b0610776	2017-05-06 20:15:31.054066
224	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 54\nproyecto_id: 3\n	1	\N	\N	f409df6e-37f3-4122-86dd-d35cfb1a6d68	2017-05-06 20:15:31.111878
225	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 56\nproyecto_id: 4\n	1	\N	\N	86931cd4-b93d-4e8a-9279-8ace82351254	2017-05-06 20:15:31.166587
226	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 58\nproyecto_id: 5\n	1	\N	\N	0b13c949-95d7-4475-8f1b-861d7fe8c6c2	2017-05-06 20:15:31.220239
227	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 60\nproyecto_id: 6\n	1	\N	\N	418bdf15-5808-484a-8e42-16ec6e1f92bc	2017-05-06 20:15:31.276761
228	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 63\nproyecto_id: 7\n	1	\N	\N	0ba82f2d-0369-4dde-95a3-1b1487cf6c52	2017-05-06 20:15:31.329464
229	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 8\n	1	\N	\N	ec9ed304-5d6d-4f75-ac35-6e0c0bb19edf	2017-05-06 20:15:31.389041
230	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 9\n	1	\N	\N	ebfd7787-e6fd-42ae-a74c-744a1c03777d	2017-05-06 20:15:31.440727
231	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 69\nproyecto_id: 10\n	1	\N	\N	e982f09f-8f0c-4467-840e-95fae69c1feb	2017-05-06 20:15:31.501226
232	11	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 0017-12-10\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 71\nproyecto_id: 11\n	1	\N	\N	e396fce1-37bb-46ec-a1dd-1c54c6e8893b	2017-05-06 20:15:31.553498
233	12	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 12\n	1	\N	\N	50dbacb7-84ed-4b5e-93f9-dd02dcbbd2e4	2017-05-06 20:15:31.613677
234	13	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 99\nproyecto_id: 13\n	1	\N	\N	f4b40cc6-9e85-4abf-881b-b81117f24207	2017-05-06 20:15:31.667721
235	14	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 80\nproyecto_id: 14\n	1	\N	\N	c456bb89-a21a-4d61-b418-29fb6506864a	2017-05-06 20:15:31.718535
236	15	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 89\nproyecto_id: 15\n	1	\N	\N	3e7510fd-c98e-4d60-9945-2eff62d58ce6	2017-05-06 20:15:31.824257
237	16	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 16\n	1	\N	\N	b72ff9e6-dd64-4de2-baa5-d2a5b5e71e31	2017-05-06 20:15:31.8767
238	17	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 97\nproyecto_id: 17\n	1	\N	\N	03c26f44-a6de-4231-b851-82138d12f667	2017-05-06 20:15:31.93566
239	18	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 75\nproyecto_id: 18\n	1	\N	\N	2f7a1b8a-0713-4a82-a6b6-0982fe86db42	2017-05-06 20:15:31.998493
240	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	2da28c88-f7f2-452d-af31-4fd0bc309ea8	2017-05-06 20:15:32.184331
241	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	b01f018e-4352-4891-bc6a-5212ce0623f8	2017-05-06 20:15:32.289644
242	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	ae8596b0-8582-4a72-93a0-7944b697e962	2017-05-06 20:15:32.390767
243	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	1bc11376-402d-4bf3-91ef-fcb4a9293363	2017-05-06 20:15:32.510675
244	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	3b5f9d0c-51b9-4d76-b45c-62f8f3c46a14	2017-05-06 20:15:32.632245
245	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	9ecf5e3a-81ba-4e9f-9d2e-522de54d0015	2017-05-06 20:15:32.718449
246	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	65488d74-1431-48be-aa93-b15cd2315967	2017-05-06 20:15:32.80976
247	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	cf28f70c-4f69-4bdc-8c6e-198635b9db0a	2017-05-06 20:15:32.916718
248	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	b1633746-cad3-499f-81fd-17fa24ba245b	2017-05-06 20:15:33.020254
249	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	84ef4d7a-c7e5-4ce2-94c7-4867ec158e80	2017-05-06 20:15:33.103768
250	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	95d8d763-98d4-480f-be9d-51761a3cfbdd	2017-05-06 20:15:33.208669
251	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	21912cf9-8528-4919-88ad-4fd59bf2236a	2017-05-06 20:15:33.336887
252	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	fb865eb8-53d4-4fe0-853f-bea603de8be9	2017-05-06 20:15:33.45059
253	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	99274e6c-042e-4022-a270-eb91e824e94d	2017-05-06 20:15:33.552244
254	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	47dcb093-9469-4b8d-88ac-7837494520ad	2017-05-06 20:15:33.652421
255	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	700f3886-fe45-4e88-b9d5-48ec027c4d3f	2017-05-06 20:15:33.765566
256	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	1e48e409-596e-4291-ab5f-fb5b1fcb0701	2017-05-06 20:15:33.884382
257	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	66563d69-3f16-4ec2-8aa0-c3195dd899ce	2017-05-06 20:15:33.981406
258	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	654800f9-4aa1-4e0d-9cc1-77d4c866b877	2017-05-06 20:15:34.076756
259	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	81d83785-b2a1-4274-9291-c7bfb82fd8af	2017-05-06 20:15:34.198864
260	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	c175b79d-7aea-4b37-943e-397108ee9952	2017-05-06 20:15:34.303908
261	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	6c171749-841d-419b-b594-9c2b5a145cd0	2017-05-06 20:15:34.4017
262	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	71c2fdea-4f6c-4cd3-8b94-e180f982e6a6	2017-05-06 20:15:34.509434
263	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	344c15c8-063e-4df4-aa58-a09b1b68cf7c	2017-05-06 20:15:34.704651
264	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	e94ec46b-add0-44b6-8abe-ef8376aca50f	2017-05-06 20:15:34.830201
265	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	c04d724e-bcdd-4422-bb99-6d0ba7568188	2017-05-06 20:15:34.940279
266	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	3b0f69ef-5172-42fb-89cc-d3cef578a990	2017-05-06 20:15:35.035006
267	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	a7921c7f-95a5-4b9f-8b38-0e74b0356860	2017-05-06 20:15:35.142601
268	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	9f7ee4b1-e614-439e-a072-2f8ed9af15d9	2017-05-06 20:15:35.242898
269	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	7f454474-6eaf-4cbb-a007-5ea991ca3d6a	2017-05-06 20:15:35.327126
270	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	b36dd7e7-2d13-411f-9c0a-b8d0a85f5a5d	2017-05-06 20:15:35.438655
271	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	d0ea4b9d-1f3f-4e18-8dfc-153bcfd6b5d5	2017-05-06 20:15:35.573634
272	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	90d99bc1-74be-4aa5-836e-ebce1ee759f7	2017-05-06 20:15:35.678808
273	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	8310ca3c-4ae1-4847-b794-c079ae00e409	2017-05-06 20:15:35.76878
274	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	e8369d57-2aca-4a20-b442-8f3fb4f5631b	2017-05-06 20:15:35.852372
275	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	d247b76a-a88a-4ee1-92c4-01e31b3caed2	2017-05-06 20:15:35.962498
276	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	19d60800-8973-4944-86d0-f1651f99b762	2017-05-06 20:15:36.06426
277	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	b6d95401-8748-433f-982f-efd38bde8936	2017-05-06 20:15:36.149127
278	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	7e659586-8e57-410c-afcc-2f96a05e458f	2017-05-06 20:15:36.249667
279	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	6c6f4b09-9b37-452e-bd23-3f3cfc0ad450	2017-05-06 20:15:36.356969
280	41	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	540fac77-46ce-4101-b021-82c469a501f8	2017-05-06 20:15:36.454839
281	42	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	2e0cd3a0-37fb-4965-9c6c-9912ff05043d	2017-05-06 20:15:36.539439
282	43	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	ee73268d-0e4c-48d3-8aa5-42b7612e38a1	2017-05-06 20:15:36.635052
283	44	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	3faa5764-3c9b-47f1-af06-b63ec32488e5	2017-05-06 20:15:36.738774
284	45	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	90780176-ed91-4ade-bdd3-11f0998c11f1	2017-05-06 20:15:36.847587
285	46	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	dd95c7ab-73cb-448b-98c3-53dd9b4858ab	2017-05-06 20:15:36.931615
286	47	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	cd7ba7c7-1e68-463a-ae15-59b2315bfa21	2017-05-06 20:15:37.024931
287	48	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	21943a7f-cddc-4ed9-ab38-1dd78fb2785a	2017-05-06 20:15:37.127032
288	49	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	6b7265a4-60ac-4f57-afea-10a8982a4dec	2017-05-06 20:15:37.233422
289	50	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	c9c47976-d116-4f97-8abb-ab17be4ed337	2017-05-06 20:15:37.324202
290	51	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	80f78372-db88-4a5a-b47b-5bee2bfded86	2017-05-06 20:15:37.415002
291	52	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	2b285593-c790-467e-bb3b-5742434ef9a0	2017-05-06 20:15:37.516819
292	53	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	e314052f-9cc5-4d95-82a4-a68d78caea79	2017-05-06 20:15:37.609364
293	54	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	7cf35532-3e02-41fd-9fb6-426c573dee64	2017-05-06 20:15:37.735483
294	55	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	2370fd8a-197a-48f4-920a-7f65269b3cfb	2017-05-06 20:15:37.823866
295	56	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	a36cc20b-fc16-4754-9e28-330c2480932a	2017-05-06 20:15:37.926885
296	57	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	693127d4-ebba-4a0d-90e5-b2a98bc453e4	2017-05-06 20:15:38.022096
297	58	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	b4796cb8-cca9-42a3-bf85-c18a9ce97035	2017-05-06 20:15:38.115526
298	59	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	cd275ee7-c192-4fd1-94b8-8d8aa806ca30	2017-05-06 20:15:38.199566
299	60	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	7f7a997d-8c64-4cc0-8bd1-d068a4eb0cef	2017-05-06 20:15:38.316692
300	61	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	7415e2a6-7456-4f2d-8930-7b93621abbfd	2017-05-06 20:15:38.409501
301	62	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	471c7081-6c8b-42b1-8083-9c60adc7f490	2017-05-06 20:15:38.49991
302	63	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	9e0dd438-2f9f-4c81-828e-40e9a91777ea	2017-05-06 20:15:38.592915
303	64	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	51affd2f-2c0c-4df0-8faf-43f61c3ff103	2017-05-06 20:15:38.69955
304	65	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	59e752a7-0ef3-4e02-a9bb-ed2bc35d3c8e	2017-05-06 20:15:38.800151
305	66	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	6db3cdd0-79c6-4330-98d6-eea70dcf05ea	2017-05-06 20:15:38.887196
306	67	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	46b1880d-a7b2-4163-b62d-fcc056c529d0	2017-05-06 20:15:38.983995
307	68	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	26fde7e7-ab13-4bd3-9cd0-3a05d50145a7	2017-05-06 20:15:39.098443
308	69	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	00d6729b-7ea3-45d3-91a7-3bb4f0eb6139	2017-05-06 20:15:39.199185
309	70	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	cf2487ae-abd6-45f8-8f86-e416205238d9	2017-05-06 20:15:39.282873
310	71	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	821467ed-30c9-4350-97d7-82ceca842518	2017-05-06 20:15:39.363582
311	72	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	885cb40d-afa3-4e2e-ac45-4e52bc448573	2017-05-06 20:15:39.473666
312	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	731533fa-3988-4377-8a6f-0c0dca9d8ffe	2017-05-06 20:15:39.603379
313	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	309d48b0-18fd-477d-ab56-97224b646ffa	2017-05-06 20:15:39.673973
314	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	b0950b2d-1952-4e3a-b567-669c6f7ae915	2017-05-06 20:15:39.725916
315	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	c10c55c0-de07-4935-b3ec-7789ec305322	2017-05-06 20:15:39.780045
316	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	707b1591-889e-407d-95c8-62190910bf9a	2017-05-06 20:15:39.841812
317	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	0bb1c98f-81c7-4e76-bd0a-6051286e017f	2017-05-06 20:15:39.891474
318	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	1e46d1cd-c11e-436e-a21e-5fa042c7bb0e	2017-05-06 20:15:39.949768
320	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	fe333b4c-8dd3-4d22-ad05-eda48cac7ce8	2017-05-06 20:15:40.058717
321	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	021ffebe-91d8-4497-979d-010409b87b0c	2017-05-06 20:15:40.116268
322	11	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 11\n	1	\N	\N	9fd51b1e-02e0-4625-af32-9b77b39acdb6	2017-05-06 20:15:40.168274
323	12	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 12\n	1	\N	\N	3c351486-cfe9-4564-b7c3-973dc3b89ece	2017-05-06 20:15:40.228151
324	13	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 13\n	1	\N	\N	0856aa20-e12c-4b24-8020-6fd44a14334f	2017-05-06 20:15:40.290413
325	14	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 14\n	1	\N	\N	13bcb3e2-3a42-4b0b-b2f0-1514b7ff1cfd	2017-05-06 20:15:40.351725
326	15	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 15\n	1	\N	\N	fc7223d8-46c3-41dd-b347-eb85df2011ac	2017-05-06 20:15:40.406338
327	16	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 16\n	1	\N	\N	6174502f-84e7-4bba-aa43-fd57c8e17b5a	2017-05-06 20:15:40.471734
328	17	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 17\n	1	\N	\N	6de8c65d-1cbb-4b6f-86db-af24621ccbd9	2017-05-06 20:15:40.526142
329	18	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 18\n	1	\N	\N	f8c27f95-2bc5-40ae-ab14-941453525d52	2017-05-06 20:15:40.580088
330	1	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Marketing\ndescripcion: "-"\n	1	\N	\N	f576bdc1-2459-45cf-a8ba-c941e8c39675	2017-05-06 20:15:40.725169
331	2	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	2a7110ce-814e-422f-ad27-22ba95eec5de	2017-05-06 20:15:40.780938
332	3	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	88bd909f-f2a6-4eda-87cc-e5f58052b530	2017-05-06 20:15:40.841222
333	4	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	2d3521aa-8040-4dbb-a0a3-9a81ef17a815	2017-05-06 20:15:40.893973
334	5	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Multimedios\ndescripcion: "-"\n	1	\N	\N	679f5da6-8c80-4a26-bdc3-4c5e1fc34815	2017-05-06 20:15:40.948296
335	6	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Community Manager\ndescripcion: "-"\n	1	\N	\N	9e8131b5-e8df-46c0-b8b8-1e65c22ccf74	2017-05-06 20:15:41.005798
336	7	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: "-"\n	1	\N	\N	559e5315-38a2-42af-afb6-53aa24e2365d	2017-05-06 20:15:41.062563
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 337, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-05-06 20:14:57.923063	2017-05-06 20:14:57.923063	1	1
2	Apostoles	2017-05-06 20:14:57.962296	2017-05-06 20:14:57.962296	1	1
3	Bella Vista	2017-05-06 20:14:58.003966	2017-05-06 20:14:58.003966	2	1
4	Encarnación	2017-05-06 20:14:58.048602	2017-05-06 20:14:58.048602	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	200	2017-05-06 20:15:29.234747	2017-05-06 20:15:29.234747
2	CP-002	Cuota de Febrero	Febrero 2017	200	2017-05-06 20:15:29.308951	2017-05-06 20:15:29.308951
3	CP-003	Cuota de Marzo	Marzo 2017	200	2017-05-06 20:15:29.367994	2017-05-06 20:15:29.367994
4	CP-004	Cuota de Abril	Abril 2017	200	2017-05-06 20:15:29.532199	2017-05-06 20:15:29.532199
5	CP-005	Cuota de Mayo	Mayo 2017	200	2017-05-06 20:15:29.744049	2017-05-06 20:15:29.744049
6	CP-006	Cuota de Junio	Junio 2017	200	2017-05-06 20:15:29.922768	2017-05-06 20:15:29.922768
7	CP-007	Cuota de Julio	Julio 2017	200	2017-05-06 20:15:29.98966	2017-05-06 20:15:29.98966
8	CP-008	Cuota de Agosto	Agosto 2017	200	2017-05-06 20:15:30.05397	2017-05-06 20:15:30.05397
9	CP-009	Cuota de Septiembre	Septiembre 2017	200	2017-05-06 20:15:30.121178	2017-05-06 20:15:30.121178
10	CP-010	Cuota de Octubre	Octubre 2017	200	2017-05-06 20:15:30.174869	2017-05-06 20:15:30.174869
11	CP-011	Cuota de Noviembre	Noviembre 2017	200	2017-05-06 20:15:30.245032	2017-05-06 20:15:30.245032
12	CP-012	Cuota de Diciembre	Diciembre 2017	200	2017-05-06 20:15:30.309142	2017-05-06 20:15:30.309142
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
\.


--
-- Name: configuraciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('configuraciones_id_seq', 1, false);


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
1	2017-01-01	2017-04-30	2017-05-06 20:15:30.975687	2017-05-06 20:15:30.975687	\N	51	1
2	2017-01-01	2017-04-30	2017-05-06 20:15:31.034225	2017-05-06 20:15:31.034225	\N	52	2
3	2017-01-01	2017-04-30	2017-05-06 20:15:31.089939	2017-05-06 20:15:31.089939	\N	54	3
4	2017-01-01	2017-04-30	2017-05-06 20:15:31.146018	2017-05-06 20:15:31.146018	\N	56	4
5	2017-01-01	2017-04-30	2017-05-06 20:15:31.199481	2017-05-06 20:15:31.199481	\N	58	5
6	2017-01-01	2017-04-30	2017-05-06 20:15:31.256428	2017-05-06 20:15:31.256428	\N	60	6
7	2017-01-01	2017-04-30	2017-05-06 20:15:31.311032	2017-05-06 20:15:31.311032	\N	63	7
8	2017-01-01	2017-04-30	2017-05-06 20:15:31.366879	2017-05-06 20:15:31.366879	\N	65	8
9	2017-01-01	2017-04-30	2017-05-06 20:15:31.421907	2017-05-06 20:15:31.421907	\N	67	9
10	2017-01-01	2017-04-30	2017-05-06 20:15:31.479098	2017-05-06 20:15:31.479098	\N	69	10
11	0017-12-10	2017-04-30	2017-05-06 20:15:31.532719	2017-05-06 20:15:31.532719	\N	71	11
12	2017-01-01	2017-04-30	2017-05-06 20:15:31.590923	2017-05-06 20:15:31.590923	\N	65	12
13	2017-01-01	2017-04-30	2017-05-06 20:15:31.645469	2017-05-06 20:15:31.645469	\N	99	13
14	2017-01-01	2017-04-30	2017-05-06 20:15:31.699423	2017-05-06 20:15:31.699423	\N	80	14
15	2017-01-01	2017-04-30	2017-05-06 20:15:31.801091	2017-05-06 20:15:31.801091	\N	89	15
16	2017-01-01	2017-04-30	2017-05-06 20:15:31.856279	2017-05-06 20:15:31.856279	\N	67	16
17	2017-01-01	2017-04-30	2017-05-06 20:15:31.910813	2017-05-06 20:15:31.910813	\N	97	17
18	2017-01-01	2017-04-30	2017-05-06 20:15:31.978702	2017-05-06 20:15:31.978702	\N	75	18
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 18, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
1	0	2017-05-06 20:15:39.578764	2017-05-06 20:15:39.578764	1
2	0	2017-05-06 20:15:39.654169	2017-05-06 20:15:39.654169	2
3	0	2017-05-06 20:15:39.708538	2017-05-06 20:15:39.708538	3
4	0	2017-05-06 20:15:39.762563	2017-05-06 20:15:39.762563	4
5	0	2017-05-06 20:15:39.819416	2017-05-06 20:15:39.819416	5
6	0	2017-05-06 20:15:39.874102	2017-05-06 20:15:39.874102	6
7	0	2017-05-06 20:15:39.932439	2017-05-06 20:15:39.932439	7
8	0	2017-05-06 20:15:39.988635	2017-05-06 20:15:39.988635	8
9	0	2017-05-06 20:15:40.043101	2017-05-06 20:15:40.043101	9
10	0	2017-05-06 20:15:40.098391	2017-05-06 20:15:40.098391	10
11	0	2017-05-06 20:15:40.151484	2017-05-06 20:15:40.151484	11
12	0	2017-05-06 20:15:40.208471	2017-05-06 20:15:40.208471	12
13	0	2017-05-06 20:15:40.273167	2017-05-06 20:15:40.273167	13
14	0	2017-05-06 20:15:40.331514	2017-05-06 20:15:40.331514	14
15	0	2017-05-06 20:15:40.385857	2017-05-06 20:15:40.385857	15
16	0	2017-05-06 20:15:40.454051	2017-05-06 20:15:40.454051	16
17	0	2017-05-06 20:15:40.509896	2017-05-06 20:15:40.509896	17
18	0	2017-05-06 20:15:40.562489	2017-05-06 20:15:40.562489	18
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 18, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
1	288	f	2017-05-06 20:15:32.149445	2017-05-06 20:15:32.149445	1	1	1	\N	\N
2	288	f	2017-05-06 20:15:32.267252	2017-05-06 20:15:32.267252	2	1	1	\N	\N
3	288	f	2017-05-06 20:15:32.366596	2017-05-06 20:15:32.366596	3	1	1	\N	\N
4	288	f	2017-05-06 20:15:32.486219	2017-05-06 20:15:32.486219	4	1	1	\N	\N
5	288	f	2017-05-06 20:15:32.603452	2017-05-06 20:15:32.603452	1	2	2	\N	\N
6	288	f	2017-05-06 20:15:32.69517	2017-05-06 20:15:32.69517	2	2	2	\N	\N
7	288	f	2017-05-06 20:15:32.7878	2017-05-06 20:15:32.7878	3	2	2	\N	\N
8	288	f	2017-05-06 20:15:32.891105	2017-05-06 20:15:32.891105	4	2	2	\N	\N
9	288	f	2017-05-06 20:15:32.998313	2017-05-06 20:15:32.998313	1	3	3	\N	\N
10	288	f	2017-05-06 20:15:33.081631	2017-05-06 20:15:33.081631	2	3	3	\N	\N
11	288	f	2017-05-06 20:15:33.181006	2017-05-06 20:15:33.181006	3	3	3	\N	\N
12	288	f	2017-05-06 20:15:33.314537	2017-05-06 20:15:33.314537	4	3	3	\N	\N
13	288	f	2017-05-06 20:15:33.424122	2017-05-06 20:15:33.424122	1	4	4	\N	\N
14	288	f	2017-05-06 20:15:33.521373	2017-05-06 20:15:33.521373	2	4	4	\N	\N
15	288	f	2017-05-06 20:15:33.625567	2017-05-06 20:15:33.625567	3	4	4	\N	\N
16	288	f	2017-05-06 20:15:33.73969	2017-05-06 20:15:33.73969	4	4	4	\N	\N
17	288	f	2017-05-06 20:15:33.859413	2017-05-06 20:15:33.859413	1	5	5	\N	\N
18	288	f	2017-05-06 20:15:33.959809	2017-05-06 20:15:33.959809	2	5	5	\N	\N
19	288	f	2017-05-06 20:15:34.05278	2017-05-06 20:15:34.05278	3	5	5	\N	\N
20	288	f	2017-05-06 20:15:34.171482	2017-05-06 20:15:34.171482	4	5	5	\N	\N
21	288	f	2017-05-06 20:15:34.28172	2017-05-06 20:15:34.28172	1	6	6	\N	\N
22	288	f	2017-05-06 20:15:34.379611	2017-05-06 20:15:34.379611	2	6	6	\N	\N
23	288	f	2017-05-06 20:15:34.485961	2017-05-06 20:15:34.485961	3	6	6	\N	\N
24	288	f	2017-05-06 20:15:34.614778	2017-05-06 20:15:34.614778	4	6	6	\N	\N
25	288	f	2017-05-06 20:15:34.806317	2017-05-06 20:15:34.806317	1	7	7	\N	\N
26	288	f	2017-05-06 20:15:34.91795	2017-05-06 20:15:34.91795	2	7	7	\N	\N
27	288	f	2017-05-06 20:15:35.011264	2017-05-06 20:15:35.011264	3	7	7	\N	\N
28	288	f	2017-05-06 20:15:35.122098	2017-05-06 20:15:35.122098	4	7	7	\N	\N
29	288	f	2017-05-06 20:15:35.220872	2017-05-06 20:15:35.220872	1	8	8	\N	\N
30	288	f	2017-05-06 20:15:35.303537	2017-05-06 20:15:35.303537	2	8	8	\N	\N
31	288	f	2017-05-06 20:15:35.418344	2017-05-06 20:15:35.418344	3	8	8	\N	\N
32	288	f	2017-05-06 20:15:35.551842	2017-05-06 20:15:35.551842	4	8	8	\N	\N
33	288	f	2017-05-06 20:15:35.657585	2017-05-06 20:15:35.657585	1	9	9	\N	\N
34	288	f	2017-05-06 20:15:35.74657	2017-05-06 20:15:35.74657	2	9	9	\N	\N
35	288	f	2017-05-06 20:15:35.832407	2017-05-06 20:15:35.832407	3	9	9	\N	\N
36	288	f	2017-05-06 20:15:35.939511	2017-05-06 20:15:35.939511	4	9	9	\N	\N
37	288	f	2017-05-06 20:15:36.04398	2017-05-06 20:15:36.04398	1	10	10	\N	\N
38	288	f	2017-05-06 20:15:36.12765	2017-05-06 20:15:36.12765	2	10	10	\N	\N
39	288	f	2017-05-06 20:15:36.224169	2017-05-06 20:15:36.224169	3	10	10	\N	\N
40	288	f	2017-05-06 20:15:36.33666	2017-05-06 20:15:36.33666	4	10	10	\N	\N
41	288	f	2017-05-06 20:15:36.431014	2017-05-06 20:15:36.431014	1	11	11	\N	\N
42	288	f	2017-05-06 20:15:36.519258	2017-05-06 20:15:36.519258	2	11	11	\N	\N
43	288	f	2017-05-06 20:15:36.614605	2017-05-06 20:15:36.614605	3	11	11	\N	\N
44	288	f	2017-05-06 20:15:36.71837	2017-05-06 20:15:36.71837	4	11	11	\N	\N
45	288	f	2017-05-06 20:15:36.826609	2017-05-06 20:15:36.826609	1	12	12	\N	\N
46	288	f	2017-05-06 20:15:36.910127	2017-05-06 20:15:36.910127	2	12	12	\N	\N
47	288	f	2017-05-06 20:15:37.003629	2017-05-06 20:15:37.003629	3	12	12	\N	\N
48	288	f	2017-05-06 20:15:37.102703	2017-05-06 20:15:37.102703	4	12	12	\N	\N
49	288	f	2017-05-06 20:15:37.210834	2017-05-06 20:15:37.210834	1	13	13	\N	\N
50	288	f	2017-05-06 20:15:37.302543	2017-05-06 20:15:37.302543	2	13	13	\N	\N
51	288	f	2017-05-06 20:15:37.392425	2017-05-06 20:15:37.392425	3	13	13	\N	\N
52	288	f	2017-05-06 20:15:37.49493	2017-05-06 20:15:37.49493	4	13	13	\N	\N
53	288	f	2017-05-06 20:15:37.588873	2017-05-06 20:15:37.588873	1	14	14	\N	\N
54	288	f	2017-05-06 20:15:37.675795	2017-05-06 20:15:37.675795	2	14	14	\N	\N
55	288	f	2017-05-06 20:15:37.799157	2017-05-06 20:15:37.799157	3	14	14	\N	\N
56	288	f	2017-05-06 20:15:37.906417	2017-05-06 20:15:37.906417	4	14	14	\N	\N
57	288	f	2017-05-06 20:15:37.999799	2017-05-06 20:15:37.999799	1	15	15	\N	\N
58	288	f	2017-05-06 20:15:38.092204	2017-05-06 20:15:38.092204	2	15	15	\N	\N
59	288	f	2017-05-06 20:15:38.179712	2017-05-06 20:15:38.179712	3	15	15	\N	\N
60	288	f	2017-05-06 20:15:38.28886	2017-05-06 20:15:38.28886	4	15	15	\N	\N
61	288	f	2017-05-06 20:15:38.388312	2017-05-06 20:15:38.388312	1	16	16	\N	\N
62	288	f	2017-05-06 20:15:38.477163	2017-05-06 20:15:38.477163	2	16	16	\N	\N
63	288	f	2017-05-06 20:15:38.568595	2017-05-06 20:15:38.568595	3	16	16	\N	\N
64	288	f	2017-05-06 20:15:38.678145	2017-05-06 20:15:38.678145	4	16	16	\N	\N
65	288	f	2017-05-06 20:15:38.778776	2017-05-06 20:15:38.778776	1	17	17	\N	\N
66	288	f	2017-05-06 20:15:38.86663	2017-05-06 20:15:38.86663	2	17	17	\N	\N
67	288	f	2017-05-06 20:15:38.964112	2017-05-06 20:15:38.964112	3	17	17	\N	\N
68	288	f	2017-05-06 20:15:39.075711	2017-05-06 20:15:39.075711	4	17	17	\N	\N
69	288	f	2017-05-06 20:15:39.17976	2017-05-06 20:15:39.17976	1	18	18	\N	\N
70	288	f	2017-05-06 20:15:39.261145	2017-05-06 20:15:39.261145	2	18	18	\N	\N
71	288	f	2017-05-06 20:15:39.343776	2017-05-06 20:15:39.343776	3	18	18	\N	\N
72	288	f	2017-05-06 20:15:39.453579	2017-05-06 20:15:39.453579	4	18	18	\N	\N
\.


--
-- Name: cuotas_por_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuotas_por_cliente_id_seq', 72, true);


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
1	Finanzas	2017-05-06 20:14:58.293159	2017-05-06 20:14:58.293159
2	Recursos Humanos	2017-05-06 20:14:58.476908	2017-05-06 20:14:58.476908
3	Evaluación	2017-05-06 20:14:58.550246	2017-05-06 20:14:58.550246
4	Logística	2017-05-06 20:14:58.616883	2017-05-06 20:14:58.616883
5	Dirección	2017-05-06 20:14:58.674906	2017-05-06 20:14:58.674906
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-05-06 20:15:28.633535	2017-05-06 20:15:28.633535
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
1	Marketing	-	2017-05-06 20:15:40.702848	2017-05-06 20:15:40.702848
2	Diseño Gráfico	-	2017-05-06 20:15:40.76522	2017-05-06 20:15:40.76522
3	Diseño Web	-	2017-05-06 20:15:40.822264	2017-05-06 20:15:40.822264
4	Fotografía	-	2017-05-06 20:15:40.8767	2017-05-06 20:15:40.8767
5	Multimedios	-	2017-05-06 20:15:40.932012	2017-05-06 20:15:40.932012
6	Community Manager	-	2017-05-06 20:15:40.98603	2017-05-06 20:15:40.98603
7	Crowdfunding	-	2017-05-06 20:15:41.044287	2017-05-06 20:15:41.044287
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 7, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-05-06 20:15:21.386368	2017-05-06 20:15:21.386368
2	Doing	f	1	\N	2017-05-06 20:15:21.466359	2017-05-06 20:15:21.466359
3	Done	t	2	\N	2017-05-06 20:15:21.530053	2017-05-06 20:15:21.530053
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-05-06 20:15:09.907586	2017-05-06 20:15:09.907586
2	Incubación	-	1	2017-05-06 20:15:09.979119	2017-05-06 20:15:09.979119
3	post incubacion	-	2	2017-05-06 20:15:10.052814	2017-05-06 20:15:10.052814
4	Cuarta etapa	-	\N	2017-05-06 20:15:10.118646	2017-05-06 20:15:10.118646
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: eventos_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_especialidades (id, created_at, updated_at, especialidad_de_contacto_id, evento_id) FROM stdin;
\.


--
-- Name: eventos_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_especialidades_id_seq', 1, false);


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
1	2017-01-01 08:20:00	2017-05-06 20:15:25.176591	2017-05-06 20:15:25.176591	1	1	1	3
2	2017-01-01 08:20:00	2017-05-06 20:15:25.231223	2017-05-06 20:15:25.231223	2	1	1	3
3	2017-01-01 08:21:00	2017-05-06 20:15:25.252946	2017-05-06 20:15:25.252946	3	1	1	3
4	2017-01-01 08:22:00	2017-05-06 20:15:25.275708	2017-05-06 20:15:25.275708	1	2	1	3
5	2017-01-02 08:22:00	2017-05-06 20:15:25.302549	2017-05-06 20:15:25.302549	2	2	1	3
6	2017-01-08 08:23:00	2017-05-06 20:15:25.330295	2017-05-06 20:15:25.330295	3	2	1	3
7	2017-01-01 08:23:00	2017-05-06 20:15:25.353718	2017-05-06 20:15:25.353718	1	3	1	3
8	2017-01-06 08:24:00	2017-05-06 20:15:25.375421	2017-05-06 20:15:25.375421	2	3	1	3
9	2017-01-01 08:20:00	2017-05-06 20:15:25.397663	2017-05-06 20:15:25.397663	4	1	2	3
10	2017-01-01 08:20:00	2017-05-06 20:15:25.419651	2017-05-06 20:15:25.419651	5	1	2	3
11	2017-01-01 08:21:00	2017-05-06 20:15:25.441394	2017-05-06 20:15:25.441394	6	1	2	3
12	2017-01-01 08:22:00	2017-05-06 20:15:25.467064	2017-05-06 20:15:25.467064	4	2	2	3
13	2017-01-02 08:22:00	2017-05-06 20:15:25.488331	2017-05-06 20:15:25.488331	5	2	2	3
14	2017-01-08 08:23:00	2017-05-06 20:15:25.508174	2017-05-06 20:15:25.508174	6	2	2	3
15	2017-01-01 08:23:00	2017-05-06 20:15:25.531302	2017-05-06 20:15:25.531302	4	3	2	3
16	2017-01-06 08:24:00	2017-05-06 20:15:25.552739	2017-05-06 20:15:25.552739	5	3	2	3
17	2017-01-01 08:20:00	2017-05-06 20:15:25.575142	2017-05-06 20:15:25.575142	7	1	3	2
18	2017-01-01 08:20:00	2017-05-06 20:15:25.598399	2017-05-06 20:15:25.598399	8	1	3	2
19	2017-01-01 08:21:00	2017-05-06 20:15:25.619039	2017-05-06 20:15:25.619039	9	1	3	2
20	2017-01-01 08:22:00	2017-05-06 20:15:25.642272	2017-05-06 20:15:25.642272	7	2	3	2
21	2017-01-02 08:22:00	2017-05-06 20:15:25.665122	2017-05-06 20:15:25.665122	8	2	3	2
22	2017-01-08 08:23:00	2017-05-06 20:15:25.686806	2017-05-06 20:15:25.686806	9	2	3	2
23	2017-01-01 08:23:00	2017-05-06 20:15:25.70957	2017-05-06 20:15:25.70957	7	3	3	2
24	2017-01-06 08:24:00	2017-05-06 20:15:25.731839	2017-05-06 20:15:25.731839	8	3	3	2
25	2017-01-01 08:20:00	2017-05-06 20:15:25.753037	2017-05-06 20:15:25.753037	10	1	4	2
26	2017-01-01 08:20:00	2017-05-06 20:15:25.776448	2017-05-06 20:15:25.776448	11	1	4	2
27	2017-01-01 08:21:00	2017-05-06 20:15:25.797585	2017-05-06 20:15:25.797585	12	1	4	2
28	2017-01-01 08:22:00	2017-05-06 20:15:25.82011	2017-05-06 20:15:25.82011	10	2	4	2
29	2017-01-02 08:22:00	2017-05-06 20:15:25.84257	2017-05-06 20:15:25.84257	11	2	4	2
30	2017-01-08 08:23:00	2017-05-06 20:15:25.865956	2017-05-06 20:15:25.865956	12	2	4	2
31	2017-01-01 08:23:00	2017-05-06 20:15:25.88711	2017-05-06 20:15:25.88711	10	3	4	2
32	2017-01-06 08:24:00	2017-05-06 20:15:25.912828	2017-05-06 20:15:25.912828	11	3	4	2
33	2017-01-01 08:20:00	2017-05-06 20:15:25.931111	2017-05-06 20:15:25.931111	13	1	5	3
34	2017-01-01 08:20:00	2017-05-06 20:15:25.954573	2017-05-06 20:15:25.954573	14	1	5	3
35	2017-01-01 08:21:00	2017-05-06 20:15:25.976619	2017-05-06 20:15:25.976619	15	1	5	3
36	2017-01-01 08:22:00	2017-05-06 20:15:25.997858	2017-05-06 20:15:25.997858	13	2	5	3
37	2017-01-02 08:22:00	2017-05-06 20:15:26.020039	2017-05-06 20:15:26.020039	14	2	5	3
38	2017-01-08 08:23:00	2017-05-06 20:15:26.042492	2017-05-06 20:15:26.042492	15	2	5	3
39	2017-01-01 08:23:00	2017-05-06 20:15:26.066633	2017-05-06 20:15:26.066633	13	3	5	3
40	2017-01-06 08:24:00	2017-05-06 20:15:26.086646	2017-05-06 20:15:26.086646	14	3	5	3
41	2017-01-01 08:20:00	2017-05-06 20:15:26.109971	2017-05-06 20:15:26.109971	16	1	6	3
42	2017-01-01 08:20:00	2017-05-06 20:15:26.131486	2017-05-06 20:15:26.131486	17	1	6	3
43	2017-01-01 08:21:00	2017-05-06 20:15:26.154054	2017-05-06 20:15:26.154054	18	1	6	3
44	2017-01-01 08:22:00	2017-05-06 20:15:26.176525	2017-05-06 20:15:26.176525	16	2	6	3
45	2017-01-02 08:22:00	2017-05-06 20:15:26.199541	2017-05-06 20:15:26.199541	17	2	6	3
46	2017-01-08 08:23:00	2017-05-06 20:15:26.231809	2017-05-06 20:15:26.231809	18	2	6	3
47	2017-01-01 08:23:00	2017-05-06 20:15:26.253918	2017-05-06 20:15:26.253918	16	3	6	3
48	2017-01-06 08:24:00	2017-05-06 20:15:26.27546	2017-05-06 20:15:26.27546	17	3	6	3
49	2017-01-01 08:20:00	2017-05-06 20:15:26.298084	2017-05-06 20:15:26.298084	19	1	7	2
50	2017-01-01 08:20:00	2017-05-06 20:15:26.320367	2017-05-06 20:15:26.320367	20	1	7	2
51	2017-01-01 08:21:00	2017-05-06 20:15:26.342404	2017-05-06 20:15:26.342404	21	1	7	2
52	2017-01-01 08:22:00	2017-05-06 20:15:26.366017	2017-05-06 20:15:26.366017	19	2	7	2
53	2017-01-02 08:22:00	2017-05-06 20:15:26.398853	2017-05-06 20:15:26.398853	20	2	7	2
54	2017-01-08 08:23:00	2017-05-06 20:15:26.420763	2017-05-06 20:15:26.420763	21	2	7	2
55	2017-01-01 08:23:00	2017-05-06 20:15:26.445043	2017-05-06 20:15:26.445043	19	3	7	2
56	2017-01-06 08:24:00	2017-05-06 20:15:26.466202	2017-05-06 20:15:26.466202	20	3	7	2
57	2017-01-01 08:20:00	2017-05-06 20:15:26.488517	2017-05-06 20:15:26.488517	22	1	8	3
58	2017-01-01 08:20:00	2017-05-06 20:15:26.511316	2017-05-06 20:15:26.511316	23	1	8	3
59	2017-01-01 08:21:00	2017-05-06 20:15:26.531087	2017-05-06 20:15:26.531087	24	1	8	3
60	2017-01-01 08:22:00	2017-05-06 20:15:26.554272	2017-05-06 20:15:26.554272	22	2	8	3
61	2017-01-02 08:22:00	2017-05-06 20:15:26.577629	2017-05-06 20:15:26.577629	23	2	8	3
62	2017-01-08 08:23:00	2017-05-06 20:15:26.597896	2017-05-06 20:15:26.597896	24	2	8	3
63	2017-01-01 08:23:00	2017-05-06 20:15:26.620646	2017-05-06 20:15:26.620646	22	3	8	3
64	2017-01-06 08:24:00	2017-05-06 20:15:26.643835	2017-05-06 20:15:26.643835	23	3	8	3
65	2017-01-01 08:20:00	2017-05-06 20:15:26.666144	2017-05-06 20:15:26.666144	25	1	9	2
66	2017-01-01 08:20:00	2017-05-06 20:15:26.687084	2017-05-06 20:15:26.687084	26	1	9	2
67	2017-01-01 08:21:00	2017-05-06 20:15:26.711213	2017-05-06 20:15:26.711213	27	1	9	2
68	2017-01-01 08:22:00	2017-05-06 20:15:26.731645	2017-05-06 20:15:26.731645	25	2	9	2
69	2017-01-02 08:22:00	2017-05-06 20:15:26.755342	2017-05-06 20:15:26.755342	26	2	9	2
70	2017-01-08 08:23:00	2017-05-06 20:15:26.776861	2017-05-06 20:15:26.776861	27	2	9	2
71	2017-01-01 08:23:00	2017-05-06 20:15:26.799814	2017-05-06 20:15:26.799814	25	3	9	2
72	2017-01-06 08:24:00	2017-05-06 20:15:26.82168	2017-05-06 20:15:26.82168	26	3	9	2
73	2017-01-01 08:20:00	2017-05-06 20:15:26.844831	2017-05-06 20:15:26.844831	28	1	10	3
74	2017-01-01 08:20:00	2017-05-06 20:15:26.864769	2017-05-06 20:15:26.864769	29	1	10	3
75	2017-01-01 08:21:00	2017-05-06 20:15:26.887102	2017-05-06 20:15:26.887102	30	1	10	3
76	2017-01-01 08:22:00	2017-05-06 20:15:26.910538	2017-05-06 20:15:26.910538	28	2	10	3
77	2017-01-02 08:22:00	2017-05-06 20:15:26.932228	2017-05-06 20:15:26.932228	29	2	10	3
78	2017-01-08 08:23:00	2017-05-06 20:15:26.956187	2017-05-06 20:15:26.956187	30	2	10	3
79	2017-01-01 08:23:00	2017-05-06 20:15:26.978749	2017-05-06 20:15:26.978749	28	3	10	3
80	2017-01-06 08:24:00	2017-05-06 20:15:27.010523	2017-05-06 20:15:27.010523	29	3	10	3
81	2017-01-01 08:20:00	2017-05-06 20:15:27.034291	2017-05-06 20:15:27.034291	31	1	11	3
82	2017-01-01 08:20:00	2017-05-06 20:15:27.055754	2017-05-06 20:15:27.055754	32	1	11	3
83	2017-01-01 08:21:00	2017-05-06 20:15:27.076375	2017-05-06 20:15:27.076375	33	1	11	3
84	2017-01-01 08:22:00	2017-05-06 20:15:27.098987	2017-05-06 20:15:27.098987	31	2	11	3
85	2017-01-02 08:22:00	2017-05-06 20:15:27.121938	2017-05-06 20:15:27.121938	32	2	11	3
86	2017-01-08 08:23:00	2017-05-06 20:15:27.142633	2017-05-06 20:15:27.142633	33	2	11	3
87	2017-01-01 08:23:00	2017-05-06 20:15:27.166703	2017-05-06 20:15:27.166703	31	3	11	3
88	2017-01-06 08:24:00	2017-05-06 20:15:27.187076	2017-05-06 20:15:27.187076	32	3	11	3
89	2017-01-01 08:20:00	2017-05-06 20:15:27.212241	2017-05-06 20:15:27.212241	34	1	12	3
90	2017-01-01 08:20:00	2017-05-06 20:15:27.231965	2017-05-06 20:15:27.231965	35	1	12	3
91	2017-01-01 08:21:00	2017-05-06 20:15:27.255072	2017-05-06 20:15:27.255072	36	1	12	3
92	2017-01-01 08:22:00	2017-05-06 20:15:27.277436	2017-05-06 20:15:27.277436	34	2	12	3
93	2017-01-02 08:22:00	2017-05-06 20:15:27.298878	2017-05-06 20:15:27.298878	35	2	12	3
94	2017-01-08 08:23:00	2017-05-06 20:15:27.320143	2017-05-06 20:15:27.320143	36	2	12	3
95	2017-01-01 08:23:00	2017-05-06 20:15:27.343704	2017-05-06 20:15:27.343704	34	3	12	3
96	2017-01-06 08:24:00	2017-05-06 20:15:27.368281	2017-05-06 20:15:27.368281	35	3	12	3
97	2017-01-01 08:20:00	2017-05-06 20:15:27.387656	2017-05-06 20:15:27.387656	37	1	13	2
98	2017-01-01 08:20:00	2017-05-06 20:15:27.412279	2017-05-06 20:15:27.412279	38	1	13	2
99	2017-01-01 08:21:00	2017-05-06 20:15:27.431423	2017-05-06 20:15:27.431423	39	1	13	2
100	2017-01-01 08:22:00	2017-05-06 20:15:27.454889	2017-05-06 20:15:27.454889	37	2	13	2
101	2017-01-02 08:22:00	2017-05-06 20:15:27.48037	2017-05-06 20:15:27.48037	38	2	13	2
102	2017-01-08 08:23:00	2017-05-06 20:15:27.498439	2017-05-06 20:15:27.498439	39	2	13	2
103	2017-01-01 08:23:00	2017-05-06 20:15:27.522522	2017-05-06 20:15:27.522522	37	3	13	2
104	2017-01-06 08:24:00	2017-05-06 20:15:27.54349	2017-05-06 20:15:27.54349	38	3	13	2
105	2017-01-01 08:20:00	2017-05-06 20:15:27.566868	2017-05-06 20:15:27.566868	40	1	14	2
106	2017-01-01 08:20:00	2017-05-06 20:15:27.588239	2017-05-06 20:15:27.588239	41	1	14	2
107	2017-01-01 08:21:00	2017-05-06 20:15:27.612491	2017-05-06 20:15:27.612491	42	1	14	2
108	2017-01-01 08:22:00	2017-05-06 20:15:27.6561	2017-05-06 20:15:27.6561	40	2	14	2
109	2017-01-02 08:22:00	2017-05-06 20:15:27.678413	2017-05-06 20:15:27.678413	41	2	14	2
110	2017-01-08 08:23:00	2017-05-06 20:15:27.700865	2017-05-06 20:15:27.700865	42	2	14	2
111	2017-01-01 08:23:00	2017-05-06 20:15:27.722377	2017-05-06 20:15:27.722377	40	3	14	2
112	2017-01-06 08:24:00	2017-05-06 20:15:27.745913	2017-05-06 20:15:27.745913	41	3	14	2
113	2017-01-01 08:20:00	2017-05-06 20:15:27.766078	2017-05-06 20:15:27.766078	43	1	15	3
114	2017-01-01 08:20:00	2017-05-06 20:15:27.789433	2017-05-06 20:15:27.789433	44	1	15	3
115	2017-01-01 08:21:00	2017-05-06 20:15:27.811778	2017-05-06 20:15:27.811778	45	1	15	3
116	2017-01-01 08:22:00	2017-05-06 20:15:27.831973	2017-05-06 20:15:27.831973	43	2	15	3
117	2017-01-02 08:22:00	2017-05-06 20:15:27.854814	2017-05-06 20:15:27.854814	44	2	15	3
118	2017-01-08 08:23:00	2017-05-06 20:15:27.876975	2017-05-06 20:15:27.876975	45	2	15	3
119	2017-01-01 08:23:00	2017-05-06 20:15:27.898965	2017-05-06 20:15:27.898965	43	3	15	3
120	2017-01-06 08:24:00	2017-05-06 20:15:27.921077	2017-05-06 20:15:27.921077	44	3	15	3
121	2017-01-01 08:20:00	2017-05-06 20:15:27.945084	2017-05-06 20:15:27.945084	46	1	16	3
122	2017-01-01 08:20:00	2017-05-06 20:15:27.966762	2017-05-06 20:15:27.966762	47	1	16	3
123	2017-01-01 08:21:00	2017-05-06 20:15:27.988418	2017-05-06 20:15:27.988418	48	1	16	3
124	2017-01-01 08:22:00	2017-05-06 20:15:28.044846	2017-05-06 20:15:28.044846	46	2	16	3
125	2017-01-02 08:22:00	2017-05-06 20:15:28.065927	2017-05-06 20:15:28.065927	47	2	16	3
126	2017-01-08 08:23:00	2017-05-06 20:15:28.087686	2017-05-06 20:15:28.087686	48	2	16	3
127	2017-01-01 08:23:00	2017-05-06 20:15:28.113951	2017-05-06 20:15:28.113951	46	3	16	3
128	2017-01-06 08:24:00	2017-05-06 20:15:28.131906	2017-05-06 20:15:28.131906	47	3	16	3
129	2017-01-01 08:20:00	2017-05-06 20:15:28.155376	2017-05-06 20:15:28.155376	49	1	17	3
130	2017-01-01 08:20:00	2017-05-06 20:15:28.176414	2017-05-06 20:15:28.176414	50	1	17	3
131	2017-01-01 08:21:00	2017-05-06 20:15:28.199989	2017-05-06 20:15:28.199989	51	1	17	3
132	2017-01-01 08:22:00	2017-05-06 20:15:28.221084	2017-05-06 20:15:28.221084	49	2	17	3
133	2017-01-02 08:22:00	2017-05-06 20:15:28.244299	2017-05-06 20:15:28.244299	50	2	17	3
134	2017-01-08 08:23:00	2017-05-06 20:15:28.266421	2017-05-06 20:15:28.266421	51	2	17	3
135	2017-01-01 08:23:00	2017-05-06 20:15:28.288702	2017-05-06 20:15:28.288702	49	3	17	3
136	2017-01-06 08:24:00	2017-05-06 20:15:28.312319	2017-05-06 20:15:28.312319	50	3	17	3
137	2017-01-01 08:20:00	2017-05-06 20:15:28.333319	2017-05-06 20:15:28.333319	52	1	18	3
138	2017-01-01 08:20:00	2017-05-06 20:15:28.354889	2017-05-06 20:15:28.354889	53	1	18	3
139	2017-01-01 08:21:00	2017-05-06 20:15:28.378351	2017-05-06 20:15:28.378351	54	1	18	3
140	2017-01-01 08:22:00	2017-05-06 20:15:28.398206	2017-05-06 20:15:28.398206	52	2	18	3
141	2017-01-02 08:22:00	2017-05-06 20:15:28.444369	2017-05-06 20:15:28.444369	53	2	18	3
142	2017-01-08 08:23:00	2017-05-06 20:15:28.467426	2017-05-06 20:15:28.467426	54	2	18	3
143	2017-01-01 08:23:00	2017-05-06 20:15:28.5104	2017-05-06 20:15:28.5104	52	3	18	3
144	2017-01-06 08:24:00	2017-05-06 20:15:28.533376	2017-05-06 20:15:28.533376	53	3	18	3
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 144, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-05-06 20:15:28.739977	2017-05-06 20:15:28.739977
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
1	Actividad	2017-05-06 20:15:15.002781	2017-05-06 20:15:15.002781
2	Area	2017-05-06 20:15:15.029082	2017-05-06 20:15:15.029082
3	Ciudad	2017-05-06 20:15:15.051626	2017-05-06 20:15:15.051626
4	ConceptoDePago	2017-05-06 20:15:15.077327	2017-05-06 20:15:15.077327
5	Contacto	2017-05-06 20:15:15.100915	2017-05-06 20:15:15.100915
6	Contrato	2017-05-06 20:15:15.129823	2017-05-06 20:15:15.129823
7	Cuenta	2017-05-06 20:15:15.155589	2017-05-06 20:15:15.155589
8	Departamento	2017-05-06 20:15:15.174716	2017-05-06 20:15:15.174716
9	Descuento	2017-05-06 20:15:15.198851	2017-05-06 20:15:15.198851
10	Empleado	2017-05-06 20:15:15.223575	2017-05-06 20:15:15.223575
11	EspecialidadDeContacto	2017-05-06 20:15:15.251787	2017-05-06 20:15:15.251787
12	Estado	2017-05-06 20:15:15.277886	2017-05-06 20:15:15.277886
13	Etapa	2017-05-06 20:15:15.309074	2017-05-06 20:15:15.309074
14	Evento	2017-05-06 20:15:15.330352	2017-05-06 20:15:15.330352
15	EventoProyecto	2017-05-06 20:15:15.360462	2017-05-06 20:15:15.360462
16	MiembroEquipo	2017-05-06 20:15:15.625097	2017-05-06 20:15:15.625097
17	Pago	2017-05-06 20:15:15.685943	2017-05-06 20:15:15.685943
18	Pais	2017-05-06 20:15:15.707515	2017-05-06 20:15:15.707515
19	Provincia	2017-05-06 20:15:15.730406	2017-05-06 20:15:15.730406
20	Proyecto	2017-05-06 20:15:15.754757	2017-05-06 20:15:15.754757
21	Rol	2017-05-06 20:15:15.774661	2017-05-06 20:15:15.774661
22	RolDeEmpleado	2017-05-06 20:15:15.802016	2017-05-06 20:15:15.802016
23	TipoDocumento	2017-05-06 20:15:15.832209	2017-05-06 20:15:15.832209
24	TipoDePago	2017-05-06 20:15:15.855898	2017-05-06 20:15:15.855898
25	User	2017-05-06 20:15:15.874433	2017-05-06 20:15:15.874433
26	ActividadProyecto	2017-05-06 20:15:15.898244	2017-05-06 20:15:15.898244
27	CuotaPorCliente	2017-05-06 20:15:15.921686	2017-05-06 20:15:15.921686
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
1	Argentina	2017-05-06 20:14:57.595367	2017-05-06 20:14:57.595367
2	Paraguay	2017-05-06 20:14:57.628818	2017-05-06 20:14:57.628818
3	Brasil	2017-05-06 20:14:57.661006	2017-05-06 20:14:57.661006
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-05-06 20:15:16.015576	2017-05-06 20:15:16.015576	1	1
2	2017-05-06 20:15:16.048584	2017-05-06 20:15:16.048584	2	1
3	2017-05-06 20:15:16.070404	2017-05-06 20:15:16.070404	3	1
4	2017-05-06 20:15:16.094725	2017-05-06 20:15:16.094725	4	1
5	2017-05-06 20:15:16.114768	2017-05-06 20:15:16.114768	1	2
6	2017-05-06 20:15:16.14063	2017-05-06 20:15:16.14063	2	2
7	2017-05-06 20:15:16.159883	2017-05-06 20:15:16.159883	3	2
8	2017-05-06 20:15:16.182692	2017-05-06 20:15:16.182692	4	2
9	2017-05-06 20:15:16.204092	2017-05-06 20:15:16.204092	1	3
10	2017-05-06 20:15:16.226466	2017-05-06 20:15:16.226466	2	3
11	2017-05-06 20:15:16.248452	2017-05-06 20:15:16.248452	3	3
12	2017-05-06 20:15:16.270289	2017-05-06 20:15:16.270289	4	3
13	2017-05-06 20:15:16.292322	2017-05-06 20:15:16.292322	1	4
14	2017-05-06 20:15:16.31513	2017-05-06 20:15:16.31513	2	4
15	2017-05-06 20:15:16.337969	2017-05-06 20:15:16.337969	3	4
16	2017-05-06 20:15:16.359867	2017-05-06 20:15:16.359867	4	4
17	2017-05-06 20:15:16.382689	2017-05-06 20:15:16.382689	1	5
18	2017-05-06 20:15:16.403944	2017-05-06 20:15:16.403944	2	5
19	2017-05-06 20:15:16.426746	2017-05-06 20:15:16.426746	3	5
20	2017-05-06 20:15:16.451063	2017-05-06 20:15:16.451063	4	5
21	2017-05-06 20:15:16.472758	2017-05-06 20:15:16.472758	1	6
22	2017-05-06 20:15:16.494106	2017-05-06 20:15:16.494106	2	6
23	2017-05-06 20:15:16.518254	2017-05-06 20:15:16.518254	3	6
24	2017-05-06 20:15:16.539858	2017-05-06 20:15:16.539858	4	6
25	2017-05-06 20:15:16.62783	2017-05-06 20:15:16.62783	1	7
26	2017-05-06 20:15:16.651496	2017-05-06 20:15:16.651496	2	7
27	2017-05-06 20:15:16.67214	2017-05-06 20:15:16.67214	3	7
28	2017-05-06 20:15:16.695286	2017-05-06 20:15:16.695286	4	7
29	2017-05-06 20:15:16.717493	2017-05-06 20:15:16.717493	1	8
30	2017-05-06 20:15:16.738955	2017-05-06 20:15:16.738955	2	8
31	2017-05-06 20:15:16.760687	2017-05-06 20:15:16.760687	3	8
32	2017-05-06 20:15:16.78427	2017-05-06 20:15:16.78427	4	8
33	2017-05-06 20:15:16.805741	2017-05-06 20:15:16.805741	1	9
34	2017-05-06 20:15:16.82803	2017-05-06 20:15:16.82803	2	9
35	2017-05-06 20:15:16.861476	2017-05-06 20:15:16.861476	3	9
36	2017-05-06 20:15:16.885159	2017-05-06 20:15:16.885159	4	9
37	2017-05-06 20:15:16.905715	2017-05-06 20:15:16.905715	1	10
38	2017-05-06 20:15:16.927919	2017-05-06 20:15:16.927919	2	10
39	2017-05-06 20:15:16.950711	2017-05-06 20:15:16.950711	3	10
40	2017-05-06 20:15:16.972456	2017-05-06 20:15:16.972456	4	10
41	2017-05-06 20:15:16.995187	2017-05-06 20:15:16.995187	1	11
42	2017-05-06 20:15:17.017136	2017-05-06 20:15:17.017136	2	11
43	2017-05-06 20:15:17.038804	2017-05-06 20:15:17.038804	3	11
44	2017-05-06 20:15:17.061389	2017-05-06 20:15:17.061389	4	11
45	2017-05-06 20:15:17.084489	2017-05-06 20:15:17.084489	1	12
46	2017-05-06 20:15:17.150995	2017-05-06 20:15:17.150995	2	12
47	2017-05-06 20:15:17.206856	2017-05-06 20:15:17.206856	3	12
48	2017-05-06 20:15:17.261026	2017-05-06 20:15:17.261026	4	12
49	2017-05-06 20:15:17.316623	2017-05-06 20:15:17.316623	1	13
50	2017-05-06 20:15:17.37275	2017-05-06 20:15:17.37275	2	13
51	2017-05-06 20:15:17.440701	2017-05-06 20:15:17.440701	3	13
52	2017-05-06 20:15:17.494723	2017-05-06 20:15:17.494723	4	13
53	2017-05-06 20:15:17.520544	2017-05-06 20:15:17.520544	1	14
54	2017-05-06 20:15:17.572206	2017-05-06 20:15:17.572206	2	14
55	2017-05-06 20:15:17.599552	2017-05-06 20:15:17.599552	3	14
56	2017-05-06 20:15:17.619263	2017-05-06 20:15:17.619263	4	14
57	2017-05-06 20:15:17.639059	2017-05-06 20:15:17.639059	1	15
58	2017-05-06 20:15:17.661605	2017-05-06 20:15:17.661605	2	15
59	2017-05-06 20:15:17.684332	2017-05-06 20:15:17.684332	3	15
60	2017-05-06 20:15:17.705885	2017-05-06 20:15:17.705885	4	15
61	2017-05-06 20:15:17.728064	2017-05-06 20:15:17.728064	1	16
62	2017-05-06 20:15:17.750237	2017-05-06 20:15:17.750237	2	16
63	2017-05-06 20:15:17.773361	2017-05-06 20:15:17.773361	3	16
64	2017-05-06 20:15:17.794749	2017-05-06 20:15:17.794749	4	16
65	2017-05-06 20:15:17.817593	2017-05-06 20:15:17.817593	1	17
66	2017-05-06 20:15:17.842052	2017-05-06 20:15:17.842052	2	17
67	2017-05-06 20:15:17.872453	2017-05-06 20:15:17.872453	3	17
68	2017-05-06 20:15:17.895972	2017-05-06 20:15:17.895972	4	17
69	2017-05-06 20:15:17.917423	2017-05-06 20:15:17.917423	1	18
70	2017-05-06 20:15:17.941058	2017-05-06 20:15:17.941058	2	18
71	2017-05-06 20:15:17.961385	2017-05-06 20:15:17.961385	3	18
72	2017-05-06 20:15:17.98345	2017-05-06 20:15:17.98345	4	18
73	2017-05-06 20:15:18.006704	2017-05-06 20:15:18.006704	1	19
74	2017-05-06 20:15:18.027873	2017-05-06 20:15:18.027873	2	19
75	2017-05-06 20:15:18.051207	2017-05-06 20:15:18.051207	3	19
76	2017-05-06 20:15:18.094667	2017-05-06 20:15:18.094667	4	19
77	2017-05-06 20:15:18.117348	2017-05-06 20:15:18.117348	1	20
78	2017-05-06 20:15:18.140274	2017-05-06 20:15:18.140274	2	20
79	2017-05-06 20:15:18.162588	2017-05-06 20:15:18.162588	3	20
80	2017-05-06 20:15:18.18378	2017-05-06 20:15:18.18378	4	20
81	2017-05-06 20:15:18.205796	2017-05-06 20:15:18.205796	1	21
82	2017-05-06 20:15:18.22788	2017-05-06 20:15:18.22788	2	21
83	2017-05-06 20:15:18.260999	2017-05-06 20:15:18.260999	3	21
84	2017-05-06 20:15:18.283377	2017-05-06 20:15:18.283377	4	21
85	2017-05-06 20:15:18.305623	2017-05-06 20:15:18.305623	1	22
86	2017-05-06 20:15:18.327715	2017-05-06 20:15:18.327715	2	22
87	2017-05-06 20:15:18.350414	2017-05-06 20:15:18.350414	3	22
88	2017-05-06 20:15:18.374207	2017-05-06 20:15:18.374207	4	22
89	2017-05-06 20:15:18.418277	2017-05-06 20:15:18.418277	1	23
90	2017-05-06 20:15:18.439134	2017-05-06 20:15:18.439134	2	23
91	2017-05-06 20:15:18.472353	2017-05-06 20:15:18.472353	3	23
92	2017-05-06 20:15:18.495851	2017-05-06 20:15:18.495851	4	23
93	2017-05-06 20:15:18.539991	2017-05-06 20:15:18.539991	1	24
94	2017-05-06 20:15:18.562131	2017-05-06 20:15:18.562131	2	24
95	2017-05-06 20:15:18.587441	2017-05-06 20:15:18.587441	3	24
96	2017-05-06 20:15:18.618224	2017-05-06 20:15:18.618224	4	24
97	2017-05-06 20:15:18.650919	2017-05-06 20:15:18.650919	1	25
98	2017-05-06 20:15:18.674527	2017-05-06 20:15:18.674527	2	25
99	2017-05-06 20:15:18.697348	2017-05-06 20:15:18.697348	3	25
100	2017-05-06 20:15:18.717042	2017-05-06 20:15:18.717042	4	25
101	2017-05-06 20:15:18.740528	2017-05-06 20:15:18.740528	5	20
102	2017-05-06 20:15:18.762022	2017-05-06 20:15:18.762022	6	1
103	2017-05-06 20:15:18.784504	2017-05-06 20:15:18.784504	6	2
104	2017-05-06 20:15:18.806344	2017-05-06 20:15:18.806344	6	3
105	2017-05-06 20:15:18.828645	2017-05-06 20:15:18.828645	6	4
106	2017-05-06 20:15:18.851054	2017-05-06 20:15:18.851054	6	5
107	2017-05-06 20:15:18.872846	2017-05-06 20:15:18.872846	6	6
108	2017-05-06 20:15:18.894834	2017-05-06 20:15:18.894834	6	7
109	2017-05-06 20:15:18.916841	2017-05-06 20:15:18.916841	6	8
110	2017-05-06 20:15:18.93962	2017-05-06 20:15:18.93962	6	9
111	2017-05-06 20:15:18.961719	2017-05-06 20:15:18.961719	6	10
112	2017-05-06 20:15:18.984322	2017-05-06 20:15:18.984322	6	11
113	2017-05-06 20:15:19.005709	2017-05-06 20:15:19.005709	6	12
114	2017-05-06 20:15:19.028208	2017-05-06 20:15:19.028208	6	13
115	2017-05-06 20:15:19.051298	2017-05-06 20:15:19.051298	6	14
116	2017-05-06 20:15:19.078366	2017-05-06 20:15:19.078366	6	15
117	2017-05-06 20:15:19.106414	2017-05-06 20:15:19.106414	6	16
118	2017-05-06 20:15:19.129106	2017-05-06 20:15:19.129106	6	17
119	2017-05-06 20:15:19.153084	2017-05-06 20:15:19.153084	6	18
120	2017-05-06 20:15:19.186209	2017-05-06 20:15:19.186209	6	19
121	2017-05-06 20:15:19.206088	2017-05-06 20:15:19.206088	6	20
122	2017-05-06 20:15:19.227993	2017-05-06 20:15:19.227993	6	21
123	2017-05-06 20:15:19.25226	2017-05-06 20:15:19.25226	6	22
124	2017-05-06 20:15:19.272855	2017-05-06 20:15:19.272855	6	23
125	2017-05-06 20:15:19.29689	2017-05-06 20:15:19.29689	6	24
126	2017-05-06 20:15:19.325303	2017-05-06 20:15:19.325303	6	25
127	2017-05-06 20:15:19.350825	2017-05-06 20:15:19.350825	2	26
128	2017-05-06 20:15:19.372542	2017-05-06 20:15:19.372542	4	26
129	2017-05-06 20:15:19.394651	2017-05-06 20:15:19.394651	6	26
130	2017-05-06 20:15:19.439156	2017-05-06 20:15:19.439156	5	17
131	2017-05-06 20:15:19.461386	2017-05-06 20:15:19.461386	5	14
132	2017-05-06 20:15:19.483864	2017-05-06 20:15:19.483864	5	6
133	2017-05-06 20:15:19.506566	2017-05-06 20:15:19.506566	1	27
134	2017-05-06 20:15:19.540361	2017-05-06 20:15:19.540361	3	27
135	2017-05-06 20:15:19.562982	2017-05-06 20:15:19.562982	4	27
136	2017-05-06 20:15:19.606998	2017-05-06 20:15:19.606998	5	27
137	2017-05-06 20:15:19.628469	2017-05-06 20:15:19.628469	6	27
138	2017-05-06 20:15:19.662764	2017-05-06 20:15:19.662764	7	20
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

COPY personas (id, codigo, nombre, apellido, "nroIdentificacion", "fechaNacimiento", calle, "nroDomicilio", piso, dpto, telefono, email, type, created_at, updated_at, pais_id, provincia_id, ciudad_id, tipo_documento_id, departamento_id, area_id, rol_de_empleado_id) FROM stdin;
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	2017-05-06 20:14:59.541212	2017-05-06 20:14:59.541212	1	1	1	1	5	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	2017-05-06 20:14:59.70254	2017-05-06 20:14:59.70254	1	1	1	1	4	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	2017-05-06 20:14:59.794748	2017-05-06 20:14:59.794748	1	1	1	1	3	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	2017-05-06 20:14:59.880731	2017-05-06 20:14:59.880731	1	1	1	1	2	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	2017-05-06 20:14:59.970533	2017-05-06 20:14:59.970533	1	1	1	1	1	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	2017-05-06 20:15:00.091134	2017-05-06 20:15:00.091134	1	1	1	1	4	1	7
7	EMP-007	Maria	Gonzalez	36134076	1991-11-05	176	7141			4401604	mg@gmail.com	Empleado	2017-05-06 20:15:00.20314	2017-05-06 20:15:00.20314	1	1	1	1	5	1	8
8	EMP-008	Elena	Ceballos	25198461	1974-05-06	Tereré	7302	4	B	4355987	ec@gmail.com	Empleado	2017-05-06 20:15:00.322707	2017-05-06 20:15:00.322707	1	1	1	1	4	1	7
9	EMP-009	Alberto	Padilla	33843657	1986-10-17	Rivera	6872			459885	ap@gmail.com	Empleado	2017-05-06 20:15:00.422977	2017-05-06 20:15:00.422977	1	1	1	1	3	1	4
10	EMP-010	Fernando	Gonzalez	33980912	1987-01-21	Tereré	1187			4456980	fg@gmail.com	Empleado	2017-05-06 20:15:00.519735	2017-05-06 20:15:00.519735	1	1	1	1	2	1	3
11	EMP-011	Tiago	Gonzalez	38187222	1995-06-08	Castilla	8299	10	15	4444176	tiagogonzales@gmail.com	Empleado	2017-05-06 20:15:00.635944	2017-05-06 20:15:00.635944	1	1	1	1	1	1	2
12	EMP-012	Cintia	Castro	22612413	1970-02-20	Av. Andalucia	7415	12	A	4255987	cintiacastro@gmail.com	Empleado	2017-05-06 20:15:00.757284	2017-05-06 20:15:00.757284	1	1	1	1	4	1	7
13	EMP-013	Josefina	Jardin	36025176	1991-11-05	176	7141			4401604	josefinajardin@gmail.com	Empleado	2017-05-06 20:15:00.855182	2017-05-06 20:15:00.855182	1	1	1	1	5	1	8
14	EMP-014	Diana	Rivas	25948001	1974-05-06	Tereré	7302	4	B	4355987	dianarivas@gmail.com	Empleado	2017-05-06 20:15:00.957673	2017-05-06 20:15:00.957673	1	1	1	1	4	1	7
15	EMP-015	Dario	Gonzalez	33880019	1986-10-17	Rivera	6872			459885	dariogonzalez@gmail.com	Empleado	2017-05-06 20:15:01.049808	2017-05-06 20:15:01.049808	1	1	1	1	3	1	4
16	EMP-016	Ciro	Zamora	33983707	1987-01-21	Tereré	1187			4456980	cirozamora@gmail.com	Empleado	2017-05-06 20:15:01.162089	2017-05-06 20:15:01.162089	1	1	1	1	2	1	3
17	EMP-017	Zoe	Vazquez	3818104	1995-06-08	Castilla	8299	10	15	4444176	zoevazquez@gmail.com	Empleado	2017-05-06 20:15:01.25517	2017-05-06 20:15:01.25517	1	1	1	1	1	1	2
18	EMP-018	Cristian	Gonzalez	22659193	1970-02-20	Av. Andalucia	7415	12	A	4255987	cristiangonzalez@gmail.com	Empleado	2017-05-06 20:15:01.354909	2017-05-06 20:15:01.354909	1	1	1	1	4	1	7
19	EMP-019	Ana	Manfrin	36222076	1991-11-05	176	7141			4401604	anamanfrin@gmail.com	Empleado	2017-05-06 20:15:01.450132	2017-05-06 20:15:01.450132	1	1	1	1	5	1	8
20	EMP-020	Martina	Adamo	25841001	1974-05-06	Tereré	7302	4	B	4355987	martinaadamo@gmail.com	Empleado	2017-05-06 20:15:01.560378	2017-05-06 20:15:01.560378	1	1	1	1	4	1	7
21	EMP-021	Roberto	Milani	33880333	1986-10-17	Rivera	6872			459885	robertomilani@gmail.com	Empleado	2017-05-06 20:15:01.658996	2017-05-06 20:15:01.658996	1	1	1	1	3	1	4
22	EMP-022	Victor	Gonzalez	33984447	1987-01-21	Tereré	1187			4456980	victorgonzalez@gmail.com	Empleado	2017-05-06 20:15:01.763679	2017-05-06 20:15:01.763679	1	1	1	1	2	1	3
23	EMP-023	Alejandro	Cambril	38113409	1995-06-08	Castilla	8299	10	15	4444176	alejandrocambril@gmail.com	Empleado	2017-05-06 20:15:01.876971	2017-05-06 20:15:01.876971	1	1	1	1	1	1	2
24	EMP-024	Luis	Rizzo	22543493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luisrizzo@gmail.com	Empleado	2017-05-06 20:15:01.994479	2017-05-06 20:15:01.994479	1	1	1	1	4	1	7
25	EMP-025	Mario	Rosas	36060986	1991-11-05	176	7141			4401604	mariorosas@gmail.com	Empleado	2017-05-06 20:15:02.080022	2017-05-06 20:15:02.080022	1	1	1	1	5	1	8
26	EMP-026	Analia	Granados	25131701	1974-05-06	Tereré	7302	4	B	4355987	analiagranados@gmail.com	Empleado	2017-05-06 20:15:02.178396	2017-05-06 20:15:02.178396	1	1	1	1	4	1	7
27	EMP-027	Leonor	Gonzalez	33888717	1986-10-17	Rivera	6872			459885	leonorgonzalez@gmail.com	Empleado	2017-05-06 20:15:02.289004	2017-05-06 20:15:02.289004	1	1	1	1	3	1	4
28	EMP-028	Victor	Baresi	33928407	1987-01-21	Tereré	1187			4456980	victorbaresi@gmail.com	Empleado	2017-05-06 20:15:02.40741	2017-05-06 20:15:02.40741	1	1	1	1	2	1	3
29	EMP-029	Silvana	Lazzaga	38918849	1995-06-08	Castilla	8299	10	15	4444176	silvanalazzaga@gmail.com	Empleado	2017-05-06 20:15:02.524651	2017-05-06 20:15:02.524651	1	1	1	1	1	1	2
30	EMP-030	Juana	Calabrese	220192493	1970-02-20	Av. Andalucia	7415	12	A	4255987	janacalabrese@gmail.com	Empleado	2017-05-06 20:15:02.615375	2017-05-06 20:15:02.615375	1	1	1	1	4	1	7
31	EMP-031	Juliana	Lombardi	38613849	1995-06-08	Castilla	8299	10	15	4444176	julianalombardi@gmail.com	Empleado	2017-05-06 20:15:02.714633	2017-05-06 20:15:02.714633	1	1	1	1	1	1	2
32	EMP-032	Enrique	Cano	22451493	1970-02-20	Av. Andalucia	7415	12	A	4255987	enriquecano@gmail.com	Empleado	2017-05-06 20:15:02.82233	2017-05-06 20:15:02.82233	1	1	1	1	4	1	7
33	EMP-033	Gilda	Lombarde	36064356	1991-11-05	176	7141			4401604	gildalombarde@gmail.com	Empleado	2017-05-06 20:15:02.925055	2017-05-06 20:15:02.925055	1	1	1	1	5	1	8
34	EMP-034	Martin	Bande	25124501	1974-05-06	Tereré	7302	4	B	4355987	martinbande@gmail.com	Empleado	2017-05-06 20:15:03.026237	2017-05-06 20:15:03.026237	1	1	1	1	4	1	7
35	EMP-035	Gabriel	Ferruccio	33451657	1986-10-17	Rivera	6872			459885	gabrielferuccio@gmail.com	Empleado	2017-05-06 20:15:03.125172	2017-05-06 20:15:03.125172	1	1	1	1	3	1	4
36	EMP-036	Juan	Mazzanti	33956107	1987-01-21	Tereré	1187			4456980	juanmazzanti@gmail.com	Empleado	2017-05-06 20:15:03.222589	2017-05-06 20:15:03.222589	1	1	1	1	2	1	3
37	EMP-037	Karina	Fiorentino	38663849	1995-06-08	Castilla	8299	10	15	4444176	karinafiorentino@gmail.com	Empleado	2017-05-06 20:15:03.323424	2017-05-06 20:15:03.323424	1	1	1	1	1	1	2
38	EMP-038	Osvaldo	Pagnotto	22019493	1970-02-20	Av. Andalucia	7415	12	A	4255987	osvaldopagnotto@gmail.com	Empleado	2017-05-06 20:15:03.41954	2017-05-06 20:15:03.41954	1	1	1	1	4	1	7
39	EMP-039	Margarita	Giordano	36068886	1991-11-05	176	7141			4401604	margaritagiordano@gmail.com	Empleado	2017-05-06 20:15:03.513719	2017-05-06 20:15:03.513719	1	1	1	1	5	1	8
40	EMP-040	Rosa	Napolitano	2576401	1974-05-06	Tereré	7302	4	B	4355987	rosanapolitano@gmail.com	Empleado	2017-05-06 20:15:03.605896	2017-05-06 20:15:03.605896	1	1	1	1	4	1	7
41	EMP-041	Magdalena	Bruno	38817849	1995-06-08	Castilla	8299	10	15	4444176	mardalenabruno@gmail.com	Empleado	2017-05-06 20:15:03.697023	2017-05-06 20:15:03.697023	1	1	1	1	1	1	2
42	EMP-042	Mauricio	Costa	22755493	1970-02-20	Av. Andalucia	7415	12	A	4255987	mauriciocosta@gmail.com	Empleado	2017-05-06 20:15:03.82076	2017-05-06 20:15:03.82076	1	1	1	1	4	1	7
43	EMP-043	Ivan	Costas	36755076	1991-11-05	176	7141			4401604	ivancostas@gmail.com	Empleado	2017-05-06 20:15:03.917009	2017-05-06 20:15:03.917009	1	1	1	1	5	1	8
44	EMP-044	Pablo	Davide	251934401	1974-05-06	Tereré	7302	4	B	4355987	pablodavide@gmail.com	Empleado	2017-05-06 20:15:04.004796	2017-05-06 20:15:04.004796	1	1	1	1	4	1	7
45	EMP-045	Nicolas	Medina	33801927	1986-10-17	Rivera	6872			459885	nicolasmedina@gmail.com	Empleado	2017-05-06 20:15:04.108566	2017-05-06 20:15:04.108566	1	1	1	1	3	1	4
46	EMP-046	Celeste	Milano	35122307	1987-01-21	Tereré	1187			4456980	celestemilano@gmail.com	Empleado	2017-05-06 20:15:04.217166	2017-05-06 20:15:04.217166	1	1	1	1	2	1	3
47	EMP-047	Sebastian	Schiavone	38175649	1995-06-08	Castilla	8299	10	15	4444176	sebastianschiavone@gmail.com	Empleado	2017-05-06 20:15:04.322486	2017-05-06 20:15:04.322486	1	1	1	1	1	1	2
48	EMP-048	Ruben	Almedina	22891493	1970-02-20	Av. Andalucia	7415	12	A	4255987	rubenalmedina@gmail.com	Empleado	2017-05-06 20:15:04.441054	2017-05-06 20:15:04.441054	1	1	1	1	4	1	7
49	EMP-049	Cristian	Camiño	36093716	1991-11-05	176	7141			4401604	cristiancamiño@gmail.com	Empleado	2017-05-06 20:15:04.538959	2017-05-06 20:15:04.538959	1	1	1	1	5	1	8
50	EMP-050	Monica	Conti	25888001	1974-05-06	Tereré	7302	4	B	4355987	monicaconti@gmail.com	Empleado	2017-05-06 20:15:04.639016	2017-05-06 20:15:04.639016	1	1	1	1	4	1	7
51	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	2017-05-06 20:15:04.837992	2017-05-06 20:15:04.837992	1	1	2	2	\N	1	\N
52	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	2017-05-06 20:15:04.949493	2017-05-06 20:15:04.949493	1	1	2	1	\N	1	\N
53	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	2017-05-06 20:15:05.034396	2017-05-06 20:15:05.034396	1	1	2	1	\N	1	\N
54	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	2017-05-06 20:15:05.126441	2017-05-06 20:15:05.126441	1	1	2	1	\N	1	\N
55	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	2017-05-06 20:15:05.238396	2017-05-06 20:15:05.238396	1	1	2	1	\N	1	\N
56	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	2017-05-06 20:15:05.340431	2017-05-06 20:15:05.340431	1	1	2	2	\N	1	\N
57	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	2017-05-06 20:15:05.512492	2017-05-06 20:15:05.512492	1	1	2	1	\N	1	\N
58	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	2017-05-06 20:15:05.600494	2017-05-06 20:15:05.600494	1	1	2	1	\N	1	\N
59	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	2017-05-06 20:15:05.693653	2017-05-06 20:15:05.693653	1	1	2	1	\N	1	\N
60	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	2017-05-06 20:15:05.797986	2017-05-06 20:15:05.797986	1	1	2	2	\N	1	\N
61	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	2017-05-06 20:15:05.904714	2017-05-06 20:15:05.904714	1	1	2	1	\N	1	\N
62	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	2017-05-06 20:15:06.003224	2017-05-06 20:15:06.003224	1	1	2	1	\N	1	\N
63	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	2017-05-06 20:15:06.114167	2017-05-06 20:15:06.114167	1	1	2	1	\N	1	\N
64	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	2017-05-06 20:15:06.202661	2017-05-06 20:15:06.202661	1	1	2	2	\N	1	\N
65	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	2017-05-06 20:15:06.288222	2017-05-06 20:15:06.288222	1	1	2	1	\N	1	\N
66	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	2017-05-06 20:15:06.38448	2017-05-06 20:15:06.38448	1	1	2	1	\N	1	\N
67	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	2017-05-06 20:15:06.476002	2017-05-06 20:15:06.476002	1	1	2	1	\N	1	\N
68	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	2017-05-06 20:15:06.578151	2017-05-06 20:15:06.578151	1	1	2	2	\N	1	\N
69	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	2017-05-06 20:15:06.686027	2017-05-06 20:15:06.686027	1	1	2	1	\N	1	\N
70	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	2017-05-06 20:15:06.784034	2017-05-06 20:15:06.784034	1	1	2	1	\N	1	\N
71	ME-021	Lidia	Delucci	28088944	1981-01-29	Chile	6144			481898	lidiadelucci@gmail.com	MiembroEquipo	2017-05-06 20:15:06.877739	2017-05-06 20:15:06.877739	1	1	2	1	\N	1	\N
72	ME-022	Leonor	Gomez Santos	40560231	1996-03-13	Plaza Mayor	2637			4536662	leonorgs@gmail.com	MiembroEquipo	2017-05-06 20:15:06.994213	2017-05-06 20:15:06.994213	1	1	2	1	\N	1	\N
73	ME-023	Lara	Gonçalves	29075344	1980-07-19	España	1415			4498457	laragoncalves@gmail.com	MiembroEquipo	2017-05-06 20:15:07.080806	2017-05-06 20:15:07.080806	1	1	2	1	\N	1	\N
74	ME-024	Martin	Diaz	26070390	1976-08-11	calle Nueva	1826			491088	martindiaz@gmail.com	MiembroEquipo	2017-05-06 20:15:07.177442	2017-05-06 20:15:07.177442	1	1	2	1	\N	1	\N
75	ME-025	Marina	Diaz	26070394	1976-08-11	calle Nueva	1826			491088	marinadiaz@gmail.com	MiembroEquipo	2017-05-06 20:15:07.293765	2017-05-06 20:15:07.293765	1	1	2	1	\N	1	\N
76	ME-026	Gerardo	Urbina	29234987	1980-05-31	Álamo	6162			455433	gerardou@gmail.com	MiembroEquipo	2017-05-06 20:15:07.395139	2017-05-06 20:15:07.395139	1	1	2	1	\N	1	\N
77	ME-027	Silvio	Quiroz	35465922	1990-02-27	Álamo	2128			415176	silvioquiroz@gmail.com	MiembroEquipo	2017-05-06 20:15:07.480574	2017-05-06 20:15:07.480574	1	1	2	1	\N	1	\N
78	ME-028	Gabriela	Garcia	33457976	1987-12-19	Alem	123			451912	lidiadelucci@gmail.com	MiembroEquipo	2017-05-06 20:15:07.571908	2017-05-06 20:15:07.571908	1	1	2	1	\N	1	\N
79	ME-029	Leonardo	Rios	29524865	1981-11-30	Concepcion	5139			4590871	lidiadelucci@gmail.com	MiembroEquipo	2017-05-06 20:15:07.661631	2017-05-06 20:15:07.661631	1	1	2	1	\N	1	\N
80	ME-030	Ubaldo	Gomez	34123456	1990-04-08	Entre Rios	1235			456798	ubaldogomez@gmail.com	MiembroEquipo	2017-05-06 20:15:07.748452	2017-05-06 20:15:07.748452	1	1	2	1	\N	1	\N
81	ME-031	Silvio	Gonzalez	29092236	1980-05-16	Cordoba	7213			4501923	silviogonzalez@gmail.com	MiembroEquipo	2017-05-06 20:15:07.85286	2017-05-06 20:15:07.85286	1	1	2	1	\N	1	\N
82	ME-032	Rosa	Fernandez	20112254	1968-09-13	San Martin	1028			4567895	rosafernandez@gmail.com	MiembroEquipo	2017-05-06 20:15:07.949507	2017-05-06 20:15:07.949507	1	1	2	1	\N	1	\N
83	ME-033	Alejandro	Fernandez	20998871	1987-05-16	Santa Fe	4812			4311235	alefernandez@gmail.com	MiembroEquipo	2017-05-06 20:15:08.039607	2017-05-06 20:15:08.039607	1	1	2	1	\N	1	\N
84	ME-034	Hugo	Rios	40034940	1998-11-30	Alvear	5028			481341	hugorios@gmail.com	MiembroEquipo	2017-05-06 20:15:08.14703	2017-05-06 20:15:08.14703	1	1	2	1	\N	1	\N
85	ME-035	Mario	Garcia	24654447	1976-04-08	Roca	193			4212351	mariogarcia@gmail.com	MiembroEquipo	2017-05-06 20:15:08.236372	2017-05-06 20:15:08.236372	1	1	2	1	\N	1	\N
86	ME-036	Marina	Moralez	36421952	1992-08-19	Ucrania	9371			451241	marimamoralez@gmail.com	MiembroEquipo	2017-05-06 20:15:08.372907	2017-05-06 20:15:08.372907	1	1	2	1	\N	1	\N
87	ME-037	Silvina	Portillo	26498388	1976-06-05	Av Queirel	7621			431214	silvinaportillo@gmail.com	MiembroEquipo	2017-05-06 20:15:08.492951	2017-05-06 20:15:08.492951	1	1	2	1	\N	1	\N
88	ME-038	Maria	Maciel	33428434	1989-09-04	Paraguay	600			4761602	mariamaciel@gmail.com	MiembroEquipo	2017-05-06 20:15:08.590693	2017-05-06 20:15:08.590693	1	1	2	1	\N	1	\N
89	ME-039	Angeles	Granados	31452518	1981-04-09	Uruguay	12			481858	angelesgranados@gmail.com	MiembroEquipo	2017-05-06 20:15:08.687291	2017-05-06 20:15:08.687291	1	1	2	1	\N	1	\N
90	ME-040	Cintia	Gutierrez	29701192	1992-11-05	Av Roca	464			483498	cintiagutierrez@gmail.com	MiembroEquipo	2017-05-06 20:15:08.773356	2017-05-06 20:15:08.773356	1	1	2	1	\N	1	\N
91	ME-041	David	Sedillo	36371823	1975-07-23	Centenario	6135			481018	davidsedillo@gmail.com	MiembroEquipo	2017-05-06 20:15:08.877011	2017-05-06 20:15:08.877011	1	1	2	1	\N	1	\N
92	ME-042	Sofia	Garcia	25370180	1998-01-13	Las Flores	1234			409498	sofiagarcia@gmail.com	MiembroEquipo	2017-05-06 20:15:08.974836	2017-05-06 20:15:08.974836	1	1	2	1	\N	1	\N
93	ME-043	Alicia	Villalba	27455263	1979-04-17	Las Palmeras	9876			420184	alivillalba@gmail.com	MiembroEquipo	2017-05-06 20:15:09.074804	2017-05-06 20:15:09.074804	1	1	2	1	\N	1	\N
94	ME-044	Luis	Gonzalez	36182911	1992-06-19	Las Orquideas	900			495712	luisgonzalez@gmail.com	MiembroEquipo	2017-05-06 20:15:09.182162	2017-05-06 20:15:09.182162	1	1	2	1	\N	1	\N
95	ME-045	Ernesto	Da Luz	30346514	1983-06-19	Rosas	2463			413048	ernestodaluz@gmail.com	MiembroEquipo	2017-05-06 20:15:09.270491	2017-05-06 20:15:09.270491	1	1	2	1	\N	1	\N
96	ME-046	Luciano	Garcia	39019733	1996-03-13	Colon	8123			412451	lucianogarcia@gmail.com	MiembroEquipo	2017-05-06 20:15:09.35936	2017-05-06 20:15:09.35936	1	1	2	1	\N	1	\N
97	ME-047	Gerardo	Cano	29232117	1980-07-19	Escuelita	9173			462093	gerardocano@gmail.com	MiembroEquipo	2017-05-06 20:15:09.469362	2017-05-06 20:15:09.469362	1	1	2	1	\N	1	\N
98	ME-048	Hector	Rincon	29222287	1980-05-31	Japon	2546			471927	hectorrincon@gmail.com	MiembroEquipo	2017-05-06 20:15:09.573372	2017-05-06 20:15:09.573372	1	1	2	1	\N	1	\N
99	ME-049	Alberto	Gonzalez	35225922	1990-02-27	Colombia	2871			431570	albertogonzalez@gmail.com	MiembroEquipo	2017-05-06 20:15:09.661987	2017-05-06 20:15:09.661987	1	1	2	1	\N	1	\N
100	ME-050	Roberto	Lujan	35461122	1990-05-27	Noruega	1980			401938	robertolujan@gmail.com	MiembroEquipo	2017-05-06 20:15:09.75203	2017-05-06 20:15:09.75203	1	1	2	1	\N	1	\N
101	1234	Ana 	Canteros	71645800	2017-05-03	124	1241				valeriana@gmail.com	Contacto	2017-05-07 03:37:42.123202	2017-05-07 03:37:42.123202	1	1	1	1	\N	1	\N
\.


--
-- Data for Name: personas_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_especialidades (id, created_at, updated_at, persona_id, especialidad_de_contacto_id) FROM stdin;
1	2017-05-07 03:37:42.138849	2017-05-07 03:37:42.138849	101	2
2	2017-05-07 03:37:42.197828	2017-05-07 03:37:42.197828	101	3
\.


--
-- Name: personas_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_especialidades_id_seq', 2, true);


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
\.


--
-- Name: personas_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_eventos_id_seq', 1, false);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 101, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-05-06 20:15:13.171221	2017-05-06 20:15:13.171221	1	51
2	2017-05-06 20:15:13.203796	2017-05-06 20:15:13.203796	1	2
3	2017-05-06 20:15:13.22514	2017-05-06 20:15:13.22514	2	2
4	2017-05-06 20:15:13.24941	2017-05-06 20:15:13.24941	2	52
5	2017-05-06 20:15:13.272017	2017-05-06 20:15:13.272017	2	53
6	2017-05-06 20:15:13.29188	2017-05-06 20:15:13.29188	3	6
7	2017-05-06 20:15:13.315067	2017-05-06 20:15:13.315067	3	54
8	2017-05-06 20:15:13.336542	2017-05-06 20:15:13.336542	3	55
9	2017-05-06 20:15:13.359003	2017-05-06 20:15:13.359003	4	6
10	2017-05-06 20:15:13.381431	2017-05-06 20:15:13.381431	4	56
11	2017-05-06 20:15:13.404599	2017-05-06 20:15:13.404599	4	57
12	2017-05-06 20:15:13.42591	2017-05-06 20:15:13.42591	5	2
13	2017-05-06 20:15:13.448476	2017-05-06 20:15:13.448476	5	58
14	2017-05-06 20:15:13.469965	2017-05-06 20:15:13.469965	5	59
15	2017-05-06 20:15:13.491771	2017-05-06 20:15:13.491771	6	2
16	2017-05-06 20:15:13.565755	2017-05-06 20:15:13.565755	6	60
17	2017-05-06 20:15:13.606779	2017-05-06 20:15:13.606779	6	61
18	2017-05-06 20:15:13.625115	2017-05-06 20:15:13.625115	6	62
19	2017-05-06 20:15:13.64732	2017-05-06 20:15:13.64732	7	6
20	2017-05-06 20:15:13.672819	2017-05-06 20:15:13.672819	7	63
21	2017-05-06 20:15:13.692527	2017-05-06 20:15:13.692527	7	64
22	2017-05-06 20:15:13.714146	2017-05-06 20:15:13.714146	8	2
23	2017-05-06 20:15:13.736318	2017-05-06 20:15:13.736318	8	65
24	2017-05-06 20:15:13.759194	2017-05-06 20:15:13.759194	9	6
25	2017-05-06 20:15:13.783158	2017-05-06 20:15:13.783158	9	66
26	2017-05-06 20:15:13.803107	2017-05-06 20:15:13.803107	9	67
27	2017-05-06 20:15:13.825458	2017-05-06 20:15:13.825458	10	2
28	2017-05-06 20:15:13.848349	2017-05-06 20:15:13.848349	10	68
29	2017-05-06 20:15:13.87044	2017-05-06 20:15:13.87044	10	69
30	2017-05-06 20:15:13.892472	2017-05-06 20:15:13.892472	10	70
31	2017-05-06 20:15:13.915804	2017-05-06 20:15:13.915804	11	71
32	2017-05-06 20:15:13.936368	2017-05-06 20:15:13.936368	11	72
33	2017-05-06 20:15:13.960359	2017-05-06 20:15:13.960359	11	8
34	2017-05-06 20:15:13.981355	2017-05-06 20:15:13.981355	12	57
35	2017-05-06 20:15:14.003363	2017-05-06 20:15:14.003363	12	65
36	2017-05-06 20:15:14.025182	2017-05-06 20:15:14.025182	12	6
37	2017-05-06 20:15:14.060209	2017-05-06 20:15:14.060209	13	96
38	2017-05-06 20:15:14.081153	2017-05-06 20:15:14.081153	13	99
39	2017-05-06 20:15:14.114166	2017-05-06 20:15:14.114166	13	8
40	2017-05-06 20:15:14.138511	2017-05-06 20:15:14.138511	14	80
41	2017-05-06 20:15:14.181796	2017-05-06 20:15:14.181796	14	100
42	2017-05-06 20:15:14.203275	2017-05-06 20:15:14.203275	14	12
43	2017-05-06 20:15:14.261368	2017-05-06 20:15:14.261368	15	89
44	2017-05-06 20:15:14.315216	2017-05-06 20:15:14.315216	15	90
45	2017-05-06 20:15:14.34771	2017-05-06 20:15:14.34771	15	92
46	2017-05-06 20:15:14.408122	2017-05-06 20:15:14.408122	15	8
47	2017-05-06 20:15:14.449159	2017-05-06 20:15:14.449159	16	65
48	2017-05-06 20:15:14.470068	2017-05-06 20:15:14.470068	16	67
49	2017-05-06 20:15:14.492392	2017-05-06 20:15:14.492392	16	77
50	2017-05-06 20:15:14.516717	2017-05-06 20:15:14.516717	16	6
51	2017-05-06 20:15:14.536457	2017-05-06 20:15:14.536457	17	96
52	2017-05-06 20:15:14.559768	2017-05-06 20:15:14.559768	17	97
53	2017-05-06 20:15:14.581348	2017-05-06 20:15:14.581348	17	2
54	2017-05-06 20:15:14.603171	2017-05-06 20:15:14.603171	18	75
55	2017-05-06 20:15:14.625989	2017-05-06 20:15:14.625989	18	76
56	2017-05-06 20:15:14.648151	2017-05-06 20:15:14.648151	18	77
57	2017-05-06 20:15:14.671283	2017-05-06 20:15:14.671283	18	14
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 57, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-05-06 20:14:57.74206	2017-05-06 20:14:57.74206	1
2	Corrientes	2017-05-06 20:14:57.770046	2017-05-06 20:14:57.770046	1
3	Itapúa	2017-05-06 20:14:57.791705	2017-05-06 20:14:57.791705	2
4	Bahia	2017-05-06 20:14:57.816081	2017-05-06 20:14:57.816081	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-05-06 20:15:11.438533	2017-05-06 20:15:11.438533	1	1	1	1	1
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-05-06 20:15:11.588767	2017-05-06 20:15:11.588767	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-05-06 20:15:11.699689	2017-05-06 20:15:11.699689	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-05-06 20:15:11.777337	2017-05-06 20:15:11.777337	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-05-06 20:15:11.865913	2017-05-06 20:15:11.865913	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-05-06 20:15:11.942724	2017-05-06 20:15:11.942724	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-05-06 20:15:12.035119	2017-05-06 20:15:12.035119	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-05-06 20:15:12.135445	2017-05-06 20:15:12.135445	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-05-06 20:15:12.22312	2017-05-06 20:15:12.22312	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-05-06 20:15:12.313405	2017-05-06 20:15:12.313405	1	1	1	1	1
11	PR-011	Percentil	Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para hacerlo en escala y poder ganar dinero con ello.	España	422			4590432	percentil@gmail.com	percentil.com	2017-05-06 20:15:12.421617	2017-05-06 20:15:12.421617	1	1	1	1	1
12	PR-012	EmbryoTools	 Son una referencia mundial en reproducción asistida. Trabajan en cuatro ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos, porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de los productos que vayan a entrar en contacto con embriones humanos y por último trabajan en la reproducción asistida en veterinaria.	Mariano Moreno	4122			465888	embryotools@gmail.com	embryotools.com	2017-05-06 20:15:12.514165	2017-05-06 20:15:12.514165	1	1	1	1	1
13	PR-013	Aplázame	 Es un método de pago que se integra en el proceso de compra del comercio electrónico y permite a los clientes de las tiendas online comprar con un crédito instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando para hacerlo en breve.	Av. San Martin	4532			453222	aplazame@gmail.com	aplazame.com	2017-05-06 20:15:12.599885	2017-05-06 20:15:12.599885	1	1	1	1	1
14	PR-014	BrioAgro Technologies	Deesarrollo de una tecnología para que el agricultor controle su explotación. El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor, a través de su dispositivo, se conecta a la nube para acceder a la información de su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier cambio en sus variables.	Colon 	555			4651244	bioagro@gmail.com	bioagro.com	2017-05-06 20:15:12.699819	2017-05-06 20:15:12.699819	1	1	1	1	1
15	PR-015	Braingaze	La tecnología desarrollada detecta un pequeño movimiento ocular que permite determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y dislexia.	Miami	708			490123	baringaze@gmail.com	braingaze.com	2017-05-06 20:15:12.791215	2017-05-06 20:15:12.791215	1	1	1	1	1
16	PR-016	CreatorStats	Mejoran la métrica de los ‘youtubers’.	Inglaterra	200			15432510	creatorstats@gmail.com	creatorstats.com	2017-05-06 20:15:12.879761	2017-05-06 20:15:12.879761	1	1	1	1	1
17	PR-017	Alzhup	Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología como vehículo para que la solución sea accesible a todo el mundo. Implementan a nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados científicamente. Y también, herramientas para la memoria, capaces de personalizar dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro almacena los recuerdos y que difiere de los sistemas actuales computarizados.	Constitucion	2222			467632	alzhup@gmail.com	alzhup.com	2017-05-06 20:15:12.977475	2017-05-06 20:15:12.977475	1	1	1	1	1
18	PR-018	Axter Aerospace	Están desarrollando un sistema de propulsión híbrida para las avionetas, que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU. De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción y ensamblado.	Ayacucho	9200			432111	axteraerospace@gmail.com	axteraerospace.com	2017-05-06 20:15:13.056374	2017-05-06 20:15:13.056374	1	1	1	1	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 18, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-05-06 20:15:19.745439	2017-05-06 20:15:19.745439
2	super_admin	2017-05-06 20:15:19.77378	2017-05-06 20:15:19.77378
3	Encargado de Proyectos (mentor)	2017-05-06 20:15:19.794562	2017-05-06 20:15:19.794562
4	Miembro de Equipo	2017-05-06 20:15:19.817528	2017-05-06 20:15:19.817528
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-05-06 20:14:58.774989	2017-05-06 20:14:58.774989	1
2	Encargado de recaudaciones e ingresos	2017-05-06 20:14:58.848616	2017-05-06 20:14:58.848616	1
3	Jefe de Recursos Humanos	2017-05-06 20:14:58.906056	2017-05-06 20:14:58.906056	2
4	Jefe de mercadeo	2017-05-06 20:14:58.964168	2017-05-06 20:14:58.964168	3
5	jefe de producción	2017-05-06 20:14:59.038397	2017-05-06 20:14:59.038397	3
6	Investigación y desarrollo	2017-05-06 20:14:59.106398	2017-05-06 20:14:59.106398	4
7	Capacitación - Mentoring	2017-05-06 20:14:59.172083	2017-05-06 20:14:59.172083	4
8	Director General	2017-05-06 20:14:59.2531	2017-05-06 20:14:59.2531	5
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
20170227122859
20170227122903
20170227122909
20170506084603
20170506084618
20170506085544
20170506085547
20170506085551
20170506085558
\.


--
-- Data for Name: systemsettings; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY systemsettings (id, numero_abandono, tiempo_abandono, tipo_de_pago_id, created_at, updated_at) FROM stdin;
1	5	minutes	4	2017-05-06 20:15:29.124404	2017-05-06 20:15:29.124404
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, true);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-05-06 20:14:58.206002	2017-05-06 20:14:58.206002
2	Libreta de Enrolamiento	2017-05-06 20:14:58.227132	2017-05-06 20:14:58.227132
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-05-06 20:15:28.855212	2017-05-06 20:15:28.855212
2	Tarjeta de crédito Visa	2017-05-06 20:15:28.916809	2017-05-06 20:15:28.916809
3	Tarjeta Naranja	2017-05-06 20:15:28.981645	2017-05-06 20:15:28.981645
4	Saldo de cuenta	2017-05-06 20:15:29.037694	2017-05-06 20:15:29.037694
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	0	\N	\N	\N	\N	2017-05-06 20:15:20.711794	2017-05-06 20:15:20.711794	1	2
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-05-06 20:15:20.984814	2017-05-06 20:15:20.984814	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-05-06 20:15:21.28068	2017-05-06 20:15:21.28068	2	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-05-06 20:15:30.380119	2017-05-06 20:15:30.380119	1	1
2	2017-01-20	2017-05-06 20:15:30.420142	2017-05-06 20:15:30.420142	1	1
3	2017-02-10	2017-05-06 20:15:30.443047	2017-05-06 20:15:30.443047	2	1
4	2017-02-20	2017-05-06 20:15:30.465032	2017-05-06 20:15:30.465032	2	1
5	2017-03-10	2017-05-06 20:15:30.4868	2017-05-06 20:15:30.4868	3	1
6	2017-03-20	2017-05-06 20:15:30.510831	2017-05-06 20:15:30.510831	3	1
7	2017-04-10	2017-05-06 20:15:30.53237	2017-05-06 20:15:30.53237	4	1
8	2017-04-20	2017-05-06 20:15:30.553985	2017-05-06 20:15:30.553985	4	1
9	2017-05-10	2017-05-06 20:15:30.576255	2017-05-06 20:15:30.576255	5	1
10	2017-05-20	2017-05-06 20:15:30.598413	2017-05-06 20:15:30.598413	5	1
11	2017-06-10	2017-05-06 20:15:30.621633	2017-05-06 20:15:30.621633	6	1
12	2017-06-20	2017-05-06 20:15:30.643939	2017-05-06 20:15:30.643939	6	1
13	2017-07-10	2017-05-06 20:15:30.665144	2017-05-06 20:15:30.665144	7	1
14	2017-07-20	2017-05-06 20:15:30.688253	2017-05-06 20:15:30.688253	7	1
15	2017-08-10	2017-05-06 20:15:30.708894	2017-05-06 20:15:30.708894	8	1
16	2017-08-20	2017-05-06 20:15:30.732375	2017-05-06 20:15:30.732375	8	1
17	2017-09-10	2017-05-06 20:15:30.7539	2017-05-06 20:15:30.7539	9	1
18	2017-09-20	2017-05-06 20:15:30.776674	2017-05-06 20:15:30.776674	9	1
19	2017-10-10	2017-05-06 20:15:30.799044	2017-05-06 20:15:30.799044	10	1
20	2017-10-20	2017-05-06 20:15:30.820817	2017-05-06 20:15:30.820817	10	1
21	2017-11-10	2017-05-06 20:15:30.843317	2017-05-06 20:15:30.843317	11	1
22	2017-11-20	2017-05-06 20:15:30.866206	2017-05-06 20:15:30.866206	11	1
23	2017-12-10	2017-05-06 20:15:30.887731	2017-05-06 20:15:30.887731	12	1
24	2017-12-20	2017-05-06 20:15:30.911164	2017-05-06 20:15:30.911164	12	1
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
-- Name: eventos_especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY eventos_especialidades
    ADD CONSTRAINT eventos_especialidades_pkey PRIMARY KEY (id);


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
-- Name: personas_especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY personas_especialidades
    ADD CONSTRAINT personas_especialidades_pkey PRIMARY KEY (id);


--
-- Name: personas_eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: ana; Tablespace: 
--

ALTER TABLE ONLY personas_eventos
    ADD CONSTRAINT personas_eventos_pkey PRIMARY KEY (id);


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
-- Name: index_eventos_especialidades_on_especialidad_de_contacto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_eventos_especialidades_on_especialidad_de_contacto_id ON eventos_especialidades USING btree (especialidad_de_contacto_id);


--
-- Name: index_eventos_especialidades_on_evento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_eventos_especialidades_on_evento_id ON eventos_especialidades USING btree (evento_id);


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
-- Name: index_personas_especialidades_on_especialidad_de_contacto_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_especialidades_on_especialidad_de_contacto_id ON personas_especialidades USING btree (especialidad_de_contacto_id);


--
-- Name: index_personas_especialidades_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_especialidades_on_persona_id ON personas_especialidades USING btree (persona_id);


--
-- Name: index_personas_eventos_on_evento_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_eventos_on_evento_id ON personas_eventos USING btree (evento_id);


--
-- Name: index_personas_eventos_on_persona_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_personas_eventos_on_persona_id ON personas_eventos USING btree (persona_id);


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
-- Name: fk_rails_03f15cd2ad; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos_especialidades
    ADD CONSTRAINT fk_rails_03f15cd2ad FOREIGN KEY (evento_id) REFERENCES eventos(id);


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
-- Name: fk_rails_881ab3b658; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_eventos
    ADD CONSTRAINT fk_rails_881ab3b658 FOREIGN KEY (persona_id) REFERENCES personas(id);


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
-- Name: fk_rails_8e25f5a2e6; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos_especialidades
    ADD CONSTRAINT fk_rails_8e25f5a2e6 FOREIGN KEY (especialidad_de_contacto_id) REFERENCES especialidades_de_contacto(id);


--
-- Name: fk_rails_910b185b0a; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY proyectos
    ADD CONSTRAINT fk_rails_910b185b0a FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- Name: fk_rails_9e1484cb84; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_especialidades
    ADD CONSTRAINT fk_rails_9e1484cb84 FOREIGN KEY (especialidad_de_contacto_id) REFERENCES especialidades_de_contacto(id);


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
-- Name: fk_rails_e20a9fa041; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_especialidades
    ADD CONSTRAINT fk_rails_e20a9fa041 FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- Name: fk_rails_e23fbe9a11; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY eventos_proyectos
    ADD CONSTRAINT fk_rails_e23fbe9a11 FOREIGN KEY (evento_id) REFERENCES eventos(id);


--
-- Name: fk_rails_e478a5f7cf; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas_eventos
    ADD CONSTRAINT fk_rails_e478a5f7cf FOREIGN KEY (evento_id) REFERENCES eventos(id);


--
-- Name: fk_rails_e8465b472a; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT fk_rails_e8465b472a FOREIGN KEY (area_id) REFERENCES areas(id);


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

