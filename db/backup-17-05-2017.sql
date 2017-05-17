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
1	Crear	create	2017-05-16 07:04:32.361132	2017-05-16 07:04:32.361132
2	Eliminar	destroy	2017-05-16 07:04:32.441277	2017-05-16 07:04:32.441277
3	Ver	show	2017-05-16 07:04:32.6945	2017-05-16 07:04:32.6945
4	Index	index	2017-05-16 07:04:32.733679	2017-05-16 07:04:32.733679
5	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-05-16 07:04:32.756756	2017-05-16 07:04:32.756756
6	Editar	update	2017-05-16 07:04:32.791886	2017-05-16 07:04:32.791886
7	Estadisticas	estadistica	2017-05-16 07:04:32.823537	2017-05-16 07:04:32.823537
8	Auditorias	auditorias	2017-05-16 07:04:32.856846	2017-05-16 07:04:32.856846
9	Ver PDF	pdf	2017-05-16 07:04:32.890976	2017-05-16 07:04:32.890976
10	Descargar hoja de cálculo	calculo	2017-05-16 07:04:32.923615	2017-05-16 07:04:32.923615
11	PDF del modelo	model_pdf	2017-05-16 07:04:32.956768	2017-05-16 07:04:32.956768
12	Hoja de cálculo del Modelo	model_calculo	2017-05-16 07:04:32.992625	2017-05-16 07:04:32.992625
13	Ver cuotas atrasadas	cuotas_atrasadas	2017-05-16 07:04:33.024546	2017-05-16 07:04:33.024546
14	Ver proyectos en posible estado de abandono	proyectos_abandonados	2017-05-16 07:04:33.058267	2017-05-16 07:04:33.058267
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 14, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	\N	2017-05-16 07:04:28.767876	2017-05-16 07:04:28.767876	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-05-16 07:04:28.842348	2017-05-16 07:04:28.842348	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-05-16 07:04:28.922105	2017-05-16 07:04:28.922105	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-05-16 07:04:28.987782	2017-05-16 07:04:28.987782	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-05-16 07:04:29.104736	2017-05-16 07:04:29.104736	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-05-16 07:04:29.169395	2017-05-16 07:04:29.169395	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-05-16 07:04:29.230246	2017-05-16 07:04:29.230246	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-05-16 07:04:29.285689	2017-05-16 07:04:29.285689	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-05-16 07:04:29.344323	2017-05-16 07:04:29.344323	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-05-16 07:04:29.403954	2017-05-16 07:04:29.403954	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-05-16 07:04:29.473721	2017-05-16 07:04:29.473721	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-05-16 07:04:40.849568	2017-05-16 07:04:40.849568	1	1	3
2	\N	2017-05-16 07:04:40.906685	2017-05-16 07:04:40.906685	1	2	3
3	\N	2017-05-16 07:04:40.963343	2017-05-16 07:04:40.963343	1	3	2
4	\N	2017-05-16 07:04:41.018876	2017-05-16 07:04:41.018876	2	1	3
5	\N	2017-05-16 07:04:41.06551	2017-05-16 07:04:41.06551	2	2	3
6	\N	2017-05-16 07:04:41.120308	2017-05-16 07:04:41.120308	2	3	2
7	\N	2017-05-16 07:04:41.174368	2017-05-16 07:04:41.174368	3	1	3
8	\N	2017-05-16 07:04:41.219301	2017-05-16 07:04:41.219301	3	2	3
9	\N	2017-05-16 07:04:41.27709	2017-05-16 07:04:41.27709	3	3	2
10	\N	2017-05-16 07:04:41.33139	2017-05-16 07:04:41.33139	4	1	3
11	\N	2017-05-16 07:04:41.375132	2017-05-16 07:04:41.375132	4	2	3
12	\N	2017-05-16 07:04:41.420689	2017-05-16 07:04:41.420689	4	3	2
13	\N	2017-05-16 07:04:41.476106	2017-05-16 07:04:41.476106	5	1	3
14	\N	2017-05-16 07:04:41.519489	2017-05-16 07:04:41.519489	5	2	3
15	\N	2017-05-16 07:04:41.565055	2017-05-16 07:04:41.565055	5	3	2
16	\N	2017-05-16 07:04:41.620501	2017-05-16 07:04:41.620501	6	1	3
17	\N	2017-05-16 07:04:41.663922	2017-05-16 07:04:41.663922	6	2	3
18	\N	2017-05-16 07:04:41.707908	2017-05-16 07:04:41.707908	6	3	2
19	\N	2017-05-16 07:04:41.752626	2017-05-16 07:04:41.752626	7	1	3
20	\N	2017-05-16 07:04:41.797052	2017-05-16 07:04:41.797052	7	2	3
21	\N	2017-05-16 07:04:41.841973	2017-05-16 07:04:41.841973	7	3	2
22	\N	2017-05-16 07:04:41.897081	2017-05-16 07:04:41.897081	8	1	3
23	\N	2017-05-16 07:04:41.941632	2017-05-16 07:04:41.941632	8	2	3
24	\N	2017-05-16 07:04:41.986063	2017-05-16 07:04:41.986063	8	3	2
25	\N	2017-05-16 07:04:42.030721	2017-05-16 07:04:42.030721	9	1	3
26	\N	2017-05-16 07:04:42.074808	2017-05-16 07:04:42.074808	9	2	3
27	\N	2017-05-16 07:04:42.119857	2017-05-16 07:04:42.119857	9	3	2
28	\N	2017-05-16 07:04:42.165506	2017-05-16 07:04:42.165506	10	1	3
29	\N	2017-05-16 07:04:42.220743	2017-05-16 07:04:42.220743	10	2	3
30	\N	2017-05-16 07:04:42.26459	2017-05-16 07:04:42.26459	10	3	2
31	\N	2017-05-16 07:04:42.308508	2017-05-16 07:04:42.308508	11	1	3
32	\N	2017-05-16 07:04:42.353449	2017-05-16 07:04:42.353449	11	2	3
33	\N	2017-05-16 07:04:42.408884	2017-05-16 07:04:42.408884	11	3	2
34	\N	2017-05-16 07:04:42.452997	2017-05-16 07:04:42.452997	12	1	3
35	\N	2017-05-16 07:04:42.532638	2017-05-16 07:04:42.532638	12	2	3
36	\N	2017-05-16 07:04:42.586984	2017-05-16 07:04:42.586984	12	3	2
37	\N	2017-05-16 07:04:42.643302	2017-05-16 07:04:42.643302	13	1	3
38	\N	2017-05-16 07:04:42.69881	2017-05-16 07:04:42.69881	13	2	3
39	\N	2017-05-16 07:04:42.752843	2017-05-16 07:04:42.752843	13	3	2
40	\N	2017-05-16 07:04:42.79788	2017-05-16 07:04:42.79788	14	1	3
41	\N	2017-05-16 07:04:42.853477	2017-05-16 07:04:42.853477	14	2	3
42	\N	2017-05-16 07:04:42.897494	2017-05-16 07:04:42.897494	14	3	2
43	\N	2017-05-16 07:04:42.953744	2017-05-16 07:04:42.953744	15	1	3
44	\N	2017-05-16 07:04:43.010073	2017-05-16 07:04:43.010073	15	2	3
45	\N	2017-05-16 07:04:43.054613	2017-05-16 07:04:43.054613	15	3	2
46	\N	2017-05-16 07:04:43.108233	2017-05-16 07:04:43.108233	16	1	3
47	\N	2017-05-16 07:04:43.153466	2017-05-16 07:04:43.153466	16	2	3
48	\N	2017-05-16 07:04:43.197482	2017-05-16 07:04:43.197482	16	3	2
49	\N	2017-05-16 07:04:43.253063	2017-05-16 07:04:43.253063	17	1	3
50	\N	2017-05-16 07:04:43.298094	2017-05-16 07:04:43.298094	17	2	3
51	\N	2017-05-16 07:04:43.353295	2017-05-16 07:04:43.353295	17	3	2
52	\N	2017-05-16 07:04:43.410148	2017-05-16 07:04:43.410148	18	1	3
53	\N	2017-05-16 07:04:43.486863	2017-05-16 07:04:43.486863	18	2	3
54	\N	2017-05-16 07:04:43.541959	2017-05-16 07:04:43.541959	18	3	2
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 54, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-05-16 07:04:18.720007	2017-05-16 07:04:18.720007
2	Rural	2017-05-16 07:04:18.748871	2017-05-16 07:04:18.748871
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
384	1	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-16\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	b18e8cad-270b-4f4a-8350-91a3e5382ad8	2017-05-16 10:12:35.385102
385	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 1\n	2	\N	127.0.0.1	b18e8cad-270b-4f4a-8350-91a3e5382ad8	2017-05-16 10:12:35.454602
386	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	b18e8cad-270b-4f4a-8350-91a3e5382ad8	2017-05-16 10:12:35.507874
387	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 12.0\n	2	\N	127.0.0.1	b18e8cad-270b-4f4a-8350-91a3e5382ad8	2017-05-16 10:12:35.55777
388	2	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-16\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	af5f40a5-bdd4-4bb3-905b-7b03258bf0c7	2017-05-16 10:16:08.928523
389	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 2\n	2	\N	127.0.0.1	af5f40a5-bdd4-4bb3-905b-7b03258bf0c7	2017-05-16 10:16:08.977375
390	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	af5f40a5-bdd4-4bb3-905b-7b03258bf0c7	2017-05-16 10:16:09.019793
391	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 12.0\n- 324.0\n	3	\N	127.0.0.1	af5f40a5-bdd4-4bb3-905b-7b03258bf0c7	2017-05-16 10:16:09.056703
376	18	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 11\nevento_id: 2\n	1	\N	\N	3258c726-612d-4943-9e77-992729e30450	2017-05-16 07:05:02.671556
377	19	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 12\nevento_id: 2\n	1	\N	\N	717b199d-1157-4536-9c48-da96537b5d4d	2017-05-16 07:05:02.725508
159	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	0b3769fc-ca54-42f4-9df8-8e5a3d1ef88d	2017-05-16 07:04:41.349148
118	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: \netapa_id: 1\n	1	\N	\N	c528ad5b-de48-4907-b4b4-b9c64ff43995	2017-05-16 07:04:28.796361
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	22463269-a55d-4de0-b743-298c947470e2	2017-05-16 07:04:18.975781
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	2ac4f24c-d98a-45af-ba56-cb628a7c5ac8	2017-05-16 07:04:19.065701
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	5437915a-7f81-4a09-a33e-423fdd25ca10	2017-05-16 07:04:19.125211
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	f499542f-f2d3-4618-89f8-afabdac030bd	2017-05-16 07:04:19.17302
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	6d249bc2-fa90-414e-a056-79c0c9337403	2017-05-16 07:04:19.218032
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	f566f913-9a9c-4162-a27d-58b101eaa416	2017-05-16 07:04:19.317969
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	13ff47d8-f805-4f45-90c4-85dbf80e7b6e	2017-05-16 07:04:19.366003
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	61b7c8e2-dc89-4aa1-889f-aaf31b60e347	2017-05-16 07:04:19.412778
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	11e23538-1f31-4e4d-8873-35616a521426	2017-05-16 07:04:19.469034
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	aec86a17-c5b1-4d20-a956-f8f4a80a7452	2017-05-16 07:04:19.521267
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	5e873bdc-0a4b-459e-bd5c-c8a57f9f085b	2017-05-16 07:04:19.566328
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	ec97e4ad-7fb0-4904-8e5e-e239383de202	2017-05-16 07:04:19.610721
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	230de8da-6e64-42a8-a1c9-715199eb90d9	2017-05-16 07:04:19.665329
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	624dc38b-d4fa-4fb1-a639-a11c3f572566	2017-05-16 07:04:19.948124
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	de5547d8-4e43-40a6-9b28-4f09467a128b	2017-05-16 07:04:20.033097
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	756ad372-932f-4a40-b183-2efdba1802fc	2017-05-16 07:04:20.118829
359	1	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 4\nevento_id: 1\n	1	\N	\N	db053309-08ea-4324-b851-6ca9277b094a	2017-05-16 07:05:01.656107
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	1a15cb79-5d5e-4459-b678-01560e226dd7	2017-05-16 07:04:20.200053
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	d005e28c-42cd-4bd9-ac23-d6b2377c7d7e	2017-05-16 07:04:20.275453
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	0a5f08f1-1a39-4c98-b687-956a28227c85	2017-05-16 07:04:20.360734
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-007\nnombre: Maria\napellido: Gonzalez\nnroIdentificacion: '36134076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mg@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	9a93323b-1d8f-4718-b9ca-535b74dbe619	2017-05-16 07:04:20.441969
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-008\nnombre: Elena\napellido: Ceballos\nnroIdentificacion: '25198461'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: ec@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4c479c36-3887-4eaf-baf4-c3a602578130	2017-05-16 07:04:20.521233
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-009\nnombre: Alberto\napellido: Padilla\nnroIdentificacion: '33843657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: ap@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	b44d090b-7264-4093-bb2e-f23c8ce8c649	2017-05-16 07:04:20.598905
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-010\nnombre: Fernando\napellido: Gonzalez\nnroIdentificacion: '33980912'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: fg@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	f2a110fd-53d8-441c-b1c7-8a2a77e1753e	2017-05-16 07:04:20.682658
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-011\nnombre: Tiago\napellido: Gonzalez\nnroIdentificacion: '38187222'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: tiagogonzales@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	17de0f0c-2f2a-427b-9317-f09a439efb15	2017-05-16 07:04:20.765434
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-012\nnombre: Cintia\napellido: Castro\nnroIdentificacion: '22612413'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cintiacastro@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	65cb4ebe-4e37-4a82-86bf-283ae701e11c	2017-05-16 07:04:20.847248
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-013\nnombre: Josefina\napellido: Jardin\nnroIdentificacion: '36025176'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: josefinajardin@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	0c62b818-6348-4e97-a6b9-6df8cb8ff7ec	2017-05-16 07:04:20.934958
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-014\nnombre: Diana\napellido: Rivas\nnroIdentificacion: '25948001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: dianarivas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	567e51a6-220b-45ff-81c6-086c4a9fa6cd	2017-05-16 07:04:21.010511
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-015\nnombre: Dario\napellido: Gonzalez\nnroIdentificacion: '33880019'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: dariogonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	3ebb4924-e9a0-4c0b-88a6-26c332fd4e83	2017-05-16 07:04:21.090372
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-016\nnombre: Ciro\napellido: Zamora\nnroIdentificacion: '33983707'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: cirozamora@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	67f3e2a1-ed6a-4c31-a92f-3f8351b22423	2017-05-16 07:04:21.177478
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-017\nnombre: Zoe\napellido: Vazquez\nnroIdentificacion: '3818104'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoevazquez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	e115ae75-c920-452a-b546-b95791f5bac8	2017-05-16 07:04:21.256315
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-018\nnombre: Cristian\napellido: Gonzalez\nnroIdentificacion: '22659193'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cristiangonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	347921d0-c7f6-499f-b441-117bcf6db475	2017-05-16 07:04:21.332459
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-019\nnombre: Ana\napellido: Manfrin\nnroIdentificacion: '36222076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: anamanfrin@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	5ab10626-1c5a-4369-bbff-62683797fe01	2017-05-16 07:04:21.412921
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-020\nnombre: Martina\napellido: Adamo\nnroIdentificacion: '25841001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaadamo@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	9d254921-36ac-4084-a972-fd87d495d138	2017-05-16 07:04:21.497337
160	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a889b2b7-c2f3-4e02-9c46-0629966d3843	2017-05-16 07:04:41.393297
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-021\nnombre: Roberto\napellido: Milani\nnroIdentificacion: '33880333'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: robertomilani@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	daf307c8-531b-4c47-bbca-f6bc7b2232a3	2017-05-16 07:04:21.580409
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-022\nnombre: Victor\napellido: Gonzalez\nnroIdentificacion: '33984447'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorgonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	cce39b37-3b7b-43c2-b457-663430aa4984	2017-05-16 07:04:21.667898
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-023\nnombre: Alejandro\napellido: Cambril\nnroIdentificacion: '38113409'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: alejandrocambril@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	721bf77d-317a-4b21-8ccc-f5c2e34cbca7	2017-05-16 07:04:21.745221
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-024\nnombre: Luis\napellido: Rizzo\nnroIdentificacion: '22543493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luisrizzo@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	627668ee-54fe-4570-906f-b50d75a14483	2017-05-16 07:04:21.822517
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-025\nnombre: Mario\napellido: Rosas\nnroIdentificacion: '36060986'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mariorosas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	6b5ffb88-0f1f-411d-b97c-95bafe452907	2017-05-16 07:04:21.90236
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-026\nnombre: Analia\napellido: Granados\nnroIdentificacion: '25131701'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: analiagranados@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	0006e0fb-acba-4e66-96c5-0f7014c4572d	2017-05-16 07:04:22.003626
40	27	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-027\nnombre: Leonor\napellido: Gonzalez\nnroIdentificacion: '33888717'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: leonorgonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	23079be2-9a85-47c1-a8d3-5c913bf4e13e	2017-05-16 07:04:22.089371
41	28	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-028\nnombre: Victor\napellido: Baresi\nnroIdentificacion: '33928407'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorbaresi@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	0ce31261-c574-4f0f-ab22-7fcf95425426	2017-05-16 07:04:22.167496
42	29	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-029\nnombre: Silvana\napellido: Lazzaga\nnroIdentificacion: '38918849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: silvanalazzaga@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	568fa579-d545-4767-98ec-ec43da92ee6d	2017-05-16 07:04:22.245417
43	30	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-030\nnombre: Juana\napellido: Calabrese\nnroIdentificacion: '220192493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: janacalabrese@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	60655eb7-520c-4b22-8b7b-3568c3d98cfa	2017-05-16 07:04:22.335248
184	35	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	5ebac5f6-5c38-4836-894c-31b1d9f93f71	2017-05-16 07:04:42.553346
44	31	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-031\nnombre: Juliana\napellido: Lombardi\nnroIdentificacion: '38613849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: julianalombardi@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	af303953-fe8c-4169-accc-d4ec324a386a	2017-05-16 07:04:22.422752
45	32	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-032\nnombre: Enrique\napellido: Cano\nnroIdentificacion: '22451493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: enriquecano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	6eca1188-6d58-4c37-ac1d-d3db90496b72	2017-05-16 07:04:22.51103
46	33	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-033\nnombre: Gilda\napellido: Lombarde\nnroIdentificacion: '36064356'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: gildalombarde@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	b930f2c4-463a-4a04-81dd-f7efab103dc2	2017-05-16 07:04:22.589311
47	34	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-034\nnombre: Martin\napellido: Bande\nnroIdentificacion: '25124501'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinbande@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	aa8704bf-3ba9-4bc9-9caa-b3267c0f60c1	2017-05-16 07:04:22.677556
48	35	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-035\nnombre: Gabriel\napellido: Ferruccio\nnroIdentificacion: '33451657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: gabrielferuccio@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	9f1d2e3a-85f8-48e8-8ece-011e29338e32	2017-05-16 07:04:22.755377
49	36	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-036\nnombre: Juan\napellido: Mazzanti\nnroIdentificacion: '33956107'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: juanmazzanti@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	c7a49987-7527-4553-951d-d9fdd87f2845	2017-05-16 07:04:22.835896
119	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	c9c1dd7a-3b90-404e-822a-af0361435438	2017-05-16 07:04:28.868202
50	37	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-037\nnombre: Karina\napellido: Fiorentino\nnroIdentificacion: '38663849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: karinafiorentino@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	2deefe54-3668-443e-93c9-c31aace83cc1	2017-05-16 07:04:22.923372
51	38	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-038\nnombre: Osvaldo\napellido: Pagnotto\nnroIdentificacion: '22019493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: osvaldopagnotto@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4a00e89e-d9e8-499f-98de-fe80570e24b0	2017-05-16 07:04:23.000936
52	39	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-039\nnombre: Margarita\napellido: Giordano\nnroIdentificacion: '36068886'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: margaritagiordano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	88582498-3b85-4581-8e47-ce1c3b146288	2017-05-16 07:04:23.079275
53	40	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-040\nnombre: Rosa\napellido: Napolitano\nnroIdentificacion: '2576401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: rosanapolitano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	06344630-6011-4470-b5b7-1bfc6c8ea9d8	2017-05-16 07:04:23.158621
54	41	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-041\nnombre: Magdalena\napellido: Bruno\nnroIdentificacion: '38817849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: mardalenabruno@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	3862bbed-eaf0-43f1-a281-6fa97f71f381	2017-05-16 07:04:23.245537
55	42	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-042\nnombre: Mauricio\napellido: Costa\nnroIdentificacion: '22755493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: mauriciocosta@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	57ee8521-d7b2-46f8-801a-302ed6c7dc43	2017-05-16 07:04:23.322905
56	43	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-043\nnombre: Ivan\napellido: Costas\nnroIdentificacion: '36755076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: ivancostas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	4c8377a1-b8ab-46c7-9994-6773f0d317f3	2017-05-16 07:04:23.39997
57	44	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-044\nnombre: Pablo\napellido: Davide\nnroIdentificacion: '251934401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: pablodavide@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	de96ae80-ff97-4fbd-8574-53d9e1bf084d	2017-05-16 07:04:23.47785
58	45	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-045\nnombre: Nicolas\napellido: Medina\nnroIdentificacion: '33801927'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: nicolasmedina@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	e4d3a4fb-3f61-4749-91f4-f8960ab1b179	2017-05-16 07:04:23.559095
59	46	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-046\nnombre: Celeste\napellido: Milano\nnroIdentificacion: '35122307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: celestemilano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	978d6082-a9a4-40e0-a913-444bbf969484	2017-05-16 07:04:23.645138
60	47	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-047\nnombre: Sebastian\napellido: Schiavone\nnroIdentificacion: '38175649'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: sebastianschiavone@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	fdaea4b8-8e1c-4a90-8360-680e102fcf46	2017-05-16 07:04:23.727855
185	36	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	3f55c261-9443-41f2-be3a-2b91336889cd	2017-05-16 07:04:42.606414
61	48	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-048\nnombre: Ruben\napellido: Almedina\nnroIdentificacion: '22891493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: rubenalmedina@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	dc6b2b7a-fe75-4f41-8a87-3885e63798bf	2017-05-16 07:04:23.814461
62	49	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-049\nnombre: Cristian\napellido: Camiño\nnroIdentificacion: '36093716'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: cristiancamiño@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	a307d3aa-77af-4493-89e1-03ce87aae9cc	2017-05-16 07:04:23.897506
63	50	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-050\nnombre: Monica\napellido: Conti\nnroIdentificacion: '25888001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: monicaconti@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	ded26537-7da3-4c35-b6a7-3a0aec6d0a82	2017-05-16 07:04:23.982197
64	51	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f563f14d-5848-4562-88ea-9906f03172b0	2017-05-16 07:04:24.125761
65	52	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	40682511-1f42-4d71-a8cc-057d996fb3d0	2017-05-16 07:04:24.255297
120	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	77fb6c32-fbbf-48d6-9839-c22ca8935309	2017-05-16 07:04:28.945944
66	53	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	92560a38-8736-491f-80fc-3e0f038d664c	2017-05-16 07:04:24.339574
67	54	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3d128ffb-ac4b-4406-8913-4a4e7fd32720	2017-05-16 07:04:24.427534
68	55	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a2178c87-66ac-4ac7-ba9f-a20e47d06565	2017-05-16 07:04:24.512713
69	56	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	120861d8-4de3-4994-8101-c155a913d011	2017-05-16 07:04:24.5909
70	57	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a146fe24-747c-4ae4-8764-773101e0e97c	2017-05-16 07:04:24.668507
71	58	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fafddeac-f1c5-46bc-94d3-ae9d7f14cd3d	2017-05-16 07:04:24.748575
72	59	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1a4de770-c089-45aa-a1e4-7a0c848af80d	2017-05-16 07:04:24.834455
73	60	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	586a1c81-0bbe-4dbe-82d2-a4d1beb15b72	2017-05-16 07:04:24.915297
74	61	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2327c416-34e4-4161-a4e0-7d6bbd3d506f	2017-05-16 07:04:25.003454
75	62	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6d036ca4-c686-40e9-b85c-07a74c0775f7	2017-05-16 07:04:25.089543
76	63	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c1a9415e-271d-4a5e-bf1e-42975a25a4a6	2017-05-16 07:04:25.169187
77	64	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9211be6b-4596-4f05-afbf-30f1edc34dd9	2017-05-16 07:04:25.246113
186	37	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	5cd22984-dbee-4a89-b283-d587d0ac521e	2017-05-16 07:04:42.66296
78	65	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	40959c0d-1cb4-41a8-96d5-4b0499975eff	2017-05-16 07:04:25.323982
79	66	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	71e94208-b672-4e47-a6af-ad1dd5196299	2017-05-16 07:04:25.402304
80	67	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fc2411be-3615-4f08-8e44-d70d8b80b6a3	2017-05-16 07:04:25.480945
81	68	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	98b7754f-98e0-43de-8a79-b55688aafd8b	2017-05-16 07:04:25.563988
121	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	577cb837-ed22-47ce-916e-789175cac186	2017-05-16 07:04:29.007526
82	69	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4e1aa379-6c5a-4f1e-be96-2694412c9dd6	2017-05-16 07:04:25.649569
83	70	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	920a1fe6-72b0-44b0-80bc-3e22ff5d7847	2017-05-16 07:04:25.733951
84	71	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-021\nnombre: Lidia\napellido: Delucci\nnroIdentificacion: '28088944'\nfechaNacimiento: 1981-01-29\ncalle: Chile\nnroDomicilio: '6144'\npiso: ''\ndpto: ''\ntelefono: '481898'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	87b2a63a-238b-4527-8ffe-1faf3271e6e9	2017-05-16 07:04:25.815937
85	72	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-022\nnombre: Leonor\napellido: Gomez Santos\nnroIdentificacion: '40560231'\nfechaNacimiento: 1996-03-13\ncalle: Plaza Mayor\nnroDomicilio: '2637'\npiso: ''\ndpto: ''\ntelefono: '4536662'\nemail: leonorgs@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5f7b8ff5-808f-4dac-9f66-a8060d46be45	2017-05-16 07:04:25.899989
86	73	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-023\nnombre: Lara\napellido: Gonçalves\nnroIdentificacion: '29075344'\nfechaNacimiento: 1980-07-19\ncalle: España\nnroDomicilio: '1415'\npiso: ''\ndpto: ''\ntelefono: '4498457'\nemail: laragoncalves@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1b8ddbc6-3f91-4626-b65b-f7e695f5182e	2017-05-16 07:04:25.982942
87	74	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-024\nnombre: Martin\napellido: Diaz\nnroIdentificacion: '26070390'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: martindiaz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	139c28c4-c516-4213-a449-ce22c519bd5e	2017-05-16 07:04:26.070135
88	75	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-025\nnombre: Marina\napellido: Diaz\nnroIdentificacion: '26070394'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: marinadiaz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	70445b75-8a7e-44ed-b7e6-60b172a633f4	2017-05-16 07:04:26.158333
89	76	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-026\nnombre: Gerardo\napellido: Urbina\nnroIdentificacion: '29234987'\nfechaNacimiento: 1980-05-31\ncalle: "Álamo"\nnroDomicilio: '6162'\npiso: ''\ndpto: ''\ntelefono: '455433'\nemail: gerardou@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	542f6795-7435-4e0f-9703-8badfcdc9474	2017-05-16 07:04:26.251419
90	77	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-027\nnombre: Silvio\napellido: Quiroz\nnroIdentificacion: '35465922'\nfechaNacimiento: 1990-02-27\ncalle: "Álamo"\nnroDomicilio: '2128'\npiso: ''\ndpto: ''\ntelefono: '415176'\nemail: silvioquiroz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	89d8c91d-691e-46fb-bba1-8332980d77aa	2017-05-16 07:04:26.333968
91	78	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-028\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '33457976'\nfechaNacimiento: 1987-12-19\ncalle: Alem\nnroDomicilio: '123'\npiso: ''\ndpto: ''\ntelefono: '451912'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3d92e504-1103-4f5e-b893-19e21f4dded0	2017-05-16 07:04:26.41725
92	79	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-029\nnombre: Leonardo\napellido: Rios\nnroIdentificacion: '29524865'\nfechaNacimiento: 1981-11-30\ncalle: Concepcion\nnroDomicilio: '5139'\npiso: ''\ndpto: ''\ntelefono: '4590871'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	202bff42-5a1c-4bc1-ac4b-a93d52fc2435	2017-05-16 07:04:26.505196
93	80	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-030\nnombre: Ubaldo\napellido: Gomez\nnroIdentificacion: '34123456'\nfechaNacimiento: 1990-04-08\ncalle: Entre Rios\nnroDomicilio: '1235'\npiso: ''\ndpto: ''\ntelefono: '456798'\nemail: ubaldogomez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	80aab8be-fc7d-4e8b-8196-529a5520746e	2017-05-16 07:04:26.634132
94	81	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-031\nnombre: Silvio\napellido: Gonzalez\nnroIdentificacion: '29092236'\nfechaNacimiento: 1980-05-16\ncalle: Cordoba\nnroDomicilio: '7213'\npiso: ''\ndpto: ''\ntelefono: '4501923'\nemail: silviogonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e698729e-bcf6-482c-8901-ffbd29b8cd74	2017-05-16 07:04:26.717219
187	38	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	8c034837-3ab9-4ff2-8d46-2a127c47bf48	2017-05-16 07:04:42.718104
95	82	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-032\nnombre: Rosa\napellido: Fernandez\nnroIdentificacion: '20112254'\nfechaNacimiento: 1968-09-13\ncalle: San Martin\nnroDomicilio: '1028'\npiso: ''\ndpto: ''\ntelefono: '4567895'\nemail: rosafernandez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c7479433-89b4-4317-9fa4-f77c24d7f953	2017-05-16 07:04:26.804536
96	83	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-033\nnombre: Alejandro\napellido: Fernandez\nnroIdentificacion: '20998871'\nfechaNacimiento: 1987-05-16\ncalle: Santa Fe\nnroDomicilio: '4812'\npiso: ''\ndpto: ''\ntelefono: '4311235'\nemail: alefernandez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4fdef8a9-b911-4f76-b12a-c347b908e6e4	2017-05-16 07:04:26.892324
97	84	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-034\nnombre: Hugo\napellido: Rios\nnroIdentificacion: '40034940'\nfechaNacimiento: 1998-11-30\ncalle: Alvear\nnroDomicilio: '5028'\npiso: ''\ndpto: ''\ntelefono: '481341'\nemail: hugorios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9389c885-af09-4d1b-a8a4-3ffdd518b52e	2017-05-16 07:04:26.96977
98	85	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-035\nnombre: Mario\napellido: Garcia\nnroIdentificacion: '24654447'\nfechaNacimiento: 1976-04-08\ncalle: Roca\nnroDomicilio: '193'\npiso: ''\ndpto: ''\ntelefono: '4212351'\nemail: mariogarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fd2d6847-8f05-49df-af47-77c78e7c5aad	2017-05-16 07:04:27.04704
99	86	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-036\nnombre: Marina\napellido: Moralez\nnroIdentificacion: '36421952'\nfechaNacimiento: 1992-08-19\ncalle: Ucrania\nnroDomicilio: '9371'\npiso: ''\ndpto: ''\ntelefono: '451241'\nemail: marimamoralez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5280c1da-b7c0-4686-ae8f-57a14f5b2400	2017-05-16 07:04:27.126746
100	87	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-037\nnombre: Silvina\napellido: Portillo\nnroIdentificacion: '26498388'\nfechaNacimiento: 1976-06-05\ncalle: Av Queirel\nnroDomicilio: '7621'\npiso: ''\ndpto: ''\ntelefono: '431214'\nemail: silvinaportillo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c7a55a47-c87e-4bee-a08b-dd73f845b2fd	2017-05-16 07:04:27.211422
101	88	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-038\nnombre: Maria\napellido: Maciel\nnroIdentificacion: '33428434'\nfechaNacimiento: 1989-09-04\ncalle: Paraguay\nnroDomicilio: '600'\npiso: ''\ndpto: ''\ntelefono: '4761602'\nemail: mariamaciel@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	55f4e954-5bd4-49b3-a964-67a668c6015d	2017-05-16 07:04:27.293279
102	89	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-039\nnombre: Angeles\napellido: Granados\nnroIdentificacion: '31452518'\nfechaNacimiento: 1981-04-09\ncalle: Uruguay\nnroDomicilio: '12'\npiso: ''\ndpto: ''\ntelefono: '481858'\nemail: angelesgranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b8d8b807-83bb-402b-852b-5f155ff4c3da	2017-05-16 07:04:27.379741
103	90	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-040\nnombre: Cintia\napellido: Gutierrez\nnroIdentificacion: '29701192'\nfechaNacimiento: 1992-11-05\ncalle: Av Roca\nnroDomicilio: '464'\npiso: ''\ndpto: ''\ntelefono: '483498'\nemail: cintiagutierrez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b0bb4647-135e-4eba-b755-3d5073f42aa6	2017-05-16 07:04:27.576526
104	91	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-041\nnombre: David\napellido: Sedillo\nnroIdentificacion: '36371823'\nfechaNacimiento: 1975-07-23\ncalle: Centenario\nnroDomicilio: '6135'\npiso: ''\ndpto: ''\ntelefono: '481018'\nemail: davidsedillo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	38751c00-6b42-4fb3-87dc-03e1e528c27e	2017-05-16 07:04:27.657564
105	92	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-042\nnombre: Sofia\napellido: Garcia\nnroIdentificacion: '25370180'\nfechaNacimiento: 1998-01-13\ncalle: Las Flores\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '409498'\nemail: sofiagarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e6394082-1510-49ee-9f4b-b3ff68bc119e	2017-05-16 07:04:27.737033
106	93	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-043\nnombre: Alicia\napellido: Villalba\nnroIdentificacion: '27455263'\nfechaNacimiento: 1979-04-17\ncalle: Las Palmeras\nnroDomicilio: '9876'\npiso: ''\ndpto: ''\ntelefono: '420184'\nemail: alivillalba@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1581a631-4385-46d9-b953-63a90c5c76d2	2017-05-16 07:04:27.822587
107	94	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-044\nnombre: Luis\napellido: Gonzalez\nnroIdentificacion: '36182911'\nfechaNacimiento: 1992-06-19\ncalle: Las Orquideas\nnroDomicilio: '900'\npiso: ''\ndpto: ''\ntelefono: '495712'\nemail: luisgonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3eee4f13-2cfc-41b9-a527-b3a95c5c8219	2017-05-16 07:04:27.904769
108	95	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-045\nnombre: Ernesto\napellido: Da Luz\nnroIdentificacion: '30346514'\nfechaNacimiento: 1983-06-19\ncalle: Rosas\nnroDomicilio: '2463'\npiso: ''\ndpto: ''\ntelefono: '413048'\nemail: ernestodaluz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6195b3c6-d78b-4d88-bfc2-9b3f2536347e	2017-05-16 07:04:27.990369
109	96	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-046\nnombre: Luciano\napellido: Garcia\nnroIdentificacion: '39019733'\nfechaNacimiento: 1996-03-13\ncalle: Colon\nnroDomicilio: '8123'\npiso: ''\ndpto: ''\ntelefono: '412451'\nemail: lucianogarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3f9292aa-9a68-4bdb-b03e-f5b72dee7b44	2017-05-16 07:04:28.072181
110	97	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-047\nnombre: Gerardo\napellido: Cano\nnroIdentificacion: '29232117'\nfechaNacimiento: 1980-07-19\ncalle: Escuelita\nnroDomicilio: '9173'\npiso: ''\ndpto: ''\ntelefono: '462093'\nemail: gerardocano@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	03326853-d2b2-40e5-9bfc-ba2e5a3a91fd	2017-05-16 07:04:28.159504
111	98	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-048\nnombre: Hector\napellido: Rincon\nnroIdentificacion: '29222287'\nfechaNacimiento: 1980-05-31\ncalle: Japon\nnroDomicilio: '2546'\npiso: ''\ndpto: ''\ntelefono: '471927'\nemail: hectorrincon@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1cfeb753-bf00-4dd9-b4de-616cf4d7342f	2017-05-16 07:04:28.250067
188	39	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	6651e795-db7f-4db4-bb65-f3b9bdea1e25	2017-05-16 07:04:42.770139
112	99	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-049\nnombre: Alberto\napellido: Gonzalez\nnroIdentificacion: '35225922'\nfechaNacimiento: 1990-02-27\ncalle: Colombia\nnroDomicilio: '2871'\npiso: ''\ndpto: ''\ntelefono: '431570'\nemail: albertogonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	45a1d1b5-bdd9-4229-a67f-1c9297fcbef5	2017-05-16 07:04:28.33607
113	100	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-050\nnombre: Roberto\napellido: Lujan\nnroIdentificacion: '35461122'\nfechaNacimiento: 1990-05-27\ncalle: Noruega\nnroDomicilio: '1980'\npiso: ''\ndpto: ''\ntelefono: '401938'\nemail: robertolujan@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e0d674ad-6058-493a-8f8b-664c9a42fdb1	2017-05-16 07:04:28.411631
114	1	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Pre incubacion\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	a97934a1-025d-43c9-aa8b-61735e9a81fe	2017-05-16 07:04:28.519527
115	2	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Incubación\ndescripcion: "-"\netapaAnterior: 1\n	1	\N	\N	428170ac-24bd-48c6-b672-2bbe2cd8fbfa	2017-05-16 07:04:28.577136
116	3	Etapa	\N	\N	1	\N	\N	create	---\nnombre: post incubacion\ndescripcion: "-"\netapaAnterior: 2\n	1	\N	\N	0e14dcc4-ac89-4e97-a9fc-d984f8dc5f70	2017-05-16 07:04:28.630795
117	4	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Cuarta etapa\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	2aa9735d-50ab-45a1-af16-c5736fd601f8	2017-05-16 07:04:28.679031
156	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	8182f337-e5e8-471f-b803-35fb95697e5e	2017-05-16 07:04:41.191626
122	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	774053b7-fc49-4803-9bc4-214c8e45617d	2017-05-16 07:04:29.127456
123	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	3cbae83c-6642-4b4d-a801-826b370f39c5	2017-05-16 07:04:29.191291
124	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	1c585cca-ed07-46aa-9f4b-d8defd308740	2017-05-16 07:04:29.250603
125	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	6f4633ee-a561-4c95-8d20-9c62e7d6272b	2017-05-16 07:04:29.304341
126	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	0affec5c-69e1-4aa4-9e12-631a6771ce9c	2017-05-16 07:04:29.362437
127	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	b155ea41-1eee-4407-a7ee-8e7802b03300	2017-05-16 07:04:29.424762
128	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	0a9777c8-60a4-446f-947a-bb100ed3cda9	2017-05-16 07:04:29.497044
129	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	74071640-6251-4688-aa5d-d052aee07ff0	2017-05-16 07:04:29.700251
130	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	26b1e0c8-c9c2-40a5-8e6b-ff2bc23b7b0a	2017-05-16 07:04:29.773839
131	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	95b4c963-f05a-4bd2-94c3-b8299c0de2e8	2017-05-16 07:04:29.854548
132	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	2457bb0e-f2af-4366-96a7-4072b3aec26f	2017-05-16 07:04:29.930421
133	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	fd9081d3-6f2c-4c97-88fb-3afbe9a543d9	2017-05-16 07:04:30.010064
189	40	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	e95c8333-0370-4c49-b968-5a8fab1bcddf	2017-05-16 07:04:42.818468
134	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	8dc20f6b-2d9b-428c-ad74-523371cc7396	2017-05-16 07:04:30.084494
135	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	27ebf58b-6236-4d52-9b0e-cbc95aa5b42f	2017-05-16 07:04:30.159162
136	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	ae747260-903f-445b-81bf-72923b2a1b63	2017-05-16 07:04:30.228134
137	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	d26e0ac0-32ae-4e2f-b776-0807a00762cf	2017-05-16 07:04:30.293212
138	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b6769ab3-0422-4cee-a4b1-31792ce2ea03	2017-05-16 07:04:30.36148
157	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	20ea6eec-2b67-4c9a-915a-cf2f2b029f7e	2017-05-16 07:04:41.237514
158	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	719983ab-c73c-4d77-9c61-3511a05710d4	2017-05-16 07:04:41.296416
139	11	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-011\nnombre: Percentil\ndescripcion: Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes\n  en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para\n  hacerlo en escala y poder ganar dinero con ello.\ncalle: España\nnroDomicilio: '422'\npiso: ''\ndpto: ''\ntelefono: '4590432'\nemail: percentil@gmail.com\npagWeb: percentil.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	6d05a7d2-3ae3-4f51-b440-5d908b6df6a9	2017-05-16 07:04:30.427995
140	12	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-012\nnombre: EmbryoTools\ndescripcion: " Son una referencia mundial en reproducción asistida. Trabajan en cuatro\n  ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos,\n  porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante\n  práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan\n  es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción\n  asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de\n  los productos que vayan a entrar en contacto con embriones humanos y por último\n  trabajan en la reproducción asistida en veterinaria."\ncalle: Mariano Moreno\nnroDomicilio: '4122'\npiso: ''\ndpto: ''\ntelefono: '465888'\nemail: embryotools@gmail.com\npagWeb: embryotools.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	32931824-55ec-43ad-947c-4c27e4965932	2017-05-16 07:04:30.492767
141	13	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-013\nnombre: Aplázame\ndescripcion: " Es un método de pago que se integra en el proceso de compra del comercio\n  electrónico y permite a los clientes de las tiendas online comprar con un crédito\n  instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su\n  método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando\n  para hacerlo en breve."\ncalle: Av. San Martin\nnroDomicilio: '4532'\npiso: ''\ndpto: ''\ntelefono: '453222'\nemail: aplazame@gmail.com\npagWeb: aplazame.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	02923f36-05e1-42b5-a51c-85c71cfa54e4	2017-05-16 07:04:30.558826
142	14	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-014\nnombre: BrioAgro Technologies\ndescripcion: Deesarrollo de una tecnología para que el agricultor controle su explotación.\n  El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor,\n  a través de su dispositivo, se conecta a la nube para acceder a la información de\n  su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier\n  cambio en sus variables.\ncalle: 'Colon '\nnroDomicilio: '555'\npiso: ''\ndpto: ''\ntelefono: '4651244'\nemail: bioagro@gmail.com\npagWeb: bioagro.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	21570923-9625-4a89-9d14-65cac0211bbf	2017-05-16 07:04:30.628265
143	15	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-015\nnombre: Braingaze\ndescripcion: La tecnología desarrollada detecta un pequeño movimiento ocular que permite\n  determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad\n  (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y\n  dislexia.\ncalle: Miami\nnroDomicilio: '708'\npiso: ''\ndpto: ''\ntelefono: '490123'\nemail: baringaze@gmail.com\npagWeb: braingaze.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	83f3993b-7b19-4559-a7e8-3c60450c9f5a	2017-05-16 07:04:30.694991
144	16	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-016\nnombre: CreatorStats\ndescripcion: Mejoran la métrica de los ‘youtubers’.\ncalle: Inglaterra\nnroDomicilio: '200'\npiso: ''\ndpto: ''\ntelefono: '15432510'\nemail: creatorstats@gmail.com\npagWeb: creatorstats.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	d41ba8b5-5264-4b26-841c-aab4e5f1b85a	2017-05-16 07:04:30.75981
145	17	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-017\nnombre: Alzhup\ndescripcion: Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar\n  de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología\n  como vehículo para que la solución sea accesible a todo el mundo. Implementan a\n  nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado\n  ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados\n  científicamente. Y también, herramientas para la memoria, capaces de personalizar\n  dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo\n  mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro\n  almacena los recuerdos y que difiere de los sistemas actuales computarizados.\ncalle: Constitucion\nnroDomicilio: '2222'\npiso: ''\ndpto: ''\ntelefono: '467632'\nemail: alzhup@gmail.com\npagWeb: alzhup.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	92ade06f-780e-4a92-8e81-55bb20649f2d	2017-05-16 07:04:30.838763
190	41	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	ac186b82-aec1-4ef8-9efc-292a52c8e063	2017-05-16 07:04:42.872026
146	18	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-018\nnombre: Axter Aerospace\ndescripcion: Están desarrollando un sistema de propulsión híbrida para las avionetas,\n  que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso\n  trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración\n  con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto\n  se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU.\n  De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción\n  y ensamblado.\ncalle: Ayacucho\nnroDomicilio: '9200'\npiso: ''\ndpto: ''\ntelefono: '432111'\nemail: axteraerospace@gmail.com\npagWeb: axteraerospace.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	0c8d8aa5-b760-406d-8233-59bb16c1490e	2017-05-16 07:04:30.904083
147	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	29f3bf80-2fea-4c0e-bbba-b4811974e84b	2017-05-16 07:04:40.601094
148	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	43f64c22-6080-4c5f-b1e2-f1307a047506	2017-05-16 07:04:40.708136
149	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	d9715b40-3a15-4cc5-ad25-b27e0629493d	2017-05-16 07:04:40.769326
150	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	866820e4-0ca5-47e6-99cc-f6ccece2d68e	2017-05-16 07:04:40.878071
151	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	5348b9a7-5c49-4854-89c1-caf17d00dceb	2017-05-16 07:04:40.926777
152	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	d6070196-3333-434e-8941-4792a0d7c83a	2017-05-16 07:04:40.983404
153	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	033c793a-4dda-49a9-982b-3b2020d3b465	2017-05-16 07:04:41.037167
154	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	1ae5810e-bbb3-4ffe-91c2-4ce04c6a415a	2017-05-16 07:04:41.083857
155	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e6c5cef5-56d5-47c2-b7b1-bbfea271714a	2017-05-16 07:04:41.139814
161	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	323a9525-fd3e-449b-90eb-4e67156262fd	2017-05-16 07:04:41.439896
162	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	79ad0b5b-5fd9-45b6-bdc3-09e02bdde713	2017-05-16 07:04:41.493804
163	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	15e90746-e6ff-474c-9a4f-9ea6cf2abb06	2017-05-16 07:04:41.537677
164	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	8c3f8bae-ed84-4761-8c16-ebbc361bc7a2	2017-05-16 07:04:41.584347
165	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	85e63ee3-69dd-4702-a706-18a84f1b6c86	2017-05-16 07:04:41.637621
166	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	9e81c1d8-ead6-46da-a1f9-f06c8721f52b	2017-05-16 07:04:41.681861
167	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	9c61346b-f1a6-44b7-85d2-5c86409a08cf	2017-05-16 07:04:41.726304
168	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	302f92a8-b485-4154-a660-c32c590f01ed	2017-05-16 07:04:41.77093
169	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	04ed76b0-1e21-4a24-a1b3-1c987df2df0a	2017-05-16 07:04:41.815978
170	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	c792faab-4cdd-42ca-8d5d-43ae2fd2cdee	2017-05-16 07:04:41.861555
171	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	11d0b031-d973-44c3-8b7c-95aa477b7488	2017-05-16 07:04:41.914267
172	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	8e7c0c01-e5ec-4637-af84-44c8bb1316df	2017-05-16 07:04:41.958928
173	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e065c706-bd91-4907-a370-8807224d0815	2017-05-16 07:04:42.005478
174	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	e98e9f0e-685f-48e7-aa99-fd9ff670d58c	2017-05-16 07:04:42.049243
175	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	e445f455-b1bb-4276-bf8e-90c419253661	2017-05-16 07:04:42.093652
176	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	61b90b8a-9aa5-4208-8ea6-4e5a34dc3161	2017-05-16 07:04:42.137977
177	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f6e3d7c5-b267-4123-8fa4-cee9c8345c04	2017-05-16 07:04:42.186059
178	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	3e0f22f9-2223-4a6b-bee9-9a70e84b635a	2017-05-16 07:04:42.23751
179	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	eca9623d-92c5-43ef-8e01-79454ba02ad5	2017-05-16 07:04:42.282408
180	31	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	84574d1b-6c3d-4a9c-8074-424c7e111c27	2017-05-16 07:04:42.326423
181	32	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	d80482bd-9d53-47ca-b154-6c4e85859e28	2017-05-16 07:04:42.374405
182	33	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0a9020a1-485c-47b0-8189-fa11b74a62f9	2017-05-16 07:04:42.427198
183	34	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	d884ca22-703d-4855-a215-9465da048ea8	2017-05-16 07:04:42.47074
191	42	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	f19ed5e1-4a1f-450a-aba0-934defd6e000	2017-05-16 07:04:42.917151
192	43	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	36be03c9-f695-4aa3-b55d-78687da4ccbb	2017-05-16 07:04:42.974309
193	44	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	38cf5415-fb9a-444f-bebe-8e81236cfcaa	2017-05-16 07:04:43.02807
194	45	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	eeeb84b2-d2f3-4207-a160-bacce1794e01	2017-05-16 07:04:43.074034
195	46	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c0d75df9-7123-450d-a112-ce6e59bf7c44	2017-05-16 07:04:43.125514
196	47	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	3222c746-cff5-4982-8a19-fac6cfb5c32d	2017-05-16 07:04:43.171627
197	48	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e825b827-81f8-4d28-bd92-dbb35894240d	2017-05-16 07:04:43.218071
198	49	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f1332caa-cf18-4618-963d-726d9219d091	2017-05-16 07:04:43.270854
199	50	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	099b261f-21f1-49b0-a356-da2253b7d109	2017-05-16 07:04:43.320513
200	51	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	1f9db66a-e5db-4409-b1f4-c0436d110ca6	2017-05-16 07:04:43.372048
201	52	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	8cb36c84-285c-4a2d-847e-91269154b907	2017-05-16 07:04:43.458982
202	53	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a64ad424-2ea8-4e24-a282-742f597cea78	2017-05-16 07:04:43.509163
203	54	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	3da9c7b6-406b-48d6-a7df-ba761412d996	2017-05-16 07:04:43.559134
204	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	60627532-dc6b-4667-a9ea-7587b8d4766c	2017-05-16 07:04:46.970965
205	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	ba8abe40-4fcc-49a4-9460-8dca789c948d	2017-05-16 07:04:47.068129
206	1	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Efectivo\n	1	\N	\N	800ebbba-85a7-4a16-821c-4056e45e7702	2017-05-16 07:04:47.170007
207	2	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta de crédito Visa\n	1	\N	\N	17ce24da-0ca0-4546-a0b3-5a9058350b0e	2017-05-16 07:04:47.219341
208	3	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta Naranja\n	1	\N	\N	91d9f5db-dd68-4ee0-a374-7e6bc54ba719	2017-05-16 07:04:47.264221
209	4	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Saldo de cuenta\n	1	\N	\N	77763f67-91eb-4b35-9cda-492eb6a44a5b	2017-05-16 07:04:47.307419
210	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\ninicio: 0001-01-17\nmonto: 200.0\n	1	\N	\N	c2edb97c-ba48-4dfa-a70d-1975ff7785e4	2017-05-16 07:04:47.511765
211	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\ninicio: 0001-02-17\nmonto: 200.0\n	1	\N	\N	2db8136d-a4fc-443e-bd17-003071b69f1a	2017-05-16 07:04:47.586721
212	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\ninicio: 0001-03-17\nmonto: 200.0\n	1	\N	\N	2509fa2e-b3e6-4d74-abd7-b821786c22c4	2017-05-16 07:04:47.6524
213	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\ninicio: 0001-04-17\nmonto: 200.0\n	1	\N	\N	662e6dbe-88e4-4bc4-a10e-ace7c011591d	2017-05-16 07:04:47.719207
214	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\ninicio: 0001-05-17\nmonto: 200.0\n	1	\N	\N	c9153a77-3798-4191-a23b-86cefdb5de8c	2017-05-16 07:04:47.784808
215	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\ninicio: 0001-06-17\nmonto: 200.0\n	1	\N	\N	691d206a-224c-46ed-a528-8c6cf8330b18	2017-05-16 07:04:47.898954
216	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\ninicio: 0001-07-17\nmonto: 200.0\n	1	\N	\N	a40139bb-e1a7-45cd-837b-c30371756537	2017-05-16 07:04:47.963611
217	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\ninicio: 0001-08-17\nmonto: 200.0\n	1	\N	\N	21c5609d-42c0-412c-81dd-44567e523470	2017-05-16 07:04:48.03206
218	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\ninicio: 0001-09-17\nmonto: 200.0\n	1	\N	\N	f802c7d8-c166-453c-9864-57ab1f3b5f07	2017-05-16 07:04:48.098888
219	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\ninicio: 0001-10-17\nmonto: 200.0\n	1	\N	\N	06d237d5-1562-4272-8d53-82d9968057cc	2017-05-16 07:04:48.164719
220	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\ninicio: 0001-11-17\nmonto: 200.0\n	1	\N	\N	e51189c2-8d7a-42ff-8cd8-58ef25eebcf1	2017-05-16 07:04:48.232167
221	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\ninicio: 0001-12-17\nmonto: 200.0\n	1	\N	\N	c36a64d2-6017-4178-932b-67ec9cc48fb6	2017-05-16 07:04:48.295523
222	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 51\nproyecto_id: 1\n	1	\N	\N	334fe960-7eed-47d2-8bc7-4d33db3a7180	2017-05-16 07:04:48.958967
223	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 52\nproyecto_id: 2\n	1	\N	\N	889650c0-d62f-4983-bd48-1219538e02f1	2017-05-16 07:04:49.012558
224	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 54\nproyecto_id: 3\n	1	\N	\N	d2f1d019-e660-412b-a7fc-71e8eb65b984	2017-05-16 07:04:49.067737
225	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 56\nproyecto_id: 4\n	1	\N	\N	cd02274c-1b75-48d9-aaaf-cc587a02fbd0	2017-05-16 07:04:49.124244
226	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 58\nproyecto_id: 5\n	1	\N	\N	f53ddbfd-e844-45e0-b47b-f4140b2a105f	2017-05-16 07:04:49.179184
227	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 60\nproyecto_id: 6\n	1	\N	\N	bfe6516e-f64e-4ee1-b95d-92babefb3acd	2017-05-16 07:04:49.233667
228	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 63\nproyecto_id: 7\n	1	\N	\N	7156f92b-5c40-4896-a023-ca0e1345d041	2017-05-16 07:04:49.289585
229	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 8\n	1	\N	\N	2966e533-428e-4d23-874a-188b543bff85	2017-05-16 07:04:49.343047
230	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 9\n	1	\N	\N	e4b4adb7-9f4d-48c8-80c9-c589c6248815	2017-05-16 07:04:49.399541
231	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 69\nproyecto_id: 10\n	1	\N	\N	3b47b16a-133e-42ad-a8bc-5c765e8a63cd	2017-05-16 07:04:49.457216
232	11	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 0017-12-10\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 71\nproyecto_id: 11\n	1	\N	\N	666d5fdd-93c8-493f-b6be-5f5b57554fb7	2017-05-16 07:04:49.512415
233	12	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 12\n	1	\N	\N	ff8488c7-48cb-43be-b565-ad5d6a5e354b	2017-05-16 07:04:49.568521
234	13	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 99\nproyecto_id: 13\n	1	\N	\N	76fb28ed-34ee-4404-b38a-9f578e0e6681	2017-05-16 07:04:49.623538
235	14	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 80\nproyecto_id: 14\n	1	\N	\N	a620559b-0b3d-4b72-93c1-5fb7bc413f89	2017-05-16 07:04:49.679588
236	15	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 89\nproyecto_id: 15\n	1	\N	\N	1902339a-923a-45b6-bcf1-797829bc01df	2017-05-16 07:04:49.739024
237	16	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 16\n	1	\N	\N	43caa3c4-8c14-49ff-8007-af33afda2550	2017-05-16 07:04:49.802711
238	17	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 97\nproyecto_id: 17\n	1	\N	\N	f24e02a7-00a5-4bc2-96d9-951478054f98	2017-05-16 07:04:49.858635
239	18	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 75\nproyecto_id: 18\n	1	\N	\N	7f3e3709-4334-40c2-90c0-d69244279f06	2017-05-16 07:04:49.911534
240	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	78ca2a0c-c496-463b-b6d3-5d809ad20d7f	2017-05-16 07:04:50.107806
241	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	1df1e02b-63c7-4d12-94fa-8a1e8ca4768a	2017-05-16 07:04:50.204062
242	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	eef321c6-e8bc-483a-89f5-b9b9f24d9d9b	2017-05-16 07:04:50.304209
243	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	e97a4ef9-2acd-4147-a15f-4c3c0b324530	2017-05-16 07:04:50.421928
244	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	f732af30-4e57-42f4-a108-3e8614579482	2017-05-16 07:04:50.523191
245	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	0b23385c-c41f-42bf-ad88-9b0a05201340	2017-05-16 07:04:50.606408
246	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	8a645b88-0b71-41f7-9fe2-44554851bc45	2017-05-16 07:04:50.698038
247	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	188fdbbe-6639-41df-82d0-662d8e78409f	2017-05-16 07:04:50.813428
248	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	7bd0b538-0c12-438c-a142-ae13a24108c0	2017-05-16 07:04:50.973309
249	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	fdde5347-0f91-498e-b4e2-10b61d874d97	2017-05-16 07:04:51.058985
250	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	8b91cb7b-706c-474d-8adb-9fdbda8a26cc	2017-05-16 07:04:51.154697
251	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	3862f844-7de4-4f26-ac19-f7d45aaaa5db	2017-05-16 07:04:51.257036
252	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	3280ef2e-858a-4681-a7be-55623dbaa0e1	2017-05-16 07:04:51.348136
253	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	014fc9a2-a652-438e-98e5-31499f4a225a	2017-05-16 07:04:51.433872
254	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	e2427cff-d427-44aa-a719-3a9461fea5a9	2017-05-16 07:04:51.515809
255	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	07892054-ffab-40e3-b31b-966bbae4ec5a	2017-05-16 07:04:51.617691
256	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	fb5d8d73-a871-4c17-ac72-481cae3b2627	2017-05-16 07:04:51.710202
257	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	3dde2bd0-608c-459f-a657-663560159492	2017-05-16 07:04:51.791052
258	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	772eb37e-2cce-4bc1-96bc-9d07b464da1a	2017-05-16 07:04:51.873034
259	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	3f19cb90-ba98-4e0e-8446-67801a933651	2017-05-16 07:04:51.984268
260	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	34c4bcd3-04f3-4114-9ef3-f57472a86c53	2017-05-16 07:04:52.082047
261	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	f4e0474d-ce3b-476a-9339-b810b6c67081	2017-05-16 07:04:52.165857
262	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	17ceac8d-0eba-48ce-ac76-8c1ecf5bb3c0	2017-05-16 07:04:52.2473
263	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	8bb9e497-c29a-47db-8473-dc0042c29976	2017-05-16 07:04:52.35339
264	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	37812dde-0728-4b8c-83e3-a6e2e3c21b2c	2017-05-16 07:04:52.450751
265	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	f43c7d2a-6877-4fee-bce9-9b22e0074ae8	2017-05-16 07:04:52.568527
266	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	803ce3e7-f4d1-46f6-bc84-27cd95946510	2017-05-16 07:04:52.664096
267	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	ebc2f83a-e7c0-4a31-85ce-d1c3f1c449b1	2017-05-16 07:04:52.766078
268	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	80024529-21bd-451e-a63b-65a99ab5f766	2017-05-16 07:04:52.86916
269	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	3afc4804-009a-4550-943f-9d37bf6002b3	2017-05-16 07:04:52.957425
270	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	8e0ea326-5b4b-47dd-9a14-9a0475761d94	2017-05-16 07:04:53.042358
271	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	0e607344-6a89-4800-b076-a6105d36d720	2017-05-16 07:04:53.144171
272	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	a95906b0-fd80-4fed-90c0-e505d00c4d59	2017-05-16 07:04:53.238462
273	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	faa491b5-041f-40fb-b925-c6bd9c841af6	2017-05-16 07:04:53.328446
274	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	8800f15d-ab44-457c-98db-c0226102c3c8	2017-05-16 07:04:53.420222
275	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	5d44199f-2b13-4dec-991c-35e6b6522f5a	2017-05-16 07:04:53.527162
276	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	7025d4ca-29cd-420a-8d51-892900a52449	2017-05-16 07:04:53.624856
277	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	7e444049-c033-48a0-a71c-fe909e078f94	2017-05-16 07:04:53.740383
278	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	573776ab-a302-41f0-b76e-63e9389feccc	2017-05-16 07:04:53.829647
279	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	eb3963a1-ef53-4f95-bdfb-561ef099b41f	2017-05-16 07:04:53.929296
280	41	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	2457b723-c237-4e43-bc9e-970ffd976b19	2017-05-16 07:04:54.02716
281	42	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	a776b1ea-4278-48ba-ada5-cfcafb258c5b	2017-05-16 07:04:54.11363
282	43	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	32f59af6-d1d3-41d3-bd46-19b203d5a180	2017-05-16 07:04:54.193656
283	44	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	b0877777-33cb-49e6-b24c-63a99e077b47	2017-05-16 07:04:54.299028
284	45	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	95da5765-27e9-4664-8bd3-228e60c7d0cb	2017-05-16 07:04:54.392552
285	46	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	8dd10380-05e2-41c7-8c61-709e35c02184	2017-05-16 07:04:54.465363
286	47	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	ce31b915-ff48-4bad-8b45-e8ebce7a627e	2017-05-16 07:04:54.55346
287	48	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	bb260746-81fe-448f-916b-04675673da49	2017-05-16 07:04:54.65214
288	49	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	3d221836-51e1-42d0-ac7a-84ca250da542	2017-05-16 07:04:54.752631
289	50	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	994f00d7-3ee8-4deb-9a64-7525172b548d	2017-05-16 07:04:54.836491
290	51	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	e6b97cd7-1278-4d47-b00f-3d980d357252	2017-05-16 07:04:54.920669
291	52	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	290bf377-473e-4df4-82d2-43c18eaf3a34	2017-05-16 07:04:55.022112
292	53	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	84dd8d37-66d6-4f78-9da7-134cb1bdd228	2017-05-16 07:04:55.118179
293	54	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	2e387b07-21a2-4433-9aca-7d5b61aac1ea	2017-05-16 07:04:55.201902
294	55	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	b8ce18d8-141e-4c10-8179-60e1727b7802	2017-05-16 07:04:55.292633
295	56	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	fae41988-0e99-46dd-822f-e88bcba58b2f	2017-05-16 07:04:55.398312
296	57	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	2872be19-8109-451b-b856-aa7e592585e8	2017-05-16 07:04:55.496345
297	58	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	f7f8e095-5b48-436a-bb08-e3e53f7e60ec	2017-05-16 07:04:55.581585
298	59	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	2b7be760-e756-4fb1-8054-1f9062837793	2017-05-16 07:04:55.665346
299	60	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	19f07fc2-39ea-4755-a898-da60dc060b9f	2017-05-16 07:04:55.769103
300	61	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	1d03e72a-5876-43cc-a469-2ac2911d5d41	2017-05-16 07:04:55.86102
301	62	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	8d937bb8-20a4-445c-81fc-06cde0012956	2017-05-16 07:04:55.945842
302	63	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	8069b40e-1f0e-4366-90ea-b26bf972ae19	2017-05-16 07:04:56.030107
303	64	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	bd81b86b-a8fe-4e42-ba99-64e4aae1f86e	2017-05-16 07:04:56.136319
304	65	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	59c49fe3-2203-438f-af08-7800102df10f	2017-05-16 07:04:56.22931
305	66	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	0353986c-b034-46b2-98ef-79236ef44c23	2017-05-16 07:04:56.315403
306	67	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	0a44fcb8-cd46-4723-a28a-d30948f06b91	2017-05-16 07:04:56.452098
307	68	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	a161921d-2633-41b6-9782-36f2b1d49b3e	2017-05-16 07:04:56.557307
308	69	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	c791d461-e0ab-437c-aa9b-5cee55c6f2d3	2017-05-16 07:04:56.674532
309	70	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	d6c721d8-ef3e-4d3d-9bd6-eb6f2c67d2f8	2017-05-16 07:04:56.759586
310	71	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	2fbd478c-5c60-40e9-ae2c-2e5fd2a1980d	2017-05-16 07:04:56.851915
311	72	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	a36825a4-ebe8-4d08-a48a-bbe405f4b1a5	2017-05-16 07:04:56.951877
312	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	3809d088-882b-4a2f-9858-613266add773	2017-05-16 07:04:57.06665
313	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	fbdd233d-a927-4780-a398-b20fa22b54dc	2017-05-16 07:04:57.124639
314	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	9bc86408-250a-429e-8da0-97f884437931	2017-05-16 07:04:57.178716
315	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	b0e85401-de3b-4cba-8306-ef04a1489cf0	2017-05-16 07:04:57.233478
316	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	0c0c5131-fcd6-4829-b86a-cd0d60f3e7b3	2017-05-16 07:04:57.293488
317	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	3517a5c3-0353-4153-9892-68d07c489435	2017-05-16 07:04:57.346675
318	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	91e5727c-5131-473a-9649-bae5e494ca3f	2017-05-16 07:04:57.400171
319	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	026f215f-71a0-4ead-bcd1-951a7a5c1ea4	2017-05-16 07:04:57.455053
320	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	97a76364-e9ed-429c-9b5c-5ca593b37428	2017-05-16 07:04:57.552333
321	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	c9fcf616-5ebd-48ba-b416-baf6573e93cd	2017-05-16 07:04:57.617134
322	11	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 11\n	1	\N	\N	91d15236-5ba2-40bf-9d41-305a3c682bbc	2017-05-16 07:04:57.667087
323	12	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 12\n	1	\N	\N	8170c83a-e473-41dd-8713-47883270f128	2017-05-16 07:04:57.719757
324	13	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 13\n	1	\N	\N	c537c007-62b1-44dc-9fd9-e1c29605a2cf	2017-05-16 07:04:57.769195
325	14	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 14\n	1	\N	\N	24eb4d57-606d-4acd-b222-f90447e395c1	2017-05-16 07:04:57.822173
326	15	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 15\n	1	\N	\N	8eba116b-c6ab-4e19-9803-1d893fdce7d8	2017-05-16 07:04:57.880547
327	16	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 16\n	1	\N	\N	40d593a8-d513-4ff8-a864-c214fea4c28b	2017-05-16 07:04:57.935274
328	17	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 17\n	1	\N	\N	476ce29f-70f1-4f70-a928-247edb38bb6a	2017-05-16 07:04:57.987409
329	18	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 18\n	1	\N	\N	6b7de837-d593-4db4-a163-229369b636b1	2017-05-16 07:04:58.033072
330	1	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Marketing\ndescripcion: Análisis del comportamiento de los mercados y de los consumidores\n	1	\N	\N	bb0f8810-901e-44de-9326-a5861cdf988b	2017-05-16 07:04:58.148544
331	2	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	39b3d453-8397-44ee-9325-6d7f253c0a6e	2017-05-16 07:04:58.201746
332	3	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	3d09dafe-1f5e-4c93-a200-5d08cb18ae27	2017-05-16 07:04:58.257745
333	4	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	7c85be89-6274-4495-b8af-c4ae240519a5	2017-05-16 07:04:58.311608
334	5	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Multimedios\ndescripcion: Televisión, Radio, Periódicos, Internet\n	1	\N	\N	bfc5ba55-bf36-4b11-8174-09a3ec8d3127	2017-05-16 07:04:58.370467
335	6	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Community Manager\ndescripcion: Es el profesional responsable de construir, gestionar y administrar la\n  comunidad online alrededor de una marca en Internet, creando y manteniendo relaciones\n  estables y duraderas con sus clientes, sus fans y, en general, cualquier usuario\n  interesado en la marca.\n	1	\N	\N	be782d2c-81dd-4d7a-8bb4-1e55b6279984	2017-05-16 07:04:58.421206
336	7	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: El crowdfunding o micromecenazgo, en castellano, es una red de financiación\n  colectiva, normalmente online, que a través de donaciones económicas o de otro tipo,\n  consiguen financiar un determinado proyecto a cambio de recompensas, participaciones\n  de forma altruista.\n	1	\N	\N	4ed3f100-e771-4aed-b3b6-699143e4b9d2	2017-05-16 07:04:58.469008
337	8	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador Java\ndescripcion: "-"\n	1	\N	\N	323020ea-793c-48b5-b85c-bda18de53d40	2017-05-16 07:04:58.52081
338	9	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador PHP\ndescripcion: "-"\n	1	\N	\N	1a97ce74-19ca-48e6-8b4b-c1bd36da227a	2017-05-16 07:04:58.567619
339	10	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador web\ndescripcion: Programador en los lenguajes HTML, CSS, Javascript.\n	1	\N	\N	256ffdef-e5db-4a2d-afb3-3d66aea4275a	2017-05-16 07:04:58.62447
340	11	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Impresiones de anuncios gigantes\ndescripcion: Carteles Publicitarios, vallas, gigantografías\n	1	\N	\N	b3c9d644-8d1f-44c9-9f12-779f9fc6e292	2017-05-16 07:04:58.677047
341	12	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Consultoría\ndescripcion: "-"\n	1	\N	\N	510c79b6-ef96-45a5-a480-885f77d53ddc	2017-05-16 07:04:58.723974
342	101	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-001\nnombre: María Rosa\napellido: Conti\nnroIdentificacion: '25644132'\nfechaNacimiento: 1975-07-03\ncalle: Ituzaingo\nnroDomicilio: '245'\npiso: '12'\ndpto: B\ntelefono: '424568'\nemail: mrconti@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	55e85d30-0a7d-4492-b793-c33f6277c9ea	2017-05-16 07:04:58.864063
343	102	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-002\nnombre: Berta\napellido: Rivera\nnroIdentificacion: '33958772'\nfechaNacimiento: 1989-04-11\ncalle: Leandro Gómez\nnroDomicilio: '5886'\npiso: \ndpto: \ntelefono: '4598765'\nemail: brivera@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4f660147-c8c6-4412-a691-126b4859b8b7	2017-05-16 07:04:58.955509
344	103	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-003\nnombre: Juliana\napellido: Castiglione\nnroIdentificacion: '30444512'\nfechaNacimiento: 1980-12-09\ncalle: Brisas\nnroDomicilio: '3280'\npiso: '3'\ndpto: '20'\ntelefono: '555321'\nemail: jcastiglione@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5942e807-9d93-459d-9fb3-480a87a76d9a	2017-05-16 07:04:59.080057
345	104	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-004\nnombre: Nahuel\napellido: Estevez\nnroIdentificacion: '19423568'\nfechaNacimiento: 1966-11-28\ncalle: Av. Alta Gracia\nnroDomicilio: '5332'\npiso: \ndpto: \ntelefono: '154632108'\nemail: nestevez@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f2d93363-c11e-4b8c-ab07-a61955660203	2017-05-16 07:04:59.171264
346	105	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-005\nnombre: Pablo\napellido: Gomez\nnroIdentificacion: '25221305'\nfechaNacimiento: 1970-03-05\ncalle: Neruda\nnroDomicilio: '7393'\npiso: '8'\ndpto: A\ntelefono: '154245689'\nemail: pablogomez@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f96f941e-db26-4bef-a96f-059d5ed50331	2017-05-16 07:04:59.261863
347	106	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-006\nnombre: Abigail\napellido: Coronado\nnroIdentificacion: '37926793'\nfechaNacimiento: 1994-03-21\ncalle: Florencio Varela\nnroDomicilio: '5659'\npiso: \ndpto: \ntelefono: '432666'\nemail: abigailcoronado@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4997b971-0769-4398-b572-74eb1dcc0040	2017-05-16 07:04:59.351859
348	107	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-007\nnombre: Hilda\napellido: Zielinski\nnroIdentificacion: '25334991'\nfechaNacimiento: 1970-04-07\ncalle: Joaquin Suarez\nnroDomicilio: '6863'\npiso: '6'\ndpto: '15'\ntelefono: '4478909'\nemail: hildazielinski@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	12d294b8-4f6d-4615-927a-e1c4a8096c8f	2017-05-16 07:04:59.441685
349	108	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-008\nnombre: Antonio\napellido: Goncalves Melo\nnroIdentificacion: '34008128'\nfechaNacimiento: 1989-05-29\ncalle: Maldonado\nnroDomicilio: '2757'\npiso: \ndpto: \ntelefono: '4498049'\nemail: antoniogm@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7d202649-b366-41d0-b986-d38df4a12cf3	2017-05-16 07:04:59.524984
350	109	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-009\nnombre: Isabela\napellido: Correa\nnroIdentificacion: '41889321'\nfechaNacimiento: 1997-11-04\ncalle: Marejada\nnroDomicilio: '5656'\npiso: \ndpto: \ntelefono: '4482122'\nemail: isacorrea@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	91d34cde-40f4-406c-9650-e26dbbc8859e	2017-05-16 07:04:59.614228
351	110	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-010\nnombre: Franco\napellido: Maur\nnroIdentificacion: '41336729'\nfechaNacimiento: 1997-03-04\ncalle: Corrientes\nnroDomicilio: '314'\npiso: \ndpto: \ntelefono: '4498049'\nemail: francomaur@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	57f53b08-9238-41a9-aca9-379ddc9d3d93	2017-05-16 07:04:59.70609
352	111	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-011\nnombre: Felix\napellido: Baer\nnroIdentificacion: '30228128'\nfechaNacimiento: 1980-08-16\ncalle: Maldonado\nnroDomicilio: '9000'\npiso: \ndpto: \ntelefono: '4601406'\nemail: felixbaer@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	07af4c0a-660f-4af2-8705-c3a6211969e4	2017-05-16 07:04:59.796631
353	112	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-012\nnombre: Eileen\napellido: Macías Vargas\nnroIdentificacion: '39756412'\nfechaNacimiento: 1996-01-19\ncalle: Yapeyú\nnroDomicilio: '3778'\npiso: \ndpto: \ntelefono: '497986'\nemail: mercedesgarcia@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7423ec4d-ee19-417b-8998-9dd6854af7d7	2017-05-16 07:04:59.885373
354	113	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-013\nnombre: Mercedes\napellido: García\nnroIdentificacion: '34561928'\nfechaNacimiento: 1989-05-29\ncalle: Maldonado\nnroDomicilio: '2757'\npiso: \ndpto: \ntelefono: '5557120'\nemail: antoniogm@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6ead0cf6-ceac-4be7-8c7a-0d711c3d5e2d	2017-05-16 07:04:59.978711
355	114	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-014\nnombre: Clea\napellido: Espino\nnroIdentificacion: '24666124'\nfechaNacimiento: 1975-08-04\ncalle: Tomás Guido\nnroDomicilio: '8740'\npiso: \ndpto: \ntelefono: '4981777'\nemail: cleaespino@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	70b50ad3-a93d-48f0-95ff-e55852e357b7	2017-05-16 07:05:00.058203
356	115	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-015\nnombre: Paul\napellido: Flores Acosta\nnroIdentificacion: '31672155'\nfechaNacimiento: 1985-06-21\ncalle: Resistencia\nnroDomicilio: '1813'\npiso: \ndpto: \ntelefono: '4231456'\nemail: paulfloresacosta@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	baa5275d-a0e9-4c04-be8c-9c39345afba1	2017-05-16 07:05:00.150961
357	1	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-001\nnombre: 'Reunion con Programadores '\ndescripcion: Evento que tiene como objetivo poner en contacto programadores con miembros\n  de equipos de los distintos proyectos para que celebren contratos de sistemas de\n  gestión del negocio de dichos proyectos.\ndia: 2017-05-15\nhora: 2000-01-01 08:00:00.000000000 -03:00\n	1	\N	\N	e042552d-939a-404f-8f20-0bf2dfb9ee84	2017-05-16 07:05:01.066065
358	2	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-002\nnombre: Conferencia de Marketing\ndescripcion: 'Presentación de distintos expertos en el área de marketing que tiene\n  como objetivo que los miembros de equipos de proyectos adquieran conocimientos básicos\n  sobre como promocionar de manera apropiada su producto o servicio. '\ndia: 2017-05-16\nhora: 2000-01-01 08:00:00.000000000 -03:00\n	1	\N	\N	74135faa-5686-463b-89ad-7b78a7c8bb15	2017-05-16 07:05:01.13548
360	2	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 5\nevento_id: 1\n	1	\N	\N	8e3718e3-6666-4ff7-b557-f62f2c3453a1	2017-05-16 07:05:01.703766
361	3	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 7\nevento_id: 1\n	1	\N	\N	e07ccb11-9834-4e36-8028-bdd2d89c9f43	2017-05-16 07:05:01.759891
362	4	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 8\nevento_id: 1\n	1	\N	\N	3393dcd8-1a13-4d15-8140-a257efcebe61	2017-05-16 07:05:01.815632
363	5	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 9\nevento_id: 1\n	1	\N	\N	e78206a3-e216-4f97-a9c8-a7f2c5d71aa3	2017-05-16 07:05:01.872502
364	6	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 14\nevento_id: 1\n	1	\N	\N	bea53784-6885-4d91-9812-87c471bf0c44	2017-05-16 07:05:01.927872
365	7	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 16\nevento_id: 1\n	1	\N	\N	a1bbdd45-2bee-4610-9361-593e84151af4	2017-05-16 07:05:02.014443
366	8	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 1\nevento_id: 2\n	1	\N	\N	4d0213f0-bf9f-4469-b2ed-032ed361778d	2017-05-16 07:05:02.072833
367	9	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 2\nevento_id: 2\n	1	\N	\N	a580bdc1-7bb0-4b41-9deb-11032c699590	2017-05-16 07:05:02.128892
368	10	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 3\nevento_id: 2\n	1	\N	\N	1c7009f2-0d04-4ff6-a1cd-721c51e10b1a	2017-05-16 07:05:02.182745
369	11	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 4\nevento_id: 2\n	1	\N	\N	37f7cf32-d1c9-4cbc-ba22-097fdead9e89	2017-05-16 07:05:02.23895
370	12	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 5\nevento_id: 2\n	1	\N	\N	bdefcd62-fc1a-4a11-ba29-9ea153ab3c06	2017-05-16 07:05:02.296739
371	13	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 6\nevento_id: 2\n	1	\N	\N	f9f24737-a6b4-44ea-a256-45dcd9a41b46	2017-05-16 07:05:02.349781
372	14	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 7\nevento_id: 2\n	1	\N	\N	5c10bf89-97ad-4d3c-996a-ece722965024	2017-05-16 07:05:02.405598
373	15	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 8\nevento_id: 2\n	1	\N	\N	7a5df93f-0950-4d52-91cb-ed48caa87506	2017-05-16 07:05:02.459836
374	16	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 9\nevento_id: 2\n	1	\N	\N	8e51bfe0-efcc-4b84-8534-5b691a66f083	2017-05-16 07:05:02.557771
375	17	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 10\nevento_id: 2\n	1	\N	\N	d32c2e10-7b5f-4c5b-a825-421dac466d60	2017-05-16 07:05:02.616811
378	20	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 13\nevento_id: 2\n	1	\N	\N	ecc46f82-2318-4ef3-a7de-f5729bdd06fe	2017-05-16 07:05:02.769441
379	21	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 14\nevento_id: 2\n	1	\N	\N	f4b7f6d7-4af4-4240-b212-83de8d23b972	2017-05-16 07:05:02.813228
380	22	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 15\nevento_id: 2\n	1	\N	\N	2360012d-89db-4728-b741-4418a1bea2a7	2017-05-16 07:05:02.861832
381	23	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 16\nevento_id: 2\n	1	\N	\N	7cf5683f-ab55-4bf2-831f-2db0d4c817d8	2017-05-16 07:05:02.913961
382	24	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 17\nevento_id: 2\n	1	\N	\N	e316b5a7-8bb5-4770-b023-b68828f205f4	2017-05-16 07:05:02.958343
383	25	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 18\nevento_id: 2\n	1	\N	\N	05cbb93f-f647-4101-8f18-775026fe8293	2017-05-16 07:05:03.003041
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 391, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-05-16 07:04:18.552567	2017-05-16 07:04:18.552567	1	1
2	Apostoles	2017-05-16 07:04:18.594775	2017-05-16 07:04:18.594775	1	1
3	Bella Vista	2017-05-16 07:04:18.626552	2017-05-16 07:04:18.626552	2	1
4	Encarnación	2017-05-16 07:04:18.659168	2017-05-16 07:04:18.659168	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, inicio, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	0001-01-17	200	2017-05-16 07:04:47.484329	2017-05-16 07:04:47.484329
2	CP-002	Cuota de Febrero	Febrero 2017	0001-02-17	200	2017-05-16 07:04:47.567997	2017-05-16 07:04:47.567997
3	CP-003	Cuota de Marzo	Marzo 2017	0001-03-17	200	2017-05-16 07:04:47.63391	2017-05-16 07:04:47.63391
4	CP-004	Cuota de Abril	Abril 2017	0001-04-17	200	2017-05-16 07:04:47.699462	2017-05-16 07:04:47.699462
5	CP-005	Cuota de Mayo	Mayo 2017	0001-05-17	200	2017-05-16 07:04:47.764454	2017-05-16 07:04:47.764454
6	CP-006	Cuota de Junio	Junio 2017	0001-06-17	200	2017-05-16 07:04:47.878219	2017-05-16 07:04:47.878219
7	CP-007	Cuota de Julio	Julio 2017	0001-07-17	200	2017-05-16 07:04:47.942359	2017-05-16 07:04:47.942359
8	CP-008	Cuota de Agosto	Agosto 2017	0001-08-17	200	2017-05-16 07:04:48.011304	2017-05-16 07:04:48.011304
9	CP-009	Cuota de Septiembre	Septiembre 2017	0001-09-17	200	2017-05-16 07:04:48.079369	2017-05-16 07:04:48.079369
10	CP-010	Cuota de Octubre	Octubre 2017	0001-10-17	200	2017-05-16 07:04:48.143799	2017-05-16 07:04:48.143799
11	CP-011	Cuota de Noviembre	Noviembre 2017	0001-11-17	200	2017-05-16 07:04:48.212719	2017-05-16 07:04:48.212719
12	CP-012	Cuota de Diciembre	Diciembre 2017	0001-12-17	200	2017-05-16 07:04:48.275609	2017-05-16 07:04:48.275609
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
1	\N	Peak Startup	Desarrollando ideas juntos	30-54570225-4	Responsable Inscripto	Av. Corrientes	4287			4401604	peakstartup@gmail.com	peakstartup.com	2017-05-16 10:13:55.501821	2017-05-16 10:13:55.501821	1	1	1	1	Peak-Startup-Logo.png
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
1	2017-01-01	2017-04-30	2017-05-16 07:04:48.927598	2017-05-16 07:04:48.927598	\N	51	1
2	2017-01-01	2017-04-30	2017-05-16 07:04:48.989432	2017-05-16 07:04:48.989432	\N	52	2
3	2017-01-01	2017-04-30	2017-05-16 07:04:49.044291	2017-05-16 07:04:49.044291	\N	54	3
4	2017-01-01	2017-04-30	2017-05-16 07:04:49.101405	2017-05-16 07:04:49.101405	\N	56	4
5	2017-01-01	2017-04-30	2017-05-16 07:04:49.155422	2017-05-16 07:04:49.155422	\N	58	5
6	2017-01-01	2017-04-30	2017-05-16 07:04:49.21263	2017-05-16 07:04:49.21263	\N	60	6
7	2017-01-01	2017-04-30	2017-05-16 07:04:49.267442	2017-05-16 07:04:49.267442	\N	63	7
8	2017-01-01	2017-04-30	2017-05-16 07:04:49.322694	2017-05-16 07:04:49.322694	\N	65	8
9	2017-01-01	2017-04-30	2017-05-16 07:04:49.377686	2017-05-16 07:04:49.377686	\N	67	9
10	2017-01-01	2017-04-30	2017-05-16 07:04:49.433418	2017-05-16 07:04:49.433418	\N	69	10
11	0017-12-10	2017-04-30	2017-05-16 07:04:49.489653	2017-05-16 07:04:49.489653	\N	71	11
12	2017-01-01	2017-04-30	2017-05-16 07:04:49.544632	2017-05-16 07:04:49.544632	\N	65	12
13	2017-01-01	2017-04-30	2017-05-16 07:04:49.600887	2017-05-16 07:04:49.600887	\N	99	13
14	2017-01-01	2017-04-30	2017-05-16 07:04:49.657122	2017-05-16 07:04:49.657122	\N	80	14
15	2017-01-01	2017-04-30	2017-05-16 07:04:49.71243	2017-05-16 07:04:49.71243	\N	89	15
16	2017-01-01	2017-04-30	2017-05-16 07:04:49.780848	2017-05-16 07:04:49.780848	\N	67	16
17	2017-01-01	2017-04-30	2017-05-16 07:04:49.835196	2017-05-16 07:04:49.835196	\N	97	17
18	2017-01-01	2017-04-30	2017-05-16 07:04:49.889749	2017-05-16 07:04:49.889749	\N	75	18
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 18, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
2	0	2017-05-16 07:04:57.107346	2017-05-16 07:04:57.107346	2
3	0	2017-05-16 07:04:57.161659	2017-05-16 07:04:57.161659	3
4	0	2017-05-16 07:04:57.215772	2017-05-16 07:04:57.215772	4
5	0	2017-05-16 07:04:57.27417	2017-05-16 07:04:57.27417	5
6	0	2017-05-16 07:04:57.329667	2017-05-16 07:04:57.329667	6
7	0	2017-05-16 07:04:57.382326	2017-05-16 07:04:57.382326	7
8	0	2017-05-16 07:04:57.439295	2017-05-16 07:04:57.439295	8
9	0	2017-05-16 07:04:57.536289	2017-05-16 07:04:57.536289	9
10	0	2017-05-16 07:04:57.594739	2017-05-16 07:04:57.594739	10
11	0	2017-05-16 07:04:57.651077	2017-05-16 07:04:57.651077	11
12	0	2017-05-16 07:04:57.704162	2017-05-16 07:04:57.704162	12
13	0	2017-05-16 07:04:57.750801	2017-05-16 07:04:57.750801	13
14	0	2017-05-16 07:04:57.805123	2017-05-16 07:04:57.805123	14
15	0	2017-05-16 07:04:57.863105	2017-05-16 07:04:57.863105	15
16	0	2017-05-16 07:04:57.918373	2017-05-16 07:04:57.918373	16
17	0	2017-05-16 07:04:57.971475	2017-05-16 07:04:57.971475	17
18	0	2017-05-16 07:04:58.016274	2017-05-16 07:04:58.016274	18
1	324	2017-05-16 07:04:57.041188	2017-05-16 10:16:09.047067	1
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 18, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
3	288	f	2017-05-16 07:04:50.280339	2017-05-16 07:04:50.280339	3	1	1	\N	\N
4	288	f	2017-05-16 07:04:50.396683	2017-05-16 07:04:50.396683	4	1	1	\N	\N
5	288	f	2017-05-16 07:04:50.499163	2017-05-16 07:04:50.499163	1	2	2	\N	\N
6	288	f	2017-05-16 07:04:50.582485	2017-05-16 07:04:50.582485	2	2	2	\N	\N
7	288	f	2017-05-16 07:04:50.674638	2017-05-16 07:04:50.674638	3	2	2	\N	\N
8	288	f	2017-05-16 07:04:50.789398	2017-05-16 07:04:50.789398	4	2	2	\N	\N
9	288	f	2017-05-16 07:04:50.951262	2017-05-16 07:04:50.951262	1	3	3	\N	\N
10	288	f	2017-05-16 07:04:51.037548	2017-05-16 07:04:51.037548	2	3	3	\N	\N
11	288	f	2017-05-16 07:04:51.133021	2017-05-16 07:04:51.133021	3	3	3	\N	\N
12	288	f	2017-05-16 07:04:51.23543	2017-05-16 07:04:51.23543	4	3	3	\N	\N
13	288	f	2017-05-16 07:04:51.328641	2017-05-16 07:04:51.328641	1	4	4	\N	\N
14	288	f	2017-05-16 07:04:51.414585	2017-05-16 07:04:51.414585	2	4	4	\N	\N
15	288	f	2017-05-16 07:04:51.495882	2017-05-16 07:04:51.495882	3	4	4	\N	\N
16	288	f	2017-05-16 07:04:51.59576	2017-05-16 07:04:51.59576	4	4	4	\N	\N
17	288	f	2017-05-16 07:04:51.690761	2017-05-16 07:04:51.690761	1	5	5	\N	\N
18	288	f	2017-05-16 07:04:51.7697	2017-05-16 07:04:51.7697	2	5	5	\N	\N
19	288	f	2017-05-16 07:04:51.852983	2017-05-16 07:04:51.852983	3	5	5	\N	\N
20	288	f	2017-05-16 07:04:51.96299	2017-05-16 07:04:51.96299	4	5	5	\N	\N
21	288	f	2017-05-16 07:04:52.06295	2017-05-16 07:04:52.06295	1	6	6	\N	\N
22	288	f	2017-05-16 07:04:52.144948	2017-05-16 07:04:52.144948	2	6	6	\N	\N
23	288	f	2017-05-16 07:04:52.227316	2017-05-16 07:04:52.227316	3	6	6	\N	\N
24	288	f	2017-05-16 07:04:52.331551	2017-05-16 07:04:52.331551	4	6	6	\N	\N
25	288	f	2017-05-16 07:04:52.42928	2017-05-16 07:04:52.42928	1	7	7	\N	\N
26	288	f	2017-05-16 07:04:52.54654	2017-05-16 07:04:52.54654	2	7	7	\N	\N
27	288	f	2017-05-16 07:04:52.64452	2017-05-16 07:04:52.64452	3	7	7	\N	\N
28	288	f	2017-05-16 07:04:52.745126	2017-05-16 07:04:52.745126	4	7	7	\N	\N
29	288	f	2017-05-16 07:04:52.848156	2017-05-16 07:04:52.848156	1	8	8	\N	\N
30	288	f	2017-05-16 07:04:52.93714	2017-05-16 07:04:52.93714	2	8	8	\N	\N
31	288	f	2017-05-16 07:04:53.021003	2017-05-16 07:04:53.021003	3	8	8	\N	\N
32	288	f	2017-05-16 07:04:53.12425	2017-05-16 07:04:53.12425	4	8	8	\N	\N
33	288	f	2017-05-16 07:04:53.21867	2017-05-16 07:04:53.21867	1	9	9	\N	\N
34	288	f	2017-05-16 07:04:53.304143	2017-05-16 07:04:53.304143	2	9	9	\N	\N
35	288	f	2017-05-16 07:04:53.398609	2017-05-16 07:04:53.398609	3	9	9	\N	\N
36	288	f	2017-05-16 07:04:53.506698	2017-05-16 07:04:53.506698	4	9	9	\N	\N
37	288	f	2017-05-16 07:04:53.604447	2017-05-16 07:04:53.604447	1	10	10	\N	\N
38	288	f	2017-05-16 07:04:53.680884	2017-05-16 07:04:53.680884	2	10	10	\N	\N
39	288	f	2017-05-16 07:04:53.807577	2017-05-16 07:04:53.807577	3	10	10	\N	\N
40	288	f	2017-05-16 07:04:53.908528	2017-05-16 07:04:53.908528	4	10	10	\N	\N
41	288	f	2017-05-16 07:04:54.007566	2017-05-16 07:04:54.007566	1	11	11	\N	\N
42	288	f	2017-05-16 07:04:54.094319	2017-05-16 07:04:54.094319	2	11	11	\N	\N
43	288	f	2017-05-16 07:04:54.17295	2017-05-16 07:04:54.17295	3	11	11	\N	\N
44	288	f	2017-05-16 07:04:54.274549	2017-05-16 07:04:54.274549	4	11	11	\N	\N
45	288	f	2017-05-16 07:04:54.372959	2017-05-16 07:04:54.372959	1	12	12	\N	\N
46	288	f	2017-05-16 07:04:54.445965	2017-05-16 07:04:54.445965	2	12	12	\N	\N
47	288	f	2017-05-16 07:04:54.532267	2017-05-16 07:04:54.532267	3	12	12	\N	\N
48	288	f	2017-05-16 07:04:54.632666	2017-05-16 07:04:54.632666	4	12	12	\N	\N
49	288	f	2017-05-16 07:04:54.731952	2017-05-16 07:04:54.731952	1	13	13	\N	\N
50	288	f	2017-05-16 07:04:54.81653	2017-05-16 07:04:54.81653	2	13	13	\N	\N
51	288	f	2017-05-16 07:04:54.898336	2017-05-16 07:04:54.898336	3	13	13	\N	\N
52	288	f	2017-05-16 07:04:55.001122	2017-05-16 07:04:55.001122	4	13	13	\N	\N
53	288	f	2017-05-16 07:04:55.097151	2017-05-16 07:04:55.097151	1	14	14	\N	\N
54	288	f	2017-05-16 07:04:55.180729	2017-05-16 07:04:55.180729	2	14	14	\N	\N
55	288	f	2017-05-16 07:04:55.272593	2017-05-16 07:04:55.272593	3	14	14	\N	\N
56	288	f	2017-05-16 07:04:55.376599	2017-05-16 07:04:55.376599	4	14	14	\N	\N
57	288	f	2017-05-16 07:04:55.476268	2017-05-16 07:04:55.476268	1	15	15	\N	\N
58	288	f	2017-05-16 07:04:55.562474	2017-05-16 07:04:55.562474	2	15	15	\N	\N
59	288	f	2017-05-16 07:04:55.644112	2017-05-16 07:04:55.644112	3	15	15	\N	\N
60	288	f	2017-05-16 07:04:55.746667	2017-05-16 07:04:55.746667	4	15	15	\N	\N
61	288	f	2017-05-16 07:04:55.839925	2017-05-16 07:04:55.839925	1	16	16	\N	\N
62	288	f	2017-05-16 07:04:55.925191	2017-05-16 07:04:55.925191	2	16	16	\N	\N
63	288	f	2017-05-16 07:04:56.008789	2017-05-16 07:04:56.008789	3	16	16	\N	\N
64	288	f	2017-05-16 07:04:56.11241	2017-05-16 07:04:56.11241	4	16	16	\N	\N
65	288	f	2017-05-16 07:04:56.208249	2017-05-16 07:04:56.208249	1	17	17	\N	\N
66	288	f	2017-05-16 07:04:56.294736	2017-05-16 07:04:56.294736	2	17	17	\N	\N
67	288	f	2017-05-16 07:04:56.430541	2017-05-16 07:04:56.430541	3	17	17	\N	\N
68	288	f	2017-05-16 07:04:56.536414	2017-05-16 07:04:56.536414	4	17	17	\N	\N
69	288	f	2017-05-16 07:04:56.653613	2017-05-16 07:04:56.653613	1	18	18	\N	\N
70	288	f	2017-05-16 07:04:56.73856	2017-05-16 07:04:56.73856	2	18	18	\N	\N
71	288	f	2017-05-16 07:04:56.830548	2017-05-16 07:04:56.830548	3	18	18	\N	\N
72	288	f	2017-05-16 07:04:56.932599	2017-05-16 07:04:56.932599	4	18	18	\N	\N
1	288	t	2017-05-16 07:04:50.069889	2017-05-16 10:12:35.498865	1	1	1	1	\N
2	288	t	2017-05-16 07:04:50.173613	2017-05-16 10:16:09.010653	2	1	1	2	\N
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
1	Finanzas	2017-05-16 07:04:18.887274	2017-05-16 07:04:18.887274
2	Recursos Humanos	2017-05-16 07:04:19.051271	2017-05-16 07:04:19.051271
3	Evaluación	2017-05-16 07:04:19.106636	2017-05-16 07:04:19.106636
4	Logística	2017-05-16 07:04:19.15907	2017-05-16 07:04:19.15907
5	Dirección	2017-05-16 07:04:19.204127	2017-05-16 07:04:19.204127
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-05-16 07:04:46.945868	2017-05-16 07:04:46.945868
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
1	Marketing	Análisis del comportamiento de los mercados y de los consumidores	2017-05-16 07:04:58.125104	2017-05-16 07:04:58.125104
2	Diseño Gráfico	-	2017-05-16 07:04:58.183604	2017-05-16 07:04:58.183604
3	Diseño Web	-	2017-05-16 07:04:58.24119	2017-05-16 07:04:58.24119
4	Fotografía	-	2017-05-16 07:04:58.294461	2017-05-16 07:04:58.294461
5	Multimedios	Televisión, Radio, Periódicos, Internet	2017-05-16 07:04:58.352824	2017-05-16 07:04:58.352824
6	Community Manager	Es el profesional responsable de construir, gestionar y administrar la comunidad online alrededor de una marca en Internet, creando y manteniendo relaciones estables y duraderas con sus clientes, sus fans y, en general, cualquier usuario interesado en la marca.	2017-05-16 07:04:58.405453	2017-05-16 07:04:58.405453
7	Crowdfunding	El crowdfunding o micromecenazgo, en castellano, es una red de financiación colectiva, normalmente online, que a través de donaciones económicas o de otro tipo, consiguen financiar un determinado proyecto a cambio de recompensas, participaciones de forma altruista.	2017-05-16 07:04:58.451923	2017-05-16 07:04:58.451923
8	Programador Java	-	2017-05-16 07:04:58.505457	2017-05-16 07:04:58.505457
9	Programador PHP	-	2017-05-16 07:04:58.550889	2017-05-16 07:04:58.550889
10	Programador web	Programador en los lenguajes HTML, CSS, Javascript.	2017-05-16 07:04:58.607433	2017-05-16 07:04:58.607433
11	Impresiones de anuncios gigantes	Carteles Publicitarios, vallas, gigantografías	2017-05-16 07:04:58.661155	2017-05-16 07:04:58.661155
12	Consultoría	-	2017-05-16 07:04:58.70832	2017-05-16 07:04:58.70832
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 12, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-05-16 07:04:40.576771	2017-05-16 07:04:40.576771
2	Doing	f	1	\N	2017-05-16 07:04:40.688104	2017-05-16 07:04:40.688104
3	Done	t	2	\N	2017-05-16 07:04:40.750492	2017-05-16 07:04:40.750492
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-05-16 07:04:28.496293	2017-05-16 07:04:28.496293
2	Incubación	-	1	2017-05-16 07:04:28.558113	2017-05-16 07:04:28.558113
3	post incubacion	-	2	2017-05-16 07:04:28.614422	2017-05-16 07:04:28.614422
4	Cuarta etapa	-	\N	2017-05-16 07:04:28.663242	2017-05-16 07:04:28.663242
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at) FROM stdin;
1	EV-001	Reunion con Programadores 	Evento que tiene como objetivo poner en contacto programadores con miembros de equipos de los distintos proyectos para que celebren contratos de sistemas de gestión del negocio de dichos proyectos.	2017-05-15	08:00:00	2017-05-16 07:05:01.035356	2017-05-16 07:05:01.035356
2	EV-002	Conferencia de Marketing	Presentación de distintos expertos en el área de marketing que tiene como objetivo que los miembros de equipos de proyectos adquieran conocimientos básicos sobre como promocionar de manera apropiada su producto o servicio. 	2017-05-16	08:00:00	2017-05-16 07:05:01.114865	2017-05-16 07:05:01.114865
\.


