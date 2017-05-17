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
    inicio date,
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
    cuenta_id integer,
    contrato_id integer
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
    tipo character varying,
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
1	Crear	create	2017-05-17 13:42:43.011885	2017-05-17 13:42:43.011885
2	Eliminar	destroy	2017-05-17 13:42:43.045096	2017-05-17 13:42:43.045096
3	Ver	show	2017-05-17 13:42:43.075958	2017-05-17 13:42:43.075958
4	Index	index	2017-05-17 13:42:43.098526	2017-05-17 13:42:43.098526
5	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-05-17 13:42:43.121937	2017-05-17 13:42:43.121937
6	Editar	update	2017-05-17 13:42:43.143951	2017-05-17 13:42:43.143951
7	Estadisticas	estadistica	2017-05-17 13:42:43.180275	2017-05-17 13:42:43.180275
8	Auditorias	auditorias	2017-05-17 13:42:43.213125	2017-05-17 13:42:43.213125
9	Ver PDF	pdf	2017-05-17 13:42:43.246327	2017-05-17 13:42:43.246327
10	Descargar hoja de cálculo	calculo	2017-05-17 13:42:43.277728	2017-05-17 13:42:43.277728
11	PDF del modelo	model_pdf	2017-05-17 13:42:43.302143	2017-05-17 13:42:43.302143
12	Hoja de cálculo del Modelo	model_calculo	2017-05-17 13:42:43.333922	2017-05-17 13:42:43.333922
13	Ver cuotas atrasadas	cuotas_atrasadas	2017-05-17 13:42:43.356158	2017-05-17 13:42:43.356158
14	Ver proyectos en posible estado de abandono	proyectos_abandonados	2017-05-17 13:42:43.387065	2017-05-17 13:42:43.387065
15	Ver Notificaciones	notificaciones	2017-05-17 13:42:43.412736	2017-05-17 13:42:43.412736
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 15, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	\N	2017-05-17 13:42:39.300484	2017-05-17 13:42:39.300484	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-05-17 13:42:39.379072	2017-05-17 13:42:39.379072	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-05-17 13:42:39.448725	2017-05-17 13:42:39.448725	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-05-17 13:42:39.506529	2017-05-17 13:42:39.506529	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-05-17 13:42:39.62201	2017-05-17 13:42:39.62201	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-05-17 13:42:39.689174	2017-05-17 13:42:39.689174	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-05-17 13:42:39.752571	2017-05-17 13:42:39.752571	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-05-17 13:42:39.807951	2017-05-17 13:42:39.807951	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-05-17 13:42:39.864191	2017-05-17 13:42:39.864191	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-05-17 13:42:39.925829	2017-05-17 13:42:39.925829	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-05-17 13:42:39.991335	2017-05-17 13:42:39.991335	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-05-17 13:42:51.307882	2017-05-17 13:42:51.307882	1	1	3
2	\N	2017-05-17 13:42:51.361888	2017-05-17 13:42:51.361888	1	2	3
3	\N	2017-05-17 13:42:51.406425	2017-05-17 13:42:51.406425	2	1	3
4	\N	2017-05-17 13:42:51.450911	2017-05-17 13:42:51.450911	2	2	3
5	\N	2017-05-17 13:42:51.497214	2017-05-17 13:42:51.497214	2	3	2
6	\N	2017-05-17 13:42:51.551363	2017-05-17 13:42:51.551363	3	1	3
7	\N	2017-05-17 13:42:51.606761	2017-05-17 13:42:51.606761	3	2	3
8	\N	2017-05-17 13:42:51.650933	2017-05-17 13:42:51.650933	3	3	2
9	\N	2017-05-17 13:42:51.695361	2017-05-17 13:42:51.695361	4	1	3
10	\N	2017-05-17 13:42:51.739821	2017-05-17 13:42:51.739821	4	2	3
11	\N	2017-05-17 13:42:51.785567	2017-05-17 13:42:51.785567	4	3	2
12	\N	2017-05-17 13:42:51.828981	2017-05-17 13:42:51.828981	5	1	3
13	\N	2017-05-17 13:42:51.87316	2017-05-17 13:42:51.87316	5	2	3
14	\N	2017-05-17 13:42:51.918187	2017-05-17 13:42:51.918187	5	3	2
15	\N	2017-05-17 13:42:51.962368	2017-05-17 13:42:51.962368	6	1	3
16	\N	2017-05-17 13:42:52.008552	2017-05-17 13:42:52.008552	6	2	3
17	\N	2017-05-17 13:42:52.062388	2017-05-17 13:42:52.062388	6	3	2
18	\N	2017-05-17 13:42:52.107046	2017-05-17 13:42:52.107046	7	1	3
19	\N	2017-05-17 13:42:52.151507	2017-05-17 13:42:52.151507	7	2	3
20	\N	2017-05-17 13:42:52.207008	2017-05-17 13:42:52.207008	7	3	2
21	\N	2017-05-17 13:42:52.251435	2017-05-17 13:42:52.251435	8	1	3
22	\N	2017-05-17 13:42:52.308558	2017-05-17 13:42:52.308558	8	2	3
23	\N	2017-05-17 13:42:52.362838	2017-05-17 13:42:52.362838	8	3	2
24	\N	2017-05-17 13:42:52.418344	2017-05-17 13:42:52.418344	9	1	3
25	\N	2017-05-17 13:42:52.462551	2017-05-17 13:42:52.462551	9	2	3
26	\N	2017-05-17 13:42:52.518211	2017-05-17 13:42:52.518211	9	3	2
27	\N	2017-05-17 13:42:52.562684	2017-05-17 13:42:52.562684	10	1	3
28	\N	2017-05-17 13:42:52.607611	2017-05-17 13:42:52.607611	10	2	3
29	\N	2017-05-17 13:42:52.663063	2017-05-17 13:42:52.663063	10	3	2
30	\N	2017-05-17 13:42:52.717889	2017-05-17 13:42:52.717889	11	1	3
31	\N	2017-05-17 13:42:52.764447	2017-05-17 13:42:52.764447	11	2	3
32	\N	2017-05-17 13:42:52.818502	2017-05-17 13:42:52.818502	11	3	2
33	\N	2017-05-17 13:42:52.86286	2017-05-17 13:42:52.86286	12	1	3
34	\N	2017-05-17 13:42:52.918969	2017-05-17 13:42:52.918969	12	2	3
35	\N	2017-05-17 13:42:52.975608	2017-05-17 13:42:52.975608	12	3	2
36	\N	2017-05-17 13:42:53.031069	2017-05-17 13:42:53.031069	13	1	3
37	\N	2017-05-17 13:42:53.085242	2017-05-17 13:42:53.085242	13	2	3
38	\N	2017-05-17 13:42:53.141688	2017-05-17 13:42:53.141688	13	3	2
39	\N	2017-05-17 13:42:53.196101	2017-05-17 13:42:53.196101	14	1	3
40	\N	2017-05-17 13:42:53.240334	2017-05-17 13:42:53.240334	14	2	3
41	\N	2017-05-17 13:42:53.285312	2017-05-17 13:42:53.285312	14	3	2
42	\N	2017-05-17 13:42:53.331389	2017-05-17 13:42:53.331389	15	1	3
43	\N	2017-05-17 13:42:53.3865	2017-05-17 13:42:53.3865	15	2	3
44	\N	2017-05-17 13:42:53.43113	2017-05-17 13:42:53.43113	15	3	2
45	\N	2017-05-17 13:42:53.486853	2017-05-17 13:42:53.486853	16	1	3
46	\N	2017-05-17 13:42:53.542316	2017-05-17 13:42:53.542316	16	2	3
47	\N	2017-05-17 13:42:53.586888	2017-05-17 13:42:53.586888	16	3	2
48	\N	2017-05-17 13:42:53.640664	2017-05-17 13:42:53.640664	17	1	3
49	\N	2017-05-17 13:42:53.685295	2017-05-17 13:42:53.685295	17	2	3
50	\N	2017-05-17 13:42:53.730107	2017-05-17 13:42:53.730107	17	3	2
51	\N	2017-05-17 13:42:53.807472	2017-05-17 13:42:53.807472	18	1	3
52	\N	2017-05-17 13:42:53.863236	2017-05-17 13:42:53.863236	18	2	3
53	\N	2017-05-17 13:42:53.907859	2017-05-17 13:42:53.907859	18	3	2
54	\N	2017-05-17 13:42:53.963125	2017-05-17 13:42:53.963125	1	3	3
55	2017-04-02	2017-05-17 13:42:54.007489	2017-05-17 13:42:54.007489	1	4	3
56	2017-04-08	2017-05-17 13:42:54.065128	2017-05-17 13:42:54.065128	1	5	3
57	2017-04-18	2017-05-17 13:42:54.119067	2017-05-17 13:42:54.119067	1	6	3
58	2017-04-26	2017-05-17 13:42:54.174622	2017-05-17 13:42:54.174622	1	7	3
59	2017-05-27	2017-05-17 13:42:54.219789	2017-05-17 14:21:49.260989	1	8	3
60	\N	2017-05-17 14:21:49.591634	2017-05-17 14:21:49.591634	1	9	\N
61	\N	2017-05-17 14:21:49.643216	2017-05-17 14:21:49.643216	1	10	\N
62	\N	2017-05-17 14:21:49.695783	2017-05-17 14:21:49.695783	1	11	\N
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 62, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-05-17 13:42:29.165392	2017-05-17 13:42:29.165392
2	Rural	2017-05-17 13:42:29.19287	2017-05-17 13:42:29.19287
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
389	59	ActividadProyecto	\N	\N	1	User	\N	update	---\nestado_id:\n- 2\n- 3\n	2	\N	127.0.0.1	030b9ecd-66c6-4ea0-a009-334862f00613	2017-05-17 14:21:49.340257
390	1	Proyecto	\N	\N	1	User	\N	update	---\netapa_id:\n- 2\n- 3\n	2	\N	127.0.0.1	030b9ecd-66c6-4ea0-a009-334862f00613	2017-05-17 14:21:49.545314
391	60	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 9\nestado_id: \n	1	\N	127.0.0.1	030b9ecd-66c6-4ea0-a009-334862f00613	2017-05-17 14:21:49.615223
392	61	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 10\nestado_id: \n	1	\N	127.0.0.1	030b9ecd-66c6-4ea0-a009-334862f00613	2017-05-17 14:21:49.663736
393	62	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 11\nestado_id: \n	1	\N	127.0.0.1	030b9ecd-66c6-4ea0-a009-334862f00613	2017-05-17 14:21:49.718623
394	1	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 576.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	34f20101-7556-4275-80b2-59e56aa92dda	2017-05-17 14:25:14.570829
395	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 1\n	2	\N	127.0.0.1	34f20101-7556-4275-80b2-59e56aa92dda	2017-05-17 14:25:14.633135
396	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 1\n	2	\N	127.0.0.1	34f20101-7556-4275-80b2-59e56aa92dda	2017-05-17 14:25:14.680046
397	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	34f20101-7556-4275-80b2-59e56aa92dda	2017-05-17 14:25:14.73081
398	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	34f20101-7556-4275-80b2-59e56aa92dda	2017-05-17 14:25:14.782304
399	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 224.0\n	2	\N	127.0.0.1	34f20101-7556-4275-80b2-59e56aa92dda	2017-05-17 14:25:14.83402
400	26	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 5\nevento_id: 3\n	1	\N	127.0.0.1	89d22b72-2cc0-43ff-8fcb-5d09199d8ef6	2017-05-17 14:28:47.400544
401	27	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 6\nevento_id: 3\n	1	\N	127.0.0.1	89d22b72-2cc0-43ff-8fcb-5d09199d8ef6	2017-05-17 14:28:47.463119
402	28	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 7\nevento_id: 3\n	1	\N	127.0.0.1	89d22b72-2cc0-43ff-8fcb-5d09199d8ef6	2017-05-17 14:28:47.519777
403	3	Evento	\N	\N	1	User	\N	create	---\ncodigo: ev-12\nnombre: diseños\ndescripcion: "-"\ndia: 2017-05-18\nhora: 2017-05-17 14:30:00.000000000 -03:00\n	1	\N	127.0.0.1	89d22b72-2cc0-43ff-8fcb-5d09199d8ef6	2017-05-17 14:28:47.621402
366	3	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 7\nevento_id: 1\n	1	\N	\N	403c408a-f023-4559-b66e-9218de291657	2017-05-17 13:43:13.265938
367	4	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 8\nevento_id: 1\n	1	\N	\N	8122a3fb-bf17-4131-9ef6-33cdbc6af0c9	2017-05-17 13:43:13.316497
114	1	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Pre incubacion\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	aad8c31b-8423-477a-a5e7-f1bce2bd57af	2017-05-17 13:42:39.032121
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	a6178662-e15d-4e26-8c0c-c823732cce4b	2017-05-17 13:42:29.417334
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	8877ab21-9f11-4926-90b9-afeeb67540d4	2017-05-17 13:42:29.498552
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	6ebb5d82-0c8a-41ff-bf72-ffe449fec40c	2017-05-17 13:42:29.556523
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	e220861e-ce1d-4bcd-873b-0b1faf0a21f0	2017-05-17 13:42:29.606388
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	4fc96b6f-51dd-4c57-b144-e535fb1b6b51	2017-05-17 13:42:29.652147
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	6cae6983-965e-4318-a5f3-90dbc4959ce0	2017-05-17 13:42:29.746888
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	c83c8e4d-4eb9-4fcd-9822-2618bff5956c	2017-05-17 13:42:29.800599
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	c095888a-6610-4d8c-a623-c86aac580924	2017-05-17 13:42:29.853427
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	41169cae-1a0d-4f5b-904c-ad8b012a495c	2017-05-17 13:42:29.908127
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	c77eaa10-21ba-4d38-9d95-2905057342cd	2017-05-17 13:42:29.954561
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	e9410ada-a065-45cc-b9a4-c8dfdb2d395d	2017-05-17 13:42:30.009378
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	181c1cea-1c38-4c09-9cf0-9856743151d5	2017-05-17 13:42:30.063171
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	77a60535-b445-402d-8fe6-249c2d6b72e0	2017-05-17 13:42:30.123339
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	fdc1d948-6cfd-4c53-a954-12c88f437612	2017-05-17 13:42:30.412595
115	2	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Incubación\ndescripcion: "-"\netapaAnterior: 1\n	1	\N	\N	043f8319-b761-415d-b96d-3ee21e054a6a	2017-05-17 13:42:39.09633
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2da5fd69-d874-4987-b80e-511a9f41ec41	2017-05-17 13:42:30.500846
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	1fb84749-7608-4dd7-be4b-e51a9d58bc8c	2017-05-17 13:42:30.593129
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	66c9a08a-20bd-498d-8980-6f6292957ee5	2017-05-17 13:42:30.677394
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	a71e29bd-0b21-4f44-8f88-a54c5f36fe8f	2017-05-17 13:42:30.757136
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	7b7bfaa0-7d2e-4a5b-8cb9-d688fa29fbfb	2017-05-17 13:42:30.847577
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-007\nnombre: Maria\napellido: Gonzalez\nnroIdentificacion: '36134076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mg@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	7c7b04bb-8883-4b6f-bed6-16fd659b4219	2017-05-17 13:42:30.936146
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-008\nnombre: Elena\napellido: Ceballos\nnroIdentificacion: '25198461'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: ec@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	62026be2-0b13-406f-bf0f-000d9af09775	2017-05-17 13:42:31.023099
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-009\nnombre: Alberto\napellido: Padilla\nnroIdentificacion: '33843657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: ap@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	53ebe1f7-0e6c-4f84-8945-9d86216fed10	2017-05-17 13:42:31.108607
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-010\nnombre: Fernando\napellido: Gonzalez\nnroIdentificacion: '33980912'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: fg@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	28b91663-ebe4-4207-98e2-35b4a19a9ab5	2017-05-17 13:42:31.184025
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-011\nnombre: Tiago\napellido: Gonzalez\nnroIdentificacion: '38187222'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: tiagogonzales@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	cac0dfd2-c479-4ce1-85a6-2b7fdf3e0556	2017-05-17 13:42:31.266057
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-012\nnombre: Cintia\napellido: Castro\nnroIdentificacion: '22612413'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cintiacastro@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	96be9e1a-04fc-4bd0-8ca1-54f85d8210b0	2017-05-17 13:42:31.342557
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-013\nnombre: Josefina\napellido: Jardin\nnroIdentificacion: '36025176'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: josefinajardin@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	7022219f-1d0d-44dd-aaa6-adaf545a26ea	2017-05-17 13:42:31.426957
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-014\nnombre: Diana\napellido: Rivas\nnroIdentificacion: '25948001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: dianarivas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	469b859f-3060-4b4a-a521-fd79edf20ab6	2017-05-17 13:42:31.513014
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-015\nnombre: Dario\napellido: Gonzalez\nnroIdentificacion: '33880019'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: dariogonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	52da097a-0b44-4ae5-9a9b-a6ae688efffa	2017-05-17 13:42:31.603107
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-016\nnombre: Ciro\napellido: Zamora\nnroIdentificacion: '33983707'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: cirozamora@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	fd7d54c2-d511-4a78-b252-93aaab4edf09	2017-05-17 13:42:31.691376
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-017\nnombre: Zoe\napellido: Vazquez\nnroIdentificacion: '3818104'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoevazquez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	7c17a8e6-7a88-44fa-9006-f23c6c27bffb	2017-05-17 13:42:31.78144
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-018\nnombre: Cristian\napellido: Gonzalez\nnroIdentificacion: '22659193'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cristiangonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	ce6b50a0-999c-47d6-8da0-a41fc15b499f	2017-05-17 13:42:31.863489
116	3	Etapa	\N	\N	1	\N	\N	create	---\nnombre: post incubacion\ndescripcion: "-"\netapaAnterior: 2\n	1	\N	\N	011d6f76-f8b1-4780-9278-e9b5eea2283d	2017-05-17 13:42:39.149667
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-019\nnombre: Ana\napellido: Manfrin\nnroIdentificacion: '36222076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: anamanfrin@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	58ce7be1-836c-488a-a84f-3b05552c5460	2017-05-17 13:42:31.942565
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-020\nnombre: Martina\napellido: Adamo\nnroIdentificacion: '25841001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaadamo@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	1f23cf50-020e-4664-92f3-82a9ffd2da46	2017-05-17 13:42:32.02011
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-021\nnombre: Roberto\napellido: Milani\nnroIdentificacion: '33880333'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: robertomilani@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	50b665be-ba4a-48de-a23e-0aa4d0d5ad69	2017-05-17 13:42:32.102818
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-022\nnombre: Victor\napellido: Gonzalez\nnroIdentificacion: '33984447'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorgonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	e3d540e7-1389-4de3-b7a5-d23fd0ca580e	2017-05-17 13:42:32.187089
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-023\nnombre: Alejandro\napellido: Cambril\nnroIdentificacion: '38113409'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: alejandrocambril@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	6406275f-969f-43b8-a8b7-ba1bf3cb2c44	2017-05-17 13:42:32.268422
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-024\nnombre: Luis\napellido: Rizzo\nnroIdentificacion: '22543493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luisrizzo@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	c82d9c4d-ecd2-4aae-aa75-f10d0925fe7c	2017-05-17 13:42:32.355129
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-025\nnombre: Mario\napellido: Rosas\nnroIdentificacion: '36060986'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mariorosas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	b8069dad-7ebd-4e2c-9159-fb30b1dd993d	2017-05-17 13:42:32.431957
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-026\nnombre: Analia\napellido: Granados\nnroIdentificacion: '25131701'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: analiagranados@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	eaebbe9c-f3a4-4ec4-9f80-a1c666ad13ea	2017-05-17 13:42:32.534618
40	27	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-027\nnombre: Leonor\napellido: Gonzalez\nnroIdentificacion: '33888717'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: leonorgonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	914aaa75-3e39-423f-af26-8182b4a5214e	2017-05-17 13:42:32.619855
41	28	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-028\nnombre: Victor\napellido: Baresi\nnroIdentificacion: '33928407'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorbaresi@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	03f55b0c-bea5-411d-bbc5-763ba4d686b9	2017-05-17 13:42:32.699886
42	29	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-029\nnombre: Silvana\napellido: Lazzaga\nnroIdentificacion: '38918849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: silvanalazzaga@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	24f0fadd-012d-4de8-9896-9b9a3adeb284	2017-05-17 13:42:32.774983
43	30	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-030\nnombre: Juana\napellido: Calabrese\nnroIdentificacion: '220192493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: janacalabrese@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	8e99672a-8022-4824-b237-643e83cd6b49	2017-05-17 13:42:32.864548
184	35	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e772b627-552d-496e-9ac1-1197e2eba840	2017-05-17 13:42:52.994306
44	31	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-031\nnombre: Juliana\napellido: Lombardi\nnroIdentificacion: '38613849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: julianalombardi@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	ea51e098-855d-4be1-a484-6d84ff2e8a7a	2017-05-17 13:42:32.946325
45	32	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-032\nnombre: Enrique\napellido: Cano\nnroIdentificacion: '22451493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: enriquecano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	b78a9c90-538e-4487-b172-1bd6eb886451	2017-05-17 13:42:33.035648
46	33	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-033\nnombre: Gilda\napellido: Lombarde\nnroIdentificacion: '36064356'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: gildalombarde@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	fb99077f-aca7-4115-91f7-8f28271cdab2	2017-05-17 13:42:33.122903
47	34	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-034\nnombre: Martin\napellido: Bande\nnroIdentificacion: '25124501'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinbande@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	16237c59-504d-49af-8869-38dacd1fe181	2017-05-17 13:42:33.199311
48	35	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-035\nnombre: Gabriel\napellido: Ferruccio\nnroIdentificacion: '33451657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: gabrielferuccio@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	8515ca40-4359-4c84-9700-fdc68c543f52	2017-05-17 13:42:33.276633
49	36	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-036\nnombre: Juan\napellido: Mazzanti\nnroIdentificacion: '33956107'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: juanmazzanti@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	98a0924f-27a5-40d5-ad70-5d413187b2c2	2017-05-17 13:42:33.354649
50	37	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-037\nnombre: Karina\napellido: Fiorentino\nnroIdentificacion: '38663849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: karinafiorentino@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	c4d6707a-b9e7-4cef-9878-ed1e8e8f5658	2017-05-17 13:42:33.435517
51	38	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-038\nnombre: Osvaldo\napellido: Pagnotto\nnroIdentificacion: '22019493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: osvaldopagnotto@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	a3fc27e7-b7eb-419b-8a90-9768d5adedc8	2017-05-17 13:42:33.525163
52	39	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-039\nnombre: Margarita\napellido: Giordano\nnroIdentificacion: '36068886'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: margaritagiordano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	0ec47b7f-9c24-4ba6-a86a-6e437eed2281	2017-05-17 13:42:33.611274
53	40	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-040\nnombre: Rosa\napellido: Napolitano\nnroIdentificacion: '2576401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: rosanapolitano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	3ac1c5d4-5d60-44e9-afbe-313db934d5e2	2017-05-17 13:42:33.693295
54	41	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-041\nnombre: Magdalena\napellido: Bruno\nnroIdentificacion: '38817849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: mardalenabruno@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	4f10589c-1d54-4a20-9af9-d6492cd1cd03	2017-05-17 13:42:33.780913
55	42	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-042\nnombre: Mauricio\napellido: Costa\nnroIdentificacion: '22755493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: mauriciocosta@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2cd0f00d-ad15-4c0d-ac31-9f07c2542dfd	2017-05-17 13:42:33.865331
56	43	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-043\nnombre: Ivan\napellido: Costas\nnroIdentificacion: '36755076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: ivancostas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	fad31a7a-bb7d-4b80-8280-85252b1a666d	2017-05-17 13:42:33.944751
57	44	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-044\nnombre: Pablo\napellido: Davide\nnroIdentificacion: '251934401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: pablodavide@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	df9eb8a4-c24d-420c-bd6d-495a26635042	2017-05-17 13:42:34.044394
58	45	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-045\nnombre: Nicolas\napellido: Medina\nnroIdentificacion: '33801927'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: nicolasmedina@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	ebb64292-2519-4d9e-b762-b74943c31d89	2017-05-17 13:42:34.121441
59	46	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-046\nnombre: Celeste\napellido: Milano\nnroIdentificacion: '35122307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: celestemilano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	c3c30a86-7162-42e8-929c-014676d048df	2017-05-17 13:42:34.200003
60	47	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-047\nnombre: Sebastian\napellido: Schiavone\nnroIdentificacion: '38175649'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: sebastianschiavone@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	3004aef2-547d-4e21-abad-c6bc3b769e24	2017-05-17 13:42:34.277536
185	36	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	fc01dabb-494e-4475-b808-7a66751ddd64	2017-05-17 13:42:53.053345
61	48	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-048\nnombre: Ruben\napellido: Almedina\nnroIdentificacion: '22891493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: rubenalmedina@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2ab473e4-9c95-4100-86ee-6af0c9253e46	2017-05-17 13:42:34.356836
62	49	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-049\nnombre: Cristian\napellido: Camiño\nnroIdentificacion: '36093716'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: cristiancamiño@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	44e1b7cb-fa5d-4dcc-8822-503e2faefaaf	2017-05-17 13:42:34.444553
63	50	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-050\nnombre: Monica\napellido: Conti\nnroIdentificacion: '25888001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: monicaconti@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	12ac4967-d069-4b7e-bc30-0094103a7a34	2017-05-17 13:42:34.523988
64	51	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	bf54e422-f08c-4477-a539-00ee4c9a26e2	2017-05-17 13:42:34.669497
117	4	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Cuarta etapa\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	539ef45e-dc9c-4095-8677-042ae7597ee7	2017-05-17 13:42:39.207629
154	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	6936c7b9-29f9-49a3-84b1-26bb8cb8120b	2017-05-17 13:42:51.516585
65	52	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3e90582a-2047-49ed-9e4d-aa62b8555dd5	2017-05-17 13:42:34.79919
66	53	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e93becd6-85ca-4ff9-ace0-54103da2afbd	2017-05-17 13:42:34.887401
67	54	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	380dfbeb-a651-4960-8f04-c781e87fa960	2017-05-17 13:42:34.967134
68	55	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d2f112f1-05da-418a-a3bb-5652dff1df09	2017-05-17 13:42:35.044088
69	56	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	676bad56-aae9-46e3-b45f-5e5b4574d4f9	2017-05-17 13:42:35.123364
70	57	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2b5355b8-4423-4791-b445-0c7dd9cab590	2017-05-17 13:42:35.210444
71	58	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b3432de9-c142-4d75-9785-19c55a7deb30	2017-05-17 13:42:35.295246
72	59	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	40dc53de-a94e-4180-ae84-eea72179e4c1	2017-05-17 13:42:35.380328
73	60	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3d6c2b04-4a9c-46b5-a213-66f69160d7c7	2017-05-17 13:42:35.463525
74	61	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	29ba3db1-0653-4018-92c1-d35e00435ced	2017-05-17 13:42:35.544491
75	62	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d02299c5-4d09-4772-938d-d8e5ca3542b2	2017-05-17 13:42:35.620609
76	63	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	800d60f7-d7dc-4d36-855a-bbb57c495bb8	2017-05-17 13:42:35.699593
77	64	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	67e553d4-12fe-4c73-8080-6858f02eb479	2017-05-17 13:42:35.780915
186	37	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	3dc48a32-00b4-4a3d-a138-68781ac05e69	2017-05-17 13:42:53.106708
78	65	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8793b0ca-6c25-454e-a020-82ed7a2d700b	2017-05-17 13:42:35.867709
79	66	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c7ef54b2-8eaf-4cbd-8939-6fd167588818	2017-05-17 13:42:35.945082
80	67	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4680e3e1-b757-4771-b65f-636e5dd40e3f	2017-05-17 13:42:36.022557
118	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: \netapa_id: 1\n	1	\N	\N	880079f2-2a78-4e66-aa1d-0b9430ef7cc0	2017-05-17 13:42:39.327991
81	68	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1b367d8f-1a06-46b7-813f-bff156cfcd66	2017-05-17 13:42:36.103781
82	69	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	38d8b810-e7f6-4b59-a091-2d9f591772f8	2017-05-17 13:42:36.190034
83	70	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	389b4ee9-0896-4e06-9525-d479b07311e9	2017-05-17 13:42:36.26736
84	71	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-021\nnombre: Lidia\napellido: Delucci\nnroIdentificacion: '28088944'\nfechaNacimiento: 1981-01-29\ncalle: Chile\nnroDomicilio: '6144'\npiso: ''\ndpto: ''\ntelefono: '481898'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	df044e53-d4c2-44bd-a0ac-274e30408b5f	2017-05-17 13:42:36.351575
85	72	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-022\nnombre: Leonor\napellido: Gomez Santos\nnroIdentificacion: '40560231'\nfechaNacimiento: 1996-03-13\ncalle: Plaza Mayor\nnroDomicilio: '2637'\npiso: ''\ndpto: ''\ntelefono: '4536662'\nemail: leonorgs@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	91405060-279a-475f-91ad-2cd4b4d4e791	2017-05-17 13:42:36.451105
86	73	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-023\nnombre: Lara\napellido: Gonçalves\nnroIdentificacion: '29075344'\nfechaNacimiento: 1980-07-19\ncalle: España\nnroDomicilio: '1415'\npiso: ''\ndpto: ''\ntelefono: '4498457'\nemail: laragoncalves@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6ef45f4c-8c9b-455f-a155-c6aa301cc8f5	2017-05-17 13:42:36.53878
87	74	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-024\nnombre: Martin\napellido: Diaz\nnroIdentificacion: '26070390'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: martindiaz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c5f309e9-b48f-4e44-be5e-821ac0bc0d85	2017-05-17 13:42:36.624837
88	75	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-025\nnombre: Marina\napellido: Diaz\nnroIdentificacion: '26070394'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: marinadiaz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	76751a1b-25c1-4950-b492-5f11df635747	2017-05-17 13:42:36.71079
89	76	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-026\nnombre: Gerardo\napellido: Urbina\nnroIdentificacion: '29234987'\nfechaNacimiento: 1980-05-31\ncalle: "Álamo"\nnroDomicilio: '6162'\npiso: ''\ndpto: ''\ntelefono: '455433'\nemail: gerardou@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7263ecd9-967d-4f32-b5b0-2f4449a22007	2017-05-17 13:42:36.79076
90	77	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-027\nnombre: Silvio\napellido: Quiroz\nnroIdentificacion: '35465922'\nfechaNacimiento: 1990-02-27\ncalle: "Álamo"\nnroDomicilio: '2128'\npiso: ''\ndpto: ''\ntelefono: '415176'\nemail: silvioquiroz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	03f6ac21-9d31-49fe-bb44-a50367b855bf	2017-05-17 13:42:36.876304
91	78	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-028\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '33457976'\nfechaNacimiento: 1987-12-19\ncalle: Alem\nnroDomicilio: '123'\npiso: ''\ndpto: ''\ntelefono: '451912'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8de61e13-3b5b-4406-b6ef-0589b31865c7	2017-05-17 13:42:36.960164
92	79	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-029\nnombre: Leonardo\napellido: Rios\nnroIdentificacion: '29524865'\nfechaNacimiento: 1981-11-30\ncalle: Concepcion\nnroDomicilio: '5139'\npiso: ''\ndpto: ''\ntelefono: '4590871'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d97e4f16-c851-427e-8caa-5d4996a9ebcf	2017-05-17 13:42:37.049467
93	80	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-030\nnombre: Ubaldo\napellido: Gomez\nnroIdentificacion: '34123456'\nfechaNacimiento: 1990-04-08\ncalle: Entre Rios\nnroDomicilio: '1235'\npiso: ''\ndpto: ''\ntelefono: '456798'\nemail: ubaldogomez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ff3ddb34-2763-44f6-9f27-03926f885147	2017-05-17 13:42:37.178564
94	81	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-031\nnombre: Silvio\napellido: Gonzalez\nnroIdentificacion: '29092236'\nfechaNacimiento: 1980-05-16\ncalle: Cordoba\nnroDomicilio: '7213'\npiso: ''\ndpto: ''\ntelefono: '4501923'\nemail: silviogonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f7c1b544-a752-44ee-b512-76a652cd901d	2017-05-17 13:42:37.269208
187	38	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	88d7b660-4297-447b-b3d4-d14a0c73e588	2017-05-17 13:42:53.161012
95	82	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-032\nnombre: Rosa\napellido: Fernandez\nnroIdentificacion: '20112254'\nfechaNacimiento: 1968-09-13\ncalle: San Martin\nnroDomicilio: '1028'\npiso: ''\ndpto: ''\ntelefono: '4567895'\nemail: rosafernandez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	25177954-878f-48d5-968f-37733a0c116f	2017-05-17 13:42:37.359202
96	83	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-033\nnombre: Alejandro\napellido: Fernandez\nnroIdentificacion: '20998871'\nfechaNacimiento: 1987-05-16\ncalle: Santa Fe\nnroDomicilio: '4812'\npiso: ''\ndpto: ''\ntelefono: '4311235'\nemail: alefernandez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2eae47c4-51e4-4c16-879b-5f860e07d9e3	2017-05-17 13:42:37.449268
119	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	1f40fc7e-d15b-4924-bfbe-87dacae3395c	2017-05-17 13:42:39.405288
97	84	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-034\nnombre: Hugo\napellido: Rios\nnroIdentificacion: '40034940'\nfechaNacimiento: 1998-11-30\ncalle: Alvear\nnroDomicilio: '5028'\npiso: ''\ndpto: ''\ntelefono: '481341'\nemail: hugorios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3537d0ca-73ff-4e46-b2b3-f32e41f66e9b	2017-05-17 13:42:37.53523
98	85	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-035\nnombre: Mario\napellido: Garcia\nnroIdentificacion: '24654447'\nfechaNacimiento: 1976-04-08\ncalle: Roca\nnroDomicilio: '193'\npiso: ''\ndpto: ''\ntelefono: '4212351'\nemail: mariogarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0fea89e1-290e-4e30-9a84-5857a6a498cc	2017-05-17 13:42:37.623135
99	86	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-036\nnombre: Marina\napellido: Moralez\nnroIdentificacion: '36421952'\nfechaNacimiento: 1992-08-19\ncalle: Ucrania\nnroDomicilio: '9371'\npiso: ''\ndpto: ''\ntelefono: '451241'\nemail: marimamoralez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f913259b-e614-4a09-bf56-5148114d4fe7	2017-05-17 13:42:37.703411
100	87	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-037\nnombre: Silvina\napellido: Portillo\nnroIdentificacion: '26498388'\nfechaNacimiento: 1976-06-05\ncalle: Av Queirel\nnroDomicilio: '7621'\npiso: ''\ndpto: ''\ntelefono: '431214'\nemail: silvinaportillo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	00de5972-8eec-4f07-b94a-e72fb5c4a842	2017-05-17 13:42:37.792821
101	88	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-038\nnombre: Maria\napellido: Maciel\nnroIdentificacion: '33428434'\nfechaNacimiento: 1989-09-04\ncalle: Paraguay\nnroDomicilio: '600'\npiso: ''\ndpto: ''\ntelefono: '4761602'\nemail: mariamaciel@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3e99486f-4864-4874-a28d-3d11de8c02f8	2017-05-17 13:42:37.911215
102	89	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-039\nnombre: Angeles\napellido: Granados\nnroIdentificacion: '31452518'\nfechaNacimiento: 1981-04-09\ncalle: Uruguay\nnroDomicilio: '12'\npiso: ''\ndpto: ''\ntelefono: '481858'\nemail: angelesgranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	22506186-eb32-4c41-86a9-87496a5e7328	2017-05-17 13:42:38.004643
103	90	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-040\nnombre: Cintia\napellido: Gutierrez\nnroIdentificacion: '29701192'\nfechaNacimiento: 1992-11-05\ncalle: Av Roca\nnroDomicilio: '464'\npiso: ''\ndpto: ''\ntelefono: '483498'\nemail: cintiagutierrez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	77a4806a-947a-45fd-983c-207b855e1d58	2017-05-17 13:42:38.092104
104	91	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-041\nnombre: David\napellido: Sedillo\nnroIdentificacion: '36371823'\nfechaNacimiento: 1975-07-23\ncalle: Centenario\nnroDomicilio: '6135'\npiso: ''\ndpto: ''\ntelefono: '481018'\nemail: davidsedillo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9a9d4f00-f6bf-4fc6-a094-25db8704ffab	2017-05-17 13:42:38.179974
105	92	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-042\nnombre: Sofia\napellido: Garcia\nnroIdentificacion: '25370180'\nfechaNacimiento: 1998-01-13\ncalle: Las Flores\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '409498'\nemail: sofiagarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fabbb85b-4866-4cbf-b610-75bfa04f8703	2017-05-17 13:42:38.255809
106	93	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-043\nnombre: Alicia\napellido: Villalba\nnroIdentificacion: '27455263'\nfechaNacimiento: 1979-04-17\ncalle: Las Palmeras\nnroDomicilio: '9876'\npiso: ''\ndpto: ''\ntelefono: '420184'\nemail: alivillalba@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	aee4f24d-f188-4c62-a50a-787f65574b92	2017-05-17 13:42:38.335688
107	94	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-044\nnombre: Luis\napellido: Gonzalez\nnroIdentificacion: '36182911'\nfechaNacimiento: 1992-06-19\ncalle: Las Orquideas\nnroDomicilio: '900'\npiso: ''\ndpto: ''\ntelefono: '495712'\nemail: luisgonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6548fe64-2d06-44d0-87dc-c41f9b5da87c	2017-05-17 13:42:38.421886
108	95	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-045\nnombre: Ernesto\napellido: Da Luz\nnroIdentificacion: '30346514'\nfechaNacimiento: 1983-06-19\ncalle: Rosas\nnroDomicilio: '2463'\npiso: ''\ndpto: ''\ntelefono: '413048'\nemail: ernestodaluz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d5f1ddc0-c0db-4d4e-af0f-c5d1e617d982	2017-05-17 13:42:38.502854
109	96	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-046\nnombre: Luciano\napellido: Garcia\nnroIdentificacion: '39019733'\nfechaNacimiento: 1996-03-13\ncalle: Colon\nnroDomicilio: '8123'\npiso: ''\ndpto: ''\ntelefono: '412451'\nemail: lucianogarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	82dc1414-ad3e-436c-82b9-dd7800f639a8	2017-05-17 13:42:38.591481
110	97	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-047\nnombre: Gerardo\napellido: Cano\nnroIdentificacion: '29232117'\nfechaNacimiento: 1980-07-19\ncalle: Escuelita\nnroDomicilio: '9173'\npiso: ''\ndpto: ''\ntelefono: '462093'\nemail: gerardocano@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8ad86330-588d-454b-88e1-17d1531e9ef0	2017-05-17 13:42:38.668017
111	98	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-048\nnombre: Hector\napellido: Rincon\nnroIdentificacion: '29222287'\nfechaNacimiento: 1980-05-31\ncalle: Japon\nnroDomicilio: '2546'\npiso: ''\ndpto: ''\ntelefono: '471927'\nemail: hectorrincon@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	58d3b9b7-50cc-4f9b-b11d-78e16cf09871	2017-05-17 13:42:38.745624
188	39	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	4efc462d-1e1e-41b0-8e83-f0ce010763e3	2017-05-17 13:42:53.213418
112	99	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-049\nnombre: Alberto\napellido: Gonzalez\nnroIdentificacion: '35225922'\nfechaNacimiento: 1990-02-27\ncalle: Colombia\nnroDomicilio: '2871'\npiso: ''\ndpto: ''\ntelefono: '431570'\nemail: albertogonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	acbb8ebd-3c45-4ce8-8e1c-334aaa13be06	2017-05-17 13:42:38.825374
113	100	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-050\nnombre: Roberto\napellido: Lujan\nnroIdentificacion: '35461122'\nfechaNacimiento: 1990-05-27\ncalle: Noruega\nnroDomicilio: '1980'\npiso: ''\ndpto: ''\ntelefono: '401938'\nemail: robertolujan@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2c8ba0a8-c632-4fc0-9397-8a63df4dc08c	2017-05-17 13:42:38.915447
120	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	24e8abcb-7061-4593-b797-31e550522df4	2017-05-17 13:42:39.47205
121	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	e6b35a49-5e31-45ff-b33f-927bdce3134a	2017-05-17 13:42:39.580065
122	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	dfba4d26-ae7b-4d3d-9ede-33c0635e0f4e	2017-05-17 13:42:39.64479
123	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	f905fdb2-828a-4116-aa63-0a19698502c3	2017-05-17 13:42:39.710272
124	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	b209708d-0d4a-4ce2-918c-435e16efb947	2017-05-17 13:42:39.772186
125	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	d6ad03cd-7f7c-4811-88e9-842fc05e568c	2017-05-17 13:42:39.82963
126	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	e2db446b-c940-4331-b165-8ee110a37dc0	2017-05-17 13:42:39.882496
127	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	68b1e66f-9297-42df-af04-40f6d4f2c496	2017-05-17 13:42:39.947011
128	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	4d3e8e27-f136-4da2-8fc4-ead2b1d6f6c0	2017-05-17 13:42:40.015162
129	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 2\narea_id: 1\n	1	\N	\N	001bf28a-3400-494b-afed-f1f41f2199fb	2017-05-17 13:42:40.219893
130	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	1b9c84b2-729e-4571-8418-0bb098a327a1	2017-05-17 13:42:40.296061
131	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b95d2cf5-43b4-4af8-93ed-fd86198e2ef4	2017-05-17 13:42:40.373467
132	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	7c6ed721-1704-4ed1-82f0-5a05b24e57b1	2017-05-17 13:42:40.451326
133	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	62897707-5837-41d9-84ef-7276c086e455	2017-05-17 13:42:40.526043
189	40	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	9254561c-05c0-4ca9-b363-481c0a20f736	2017-05-17 13:42:53.259324
134	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	6dbb90cd-f7b2-43f5-9f3c-dd6e8781e58a	2017-05-17 13:42:40.594884
135	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	5a309e30-f826-4062-aa9c-88563eb16a99	2017-05-17 13:42:40.671495
136	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	f11192d7-1dda-42de-92b3-394625bce951	2017-05-17 13:42:40.735954
137	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	937a727a-2789-4f4e-8983-442c51887e07	2017-05-17 13:42:40.804873
153	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	3768ccca-53d9-4aa5-889d-0f0eb1f8157d	2017-05-17 13:42:51.470361
138	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	37c3dc11-4e11-4154-b1d9-7c8adbd6d2d8	2017-05-17 13:42:40.88067
139	11	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-011\nnombre: Percentil\ndescripcion: Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes\n  en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para\n  hacerlo en escala y poder ganar dinero con ello.\ncalle: España\nnroDomicilio: '422'\npiso: ''\ndpto: ''\ntelefono: '4590432'\nemail: percentil@gmail.com\npagWeb: percentil.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	bd3a0a77-0fc5-4f7a-9d35-e7a824de05bd	2017-05-17 13:42:40.949396
140	12	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-012\nnombre: EmbryoTools\ndescripcion: " Son una referencia mundial en reproducción asistida. Trabajan en cuatro\n  ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos,\n  porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante\n  práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan\n  es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción\n  asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de\n  los productos que vayan a entrar en contacto con embriones humanos y por último\n  trabajan en la reproducción asistida en veterinaria."\ncalle: Mariano Moreno\nnroDomicilio: '4122'\npiso: ''\ndpto: ''\ntelefono: '465888'\nemail: embryotools@gmail.com\npagWeb: embryotools.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	9823d961-445d-415d-a368-b347cad59dd8	2017-05-17 13:42:41.028532
141	13	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-013\nnombre: Aplázame\ndescripcion: " Es un método de pago que se integra en el proceso de compra del comercio\n  electrónico y permite a los clientes de las tiendas online comprar con un crédito\n  instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su\n  método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando\n  para hacerlo en breve."\ncalle: Av. San Martin\nnroDomicilio: '4532'\npiso: ''\ndpto: ''\ntelefono: '453222'\nemail: aplazame@gmail.com\npagWeb: aplazame.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	abab3bf9-2efe-4565-9a71-ec53e7a7cd7a	2017-05-17 13:42:41.106897
142	14	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-014\nnombre: BrioAgro Technologies\ndescripcion: Deesarrollo de una tecnología para que el agricultor controle su explotación.\n  El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor,\n  a través de su dispositivo, se conecta a la nube para acceder a la información de\n  su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier\n  cambio en sus variables.\ncalle: 'Colon '\nnroDomicilio: '555'\npiso: ''\ndpto: ''\ntelefono: '4651244'\nemail: bioagro@gmail.com\npagWeb: bioagro.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	451f442c-45d0-4ed8-9e2a-b61b50e8a222	2017-05-17 13:42:41.183838
143	15	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-015\nnombre: Braingaze\ndescripcion: La tecnología desarrollada detecta un pequeño movimiento ocular que permite\n  determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad\n  (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y\n  dislexia.\ncalle: Miami\nnroDomicilio: '708'\npiso: ''\ndpto: ''\ntelefono: '490123'\nemail: baringaze@gmail.com\npagWeb: braingaze.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	bc8b34be-0de9-4375-9376-5cd3f5b029fd	2017-05-17 13:42:41.263658
144	16	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-016\nnombre: CreatorStats\ndescripcion: Mejoran la métrica de los ‘youtubers’.\ncalle: Inglaterra\nnroDomicilio: '200'\npiso: ''\ndpto: ''\ntelefono: '15432510'\nemail: creatorstats@gmail.com\npagWeb: creatorstats.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	bf453622-a17e-4b95-a7f3-72d273aed7b2	2017-05-17 13:42:41.336563
145	17	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-017\nnombre: Alzhup\ndescripcion: Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar\n  de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología\n  como vehículo para que la solución sea accesible a todo el mundo. Implementan a\n  nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado\n  ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados\n  científicamente. Y también, herramientas para la memoria, capaces de personalizar\n  dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo\n  mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro\n  almacena los recuerdos y que difiere de los sistemas actuales computarizados.\ncalle: Constitucion\nnroDomicilio: '2222'\npiso: ''\ndpto: ''\ntelefono: '467632'\nemail: alzhup@gmail.com\npagWeb: alzhup.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b7591695-81f3-4ec9-b5df-8baba97af70f	2017-05-17 13:42:41.403871
190	41	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	54cd1458-86fa-4a2f-a9aa-7e79751464b8	2017-05-17 13:42:53.303457
146	18	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-018\nnombre: Axter Aerospace\ndescripcion: Están desarrollando un sistema de propulsión híbrida para las avionetas,\n  que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso\n  trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración\n  con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto\n  se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU.\n  De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción\n  y ensamblado.\ncalle: Ayacucho\nnroDomicilio: '9200'\npiso: ''\ndpto: ''\ntelefono: '432111'\nemail: axteraerospace@gmail.com\npagWeb: axteraerospace.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	73b2f3e3-122a-4d16-9758-4918c9622f8b	2017-05-17 13:42:41.479415
147	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	116382b4-cc51-437d-ba36-a47ef3d6c946	2017-05-17 13:42:51.105404
148	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	b8ce3835-0ea2-4903-bd98-e0d77ac8e950	2017-05-17 13:42:51.164948
149	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	b5bab79e-2b3f-4bba-b97e-dc5d70508263	2017-05-17 13:42:51.222473
150	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	01d130a3-c711-490b-b515-bf770c10a920	2017-05-17 13:42:51.336259
151	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	aa9b4858-38fc-474e-a8ac-d30ef84f509f	2017-05-17 13:42:51.381917
152	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	e1219bce-9ed0-44ff-96fc-1fc505d4c8d1	2017-05-17 13:42:51.425428
155	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	4ea1cc25-34ab-48e5-87f0-45c4988dd9b9	2017-05-17 13:42:51.572064
156	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	5c38213e-987b-48ea-9b72-50c5cc010ec2	2017-05-17 13:42:51.626041
157	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	ae41f56e-1911-4efd-82d2-3c11747fc7c6	2017-05-17 13:42:51.669027
158	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	82dd0c63-e433-425c-bbcf-08fe954edadd	2017-05-17 13:42:51.713548
159	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	dfde35a9-71d5-47f8-b1fe-fb62567809db	2017-05-17 13:42:51.75859
160	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	4409b193-8c26-48e4-abe9-1a78419b0d7a	2017-05-17 13:42:51.804057
161	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	04b20629-c835-4300-8a7d-a59c54376ccb	2017-05-17 13:42:51.847266
162	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	07b41d11-96ae-4b8e-819b-ce96cfddd07a	2017-05-17 13:42:51.891798
163	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	21ee3652-f128-4771-8e23-fc04d85dcd08	2017-05-17 13:42:51.936155
164	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	2b06a7df-dff1-42be-9eab-16a8ee93b263	2017-05-17 13:42:51.980169
165	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b9c98914-4b3f-4f12-8354-845a65160bd2	2017-05-17 13:42:52.028308
166	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	6ac48490-5acf-498d-a4d0-cf17a92f49f0	2017-05-17 13:42:52.080873
167	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	689d57b3-4723-4b90-9b1b-74e25ec4ce3d	2017-05-17 13:42:52.124532
168	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	3db6042c-d421-433e-808f-8167a946343a	2017-05-17 13:42:52.171966
169	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	5c7e03b7-9153-4969-9417-d0240e6ac09c	2017-05-17 13:42:52.225715
170	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	23f059c8-6e5f-4980-a77f-b84bb2a74dba	2017-05-17 13:42:52.270552
171	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	f441ffce-17c7-4e6a-8cf4-6dccd4b8ddfe	2017-05-17 13:42:52.328754
172	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	6910dea8-ff16-4dcc-b58f-e9de334a8af6	2017-05-17 13:42:52.381216
173	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	d0da79ae-d5f7-4057-b838-60a5a750e5e6	2017-05-17 13:42:52.435839
174	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	1e6e1ed7-c04f-4544-9956-741927970c6d	2017-05-17 13:42:52.483234
175	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e4c4e0e5-ecc5-4366-9a8f-99b28fd954e1	2017-05-17 13:42:52.535445
176	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f8b4b73b-9925-4dce-a1b5-ab679f7d0ddd	2017-05-17 13:42:52.580405
177	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	e40cdd12-de9f-476c-8738-cca9f2c21497	2017-05-17 13:42:52.627848
178	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	c498a57f-8e38-4284-980a-092d9a29ba37	2017-05-17 13:42:52.684524
179	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	46237350-7bd9-4418-b832-5594a265796f	2017-05-17 13:42:52.734649
180	31	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	079a6093-3ed5-43a1-a9e8-df1b894a0d88	2017-05-17 13:42:52.784387
181	32	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e4aba73d-0bc3-4823-a7ec-36b5124d61e4	2017-05-17 13:42:52.837142
182	33	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	054eb0b9-48a4-44d4-9cf6-8250fd6c05f1	2017-05-17 13:42:52.886171
183	34	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	f44ba028-ed42-4a65-81cb-f861b00d1806	2017-05-17 13:42:52.939536
191	42	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	b96271d8-1d26-4e22-8174-790945688b93	2017-05-17 13:42:53.351048
192	43	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	74e6e505-8062-4510-9e9f-5ac692c7260f	2017-05-17 13:42:53.403903
193	44	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	b5cf382c-49e0-4403-ae20-5004c5be4d75	2017-05-17 13:42:53.451071
194	45	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	937702a9-6b20-44b5-bc14-a7630719dc87	2017-05-17 13:42:53.506785
195	46	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	aab968af-3b59-4fb0-b8a5-8839c15cec0f	2017-05-17 13:42:53.559437
196	47	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	23458698-609d-4d7e-b17f-afa1b506a0f1	2017-05-17 13:42:53.605417
197	48	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f0098ac2-1431-46c4-b3e0-ebec944726fa	2017-05-17 13:42:53.658442
198	49	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	c96902e4-6e3d-421e-86b1-4bf24d0f5c16	2017-05-17 13:42:53.704408
199	50	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	91836512-8189-4de3-a5e2-7496a3900ac5	2017-05-17 13:42:53.74867
200	51	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	64341048-c6bd-4aaf-bc91-86eebc7891f3	2017-05-17 13:42:53.82752
201	52	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	d2446fc8-313e-4a4c-ab79-af4932c63f4b	2017-05-17 13:42:53.881134
202	53	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0646fe64-a695-4a16-9e07-32363d494b8a	2017-05-17 13:42:53.927894
203	54	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: 3\n	1	\N	\N	5f6116d7-d0e0-4669-a3d9-98070a61a73e	2017-05-17 13:42:53.980577
204	55	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-02\nproyecto_id: 1\nactividad_id: 4\nestado_id: 3\n	1	\N	\N	f26e78c1-7d36-4661-b065-0819d0bafbee	2017-05-17 13:42:54.027277
205	56	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-08\nproyecto_id: 1\nactividad_id: 5\nestado_id: 3\n	1	\N	\N	29796013-f09f-4772-9e11-235376cd8c82	2017-05-17 13:42:54.085375
206	57	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-18\nproyecto_id: 1\nactividad_id: 6\nestado_id: 3\n	1	\N	\N	d76b5ae1-b760-431d-956c-551869c25559	2017-05-17 13:42:54.140456
207	58	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-26\nproyecto_id: 1\nactividad_id: 7\nestado_id: 3\n	1	\N	\N	2a79dd89-3893-4038-9e3b-23110b54cde7	2017-05-17 13:42:54.193346
208	59	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-05-27\nproyecto_id: 1\nactividad_id: 8\nestado_id: 2\n	1	\N	\N	37aeef09-0922-429d-b395-672c437ce7f2	2017-05-17 13:42:54.238251
209	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	e8cc8909-135a-4425-96cf-a889bc8756d3	2017-05-17 13:42:58.325156
210	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	12ffe50b-bf40-4132-9066-c091bcf4e450	2017-05-17 13:42:58.423077
211	1	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Efectivo\n	1	\N	\N	bc34c5f6-68ab-4970-a003-accd6f5cf2e0	2017-05-17 13:42:58.531267
212	2	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta de crédito Visa\n	1	\N	\N	b4841ef0-3040-4268-9fd4-b5a931e47912	2017-05-17 13:42:58.577124
213	3	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta Naranja\n	1	\N	\N	e2ee728e-b932-4bb4-9ff5-2161fd426d73	2017-05-17 13:42:58.623181
214	4	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Saldo de cuenta\n	1	\N	\N	6ed6a3ca-309d-4e1c-9bf6-a1830e3c161a	2017-05-17 13:42:58.677334
215	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\ninicio: 2017-01-01\nmonto: 200.0\n	1	\N	\N	b44e2722-6c88-40f8-9737-fc30c4da5fbe	2017-05-17 13:42:58.92838
216	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\ninicio: 2017-02-01\nmonto: 200.0\n	1	\N	\N	c40cfcc6-39a7-4e45-b5e5-0dbccfae1649	2017-05-17 13:42:58.98843
217	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\ninicio: 2017-03-01\nmonto: 200.0\n	1	\N	\N	040361db-61e3-4cbc-95d2-ffebcd1e764b	2017-05-17 13:42:59.055094
218	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\ninicio: 2017-04-01\nmonto: 200.0\n	1	\N	\N	5b7d35a3-a810-4fd5-b5b1-a585e4517f57	2017-05-17 13:42:59.120923
219	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\ninicio: 2017-05-01\nmonto: 200.0\n	1	\N	\N	b142ca28-28af-4bdb-8839-e5fee4661c5d	2017-05-17 13:42:59.191543
220	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\ninicio: 2017-06-01\nmonto: 200.0\n	1	\N	\N	0565b1f4-e7ee-4140-9f4a-ef61bb807b75	2017-05-17 13:42:59.255632
221	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\ninicio: 2017-07-01\nmonto: 200.0\n	1	\N	\N	5da33217-13a2-41be-85fe-9226ee40f026	2017-05-17 13:42:59.321721
222	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\ninicio: 2017-08-01\nmonto: 200.0\n	1	\N	\N	dc616329-6ca2-4b1d-92b7-378516c655d6	2017-05-17 13:42:59.390554
223	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\ninicio: 2017-09-01\nmonto: 200.0\n	1	\N	\N	e36545c6-5cbe-443a-861c-0a7ec309fd3a	2017-05-17 13:42:59.464221
224	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\ninicio: 2017-10-01\nmonto: 200.0\n	1	\N	\N	7891147b-6e6d-49d3-b597-5b55802a9f22	2017-05-17 13:42:59.519747
225	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\ninicio: 2017-11-01\nmonto: 200.0\n	1	\N	\N	7494d670-3e5b-45f5-8230-90bb22732af8	2017-05-17 13:42:59.57587
226	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\ninicio: 2017-12-01\nmonto: 200.0\n	1	\N	\N	d1e30243-7191-4579-ab7a-6088267a9fd5	2017-05-17 13:42:59.648536
227	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 51\nproyecto_id: 1\n	1	\N	\N	ca275e51-c57f-4ae3-abeb-3c0a7549391c	2017-05-17 13:43:00.327456
228	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 52\nproyecto_id: 2\n	1	\N	\N	a33e5654-e3ca-4073-b837-f06f136644c6	2017-05-17 13:43:00.389158
229	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 54\nproyecto_id: 3\n	1	\N	\N	bc1104df-f353-40b1-8682-efb961f13d6c	2017-05-17 13:43:00.452709
230	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 56\nproyecto_id: 4\n	1	\N	\N	228c0592-174b-48b0-ad45-fc53f542df59	2017-05-17 13:43:00.517646
231	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 58\nproyecto_id: 5\n	1	\N	\N	281c6e9f-9a65-4631-801b-3e96472ebed9	2017-05-17 13:43:00.570553
232	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 60\nproyecto_id: 6\n	1	\N	\N	7fb70826-ea0b-4591-8f35-9c9e219a2883	2017-05-17 13:43:00.626561
233	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 63\nproyecto_id: 7\n	1	\N	\N	e28d5386-811e-445f-a0cb-204a569a9167	2017-05-17 13:43:00.68487
234	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 8\n	1	\N	\N	d4eec775-74e4-4b11-a463-aa10dbf76ffb	2017-05-17 13:43:00.750133
235	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 9\n	1	\N	\N	72476c02-6c05-44e6-b1ea-1627a7790d7c	2017-05-17 13:43:00.803829
236	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 69\nproyecto_id: 10\n	1	\N	\N	8068086c-8b68-49a2-a16c-8c75da1ae22c	2017-05-17 13:43:00.862881
237	11	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 0017-12-10\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 71\nproyecto_id: 11\n	1	\N	\N	abaa0b39-4e96-49a9-bfa7-6d4a87bc32b9	2017-05-17 13:43:00.92548
238	12	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 12\n	1	\N	\N	c4a19125-be22-43f1-9c67-6a4315807473	2017-05-17 13:43:00.984762
239	13	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 99\nproyecto_id: 13\n	1	\N	\N	ed1b72af-dac8-4c1e-8c62-247a7ac9c2d2	2017-05-17 13:43:01.036318
240	14	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 80\nproyecto_id: 14\n	1	\N	\N	0a294e09-0154-44c6-987d-c010d3f28cff	2017-05-17 13:43:01.09658
241	15	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 89\nproyecto_id: 15\n	1	\N	\N	ceacd606-8fb4-4366-a08b-37e5ffa2f772	2017-05-17 13:43:01.157028
242	16	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 16\n	1	\N	\N	719d7ea3-1fb9-4a9b-973e-dcda90d99358	2017-05-17 13:43:01.216337
243	17	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 97\nproyecto_id: 17\n	1	\N	\N	4bef3c8a-80a3-4ad2-9743-de9e63cbaf80	2017-05-17 13:43:01.27124
244	18	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 75\nproyecto_id: 18\n	1	\N	\N	cd7b4052-5e1f-4042-b16b-42a59909c905	2017-05-17 13:43:01.322483
245	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	ce0c6b58-fb50-4e8e-ba72-1a96a0bfcf94	2017-05-17 13:43:01.515841
246	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	06c28f7f-4007-4e6e-8c71-4689bfa7b691	2017-05-17 13:43:01.607892
247	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	7ed632d7-484c-4a5f-865d-e74525dc948a	2017-05-17 13:43:01.710694
248	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	e5b7a13b-3114-4409-b826-27861bb7de37	2017-05-17 13:43:01.886448
249	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	172eb854-6ec8-4ecf-974c-89dbfc2333a6	2017-05-17 13:43:01.988734
250	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	1502b683-74bb-45b1-a13a-8418b99a2060	2017-05-17 13:43:02.075612
251	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	5f1c78b2-0c37-40e5-b734-fdb910846bba	2017-05-17 13:43:02.168341
252	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	44e25718-fe46-4901-a450-e2560b133c97	2017-05-17 13:43:02.269209
253	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	a4798541-42ec-4b87-b927-debfa9433d72	2017-05-17 13:43:02.365889
254	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	c946b765-30d8-46f3-ba1f-be435855d30b	2017-05-17 13:43:02.450209
255	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	e2c2537d-c721-4396-9f5e-6da4543fc626	2017-05-17 13:43:02.540994
256	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	072acc87-283a-49b2-b4f1-779c5ae539a5	2017-05-17 13:43:02.644521
257	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	faf8a5f5-f178-4825-800b-c9801c5cb176	2017-05-17 13:43:02.753221
258	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	aa242b8d-848e-4ed4-b146-827af62ca4ea	2017-05-17 13:43:02.847255
259	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	0c27a4b1-0e6e-4370-9787-9cc0c37073eb	2017-05-17 13:43:02.93452
260	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	7bfa6b76-044e-4c8c-9943-10f8aa4de595	2017-05-17 13:43:03.038347
261	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	f7b6a466-e433-4101-8764-4becaa41d0f1	2017-05-17 13:43:03.151746
262	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	4fdfec6d-aa18-46cf-8885-d7e6c4effadb	2017-05-17 13:43:03.235883
263	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	5c92d57b-1539-4307-805b-e933174a4f15	2017-05-17 13:43:03.320093
264	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	923c0c56-4458-4a00-8a1f-d249c5da4626	2017-05-17 13:43:03.425313
265	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	4d1654d0-37bd-4bfa-b451-7a6db7471cb2	2017-05-17 13:43:03.518521
266	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	660759bf-586f-45ae-94fe-4482c0bd4b4b	2017-05-17 13:43:03.605576
267	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	374a46c9-d768-4fa9-9d90-32d80fa5bca8	2017-05-17 13:43:03.704044
268	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	36265bad-d0d4-4e8c-b380-2c372fe13425	2017-05-17 13:43:03.799906
269	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	b6d94252-32e5-49cc-9c81-4beb7d28b36a	2017-05-17 13:43:03.892729
270	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	9ac31fba-2634-4b43-bc87-6e4787b88dd8	2017-05-17 13:43:03.967809
271	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	e0bb24c0-4f16-40aa-8f95-3d0e4f91481b	2017-05-17 13:43:04.049051
272	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	5161426d-0cf1-4f3a-bcec-cae50e966e74	2017-05-17 13:43:04.156067
273	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	9ef173b1-51ec-4867-a404-8b5fd771965d	2017-05-17 13:43:04.263464
365	2	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 5\nevento_id: 1\n	1	\N	\N	8a44b823-294f-4dbe-9367-83d3267d7444	2017-05-17 13:43:13.208627
274	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	2bb86acc-3e72-49a3-a535-dd299068a2e6	2017-05-17 13:43:04.350478
275	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	2c14857c-063a-4ed5-a057-5f1bdb9783ac	2017-05-17 13:43:04.457464
276	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	8251f943-bd5f-42fe-a689-5065039a74f1	2017-05-17 13:43:04.569107
277	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	5ee822e7-c22b-4782-89f6-ddeaa743b1e9	2017-05-17 13:43:04.659481
278	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	c3693dc4-b062-489b-8b5a-bbb716819578	2017-05-17 13:43:04.785525
279	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	4e12997b-f346-46d1-acb4-b00d0f66fd90	2017-05-17 13:43:04.875946
280	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	ab10c6cd-1e90-4dfc-86c7-281606e32648	2017-05-17 13:43:04.981109
281	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	1142aa33-105f-44aa-b051-6955bb585be2	2017-05-17 13:43:05.07801
282	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	07d9e8de-22f4-49af-814f-cf592e7441b2	2017-05-17 13:43:05.162624
283	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	b9e0ae23-a795-47e2-91b9-783d3da0bec2	2017-05-17 13:43:05.252283
284	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	e88c0254-6831-4768-833a-53863492050b	2017-05-17 13:43:05.362203
285	41	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	36c1b2a4-e2be-45d1-840b-58d8b5cf6527	2017-05-17 13:43:05.463061
286	42	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	b02b3eff-6639-4ceb-8e89-9684f18c5ad1	2017-05-17 13:43:05.546368
287	43	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	e85a50ab-c9f3-46ea-a652-93482fb85562	2017-05-17 13:43:05.642194
288	44	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	29062d45-183f-4c47-afd8-21f47902b545	2017-05-17 13:43:05.744798
289	45	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	a546f9b2-6029-47ae-b62e-b88800f5dccf	2017-05-17 13:43:05.840588
290	46	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	6a6f8ac1-a5be-4aff-9bdb-dc3d34afea42	2017-05-17 13:43:05.93202
291	47	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	cc3e50be-0ca4-4e35-b794-18af1a49d7f2	2017-05-17 13:43:06.01971
292	48	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	0d6d403d-3c16-4222-9f62-138cbfbc0c91	2017-05-17 13:43:06.127967
293	49	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	d3bcf07c-dca2-4313-ae62-7c852dbb5664	2017-05-17 13:43:06.220478
294	50	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	74e13835-4d86-4d62-8224-3b4bb34476c0	2017-05-17 13:43:06.308403
295	51	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	d3e034c3-6039-4ef8-a726-16da015373da	2017-05-17 13:43:06.398524
296	52	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	7e9a5903-1f1f-4fe9-a18a-236c9e0c7073	2017-05-17 13:43:06.5046
297	53	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	30290c84-8c99-4797-9d85-48c10eafb061	2017-05-17 13:43:06.598341
298	54	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	059aca47-3bf4-4d90-9b0f-c173de730e4b	2017-05-17 13:43:06.68587
299	55	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	b6ea983f-b5fa-4e20-9355-26b5fdef5ad9	2017-05-17 13:43:06.776868
300	56	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	aa105187-8d53-4acc-806f-c48610218008	2017-05-17 13:43:06.877359
301	57	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	a3c9ad13-e025-45bc-a1d4-63b911e7d042	2017-05-17 13:43:06.976142
302	58	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	3a0d1b5b-b1b2-4d9c-9dbc-8816f3d5bf4a	2017-05-17 13:43:07.059633
303	59	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	12760571-8b22-4214-905a-61e886129906	2017-05-17 13:43:07.160556
304	60	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	5f1b8575-d3fe-4b2c-981b-cc27e2b402d4	2017-05-17 13:43:07.259057
305	61	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	17e85a79-380a-4ba6-b22b-f449f235d165	2017-05-17 13:43:07.350874
306	62	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	910ae32a-71c5-413f-832c-eafb0c80a9b1	2017-05-17 13:43:07.487713
307	63	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	64f127cf-4158-4714-b1be-1967586c0b2d	2017-05-17 13:43:07.580524
308	64	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	d5e381f8-da15-4a0b-8a4f-29cf3b7bdac6	2017-05-17 13:43:07.681347
309	65	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	465b9dd5-5c30-40b3-ab25-4432c34a06c1	2017-05-17 13:43:07.780524
310	66	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	3eb1ce91-712c-458b-8be3-64988739fd5a	2017-05-17 13:43:07.924128
311	67	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	590d1b64-8568-43ea-aad9-55f7b4acef45	2017-05-17 13:43:08.011828
312	68	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	6a569585-d36b-4f9e-9ac4-6aae2d2d730a	2017-05-17 13:43:08.112281
313	69	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	d699b6fc-ae1b-40e9-a061-ffcf6878cc3f	2017-05-17 13:43:08.210322
314	70	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	1e991240-2162-46ab-8ed1-e8efe9b1d6f4	2017-05-17 13:43:08.298764
315	71	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	8b695a67-cdb9-4004-ae6f-9672bc5c5de4	2017-05-17 13:43:08.386509
316	72	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	93e344a7-e540-4c82-92fc-b99c95961916	2017-05-17 13:43:08.488318
317	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	b7656323-b288-4710-873e-e5c736ee1df6	2017-05-17 13:43:08.609649
318	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	f6ecb91a-7f7b-4aca-8f28-ed293767e1c0	2017-05-17 13:43:08.657685
319	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	7a4e3020-70a2-43e4-8d8b-5b5559c153ad	2017-05-17 13:43:08.701305
320	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	09ad5561-1119-4a1e-b8ab-0b0ff7868606	2017-05-17 13:43:08.751329
321	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	0059f7a0-b01f-47ec-b2e4-e9ff89d36ce1	2017-05-17 13:43:08.801585
322	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	c1cf0192-9641-463b-8d80-3152f1d1ec40	2017-05-17 13:43:08.848144
323	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	3f717bea-8b65-4566-9cbb-b15b589c71b9	2017-05-17 13:43:08.902545
324	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	30a2eafc-90fd-4650-8a09-cef116ef7acb	2017-05-17 13:43:08.946408
325	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	8dc2ab87-97c9-4f41-8bcc-b2d031e835fa	2017-05-17 13:43:09.004224
326	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	382bbf11-17ba-4671-9e11-12c2cbc3ee66	2017-05-17 13:43:09.056999
327	11	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 11\n	1	\N	\N	3fd0082c-1ce0-456d-ba4a-6f421fb6ce05	2017-05-17 13:43:09.112917
328	12	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 12\n	1	\N	\N	044308de-afae-49f1-8878-32a79f41284b	2017-05-17 13:43:09.157813
329	13	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 13\n	1	\N	\N	71daa378-814e-4171-b687-8675f9228243	2017-05-17 13:43:09.212048
330	14	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 14\n	1	\N	\N	e9bf2490-0079-48a6-8d1b-7798802e3aea	2017-05-17 13:43:09.258261
331	15	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 15\n	1	\N	\N	56b24a20-3226-4310-8428-c35354d3972f	2017-05-17 13:43:09.315698
332	16	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 16\n	1	\N	\N	409f7245-65fe-4285-8c17-fd9d606f8342	2017-05-17 13:43:09.371717
333	17	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 17\n	1	\N	\N	cbd66f54-8977-442a-9696-93cc904e14f7	2017-05-17 13:43:09.428562
334	18	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 18\n	1	\N	\N	508233d7-d5f5-453b-a15d-1d08b03e94f6	2017-05-17 13:43:09.478771
335	1	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Marketing\ndescripcion: Análisis del comportamiento de los mercados y de los consumidores\n	1	\N	\N	aff0835e-6793-4a9a-a281-0f8a270499ae	2017-05-17 13:43:09.583183
336	2	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	b64d7be9-45a8-4f9e-a047-7afc6fded778	2017-05-17 13:43:09.637019
337	3	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	4c2b21ae-9cfc-48c8-9ea7-3fa0801c3824	2017-05-17 13:43:09.695004
338	4	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	b0853a62-1cf3-403f-9153-1365909a6c77	2017-05-17 13:43:09.748686
339	5	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Multimedios\ndescripcion: Televisión, Radio, Periódicos, Internet\n	1	\N	\N	c176140c-8626-4391-9cf2-b778adef7993	2017-05-17 13:43:09.804767
340	6	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Community Manager\ndescripcion: Es el profesional responsable de construir, gestionar y administrar la\n  comunidad online alrededor de una marca en Internet, creando y manteniendo relaciones\n  estables y duraderas con sus clientes, sus fans y, en general, cualquier usuario\n  interesado en la marca.\n	1	\N	\N	acec525b-03b2-41b1-8cea-30e5d6493d9b	2017-05-17 13:43:09.858743
341	7	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: El crowdfunding o micromecenazgo, en castellano, es una red de financiación\n  colectiva, normalmente online, que a través de donaciones económicas o de otro tipo,\n  consiguen financiar un determinado proyecto a cambio de recompensas, participaciones\n  de forma altruista.\n	1	\N	\N	7d8698d0-8648-49e4-a32f-738decf0057b	2017-05-17 13:43:09.917232
342	8	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador Java\ndescripcion: "-"\n	1	\N	\N	9e8fe712-df8f-4f6b-8d67-2b451e47f775	2017-05-17 13:43:09.975868
343	9	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador PHP\ndescripcion: "-"\n	1	\N	\N	5fa1ec23-7653-4a75-94e0-fc54f8cd0e76	2017-05-17 13:43:10.0249
344	10	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador web\ndescripcion: Programador en los lenguajes HTML, CSS, Javascript.\n	1	\N	\N	3b474652-6d0d-492f-a138-627b1af7fc71	2017-05-17 13:43:10.069468
345	11	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Impresiones de anuncios gigantes\ndescripcion: Carteles Publicitarios, vallas, gigantografías\n	1	\N	\N	fd7c7cd4-4c6d-4a96-9e41-f00a4b1c490e	2017-05-17 13:43:10.114886
346	12	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Consultoría\ndescripcion: "-"\n	1	\N	\N	b090b27f-5ee5-4481-b3da-2ad510f446c2	2017-05-17 13:43:10.170559
347	101	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-001\nnombre: María Rosa\napellido: Conti\nnroIdentificacion: '25644132'\nfechaNacimiento: 1975-07-03\ncalle: Ituzaingo\nnroDomicilio: '245'\npiso: '12'\ndpto: B\ntelefono: '424568'\nemail: mrconti@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f72122df-7c4d-4c08-a519-11800b1d941c	2017-05-17 13:43:10.355705
348	102	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-002\nnombre: Berta\napellido: Rivera\nnroIdentificacion: '33958772'\nfechaNacimiento: 1989-04-11\ncalle: Leandro Gómez\nnroDomicilio: '5886'\npiso: \ndpto: \ntelefono: '4598765'\nemail: brivera@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2126ef82-6bc1-4ccc-a0c4-88b2c1c5322d	2017-05-17 13:43:10.445064
349	103	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-003\nnombre: Juliana\napellido: Castiglione\nnroIdentificacion: '30444512'\nfechaNacimiento: 1980-12-09\ncalle: Brisas\nnroDomicilio: '3280'\npiso: '3'\ndpto: '20'\ntelefono: '555321'\nemail: jcastiglione@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4b4f0f4f-0156-4208-9b65-04a55b501e32	2017-05-17 13:43:10.53367
350	104	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-004\nnombre: Nahuel\napellido: Estevez\nnroIdentificacion: '19423568'\nfechaNacimiento: 1966-11-28\ncalle: Av. Alta Gracia\nnroDomicilio: '5332'\npiso: \ndpto: \ntelefono: '154632108'\nemail: nestevez@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	db63975a-f7ff-425c-aeeb-5f6074188b2c	2017-05-17 13:43:10.623477
351	105	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-005\nnombre: Pablo\napellido: Gomez\nnroIdentificacion: '25221305'\nfechaNacimiento: 1970-03-05\ncalle: Neruda\nnroDomicilio: '7393'\npiso: '8'\ndpto: A\ntelefono: '154245689'\nemail: pablogomez@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4cd3dbab-6e36-429b-b6d8-2481188f0f61	2017-05-17 13:43:10.709954
352	106	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-006\nnombre: Abigail\napellido: Coronado\nnroIdentificacion: '37926793'\nfechaNacimiento: 1994-03-21\ncalle: Florencio Varela\nnroDomicilio: '5659'\npiso: \ndpto: \ntelefono: '432666'\nemail: abigailcoronado@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b1264130-99cf-4773-9fd4-e8f0c796f1b4	2017-05-17 13:43:10.800259
353	107	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-007\nnombre: Hilda\napellido: Zielinski\nnroIdentificacion: '25334991'\nfechaNacimiento: 1970-04-07\ncalle: Joaquin Suarez\nnroDomicilio: '6863'\npiso: '6'\ndpto: '15'\ntelefono: '4478909'\nemail: hildazielinski@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	29100125-860d-410b-aade-5abf7d3f6c27	2017-05-17 13:43:10.883447
354	108	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-008\nnombre: Antonio\napellido: Goncalves Melo\nnroIdentificacion: '34008128'\nfechaNacimiento: 1989-05-29\ncalle: Maldonado\nnroDomicilio: '2757'\npiso: \ndpto: \ntelefono: '4498049'\nemail: antoniogm@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	80f19c23-45fe-4d2b-b6e9-c12c50960e61	2017-05-17 13:43:10.976926
355	109	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-009\nnombre: Isabela\napellido: Correa\nnroIdentificacion: '41889321'\nfechaNacimiento: 1997-11-04\ncalle: Marejada\nnroDomicilio: '5656'\npiso: \ndpto: \ntelefono: '4482122'\nemail: isacorrea@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	37078854-3c00-4b92-80ae-d0f7fadb5abf	2017-05-17 13:43:11.063823
356	110	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-010\nnombre: Franco\napellido: Maur\nnroIdentificacion: '41336729'\nfechaNacimiento: 1997-03-04\ncalle: Corrientes\nnroDomicilio: '314'\npiso: \ndpto: \ntelefono: '4498049'\nemail: francomaur@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	10d87d85-fe37-4b21-bf37-3b8ed744fa8e	2017-05-17 13:43:11.158577
357	111	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-011\nnombre: Felix\napellido: Baer\nnroIdentificacion: '30228128'\nfechaNacimiento: 1980-08-16\ncalle: Maldonado\nnroDomicilio: '9000'\npiso: \ndpto: \ntelefono: '4601406'\nemail: felixbaer@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d7edac7d-0660-4633-a15a-ee2dd48cc0e9	2017-05-17 13:43:11.242868
358	112	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-012\nnombre: Eileen\napellido: Macías Vargas\nnroIdentificacion: '39756412'\nfechaNacimiento: 1996-01-19\ncalle: Yapeyú\nnroDomicilio: '3778'\npiso: \ndpto: \ntelefono: '497986'\nemail: mercedesgarcia@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0b7703f8-99bd-4096-b7ac-a19a60a1bb0f	2017-05-17 13:43:11.332422
359	113	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-013\nnombre: Mercedes\napellido: García\nnroIdentificacion: '34561928'\nfechaNacimiento: 1989-05-29\ncalle: Maldonado\nnroDomicilio: '2757'\npiso: \ndpto: \ntelefono: '5557120'\nemail: antoniogm@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e3674463-9e45-4d23-88c5-892c53cacc60	2017-05-17 13:43:11.422802
360	114	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-014\nnombre: Clea\napellido: Espino\nnroIdentificacion: '24666124'\nfechaNacimiento: 1975-08-04\ncalle: Tomás Guido\nnroDomicilio: '8740'\npiso: \ndpto: \ntelefono: '4981777'\nemail: cleaespino@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2620f3a5-4ffa-4624-9f27-a0a79154e5d3	2017-05-17 13:43:11.505213
361	115	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-015\nnombre: Paul\napellido: Flores Acosta\nnroIdentificacion: '31672155'\nfechaNacimiento: 1985-06-21\ncalle: Resistencia\nnroDomicilio: '1813'\npiso: \ndpto: \ntelefono: '4231456'\nemail: paulfloresacosta@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d940770e-ce6b-4953-b7fe-ad1626eab957	2017-05-17 13:43:11.597674
362	1	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-001\nnombre: 'Reunion con Programadores '\ndescripcion: Evento que tiene como objetivo poner en contacto programadores con miembros\n  de equipos de los distintos proyectos para que celebren contratos de sistemas de\n  gestión del negocio de dichos proyectos.\ndia: 2017-05-15\nhora: 2000-01-01 08:00:00.000000000 -03:00\n	1	\N	\N	6d73de0d-23cb-4eb8-be24-f730d0850751	2017-05-17 13:43:12.491645
363	2	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-002\nnombre: Conferencia de Marketing\ndescripcion: 'Presentación de distintos expertos en el área de marketing que tiene\n  como objetivo que los miembros de equipos de proyectos adquieran conocimientos básicos\n  sobre como promocionar de manera apropiada su producto o servicio. '\ndia: 2017-05-16\nhora: 2000-01-01 08:00:00.000000000 -03:00\n	1	\N	\N	dae030db-53a1-49e9-a140-a051504ed554	2017-05-17 13:43:12.554888
364	1	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 4\nevento_id: 1\n	1	\N	\N	2baeb658-d2a2-4d5d-a27e-cb034129b920	2017-05-17 13:43:13.145649
368	5	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 9\nevento_id: 1\n	1	\N	\N	b6c25114-72fa-412a-b899-d27d429185ad	2017-05-17 13:43:13.374351
369	6	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 14\nevento_id: 1\n	1	\N	\N	059abcae-aa57-4271-9e9c-703bae17e93f	2017-05-17 13:43:13.428991
370	7	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 16\nevento_id: 1\n	1	\N	\N	729a04cc-59aa-4946-8add-3b3a4125534f	2017-05-17 13:43:13.483432
371	8	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 1\nevento_id: 2\n	1	\N	\N	e64229c9-6fe9-40aa-9a0d-5ad312090a7f	2017-05-17 13:43:13.539679
372	9	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 2\nevento_id: 2\n	1	\N	\N	9f173132-f924-455d-8060-925a0c2809a5	2017-05-17 13:43:13.591638
373	10	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 3\nevento_id: 2\n	1	\N	\N	ef7d3669-3580-457c-90fc-6781dd6a2b85	2017-05-17 13:43:13.636744
374	11	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 4\nevento_id: 2\n	1	\N	\N	acc12646-b86d-4e77-bb51-f35d434a0543	2017-05-17 13:43:13.680999
375	12	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 5\nevento_id: 2\n	1	\N	\N	c8de0ddd-c2dd-4dcb-beed-83bd5a5b52d5	2017-05-17 13:43:13.726507
376	13	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 6\nevento_id: 2\n	1	\N	\N	dcd08342-8888-4b4f-83c5-4540a37dc7bd	2017-05-17 13:43:13.788064
377	14	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 7\nevento_id: 2\n	1	\N	\N	e6c6f9f2-4af4-406f-8389-c71a59dca5b5	2017-05-17 13:43:13.838555
378	15	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 8\nevento_id: 2\n	1	\N	\N	13d8035f-512f-4fb2-9475-d5e762b4dac5	2017-05-17 13:43:13.895417
379	16	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 9\nevento_id: 2\n	1	\N	\N	f0336141-9348-4c0d-b2a9-5d3a2ea7ee38	2017-05-17 13:43:13.951913
380	17	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 10\nevento_id: 2\n	1	\N	\N	142319a3-dceb-499c-8893-65dd879109e5	2017-05-17 13:43:14.007267
381	18	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 11\nevento_id: 2\n	1	\N	\N	ff2661d1-e02a-42c3-9d32-a37ee3ddf09c	2017-05-17 13:43:14.063538
382	19	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 12\nevento_id: 2\n	1	\N	\N	d8f28984-9efb-43a3-9fa8-447f28ed5f0d	2017-05-17 13:43:14.117253
383	20	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 13\nevento_id: 2\n	1	\N	\N	eb9e4717-dfa5-4674-8207-fa9d8333a57c	2017-05-17 13:43:14.1732
384	21	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 14\nevento_id: 2\n	1	\N	\N	a89e345a-d1ce-4886-b1f1-dd9e48ee9599	2017-05-17 13:43:14.228598
385	22	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 15\nevento_id: 2\n	1	\N	\N	eed34047-7ff0-400c-992b-b6ac01844b7d	2017-05-17 13:43:14.286034
386	23	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 16\nevento_id: 2\n	1	\N	\N	1d11a83c-af8f-490e-bf9b-b149e885e985	2017-05-17 13:43:14.35185
387	24	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 17\nevento_id: 2\n	1	\N	\N	ae0ce13f-061e-4055-9028-f0ce8eee3eb9	2017-05-17 13:43:14.406628
388	25	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 18\nevento_id: 2\n	1	\N	\N	038f57ad-05dc-475e-9767-2bc50579db2c	2017-05-17 13:43:14.461527
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 403, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-05-17 13:42:28.996452	2017-05-17 13:42:28.996452	1	1
2	Apostoles	2017-05-17 13:42:29.035491	2017-05-17 13:42:29.035491	1	1
3	Bella Vista	2017-05-17 13:42:29.069416	2017-05-17 13:42:29.069416	2	1
4	Encarnación	2017-05-17 13:42:29.100204	2017-05-17 13:42:29.100204	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, inicio, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	2017-01-01	200	2017-05-17 13:42:58.898544	2017-05-17 13:42:58.898544
2	CP-002	Cuota de Febrero	Febrero 2017	2017-02-01	200	2017-05-17 13:42:58.968336	2017-05-17 13:42:58.968336
3	CP-003	Cuota de Marzo	Marzo 2017	2017-03-01	200	2017-05-17 13:42:59.033854	2017-05-17 13:42:59.033854
4	CP-004	Cuota de Abril	Abril 2017	2017-04-01	200	2017-05-17 13:42:59.10019	2017-05-17 13:42:59.10019
5	CP-005	Cuota de Mayo	Mayo 2017	2017-05-01	200	2017-05-17 13:42:59.170597	2017-05-17 13:42:59.170597
6	CP-006	Cuota de Junio	Junio 2017	2017-06-01	200	2017-05-17 13:42:59.236015	2017-05-17 13:42:59.236015
7	CP-007	Cuota de Julio	Julio 2017	2017-07-01	200	2017-05-17 13:42:59.300163	2017-05-17 13:42:59.300163
8	CP-008	Cuota de Agosto	Agosto 2017	2017-08-01	200	2017-05-17 13:42:59.369364	2017-05-17 13:42:59.369364
9	CP-009	Cuota de Septiembre	Septiembre 2017	2017-09-01	200	2017-05-17 13:42:59.43823	2017-05-17 13:42:59.43823
10	CP-010	Cuota de Octubre	Octubre 2017	2017-10-01	200	2017-05-17 13:42:59.499952	2017-05-17 13:42:59.499952
11	CP-011	Cuota de Noviembre	Noviembre 2017	2017-11-01	200	2017-05-17 13:42:59.555693	2017-05-17 13:42:59.555693
12	CP-012	Cuota de Diciembre	Diciembre 2017	2017-12-01	200	2017-05-17 13:42:59.624636	2017-05-17 13:42:59.624636
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
1	2017-01-01	2017-04-30	2017-05-17 13:43:00.292659	2017-05-17 13:43:00.292659	\N	51	1
2	2017-01-01	2017-04-30	2017-05-17 13:43:00.358109	2017-05-17 13:43:00.358109	\N	52	2
3	2017-01-01	2017-04-30	2017-05-17 13:43:00.426799	2017-05-17 13:43:00.426799	\N	54	3
4	2017-01-01	2017-04-30	2017-05-17 13:43:00.492255	2017-05-17 13:43:00.492255	\N	56	4
5	2017-01-01	2017-04-30	2017-05-17 13:43:00.547298	2017-05-17 13:43:00.547298	\N	58	5
6	2017-01-01	2017-04-30	2017-05-17 13:43:00.602423	2017-05-17 13:43:00.602423	\N	60	6
7	2017-01-01	2017-04-30	2017-05-17 13:43:00.657873	2017-05-17 13:43:00.657873	\N	63	7
8	2017-01-01	2017-04-30	2017-05-17 13:43:00.726409	2017-05-17 13:43:00.726409	\N	65	8
9	2017-01-01	2017-04-30	2017-05-17 13:43:00.780278	2017-05-17 13:43:00.780278	\N	67	9
10	2017-01-01	2017-04-30	2017-05-17 13:43:00.835968	2017-05-17 13:43:00.835968	\N	69	10
11	0017-12-10	2017-04-30	2017-05-17 13:43:00.902334	2017-05-17 13:43:00.902334	\N	71	11
12	2017-01-01	2017-04-30	2017-05-17 13:43:00.958025	2017-05-17 13:43:00.958025	\N	65	12
13	2017-01-01	2017-04-30	2017-05-17 13:43:01.014776	2017-05-17 13:43:01.014776	\N	99	13
14	2017-01-01	2017-04-30	2017-05-17 13:43:01.070519	2017-05-17 13:43:01.070519	\N	80	14
15	2017-01-01	2017-04-30	2017-05-17 13:43:01.135608	2017-05-17 13:43:01.135608	\N	89	15
16	2017-01-01	2017-04-30	2017-05-17 13:43:01.19184	2017-05-17 13:43:01.19184	\N	67	16
17	2017-01-01	2017-04-30	2017-05-17 13:43:01.247543	2017-05-17 13:43:01.247543	\N	97	17
18	2017-01-01	2017-04-30	2017-05-17 13:43:01.30256	2017-05-17 13:43:01.30256	\N	75	18
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 18, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
2	0	2017-05-17 13:43:08.641661	2017-05-17 13:43:08.641661	2
3	0	2017-05-17 13:43:08.685374	2017-05-17 13:43:08.685374	3
4	0	2017-05-17 13:43:08.729971	2017-05-17 13:43:08.729971	4
5	0	2017-05-17 13:43:08.78601	2017-05-17 13:43:08.78601	5
6	0	2017-05-17 13:43:08.830288	2017-05-17 13:43:08.830288	6
7	0	2017-05-17 13:43:08.88529	2017-05-17 13:43:08.88529	7
8	0	2017-05-17 13:43:08.929205	2017-05-17 13:43:08.929205	8
9	0	2017-05-17 13:43:08.987483	2017-05-17 13:43:08.987483	9
10	0	2017-05-17 13:43:09.041083	2017-05-17 13:43:09.041083	10
11	0	2017-05-17 13:43:09.097368	2017-05-17 13:43:09.097368	11
12	0	2017-05-17 13:43:09.141497	2017-05-17 13:43:09.141497	12
13	0	2017-05-17 13:43:09.196343	2017-05-17 13:43:09.196343	13
14	0	2017-05-17 13:43:09.24095	2017-05-17 13:43:09.24095	14
15	0	2017-05-17 13:43:09.299034	2017-05-17 13:43:09.299034	15
16	0	2017-05-17 13:43:09.354295	2017-05-17 13:43:09.354295	16
17	0	2017-05-17 13:43:09.410372	2017-05-17 13:43:09.410372	17
18	0	2017-05-17 13:43:09.463002	2017-05-17 13:43:09.463002	18
1	224	2017-05-17 13:43:08.584732	2017-05-17 14:25:14.816186	1
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 18, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
3	288	f	2017-05-17 13:43:01.683846	2017-05-17 13:43:01.683846	3	1	1	\N	\N
4	288	f	2017-05-17 13:43:01.863721	2017-05-17 13:43:01.863721	4	1	1	\N	\N
5	288	f	2017-05-17 13:43:01.967003	2017-05-17 13:43:01.967003	1	2	2	\N	\N
6	288	f	2017-05-17 13:43:02.051573	2017-05-17 13:43:02.051573	2	2	2	\N	\N
7	288	f	2017-05-17 13:43:02.146604	2017-05-17 13:43:02.146604	3	2	2	\N	\N
8	288	f	2017-05-17 13:43:02.246658	2017-05-17 13:43:02.246658	4	2	2	\N	\N
9	288	f	2017-05-17 13:43:02.343826	2017-05-17 13:43:02.343826	1	3	3	\N	\N
10	288	f	2017-05-17 13:43:02.427877	2017-05-17 13:43:02.427877	2	3	3	\N	\N
11	288	f	2017-05-17 13:43:02.520907	2017-05-17 13:43:02.520907	3	3	3	\N	\N
12	288	f	2017-05-17 13:43:02.622985	2017-05-17 13:43:02.622985	4	3	3	\N	\N
13	288	f	2017-05-17 13:43:02.731176	2017-05-17 13:43:02.731176	1	4	4	\N	\N
14	288	f	2017-05-17 13:43:02.827471	2017-05-17 13:43:02.827471	2	4	4	\N	\N
15	288	f	2017-05-17 13:43:02.914372	2017-05-17 13:43:02.914372	3	4	4	\N	\N
16	288	f	2017-05-17 13:43:03.015796	2017-05-17 13:43:03.015796	4	4	4	\N	\N
17	288	f	2017-05-17 13:43:03.131073	2017-05-17 13:43:03.131073	1	5	5	\N	\N
18	288	f	2017-05-17 13:43:03.214422	2017-05-17 13:43:03.214422	2	5	5	\N	\N
19	288	f	2017-05-17 13:43:03.299084	2017-05-17 13:43:03.299084	3	5	5	\N	\N
20	288	f	2017-05-17 13:43:03.403462	2017-05-17 13:43:03.403462	4	5	5	\N	\N
21	288	f	2017-05-17 13:43:03.498159	2017-05-17 13:43:03.498159	1	6	6	\N	\N
22	288	f	2017-05-17 13:43:03.583931	2017-05-17 13:43:03.583931	2	6	6	\N	\N
23	288	f	2017-05-17 13:43:03.682484	2017-05-17 13:43:03.682484	3	6	6	\N	\N
24	288	f	2017-05-17 13:43:03.779812	2017-05-17 13:43:03.779812	4	6	6	\N	\N
25	288	f	2017-05-17 13:43:03.873091	2017-05-17 13:43:03.873091	1	7	7	\N	\N
26	288	f	2017-05-17 13:43:03.948355	2017-05-17 13:43:03.948355	2	7	7	\N	\N
27	288	f	2017-05-17 13:43:04.029182	2017-05-17 13:43:04.029182	3	7	7	\N	\N
28	288	f	2017-05-17 13:43:04.135225	2017-05-17 13:43:04.135225	4	7	7	\N	\N
29	288	f	2017-05-17 13:43:04.242182	2017-05-17 13:43:04.242182	1	8	8	\N	\N
30	288	f	2017-05-17 13:43:04.328456	2017-05-17 13:43:04.328456	2	8	8	\N	\N
31	288	f	2017-05-17 13:43:04.436735	2017-05-17 13:43:04.436735	3	8	8	\N	\N
32	288	f	2017-05-17 13:43:04.547629	2017-05-17 13:43:04.547629	4	8	8	\N	\N
33	288	f	2017-05-17 13:43:04.640673	2017-05-17 13:43:04.640673	1	9	9	\N	\N
34	288	f	2017-05-17 13:43:04.764929	2017-05-17 13:43:04.764929	2	9	9	\N	\N
35	288	f	2017-05-17 13:43:04.856215	2017-05-17 13:43:04.856215	3	9	9	\N	\N
36	288	f	2017-05-17 13:43:04.95898	2017-05-17 13:43:04.95898	4	9	9	\N	\N
37	288	f	2017-05-17 13:43:05.05596	2017-05-17 13:43:05.05596	1	10	10	\N	\N
38	288	f	2017-05-17 13:43:05.140528	2017-05-17 13:43:05.140528	2	10	10	\N	\N
39	288	f	2017-05-17 13:43:05.232085	2017-05-17 13:43:05.232085	3	10	10	\N	\N
40	288	f	2017-05-17 13:43:05.335755	2017-05-17 13:43:05.335755	4	10	10	\N	\N
41	288	f	2017-05-17 13:43:05.441953	2017-05-17 13:43:05.441953	1	11	11	\N	\N
42	288	f	2017-05-17 13:43:05.525107	2017-05-17 13:43:05.525107	2	11	11	\N	\N
43	288	f	2017-05-17 13:43:05.622685	2017-05-17 13:43:05.622685	3	11	11	\N	\N
44	288	f	2017-05-17 13:43:05.723511	2017-05-17 13:43:05.723511	4	11	11	\N	\N
45	288	f	2017-05-17 13:43:05.819461	2017-05-17 13:43:05.819461	1	12	12	\N	\N
46	288	f	2017-05-17 13:43:05.909579	2017-05-17 13:43:05.909579	2	12	12	\N	\N
47	288	f	2017-05-17 13:43:05.999712	2017-05-17 13:43:05.999712	3	12	12	\N	\N
48	288	f	2017-05-17 13:43:06.107157	2017-05-17 13:43:06.107157	4	12	12	\N	\N
49	288	f	2017-05-17 13:43:06.198922	2017-05-17 13:43:06.198922	1	13	13	\N	\N
50	288	f	2017-05-17 13:43:06.28688	2017-05-17 13:43:06.28688	2	13	13	\N	\N
51	288	f	2017-05-17 13:43:06.378414	2017-05-17 13:43:06.378414	3	13	13	\N	\N
52	288	f	2017-05-17 13:43:06.481302	2017-05-17 13:43:06.481302	4	13	13	\N	\N
53	288	f	2017-05-17 13:43:06.576363	2017-05-17 13:43:06.576363	1	14	14	\N	\N
54	288	f	2017-05-17 13:43:06.663951	2017-05-17 13:43:06.663951	2	14	14	\N	\N
55	288	f	2017-05-17 13:43:06.757303	2017-05-17 13:43:06.757303	3	14	14	\N	\N
56	288	f	2017-05-17 13:43:06.854997	2017-05-17 13:43:06.854997	4	14	14	\N	\N
57	288	f	2017-05-17 13:43:06.954689	2017-05-17 13:43:06.954689	1	15	15	\N	\N
58	288	f	2017-05-17 13:43:07.039625	2017-05-17 13:43:07.039625	2	15	15	\N	\N
59	288	f	2017-05-17 13:43:07.137641	2017-05-17 13:43:07.137641	3	15	15	\N	\N
60	288	f	2017-05-17 13:43:07.239094	2017-05-17 13:43:07.239094	4	15	15	\N	\N
61	288	f	2017-05-17 13:43:07.330726	2017-05-17 13:43:07.330726	1	16	16	\N	\N
62	288	f	2017-05-17 13:43:07.419641	2017-05-17 13:43:07.419641	2	16	16	\N	\N
63	288	f	2017-05-17 13:43:07.559024	2017-05-17 13:43:07.559024	3	16	16	\N	\N
64	288	f	2017-05-17 13:43:07.658584	2017-05-17 13:43:07.658584	4	16	16	\N	\N
65	288	f	2017-05-17 13:43:07.760827	2017-05-17 13:43:07.760827	1	17	17	\N	\N
66	288	f	2017-05-17 13:43:07.90347	2017-05-17 13:43:07.90347	2	17	17	\N	\N
67	288	f	2017-05-17 13:43:07.990858	2017-05-17 13:43:07.990858	3	17	17	\N	\N
68	288	f	2017-05-17 13:43:08.09066	2017-05-17 13:43:08.09066	4	17	17	\N	\N
69	288	f	2017-05-17 13:43:08.189997	2017-05-17 13:43:08.189997	1	18	18	\N	\N
70	288	f	2017-05-17 13:43:08.276901	2017-05-17 13:43:08.276901	2	18	18	\N	\N
71	288	f	2017-05-17 13:43:08.366672	2017-05-17 13:43:08.366672	3	18	18	\N	\N
72	288	f	2017-05-17 13:43:08.468384	2017-05-17 13:43:08.468384	4	18	18	\N	\N
1	288	t	2017-05-17 13:43:01.481478	2017-05-17 14:25:14.719594	1	1	1	1	\N
2	288	t	2017-05-17 13:43:01.584476	2017-05-17 14:25:14.770869	2	1	1	1	\N
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
1	Finanzas	2017-05-17 13:42:29.327529	2017-05-17 13:42:29.327529
2	Recursos Humanos	2017-05-17 13:42:29.483319	2017-05-17 13:42:29.483319
3	Evaluación	2017-05-17 13:42:29.535896	2017-05-17 13:42:29.535896
4	Logística	2017-05-17 13:42:29.592244	2017-05-17 13:42:29.592244
5	Dirección	2017-05-17 13:42:29.636284	2017-05-17 13:42:29.636284
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-05-17 13:42:58.299324	2017-05-17 13:42:58.299324
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
1	Marketing	Análisis del comportamiento de los mercados y de los consumidores	2017-05-17 13:43:09.558495	2017-05-17 13:43:09.558495
2	Diseño Gráfico	-	2017-05-17 13:43:09.62098	2017-05-17 13:43:09.62098
3	Diseño Web	-	2017-05-17 13:43:09.677539	2017-05-17 13:43:09.677539
4	Fotografía	-	2017-05-17 13:43:09.732224	2017-05-17 13:43:09.732224
5	Multimedios	Televisión, Radio, Periódicos, Internet	2017-05-17 13:43:09.788214	2017-05-17 13:43:09.788214
6	Community Manager	Es el profesional responsable de construir, gestionar y administrar la comunidad online alrededor de una marca en Internet, creando y manteniendo relaciones estables y duraderas con sus clientes, sus fans y, en general, cualquier usuario interesado en la marca.	2017-05-17 13:43:09.842802	2017-05-17 13:43:09.842802
7	Crowdfunding	El crowdfunding o micromecenazgo, en castellano, es una red de financiación colectiva, normalmente online, que a través de donaciones económicas o de otro tipo, consiguen financiar un determinado proyecto a cambio de recompensas, participaciones de forma altruista.	2017-05-17 13:43:09.900247	2017-05-17 13:43:09.900247
8	Programador Java	-	2017-05-17 13:43:09.955251	2017-05-17 13:43:09.955251
9	Programador PHP	-	2017-05-17 13:43:10.009349	2017-05-17 13:43:10.009349
10	Programador web	Programador en los lenguajes HTML, CSS, Javascript.	2017-05-17 13:43:10.053028	2017-05-17 13:43:10.053028
11	Impresiones de anuncios gigantes	Carteles Publicitarios, vallas, gigantografías	2017-05-17 13:43:10.097815	2017-05-17 13:43:10.097815
12	Consultoría	-	2017-05-17 13:43:10.154301	2017-05-17 13:43:10.154301
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 12, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-05-17 13:42:51.079891	2017-05-17 13:42:51.079891
2	Doing	f	1	\N	2017-05-17 13:42:51.144788	2017-05-17 13:42:51.144788
3	Done	t	2	\N	2017-05-17 13:42:51.205202	2017-05-17 13:42:51.205202
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-05-17 13:42:39.009653	2017-05-17 13:42:39.009653
2	Incubación	-	1	2017-05-17 13:42:39.07734	2017-05-17 13:42:39.07734
3	post incubacion	-	2	2017-05-17 13:42:39.132191	2017-05-17 13:42:39.132191
4	Cuarta etapa	-	\N	2017-05-17 13:42:39.18568	2017-05-17 13:42:39.18568
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at) FROM stdin;
1	EV-001	Reunion con Programadores 	Evento que tiene como objetivo poner en contacto programadores con miembros de equipos de los distintos proyectos para que celebren contratos de sistemas de gestión del negocio de dichos proyectos.	2017-05-15	08:00:00	2017-05-17 13:43:12.464785	2017-05-17 13:43:12.464785
2	EV-002	Conferencia de Marketing	Presentación de distintos expertos en el área de marketing que tiene como objetivo que los miembros de equipos de proyectos adquieran conocimientos básicos sobre como promocionar de manera apropiada su producto o servicio. 	2017-05-16	08:00:00	2017-05-17 13:43:12.535416	2017-05-17 13:43:12.535416
3	ev-12	diseños	-	2017-05-18	14:30:00	2017-05-17 14:28:47.351898	2017-05-17 14:28:47.351898
\.


--
-- Data for Name: eventos_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_especialidades (id, created_at, updated_at, especialidad_de_contacto_id, evento_id) FROM stdin;
1	2017-05-17 13:43:12.610195	2017-05-17 13:43:12.610195	3	1
2	2017-05-17 13:43:12.63766	2017-05-17 13:43:12.63766	10	1
3	2017-05-17 13:43:12.6605	2017-05-17 13:43:12.6605	8	1
4	2017-05-17 13:43:12.681882	2017-05-17 13:43:12.681882	9	1
5	2017-05-17 13:43:12.705285	2017-05-17 13:43:12.705285	1	2
6	2017-05-17 13:43:12.72666	2017-05-17 13:43:12.72666	5	2
7	2017-05-17 13:43:12.74931	2017-05-17 13:43:12.74931	12	2
8	2017-05-17 14:28:47.588012	2017-05-17 14:28:47.588012	2	3
\.


--
-- Name: eventos_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_especialidades_id_seq', 8, true);


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_id_seq', 3, true);


--
-- Data for Name: eventos_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_proyectos (id, created_at, updated_at, proyecto_id, evento_id) FROM stdin;
1	2017-05-17 13:43:13.116547	2017-05-17 13:43:13.116547	4	1
2	2017-05-17 13:43:13.189265	2017-05-17 13:43:13.189265	5	1
3	2017-05-17 13:43:13.243319	2017-05-17 13:43:13.243319	7	1
4	2017-05-17 13:43:13.29866	2017-05-17 13:43:13.29866	8	1
5	2017-05-17 13:43:13.356533	2017-05-17 13:43:13.356533	9	1
6	2017-05-17 13:43:13.412084	2017-05-17 13:43:13.412084	14	1
7	2017-05-17 13:43:13.46594	2017-05-17 13:43:13.46594	16	1
8	2017-05-17 13:43:13.522373	2017-05-17 13:43:13.522373	1	2
9	2017-05-17 13:43:13.575137	2017-05-17 13:43:13.575137	2	2
10	2017-05-17 13:43:13.620161	2017-05-17 13:43:13.620161	3	2
11	2017-05-17 13:43:13.665443	2017-05-17 13:43:13.665443	4	2
12	2017-05-17 13:43:13.710018	2017-05-17 13:43:13.710018	5	2
13	2017-05-17 13:43:13.76643	2017-05-17 13:43:13.76643	6	2
14	2017-05-17 13:43:13.822459	2017-05-17 13:43:13.822459	7	2
15	2017-05-17 13:43:13.87849	2017-05-17 13:43:13.87849	8	2
16	2017-05-17 13:43:13.933515	2017-05-17 13:43:13.933515	9	2
17	2017-05-17 13:43:13.990105	2017-05-17 13:43:13.990105	10	2
18	2017-05-17 13:43:14.046931	2017-05-17 13:43:14.046931	11	2
19	2017-05-17 13:43:14.101073	2017-05-17 13:43:14.101073	12	2
20	2017-05-17 13:43:14.156665	2017-05-17 13:43:14.156665	13	2
21	2017-05-17 13:43:14.210787	2017-05-17 13:43:14.210787	14	2
22	2017-05-17 13:43:14.26887	2017-05-17 13:43:14.26887	15	2
23	2017-05-17 13:43:14.335437	2017-05-17 13:43:14.335437	16	2
24	2017-05-17 13:43:14.388766	2017-05-17 13:43:14.388766	17	2
25	2017-05-17 13:43:14.446567	2017-05-17 13:43:14.446567	18	2
26	2017-05-17 14:28:47.370524	2017-05-17 14:28:47.370524	5	3
27	2017-05-17 14:28:47.441189	2017-05-17 14:28:47.441189	6	3
28	2017-05-17 14:28:47.498784	2017-05-17 14:28:47.498784	7	3
\.