--
-- Data for Name: eventos_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_especialidades (id, created_at, updated_at, especialidad_de_contacto_id, evento_id) FROM stdin;
1	2017-05-16 07:05:01.194214	2017-05-16 07:05:01.194214	3	1
2	2017-05-16 07:05:01.214837	2017-05-16 07:05:01.214837	10	1
3	2017-05-16 07:05:01.237774	2017-05-16 07:05:01.237774	8	1
4	2017-05-16 07:05:01.260291	2017-05-16 07:05:01.260291	9	1
5	2017-05-16 07:05:01.281356	2017-05-16 07:05:01.281356	1	2
6	2017-05-16 07:05:01.304512	2017-05-16 07:05:01.304512	5	2
7	2017-05-16 07:05:01.326784	2017-05-16 07:05:01.326784	12	2
\.


--
-- Name: eventos_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_especialidades_id_seq', 7, true);


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_id_seq', 2, true);


--
-- Data for Name: eventos_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_proyectos (id, created_at, updated_at, proyecto_id, evento_id) FROM stdin;
1	2017-05-16 07:05:01.627075	2017-05-16 07:05:01.627075	4	1
2	2017-05-16 07:05:01.685608	2017-05-16 07:05:01.685608	5	1
3	2017-05-16 07:05:01.741907	2017-05-16 07:05:01.741907	7	1
4	2017-05-16 07:05:01.797721	2017-05-16 07:05:01.797721	8	1
5	2017-05-16 07:05:01.854865	2017-05-16 07:05:01.854865	9	1
6	2017-05-16 07:05:01.91049	2017-05-16 07:05:01.91049	14	1
7	2017-05-16 07:05:01.997502	2017-05-16 07:05:01.997502	16	1
8	2017-05-16 07:05:02.052823	2017-05-16 07:05:02.052823	1	2
9	2017-05-16 07:05:02.111431	2017-05-16 07:05:02.111431	2	2
10	2017-05-16 07:05:02.166149	2017-05-16 07:05:02.166149	3	2
11	2017-05-16 07:05:02.223188	2017-05-16 07:05:02.223188	4	2
12	2017-05-16 07:05:02.277253	2017-05-16 07:05:02.277253	5	2
13	2017-05-16 07:05:02.3336	2017-05-16 07:05:02.3336	6	2
14	2017-05-16 07:05:02.388696	2017-05-16 07:05:02.388696	7	2
15	2017-05-16 07:05:02.443191	2017-05-16 07:05:02.443191	8	2
16	2017-05-16 07:05:02.540799	2017-05-16 07:05:02.540799	9	2
17	2017-05-16 07:05:02.597658	2017-05-16 07:05:02.597658	10	2
18	2017-05-16 07:05:02.656014	2017-05-16 07:05:02.656014	11	2
19	2017-05-16 07:05:02.708761	2017-05-16 07:05:02.708761	12	2
20	2017-05-16 07:05:02.75293	2017-05-16 07:05:02.75293	13	2
21	2017-05-16 07:05:02.796973	2017-05-16 07:05:02.796973	14	2
22	2017-05-16 07:05:02.84505	2017-05-16 07:05:02.84505	15	2
23	2017-05-16 07:05:02.89844	2017-05-16 07:05:02.89844	16	2
24	2017-05-16 07:05:02.942247	2017-05-16 07:05:02.942247	17	2
25	2017-05-16 07:05:02.987161	2017-05-16 07:05:02.987161	18	2
\.


--
-- Name: eventos_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_proyectos_id_seq', 25, true);


--
-- Data for Name: historiales; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY historiales (id, "fechaHora", created_at, updated_at, actividad_proyecto_id, estado_id, proyecto_id, user_id) FROM stdin;
1	2017-01-01 08:20:00	2017-05-16 07:04:43.626079	2017-05-16 07:04:43.626079	1	1	1	3
2	2017-01-01 08:20:00	2017-05-16 07:04:43.65391	2017-05-16 07:04:43.65391	2	1	1	3
3	2017-01-01 08:21:00	2017-05-16 07:04:43.677829	2017-05-16 07:04:43.677829	3	1	1	3
4	2017-01-01 08:22:00	2017-05-16 07:04:43.698677	2017-05-16 07:04:43.698677	1	2	1	3
5	2017-01-02 08:22:00	2017-05-16 07:04:43.720647	2017-05-16 07:04:43.720647	2	2	1	3
6	2017-01-08 08:23:00	2017-05-16 07:04:43.742686	2017-05-16 07:04:43.742686	3	2	1	3
7	2017-01-01 08:23:00	2017-05-16 07:04:43.766282	2017-05-16 07:04:43.766282	1	3	1	3
8	2017-01-06 08:24:00	2017-05-16 07:04:43.788995	2017-05-16 07:04:43.788995	2	3	1	3
9	2017-01-01 08:20:00	2017-05-16 07:04:43.809878	2017-05-16 07:04:43.809878	4	1	2	3
10	2017-01-01 08:20:00	2017-05-16 07:04:43.833154	2017-05-16 07:04:43.833154	5	1	2	3
11	2017-01-01 08:21:00	2017-05-16 07:04:43.855376	2017-05-16 07:04:43.855376	6	1	2	3
12	2017-01-01 08:22:00	2017-05-16 07:04:43.875575	2017-05-16 07:04:43.875575	4	2	2	3
13	2017-01-02 08:22:00	2017-05-16 07:04:43.898612	2017-05-16 07:04:43.898612	5	2	2	3
14	2017-01-08 08:23:00	2017-05-16 07:04:43.92204	2017-05-16 07:04:43.92204	6	2	2	3
15	2017-01-01 08:23:00	2017-05-16 07:04:43.94405	2017-05-16 07:04:43.94405	4	3	2	3
16	2017-01-06 08:24:00	2017-05-16 07:04:43.964428	2017-05-16 07:04:43.964428	5	3	2	3
17	2017-01-01 08:20:00	2017-05-16 07:04:43.987972	2017-05-16 07:04:43.987972	7	1	3	2
18	2017-01-01 08:20:00	2017-05-16 07:04:44.009374	2017-05-16 07:04:44.009374	8	1	3	2
19	2017-01-01 08:21:00	2017-05-16 07:04:44.032736	2017-05-16 07:04:44.032736	9	1	3	2
20	2017-01-01 08:22:00	2017-05-16 07:04:44.054074	2017-05-16 07:04:44.054074	7	2	3	2
21	2017-01-02 08:22:00	2017-05-16 07:04:44.077671	2017-05-16 07:04:44.077671	8	2	3	2
22	2017-01-08 08:23:00	2017-05-16 07:04:44.099812	2017-05-16 07:04:44.099812	9	2	3	2
23	2017-01-01 08:23:00	2017-05-16 07:04:44.121872	2017-05-16 07:04:44.121872	7	3	3	2
24	2017-01-06 08:24:00	2017-05-16 07:04:44.143731	2017-05-16 07:04:44.143731	8	3	3	2
25	2017-01-01 08:20:00	2017-05-16 07:04:44.164861	2017-05-16 07:04:44.164861	10	1	4	2
26	2017-01-01 08:20:00	2017-05-16 07:04:44.188312	2017-05-16 07:04:44.188312	11	1	4	2
27	2017-01-01 08:21:00	2017-05-16 07:04:44.210931	2017-05-16 07:04:44.210931	12	1	4	2
28	2017-01-01 08:22:00	2017-05-16 07:04:44.232947	2017-05-16 07:04:44.232947	10	2	4	2
29	2017-01-02 08:22:00	2017-05-16 07:04:44.254221	2017-05-16 07:04:44.254221	11	2	4	2
30	2017-01-08 08:23:00	2017-05-16 07:04:44.27611	2017-05-16 07:04:44.27611	12	2	4	2
31	2017-01-01 08:23:00	2017-05-16 07:04:44.299208	2017-05-16 07:04:44.299208	10	3	4	2
32	2017-01-06 08:24:00	2017-05-16 07:04:44.320767	2017-05-16 07:04:44.320767	11	3	4	2
33	2017-01-01 08:20:00	2017-05-16 07:04:44.344247	2017-05-16 07:04:44.344247	13	1	5	3
34	2017-01-01 08:20:00	2017-05-16 07:04:44.366511	2017-05-16 07:04:44.366511	14	1	5	3
35	2017-01-01 08:21:00	2017-05-16 07:04:44.388496	2017-05-16 07:04:44.388496	15	1	5	3
36	2017-01-01 08:22:00	2017-05-16 07:04:44.409255	2017-05-16 07:04:44.409255	13	2	5	3
37	2017-01-02 08:22:00	2017-05-16 07:04:44.433348	2017-05-16 07:04:44.433348	14	2	5	3
38	2017-01-08 08:23:00	2017-05-16 07:04:44.45462	2017-05-16 07:04:44.45462	15	2	5	3
39	2017-01-01 08:23:00	2017-05-16 07:04:44.476128	2017-05-16 07:04:44.476128	13	3	5	3
40	2017-01-06 08:24:00	2017-05-16 07:04:44.500095	2017-05-16 07:04:44.500095	14	3	5	3
41	2017-01-01 08:20:00	2017-05-16 07:04:44.521262	2017-05-16 07:04:44.521262	16	1	6	3
42	2017-01-01 08:20:00	2017-05-16 07:04:44.544247	2017-05-16 07:04:44.544247	17	1	6	3
43	2017-01-01 08:21:00	2017-05-16 07:04:44.564969	2017-05-16 07:04:44.564969	18	1	6	3
44	2017-01-01 08:22:00	2017-05-16 07:04:44.588912	2017-05-16 07:04:44.588912	16	2	6	3
45	2017-01-02 08:22:00	2017-05-16 07:04:44.609937	2017-05-16 07:04:44.609937	17	2	6	3
46	2017-01-08 08:23:00	2017-05-16 07:04:44.633356	2017-05-16 07:04:44.633356	18	2	6	3
47	2017-01-01 08:23:00	2017-05-16 07:04:44.655527	2017-05-16 07:04:44.655527	16	3	6	3
48	2017-01-06 08:24:00	2017-05-16 07:04:44.676412	2017-05-16 07:04:44.676412	17	3	6	3
49	2017-01-01 08:20:00	2017-05-16 07:04:44.699358	2017-05-16 07:04:44.699358	19	1	7	2
50	2017-01-01 08:20:00	2017-05-16 07:04:44.72105	2017-05-16 07:04:44.72105	20	1	7	2
51	2017-01-01 08:21:00	2017-05-16 07:04:44.744241	2017-05-16 07:04:44.744241	21	1	7	2
52	2017-01-01 08:22:00	2017-05-16 07:04:44.764824	2017-05-16 07:04:44.764824	19	2	7	2
53	2017-01-02 08:22:00	2017-05-16 07:04:44.789066	2017-05-16 07:04:44.789066	20	2	7	2
54	2017-01-08 08:23:00	2017-05-16 07:04:44.811159	2017-05-16 07:04:44.811159	21	2	7	2
55	2017-01-01 08:23:00	2017-05-16 07:04:44.833307	2017-05-16 07:04:44.833307	19	3	7	2
56	2017-01-06 08:24:00	2017-05-16 07:04:44.855017	2017-05-16 07:04:44.855017	20	3	7	2
57	2017-01-01 08:20:00	2017-05-16 07:04:44.876525	2017-05-16 07:04:44.876525	22	1	8	3
58	2017-01-01 08:20:00	2017-05-16 07:04:44.899331	2017-05-16 07:04:44.899331	23	1	8	3
59	2017-01-01 08:21:00	2017-05-16 07:04:44.921072	2017-05-16 07:04:44.921072	24	1	8	3
60	2017-01-01 08:22:00	2017-05-16 07:04:44.944361	2017-05-16 07:04:44.944361	22	2	8	3
61	2017-01-02 08:22:00	2017-05-16 07:04:44.965697	2017-05-16 07:04:44.965697	23	2	8	3
62	2017-01-08 08:23:00	2017-05-16 07:04:44.989169	2017-05-16 07:04:44.989169	24	2	8	3
63	2017-01-01 08:23:00	2017-05-16 07:04:45.010119	2017-05-16 07:04:45.010119	22	3	8	3
64	2017-01-06 08:24:00	2017-05-16 07:04:45.033755	2017-05-16 07:04:45.033755	23	3	8	3
65	2017-01-01 08:20:00	2017-05-16 07:04:45.055147	2017-05-16 07:04:45.055147	25	1	9	2
66	2017-01-01 08:20:00	2017-05-16 07:04:45.088782	2017-05-16 07:04:45.088782	26	1	9	2
67	2017-01-01 08:21:00	2017-05-16 07:04:45.110227	2017-05-16 07:04:45.110227	27	1	9	2
68	2017-01-01 08:22:00	2017-05-16 07:04:45.15411	2017-05-16 07:04:45.15411	25	2	9	2
69	2017-01-02 08:22:00	2017-05-16 07:04:45.17815	2017-05-16 07:04:45.17815	26	2	9	2
70	2017-01-08 08:23:00	2017-05-16 07:04:45.221379	2017-05-16 07:04:45.221379	27	2	9	2
71	2017-01-01 08:23:00	2017-05-16 07:04:45.244608	2017-05-16 07:04:45.244608	25	3	9	2
72	2017-01-06 08:24:00	2017-05-16 07:04:45.278751	2017-05-16 07:04:45.278751	26	3	9	2
73	2017-01-01 08:20:00	2017-05-16 07:04:45.299809	2017-05-16 07:04:45.299809	28	1	10	3
74	2017-01-01 08:20:00	2017-05-16 07:04:45.32129	2017-05-16 07:04:45.32129	29	1	10	3
75	2017-01-01 08:21:00	2017-05-16 07:04:45.344822	2017-05-16 07:04:45.344822	30	1	10	3
76	2017-01-01 08:22:00	2017-05-16 07:04:45.36513	2017-05-16 07:04:45.36513	28	2	10	3
77	2017-01-02 08:22:00	2017-05-16 07:04:45.389332	2017-05-16 07:04:45.389332	29	2	10	3
78	2017-01-08 08:23:00	2017-05-16 07:04:45.410647	2017-05-16 07:04:45.410647	30	2	10	3
79	2017-01-01 08:23:00	2017-05-16 07:04:45.433443	2017-05-16 07:04:45.433443	28	3	10	3
80	2017-01-06 08:24:00	2017-05-16 07:04:45.455137	2017-05-16 07:04:45.455137	29	3	10	3
81	2017-01-01 08:20:00	2017-05-16 07:04:45.477089	2017-05-16 07:04:45.477089	31	1	11	3
82	2017-01-01 08:20:00	2017-05-16 07:04:45.500745	2017-05-16 07:04:45.500745	32	1	11	3
83	2017-01-01 08:21:00	2017-05-16 07:04:45.522129	2017-05-16 07:04:45.522129	33	1	11	3
84	2017-01-01 08:22:00	2017-05-16 07:04:45.544551	2017-05-16 07:04:45.544551	31	2	11	3
85	2017-01-02 08:22:00	2017-05-16 07:04:45.56542	2017-05-16 07:04:45.56542	32	2	11	3
86	2017-01-08 08:23:00	2017-05-16 07:04:45.589364	2017-05-16 07:04:45.589364	33	2	11	3
87	2017-01-01 08:23:00	2017-05-16 07:04:45.61079	2017-05-16 07:04:45.61079	31	3	11	3
88	2017-01-06 08:24:00	2017-05-16 07:04:45.632283	2017-05-16 07:04:45.632283	32	3	11	3
89	2017-01-01 08:20:00	2017-05-16 07:04:45.6552	2017-05-16 07:04:45.6552	34	1	12	3
90	2017-01-01 08:20:00	2017-05-16 07:04:45.678232	2017-05-16 07:04:45.678232	35	1	12	3
91	2017-01-01 08:21:00	2017-05-16 07:04:45.699952	2017-05-16 07:04:45.699952	36	1	12	3
92	2017-01-01 08:22:00	2017-05-16 07:04:45.721608	2017-05-16 07:04:45.721608	34	2	12	3
93	2017-01-02 08:22:00	2017-05-16 07:04:45.7449	2017-05-16 07:04:45.7449	35	2	12	3
94	2017-01-08 08:23:00	2017-05-16 07:04:45.767282	2017-05-16 07:04:45.767282	36	2	12	3
95	2017-01-01 08:23:00	2017-05-16 07:04:45.7894	2017-05-16 07:04:45.7894	34	3	12	3
96	2017-01-06 08:24:00	2017-05-16 07:04:45.810789	2017-05-16 07:04:45.810789	35	3	12	3
97	2017-01-01 08:20:00	2017-05-16 07:04:45.832627	2017-05-16 07:04:45.832627	37	1	13	2
98	2017-01-01 08:20:00	2017-05-16 07:04:45.856111	2017-05-16 07:04:45.856111	38	1	13	2
99	2017-01-01 08:21:00	2017-05-16 07:04:45.876928	2017-05-16 07:04:45.876928	39	1	13	2
100	2017-01-01 08:22:00	2017-05-16 07:04:45.900081	2017-05-16 07:04:45.900081	37	2	13	2
101	2017-01-02 08:22:00	2017-05-16 07:04:45.921229	2017-05-16 07:04:45.921229	38	2	13	2
102	2017-01-08 08:23:00	2017-05-16 07:04:45.94522	2017-05-16 07:04:45.94522	39	2	13	2
103	2017-01-01 08:23:00	2017-05-16 07:04:45.965775	2017-05-16 07:04:45.965775	37	3	13	2
104	2017-01-06 08:24:00	2017-05-16 07:04:45.989445	2017-05-16 07:04:45.989445	38	3	13	2
105	2017-01-01 08:20:00	2017-05-16 07:04:46.010987	2017-05-16 07:04:46.010987	40	1	14	2
106	2017-01-01 08:20:00	2017-05-16 07:04:46.033178	2017-05-16 07:04:46.033178	41	1	14	2
107	2017-01-01 08:21:00	2017-05-16 07:04:46.056544	2017-05-16 07:04:46.056544	42	1	14	2
108	2017-01-01 08:22:00	2017-05-16 07:04:46.077246	2017-05-16 07:04:46.077246	40	2	14	2
109	2017-01-02 08:22:00	2017-05-16 07:04:46.100396	2017-05-16 07:04:46.100396	41	2	14	2
110	2017-01-08 08:23:00	2017-05-16 07:04:46.121005	2017-05-16 07:04:46.121005	42	2	14	2
111	2017-01-01 08:23:00	2017-05-16 07:04:46.145382	2017-05-16 07:04:46.145382	40	3	14	2
112	2017-01-06 08:24:00	2017-05-16 07:04:46.166691	2017-05-16 07:04:46.166691	41	3	14	2
113	2017-01-01 08:20:00	2017-05-16 07:04:46.189711	2017-05-16 07:04:46.189711	43	1	15	3
114	2017-01-01 08:20:00	2017-05-16 07:04:46.211341	2017-05-16 07:04:46.211341	44	1	15	3
115	2017-01-01 08:21:00	2017-05-16 07:04:46.232601	2017-05-16 07:04:46.232601	45	1	15	3
116	2017-01-01 08:22:00	2017-05-16 07:04:46.256419	2017-05-16 07:04:46.256419	43	2	15	3
117	2017-01-02 08:22:00	2017-05-16 07:04:46.277956	2017-05-16 07:04:46.277956	44	2	15	3
118	2017-01-08 08:23:00	2017-05-16 07:04:46.300437	2017-05-16 07:04:46.300437	45	2	15	3
119	2017-01-01 08:23:00	2017-05-16 07:04:46.321154	2017-05-16 07:04:46.321154	43	3	15	3
120	2017-01-06 08:24:00	2017-05-16 07:04:46.345216	2017-05-16 07:04:46.345216	44	3	15	3
121	2017-01-01 08:20:00	2017-05-16 07:04:46.366247	2017-05-16 07:04:46.366247	46	1	16	3
122	2017-01-01 08:20:00	2017-05-16 07:04:46.389802	2017-05-16 07:04:46.389802	47	1	16	3
123	2017-01-01 08:21:00	2017-05-16 07:04:46.411447	2017-05-16 07:04:46.411447	48	1	16	3
124	2017-01-01 08:22:00	2017-05-16 07:04:46.432842	2017-05-16 07:04:46.432842	46	2	16	3
125	2017-01-02 08:22:00	2017-05-16 07:04:46.45649	2017-05-16 07:04:46.45649	47	2	16	3
126	2017-01-08 08:23:00	2017-05-16 07:04:46.47886	2017-05-16 07:04:46.47886	48	2	16	3
127	2017-01-01 08:23:00	2017-05-16 07:04:46.500792	2017-05-16 07:04:46.500792	46	3	16	3
128	2017-01-06 08:24:00	2017-05-16 07:04:46.521748	2017-05-16 07:04:46.521748	47	3	16	3
129	2017-01-01 08:20:00	2017-05-16 07:04:46.545345	2017-05-16 07:04:46.545345	49	1	17	3
130	2017-01-01 08:20:00	2017-05-16 07:04:46.566515	2017-05-16 07:04:46.566515	50	1	17	3
131	2017-01-01 08:21:00	2017-05-16 07:04:46.588394	2017-05-16 07:04:46.588394	51	1	17	3
132	2017-01-01 08:22:00	2017-05-16 07:04:46.612045	2017-05-16 07:04:46.612045	49	2	17	3
133	2017-01-02 08:22:00	2017-05-16 07:04:46.632762	2017-05-16 07:04:46.632762	50	2	17	3
134	2017-01-08 08:23:00	2017-05-16 07:04:46.656291	2017-05-16 07:04:46.656291	51	2	17	3
135	2017-01-01 08:23:00	2017-05-16 07:04:46.67741	2017-05-16 07:04:46.67741	49	3	17	3
136	2017-01-06 08:24:00	2017-05-16 07:04:46.700961	2017-05-16 07:04:46.700961	50	3	17	3
137	2017-01-01 08:20:00	2017-05-16 07:04:46.721245	2017-05-16 07:04:46.721245	52	1	18	3
138	2017-01-01 08:20:00	2017-05-16 07:04:46.745677	2017-05-16 07:04:46.745677	53	1	18	3
139	2017-01-01 08:21:00	2017-05-16 07:04:46.766718	2017-05-16 07:04:46.766718	54	1	18	3
140	2017-01-01 08:22:00	2017-05-16 07:04:46.788254	2017-05-16 07:04:46.788254	52	2	18	3
141	2017-01-02 08:22:00	2017-05-16 07:04:46.811733	2017-05-16 07:04:46.811733	53	2	18	3
142	2017-01-08 08:23:00	2017-05-16 07:04:46.832878	2017-05-16 07:04:46.832878	54	2	18	3
143	2017-01-01 08:23:00	2017-05-16 07:04:46.856305	2017-05-16 07:04:46.856305	52	3	18	3
144	2017-01-06 08:24:00	2017-05-16 07:04:46.877105	2017-05-16 07:04:46.877105	53	3	18	3
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 144, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-05-16 07:04:47.045159	2017-05-16 07:04:47.045159
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
1	Actividad	2017-05-16 07:04:33.123193	2017-05-16 07:04:33.123193
2	Area	2017-05-16 07:04:33.154286	2017-05-16 07:04:33.154286
3	Ciudad	2017-05-16 07:04:33.175345	2017-05-16 07:04:33.175345
4	ConceptoDePago	2017-05-16 07:04:33.197835	2017-05-16 07:04:33.197835
5	Contacto	2017-05-16 07:04:33.221104	2017-05-16 07:04:33.221104
6	Contrato	2017-05-16 07:04:33.241074	2017-05-16 07:04:33.241074
7	Cuenta	2017-05-16 07:04:33.26438	2017-05-16 07:04:33.26438
8	Departamento	2017-05-16 07:04:33.287004	2017-05-16 07:04:33.287004
9	Descuento	2017-05-16 07:04:33.30888	2017-05-16 07:04:33.30888
10	Empleado	2017-05-16 07:04:33.330563	2017-05-16 07:04:33.330563
11	EspecialidadDeContacto	2017-05-16 07:04:33.352579	2017-05-16 07:04:33.352579
12	Estado	2017-05-16 07:04:33.375982	2017-05-16 07:04:33.375982
13	Etapa	2017-05-16 07:04:33.398059	2017-05-16 07:04:33.398059
14	Evento	2017-05-16 07:04:33.420025	2017-05-16 07:04:33.420025
15	EventoProyecto	2017-05-16 07:04:33.441153	2017-05-16 07:04:33.441153
16	MiembroEquipo	2017-05-16 07:04:33.465452	2017-05-16 07:04:33.465452
17	Pago	2017-05-16 07:04:33.486542	2017-05-16 07:04:33.486542
18	Pais	2017-05-16 07:04:33.509905	2017-05-16 07:04:33.509905
19	Provincia	2017-05-16 07:04:33.530453	2017-05-16 07:04:33.530453
20	Proyecto	2017-05-16 07:04:33.553023	2017-05-16 07:04:33.553023
21	Rol	2017-05-16 07:04:33.576734	2017-05-16 07:04:33.576734
22	RolDeEmpleado	2017-05-16 07:04:33.598313	2017-05-16 07:04:33.598313
23	TipoDocumento	2017-05-16 07:04:33.619268	2017-05-16 07:04:33.619268
24	TipoDePago	2017-05-16 07:04:33.641011	2017-05-16 07:04:33.641011
25	User	2017-05-16 07:04:33.665587	2017-05-16 07:04:33.665587
26	ActividadProyecto	2017-05-16 07:04:33.687152	2017-05-16 07:04:33.687152
27	CuotaPorCliente	2017-05-16 07:04:33.709899	2017-05-16 07:04:33.709899
28	Accion	2017-05-16 07:04:33.731375	2017-05-16 07:04:33.731375
29	Modelo	2017-05-16 07:04:33.754045	2017-05-16 07:04:33.754045
\.