--
-- Name: eventos_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_proyectos_id_seq', 28, true);


--
-- Data for Name: historiales; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY historiales (id, "fechaHora", created_at, updated_at, actividad_proyecto_id, estado_id, proyecto_id, user_id) FROM stdin;
1	2017-01-01 11:20:00	2017-05-17 13:42:54.308489	2017-05-17 13:42:54.308489	1	1	1	1
2	2017-01-01 11:20:00	2017-05-17 13:42:54.333188	2017-05-17 13:42:54.333188	2	1	1	1
3	2017-01-01 11:21:00	2017-05-17 13:42:54.35318	2017-05-17 13:42:54.35318	3	1	1	1
4	2017-01-01 11:22:00	2017-05-17 13:42:54.376454	2017-05-17 13:42:54.376454	1	2	1	1
5	2017-01-02 11:22:00	2017-05-17 13:42:54.398147	2017-05-17 13:42:54.398147	2	2	1	1
6	2017-01-08 11:23:00	2017-05-17 13:42:54.431805	2017-05-17 13:42:54.431805	3	2	1	1
7	2017-01-01 11:23:00	2017-05-17 13:42:54.467078	2017-05-17 13:42:54.467078	1	3	1	1
8	2017-01-06 11:24:00	2017-05-17 13:42:54.488531	2017-05-17 13:42:54.488531	2	3	1	1
9	2017-01-12 15:46:17	2017-05-17 13:42:54.511052	2017-05-17 13:42:54.511052	3	3	1	1
10	2017-01-17 15:51:14	2017-05-17 13:42:54.532581	2017-05-17 13:42:54.532581	55	1	1	1
11	2017-01-23 15:51:58	2017-05-17 13:42:54.555141	2017-05-17 13:42:54.555141	56	1	1	1
12	2017-02-02 15:52:39	2017-05-17 13:42:54.58786	2017-05-17 13:42:54.58786	57	1	1	1
13	2017-02-11 15:54:06	2017-05-17 13:42:54.622246	2017-05-17 13:42:54.622246	58	1	1	1
14	2017-02-23 15:55:59	2017-05-17 13:42:54.645575	2017-05-17 13:42:54.645575	59	1	1	1
15	2017-03-01 15:51:14	2017-05-17 13:42:54.667832	2017-05-17 13:42:54.667832	55	2	1	1
16	2017-03-08 15:51:58	2017-05-17 13:42:54.69031	2017-05-17 13:42:54.69031	56	2	1	1
17	2017-03-15 15:52:39	2017-05-17 13:42:54.712659	2017-05-17 13:42:54.712659	57	2	1	1
18	2017-03-21 15:54:06	2017-05-17 13:42:54.734214	2017-05-17 13:42:54.734214	58	2	1	1
19	2017-03-28 15:55:59	2017-05-17 13:42:54.755845	2017-05-17 13:42:54.755845	59	2	1	1
20	2017-04-01 15:51:14	2017-05-17 13:42:54.779438	2017-05-17 13:42:54.779438	55	3	1	1
21	2017-04-10 15:51:58	2017-05-17 13:42:54.813197	2017-05-17 13:42:54.813197	56	3	1	1
22	2017-04-17 15:52:39	2017-05-17 13:42:54.834987	2017-05-17 13:42:54.834987	57	3	1	1
23	2017-04-25 15:54:06	2017-05-17 13:42:54.855826	2017-05-17 13:42:54.855826	58	3	1	1
24	2017-01-01 11:20:00	2017-05-17 13:42:54.880172	2017-05-17 13:42:54.880172	4	1	2	1
25	2017-01-01 11:20:00	2017-05-17 13:42:54.901905	2017-05-17 13:42:54.901905	5	1	2	1
26	2017-01-01 11:21:00	2017-05-17 13:42:54.935626	2017-05-17 13:42:54.935626	6	1	2	1
27	2017-01-01 11:22:00	2017-05-17 13:42:54.95684	2017-05-17 13:42:54.95684	4	2	2	1
28	2017-01-02 11:22:00	2017-05-17 13:42:54.989477	2017-05-17 13:42:54.989477	5	2	2	1
29	2017-01-08 11:23:00	2017-05-17 13:42:55.012077	2017-05-17 13:42:55.012077	6	2	2	1
30	2017-01-01 11:23:00	2017-05-17 13:42:55.046539	2017-05-17 13:42:55.046539	4	3	2	1
31	2017-01-06 11:24:00	2017-05-17 13:42:55.069388	2017-05-17 13:42:55.069388	5	3	2	1
32	2017-01-01 11:20:00	2017-05-17 13:42:55.101563	2017-05-17 13:42:55.101563	7	1	3	1
33	2017-01-01 11:20:00	2017-05-17 13:42:55.123204	2017-05-17 13:42:55.123204	8	1	3	1
34	2017-01-01 11:21:00	2017-05-17 13:42:55.146338	2017-05-17 13:42:55.146338	9	1	3	1
35	2017-01-01 11:22:00	2017-05-17 13:42:55.16723	2017-05-17 13:42:55.16723	7	2	3	1
36	2017-01-02 11:22:00	2017-05-17 13:42:55.190996	2017-05-17 13:42:55.190996	8	2	3	1
37	2017-01-08 11:23:00	2017-05-17 13:42:55.212221	2017-05-17 13:42:55.212221	9	2	3	1
38	2017-01-01 11:23:00	2017-05-17 13:42:55.234356	2017-05-17 13:42:55.234356	7	3	3	1
39	2017-01-06 11:24:00	2017-05-17 13:42:55.258087	2017-05-17 13:42:55.258087	8	3	3	1
40	2017-01-01 11:20:00	2017-05-17 13:42:55.280321	2017-05-17 13:42:55.280321	10	1	4	1
41	2017-01-01 11:20:00	2017-05-17 13:42:55.30191	2017-05-17 13:42:55.30191	11	1	4	1
42	2017-01-01 11:21:00	2017-05-17 13:42:55.323462	2017-05-17 13:42:55.323462	12	1	4	1
43	2017-01-01 11:22:00	2017-05-17 13:42:55.347168	2017-05-17 13:42:55.347168	10	2	4	1
44	2017-01-02 11:22:00	2017-05-17 13:42:55.369275	2017-05-17 13:42:55.369275	11	2	4	1
45	2017-01-08 11:23:00	2017-05-17 13:42:55.391354	2017-05-17 13:42:55.391354	12	2	4	1
46	2017-01-01 11:23:00	2017-05-17 13:42:55.413553	2017-05-17 13:42:55.413553	10	3	4	1
47	2017-01-06 11:24:00	2017-05-17 13:42:55.444929	2017-05-17 13:42:55.444929	11	3	4	1
48	2017-01-01 11:20:00	2017-05-17 13:42:55.467232	2017-05-17 13:42:55.467232	13	1	5	1
49	2017-01-01 11:20:00	2017-05-17 13:42:55.512433	2017-05-17 13:42:55.512433	14	1	5	1
50	2017-01-01 11:21:00	2017-05-17 13:42:55.535743	2017-05-17 13:42:55.535743	15	1	5	1
51	2017-01-01 11:22:00	2017-05-17 13:42:55.568958	2017-05-17 13:42:55.568958	13	2	5	1
52	2017-01-02 11:22:00	2017-05-17 13:42:55.5911	2017-05-17 13:42:55.5911	14	2	5	1
53	2017-01-08 11:23:00	2017-05-17 13:42:55.636194	2017-05-17 13:42:55.636194	15	2	5	1
54	2017-01-01 11:23:00	2017-05-17 13:42:55.657914	2017-05-17 13:42:55.657914	13	3	5	1
55	2017-01-06 11:24:00	2017-05-17 13:42:55.678586	2017-05-17 13:42:55.678586	14	3	5	1
56	2017-01-01 11:20:00	2017-05-17 13:42:55.702336	2017-05-17 13:42:55.702336	16	1	6	1
57	2017-01-01 11:20:00	2017-05-17 13:42:55.723331	2017-05-17 13:42:55.723331	17	1	6	1
58	2017-01-01 11:21:00	2017-05-17 13:42:55.747233	2017-05-17 13:42:55.747233	18	1	6	1
59	2017-01-01 11:22:00	2017-05-17 13:42:55.76821	2017-05-17 13:42:55.76821	16	2	6	1
60	2017-01-02 11:22:00	2017-05-17 13:42:55.791648	2017-05-17 13:42:55.791648	17	2	6	1
61	2017-01-08 11:23:00	2017-05-17 13:42:55.812927	2017-05-17 13:42:55.812927	18	2	6	1
62	2017-01-01 11:23:00	2017-05-17 13:42:55.834723	2017-05-17 13:42:55.834723	16	3	6	1
63	2017-01-06 11:24:00	2017-05-17 13:42:55.856667	2017-05-17 13:42:55.856667	17	3	6	1
64	2017-01-01 11:20:00	2017-05-17 13:42:55.880593	2017-05-17 13:42:55.880593	19	1	7	1
65	2017-01-01 11:20:00	2017-05-17 13:42:55.902362	2017-05-17 13:42:55.902362	20	1	7	1
66	2017-01-01 11:21:00	2017-05-17 13:42:55.923506	2017-05-17 13:42:55.923506	21	1	7	1
67	2017-01-01 11:22:00	2017-05-17 13:42:55.94681	2017-05-17 13:42:55.94681	19	2	7	1
68	2017-01-02 11:22:00	2017-05-17 13:42:55.968255	2017-05-17 13:42:55.968255	20	2	7	1
69	2017-01-08 11:23:00	2017-05-17 13:42:55.989627	2017-05-17 13:42:55.989627	21	2	7	1
70	2017-01-01 11:23:00	2017-05-17 13:42:56.025276	2017-05-17 13:42:56.025276	19	3	7	1
71	2017-01-06 11:24:00	2017-05-17 13:42:56.047199	2017-05-17 13:42:56.047199	20	3	7	1
72	2017-01-01 11:20:00	2017-05-17 13:42:56.069639	2017-05-17 13:42:56.069639	22	1	8	1
73	2017-01-01 11:20:00	2017-05-17 13:42:56.091864	2017-05-17 13:42:56.091864	23	1	8	1
74	2017-01-01 11:21:00	2017-05-17 13:42:56.112964	2017-05-17 13:42:56.112964	24	1	8	1
75	2017-01-01 11:22:00	2017-05-17 13:42:56.134806	2017-05-17 13:42:56.134806	22	2	8	1
76	2017-01-02 11:22:00	2017-05-17 13:42:56.158346	2017-05-17 13:42:56.158346	23	2	8	1
77	2017-01-08 11:23:00	2017-05-17 13:42:56.180432	2017-05-17 13:42:56.180432	24	2	8	1
78	2017-01-01 11:23:00	2017-05-17 13:42:56.202982	2017-05-17 13:42:56.202982	22	3	8	1
79	2017-01-06 11:24:00	2017-05-17 13:42:56.223255	2017-05-17 13:42:56.223255	23	3	8	1
80	2017-01-01 11:20:00	2017-05-17 13:42:56.247336	2017-05-17 13:42:56.247336	25	1	9	1
81	2017-01-01 11:20:00	2017-05-17 13:42:56.268419	2017-05-17 13:42:56.268419	26	1	9	1
82	2017-01-01 11:21:00	2017-05-17 13:42:56.289753	2017-05-17 13:42:56.289753	27	1	9	1
83	2017-01-01 11:22:00	2017-05-17 13:42:56.312469	2017-05-17 13:42:56.312469	25	2	9	1
84	2017-01-02 11:22:00	2017-05-17 13:42:56.335272	2017-05-17 13:42:56.335272	26	2	9	1
85	2017-01-08 11:23:00	2017-05-17 13:42:56.357884	2017-05-17 13:42:56.357884	27	2	9	1
86	2017-01-01 11:23:00	2017-05-17 13:42:56.379159	2017-05-17 13:42:56.379159	25	3	9	1
87	2017-01-06 11:24:00	2017-05-17 13:42:56.402961	2017-05-17 13:42:56.402961	26	3	9	1
88	2017-01-01 11:20:00	2017-05-17 13:42:56.42311	2017-05-17 13:42:56.42311	28	1	10	1
89	2017-01-01 11:20:00	2017-05-17 13:42:56.446864	2017-05-17 13:42:56.446864	29	1	10	1
90	2017-01-01 11:21:00	2017-05-17 13:42:56.468335	2017-05-17 13:42:56.468335	30	1	10	1
91	2017-01-01 11:22:00	2017-05-17 13:42:56.492033	2017-05-17 13:42:56.492033	28	2	10	1
92	2017-01-02 11:22:00	2017-05-17 13:42:56.514369	2017-05-17 13:42:56.514369	29	2	10	1
93	2017-01-08 11:23:00	2017-05-17 13:42:56.535094	2017-05-17 13:42:56.535094	30	2	10	1
94	2017-01-01 11:23:00	2017-05-17 13:42:56.558707	2017-05-17 13:42:56.558707	28	3	10	1
95	2017-01-06 11:24:00	2017-05-17 13:42:56.57958	2017-05-17 13:42:56.57958	29	3	10	1
96	2017-01-01 11:20:00	2017-05-17 13:42:56.601022	2017-05-17 13:42:56.601022	31	1	11	1
97	2017-01-01 11:20:00	2017-05-17 13:42:56.625235	2017-05-17 13:42:56.625235	32	1	11	1
98	2017-01-01 11:21:00	2017-05-17 13:42:56.647406	2017-05-17 13:42:56.647406	33	1	11	1
99	2017-01-01 11:22:00	2017-05-17 13:42:56.668384	2017-05-17 13:42:56.668384	31	2	11	1
100	2017-01-02 11:22:00	2017-05-17 13:42:56.690824	2017-05-17 13:42:56.690824	32	2	11	1
101	2017-01-08 11:23:00	2017-05-17 13:42:56.712193	2017-05-17 13:42:56.712193	33	2	11	1
102	2017-01-01 11:23:00	2017-05-17 13:42:56.735652	2017-05-17 13:42:56.735652	31	3	11	1
103	2017-01-06 11:24:00	2017-05-17 13:42:56.758198	2017-05-17 13:42:56.758198	32	3	11	1
104	2017-01-01 11:20:00	2017-05-17 13:42:56.779409	2017-05-17 13:42:56.779409	34	1	12	1
105	2017-01-01 11:20:00	2017-05-17 13:42:56.802921	2017-05-17 13:42:56.802921	35	1	12	1
106	2017-01-01 11:21:00	2017-05-17 13:42:56.823929	2017-05-17 13:42:56.823929	36	1	12	1
107	2017-01-01 11:22:00	2017-05-17 13:42:56.847589	2017-05-17 13:42:56.847589	34	2	12	1
108	2017-01-02 11:22:00	2017-05-17 13:42:56.868641	2017-05-17 13:42:56.868641	35	2	12	1
109	2017-01-08 11:23:00	2017-05-17 13:42:56.890004	2017-05-17 13:42:56.890004	36	2	12	1
110	2017-01-01 11:23:00	2017-05-17 13:42:56.912643	2017-05-17 13:42:56.912643	34	3	12	1
111	2017-01-06 11:24:00	2017-05-17 13:42:56.936649	2017-05-17 13:42:56.936649	35	3	12	1
112	2017-01-01 11:20:00	2017-05-17 13:42:56.958676	2017-05-17 13:42:56.958676	37	1	13	1
113	2017-01-01 11:20:00	2017-05-17 13:42:56.979207	2017-05-17 13:42:56.979207	38	1	13	1
114	2017-01-01 11:21:00	2017-05-17 13:42:57.002891	2017-05-17 13:42:57.002891	39	1	13	1
115	2017-01-01 11:22:00	2017-05-17 13:42:57.024761	2017-05-17 13:42:57.024761	37	2	13	1
116	2017-01-02 11:22:00	2017-05-17 13:42:57.047798	2017-05-17 13:42:57.047798	38	2	13	1
117	2017-01-08 11:23:00	2017-05-17 13:42:57.069022	2017-05-17 13:42:57.069022	39	2	13	1
118	2017-01-01 11:23:00	2017-05-17 13:42:57.090757	2017-05-17 13:42:57.090757	37	3	13	1
119	2017-01-06 11:24:00	2017-05-17 13:42:57.113619	2017-05-17 13:42:57.113619	38	3	13	1
120	2017-01-01 11:20:00	2017-05-17 13:42:57.136504	2017-05-17 13:42:57.136504	40	1	14	1
121	2017-01-01 11:20:00	2017-05-17 13:42:57.158365	2017-05-17 13:42:57.158365	41	1	14	1
122	2017-01-01 11:21:00	2017-05-17 13:42:57.179159	2017-05-17 13:42:57.179159	42	1	14	1
123	2017-01-01 11:22:00	2017-05-17 13:42:57.203073	2017-05-17 13:42:57.203073	40	2	14	1
124	2017-01-02 11:22:00	2017-05-17 13:42:57.22358	2017-05-17 13:42:57.22358	41	2	14	1
125	2017-01-08 11:23:00	2017-05-17 13:42:57.247762	2017-05-17 13:42:57.247762	42	2	14	1
126	2017-01-01 11:23:00	2017-05-17 13:42:57.269418	2017-05-17 13:42:57.269418	40	3	14	1
127	2017-01-06 11:24:00	2017-05-17 13:42:57.303366	2017-05-17 13:42:57.303366	41	3	14	1
128	2017-01-01 11:20:00	2017-05-17 13:42:57.325732	2017-05-17 13:42:57.325732	43	1	15	1
129	2017-01-01 11:20:00	2017-05-17 13:42:57.358596	2017-05-17 13:42:57.358596	44	1	15	1
130	2017-01-01 11:21:00	2017-05-17 13:42:57.379386	2017-05-17 13:42:57.379386	45	1	15	1
131	2017-01-01 11:22:00	2017-05-17 13:42:57.413541	2017-05-17 13:42:57.413541	43	2	15	1
132	2017-01-02 11:22:00	2017-05-17 13:42:57.436613	2017-05-17 13:42:57.436613	44	2	15	1
133	2017-01-08 11:23:00	2017-05-17 13:42:57.468953	2017-05-17 13:42:57.468953	45	2	15	1
134	2017-01-01 11:23:00	2017-05-17 13:42:57.490533	2017-05-17 13:42:57.490533	43	3	15	1
135	2017-01-06 11:24:00	2017-05-17 13:42:57.525622	2017-05-17 13:42:57.525622	44	3	15	1
136	2017-01-01 11:20:00	2017-05-17 13:42:57.547744	2017-05-17 13:42:57.547744	46	1	16	1
137	2017-01-01 11:20:00	2017-05-17 13:42:57.570124	2017-05-17 13:42:57.570124	47	1	16	1
138	2017-01-01 11:21:00	2017-05-17 13:42:57.590569	2017-05-17 13:42:57.590569	48	1	16	1
139	2017-01-01 11:22:00	2017-05-17 13:42:57.613902	2017-05-17 13:42:57.613902	46	2	16	1
140	2017-01-02 11:22:00	2017-05-17 13:42:57.63476	2017-05-17 13:42:57.63476	47	2	16	1
141	2017-01-08 11:23:00	2017-05-17 13:42:57.657145	2017-05-17 13:42:57.657145	48	2	16	1
142	2017-01-01 11:23:00	2017-05-17 13:42:57.679634	2017-05-17 13:42:57.679634	46	3	16	1
143	2017-01-06 11:24:00	2017-05-17 13:42:57.701881	2017-05-17 13:42:57.701881	47	3	16	1
144	2017-01-01 11:20:00	2017-05-17 13:42:57.724894	2017-05-17 13:42:57.724894	49	1	17	1
145	2017-01-01 11:20:00	2017-05-17 13:42:57.746493	2017-05-17 13:42:57.746493	50	1	17	1
146	2017-01-01 11:21:00	2017-05-17 13:42:57.770057	2017-05-17 13:42:57.770057	51	1	17	1
147	2017-01-01 11:22:00	2017-05-17 13:42:57.79125	2017-05-17 13:42:57.79125	49	2	17	1
148	2017-01-02 11:22:00	2017-05-17 13:42:57.977044	2017-05-17 13:42:57.977044	50	2	17	1
149	2017-01-08 11:23:00	2017-05-17 13:42:58.003606	2017-05-17 13:42:58.003606	51	2	17	1
150	2017-01-01 11:23:00	2017-05-17 13:42:58.024622	2017-05-17 13:42:58.024622	49	3	17	1
151	2017-01-06 11:24:00	2017-05-17 13:42:58.046546	2017-05-17 13:42:58.046546	50	3	17	1
152	2017-01-01 11:20:00	2017-05-17 13:42:58.069612	2017-05-17 13:42:58.069612	52	1	18	1
153	2017-01-01 11:20:00	2017-05-17 13:42:58.090902	2017-05-17 13:42:58.090902	53	1	18	1
154	2017-01-01 11:21:00	2017-05-17 13:42:58.114353	2017-05-17 13:42:58.114353	54	1	18	1
155	2017-01-01 11:22:00	2017-05-17 13:42:58.135054	2017-05-17 13:42:58.135054	52	2	18	1
156	2017-01-02 11:22:00	2017-05-17 13:42:58.15918	2017-05-17 13:42:58.15918	53	2	18	1
157	2017-01-08 11:23:00	2017-05-17 13:42:58.179922	2017-05-17 13:42:58.179922	54	2	18	1
158	2017-01-01 11:23:00	2017-05-17 13:42:58.203985	2017-05-17 13:42:58.203985	52	3	18	1
159	2017-01-06 11:24:00	2017-05-17 13:42:58.224868	2017-05-17 13:42:58.224868	53	3	18	1
160	2017-05-17 14:21:49.394602	2017-05-17 14:21:49.396621	2017-05-17 14:21:49.77859	59	3	1	1
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 160, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-05-17 13:42:58.398971	2017-05-17 13:42:58.398971
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
1	Actividad	2017-05-17 13:42:43.47329	2017-05-17 13:42:43.47329
2	Area	2017-05-17 13:42:43.497345	2017-05-17 13:42:43.497345
3	Ciudad	2017-05-17 13:42:43.518045	2017-05-17 13:42:43.518045
4	ConceptoDePago	2017-05-17 13:42:43.539814	2017-05-17 13:42:43.539814
5	Contacto	2017-05-17 13:42:43.563161	2017-05-17 13:42:43.563161
6	Contrato	2017-05-17 13:42:43.583807	2017-05-17 13:42:43.583807
7	Cuenta	2017-05-17 13:42:43.607789	2017-05-17 13:42:43.607789
8	Departamento	2017-05-17 13:42:43.628498	2017-05-17 13:42:43.628498
9	Descuento	2017-05-17 13:42:43.651971	2017-05-17 13:42:43.651971
10	Empleado	2017-05-17 13:42:43.673338	2017-05-17 13:42:43.673338
11	EspecialidadDeContacto	2017-05-17 13:42:43.69481	2017-05-17 13:42:43.69481
12	Estado	2017-05-17 13:42:43.716866	2017-05-17 13:42:43.716866
13	Etapa	2017-05-17 13:42:43.740128	2017-05-17 13:42:43.740128
14	Evento	2017-05-17 13:42:43.764053	2017-05-17 13:42:43.764053
15	EventoProyecto	2017-05-17 13:42:43.785748	2017-05-17 13:42:43.785748
16	MiembroEquipo	2017-05-17 13:42:43.80749	2017-05-17 13:42:43.80749
17	Pago	2017-05-17 13:42:43.830572	2017-05-17 13:42:43.830572
18	Pais	2017-05-17 13:42:43.852337	2017-05-17 13:42:43.852337
19	Provincia	2017-05-17 13:42:43.873459	2017-05-17 13:42:43.873459
20	Proyecto	2017-05-17 13:42:43.895262	2017-05-17 13:42:43.895262
21	Rol	2017-05-17 13:42:43.918447	2017-05-17 13:42:43.918447
22	RolDeEmpleado	2017-05-17 13:42:43.942047	2017-05-17 13:42:43.942047
23	TipoDocumento	2017-05-17 13:42:43.962489	2017-05-17 13:42:43.962489
24	TipoDePago	2017-05-17 13:42:43.985926	2017-05-17 13:42:43.985926
25	User	2017-05-17 13:42:44.007612	2017-05-17 13:42:44.007612
26	ActividadProyecto	2017-05-17 13:42:44.050841	2017-05-17 13:42:44.050841
27	CuotaPorCliente	2017-05-17 13:42:44.073126	2017-05-17 13:42:44.073126
28	Accion	2017-05-17 13:42:44.095441	2017-05-17 13:42:44.095441
29	Modelo	2017-05-17 13:42:44.118588	2017-05-17 13:42:44.118588
\.