--
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('modelos_id_seq', 29, true);


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos (id, fecha, monto, created_at, updated_at, tipo_de_pago_id, proyecto_id, persona_id, cuenta_id, contrato_id) FROM stdin;
1	2017-05-16	288	2017-05-16 10:12:35.271366	2017-05-16 10:12:35.271366	\N	1	51	1	1
2	2017-05-16	288	2017-05-16 10:16:08.886768	2017-05-16 10:16:08.886768	\N	1	51	1	1
\.


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_id_seq', 2, true);


--
-- Data for Name: pagos_metodos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos_metodos (id, monto, created_at, updated_at, pago_id, tipo_de_pago_id) FROM stdin;
1	300	2017-05-16 10:12:35.427475	2017-05-16 10:12:35.427475	1	1
2	600	2017-05-16 10:16:08.960341	2017-05-16 10:16:08.960341	2	1
\.


--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_metodos_id_seq', 2, true);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY paises (id, nombre, created_at, updated_at) FROM stdin;
1	Argentina	2017-05-16 07:04:18.253746	2017-05-16 07:04:18.253746
2	Paraguay	2017-05-16 07:04:18.283116	2017-05-16 07:04:18.283116
3	Brasil	2017-05-16 07:04:18.303959	2017-05-16 07:04:18.303959
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-05-16 07:04:33.818086	2017-05-16 07:04:33.818086	1	1
2	2017-05-16 07:04:33.837099	2017-05-16 07:04:33.837099	2	1
3	2017-05-16 07:04:33.859907	2017-05-16 07:04:33.859907	3	1
4	2017-05-16 07:04:33.882657	2017-05-16 07:04:33.882657	4	1
5	2017-05-16 07:04:33.904117	2017-05-16 07:04:33.904117	1	2
6	2017-05-16 07:04:33.927606	2017-05-16 07:04:33.927606	2	2
7	2017-05-16 07:04:33.948904	2017-05-16 07:04:33.948904	3	2
8	2017-05-16 07:04:33.972056	2017-05-16 07:04:33.972056	4	2
9	2017-05-16 07:04:33.993522	2017-05-16 07:04:33.993522	1	3
10	2017-05-16 07:04:34.01527	2017-05-16 07:04:34.01527	2	3
11	2017-05-16 07:04:34.037748	2017-05-16 07:04:34.037748	3	3
12	2017-05-16 07:04:34.059882	2017-05-16 07:04:34.059882	4	3
13	2017-05-16 07:04:34.083079	2017-05-16 07:04:34.083079	1	4
14	2017-05-16 07:04:34.104841	2017-05-16 07:04:34.104841	2	4
15	2017-05-16 07:04:34.127608	2017-05-16 07:04:34.127608	3	4
16	2017-05-16 07:04:34.14901	2017-05-16 07:04:34.14901	4	4
17	2017-05-16 07:04:34.171838	2017-05-16 07:04:34.171838	1	5
18	2017-05-16 07:04:34.193429	2017-05-16 07:04:34.193429	2	5
19	2017-05-16 07:04:34.216656	2017-05-16 07:04:34.216656	3	5
20	2017-05-16 07:04:34.238134	2017-05-16 07:04:34.238134	4	5
21	2017-05-16 07:04:34.259838	2017-05-16 07:04:34.259838	1	6
22	2017-05-16 07:04:34.283207	2017-05-16 07:04:34.283207	2	6
23	2017-05-16 07:04:34.304637	2017-05-16 07:04:34.304637	3	6
24	2017-05-16 07:04:34.32739	2017-05-16 07:04:34.32739	4	6
25	2017-05-16 07:04:34.349087	2017-05-16 07:04:34.349087	1	7
26	2017-05-16 07:04:34.372242	2017-05-16 07:04:34.372242	2	7
27	2017-05-16 07:04:34.393473	2017-05-16 07:04:34.393473	3	7
28	2017-05-16 07:04:34.416807	2017-05-16 07:04:34.416807	4	7
29	2017-05-16 07:04:34.438186	2017-05-16 07:04:34.438186	1	8
30	2017-05-16 07:04:34.460739	2017-05-16 07:04:34.460739	2	8
31	2017-05-16 07:04:34.48316	2017-05-16 07:04:34.48316	3	8
32	2017-05-16 07:04:34.504692	2017-05-16 07:04:34.504692	4	8
33	2017-05-16 07:04:34.527867	2017-05-16 07:04:34.527867	1	9
34	2017-05-16 07:04:34.549135	2017-05-16 07:04:34.549135	2	9
35	2017-05-16 07:04:34.572211	2017-05-16 07:04:34.572211	3	9
36	2017-05-16 07:04:34.593155	2017-05-16 07:04:34.593155	4	9
37	2017-05-16 07:04:34.615605	2017-05-16 07:04:34.615605	1	10
38	2017-05-16 07:04:34.638355	2017-05-16 07:04:34.638355	2	10
39	2017-05-16 07:04:34.659768	2017-05-16 07:04:34.659768	3	10
40	2017-05-16 07:04:34.683229	2017-05-16 07:04:34.683229	4	10
41	2017-05-16 07:04:34.705244	2017-05-16 07:04:34.705244	1	11
42	2017-05-16 07:04:34.727783	2017-05-16 07:04:34.727783	2	11
43	2017-05-16 07:04:34.749902	2017-05-16 07:04:34.749902	3	11
44	2017-05-16 07:04:34.770974	2017-05-16 07:04:34.770974	4	11
45	2017-05-16 07:04:34.793228	2017-05-16 07:04:34.793228	1	12
46	2017-05-16 07:04:34.816837	2017-05-16 07:04:34.816837	2	12
47	2017-05-16 07:04:34.837892	2017-05-16 07:04:34.837892	3	12
48	2017-05-16 07:04:34.861165	2017-05-16 07:04:34.861165	4	12
49	2017-05-16 07:04:34.883043	2017-05-16 07:04:34.883043	1	13
50	2017-05-16 07:04:34.904682	2017-05-16 07:04:34.904682	2	13
51	2017-05-16 07:04:34.927958	2017-05-16 07:04:34.927958	3	13
52	2017-05-16 07:04:34.949008	2017-05-16 07:04:34.949008	4	13
53	2017-05-16 07:04:34.983571	2017-05-16 07:04:34.983571	1	14
54	2017-05-16 07:04:35.005697	2017-05-16 07:04:35.005697	2	14
55	2017-05-16 07:04:35.039144	2017-05-16 07:04:35.039144	3	14
56	2017-05-16 07:04:35.060372	2017-05-16 07:04:35.060372	4	14
57	2017-05-16 07:04:35.093257	2017-05-16 07:04:35.093257	1	15
58	2017-05-16 07:04:35.116673	2017-05-16 07:04:35.116673	2	15
59	2017-05-16 07:04:35.138354	2017-05-16 07:04:35.138354	3	15
60	2017-05-16 07:04:35.160153	2017-05-16 07:04:35.160153	4	15
61	2017-05-16 07:04:35.183806	2017-05-16 07:04:35.183806	1	16
62	2017-05-16 07:04:35.204967	2017-05-16 07:04:35.204967	2	16
63	2017-05-16 07:04:35.227848	2017-05-16 07:04:35.227848	3	16
64	2017-05-16 07:04:35.249563	2017-05-16 07:04:35.249563	4	16
65	2017-05-16 07:04:35.272223	2017-05-16 07:04:35.272223	1	17
66	2017-05-16 07:04:35.294215	2017-05-16 07:04:35.294215	2	17
67	2017-05-16 07:04:35.315386	2017-05-16 07:04:35.315386	3	17
68	2017-05-16 07:04:35.338398	2017-05-16 07:04:35.338398	4	17
69	2017-05-16 07:04:35.361197	2017-05-16 07:04:35.361197	1	18
70	2017-05-16 07:04:35.383095	2017-05-16 07:04:35.383095	2	18
71	2017-05-16 07:04:35.405031	2017-05-16 07:04:35.405031	3	18
72	2017-05-16 07:04:35.427935	2017-05-16 07:04:35.427935	4	18
73	2017-05-16 07:04:35.449315	2017-05-16 07:04:35.449315	1	19
74	2017-05-16 07:04:35.470977	2017-05-16 07:04:35.470977	2	19
75	2017-05-16 07:04:35.493931	2017-05-16 07:04:35.493931	3	19
76	2017-05-16 07:04:35.517144	2017-05-16 07:04:35.517144	4	19
77	2017-05-16 07:04:35.539115	2017-05-16 07:04:35.539115	1	20
78	2017-05-16 07:04:35.560656	2017-05-16 07:04:35.560656	2	20
79	2017-05-16 07:04:35.583802	2017-05-16 07:04:35.583802	3	20
80	2017-05-16 07:04:35.60499	2017-05-16 07:04:35.60499	4	20
81	2017-05-16 07:04:35.62794	2017-05-16 07:04:35.62794	1	21
82	2017-05-16 07:04:35.649343	2017-05-16 07:04:35.649343	2	21
83	2017-05-16 07:04:35.67136	2017-05-16 07:04:35.67136	3	21
84	2017-05-16 07:04:35.694056	2017-05-16 07:04:35.694056	4	21
85	2017-05-16 07:04:35.715563	2017-05-16 07:04:35.715563	1	22
86	2017-05-16 07:04:35.739289	2017-05-16 07:04:35.739289	2	22
87	2017-05-16 07:04:35.772178	2017-05-16 07:04:35.772178	3	22
88	2017-05-16 07:04:35.794317	2017-05-16 07:04:35.794317	4	22
89	2017-05-16 07:04:35.839487	2017-05-16 07:04:35.839487	1	23
90	2017-05-16 07:04:35.860348	2017-05-16 07:04:35.860348	2	23
91	2017-05-16 07:04:35.8948	2017-05-16 07:04:35.8948	3	23
92	2017-05-16 07:04:35.915454	2017-05-16 07:04:35.915454	4	23
93	2017-05-16 07:04:35.960484	2017-05-16 07:04:35.960484	1	24
94	2017-05-16 07:04:35.983198	2017-05-16 07:04:35.983198	2	24
95	2017-05-16 07:04:36.01579	2017-05-16 07:04:36.01579	3	24
96	2017-05-16 07:04:36.038946	2017-05-16 07:04:36.038946	4	24
97	2017-05-16 07:04:36.060913	2017-05-16 07:04:36.060913	1	25
98	2017-05-16 07:04:36.083395	2017-05-16 07:04:36.083395	2	25
99	2017-05-16 07:04:36.105201	2017-05-16 07:04:36.105201	3	25
100	2017-05-16 07:04:36.128086	2017-05-16 07:04:36.128086	4	25
101	2017-05-16 07:04:36.148945	2017-05-16 07:04:36.148945	5	20
102	2017-05-16 07:04:36.173003	2017-05-16 07:04:36.173003	6	1
103	2017-05-16 07:04:36.194923	2017-05-16 07:04:36.194923	6	2
104	2017-05-16 07:04:36.215478	2017-05-16 07:04:36.215478	6	3
105	2017-05-16 07:04:36.238785	2017-05-16 07:04:36.238785	6	4
106	2017-05-16 07:04:36.260558	2017-05-16 07:04:36.260558	6	5
107	2017-05-16 07:04:36.283485	2017-05-16 07:04:36.283485	6	6
108	2017-05-16 07:04:36.305471	2017-05-16 07:04:36.305471	6	7
109	2017-05-16 07:04:36.339609	2017-05-16 07:04:36.339609	6	8
110	2017-05-16 07:04:36.360943	2017-05-16 07:04:36.360943	6	9
111	2017-05-16 07:04:36.393777	2017-05-16 07:04:36.393777	6	10
112	2017-05-16 07:04:36.416153	2017-05-16 07:04:36.416153	6	11
113	2017-05-16 07:04:36.449346	2017-05-16 07:04:36.449346	6	12
114	2017-05-16 07:04:36.471322	2017-05-16 07:04:36.471322	6	13
115	2017-05-16 07:04:36.506176	2017-05-16 07:04:36.506176	6	14
116	2017-05-16 07:04:36.527536	2017-05-16 07:04:36.527536	6	15
117	2017-05-16 07:04:36.5604	2017-05-16 07:04:36.5604	6	16
118	2017-05-16 07:04:36.583907	2017-05-16 07:04:36.583907	6	17
119	2017-05-16 07:04:36.605442	2017-05-16 07:04:36.605442	6	18
120	2017-05-16 07:04:36.62851	2017-05-16 07:04:36.62851	6	19
121	2017-05-16 07:04:36.650208	2017-05-16 07:04:36.650208	6	20
122	2017-05-16 07:04:36.671336	2017-05-16 07:04:36.671336	6	21
123	2017-05-16 07:04:36.694306	2017-05-16 07:04:36.694306	6	22
124	2017-05-16 07:04:36.715479	2017-05-16 07:04:36.715479	6	23
125	2017-05-16 07:04:36.739088	2017-05-16 07:04:36.739088	6	24
126	2017-05-16 07:04:36.761529	2017-05-16 07:04:36.761529	6	25
127	2017-05-16 07:04:36.783996	2017-05-16 07:04:36.783996	2	26
128	2017-05-16 07:04:36.805344	2017-05-16 07:04:36.805344	4	26
129	2017-05-16 07:04:36.828279	2017-05-16 07:04:36.828279	6	26
130	2017-05-16 07:04:36.848988	2017-05-16 07:04:36.848988	5	17
131	2017-05-16 07:04:36.871769	2017-05-16 07:04:36.871769	5	14
132	2017-05-16 07:04:36.894176	2017-05-16 07:04:36.894176	5	6
133	2017-05-16 07:04:36.917409	2017-05-16 07:04:36.917409	1	27
134	2017-05-16 07:04:36.937937	2017-05-16 07:04:36.937937	3	27
135	2017-05-16 07:04:36.961811	2017-05-16 07:04:36.961811	4	27
136	2017-05-16 07:04:36.984093	2017-05-16 07:04:36.984093	5	27
137	2017-05-16 07:04:37.005454	2017-05-16 07:04:37.005454	6	27
138	2017-05-16 07:04:37.026806	2017-05-16 07:04:37.026806	7	20
139	2017-05-16 07:04:37.050256	2017-05-16 07:04:37.050256	1	28
140	2017-05-16 07:04:37.072842	2017-05-16 07:04:37.072842	2	28
141	2017-05-16 07:04:37.094574	2017-05-16 07:04:37.094574	3	28
142	2017-05-16 07:04:37.116618	2017-05-16 07:04:37.116618	4	28
143	2017-05-16 07:04:37.139453	2017-05-16 07:04:37.139453	6	28
144	2017-05-16 07:04:37.161269	2017-05-16 07:04:37.161269	1	29
145	2017-05-16 07:04:37.184173	2017-05-16 07:04:37.184173	2	29
146	2017-05-16 07:04:37.205211	2017-05-16 07:04:37.205211	3	29
147	2017-05-16 07:04:37.228378	2017-05-16 07:04:37.228378	4	29
148	2017-05-16 07:04:37.250149	2017-05-16 07:04:37.250149	6	29
149	2017-05-16 07:04:37.273324	2017-05-16 07:04:37.273324	8	1
150	2017-05-16 07:04:37.294994	2017-05-16 07:04:37.294994	8	4
151	2017-05-16 07:04:37.316351	2017-05-16 07:04:37.316351	8	5
152	2017-05-16 07:04:37.339524	2017-05-16 07:04:37.339524	8	6
153	2017-05-16 07:04:37.361049	2017-05-16 07:04:37.361049	8	7
154	2017-05-16 07:04:37.382771	2017-05-16 07:04:37.382771	8	8
155	2017-05-16 07:04:37.406356	2017-05-16 07:04:37.406356	8	9
156	2017-05-16 07:04:37.428922	2017-05-16 07:04:37.428922	8	10
157	2017-05-16 07:04:37.486201	2017-05-16 07:04:37.486201	8	11
158	2017-05-16 07:04:37.528828	2017-05-16 07:04:37.528828	8	12
159	2017-05-16 07:04:37.550169	2017-05-16 07:04:37.550169	8	13
160	2017-05-16 07:04:37.571552	2017-05-16 07:04:37.571552	8	14
161	2017-05-16 07:04:37.595205	2017-05-16 07:04:37.595205	8	15
162	2017-05-16 07:04:37.616617	2017-05-16 07:04:37.616617	8	16
163	2017-05-16 07:04:37.639372	2017-05-16 07:04:37.639372	8	17
164	2017-05-16 07:04:37.66106	2017-05-16 07:04:37.66106	8	20
165	2017-05-16 07:04:37.684033	2017-05-16 07:04:37.684033	8	22
166	2017-05-16 07:04:37.704913	2017-05-16 07:04:37.704913	8	24
167	2017-05-16 07:04:37.727147	2017-05-16 07:04:37.727147	8	26
168	2017-05-16 07:04:37.750167	2017-05-16 07:04:37.750167	8	27
169	2017-05-16 07:04:37.784037	2017-05-16 07:04:37.784037	9	1
170	2017-05-16 07:04:37.805467	2017-05-16 07:04:37.805467	9	4
171	2017-05-16 07:04:37.839543	2017-05-16 07:04:37.839543	9	5
172	2017-05-16 07:04:37.86105	2017-05-16 07:04:37.86105	9	6
173	2017-05-16 07:04:37.893985	2017-05-16 07:04:37.893985	9	7
174	2017-05-16 07:04:37.91675	2017-05-16 07:04:37.91675	9	8
175	2017-05-16 07:04:37.949576	2017-05-16 07:04:37.949576	9	9
176	2017-05-16 07:04:37.971856	2017-05-16 07:04:37.971856	9	10
177	2017-05-16 07:04:38.006397	2017-05-16 07:04:38.006397	9	11
178	2017-05-16 07:04:38.028578	2017-05-16 07:04:38.028578	9	12
179	2017-05-16 07:04:38.050027	2017-05-16 07:04:38.050027	9	13
180	2017-05-16 07:04:38.072897	2017-05-16 07:04:38.072897	9	14
181	2017-05-16 07:04:38.09475	2017-05-16 07:04:38.09475	9	15
182	2017-05-16 07:04:38.116536	2017-05-16 07:04:38.116536	9	16
183	2017-05-16 07:04:38.139855	2017-05-16 07:04:38.139855	9	17
184	2017-05-16 07:04:38.160679	2017-05-16 07:04:38.160679	9	20
185	2017-05-16 07:04:38.184013	2017-05-16 07:04:38.184013	9	22
186	2017-05-16 07:04:38.206254	2017-05-16 07:04:38.206254	9	24
187	2017-05-16 07:04:38.228488	2017-05-16 07:04:38.228488	9	26
188	2017-05-16 07:04:38.250315	2017-05-16 07:04:38.250315	9	27
189	2017-05-16 07:04:38.273037	2017-05-16 07:04:38.273037	9	28
190	2017-05-16 07:04:38.294546	2017-05-16 07:04:38.294546	9	29
191	2017-05-16 07:04:38.316586	2017-05-16 07:04:38.316586	10	1
192	2017-05-16 07:04:38.339584	2017-05-16 07:04:38.339584	10	4
193	2017-05-16 07:04:38.361795	2017-05-16 07:04:38.361795	10	5
194	2017-05-16 07:04:38.384221	2017-05-16 07:04:38.384221	10	6
195	2017-05-16 07:04:38.405174	2017-05-16 07:04:38.405174	10	7
196	2017-05-16 07:04:38.428676	2017-05-16 07:04:38.428676	10	8
197	2017-05-16 07:04:38.450871	2017-05-16 07:04:38.450871	10	9
198	2017-05-16 07:04:38.473027	2017-05-16 07:04:38.473027	10	10
199	2017-05-16 07:04:38.495157	2017-05-16 07:04:38.495157	10	11
200	2017-05-16 07:04:38.516589	2017-05-16 07:04:38.516589	10	12
201	2017-05-16 07:04:38.539577	2017-05-16 07:04:38.539577	10	13
202	2017-05-16 07:04:38.561403	2017-05-16 07:04:38.561403	10	14
203	2017-05-16 07:04:38.584093	2017-05-16 07:04:38.584093	10	15
204	2017-05-16 07:04:38.605827	2017-05-16 07:04:38.605827	10	16
205	2017-05-16 07:04:38.627281	2017-05-16 07:04:38.627281	10	17
206	2017-05-16 07:04:38.65085	2017-05-16 07:04:38.65085	10	20
207	2017-05-16 07:04:38.672442	2017-05-16 07:04:38.672442	10	22
208	2017-05-16 07:04:38.695303	2017-05-16 07:04:38.695303	10	24
209	2017-05-16 07:04:38.717468	2017-05-16 07:04:38.717468	10	26
210	2017-05-16 07:04:38.739975	2017-05-16 07:04:38.739975	10	27
211	2017-05-16 07:04:38.761596	2017-05-16 07:04:38.761596	11	5
212	2017-05-16 07:04:38.784542	2017-05-16 07:04:38.784542	11	10
213	2017-05-16 07:04:38.805254	2017-05-16 07:04:38.805254	11	13
214	2017-05-16 07:04:38.828065	2017-05-16 07:04:38.828065	11	14
215	2017-05-16 07:04:38.850707	2017-05-16 07:04:38.850707	11	15
216	2017-05-16 07:04:38.873143	2017-05-16 07:04:38.873143	11	16
217	2017-05-16 07:04:38.894654	2017-05-16 07:04:38.894654	11	17
218	2017-05-16 07:04:38.917678	2017-05-16 07:04:38.917678	11	28
219	2017-05-16 07:04:38.940147	2017-05-16 07:04:38.940147	11	29
220	2017-05-16 07:04:38.961545	2017-05-16 07:04:38.961545	12	5
221	2017-05-16 07:04:38.983103	2017-05-16 07:04:38.983103	12	10
222	2017-05-16 07:04:39.006077	2017-05-16 07:04:39.006077	12	13
223	2017-05-16 07:04:39.027583	2017-05-16 07:04:39.027583	12	14
224	2017-05-16 07:04:39.051101	2017-05-16 07:04:39.051101	12	16
225	2017-05-16 07:04:39.072389	2017-05-16 07:04:39.072389	13	20
226	2017-05-16 07:04:39.095304	2017-05-16 07:04:39.095304	13	27
227	2017-05-16 07:04:39.116926	2017-05-16 07:04:39.116926	14	20
\.