--
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('modelos_id_seq', 29, true);


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos (id, fecha, monto, created_at, updated_at, tipo_de_pago_id, proyecto_id, persona_id, cuenta_id, contrato_id) FROM stdin;
1	2017-05-17	576	2017-05-17 14:25:14.45411	2017-05-17 14:25:14.45411	\N	1	51	1	1
\.


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_id_seq', 1, true);


--
-- Data for Name: pagos_metodos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos_metodos (id, monto, created_at, updated_at, pago_id, tipo_de_pago_id) FROM stdin;
1	800	2017-05-17 14:25:14.603973	2017-05-17 14:25:14.603973	1	1
\.


--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_metodos_id_seq', 1, true);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY paises (id, nombre, created_at, updated_at) FROM stdin;
1	Argentina	2017-05-17 13:42:28.732905	2017-05-17 13:42:28.732905
2	Paraguay	2017-05-17 13:42:28.75797	2017-05-17 13:42:28.75797
3	Brasil	2017-05-17 13:42:28.779953	2017-05-17 13:42:28.779953
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-05-17 13:42:44.186012	2017-05-17 13:42:44.186012	1	1
2	2017-05-17 13:42:44.214246	2017-05-17 13:42:44.214246	2	1
3	2017-05-17 13:42:44.237112	2017-05-17 13:42:44.237112	3	1
4	2017-05-17 13:42:44.259223	2017-05-17 13:42:44.259223	4	1
5	2017-05-17 13:42:44.281217	2017-05-17 13:42:44.281217	1	2
6	2017-05-17 13:42:44.302766	2017-05-17 13:42:44.302766	2	2
7	2017-05-17 13:42:44.326068	2017-05-17 13:42:44.326068	3	2
8	2017-05-17 13:42:44.347912	2017-05-17 13:42:44.347912	4	2
9	2017-05-17 13:42:44.369075	2017-05-17 13:42:44.369075	1	3
10	2017-05-17 13:42:44.392233	2017-05-17 13:42:44.392233	2	3
11	2017-05-17 13:42:44.413308	2017-05-17 13:42:44.413308	3	3
12	2017-05-17 13:42:44.436524	2017-05-17 13:42:44.436524	4	3
13	2017-05-17 13:42:44.458295	2017-05-17 13:42:44.458295	1	4
14	2017-05-17 13:42:44.481505	2017-05-17 13:42:44.481505	2	4
15	2017-05-17 13:42:44.502895	2017-05-17 13:42:44.502895	3	4
16	2017-05-17 13:42:44.525939	2017-05-17 13:42:44.525939	4	4
17	2017-05-17 13:42:44.547032	2017-05-17 13:42:44.547032	1	5
18	2017-05-17 13:42:44.569554	2017-05-17 13:42:44.569554	2	5
19	2017-05-17 13:42:44.592798	2017-05-17 13:42:44.592798	3	5
20	2017-05-17 13:42:44.614866	2017-05-17 13:42:44.614866	4	5
21	2017-05-17 13:42:44.635918	2017-05-17 13:42:44.635918	1	6
22	2017-05-17 13:42:44.658275	2017-05-17 13:42:44.658275	2	6
23	2017-05-17 13:42:44.681679	2017-05-17 13:42:44.681679	3	6
24	2017-05-17 13:42:44.703122	2017-05-17 13:42:44.703122	4	6
25	2017-05-17 13:42:44.725448	2017-05-17 13:42:44.725448	1	7
26	2017-05-17 13:42:44.74706	2017-05-17 13:42:44.74706	2	7
27	2017-05-17 13:42:44.770854	2017-05-17 13:42:44.770854	3	7
28	2017-05-17 13:42:44.792273	2017-05-17 13:42:44.792273	4	7
29	2017-05-17 13:42:44.813684	2017-05-17 13:42:44.813684	1	8
30	2017-05-17 13:42:44.83736	2017-05-17 13:42:44.83736	2	8
31	2017-05-17 13:42:44.858779	2017-05-17 13:42:44.858779	3	8
32	2017-05-17 13:42:44.881684	2017-05-17 13:42:44.881684	4	8
33	2017-05-17 13:42:44.903275	2017-05-17 13:42:44.903275	1	9
34	2017-05-17 13:42:44.92627	2017-05-17 13:42:44.92627	2	9
35	2017-05-17 13:42:44.94754	2017-05-17 13:42:44.94754	3	9
36	2017-05-17 13:42:44.970681	2017-05-17 13:42:44.970681	4	9
37	2017-05-17 13:42:44.992132	2017-05-17 13:42:44.992132	1	10
38	2017-05-17 13:42:45.015036	2017-05-17 13:42:45.015036	2	10
39	2017-05-17 13:42:45.037091	2017-05-17 13:42:45.037091	3	10
40	2017-05-17 13:42:45.058745	2017-05-17 13:42:45.058745	4	10
41	2017-05-17 13:42:45.082069	2017-05-17 13:42:45.082069	1	11
42	2017-05-17 13:42:45.103353	2017-05-17 13:42:45.103353	2	11
43	2017-05-17 13:42:45.126248	2017-05-17 13:42:45.126248	3	11
44	2017-05-17 13:42:45.147106	2017-05-17 13:42:45.147106	4	11
45	2017-05-17 13:42:45.169651	2017-05-17 13:42:45.169651	1	12
46	2017-05-17 13:42:45.192107	2017-05-17 13:42:45.192107	2	12
47	2017-05-17 13:42:45.215238	2017-05-17 13:42:45.215238	3	12
48	2017-05-17 13:42:45.237356	2017-05-17 13:42:45.237356	4	12
49	2017-05-17 13:42:45.259371	2017-05-17 13:42:45.259371	1	13
50	2017-05-17 13:42:45.281706	2017-05-17 13:42:45.281706	2	13
51	2017-05-17 13:42:45.303077	2017-05-17 13:42:45.303077	3	13
52	2017-05-17 13:42:45.326431	2017-05-17 13:42:45.326431	4	13
53	2017-05-17 13:42:45.347036	2017-05-17 13:42:45.347036	1	14
54	2017-05-17 13:42:45.369413	2017-05-17 13:42:45.369413	2	14
55	2017-05-17 13:42:45.391989	2017-05-17 13:42:45.391989	3	14
56	2017-05-17 13:42:45.415104	2017-05-17 13:42:45.415104	4	14
57	2017-05-17 13:42:45.43733	2017-05-17 13:42:45.43733	1	15
58	2017-05-17 13:42:45.458995	2017-05-17 13:42:45.458995	2	15
59	2017-05-17 13:42:45.481527	2017-05-17 13:42:45.481527	3	15
60	2017-05-17 13:42:45.503685	2017-05-17 13:42:45.503685	4	15
61	2017-05-17 13:42:45.526044	2017-05-17 13:42:45.526044	1	16
62	2017-05-17 13:42:45.547235	2017-05-17 13:42:45.547235	2	16
63	2017-05-17 13:42:45.569374	2017-05-17 13:42:45.569374	3	16
64	2017-05-17 13:42:45.592124	2017-05-17 13:42:45.592124	4	16
65	2017-05-17 13:42:45.613544	2017-05-17 13:42:45.613544	1	17
66	2017-05-17 13:42:45.637122	2017-05-17 13:42:45.637122	2	17
67	2017-05-17 13:42:45.659014	2017-05-17 13:42:45.659014	3	17
68	2017-05-17 13:42:45.682168	2017-05-17 13:42:45.682168	4	17
69	2017-05-17 13:42:45.703519	2017-05-17 13:42:45.703519	1	18
70	2017-05-17 13:42:45.726516	2017-05-17 13:42:45.726516	2	18
71	2017-05-17 13:42:45.747474	2017-05-17 13:42:45.747474	3	18
72	2017-05-17 13:42:45.770111	2017-05-17 13:42:45.770111	4	18
73	2017-05-17 13:42:45.792798	2017-05-17 13:42:45.792798	1	19
74	2017-05-17 13:42:45.827351	2017-05-17 13:42:45.827351	2	19
75	2017-05-17 13:42:45.848234	2017-05-17 13:42:45.848234	3	19
76	2017-05-17 13:42:45.892051	2017-05-17 13:42:45.892051	4	19
77	2017-05-17 13:42:45.915798	2017-05-17 13:42:45.915798	1	20
78	2017-05-17 13:42:45.947779	2017-05-17 13:42:45.947779	2	20
79	2017-05-17 13:42:45.970049	2017-05-17 13:42:45.970049	3	20
80	2017-05-17 13:42:46.019757	2017-05-17 13:42:46.019757	4	20
81	2017-05-17 13:42:46.036755	2017-05-17 13:42:46.036755	1	21
82	2017-05-17 13:42:46.059467	2017-05-17 13:42:46.059467	2	21
83	2017-05-17 13:42:46.082537	2017-05-17 13:42:46.082537	3	21
84	2017-05-17 13:42:46.103739	2017-05-17 13:42:46.103739	4	21
85	2017-05-17 13:42:46.125652	2017-05-17 13:42:46.125652	1	22
86	2017-05-17 13:42:46.148237	2017-05-17 13:42:46.148237	2	22
87	2017-05-17 13:42:46.169479	2017-05-17 13:42:46.169479	3	22
88	2017-05-17 13:42:46.192685	2017-05-17 13:42:46.192685	4	22
89	2017-05-17 13:42:46.214415	2017-05-17 13:42:46.214415	1	23
90	2017-05-17 13:42:46.237063	2017-05-17 13:42:46.237063	2	23
91	2017-05-17 13:42:46.259118	2017-05-17 13:42:46.259118	3	23
92	2017-05-17 13:42:46.280889	2017-05-17 13:42:46.280889	4	23
93	2017-05-17 13:42:46.304727	2017-05-17 13:42:46.304727	1	24
94	2017-05-17 13:42:46.32538	2017-05-17 13:42:46.32538	2	24
95	2017-05-17 13:42:46.347473	2017-05-17 13:42:46.347473	3	24
96	2017-05-17 13:42:46.370792	2017-05-17 13:42:46.370792	4	24
97	2017-05-17 13:42:46.392876	2017-05-17 13:42:46.392876	1	25
98	2017-05-17 13:42:46.413528	2017-05-17 13:42:46.413528	2	25
99	2017-05-17 13:42:46.437534	2017-05-17 13:42:46.437534	3	25
100	2017-05-17 13:42:46.45905	2017-05-17 13:42:46.45905	4	25
101	2017-05-17 13:42:46.4821	2017-05-17 13:42:46.4821	5	20
102	2017-05-17 13:42:46.503449	2017-05-17 13:42:46.503449	6	1
103	2017-05-17 13:42:46.525923	2017-05-17 13:42:46.525923	6	2
104	2017-05-17 13:42:46.54827	2017-05-17 13:42:46.54827	6	3
105	2017-05-17 13:42:46.571085	2017-05-17 13:42:46.571085	6	4
106	2017-05-17 13:42:46.592619	2017-05-17 13:42:46.592619	6	5
107	2017-05-17 13:42:46.615797	2017-05-17 13:42:46.615797	6	6
108	2017-05-17 13:42:46.637882	2017-05-17 13:42:46.637882	6	7
109	2017-05-17 13:42:46.659338	2017-05-17 13:42:46.659338	6	8
110	2017-05-17 13:42:46.682319	2017-05-17 13:42:46.682319	6	9
111	2017-05-17 13:42:46.70321	2017-05-17 13:42:46.70321	6	10
112	2017-05-17 13:42:46.726681	2017-05-17 13:42:46.726681	6	11
113	2017-05-17 13:42:46.748297	2017-05-17 13:42:46.748297	6	12
114	2017-05-17 13:42:46.770005	2017-05-17 13:42:46.770005	6	13
115	2017-05-17 13:42:46.793113	2017-05-17 13:42:46.793113	6	14
116	2017-05-17 13:42:46.814954	2017-05-17 13:42:46.814954	6	15
117	2017-05-17 13:42:46.837276	2017-05-17 13:42:46.837276	6	16
118	2017-05-17 13:42:46.859404	2017-05-17 13:42:46.859404	6	17
119	2017-05-17 13:42:46.882341	2017-05-17 13:42:46.882341	6	18
120	2017-05-17 13:42:46.904093	2017-05-17 13:42:46.904093	6	19
121	2017-05-17 13:42:46.925503	2017-05-17 13:42:46.925503	6	20
122	2017-05-17 13:42:46.948347	2017-05-17 13:42:46.948347	6	21
123	2017-05-17 13:42:46.971307	2017-05-17 13:42:46.971307	6	22
124	2017-05-17 13:42:46.993217	2017-05-17 13:42:46.993217	6	23
125	2017-05-17 13:42:47.015488	2017-05-17 13:42:47.015488	6	24
126	2017-05-17 13:42:47.036563	2017-05-17 13:42:47.036563	6	25
127	2017-05-17 13:42:47.059142	2017-05-17 13:42:47.059142	2	26
128	2017-05-17 13:42:47.081174	2017-05-17 13:42:47.081174	4	26
129	2017-05-17 13:42:47.103332	2017-05-17 13:42:47.103332	6	26
130	2017-05-17 13:42:47.125703	2017-05-17 13:42:47.125703	5	17
131	2017-05-17 13:42:47.14893	2017-05-17 13:42:47.14893	5	14
132	2017-05-17 13:42:47.171326	2017-05-17 13:42:47.171326	5	6
133	2017-05-17 13:42:47.192476	2017-05-17 13:42:47.192476	1	27
134	2017-05-17 13:42:47.214172	2017-05-17 13:42:47.214172	3	27
135	2017-05-17 13:42:47.237988	2017-05-17 13:42:47.237988	4	27
136	2017-05-17 13:42:47.260345	2017-05-17 13:42:47.260345	5	27
137	2017-05-17 13:42:47.281275	2017-05-17 13:42:47.281275	6	27
138	2017-05-17 13:42:47.303356	2017-05-17 13:42:47.303356	7	20
139	2017-05-17 13:42:47.337964	2017-05-17 13:42:47.337964	7	14
140	2017-05-17 13:42:47.359585	2017-05-17 13:42:47.359585	7	15
141	2017-05-17 13:42:47.39328	2017-05-17 13:42:47.39328	1	28
142	2017-05-17 13:42:47.414815	2017-05-17 13:42:47.414815	2	28
143	2017-05-17 13:42:47.448484	2017-05-17 13:42:47.448484	3	28
144	2017-05-17 13:42:47.471342	2017-05-17 13:42:47.471342	4	28
145	2017-05-17 13:42:47.504596	2017-05-17 13:42:47.504596	6	28
146	2017-05-17 13:42:47.526859	2017-05-17 13:42:47.526859	1	29
147	2017-05-17 13:42:47.560008	2017-05-17 13:42:47.560008	2	29
148	2017-05-17 13:42:47.580901	2017-05-17 13:42:47.580901	3	29
149	2017-05-17 13:42:47.605024	2017-05-17 13:42:47.605024	4	29
150	2017-05-17 13:42:47.62566	2017-05-17 13:42:47.62566	6	29
151	2017-05-17 13:42:47.648222	2017-05-17 13:42:47.648222	8	1
152	2017-05-17 13:42:47.671241	2017-05-17 13:42:47.671241	8	4
153	2017-05-17 13:42:47.693435	2017-05-17 13:42:47.693435	8	5
154	2017-05-17 13:42:47.715869	2017-05-17 13:42:47.715869	8	6
155	2017-05-17 13:42:47.738118	2017-05-17 13:42:47.738118	8	7
156	2017-05-17 13:42:47.75916	2017-05-17 13:42:47.75916	8	8
157	2017-05-17 13:42:47.818116	2017-05-17 13:42:47.818116	8	9
158	2017-05-17 13:42:47.848093	2017-05-17 13:42:47.848093	8	10
159	2017-05-17 13:42:47.871315	2017-05-17 13:42:47.871315	8	11
160	2017-05-17 13:42:47.903192	2017-05-17 13:42:47.903192	8	12
161	2017-05-17 13:42:47.925726	2017-05-17 13:42:47.925726	8	13
162	2017-05-17 13:42:47.97145	2017-05-17 13:42:47.97145	8	14
163	2017-05-17 13:42:47.993404	2017-05-17 13:42:47.993404	8	15
164	2017-05-17 13:42:48.026487	2017-05-17 13:42:48.026487	8	16
165	2017-05-17 13:42:48.048292	2017-05-17 13:42:48.048292	8	17
166	2017-05-17 13:42:48.093736	2017-05-17 13:42:48.093736	8	20
167	2017-05-17 13:42:48.11515	2017-05-17 13:42:48.11515	8	22
168	2017-05-17 13:42:48.138051	2017-05-17 13:42:48.138051	8	24
169	2017-05-17 13:42:48.159321	2017-05-17 13:42:48.159321	8	26
170	2017-05-17 13:42:48.182453	2017-05-17 13:42:48.182453	8	27
171	2017-05-17 13:42:48.204279	2017-05-17 13:42:48.204279	9	1
172	2017-05-17 13:42:48.227141	2017-05-17 13:42:48.227141	9	4
173	2017-05-17 13:42:48.248358	2017-05-17 13:42:48.248358	9	5
174	2017-05-17 13:42:48.271585	2017-05-17 13:42:48.271585	9	6
175	2017-05-17 13:42:48.293686	2017-05-17 13:42:48.293686	9	7
176	2017-05-17 13:42:48.31526	2017-05-17 13:42:48.31526	9	8
177	2017-05-17 13:42:48.338085	2017-05-17 13:42:48.338085	9	9
178	2017-05-17 13:42:48.359904	2017-05-17 13:42:48.359904	9	10
179	2017-05-17 13:42:48.382698	2017-05-17 13:42:48.382698	9	11
180	2017-05-17 13:42:48.404235	2017-05-17 13:42:48.404235	9	12
181	2017-05-17 13:42:48.425688	2017-05-17 13:42:48.425688	9	13
182	2017-05-17 13:42:48.449159	2017-05-17 13:42:48.449159	9	14
183	2017-05-17 13:42:48.471591	2017-05-17 13:42:48.471591	9	15
184	2017-05-17 13:42:48.49404	2017-05-17 13:42:48.49404	9	16
185	2017-05-17 13:42:48.515449	2017-05-17 13:42:48.515449	9	17
186	2017-05-17 13:42:48.538289	2017-05-17 13:42:48.538289	9	20
187	2017-05-17 13:42:48.560573	2017-05-17 13:42:48.560573	9	22
188	2017-05-17 13:42:48.581331	2017-05-17 13:42:48.581331	9	24
189	2017-05-17 13:42:48.60458	2017-05-17 13:42:48.60458	9	26
190	2017-05-17 13:42:48.627322	2017-05-17 13:42:48.627322	9	27
191	2017-05-17 13:42:48.64948	2017-05-17 13:42:48.64948	9	28
192	2017-05-17 13:42:48.671596	2017-05-17 13:42:48.671596	9	29
193	2017-05-17 13:42:48.692681	2017-05-17 13:42:48.692681	10	1
194	2017-05-17 13:42:48.714849	2017-05-17 13:42:48.714849	10	4
195	2017-05-17 13:42:48.738505	2017-05-17 13:42:48.738505	10	5
196	2017-05-17 13:42:48.759346	2017-05-17 13:42:48.759346	10	6
197	2017-05-17 13:42:48.781403	2017-05-17 13:42:48.781403	10	7
198	2017-05-17 13:42:48.804731	2017-05-17 13:42:48.804731	10	8
199	2017-05-17 13:42:48.827545	2017-05-17 13:42:48.827545	10	9
200	2017-05-17 13:42:48.850992	2017-05-17 13:42:48.850992	10	10
201	2017-05-17 13:42:48.873305	2017-05-17 13:42:48.873305	10	11
202	2017-05-17 13:42:48.894533	2017-05-17 13:42:48.894533	10	12
203	2017-05-17 13:42:48.917103	2017-05-17 13:42:48.917103	10	13
204	2017-05-17 13:42:48.939618	2017-05-17 13:42:48.939618	10	14
205	2017-05-17 13:42:48.962	2017-05-17 13:42:48.962	10	15
206	2017-05-17 13:42:48.983461	2017-05-17 13:42:48.983461	10	16
207	2017-05-17 13:42:49.006476	2017-05-17 13:42:49.006476	10	17
208	2017-05-17 13:42:49.062598	2017-05-17 13:42:49.062598	10	20
209	2017-05-17 13:42:49.083661	2017-05-17 13:42:49.083661	10	22
210	2017-05-17 13:42:49.105254	2017-05-17 13:42:49.105254	10	24
211	2017-05-17 13:42:49.127517	2017-05-17 13:42:49.127517	10	26
212	2017-05-17 13:42:49.151092	2017-05-17 13:42:49.151092	10	27
213	2017-05-17 13:42:49.171919	2017-05-17 13:42:49.171919	11	5
214	2017-05-17 13:42:49.195544	2017-05-17 13:42:49.195544	11	10
215	2017-05-17 13:42:49.217144	2017-05-17 13:42:49.217144	11	13
216	2017-05-17 13:42:49.23981	2017-05-17 13:42:49.23981	11	14
217	2017-05-17 13:42:49.262344	2017-05-17 13:42:49.262344	11	15
218	2017-05-17 13:42:49.283166	2017-05-17 13:42:49.283166	11	16
219	2017-05-17 13:42:49.306733	2017-05-17 13:42:49.306733	11	17
220	2017-05-17 13:42:49.328395	2017-05-17 13:42:49.328395	11	28
221	2017-05-17 13:42:49.349967	2017-05-17 13:42:49.349967	11	29
222	2017-05-17 13:42:49.37305	2017-05-17 13:42:49.37305	12	5
223	2017-05-17 13:42:49.39503	2017-05-17 13:42:49.39503	12	10
224	2017-05-17 13:42:49.417643	2017-05-17 13:42:49.417643	12	13
225	2017-05-17 13:42:49.439278	2017-05-17 13:42:49.439278	12	14
226	2017-05-17 13:42:49.460955	2017-05-17 13:42:49.460955	12	16
227	2017-05-17 13:42:49.484608	2017-05-17 13:42:49.484608	13	20
228	2017-05-17 13:42:49.505543	2017-05-17 13:42:49.505543	13	27
229	2017-05-17 13:42:49.52827	2017-05-17 13:42:49.52827	14	20
230	2017-05-17 13:42:49.55113	2017-05-17 13:42:49.55113	15	20
231	2017-05-17 13:42:49.572943	2017-05-17 13:42:49.572943	15	27
\.


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('permisos_id_seq', 231, true);


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