--
-- Name: permisos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('permisos_id_seq', 227, true);


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
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	Empleado	2017-05-16 07:04:19.904357	2017-05-16 07:04:19.904357	1	1	1	1	5	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.00084	2017-05-16 07:04:20.00084	1	1	1	1	4	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.088296	2017-05-16 07:04:20.088296	1	1	1	1	3	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.168029	2017-05-16 07:04:20.168029	1	1	1	1	2	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.244564	2017-05-16 07:04:20.244564	1	1	1	1	1	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.323518	2017-05-16 07:04:20.323518	1	1	1	1	4	1	7
7	EMP-007	Maria	Gonzalez	36134076	1991-11-05	176	7141			4401604	mg@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.412067	2017-05-16 07:04:20.412067	1	1	1	1	5	1	8
8	EMP-008	Elena	Ceballos	25198461	1974-05-06	Tereré	7302	4	B	4355987	ec@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.489183	2017-05-16 07:04:20.489183	1	1	1	1	4	1	7
9	EMP-009	Alberto	Padilla	33843657	1986-10-17	Rivera	6872			459885	ap@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.56939	2017-05-16 07:04:20.56939	1	1	1	1	3	1	4
10	EMP-010	Fernando	Gonzalez	33980912	1987-01-21	Tereré	1187			4456980	fg@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.650392	2017-05-16 07:04:20.650392	1	1	1	1	2	1	3
11	EMP-011	Tiago	Gonzalez	38187222	1995-06-08	Castilla	8299	10	15	4444176	tiagogonzales@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.735956	2017-05-16 07:04:20.735956	1	1	1	1	1	1	2
12	EMP-012	Cintia	Castro	22612413	1970-02-20	Av. Andalucia	7415	12	A	4255987	cintiacastro@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.815362	2017-05-16 07:04:20.815362	1	1	1	1	4	1	7
13	EMP-013	Josefina	Jardin	36025176	1991-11-05	176	7141			4401604	josefinajardin@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.903585	2017-05-16 07:04:20.903585	1	1	1	1	5	1	8
14	EMP-014	Diana	Rivas	25948001	1974-05-06	Tereré	7302	4	B	4355987	dianarivas@gmail.com	Empleado	Empleado	2017-05-16 07:04:20.978656	2017-05-16 07:04:20.978656	1	1	1	1	4	1	7
15	EMP-015	Dario	Gonzalez	33880019	1986-10-17	Rivera	6872			459885	dariogonzalez@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.057581	2017-05-16 07:04:21.057581	1	1	1	1	3	1	4
16	EMP-016	Ciro	Zamora	33983707	1987-01-21	Tereré	1187			4456980	cirozamora@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.145395	2017-05-16 07:04:21.145395	1	1	1	1	2	1	3
17	EMP-017	Zoe	Vazquez	3818104	1995-06-08	Castilla	8299	10	15	4444176	zoevazquez@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.226205	2017-05-16 07:04:21.226205	1	1	1	1	1	1	2
18	EMP-018	Cristian	Gonzalez	22659193	1970-02-20	Av. Andalucia	7415	12	A	4255987	cristiangonzalez@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.302364	2017-05-16 07:04:21.302364	1	1	1	1	4	1	7
19	EMP-019	Ana	Manfrin	36222076	1991-11-05	176	7141			4401604	anamanfrin@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.379792	2017-05-16 07:04:21.379792	1	1	1	1	5	1	8
20	EMP-020	Martina	Adamo	25841001	1974-05-06	Tereré	7302	4	B	4355987	martinaadamo@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.466774	2017-05-16 07:04:21.466774	1	1	1	1	4	1	7
21	EMP-021	Roberto	Milani	33880333	1986-10-17	Rivera	6872			459885	robertomilani@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.549835	2017-05-16 07:04:21.549835	1	1	1	1	3	1	4
22	EMP-022	Victor	Gonzalez	33984447	1987-01-21	Tereré	1187			4456980	victorgonzalez@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.636793	2017-05-16 07:04:21.636793	1	1	1	1	2	1	3
23	EMP-023	Alejandro	Cambril	38113409	1995-06-08	Castilla	8299	10	15	4444176	alejandrocambril@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.713319	2017-05-16 07:04:21.713319	1	1	1	1	1	1	2
24	EMP-024	Luis	Rizzo	22543493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luisrizzo@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.79094	2017-05-16 07:04:21.79094	1	1	1	1	4	1	7
25	EMP-025	Mario	Rosas	36060986	1991-11-05	176	7141			4401604	mariorosas@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.871163	2017-05-16 07:04:21.871163	1	1	1	1	5	1	8
26	EMP-026	Analia	Granados	25131701	1974-05-06	Tereré	7302	4	B	4355987	analiagranados@gmail.com	Empleado	Empleado	2017-05-16 07:04:21.946062	2017-05-16 07:04:21.946062	1	1	1	1	4	1	7
27	EMP-027	Leonor	Gonzalez	33888717	1986-10-17	Rivera	6872			459885	leonorgonzalez@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.058666	2017-05-16 07:04:22.058666	1	1	1	1	3	1	4
28	EMP-028	Victor	Baresi	33928407	1987-01-21	Tereré	1187			4456980	victorbaresi@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.137914	2017-05-16 07:04:22.137914	1	1	1	1	2	1	3
29	EMP-029	Silvana	Lazzaga	38918849	1995-06-08	Castilla	8299	10	15	4444176	silvanalazzaga@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.212897	2017-05-16 07:04:22.212897	1	1	1	1	1	1	2
30	EMP-030	Juana	Calabrese	220192493	1970-02-20	Av. Andalucia	7415	12	A	4255987	janacalabrese@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.305695	2017-05-16 07:04:22.305695	1	1	1	1	4	1	7
31	EMP-031	Juliana	Lombardi	38613849	1995-06-08	Castilla	8299	10	15	4444176	julianalombardi@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.392546	2017-05-16 07:04:22.392546	1	1	1	1	1	1	2
32	EMP-032	Enrique	Cano	22451493	1970-02-20	Av. Andalucia	7415	12	A	4255987	enriquecano@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.478998	2017-05-16 07:04:22.478998	1	1	1	1	4	1	7
33	EMP-033	Gilda	Lombarde	36064356	1991-11-05	176	7141			4401604	gildalombarde@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.557987	2017-05-16 07:04:22.557987	1	1	1	1	5	1	8
34	EMP-034	Martin	Bande	25124501	1974-05-06	Tereré	7302	4	B	4355987	martinbande@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.645687	2017-05-16 07:04:22.645687	1	1	1	1	4	1	7
35	EMP-035	Gabriel	Ferruccio	33451657	1986-10-17	Rivera	6872			459885	gabrielferuccio@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.724279	2017-05-16 07:04:22.724279	1	1	1	1	3	1	4
36	EMP-036	Juan	Mazzanti	33956107	1987-01-21	Tereré	1187			4456980	juanmazzanti@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.804515	2017-05-16 07:04:22.804515	1	1	1	1	2	1	3
37	EMP-037	Karina	Fiorentino	38663849	1995-06-08	Castilla	8299	10	15	4444176	karinafiorentino@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.890661	2017-05-16 07:04:22.890661	1	1	1	1	1	1	2
38	EMP-038	Osvaldo	Pagnotto	22019493	1970-02-20	Av. Andalucia	7415	12	A	4255987	osvaldopagnotto@gmail.com	Empleado	Empleado	2017-05-16 07:04:22.968764	2017-05-16 07:04:22.968764	1	1	1	1	4	1	7
39	EMP-039	Margarita	Giordano	36068886	1991-11-05	176	7141			4401604	margaritagiordano@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.04739	2017-05-16 07:04:23.04739	1	1	1	1	5	1	8
40	EMP-040	Rosa	Napolitano	2576401	1974-05-06	Tereré	7302	4	B	4355987	rosanapolitano@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.124346	2017-05-16 07:04:23.124346	1	1	1	1	4	1	7
41	EMP-041	Magdalena	Bruno	38817849	1995-06-08	Castilla	8299	10	15	4444176	mardalenabruno@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.215764	2017-05-16 07:04:23.215764	1	1	1	1	1	1	2
42	EMP-042	Mauricio	Costa	22755493	1970-02-20	Av. Andalucia	7415	12	A	4255987	mauriciocosta@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.291442	2017-05-16 07:04:23.291442	1	1	1	1	4	1	7
43	EMP-043	Ivan	Costas	36755076	1991-11-05	176	7141			4401604	ivancostas@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.369249	2017-05-16 07:04:23.369249	1	1	1	1	5	1	8
44	EMP-044	Pablo	Davide	251934401	1974-05-06	Tereré	7302	4	B	4355987	pablodavide@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.44742	2017-05-16 07:04:23.44742	1	1	1	1	4	1	7
45	EMP-045	Nicolas	Medina	33801927	1986-10-17	Rivera	6872			459885	nicolasmedina@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.527411	2017-05-16 07:04:23.527411	1	1	1	1	3	1	4
46	EMP-046	Celeste	Milano	35122307	1987-01-21	Tereré	1187			4456980	celestemilano@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.61524	2017-05-16 07:04:23.61524	1	1	1	1	2	1	3
47	EMP-047	Sebastian	Schiavone	38175649	1995-06-08	Castilla	8299	10	15	4444176	sebastianschiavone@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.694112	2017-05-16 07:04:23.694112	1	1	1	1	1	1	2
48	EMP-048	Ruben	Almedina	22891493	1970-02-20	Av. Andalucia	7415	12	A	4255987	rubenalmedina@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.782354	2017-05-16 07:04:23.782354	1	1	1	1	4	1	7
49	EMP-049	Cristian	Camiño	36093716	1991-11-05	176	7141			4401604	cristiancamiño@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.867542	2017-05-16 07:04:23.867542	1	1	1	1	5	1	8
50	EMP-050	Monica	Conti	25888001	1974-05-06	Tereré	7302	4	B	4355987	monicaconti@gmail.com	Empleado	Empleado	2017-05-16 07:04:23.949032	2017-05-16 07:04:23.949032	1	1	1	1	4	1	7
51	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.092246	2017-05-16 07:04:24.092246	1	1	2	2	\N	1	\N
52	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.179315	2017-05-16 07:04:24.179315	1	1	2	1	\N	1	\N
53	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.305774	2017-05-16 07:04:24.305774	1	1	2	1	\N	1	\N
54	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.395069	2017-05-16 07:04:24.395069	1	1	2	1	\N	1	\N
55	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.480802	2017-05-16 07:04:24.480802	1	1	2	1	\N	1	\N
56	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.558554	2017-05-16 07:04:24.558554	1	1	2	2	\N	1	\N
57	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.635572	2017-05-16 07:04:24.635572	1	1	2	1	\N	1	\N
58	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.715125	2017-05-16 07:04:24.715125	1	1	2	1	\N	1	\N
59	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.804155	2017-05-16 07:04:24.804155	1	1	2	1	\N	1	\N
60	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.88255	2017-05-16 07:04:24.88255	1	1	2	2	\N	1	\N
61	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:24.972609	2017-05-16 07:04:24.972609	1	1	2	1	\N	1	\N
62	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.059304	2017-05-16 07:04:25.059304	1	1	2	1	\N	1	\N
63	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.138917	2017-05-16 07:04:25.138917	1	1	2	1	\N	1	\N
64	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.213746	2017-05-16 07:04:25.213746	1	1	2	2	\N	1	\N
65	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.292059	2017-05-16 07:04:25.292059	1	1	2	1	\N	1	\N
66	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.370172	2017-05-16 07:04:25.370172	1	1	2	1	\N	1	\N
67	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.447624	2017-05-16 07:04:25.447624	1	1	2	1	\N	1	\N
68	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.534396	2017-05-16 07:04:25.534396	1	1	2	2	\N	1	\N
69	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.617022	2017-05-16 07:04:25.617022	1	1	2	1	\N	1	\N
70	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.70455	2017-05-16 07:04:25.70455	1	1	2	1	\N	1	\N
71	ME-021	Lidia	Delucci	28088944	1981-01-29	Chile	6144			481898	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.783747	2017-05-16 07:04:25.783747	1	1	2	1	\N	1	\N
72	ME-022	Leonor	Gomez Santos	40560231	1996-03-13	Plaza Mayor	2637			4536662	leonorgs@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.868939	2017-05-16 07:04:25.868939	1	1	2	1	\N	1	\N
73	ME-023	Lara	Gonçalves	29075344	1980-07-19	España	1415			4498457	laragoncalves@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:25.950477	2017-05-16 07:04:25.950477	1	1	2	1	\N	1	\N
74	ME-024	Martin	Diaz	26070390	1976-08-11	calle Nueva	1826			491088	martindiaz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.03875	2017-05-16 07:04:26.03875	1	1	2	1	\N	1	\N
75	ME-025	Marina	Diaz	26070394	1976-08-11	calle Nueva	1826			491088	marinadiaz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.126499	2017-05-16 07:04:26.126499	1	1	2	1	\N	1	\N
76	ME-026	Gerardo	Urbina	29234987	1980-05-31	Álamo	6162			455433	gerardou@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.215879	2017-05-16 07:04:26.215879	1	1	2	1	\N	1	\N
77	ME-027	Silvio	Quiroz	35465922	1990-02-27	Álamo	2128			415176	silvioquiroz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.304246	2017-05-16 07:04:26.304246	1	1	2	1	\N	1	\N
78	ME-028	Gabriela	Garcia	33457976	1987-12-19	Alem	123			451912	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.384457	2017-05-16 07:04:26.384457	1	1	2	1	\N	1	\N
79	ME-029	Leonardo	Rios	29524865	1981-11-30	Concepcion	5139			4590871	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.472346	2017-05-16 07:04:26.472346	1	1	2	1	\N	1	\N
80	ME-030	Ubaldo	Gomez	34123456	1990-04-08	Entre Rios	1235			456798	ubaldogomez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.601505	2017-05-16 07:04:26.601505	1	1	2	1	\N	1	\N
81	ME-031	Silvio	Gonzalez	29092236	1980-05-16	Cordoba	7213			4501923	silviogonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.684172	2017-05-16 07:04:26.684172	1	1	2	1	\N	1	\N
82	ME-032	Rosa	Fernandez	20112254	1968-09-13	San Martin	1028			4567895	rosafernandez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.772573	2017-05-16 07:04:26.772573	1	1	2	1	\N	1	\N
83	ME-033	Alejandro	Fernandez	20998871	1987-05-16	Santa Fe	4812			4311235	alefernandez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.861445	2017-05-16 07:04:26.861445	1	1	2	1	\N	1	\N
84	ME-034	Hugo	Rios	40034940	1998-11-30	Alvear	5028			481341	hugorios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:26.938222	2017-05-16 07:04:26.938222	1	1	2	1	\N	1	\N
85	ME-035	Mario	Garcia	24654447	1976-04-08	Roca	193			4212351	mariogarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.014801	2017-05-16 07:04:27.014801	1	1	2	1	\N	1	\N
86	ME-036	Marina	Moralez	36421952	1992-08-19	Ucrania	9371			451241	marimamoralez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.093493	2017-05-16 07:04:27.093493	1	1	2	1	\N	1	\N
87	ME-037	Silvina	Portillo	26498388	1976-06-05	Av Queirel	7621			431214	silvinaportillo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.180791	2017-05-16 07:04:27.180791	1	1	2	1	\N	1	\N
88	ME-038	Maria	Maciel	33428434	1989-09-04	Paraguay	600			4761602	mariamaciel@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.259904	2017-05-16 07:04:27.259904	1	1	2	1	\N	1	\N
89	ME-039	Angeles	Granados	31452518	1981-04-09	Uruguay	12			481858	angelesgranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.347822	2017-05-16 07:04:27.347822	1	1	2	1	\N	1	\N
90	ME-040	Cintia	Gutierrez	29701192	1992-11-05	Av Roca	464			483498	cintiagutierrez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.546745	2017-05-16 07:04:27.546745	1	1	2	1	\N	1	\N
91	ME-041	David	Sedillo	36371823	1975-07-23	Centenario	6135			481018	davidsedillo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.625463	2017-05-16 07:04:27.625463	1	1	2	1	\N	1	\N
92	ME-042	Sofia	Garcia	25370180	1998-01-13	Las Flores	1234			409498	sofiagarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.704157	2017-05-16 07:04:27.704157	1	1	2	1	\N	1	\N
93	ME-043	Alicia	Villalba	27455263	1979-04-17	Las Palmeras	9876			420184	alivillalba@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.792479	2017-05-16 07:04:27.792479	1	1	2	1	\N	1	\N
94	ME-044	Luis	Gonzalez	36182911	1992-06-19	Las Orquideas	900			495712	luisgonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.873371	2017-05-16 07:04:27.873371	1	1	2	1	\N	1	\N
95	ME-045	Ernesto	Da Luz	30346514	1983-06-19	Rosas	2463			413048	ernestodaluz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:27.958991	2017-05-16 07:04:27.958991	1	1	2	1	\N	1	\N
96	ME-046	Luciano	Garcia	39019733	1996-03-13	Colon	8123			412451	lucianogarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:28.040122	2017-05-16 07:04:28.040122	1	1	2	1	\N	1	\N
97	ME-047	Gerardo	Cano	29232117	1980-07-19	Escuelita	9173			462093	gerardocano@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:28.128416	2017-05-16 07:04:28.128416	1	1	2	1	\N	1	\N
98	ME-048	Hector	Rincon	29222287	1980-05-31	Japon	2546			471927	hectorrincon@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:28.217249	2017-05-16 07:04:28.217249	1	1	2	1	\N	1	\N
99	ME-049	Alberto	Gonzalez	35225922	1990-02-27	Colombia	2871			431570	albertogonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:28.30345	2017-05-16 07:04:28.30345	1	1	2	1	\N	1	\N
100	ME-050	Roberto	Lujan	35461122	1990-05-27	Noruega	1980			401938	robertolujan@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-16 07:04:28.382241	2017-05-16 07:04:28.382241	1	1	2	1	\N	1	\N
101	CO-001	María Rosa	Conti	25644132	1975-07-03	Ituzaingo	245	12	B	424568	mrconti@gmail.com	Contacto	Contacto	2017-05-16 07:04:58.82929	2017-05-16 07:04:58.82929	1	1	1	1	\N	1	\N
102	CO-002	Berta	Rivera	33958772	1989-04-11	Leandro Gómez	5886	\N	\N	4598765	brivera@gmail.com	Contacto	Contacto	2017-05-16 07:04:58.921811	2017-05-16 07:04:58.921811	1	1	1	2	\N	1	\N
103	CO-003	Juliana	Castiglione	30444512	1980-12-09	Brisas	3280	3	20	555321	jcastiglione@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.049054	2017-05-16 07:04:59.049054	1	1	1	1	\N	1	\N
104	CO-004	Nahuel	Estevez	19423568	1966-11-28	Av. Alta Gracia	5332	\N	\N	154632108	nestevez@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.139187	2017-05-16 07:04:59.139187	1	1	1	2	\N	1	\N
105	CO-005	Pablo	Gomez	25221305	1970-03-05	Neruda	7393	8	A	154245689	pablogomez@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.228792	2017-05-16 07:04:59.228792	1	1	1	1	\N	1	\N
106	CO-006	Abigail	Coronado	37926793	1994-03-21	Florencio Varela	5659	\N	\N	432666	abigailcoronado@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.319811	2017-05-16 07:04:59.319811	1	1	1	1	\N	1	\N
107	CO-007	Hilda	Zielinski	25334991	1970-04-07	Joaquin Suarez	6863	6	15	4478909	hildazielinski@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.408492	2017-05-16 07:04:59.408492	1	1	1	1	\N	1	\N
108	CO-008	Antonio	Goncalves Melo	34008128	1989-05-29	Maldonado	2757	\N	\N	4498049	antoniogm@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.494995	2017-05-16 07:04:59.494995	1	1	1	1	\N	1	\N
109	CO-009	Isabela	Correa	41889321	1997-11-04	Marejada	5656	\N	\N	4482122	isacorrea@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.582468	2017-05-16 07:04:59.582468	1	1	1	1	\N	1	\N
110	CO-010	Franco	Maur	41336729	1997-03-04	Corrientes	314	\N	\N	4498049	francomaur@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.673171	2017-05-16 07:04:59.673171	1	1	1	1	\N	1	\N
111	CO-011	Felix	Baer	30228128	1980-08-16	Maldonado	9000	\N	\N	4601406	felixbaer@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.76503	2017-05-16 07:04:59.76503	1	1	1	1	\N	1	\N
112	CO-012	Eileen	Macías Vargas	39756412	1996-01-19	Yapeyú	3778	\N	\N	497986	mercedesgarcia@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.853154	2017-05-16 07:04:59.853154	1	1	1	1	\N	1	\N
113	CO-013	Mercedes	García	34561928	1989-05-29	Maldonado	2757	\N	\N	5557120	antoniogm@gmail.com	Contacto	Contacto	2017-05-16 07:04:59.946596	2017-05-16 07:04:59.946596	1	1	1	1	\N	1	\N
114	CO-014	Clea	Espino	24666124	1975-08-04	Tomás Guido	8740	\N	\N	4981777	cleaespino@gmail.com	Contacto	Contacto	2017-05-16 07:05:00.027279	2017-05-16 07:05:00.027279	1	1	1	1	\N	1	\N
115	CO-015	Paul	Flores Acosta	31672155	1985-06-21	Resistencia	1813	\N	\N	4231456	paulfloresacosta@gmail.com	Contacto	Contacto	2017-05-16 07:05:00.118218	2017-05-16 07:05:00.118218	1	1	1	1	\N	1	\N
\.