COPY personas (id, codigo, nombre, apellido, "nroIdentificacion", "fechaNacimiento", calle, "nroDomicilio", piso, dpto, telefono, email, tipo, type, created_at, updated_at, pais_id, provincia_id, ciudad_id, tipo_documento_id, departamento_id, area_id, rol_de_empleado_id) FROM stdin;
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.369273	2017-05-17 13:42:30.369273	1	1	1	1	5	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.465506	2017-05-17 13:42:30.465506	1	1	1	1	4	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.560276	2017-05-17 13:42:30.560276	1	1	1	1	3	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.643991	2017-05-17 13:42:30.643991	1	1	1	1	2	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.721932	2017-05-17 13:42:30.721932	1	1	1	1	1	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.812538	2017-05-17 13:42:30.812538	1	1	1	1	4	1	7
7	EMP-007	Maria	Gonzalez	36134076	1991-11-05	176	7141			4401604	mg@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.904491	2017-05-17 13:42:30.904491	1	1	1	1	5	1	8
8	EMP-008	Elena	Ceballos	25198461	1974-05-06	Tereré	7302	4	B	4355987	ec@gmail.com	Empleado	Empleado	2017-05-17 13:42:30.991117	2017-05-17 13:42:30.991117	1	1	1	1	4	1	7
9	EMP-009	Alberto	Padilla	33843657	1986-10-17	Rivera	6872			459885	ap@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.077496	2017-05-17 13:42:31.077496	1	1	1	1	3	1	4
10	EMP-010	Fernando	Gonzalez	33980912	1987-01-21	Tereré	1187			4456980	fg@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.154571	2017-05-17 13:42:31.154571	1	1	1	1	2	1	3
11	EMP-011	Tiago	Gonzalez	38187222	1995-06-08	Castilla	8299	10	15	4444176	tiagogonzales@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.234309	2017-05-17 13:42:31.234309	1	1	1	1	1	1	2
12	EMP-012	Cintia	Castro	22612413	1970-02-20	Av. Andalucia	7415	12	A	4255987	cintiacastro@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.311177	2017-05-17 13:42:31.311177	1	1	1	1	4	1	7
13	EMP-013	Josefina	Jardin	36025176	1991-11-05	176	7141			4401604	josefinajardin@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.394047	2017-05-17 13:42:31.394047	1	1	1	1	5	1	8
14	EMP-014	Diana	Rivas	25948001	1974-05-06	Tereré	7302	4	B	4355987	dianarivas@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.481024	2017-05-17 13:42:31.481024	1	1	1	1	4	1	7
15	EMP-015	Dario	Gonzalez	33880019	1986-10-17	Rivera	6872			459885	dariogonzalez@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.566186	2017-05-17 13:42:31.566186	1	1	1	1	3	1	4
16	EMP-016	Ciro	Zamora	33983707	1987-01-21	Tereré	1187			4456980	cirozamora@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.658406	2017-05-17 13:42:31.658406	1	1	1	1	2	1	3
17	EMP-017	Zoe	Vazquez	3818104	1995-06-08	Castilla	8299	10	15	4444176	zoevazquez@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.746968	2017-05-17 13:42:31.746968	1	1	1	1	1	1	2
18	EMP-018	Cristian	Gonzalez	22659193	1970-02-20	Av. Andalucia	7415	12	A	4255987	cristiangonzalez@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.832438	2017-05-17 13:42:31.832438	1	1	1	1	4	1	7
19	EMP-019	Ana	Manfrin	36222076	1991-11-05	176	7141			4401604	anamanfrin@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.912455	2017-05-17 13:42:31.912455	1	1	1	1	5	1	8
20	EMP-020	Martina	Adamo	25841001	1974-05-06	Tereré	7302	4	B	4355987	martinaadamo@gmail.com	Empleado	Empleado	2017-05-17 13:42:31.987836	2017-05-17 13:42:31.987836	1	1	1	1	4	1	7
21	EMP-021	Roberto	Milani	33880333	1986-10-17	Rivera	6872			459885	robertomilani@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.06768	2017-05-17 13:42:32.06768	1	1	1	1	3	1	4
22	EMP-022	Victor	Gonzalez	33984447	1987-01-21	Tereré	1187			4456980	victorgonzalez@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.156536	2017-05-17 13:42:32.156536	1	1	1	1	2	1	3
23	EMP-023	Alejandro	Cambril	38113409	1995-06-08	Castilla	8299	10	15	4444176	alejandrocambril@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.236106	2017-05-17 13:42:32.236106	1	1	1	1	1	1	2
24	EMP-024	Luis	Rizzo	22543493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luisrizzo@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.323622	2017-05-17 13:42:32.323622	1	1	1	1	4	1	7
25	EMP-025	Mario	Rosas	36060986	1991-11-05	176	7141			4401604	mariorosas@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.400232	2017-05-17 13:42:32.400232	1	1	1	1	5	1	8
26	EMP-026	Analia	Granados	25131701	1974-05-06	Tereré	7302	4	B	4355987	analiagranados@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.478823	2017-05-17 13:42:32.478823	1	1	1	1	4	1	7
27	EMP-027	Leonor	Gonzalez	33888717	1986-10-17	Rivera	6872			459885	leonorgonzalez@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.590057	2017-05-17 13:42:32.590057	1	1	1	1	3	1	4
28	EMP-028	Victor	Baresi	33928407	1987-01-21	Tereré	1187			4456980	victorbaresi@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.667252	2017-05-17 13:42:32.667252	1	1	1	1	2	1	3
29	EMP-029	Silvana	Lazzaga	38918849	1995-06-08	Castilla	8299	10	15	4444176	silvanalazzaga@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.744187	2017-05-17 13:42:32.744187	1	1	1	1	1	1	2
30	EMP-030	Juana	Calabrese	220192493	1970-02-20	Av. Andalucia	7415	12	A	4255987	janacalabrese@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.83179	2017-05-17 13:42:32.83179	1	1	1	1	4	1	7
31	EMP-031	Juliana	Lombardi	38613849	1995-06-08	Castilla	8299	10	15	4444176	julianalombardi@gmail.com	Empleado	Empleado	2017-05-17 13:42:32.914288	2017-05-17 13:42:32.914288	1	1	1	1	1	1	2
32	EMP-032	Enrique	Cano	22451493	1970-02-20	Av. Andalucia	7415	12	A	4255987	enriquecano@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.003439	2017-05-17 13:42:33.003439	1	1	1	1	4	1	7
33	EMP-033	Gilda	Lombarde	36064356	1991-11-05	176	7141			4401604	gildalombarde@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.093071	2017-05-17 13:42:33.093071	1	1	1	1	5	1	8
34	EMP-034	Martin	Bande	25124501	1974-05-06	Tereré	7302	4	B	4355987	martinbande@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.16923	2017-05-17 13:42:33.16923	1	1	1	1	4	1	7
35	EMP-035	Gabriel	Ferruccio	33451657	1986-10-17	Rivera	6872			459885	gabrielferuccio@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.245165	2017-05-17 13:42:33.245165	1	1	1	1	3	1	4
36	EMP-036	Juan	Mazzanti	33956107	1987-01-21	Tereré	1187			4456980	juanmazzanti@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.323071	2017-05-17 13:42:33.323071	1	1	1	1	2	1	3
37	EMP-037	Karina	Fiorentino	38663849	1995-06-08	Castilla	8299	10	15	4444176	karinafiorentino@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.400955	2017-05-17 13:42:33.400955	1	1	1	1	1	1	2
38	EMP-038	Osvaldo	Pagnotto	22019493	1970-02-20	Av. Andalucia	7415	12	A	4255987	osvaldopagnotto@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.492827	2017-05-17 13:42:33.492827	1	1	1	1	4	1	7
39	EMP-039	Margarita	Giordano	36068886	1991-11-05	176	7141			4401604	margaritagiordano@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.580773	2017-05-17 13:42:33.580773	1	1	1	1	5	1	8
40	EMP-040	Rosa	Napolitano	2576401	1974-05-06	Tereré	7302	4	B	4355987	rosanapolitano@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.659696	2017-05-17 13:42:33.659696	1	1	1	1	4	1	7
41	EMP-041	Magdalena	Bruno	38817849	1995-06-08	Castilla	8299	10	15	4444176	mardalenabruno@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.74867	2017-05-17 13:42:33.74867	1	1	1	1	1	1	2
42	EMP-042	Mauricio	Costa	22755493	1970-02-20	Av. Andalucia	7415	12	A	4255987	mauriciocosta@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.833345	2017-05-17 13:42:33.833345	1	1	1	1	4	1	7
43	EMP-043	Ivan	Costas	36755076	1991-11-05	176	7141			4401604	ivancostas@gmail.com	Empleado	Empleado	2017-05-17 13:42:33.912523	2017-05-17 13:42:33.912523	1	1	1	1	5	1	8
44	EMP-044	Pablo	Davide	251934401	1974-05-06	Tereré	7302	4	B	4355987	pablodavide@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.011386	2017-05-17 13:42:34.011386	1	1	1	1	4	1	7
45	EMP-045	Nicolas	Medina	33801927	1986-10-17	Rivera	6872			459885	nicolasmedina@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.089601	2017-05-17 13:42:34.089601	1	1	1	1	3	1	4
46	EMP-046	Celeste	Milano	35122307	1987-01-21	Tereré	1187			4456980	celestemilano@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.167669	2017-05-17 13:42:34.167669	1	1	1	1	2	1	3
47	EMP-047	Sebastian	Schiavone	38175649	1995-06-08	Castilla	8299	10	15	4444176	sebastianschiavone@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.245205	2017-05-17 13:42:34.245205	1	1	1	1	1	1	2
48	EMP-048	Ruben	Almedina	22891493	1970-02-20	Av. Andalucia	7415	12	A	4255987	rubenalmedina@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.323618	2017-05-17 13:42:34.323618	1	1	1	1	4	1	7
49	EMP-049	Cristian	Camiño	36093716	1991-11-05	176	7141			4401604	cristiancamiño@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.41165	2017-05-17 13:42:34.41165	1	1	1	1	5	1	8
50	EMP-050	Monica	Conti	25888001	1974-05-06	Tereré	7302	4	B	4355987	monicaconti@gmail.com	Empleado	Empleado	2017-05-17 13:42:34.490143	2017-05-17 13:42:34.490143	1	1	1	1	4	1	7
51	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:34.635733	2017-05-17 13:42:34.635733	1	1	2	2	\N	1	\N
52	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:34.722284	2017-05-17 13:42:34.722284	1	1	2	1	\N	1	\N
53	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:34.856792	2017-05-17 13:42:34.856792	1	1	2	1	\N	1	\N
54	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:34.934953	2017-05-17 13:42:34.934953	1	1	2	1	\N	1	\N
55	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.011607	2017-05-17 13:42:35.011607	1	1	2	1	\N	1	\N
56	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.090115	2017-05-17 13:42:35.090115	1	1	2	2	\N	1	\N
57	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.179911	2017-05-17 13:42:35.179911	1	1	2	1	\N	1	\N
58	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.25967	2017-05-17 13:42:35.25967	1	1	2	1	\N	1	\N
59	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.347828	2017-05-17 13:42:35.347828	1	1	2	1	\N	1	\N
60	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.432927	2017-05-17 13:42:35.432927	1	1	2	2	\N	1	\N
61	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.512505	2017-05-17 13:42:35.512505	1	1	2	1	\N	1	\N
62	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.589961	2017-05-17 13:42:35.589961	1	1	2	1	\N	1	\N
63	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.667744	2017-05-17 13:42:35.667744	1	1	2	1	\N	1	\N
64	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.747469	2017-05-17 13:42:35.747469	1	1	2	2	\N	1	\N
65	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.837164	2017-05-17 13:42:35.837164	1	1	2	1	\N	1	\N
66	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.912865	2017-05-17 13:42:35.912865	1	1	2	1	\N	1	\N
67	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:35.990771	2017-05-17 13:42:35.990771	1	1	2	1	\N	1	\N
68	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.072005	2017-05-17 13:42:36.072005	1	1	2	2	\N	1	\N
69	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.15979	2017-05-17 13:42:36.15979	1	1	2	1	\N	1	\N
70	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.23464	2017-05-17 13:42:36.23464	1	1	2	1	\N	1	\N
71	ME-021	Lidia	Delucci	28088944	1981-01-29	Chile	6144			481898	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.321996	2017-05-17 13:42:36.321996	1	1	2	1	\N	1	\N
72	ME-022	Leonor	Gomez Santos	40560231	1996-03-13	Plaza Mayor	2637			4536662	leonorgs@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.415962	2017-05-17 13:42:36.415962	1	1	2	1	\N	1	\N
73	ME-023	Lara	Gonçalves	29075344	1980-07-19	España	1415			4498457	laragoncalves@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.506307	2017-05-17 13:42:36.506307	1	1	2	1	\N	1	\N
74	ME-024	Martin	Diaz	26070390	1976-08-11	calle Nueva	1826			491088	martindiaz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.592878	2017-05-17 13:42:36.592878	1	1	2	1	\N	1	\N
75	ME-025	Marina	Diaz	26070394	1976-08-11	calle Nueva	1826			491088	marinadiaz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.678644	2017-05-17 13:42:36.678644	1	1	2	1	\N	1	\N
76	ME-026	Gerardo	Urbina	29234987	1980-05-31	Álamo	6162			455433	gerardou@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.758018	2017-05-17 13:42:36.758018	1	1	2	1	\N	1	\N
77	ME-027	Silvio	Quiroz	35465922	1990-02-27	Álamo	2128			415176	silvioquiroz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.845565	2017-05-17 13:42:36.845565	1	1	2	1	\N	1	\N
78	ME-028	Gabriela	Garcia	33457976	1987-12-19	Alem	123			451912	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:36.928862	2017-05-17 13:42:36.928862	1	1	2	1	\N	1	\N
79	ME-029	Leonardo	Rios	29524865	1981-11-30	Concepcion	5139			4590871	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.016279	2017-05-17 13:42:37.016279	1	1	2	1	\N	1	\N
80	ME-030	Ubaldo	Gomez	34123456	1990-04-08	Entre Rios	1235			456798	ubaldogomez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.146158	2017-05-17 13:42:37.146158	1	1	2	1	\N	1	\N
81	ME-031	Silvio	Gonzalez	29092236	1980-05-16	Cordoba	7213			4501923	silviogonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.238487	2017-05-17 13:42:37.238487	1	1	2	1	\N	1	\N
82	ME-032	Rosa	Fernandez	20112254	1968-09-13	San Martin	1028			4567895	rosafernandez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.327471	2017-05-17 13:42:37.327471	1	1	2	1	\N	1	\N
83	ME-033	Alejandro	Fernandez	20998871	1987-05-16	Santa Fe	4812			4311235	alefernandez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.416425	2017-05-17 13:42:37.416425	1	1	2	1	\N	1	\N
84	ME-034	Hugo	Rios	40034940	1998-11-30	Alvear	5028			481341	hugorios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.504449	2017-05-17 13:42:37.504449	1	1	2	1	\N	1	\N
85	ME-035	Mario	Garcia	24654447	1976-04-08	Roca	193			4212351	mariogarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.591905	2017-05-17 13:42:37.591905	1	1	2	1	\N	1	\N
86	ME-036	Marina	Moralez	36421952	1992-08-19	Ucrania	9371			451241	marimamoralez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.668923	2017-05-17 13:42:37.668923	1	1	2	1	\N	1	\N
87	ME-037	Silvina	Portillo	26498388	1976-06-05	Av Queirel	7621			431214	silvinaportillo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.760105	2017-05-17 13:42:37.760105	1	1	2	1	\N	1	\N
88	ME-038	Maria	Maciel	33428434	1989-09-04	Paraguay	600			4761602	mariamaciel@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.87915	2017-05-17 13:42:37.87915	1	1	2	1	\N	1	\N
89	ME-039	Angeles	Granados	31452518	1981-04-09	Uruguay	12			481858	angelesgranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:37.972185	2017-05-17 13:42:37.972185	1	1	2	1	\N	1	\N
90	ME-040	Cintia	Gutierrez	29701192	1992-11-05	Av Roca	464			483498	cintiagutierrez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.05994	2017-05-17 13:42:38.05994	1	1	2	1	\N	1	\N
91	ME-041	David	Sedillo	36371823	1975-07-23	Centenario	6135			481018	davidsedillo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.149737	2017-05-17 13:42:38.149737	1	1	2	1	\N	1	\N
92	ME-042	Sofia	Garcia	25370180	1998-01-13	Las Flores	1234			409498	sofiagarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.225894	2017-05-17 13:42:38.225894	1	1	2	1	\N	1	\N
93	ME-043	Alicia	Villalba	27455263	1979-04-17	Las Palmeras	9876			420184	alivillalba@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.3056	2017-05-17 13:42:38.3056	1	1	2	1	\N	1	\N
94	ME-044	Luis	Gonzalez	36182911	1992-06-19	Las Orquideas	900			495712	luisgonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.392283	2017-05-17 13:42:38.392283	1	1	2	1	\N	1	\N
95	ME-045	Ernesto	Da Luz	30346514	1983-06-19	Rosas	2463			413048	ernestodaluz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.470773	2017-05-17 13:42:38.470773	1	1	2	1	\N	1	\N
96	ME-046	Luciano	Garcia	39019733	1996-03-13	Colon	8123			412451	lucianogarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.55976	2017-05-17 13:42:38.55976	1	1	2	1	\N	1	\N
97	ME-047	Gerardo	Cano	29232117	1980-07-19	Escuelita	9173			462093	gerardocano@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.635812	2017-05-17 13:42:38.635812	1	1	2	1	\N	1	\N
98	ME-048	Hector	Rincon	29222287	1980-05-31	Japon	2546			471927	hectorrincon@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.713656	2017-05-17 13:42:38.713656	1	1	2	1	\N	1	\N
99	ME-049	Alberto	Gonzalez	35225922	1990-02-27	Colombia	2871			431570	albertogonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.793219	2017-05-17 13:42:38.793219	1	1	2	1	\N	1	\N
100	ME-050	Roberto	Lujan	35461122	1990-05-27	Noruega	1980			401938	robertolujan@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 13:42:38.883331	2017-05-17 13:42:38.883331	1	1	2	1	\N	1	\N
101	CO-001	María Rosa	Conti	25644132	1975-07-03	Ituzaingo	245	12	B	424568	mrconti@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.319058	2017-05-17 13:43:10.319058	1	1	1	1	\N	1	\N
102	CO-002	Berta	Rivera	33958772	1989-04-11	Leandro Gómez	5886	\N	\N	4598765	brivera@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.411738	2017-05-17 13:43:10.411738	1	1	1	2	\N	1	\N
103	CO-003	Juliana	Castiglione	30444512	1980-12-09	Brisas	3280	3	20	555321	jcastiglione@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.498058	2017-05-17 13:43:10.498058	1	1	1	1	\N	1	\N
104	CO-004	Nahuel	Estevez	19423568	1966-11-28	Av. Alta Gracia	5332	\N	\N	154632108	nestevez@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.591463	2017-05-17 13:43:10.591463	1	1	1	2	\N	1	\N
105	CO-005	Pablo	Gomez	25221305	1970-03-05	Neruda	7393	8	A	154245689	pablogomez@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.677099	2017-05-17 13:43:10.677099	1	1	1	1	\N	1	\N
106	CO-006	Abigail	Coronado	37926793	1994-03-21	Florencio Varela	5659	\N	\N	432666	abigailcoronado@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.76676	2017-05-17 13:43:10.76676	1	1	1	1	\N	1	\N
107	CO-007	Hilda	Zielinski	25334991	1970-04-07	Joaquin Suarez	6863	6	15	4478909	hildazielinski@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.853167	2017-05-17 13:43:10.853167	1	1	1	1	\N	1	\N
108	CO-008	Antonio	Goncalves Melo	34008128	1989-05-29	Maldonado	2757	\N	\N	4498049	antoniogm@gmail.com	Contacto	Contacto	2017-05-17 13:43:10.945945	2017-05-17 13:43:10.945945	1	1	1	1	\N	1	\N
109	CO-009	Isabela	Correa	41889321	1997-11-04	Marejada	5656	\N	\N	4482122	isacorrea@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.030622	2017-05-17 13:43:11.030622	1	1	1	1	\N	1	\N
110	CO-010	Franco	Maur	41336729	1997-03-04	Corrientes	314	\N	\N	4498049	francomaur@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.12298	2017-05-17 13:43:11.12298	1	1	1	1	\N	1	\N
111	CO-011	Felix	Baer	30228128	1980-08-16	Maldonado	9000	\N	\N	4601406	felixbaer@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.209393	2017-05-17 13:43:11.209393	1	1	1	1	\N	1	\N
112	CO-012	Eileen	Macías Vargas	39756412	1996-01-19	Yapeyú	3778	\N	\N	497986	mercedesgarcia@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.300584	2017-05-17 13:43:11.300584	1	1	1	1	\N	1	\N
113	CO-013	Mercedes	García	34561928	1989-05-29	Maldonado	2757	\N	\N	5557120	antoniogm@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.388782	2017-05-17 13:43:11.388782	1	1	1	1	\N	1	\N
114	CO-014	Clea	Espino	24666124	1975-08-04	Tomás Guido	8740	\N	\N	4981777	cleaespino@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.474876	2017-05-17 13:43:11.474876	1	1	1	1	\N	1	\N
115	CO-015	Paul	Flores Acosta	31672155	1985-06-21	Resistencia	1813	\N	\N	4231456	paulfloresacosta@gmail.com	Contacto	Contacto	2017-05-17 13:43:11.566152	2017-05-17 13:43:11.566152	1	1	1	1	\N	1	\N
\.