--
-- Data for Name: personas_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_especialidades (id, created_at, updated_at, persona_id, especialidad_de_contacto_id) FROM stdin;
1	2017-05-16 07:05:00.226928	2017-05-16 07:05:00.226928	101	1
2	2017-05-16 07:05:00.247478	2017-05-16 07:05:00.247478	101	5
3	2017-05-16 07:05:00.269566	2017-05-16 07:05:00.269566	102	2
4	2017-05-16 07:05:00.290681	2017-05-16 07:05:00.290681	102	11
5	2017-05-16 07:05:00.313289	2017-05-16 07:05:00.313289	103	2
6	2017-05-16 07:05:00.335232	2017-05-16 07:05:00.335232	103	3
7	2017-05-16 07:05:00.357873	2017-05-16 07:05:00.357873	103	10
8	2017-05-16 07:05:00.382211	2017-05-16 07:05:00.382211	104	3
9	2017-05-16 07:05:00.40417	2017-05-16 07:05:00.40417	104	8
10	2017-05-16 07:05:00.424796	2017-05-16 07:05:00.424796	104	9
11	2017-05-16 07:05:00.447871	2017-05-16 07:05:00.447871	104	10
12	2017-05-16 07:05:00.471192	2017-05-16 07:05:00.471192	105	7
13	2017-05-16 07:05:00.492384	2017-05-16 07:05:00.492384	106	2
14	2017-05-16 07:05:00.516063	2017-05-16 07:05:00.516063	106	3
15	2017-05-16 07:05:00.536905	2017-05-16 07:05:00.536905	106	4
16	2017-05-16 07:05:00.560095	2017-05-16 07:05:00.560095	107	6
17	2017-05-16 07:05:00.580462	2017-05-16 07:05:00.580462	107	7
18	2017-05-16 07:05:00.616107	2017-05-16 07:05:00.616107	108	1
19	2017-05-16 07:05:00.636922	2017-05-16 07:05:00.636922	108	12
20	2017-05-16 07:05:00.660064	2017-05-16 07:05:00.660064	109	1
21	2017-05-16 07:05:00.681247	2017-05-16 07:05:00.681247	109	7
22	2017-05-16 07:05:00.703623	2017-05-16 07:05:00.703623	110	3
23	2017-05-16 07:05:00.726266	2017-05-16 07:05:00.726266	110	9
24	2017-05-16 07:05:00.747456	2017-05-16 07:05:00.747456	111	1
25	2017-05-16 07:05:00.771156	2017-05-16 07:05:00.771156	111	2
26	2017-05-16 07:05:00.793313	2017-05-16 07:05:00.793313	111	11
27	2017-05-16 07:05:00.815564	2017-05-16 07:05:00.815564	112	4
28	2017-05-16 07:05:00.837679	2017-05-16 07:05:00.837679	113	2
29	2017-05-16 07:05:00.858892	2017-05-16 07:05:00.858892	113	4
30	2017-05-16 07:05:00.88127	2017-05-16 07:05:00.88127	114	7
31	2017-05-16 07:05:00.904743	2017-05-16 07:05:00.904743	114	12
32	2017-05-16 07:05:00.937839	2017-05-16 07:05:00.937839	115	8
\.