--
-- Data for Name: personas_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_especialidades (id, created_at, updated_at, persona_id, especialidad_de_contacto_id) FROM stdin;
1	2017-05-17 13:43:11.665689	2017-05-17 13:43:11.665689	101	1
2	2017-05-17 13:43:11.694098	2017-05-17 13:43:11.694098	101	5
3	2017-05-17 13:43:11.7158	2017-05-17 13:43:11.7158	102	2
4	2017-05-17 13:43:11.738451	2017-05-17 13:43:11.738451	102	11
5	2017-05-17 13:43:11.759926	2017-05-17 13:43:11.759926	103	2
6	2017-05-17 13:43:11.781555	2017-05-17 13:43:11.781555	103	3
7	2017-05-17 13:43:11.804144	2017-05-17 13:43:11.804144	103	10
8	2017-05-17 13:43:11.827118	2017-05-17 13:43:11.827118	104	3
9	2017-05-17 13:43:11.849246	2017-05-17 13:43:11.849246	104	8
10	2017-05-17 13:43:11.870745	2017-05-17 13:43:11.870745	104	9
11	2017-05-17 13:43:11.893726	2017-05-17 13:43:11.893726	104	10
12	2017-05-17 13:43:11.915152	2017-05-17 13:43:11.915152	105	7
13	2017-05-17 13:43:11.93807	2017-05-17 13:43:11.93807	106	2
14	2017-05-17 13:43:11.960734	2017-05-17 13:43:11.960734	106	3
15	2017-05-17 13:43:11.981512	2017-05-17 13:43:11.981512	106	4
16	2017-05-17 13:43:12.004538	2017-05-17 13:43:12.004538	107	6
17	2017-05-17 13:43:12.026698	2017-05-17 13:43:12.026698	107	7
18	2017-05-17 13:43:12.049298	2017-05-17 13:43:12.049298	108	1
19	2017-05-17 13:43:12.07097	2017-05-17 13:43:12.07097	108	12
20	2017-05-17 13:43:12.094014	2017-05-17 13:43:12.094014	109	1
21	2017-05-17 13:43:12.1155	2017-05-17 13:43:12.1155	109	7
22	2017-05-17 13:43:12.137243	2017-05-17 13:43:12.137243	110	3
23	2017-05-17 13:43:12.160058	2017-05-17 13:43:12.160058	110	9
24	2017-05-17 13:43:12.181662	2017-05-17 13:43:12.181662	111	1
25	2017-05-17 13:43:12.204688	2017-05-17 13:43:12.204688	111	2
26	2017-05-17 13:43:12.227046	2017-05-17 13:43:12.227046	111	11
27	2017-05-17 13:43:12.248687	2017-05-17 13:43:12.248687	112	4
28	2017-05-17 13:43:12.27185	2017-05-17 13:43:12.27185	113	2
29	2017-05-17 13:43:12.294025	2017-05-17 13:43:12.294025	113	4
30	2017-05-17 13:43:12.315117	2017-05-17 13:43:12.315117	114	7
31	2017-05-17 13:43:12.33803	2017-05-17 13:43:12.33803	114	12
32	2017-05-17 13:43:12.359975	2017-05-17 13:43:12.359975	115	8
\.


--
-- Name: personas_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_especialidades_id_seq', 32, true);


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
1	2017-05-17 13:43:12.802239	2017-05-17 13:43:12.802239	1	103
2	2017-05-17 13:43:12.854059	2017-05-17 13:43:12.854059	1	104
3	2017-05-17 13:43:12.882438	2017-05-17 13:43:12.882438	1	110
4	2017-05-17 13:43:12.937535	2017-05-17 13:43:12.937535	1	115
5	2017-05-17 13:43:12.960171	2017-05-17 13:43:12.960171	2	101
6	2017-05-17 13:43:12.982598	2017-05-17 13:43:12.982598	2	108
7	2017-05-17 13:43:13.005501	2017-05-17 13:43:13.005501	2	109
8	2017-05-17 13:43:13.026854	2017-05-17 13:43:13.026854	2	111
9	2017-05-17 13:43:13.04967	2017-05-17 13:43:13.04967	2	114
10	2017-05-17 14:28:47.570721	2017-05-17 14:28:47.570721	3	102
\.


--
-- Name: personas_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_eventos_id_seq', 10, true);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 115, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-05-17 13:42:41.54127	2017-05-17 13:42:41.54127	1	51
2	2017-05-17 13:42:41.56968	2017-05-17 13:42:41.56968	1	2
3	2017-05-17 13:42:41.59092	2017-05-17 13:42:41.59092	2	2
4	2017-05-17 13:42:41.613207	2017-05-17 13:42:41.613207	2	52
5	2017-05-17 13:42:41.636516	2017-05-17 13:42:41.636516	2	53
6	2017-05-17 13:42:41.658521	2017-05-17 13:42:41.658521	3	6
7	2017-05-17 13:42:41.680423	2017-05-17 13:42:41.680423	3	54
8	2017-05-17 13:42:41.702141	2017-05-17 13:42:41.702141	3	55
9	2017-05-17 13:42:41.725211	2017-05-17 13:42:41.725211	4	6
10	2017-05-17 13:42:41.746707	2017-05-17 13:42:41.746707	4	56
11	2017-05-17 13:42:41.769734	2017-05-17 13:42:41.769734	4	57
12	2017-05-17 13:42:41.791192	2017-05-17 13:42:41.791192	5	2
13	2017-05-17 13:42:41.813274	2017-05-17 13:42:41.813274	5	58
14	2017-05-17 13:42:41.835875	2017-05-17 13:42:41.835875	5	59
15	2017-05-17 13:42:41.857576	2017-05-17 13:42:41.857576	6	2
16	2017-05-17 13:42:41.880592	2017-05-17 13:42:41.880592	6	60
17	2017-05-17 13:42:41.903133	2017-05-17 13:42:41.903133	6	61
18	2017-05-17 13:42:41.924414	2017-05-17 13:42:41.924414	6	62
19	2017-05-17 13:42:41.947697	2017-05-17 13:42:41.947697	7	6
20	2017-05-17 13:42:41.970118	2017-05-17 13:42:41.970118	7	63
21	2017-05-17 13:42:41.991996	2017-05-17 13:42:41.991996	7	64
22	2017-05-17 13:42:42.014328	2017-05-17 13:42:42.014328	8	2
23	2017-05-17 13:42:42.036186	2017-05-17 13:42:42.036186	8	65
24	2017-05-17 13:42:42.058935	2017-05-17 13:42:42.058935	9	6
25	2017-05-17 13:42:42.08043	2017-05-17 13:42:42.08043	9	66
26	2017-05-17 13:42:42.102192	2017-05-17 13:42:42.102192	9	67
27	2017-05-17 13:42:42.124879	2017-05-17 13:42:42.124879	10	2
28	2017-05-17 13:42:42.147139	2017-05-17 13:42:42.147139	10	68
29	2017-05-17 13:42:42.169953	2017-05-17 13:42:42.169953	10	69
30	2017-05-17 13:42:42.190908	2017-05-17 13:42:42.190908	10	70
31	2017-05-17 13:42:42.213283	2017-05-17 13:42:42.213283	11	71
32	2017-05-17 13:42:42.235842	2017-05-17 13:42:42.235842	11	72
33	2017-05-17 13:42:42.258712	2017-05-17 13:42:42.258712	11	8
34	2017-05-17 13:42:42.280664	2017-05-17 13:42:42.280664	12	57
35	2017-05-17 13:42:42.303306	2017-05-17 13:42:42.303306	12	65
36	2017-05-17 13:42:42.325617	2017-05-17 13:42:42.325617	12	6
37	2017-05-17 13:42:42.347576	2017-05-17 13:42:42.347576	13	96
38	2017-05-17 13:42:42.370053	2017-05-17 13:42:42.370053	13	99
39	2017-05-17 13:42:42.391422	2017-05-17 13:42:42.391422	13	8
40	2017-05-17 13:42:42.414278	2017-05-17 13:42:42.414278	14	80
41	2017-05-17 13:42:42.435875	2017-05-17 13:42:42.435875	14	100
42	2017-05-17 13:42:42.458833	2017-05-17 13:42:42.458833	14	12
43	2017-05-17 13:42:42.481016	2017-05-17 13:42:42.481016	15	89
44	2017-05-17 13:42:42.503125	2017-05-17 13:42:42.503125	15	90
45	2017-05-17 13:42:42.525405	2017-05-17 13:42:42.525405	15	92
46	2017-05-17 13:42:42.546988	2017-05-17 13:42:42.546988	15	8
47	2017-05-17 13:42:42.569982	2017-05-17 13:42:42.569982	16	65
48	2017-05-17 13:42:42.602479	2017-05-17 13:42:42.602479	16	67
49	2017-05-17 13:42:42.624964	2017-05-17 13:42:42.624964	16	77
50	2017-05-17 13:42:42.657846	2017-05-17 13:42:42.657846	16	6
51	2017-05-17 13:42:42.681254	2017-05-17 13:42:42.681254	17	96
52	2017-05-17 13:42:42.725992	2017-05-17 13:42:42.725992	17	97
53	2017-05-17 13:42:42.747213	2017-05-17 13:42:42.747213	17	2
54	2017-05-17 13:42:42.780262	2017-05-17 13:42:42.780262	18	75
55	2017-05-17 13:42:42.850085	2017-05-17 13:42:42.850085	18	76
56	2017-05-17 13:42:42.870041	2017-05-17 13:42:42.870041	18	77
57	2017-05-17 13:42:42.89117	2017-05-17 13:42:42.89117	18	14
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 57, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-05-17 13:42:28.847378	2017-05-17 13:42:28.847378	1
2	Corrientes	2017-05-17 13:42:28.869618	2017-05-17 13:42:28.869618	1
3	Itapúa	2017-05-17 13:42:28.891568	2017-05-17 13:42:28.891568	2
4	Bahia	2017-05-17 13:42:28.914142	2017-05-17 13:42:28.914142	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-05-17 13:42:40.265182	2017-05-17 13:42:40.265182	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-05-17 13:42:40.344292	2017-05-17 13:42:40.344292	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-05-17 13:42:40.422373	2017-05-17 13:42:40.422373	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-05-17 13:42:40.498956	2017-05-17 13:42:40.498956	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-05-17 13:42:40.563852	2017-05-17 13:42:40.563852	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-05-17 13:42:40.644297	2017-05-17 13:42:40.644297	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-05-17 13:42:40.708332	2017-05-17 13:42:40.708332	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-05-17 13:42:40.775619	2017-05-17 13:42:40.775619	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-05-17 13:42:40.852065	2017-05-17 13:42:40.852065	1	1	1	1	1
11	PR-011	Percentil	Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para hacerlo en escala y poder ganar dinero con ello.	España	422			4590432	percentil@gmail.com	percentil.com	2017-05-17 13:42:40.920023	2017-05-17 13:42:40.920023	1	1	1	1	1
12	PR-012	EmbryoTools	 Son una referencia mundial en reproducción asistida. Trabajan en cuatro ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos, porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de los productos que vayan a entrar en contacto con embriones humanos y por último trabajan en la reproducción asistida en veterinaria.	Mariano Moreno	4122			465888	embryotools@gmail.com	embryotools.com	2017-05-17 13:42:41.00078	2017-05-17 13:42:41.00078	1	1	1	1	1
13	PR-013	Aplázame	 Es un método de pago que se integra en el proceso de compra del comercio electrónico y permite a los clientes de las tiendas online comprar con un crédito instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando para hacerlo en breve.	Av. San Martin	4532			453222	aplazame@gmail.com	aplazame.com	2017-05-17 13:42:41.077633	2017-05-17 13:42:41.077633	1	1	1	1	1
14	PR-014	BrioAgro Technologies	Deesarrollo de una tecnología para que el agricultor controle su explotación. El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor, a través de su dispositivo, se conecta a la nube para acceder a la información de su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier cambio en sus variables.	Colon 	555			4651244	bioagro@gmail.com	bioagro.com	2017-05-17 13:42:41.155805	2017-05-17 13:42:41.155805	1	1	1	1	1
15	PR-015	Braingaze	La tecnología desarrollada detecta un pequeño movimiento ocular que permite determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y dislexia.	Miami	708			490123	baringaze@gmail.com	braingaze.com	2017-05-17 13:42:41.233925	2017-05-17 13:42:41.233925	1	1	1	1	1
16	PR-016	CreatorStats	Mejoran la métrica de los ‘youtubers’.	Inglaterra	200			15432510	creatorstats@gmail.com	creatorstats.com	2017-05-17 13:42:41.308076	2017-05-17 13:42:41.308076	1	1	1	1	1
17	PR-017	Alzhup	Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología como vehículo para que la solución sea accesible a todo el mundo. Implementan a nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados científicamente. Y también, herramientas para la memoria, capaces de personalizar dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro almacena los recuerdos y que difiere de los sistemas actuales computarizados.	Constitucion	2222			467632	alzhup@gmail.com	alzhup.com	2017-05-17 13:42:41.375845	2017-05-17 13:42:41.375845	1	1	1	1	1
18	PR-018	Axter Aerospace	Están desarrollando un sistema de propulsión híbrida para las avionetas, que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU. De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción y ensamblado.	Ayacucho	9200			432111	axteraerospace@gmail.com	axteraerospace.com	2017-05-17 13:42:41.451844	2017-05-17 13:42:41.451844	1	1	1	1	1
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-05-17 13:42:40.179696	2017-05-17 14:21:49.525093	1	1	1	3	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 18, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-05-17 13:42:49.641948	2017-05-17 13:42:49.641948
2	super_admin	2017-05-17 13:42:49.661158	2017-05-17 13:42:49.661158
3	Encargado de Proyectos (mentor)	2017-05-17 13:42:49.683535	2017-05-17 13:42:49.683535
4	Miembro de Equipo	2017-05-17 13:42:49.705678	2017-05-17 13:42:49.705678
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-05-17 13:42:29.721329	2017-05-17 13:42:29.721329	1
2	Encargado de recaudaciones e ingresos	2017-05-17 13:42:29.78427	2017-05-17 13:42:29.78427	1
3	Jefe de Recursos Humanos	2017-05-17 13:42:29.836449	2017-05-17 13:42:29.836449	2
4	Jefe de mercadeo	2017-05-17 13:42:29.891827	2017-05-17 13:42:29.891827	3
5	jefe de producción	2017-05-17 13:42:29.937111	2017-05-17 13:42:29.937111	3
6	Investigación y desarrollo	2017-05-17 13:42:29.99198	2017-05-17 13:42:29.99198	4
7	Capacitación - Mentoring	2017-05-17 13:42:30.047586	2017-05-17 13:42:30.047586	4
8	Director General	2017-05-17 13:42:30.104741	2017-05-17 13:42:30.104741	5
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
20170507233737
20170515071904
\.