--
-- Name: personas_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_especialidades_id_seq', 32, true);


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
1	2017-05-16 07:05:01.382114	2017-05-16 07:05:01.382114	1	103
2	2017-05-16 07:05:01.404568	2017-05-16 07:05:01.404568	1	104
3	2017-05-16 07:05:01.426826	2017-05-16 07:05:01.426826	1	110
4	2017-05-16 07:05:01.44856	2017-05-16 07:05:01.44856	1	115
5	2017-05-16 07:05:01.471237	2017-05-16 07:05:01.471237	2	101
6	2017-05-16 07:05:01.492789	2017-05-16 07:05:01.492789	2	108
7	2017-05-16 07:05:01.515905	2017-05-16 07:05:01.515905	2	109
8	2017-05-16 07:05:01.536853	2017-05-16 07:05:01.536853	2	111
9	2017-05-16 07:05:01.559101	2017-05-16 07:05:01.559101	2	114
\.


--
-- Name: personas_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_eventos_id_seq', 9, true);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 115, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-05-16 07:04:30.967297	2017-05-16 07:04:30.967297	1	51
2	2017-05-16 07:04:30.993335	2017-05-16 07:04:30.993335	1	2
3	2017-05-16 07:04:31.015324	2017-05-16 07:04:31.015324	2	2
4	2017-05-16 07:04:31.037139	2017-05-16 07:04:31.037139	2	52
5	2017-05-16 07:04:31.060156	2017-05-16 07:04:31.060156	2	53
6	2017-05-16 07:04:31.082417	2017-05-16 07:04:31.082417	3	6
7	2017-05-16 07:04:31.103391	2017-05-16 07:04:31.103391	3	54
8	2017-05-16 07:04:31.126418	2017-05-16 07:04:31.126418	3	55
9	2017-05-16 07:04:31.149144	2017-05-16 07:04:31.149144	4	6
10	2017-05-16 07:04:31.171114	2017-05-16 07:04:31.171114	4	56
11	2017-05-16 07:04:31.192712	2017-05-16 07:04:31.192712	4	57
12	2017-05-16 07:04:31.214932	2017-05-16 07:04:31.214932	5	2
13	2017-05-16 07:04:31.238144	2017-05-16 07:04:31.238144	5	58
14	2017-05-16 07:04:31.258974	2017-05-16 07:04:31.258974	5	59
15	2017-05-16 07:04:31.282469	2017-05-16 07:04:31.282469	6	2
16	2017-05-16 07:04:31.303552	2017-05-16 07:04:31.303552	6	60
17	2017-05-16 07:04:31.326759	2017-05-16 07:04:31.326759	6	61
18	2017-05-16 07:04:31.349006	2017-05-16 07:04:31.349006	6	62
19	2017-05-16 07:04:31.371286	2017-05-16 07:04:31.371286	7	6
20	2017-05-16 07:04:31.392889	2017-05-16 07:04:31.392889	7	63
21	2017-05-16 07:04:31.415536	2017-05-16 07:04:31.415536	7	64
22	2017-05-16 07:04:31.436799	2017-05-16 07:04:31.436799	8	2
23	2017-05-16 07:04:31.45995	2017-05-16 07:04:31.45995	8	65
24	2017-05-16 07:04:31.481265	2017-05-16 07:04:31.481265	9	6
25	2017-05-16 07:04:31.504653	2017-05-16 07:04:31.504653	9	66
26	2017-05-16 07:04:31.526013	2017-05-16 07:04:31.526013	9	67
27	2017-05-16 07:04:31.54923	2017-05-16 07:04:31.54923	10	2
28	2017-05-16 07:04:31.571126	2017-05-16 07:04:31.571126	10	68
29	2017-05-16 07:04:31.592797	2017-05-16 07:04:31.592797	10	69
30	2017-05-16 07:04:31.615863	2017-05-16 07:04:31.615863	10	70
31	2017-05-16 07:04:31.636796	2017-05-16 07:04:31.636796	11	71
32	2017-05-16 07:04:31.660288	2017-05-16 07:04:31.660288	11	72
33	2017-05-16 07:04:31.682478	2017-05-16 07:04:31.682478	11	8
34	2017-05-16 07:04:31.703394	2017-05-16 07:04:31.703394	12	57
35	2017-05-16 07:04:31.72658	2017-05-16 07:04:31.72658	12	65
36	2017-05-16 07:04:31.748622	2017-05-16 07:04:31.748622	12	6
37	2017-05-16 07:04:31.77151	2017-05-16 07:04:31.77151	13	96
38	2017-05-16 07:04:31.793076	2017-05-16 07:04:31.793076	13	99
39	2017-05-16 07:04:31.827245	2017-05-16 07:04:31.827245	13	8
40	2017-05-16 07:04:31.848465	2017-05-16 07:04:31.848465	14	80
41	2017-05-16 07:04:31.892634	2017-05-16 07:04:31.892634	14	100
42	2017-05-16 07:04:31.916027	2017-05-16 07:04:31.916027	14	12
43	2017-05-16 07:04:31.947985	2017-05-16 07:04:31.947985	15	89
44	2017-05-16 07:04:31.971515	2017-05-16 07:04:31.971515	15	90
45	2017-05-16 07:04:32.015061	2017-05-16 07:04:32.015061	15	92
46	2017-05-16 07:04:32.037036	2017-05-16 07:04:32.037036	15	8
47	2017-05-16 07:04:32.071571	2017-05-16 07:04:32.071571	16	65
48	2017-05-16 07:04:32.09285	2017-05-16 07:04:32.09285	16	67
49	2017-05-16 07:04:32.115553	2017-05-16 07:04:32.115553	16	77
50	2017-05-16 07:04:32.138221	2017-05-16 07:04:32.138221	16	6
51	2017-05-16 07:04:32.159264	2017-05-16 07:04:32.159264	17	96
52	2017-05-16 07:04:32.181751	2017-05-16 07:04:32.181751	17	97
53	2017-05-16 07:04:32.204911	2017-05-16 07:04:32.204911	17	2
54	2017-05-16 07:04:32.226828	2017-05-16 07:04:32.226828	18	75
55	2017-05-16 07:04:32.248482	2017-05-16 07:04:32.248482	18	76
56	2017-05-16 07:04:32.270687	2017-05-16 07:04:32.270687	18	77
57	2017-05-16 07:04:32.293717	2017-05-16 07:04:32.293717	18	14
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 57, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-05-16 07:04:18.37233	2017-05-16 07:04:18.37233	1
2	Corrientes	2017-05-16 07:04:18.406779	2017-05-16 07:04:18.406779	1
3	Itapúa	2017-05-16 07:04:18.439997	2017-05-16 07:04:18.439997	2
4	Bahia	2017-05-16 07:04:18.472969	2017-05-16 07:04:18.472969	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-05-16 07:04:29.65897	2017-05-16 07:04:29.65897	1	1	1	1	1
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-05-16 07:04:29.742913	2017-05-16 07:04:29.742913	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-05-16 07:04:29.82453	2017-05-16 07:04:29.82453	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-05-16 07:04:29.899059	2017-05-16 07:04:29.899059	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-05-16 07:04:29.980592	2017-05-16 07:04:29.980592	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-05-16 07:04:30.053801	2017-05-16 07:04:30.053801	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-05-16 07:04:30.131754	2017-05-16 07:04:30.131754	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-05-16 07:04:30.199174	2017-05-16 07:04:30.199174	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-05-16 07:04:30.266176	2017-05-16 07:04:30.266176	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-05-16 07:04:30.331964	2017-05-16 07:04:30.331964	1	1	1	1	1
11	PR-011	Percentil	Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para hacerlo en escala y poder ganar dinero con ello.	España	422			4590432	percentil@gmail.com	percentil.com	2017-05-16 07:04:30.401911	2017-05-16 07:04:30.401911	1	1	1	1	1
12	PR-012	EmbryoTools	 Son una referencia mundial en reproducción asistida. Trabajan en cuatro ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos, porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de los productos que vayan a entrar en contacto con embriones humanos y por último trabajan en la reproducción asistida en veterinaria.	Mariano Moreno	4122			465888	embryotools@gmail.com	embryotools.com	2017-05-16 07:04:30.465056	2017-05-16 07:04:30.465056	1	1	1	1	1
13	PR-013	Aplázame	 Es un método de pago que se integra en el proceso de compra del comercio electrónico y permite a los clientes de las tiendas online comprar con un crédito instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando para hacerlo en breve.	Av. San Martin	4532			453222	aplazame@gmail.com	aplazame.com	2017-05-16 07:04:30.532213	2017-05-16 07:04:30.532213	1	1	1	1	1
14	PR-014	BrioAgro Technologies	Deesarrollo de una tecnología para que el agricultor controle su explotación. El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor, a través de su dispositivo, se conecta a la nube para acceder a la información de su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier cambio en sus variables.	Colon 	555			4651244	bioagro@gmail.com	bioagro.com	2017-05-16 07:04:30.60074	2017-05-16 07:04:30.60074	1	1	1	1	1
15	PR-015	Braingaze	La tecnología desarrollada detecta un pequeño movimiento ocular que permite determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y dislexia.	Miami	708			490123	baringaze@gmail.com	braingaze.com	2017-05-16 07:04:30.665897	2017-05-16 07:04:30.665897	1	1	1	1	1
16	PR-016	CreatorStats	Mejoran la métrica de los ‘youtubers’.	Inglaterra	200			15432510	creatorstats@gmail.com	creatorstats.com	2017-05-16 07:04:30.732728	2017-05-16 07:04:30.732728	1	1	1	1	1
17	PR-017	Alzhup	Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología como vehículo para que la solución sea accesible a todo el mundo. Implementan a nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados científicamente. Y también, herramientas para la memoria, capaces de personalizar dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro almacena los recuerdos y que difiere de los sistemas actuales computarizados.	Constitucion	2222			467632	alzhup@gmail.com	alzhup.com	2017-05-16 07:04:30.812043	2017-05-16 07:04:30.812043	1	1	1	1	1
18	PR-018	Axter Aerospace	Están desarrollando un sistema de propulsión híbrida para las avionetas, que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU. De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción y ensamblado.	Ayacucho	9200			432111	axteraerospace@gmail.com	axteraerospace.com	2017-05-16 07:04:30.876858	2017-05-16 07:04:30.876858	1	1	1	1	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 18, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-05-16 07:04:39.179891	2017-05-16 07:04:39.179891
2	super_admin	2017-05-16 07:04:39.205271	2017-05-16 07:04:39.205271
3	Encargado de Proyectos (mentor)	2017-05-16 07:04:39.227744	2017-05-16 07:04:39.227744
4	Miembro de Equipo	2017-05-16 07:04:39.25075	2017-05-16 07:04:39.25075
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-05-16 07:04:19.293464	2017-05-16 07:04:19.293464	1
2	Encargado de recaudaciones e ingresos	2017-05-16 07:04:19.34996	2017-05-16 07:04:19.34996	1
3	Jefe de Recursos Humanos	2017-05-16 07:04:19.393591	2017-05-16 07:04:19.393591	2
4	Jefe de mercadeo	2017-05-16 07:04:19.450603	2017-05-16 07:04:19.450603	3
5	jefe de producción	2017-05-16 07:04:19.505761	2017-05-16 07:04:19.505761	3
6	Investigación y desarrollo	2017-05-16 07:04:19.550297	2017-05-16 07:04:19.550297	4
7	Capacitación - Mentoring	2017-05-16 07:04:19.593154	2017-05-16 07:04:19.593154	4
8	Director General	2017-05-16 07:04:19.65052	2017-05-16 07:04:19.65052	5
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
1	5	minutes	4	2017-05-16 07:04:47.366252	2017-05-16 07:04:47.366252
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, true);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-05-16 07:04:18.799543	2017-05-16 07:04:18.799543
2	Libreta de Enrolamiento	2017-05-16 07:04:18.827468	2017-05-16 07:04:18.827468
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-05-16 07:04:47.147508	2017-05-16 07:04:47.147508
2	Tarjeta de crédito Visa	2017-05-16 07:04:47.204366	2017-05-16 07:04:47.204366
3	Tarjeta Naranja	2017-05-16 07:04:47.248408	2017-05-16 07:04:47.248408
4	Saldo de cuenta	2017-05-16 07:04:47.29207	2017-05-16 07:04:47.29207
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-05-16 07:04:40.247978	2017-05-16 07:04:40.247978	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-05-16 07:04:40.503045	2017-05-16 07:04:40.503045	2	1
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	1	2017-05-17 00:59:39.481064	2017-05-17 00:59:39.481064	127.0.0.1	127.0.0.1	2017-05-16 07:04:39.997056	2017-05-17 00:59:39.487572	1	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-05-16 07:04:48.346927	2017-05-16 07:04:48.346927	1	1
2	2017-01-20	2017-05-16 07:04:48.365317	2017-05-16 07:04:48.365317	1	1
3	2017-02-10	2017-05-16 07:04:48.38775	2017-05-16 07:04:48.38775	2	1
4	2017-02-20	2017-05-16 07:04:48.410955	2017-05-16 07:04:48.410955	2	1
5	2017-03-10	2017-05-16 07:04:48.43199	2017-05-16 07:04:48.43199	3	1
6	2017-03-20	2017-05-16 07:04:48.455343	2017-05-16 07:04:48.455343	3	1
7	2017-04-10	2017-05-16 07:04:48.476636	2017-05-16 07:04:48.476636	4	1
8	2017-04-20	2017-05-16 07:04:48.499989	2017-05-16 07:04:48.499989	4	1
9	2017-05-10	2017-05-16 07:04:48.521024	2017-05-16 07:04:48.521024	5	1
10	2017-05-20	2017-05-16 07:04:48.544495	2017-05-16 07:04:48.544495	5	1
11	2017-06-10	2017-05-16 07:04:48.565828	2017-05-16 07:04:48.565828	6	1
12	2017-06-20	2017-05-16 07:04:48.587424	2017-05-16 07:04:48.587424	6	1
13	2017-07-10	2017-05-16 07:04:48.610699	2017-05-16 07:04:48.610699	7	1
14	2017-07-20	2017-05-16 07:04:48.631976	2017-05-16 07:04:48.631976	7	1
15	2017-08-10	2017-05-16 07:04:48.654922	2017-05-16 07:04:48.654922	8	1
16	2017-08-20	2017-05-16 07:04:48.676699	2017-05-16 07:04:48.676699	8	1
17	2017-09-10	2017-05-16 07:04:48.699951	2017-05-16 07:04:48.699951	9	1
18	2017-09-20	2017-05-16 07:04:48.722126	2017-05-16 07:04:48.722126	9	1
19	2017-10-10	2017-05-16 07:04:48.743187	2017-05-16 07:04:48.743187	10	1
20	2017-10-20	2017-05-16 07:04:48.765866	2017-05-16 07:04:48.765866	10	1
21	2017-11-10	2017-05-16 07:04:48.787422	2017-05-16 07:04:48.787422	11	1
22	2017-11-20	2017-05-16 07:04:48.810722	2017-05-16 07:04:48.810722	11	1
23	2017-12-10	2017-05-16 07:04:48.832173	2017-05-16 07:04:48.832173	12	1
24	2017-12-20	2017-05-16 07:04:48.855264	2017-05-16 07:04:48.855264	12	1
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