--
-- Data for Name: systemsettings; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY systemsettings (id, numero_abandono, tiempo_abandono, tipo_de_pago_id, created_at, updated_at) FROM stdin;
1	5	minutes	4	2017-05-17 13:42:58.782427	2017-05-17 13:42:58.782427
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, true);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-05-17 13:42:29.244805	2017-05-17 13:42:29.244805
2	Libreta de Enrolamiento	2017-05-17 13:42:29.27051	2017-05-17 13:42:29.27051
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-05-17 13:42:58.508822	2017-05-17 13:42:58.508822
2	Tarjeta de crédito Visa	2017-05-17 13:42:58.562019	2017-05-17 13:42:58.562019
3	Tarjeta Naranja	2017-05-17 13:42:58.606187	2017-05-17 13:42:58.606187
4	Saldo de cuenta	2017-05-17 13:42:58.66115	2017-05-17 13:42:58.66115
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	0	\N	\N	\N	\N	2017-05-17 13:42:50.452824	2017-05-17 13:42:50.452824	1	2
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-05-17 13:42:50.70612	2017-05-17 13:42:50.70612	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-05-17 13:42:50.961466	2017-05-17 13:42:50.961466	2	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-05-17 13:42:59.696722	2017-05-17 13:42:59.696722	1	1
2	2017-01-20	2017-05-17 13:42:59.72304	2017-05-17 13:42:59.72304	1	1
3	2017-02-10	2017-05-17 13:42:59.746236	2017-05-17 13:42:59.746236	2	1
4	2017-02-20	2017-05-17 13:42:59.769106	2017-05-17 13:42:59.769106	2	1
5	2017-03-10	2017-05-17 13:42:59.790434	2017-05-17 13:42:59.790434	3	1
6	2017-03-20	2017-05-17 13:42:59.81346	2017-05-17 13:42:59.81346	3	1
7	2017-04-10	2017-05-17 13:42:59.834801	2017-05-17 13:42:59.834801	4	1
8	2017-04-20	2017-05-17 13:42:59.858113	2017-05-17 13:42:59.858113	4	1
9	2017-05-10	2017-05-17 13:42:59.880109	2017-05-17 13:42:59.880109	5	1
10	2017-05-20	2017-05-17 13:42:59.902714	2017-05-17 13:42:59.902714	5	1
11	2017-06-10	2017-05-17 13:42:59.924196	2017-05-17 13:42:59.924196	6	1
12	2017-06-20	2017-05-17 13:42:59.945485	2017-05-17 13:42:59.945485	6	1
13	2017-07-10	2017-05-17 13:42:59.969192	2017-05-17 13:42:59.969192	7	1
14	2017-07-20	2017-05-17 13:42:59.990708	2017-05-17 13:42:59.990708	7	1
15	2017-08-10	2017-05-17 13:43:00.013373	2017-05-17 13:43:00.013373	8	1
16	2017-08-20	2017-05-17 13:43:00.035017	2017-05-17 13:43:00.035017	8	1
17	2017-09-10	2017-05-17 13:43:00.058247	2017-05-17 13:43:00.058247	9	1
18	2017-09-20	2017-05-17 13:43:00.0804	2017-05-17 13:43:00.0804	9	1
19	2017-10-10	2017-05-17 13:43:00.101273	2017-05-17 13:43:00.101273	10	1
20	2017-10-20	2017-05-17 13:43:00.123571	2017-05-17 13:43:00.123571	10	1
21	2017-11-10	2017-05-17 13:43:00.14703	2017-05-17 13:43:00.14703	11	1
22	2017-11-20	2017-05-17 13:43:00.168688	2017-05-17 13:43:00.168688	11	1
23	2017-12-10	2017-05-17 13:43:00.19056	2017-05-17 13:43:00.19056	12	1
24	2017-12-20	2017-05-17 13:43:00.214003	2017-05-17 13:43:00.214003	12	1
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
-- Name: index_pagos_on_contrato_id; Type: INDEX; Schema: public; Owner: ana; Tablespace: 
--

CREATE INDEX index_pagos_on_contrato_id ON pagos USING btree (contrato_id);


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
-- Name: fk_rails_b2192763e9; Type: FK CONSTRAINT; Schema: public; Owner: ana
--

ALTER TABLE ONLY pagos
    ADD CONSTRAINT fk_rails_b2192763e9 FOREIGN KEY (contrato_id) REFERENCES contratos(id);


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

