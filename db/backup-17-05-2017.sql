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
1	Crear	create	2017-05-17 16:37:26.47772	2017-05-17 16:37:26.47772
2	Eliminar	destroy	2017-05-17 16:37:26.513886	2017-05-17 16:37:26.513886
3	Ver	show	2017-05-17 16:37:26.579233	2017-05-17 16:37:26.579233
4	Index	index	2017-05-17 16:37:26.647789	2017-05-17 16:37:26.647789
5	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-05-17 16:37:26.681738	2017-05-17 16:37:26.681738
6	Editar	update	2017-05-17 16:37:26.713236	2017-05-17 16:37:26.713236
7	Estadisticas	estadistica	2017-05-17 16:37:26.736549	2017-05-17 16:37:26.736549
8	Auditorias	auditorias	2017-05-17 16:37:26.76971	2017-05-17 16:37:26.76971
9	Ver PDF	pdf	2017-05-17 16:37:26.792118	2017-05-17 16:37:26.792118
10	Descargar hoja de cálculo	calculo	2017-05-17 16:37:26.826826	2017-05-17 16:37:26.826826
11	PDF del modelo	model_pdf	2017-05-17 16:37:26.858311	2017-05-17 16:37:26.858311
12	Hoja de cálculo del Modelo	model_calculo	2017-05-17 16:37:26.880968	2017-05-17 16:37:26.880968
13	Ver cuotas atrasadas	cuotas_atrasadas	2017-05-17 16:37:26.916254	2017-05-17 16:37:26.916254
14	Ver proyectos en posible estado de abandono	proyectos_abandonados	2017-05-17 16:37:26.946692	2017-05-17 16:37:26.946692
15	Ver Notificaciones	notificaciones	2017-05-17 16:37:26.969376	2017-05-17 16:37:26.969376
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 15, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	\N	2017-05-17 16:37:22.87336	2017-05-17 16:37:22.87336	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-05-17 16:37:22.955633	2017-05-17 16:37:22.955633	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-05-17 16:37:23.03323	2017-05-17 16:37:23.03323	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-05-17 16:37:23.101138	2017-05-17 16:37:23.101138	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-05-17 16:37:23.217449	2017-05-17 16:37:23.217449	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-05-17 16:37:23.282368	2017-05-17 16:37:23.282368	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-05-17 16:37:23.34321	2017-05-17 16:37:23.34321	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-05-17 16:37:23.398972	2017-05-17 16:37:23.398972	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-05-17 16:37:23.457485	2017-05-17 16:37:23.457485	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-05-17 16:37:23.517208	2017-05-17 16:37:23.517208	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-05-17 16:37:23.584709	2017-05-17 16:37:23.584709	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-05-17 16:37:34.964019	2017-05-17 16:37:34.964019	1	1	3
2	\N	2017-05-17 16:37:35.021894	2017-05-17 16:37:35.021894	1	2	3
3	\N	2017-05-17 16:37:35.066107	2017-05-17 16:37:35.066107	2	1	3
4	\N	2017-05-17 16:37:35.122045	2017-05-17 16:37:35.122045	2	2	3
5	\N	2017-05-17 16:37:35.177003	2017-05-17 16:37:35.177003	2	3	2
6	\N	2017-05-17 16:37:35.232918	2017-05-17 16:37:35.232918	3	1	3
7	\N	2017-05-17 16:37:35.287861	2017-05-17 16:37:35.287861	3	2	3
8	\N	2017-05-17 16:37:35.342778	2017-05-17 16:37:35.342778	3	3	2
9	\N	2017-05-17 16:37:35.387686	2017-05-17 16:37:35.387686	4	1	3
10	\N	2017-05-17 16:37:35.431921	2017-05-17 16:37:35.431921	4	2	3
11	\N	2017-05-17 16:37:35.476142	2017-05-17 16:37:35.476142	4	3	2
12	\N	2017-05-17 16:37:35.521354	2017-05-17 16:37:35.521354	5	1	3
13	\N	2017-05-17 16:37:35.565089	2017-05-17 16:37:35.565089	5	2	3
14	\N	2017-05-17 16:37:35.610113	2017-05-17 16:37:35.610113	5	3	2
15	\N	2017-05-17 16:37:35.665453	2017-05-17 16:37:35.665453	6	1	3
16	\N	2017-05-17 16:37:35.723347	2017-05-17 16:37:35.723347	6	2	3
17	\N	2017-05-17 16:37:35.778722	2017-05-17 16:37:35.778722	6	3	2
18	\N	2017-05-17 16:37:35.832431	2017-05-17 16:37:35.832431	7	1	3
19	\N	2017-05-17 16:37:35.889109	2017-05-17 16:37:35.889109	7	2	3
20	\N	2017-05-17 16:37:35.944349	2017-05-17 16:37:35.944349	7	3	2
21	\N	2017-05-17 16:37:35.998815	2017-05-17 16:37:35.998815	8	1	3
22	\N	2017-05-17 16:37:36.043155	2017-05-17 16:37:36.043155	8	2	3
23	\N	2017-05-17 16:37:36.088518	2017-05-17 16:37:36.088518	8	3	2
24	\N	2017-05-17 16:37:36.14405	2017-05-17 16:37:36.14405	9	1	3
25	\N	2017-05-17 16:37:36.199828	2017-05-17 16:37:36.199828	9	2	3
26	\N	2017-05-17 16:37:36.243605	2017-05-17 16:37:36.243605	9	3	2
27	\N	2017-05-17 16:37:36.299569	2017-05-17 16:37:36.299569	10	1	3
28	\N	2017-05-17 16:37:36.355235	2017-05-17 16:37:36.355235	10	2	3
29	\N	2017-05-17 16:37:36.410436	2017-05-17 16:37:36.410436	10	3	2
30	\N	2017-05-17 16:37:36.466417	2017-05-17 16:37:36.466417	11	1	3
31	\N	2017-05-17 16:37:36.521752	2017-05-17 16:37:36.521752	11	2	3
32	\N	2017-05-17 16:37:36.577554	2017-05-17 16:37:36.577554	11	3	2
33	\N	2017-05-17 16:37:36.644097	2017-05-17 16:37:36.644097	12	1	3
34	\N	2017-05-17 16:37:36.698701	2017-05-17 16:37:36.698701	12	2	3
35	\N	2017-05-17 16:37:36.743448	2017-05-17 16:37:36.743448	12	3	2
36	\N	2017-05-17 16:37:36.788383	2017-05-17 16:37:36.788383	13	1	3
37	\N	2017-05-17 16:37:36.83266	2017-05-17 16:37:36.83266	13	2	3
38	\N	2017-05-17 16:37:36.878428	2017-05-17 16:37:36.878428	13	3	2
39	\N	2017-05-17 16:37:36.932705	2017-05-17 16:37:36.932705	14	1	3
40	\N	2017-05-17 16:37:36.978348	2017-05-17 16:37:36.978348	14	2	3
41	\N	2017-05-17 16:37:37.021751	2017-05-17 16:37:37.021751	14	3	2
42	\N	2017-05-17 16:37:37.066188	2017-05-17 16:37:37.066188	15	1	3
43	\N	2017-05-17 16:37:37.110638	2017-05-17 16:37:37.110638	15	2	3
44	\N	2017-05-17 16:37:37.167635	2017-05-17 16:37:37.167635	15	3	2
45	\N	2017-05-17 16:37:37.232419	2017-05-17 16:37:37.232419	16	1	3
46	\N	2017-05-17 16:37:37.277457	2017-05-17 16:37:37.277457	16	2	3
47	\N	2017-05-17 16:37:37.354214	2017-05-17 16:37:37.354214	16	3	2
48	\N	2017-05-17 16:37:37.410433	2017-05-17 16:37:37.410433	17	1	3
49	\N	2017-05-17 16:37:37.468043	2017-05-17 16:37:37.468043	17	2	3
50	\N	2017-05-17 16:37:37.535237	2017-05-17 16:37:37.535237	17	3	2
51	\N	2017-05-17 16:37:37.632852	2017-05-17 16:37:37.632852	18	1	3
52	\N	2017-05-17 16:37:37.690214	2017-05-17 16:37:37.690214	18	2	3
53	\N	2017-05-17 16:37:37.744017	2017-05-17 16:37:37.744017	18	3	2
54	\N	2017-05-17 16:37:37.80007	2017-05-17 16:37:37.80007	1	3	3
55	2017-04-02	2017-05-17 16:37:37.857086	2017-05-17 16:37:37.857086	1	4	3
56	2017-04-08	2017-05-17 16:37:37.911207	2017-05-17 16:37:37.911207	1	5	3
57	2017-04-18	2017-05-17 16:37:37.966382	2017-05-17 16:37:37.966382	1	6	3
58	2017-04-26	2017-05-17 16:37:38.010698	2017-05-17 16:37:38.010698	1	7	3
59	2017-05-27	2017-05-17 16:37:38.055836	2017-05-17 19:15:00.447178	1	8	3
60	\N	2017-05-17 19:15:00.999144	2017-05-17 19:15:00.999144	1	9	\N
61	\N	2017-05-17 19:15:01.072608	2017-05-17 19:15:01.072608	1	10	\N
62	\N	2017-05-17 19:15:01.130422	2017-05-17 19:15:01.130422	1	11	\N
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 62, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-05-17 16:37:12.834792	2017-05-17 16:37:12.834792
2	Rural	2017-05-17 16:37:12.862538	2017-05-17 16:37:12.862538
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
389	1	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	4fb48fe0-243b-4259-9883-631bed1f28da	2017-05-17 16:39:51.636879
390	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 1\n	2	\N	127.0.0.1	4fb48fe0-243b-4259-9883-631bed1f28da	2017-05-17 16:39:51.718447
391	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	4fb48fe0-243b-4259-9883-631bed1f28da	2017-05-17 16:39:51.781828
392	2	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	9b0438c8-d176-4678-a21a-90453514a017	2017-05-17 16:41:02.009919
393	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 2\n	2	\N	127.0.0.1	9b0438c8-d176-4678-a21a-90453514a017	2017-05-17 16:41:02.075434
394	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	9b0438c8-d176-4678-a21a-90453514a017	2017-05-17 16:41:02.128138
395	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 412.0\n	2	\N	127.0.0.1	9b0438c8-d176-4678-a21a-90453514a017	2017-05-17 16:41:02.177546
396	3	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	ba9176f3-b871-42f4-a7f2-cd3644207594	2017-05-17 16:41:46.535302
397	3	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 3\n	2	\N	127.0.0.1	ba9176f3-b871-42f4-a7f2-cd3644207594	2017-05-17 16:41:46.586591
398	3	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	ba9176f3-b871-42f4-a7f2-cd3644207594	2017-05-17 16:41:46.63997
399	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 412.0\n- 124.0\n	3	\N	127.0.0.1	ba9176f3-b871-42f4-a7f2-cd3644207594	2017-05-17 16:41:46.688124
400	4	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 51\ncuenta_id: 1\ncontrato_id: 1\n	1	\N	127.0.0.1	2e4e3851-d69c-43b3-b6b7-d07ca7cd37aa	2017-05-17 16:42:54.327554
401	4	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 4\n	2	\N	127.0.0.1	2e4e3851-d69c-43b3-b6b7-d07ca7cd37aa	2017-05-17 16:42:54.38804
402	4	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	2e4e3851-d69c-43b3-b6b7-d07ca7cd37aa	2017-05-17 16:42:54.435702
403	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 124.0\n- 0.0\n	4	\N	127.0.0.1	2e4e3851-d69c-43b3-b6b7-d07ca7cd37aa	2017-05-17 16:42:54.484586
404	5	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 576.0\ntipo_de_pago_id: \nproyecto_id: 2\npersona_id: 52\ncuenta_id: 2\ncontrato_id: 2\n	1	\N	127.0.0.1	759c997e-d975-40e9-8457-3d83787e56da	2017-05-17 16:44:22.18934
405	5	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 5\n	2	\N	127.0.0.1	759c997e-d975-40e9-8457-3d83787e56da	2017-05-17 16:44:22.250877
406	6	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 5\n	2	\N	127.0.0.1	759c997e-d975-40e9-8457-3d83787e56da	2017-05-17 16:44:22.3032
407	5	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	759c997e-d975-40e9-8457-3d83787e56da	2017-05-17 16:44:22.355435
408	6	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	759c997e-d975-40e9-8457-3d83787e56da	2017-05-17 16:44:22.401235
409	6	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 576.0\ntipo_de_pago_id: \nproyecto_id: 2\npersona_id: 52\ncuenta_id: 2\ncontrato_id: 2\n	1	\N	127.0.0.1	a5e1cd96-4cd8-46a6-a864-cf8cbe848de7	2017-05-17 16:45:54.36931
410	7	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 6\n	2	\N	127.0.0.1	a5e1cd96-4cd8-46a6-a864-cf8cbe848de7	2017-05-17 16:45:54.430622
411	8	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 6\n	2	\N	127.0.0.1	a5e1cd96-4cd8-46a6-a864-cf8cbe848de7	2017-05-17 16:45:54.474632
412	7	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	a5e1cd96-4cd8-46a6-a864-cf8cbe848de7	2017-05-17 16:45:54.523881
413	8	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	a5e1cd96-4cd8-46a6-a864-cf8cbe848de7	2017-05-17 16:45:54.564968
414	2	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 68.0\n	2	\N	127.0.0.1	a5e1cd96-4cd8-46a6-a864-cf8cbe848de7	2017-05-17 16:45:54.608689
415	7	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 3\npersona_id: 54\ncuenta_id: 3\ncontrato_id: 3\n	1	\N	127.0.0.1	74333414-ab30-4c63-be5d-2d545f253102	2017-05-17 16:47:01.183264
416	9	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 7\n	2	\N	127.0.0.1	74333414-ab30-4c63-be5d-2d545f253102	2017-05-17 16:47:01.233129
417	9	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	74333414-ab30-4c63-be5d-2d545f253102	2017-05-17 16:47:01.282686
418	3	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 12.0\n	2	\N	127.0.0.1	74333414-ab30-4c63-be5d-2d545f253102	2017-05-17 16:47:01.32537
419	8	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 4\npersona_id: 56\ncuenta_id: 4\ncontrato_id: 4\n	1	\N	127.0.0.1	e87bc045-e7f9-4859-a176-b0f87a8ad661	2017-05-17 16:47:43.595106
420	13	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 8\n	2	\N	127.0.0.1	e87bc045-e7f9-4859-a176-b0f87a8ad661	2017-05-17 16:47:43.644862
421	13	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	e87bc045-e7f9-4859-a176-b0f87a8ad661	2017-05-17 16:47:43.691561
422	4	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 512.0\n	2	\N	127.0.0.1	e87bc045-e7f9-4859-a176-b0f87a8ad661	2017-05-17 16:47:43.73307
423	26	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 3\nevento_id: 3\n	1	\N	127.0.0.1	a80e21ac-8eb6-4af5-8bde-f088f25f77b6	2017-05-17 16:56:55.754158
424	27	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 5\nevento_id: 3\n	1	\N	127.0.0.1	a80e21ac-8eb6-4af5-8bde-f088f25f77b6	2017-05-17 16:56:55.811874
425	28	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 6\nevento_id: 3\n	1	\N	127.0.0.1	a80e21ac-8eb6-4af5-8bde-f088f25f77b6	2017-05-17 16:56:55.860159
426	3	Evento	\N	\N	1	User	\N	create	---\ncodigo: EV-003\nnombre: Diseño meetup\ndescripcion: "-"\ndia: 2017-05-18\nhora: 2017-05-17 16:30:00.000000000 -03:00\n	1	\N	127.0.0.1	a80e21ac-8eb6-4af5-8bde-f088f25f77b6	2017-05-17 16:56:55.955971
427	59	ActividadProyecto	\N	\N	1	User	\N	update	---\nestado_id:\n- 2\n- 3\n	2	\N	127.0.0.1	c230987f-251d-4e52-9b09-00a49fdfac70	2017-05-17 19:15:00.53698
428	1	Proyecto	\N	\N	1	User	\N	update	---\netapa_id:\n- 2\n- 3\n	2	\N	127.0.0.1	c230987f-251d-4e52-9b09-00a49fdfac70	2017-05-17 19:15:00.937881
429	60	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 9\nestado_id: \n	1	\N	127.0.0.1	c230987f-251d-4e52-9b09-00a49fdfac70	2017-05-17 19:15:01.044551
430	61	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 10\nestado_id: \n	1	\N	127.0.0.1	c230987f-251d-4e52-9b09-00a49fdfac70	2017-05-17 19:15:01.099777
431	62	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 11\nestado_id: \n	1	\N	127.0.0.1	c230987f-251d-4e52-9b09-00a49fdfac70	2017-05-17 19:15:01.154624
432	9	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-05-17\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 4\npersona_id: 56\ncuenta_id: 4\ncontrato_id: 4\n	1	\N	127.0.0.1	b9665377-f16e-425c-a8ba-1157644bf10a	2017-05-17 19:18:03.470917
433	14	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 9\n	2	\N	127.0.0.1	b9665377-f16e-425c-a8ba-1157644bf10a	2017-05-17 19:18:03.552277
434	14	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	b9665377-f16e-425c-a8ba-1157644bf10a	2017-05-17 19:18:03.616387
435	4	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 512.0\n- 224.0\n	3	\N	127.0.0.1	b9665377-f16e-425c-a8ba-1157644bf10a	2017-05-17 19:18:03.661993
436	29	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 3\nevento_id: 4\n	1	\N	127.0.0.1	56b80ff9-6a90-4306-942d-1c699fb3c057	2017-05-17 19:22:20.134425
437	30	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 7\nevento_id: 4\n	1	\N	127.0.0.1	56b80ff9-6a90-4306-942d-1c699fb3c057	2017-05-17 19:22:20.191057
438	31	EventoProyecto	\N	\N	1	User	\N	create	---\nproyecto_id: 8\nevento_id: 4\n	1	\N	127.0.0.1	56b80ff9-6a90-4306-942d-1c699fb3c057	2017-05-17 19:22:20.230778
439	4	Evento	\N	\N	1	User	\N	create	---\ncodigo: EV-004\nnombre: Consultoria 2\ndescripcion: "-"\ndia: 2017-05-19\nhora: 2017-05-17 19:21:00.000000000 -03:00\n	1	\N	127.0.0.1	56b80ff9-6a90-4306-942d-1c699fb3c057	2017-05-17 19:22:20.379964
366	3	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 7\nevento_id: 1\n	1	\N	\N	08954c34-549a-414b-82b1-ef735953c813	2017-05-17 16:37:57.724156
367	4	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 8\nevento_id: 1\n	1	\N	\N	36bf195a-94bf-4ee3-ad08-7132a8ea832b	2017-05-17 16:37:57.772699
114	1	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Pre incubacion\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	d3602b50-9929-43eb-8416-68e26b89227f	2017-05-17 16:37:22.612529
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	238ab177-b8d7-4176-904e-e8819d788c9c	2017-05-17 16:37:13.090439
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	0207ca22-5a5e-4ebc-a980-44d32d89f234	2017-05-17 16:37:13.18023
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	4d3d712a-f3cb-4fc0-b39d-487569747d4e	2017-05-17 16:37:13.237541
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	33348a1c-f73d-45ed-9072-aeed0b3d885d	2017-05-17 16:37:13.288188
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	689ca343-71d8-4beb-a41b-208048ee7d07	2017-05-17 16:37:13.332641
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	d7f42272-cbc6-4043-8526-3b6451209976	2017-05-17 16:37:13.43186
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	f72cebea-6572-4249-92e9-af9f7cfc61f9	2017-05-17 16:37:13.48074
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	706cecba-f052-419a-b8c4-a9a0bb040b99	2017-05-17 16:37:13.53426
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	b84cf58a-8afa-4d86-a673-dbba94b9fed5	2017-05-17 16:37:13.579892
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	49436550-959d-4812-b45d-22e3870de09b	2017-05-17 16:37:13.637076
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	449374a1-2e36-4158-b16e-aefb361bf24e	2017-05-17 16:37:13.692828
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	f76e89b8-b0ec-438c-b0c0-b3ca429f36ea	2017-05-17 16:37:13.750892
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	832b8e44-b692-4a37-a0ea-b58310d03ef3	2017-05-17 16:37:13.801927
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	4f863bc0-b998-4d8a-9a69-e7543c8e68f4	2017-05-17 16:37:14.091738
115	2	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Incubación\ndescripcion: "-"\netapaAnterior: 1\n	1	\N	\N	6dbaf2d2-ec84-4cf0-b185-eb2ec31ebdc8	2017-05-17 16:37:22.667515
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	14b0d330-ede0-493c-a15c-d79f4ac9f521	2017-05-17 16:37:14.180232
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	09e55f99-709b-485a-8f7d-b3489a35f969	2017-05-17 16:37:14.257226
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	f4d7f3a3-b8ea-4226-960f-6d217e64196d	2017-05-17 16:37:14.337008
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	52ea05a4-8e44-46bc-8a57-55cc6ba12278	2017-05-17 16:37:14.430152
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	192a8ded-c74b-4d24-9b5d-bc4d934c8856	2017-05-17 16:37:14.511265
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-007\nnombre: Maria\napellido: Gonzalez\nnroIdentificacion: '36134076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mg@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	8dd15576-012f-4dab-b235-e0f9ae076898	2017-05-17 16:37:14.594055
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-008\nnombre: Elena\napellido: Ceballos\nnroIdentificacion: '25198461'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: ec@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	16d0dd63-fe2b-4dd6-9ead-3c01e2663fa6	2017-05-17 16:37:14.677444
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-009\nnombre: Alberto\napellido: Padilla\nnroIdentificacion: '33843657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: ap@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	749e9343-263f-4234-8bf5-57bd8d77fc30	2017-05-17 16:37:14.75248
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-010\nnombre: Fernando\napellido: Gonzalez\nnroIdentificacion: '33980912'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: fg@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	e3186e0c-1569-4657-a732-e7b9cd7d1947	2017-05-17 16:37:14.835407
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-011\nnombre: Tiago\napellido: Gonzalez\nnroIdentificacion: '38187222'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: tiagogonzales@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	decae14d-4d53-45e4-9800-c71287f5ab30	2017-05-17 16:37:14.91409
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-012\nnombre: Cintia\napellido: Castro\nnroIdentificacion: '22612413'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cintiacastro@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	15597e11-f611-4cb9-8db8-efb9c2e83731	2017-05-17 16:37:15.000069
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-013\nnombre: Josefina\napellido: Jardin\nnroIdentificacion: '36025176'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: josefinajardin@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	3c8c388f-9d23-4e9d-affa-a80240ded7b5	2017-05-17 16:37:15.07551
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-014\nnombre: Diana\napellido: Rivas\nnroIdentificacion: '25948001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: dianarivas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	160946d8-5ae4-4407-baa2-6d26fb568bc9	2017-05-17 16:37:15.157347
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-015\nnombre: Dario\napellido: Gonzalez\nnroIdentificacion: '33880019'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: dariogonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	aac707ba-3785-42a4-a05b-76487287c631	2017-05-17 16:37:15.252507
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-016\nnombre: Ciro\napellido: Zamora\nnroIdentificacion: '33983707'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: cirozamora@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	273d006c-960e-4c7a-b97d-746c8f34ac4f	2017-05-17 16:37:15.337525
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-017\nnombre: Zoe\napellido: Vazquez\nnroIdentificacion: '3818104'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoevazquez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	7860388b-3b94-4c51-88c9-7dd31cb3545c	2017-05-17 16:37:15.426693
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-018\nnombre: Cristian\napellido: Gonzalez\nnroIdentificacion: '22659193'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cristiangonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	e57ec932-45d5-489f-96e2-ece7ab61edf2	2017-05-17 16:37:15.513943
116	3	Etapa	\N	\N	1	\N	\N	create	---\nnombre: post incubacion\ndescripcion: "-"\netapaAnterior: 2\n	1	\N	\N	478d3c3b-f5e1-4cab-a9dc-39ebb10c2da3	2017-05-17 16:37:22.720916
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-019\nnombre: Ana\napellido: Manfrin\nnroIdentificacion: '36222076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: anamanfrin@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	7735765a-071a-491c-a8da-3a1ce4242649	2017-05-17 16:37:15.589237
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-020\nnombre: Martina\napellido: Adamo\nnroIdentificacion: '25841001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaadamo@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4e219e6a-3e7a-49a5-9882-83f8c004b721	2017-05-17 16:37:15.673454
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-021\nnombre: Roberto\napellido: Milani\nnroIdentificacion: '33880333'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: robertomilani@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	4f142b33-72f6-4cca-a781-fb832534e2ca	2017-05-17 16:37:15.757338
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-022\nnombre: Victor\napellido: Gonzalez\nnroIdentificacion: '33984447'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorgonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	9afb0c48-e689-42e0-8c5d-ed41430f722a	2017-05-17 16:37:15.837489
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-023\nnombre: Alejandro\napellido: Cambril\nnroIdentificacion: '38113409'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: alejandrocambril@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	1a67e5c4-8526-4ea7-9d6d-705effc62474	2017-05-17 16:37:15.912198
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-024\nnombre: Luis\napellido: Rizzo\nnroIdentificacion: '22543493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luisrizzo@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	e614c687-eb21-4597-aefa-d6640d5adc51	2017-05-17 16:37:15.993043
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-025\nnombre: Mario\napellido: Rosas\nnroIdentificacion: '36060986'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mariorosas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	fc32c02b-9558-4f3b-8235-8d03b4e80340	2017-05-17 16:37:16.068694
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-026\nnombre: Analia\napellido: Granados\nnroIdentificacion: '25131701'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: analiagranados@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	107382ae-cfd2-4838-b70c-5f44f0f2ad98	2017-05-17 16:37:16.175484
40	27	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-027\nnombre: Leonor\napellido: Gonzalez\nnroIdentificacion: '33888717'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: leonorgonzalez@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	0b2a9c41-c1f5-463b-b1c2-ce9410eb5de5	2017-05-17 16:37:16.258967
41	28	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-028\nnombre: Victor\napellido: Baresi\nnroIdentificacion: '33928407'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorbaresi@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	14ff1112-315d-4688-a626-b8594cc25a98	2017-05-17 16:37:16.336055
42	29	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-029\nnombre: Silvana\napellido: Lazzaga\nnroIdentificacion: '38918849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: silvanalazzaga@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	8ec2ec67-ad13-4539-8c61-745f785fcd38	2017-05-17 16:37:16.423967
43	30	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-030\nnombre: Juana\napellido: Calabrese\nnroIdentificacion: '220192493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: janacalabrese@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	8ecde1bc-de31-4cd3-b25d-5702ea95e0e2	2017-05-17 16:37:16.502483
184	35	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	9ca00f69-48da-4fd1-8cde-40615183893f	2017-05-17 16:37:36.761408
44	31	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-031\nnombre: Juliana\napellido: Lombardi\nnroIdentificacion: '38613849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: julianalombardi@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	9a01354d-63e3-4151-b20c-efa914969b9f	2017-05-17 16:37:16.591396
45	32	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-032\nnombre: Enrique\napellido: Cano\nnroIdentificacion: '22451493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: enriquecano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	9dd6f110-6893-42e0-ab5d-3e2ea3d67bb5	2017-05-17 16:37:16.669202
46	33	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-033\nnombre: Gilda\napellido: Lombarde\nnroIdentificacion: '36064356'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: gildalombarde@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	a4aaa514-22ba-4fdb-b951-edea85d280f9	2017-05-17 16:37:16.746204
47	34	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-034\nnombre: Martin\napellido: Bande\nnroIdentificacion: '25124501'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinbande@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2753e724-d472-483c-8e32-088181043665	2017-05-17 16:37:16.824896
48	35	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-035\nnombre: Gabriel\napellido: Ferruccio\nnroIdentificacion: '33451657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: gabrielferuccio@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	d1a9752b-77b1-4f44-ae0f-494188238592	2017-05-17 16:37:16.898972
49	36	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-036\nnombre: Juan\napellido: Mazzanti\nnroIdentificacion: '33956107'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: juanmazzanti@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	f63fdcb4-7e6f-4aa4-aac3-46207f2cd954	2017-05-17 16:37:16.979128
50	37	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-037\nnombre: Karina\napellido: Fiorentino\nnroIdentificacion: '38663849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: karinafiorentino@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	6f06dd18-64c5-4bab-8726-73df7e4ef1ca	2017-05-17 16:37:17.05732
51	38	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-038\nnombre: Osvaldo\napellido: Pagnotto\nnroIdentificacion: '22019493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: osvaldopagnotto@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	52cfb280-f8b3-41f3-9a9f-44de625bd507	2017-05-17 16:37:17.135952
52	39	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-039\nnombre: Margarita\napellido: Giordano\nnroIdentificacion: '36068886'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: margaritagiordano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	9e0b3d33-95ca-4b45-a22e-8b4649ae12ca	2017-05-17 16:37:17.218118
53	40	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-040\nnombre: Rosa\napellido: Napolitano\nnroIdentificacion: '2576401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: rosanapolitano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	17899062-0987-4f11-9ffc-02b0d9fe5685	2017-05-17 16:37:17.305388
54	41	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-041\nnombre: Magdalena\napellido: Bruno\nnroIdentificacion: '38817849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: mardalenabruno@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	03b53e23-1090-4429-9626-be1c2a20a7b5	2017-05-17 16:37:17.392918
55	42	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-042\nnombre: Mauricio\napellido: Costa\nnroIdentificacion: '22755493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: mauriciocosta@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	ff680905-6d63-4289-8508-845ce732bffb	2017-05-17 16:37:17.467295
56	43	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-043\nnombre: Ivan\napellido: Costas\nnroIdentificacion: '36755076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: ivancostas@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	d0a858f8-0f28-42fa-9799-86481ea6ccc2	2017-05-17 16:37:17.546318
57	44	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-044\nnombre: Pablo\napellido: Davide\nnroIdentificacion: '251934401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: pablodavide@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	df385096-efab-42ad-806d-2dc0aa8432aa	2017-05-17 16:37:17.627077
58	45	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-045\nnombre: Nicolas\napellido: Medina\nnroIdentificacion: '33801927'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: nicolasmedina@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	8dcd0376-bc37-42b3-969f-9b94e6d40c46	2017-05-17 16:37:17.711452
59	46	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-046\nnombre: Celeste\napellido: Milano\nnroIdentificacion: '35122307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: celestemilano@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	755c7845-a84b-469d-b4b4-b9e66f9b4632	2017-05-17 16:37:17.798074
60	47	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-047\nnombre: Sebastian\napellido: Schiavone\nnroIdentificacion: '38175649'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: sebastianschiavone@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	747964bd-dada-4d78-aea0-c890ad4fe05b	2017-05-17 16:37:17.890841
185	36	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	24131886-c6fb-4675-abe9-1ddd6e1874ae	2017-05-17 16:37:36.805857
61	48	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-048\nnombre: Ruben\napellido: Almedina\nnroIdentificacion: '22891493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: rubenalmedina@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	c9762d50-fde0-4012-9c53-6b20af6beb4c	2017-05-17 16:37:17.974569
62	49	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-049\nnombre: Cristian\napellido: Camiño\nnroIdentificacion: '36093716'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: cristiancamiño@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	e506f1f7-a1ae-4187-8a5b-f9b82bf1a120	2017-05-17 16:37:18.062172
63	50	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-050\nnombre: Monica\napellido: Conti\nnroIdentificacion: '25888001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: monicaconti@gmail.com\ntipo: Empleado\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	63e7ee14-754a-42fa-8d83-9eee4ce285e9	2017-05-17 16:37:18.14566
64	51	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2bb840eb-0a60-45c7-ac5a-7b97aa6745ac	2017-05-17 16:37:18.284893
117	4	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Cuarta etapa\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	28a73f4e-c4c5-42f4-a0e6-d2bef93da38d	2017-05-17 16:37:22.770269
154	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	70cede21-eafb-481d-aa27-9bdd41a2052f	2017-05-17 16:37:35.198373
65	52	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	223c5aa0-268a-425a-9317-9f60b1c1babc	2017-05-17 16:37:18.414681
66	53	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1fcd70e0-6f0a-4ab5-9179-56efa9085974	2017-05-17 16:37:18.492872
67	54	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cd2bdd4b-4406-4d4f-9ffc-6ebc2c4bec98	2017-05-17 16:37:18.569824
68	55	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c3a46164-af24-4bdd-b7aa-925cc6aeec41	2017-05-17 16:37:18.64776
69	56	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	90152175-f622-4eaf-9fa4-960ea6bdf91c	2017-05-17 16:37:18.722809
70	57	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c5de7942-27c6-44cc-be50-dc224273a729	2017-05-17 16:37:18.804202
71	58	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	453d05d8-3ec4-4578-8d9d-1023c886cc13	2017-05-17 16:37:18.89193
72	59	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4a088f4c-eebe-4b81-bc30-894f8b553058	2017-05-17 16:37:18.971009
73	60	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8d7266a3-a13e-45a6-b700-8c5344c677a4	2017-05-17 16:37:19.058286
74	61	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	684e4d54-c68d-4bbe-8243-c795521d99c5	2017-05-17 16:37:19.137381
75	62	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6d010224-a7dc-4c78-bdaf-886460b7e1ad	2017-05-17 16:37:19.224712
76	63	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8e70e8c7-4e05-4182-bfae-8a7d3b09821f	2017-05-17 16:37:19.30283
77	64	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	328b2782-f0e7-4700-a9b2-ed1e15b3a705	2017-05-17 16:37:19.380555
186	37	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	0ae76aff-4f11-4e4c-80d6-218f31beeacb	2017-05-17 16:37:36.850286
78	65	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d4274f6a-da4d-495d-a571-d1c6b6efd8df	2017-05-17 16:37:19.460659
79	66	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	dc902d22-3285-4ba3-9610-2547ff6a0286	2017-05-17 16:37:19.547199
80	67	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9d604d47-7688-41e7-87ae-2075743937c8	2017-05-17 16:37:19.626961
118	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: \netapa_id: 1\n	1	\N	\N	cdf07810-76c7-4b58-b3de-1f5f117d1ca4	2017-05-17 16:37:22.903924
81	68	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fe1d325e-1d9b-4d39-9a61-dea6011b32cf	2017-05-17 16:37:19.715365
82	69	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	673450bf-363a-4eb7-a749-b5d70d4de60c	2017-05-17 16:37:19.793894
83	70	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	04d62d12-3f6b-4108-a074-84ced5a1f838	2017-05-17 16:37:19.870454
84	71	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-021\nnombre: Lidia\napellido: Delucci\nnroIdentificacion: '28088944'\nfechaNacimiento: 1981-01-29\ncalle: Chile\nnroDomicilio: '6144'\npiso: ''\ndpto: ''\ntelefono: '481898'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3c07db73-6465-4d1e-8a51-a0e1c395b364	2017-05-17 16:37:19.946228
85	72	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-022\nnombre: Leonor\napellido: Gomez Santos\nnroIdentificacion: '40560231'\nfechaNacimiento: 1996-03-13\ncalle: Plaza Mayor\nnroDomicilio: '2637'\npiso: ''\ndpto: ''\ntelefono: '4536662'\nemail: leonorgs@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0eee344e-f55c-4a4f-bc1e-d770758bcd80	2017-05-17 16:37:20.025716
86	73	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-023\nnombre: Lara\napellido: Gonçalves\nnroIdentificacion: '29075344'\nfechaNacimiento: 1980-07-19\ncalle: España\nnroDomicilio: '1415'\npiso: ''\ndpto: ''\ntelefono: '4498457'\nemail: laragoncalves@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f38fee9c-bbc7-48d8-b2f7-cc961f2558ba	2017-05-17 16:37:20.104118
87	74	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-024\nnombre: Martin\napellido: Diaz\nnroIdentificacion: '26070390'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: martindiaz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f92d3966-98bb-4f16-9136-79070ff9ab15	2017-05-17 16:37:20.183193
88	75	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-025\nnombre: Marina\napellido: Diaz\nnroIdentificacion: '26070394'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: marinadiaz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	526d0cd7-9c4e-4f3d-b2c9-17ca4cfb41e8	2017-05-17 16:37:20.269298
89	76	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-026\nnombre: Gerardo\napellido: Urbina\nnroIdentificacion: '29234987'\nfechaNacimiento: 1980-05-31\ncalle: "Álamo"\nnroDomicilio: '6162'\npiso: ''\ndpto: ''\ntelefono: '455433'\nemail: gerardou@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e18882c1-02c1-4c91-a66d-66366535829b	2017-05-17 16:37:20.349368
90	77	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-027\nnombre: Silvio\napellido: Quiroz\nnroIdentificacion: '35465922'\nfechaNacimiento: 1990-02-27\ncalle: "Álamo"\nnroDomicilio: '2128'\npiso: ''\ndpto: ''\ntelefono: '415176'\nemail: silvioquiroz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3d144985-4dd9-49c6-9a56-f7ca7766ccfb	2017-05-17 16:37:20.439152
91	78	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-028\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '33457976'\nfechaNacimiento: 1987-12-19\ncalle: Alem\nnroDomicilio: '123'\npiso: ''\ndpto: ''\ntelefono: '451912'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3bf30e86-8c4e-4f0a-b7b9-099eb7845c90	2017-05-17 16:37:20.526241
92	79	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-029\nnombre: Leonardo\napellido: Rios\nnroIdentificacion: '29524865'\nfechaNacimiento: 1981-11-30\ncalle: Concepcion\nnroDomicilio: '5139'\npiso: ''\ndpto: ''\ntelefono: '4590871'\nemail: lidiadelucci@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6efa582d-85a7-43a5-8f9a-383f913a70f8	2017-05-17 16:37:20.611282
93	80	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-030\nnombre: Ubaldo\napellido: Gomez\nnroIdentificacion: '34123456'\nfechaNacimiento: 1990-04-08\ncalle: Entre Rios\nnroDomicilio: '1235'\npiso: ''\ndpto: ''\ntelefono: '456798'\nemail: ubaldogomez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7a97bcce-c199-4348-beb7-fa4b0e316c2d	2017-05-17 16:37:20.739546
94	81	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-031\nnombre: Silvio\napellido: Gonzalez\nnroIdentificacion: '29092236'\nfechaNacimiento: 1980-05-16\ncalle: Cordoba\nnroDomicilio: '7213'\npiso: ''\ndpto: ''\ntelefono: '4501923'\nemail: silviogonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e974b4b9-ea6c-40c1-a6a5-f9c9c6890f5a	2017-05-17 16:37:20.829142
187	38	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	65bc96b2-1702-4690-b47a-2719d66c3827	2017-05-17 16:37:36.89761
95	82	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-032\nnombre: Rosa\napellido: Fernandez\nnroIdentificacion: '20112254'\nfechaNacimiento: 1968-09-13\ncalle: San Martin\nnroDomicilio: '1028'\npiso: ''\ndpto: ''\ntelefono: '4567895'\nemail: rosafernandez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1c7770b9-91fe-4c9b-b73c-d771e4de15ab	2017-05-17 16:37:20.91748
96	83	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-033\nnombre: Alejandro\napellido: Fernandez\nnroIdentificacion: '20998871'\nfechaNacimiento: 1987-05-16\ncalle: Santa Fe\nnroDomicilio: '4812'\npiso: ''\ndpto: ''\ntelefono: '4311235'\nemail: alefernandez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	84bb0ea7-35ce-4566-967e-182bfc5d1c57	2017-05-17 16:37:21.001194
119	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	5b696080-c580-4ae7-bc44-ed342b43029e	2017-05-17 16:37:22.978321
97	84	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-034\nnombre: Hugo\napellido: Rios\nnroIdentificacion: '40034940'\nfechaNacimiento: 1998-11-30\ncalle: Alvear\nnroDomicilio: '5028'\npiso: ''\ndpto: ''\ntelefono: '481341'\nemail: hugorios@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a176e6cb-f918-4436-aba3-745241a1291c	2017-05-17 16:37:21.085132
98	85	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-035\nnombre: Mario\napellido: Garcia\nnroIdentificacion: '24654447'\nfechaNacimiento: 1976-04-08\ncalle: Roca\nnroDomicilio: '193'\npiso: ''\ndpto: ''\ntelefono: '4212351'\nemail: mariogarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ca484ce1-c567-4567-b17a-7e524501899e	2017-05-17 16:37:21.171157
99	86	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-036\nnombre: Marina\napellido: Moralez\nnroIdentificacion: '36421952'\nfechaNacimiento: 1992-08-19\ncalle: Ucrania\nnroDomicilio: '9371'\npiso: ''\ndpto: ''\ntelefono: '451241'\nemail: marimamoralez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4e84404d-3419-471a-b233-a2a14a5826a4	2017-05-17 16:37:21.250629
100	87	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-037\nnombre: Silvina\napellido: Portillo\nnroIdentificacion: '26498388'\nfechaNacimiento: 1976-06-05\ncalle: Av Queirel\nnroDomicilio: '7621'\npiso: ''\ndpto: ''\ntelefono: '431214'\nemail: silvinaportillo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f8f9b8fb-3095-477b-902a-7d0f4c5fc0a2	2017-05-17 16:37:21.335531
101	88	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-038\nnombre: Maria\napellido: Maciel\nnroIdentificacion: '33428434'\nfechaNacimiento: 1989-09-04\ncalle: Paraguay\nnroDomicilio: '600'\npiso: ''\ndpto: ''\ntelefono: '4761602'\nemail: mariamaciel@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8bfda574-f4b6-43d7-b84d-beee695986ee	2017-05-17 16:37:21.42201
102	89	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-039\nnombre: Angeles\napellido: Granados\nnroIdentificacion: '31452518'\nfechaNacimiento: 1981-04-09\ncalle: Uruguay\nnroDomicilio: '12'\npiso: ''\ndpto: ''\ntelefono: '481858'\nemail: angelesgranados@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9732c9cc-e4c0-4bc7-a5d0-4ef976f4b47c	2017-05-17 16:37:21.506807
103	90	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-040\nnombre: Cintia\napellido: Gutierrez\nnroIdentificacion: '29701192'\nfechaNacimiento: 1992-11-05\ncalle: Av Roca\nnroDomicilio: '464'\npiso: ''\ndpto: ''\ntelefono: '483498'\nemail: cintiagutierrez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b5fca4ff-97b6-4cfe-97c0-cf78bd423fdc	2017-05-17 16:37:21.665036
104	91	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-041\nnombre: David\napellido: Sedillo\nnroIdentificacion: '36371823'\nfechaNacimiento: 1975-07-23\ncalle: Centenario\nnroDomicilio: '6135'\npiso: ''\ndpto: ''\ntelefono: '481018'\nemail: davidsedillo@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f45037ac-dcd5-44e7-8f5f-5e44c4de61a0	2017-05-17 16:37:21.759192
105	92	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-042\nnombre: Sofia\napellido: Garcia\nnroIdentificacion: '25370180'\nfechaNacimiento: 1998-01-13\ncalle: Las Flores\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '409498'\nemail: sofiagarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3837c931-6748-480a-b3a2-78a12e972dba	2017-05-17 16:37:21.83879
106	93	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-043\nnombre: Alicia\napellido: Villalba\nnroIdentificacion: '27455263'\nfechaNacimiento: 1979-04-17\ncalle: Las Palmeras\nnroDomicilio: '9876'\npiso: ''\ndpto: ''\ntelefono: '420184'\nemail: alivillalba@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6c01306b-e63f-41f6-9a3a-224e9b6197f2	2017-05-17 16:37:21.925251
107	94	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-044\nnombre: Luis\napellido: Gonzalez\nnroIdentificacion: '36182911'\nfechaNacimiento: 1992-06-19\ncalle: Las Orquideas\nnroDomicilio: '900'\npiso: ''\ndpto: ''\ntelefono: '495712'\nemail: luisgonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fca8555b-b756-47ea-a0e7-6ed3c73f658b	2017-05-17 16:37:22.008212
108	95	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-045\nnombre: Ernesto\napellido: Da Luz\nnroIdentificacion: '30346514'\nfechaNacimiento: 1983-06-19\ncalle: Rosas\nnroDomicilio: '2463'\npiso: ''\ndpto: ''\ntelefono: '413048'\nemail: ernestodaluz@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d0be0c14-e9a9-43d8-8501-7f00e8201cda	2017-05-17 16:37:22.095021
109	96	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-046\nnombre: Luciano\napellido: Garcia\nnroIdentificacion: '39019733'\nfechaNacimiento: 1996-03-13\ncalle: Colon\nnroDomicilio: '8123'\npiso: ''\ndpto: ''\ntelefono: '412451'\nemail: lucianogarcia@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3f0b0061-a023-402b-9202-4ebe4e7f8eda	2017-05-17 16:37:22.180905
110	97	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-047\nnombre: Gerardo\napellido: Cano\nnroIdentificacion: '29232117'\nfechaNacimiento: 1980-07-19\ncalle: Escuelita\nnroDomicilio: '9173'\npiso: ''\ndpto: ''\ntelefono: '462093'\nemail: gerardocano@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	583a3169-e37a-4e91-8d05-fb5d386871b4	2017-05-17 16:37:22.270639
111	98	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-048\nnombre: Hector\napellido: Rincon\nnroIdentificacion: '29222287'\nfechaNacimiento: 1980-05-31\ncalle: Japon\nnroDomicilio: '2546'\npiso: ''\ndpto: ''\ntelefono: '471927'\nemail: hectorrincon@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1ecaa3a9-5a3d-4ccb-ae57-4cbb24478a4a	2017-05-17 16:37:22.345977
188	39	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	a75c251b-9132-4746-bfb1-3aa27afaa5b2	2017-05-17 16:37:36.950466
112	99	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-049\nnombre: Alberto\napellido: Gonzalez\nnroIdentificacion: '35225922'\nfechaNacimiento: 1990-02-27\ncalle: Colombia\nnroDomicilio: '2871'\npiso: ''\ndpto: ''\ntelefono: '431570'\nemail: albertogonzalez@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d0a5729c-b50c-4fda-9f8b-99c6997db108	2017-05-17 16:37:22.426915
113	100	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-050\nnombre: Roberto\napellido: Lujan\nnroIdentificacion: '35461122'\nfechaNacimiento: 1990-05-27\ncalle: Noruega\nnroDomicilio: '1980'\npiso: ''\ndpto: ''\ntelefono: '401938'\nemail: robertolujan@gmail.com\ntipo: MiembroEquipo\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	19ef5f35-f873-410b-b704-528632795f32	2017-05-17 16:37:22.504926
120	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	52bc8074-1eab-4ba6-8a2c-806dc724dac6	2017-05-17 16:37:23.055988
121	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	b5940169-8eb0-4651-8f23-a6f8dbdc5919	2017-05-17 16:37:23.174358
122	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	4c832c0a-a332-4038-a712-1ae6de20ab55	2017-05-17 16:37:23.239619
123	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	a159071f-d842-443c-bd51-36863a6770fd	2017-05-17 16:37:23.304104
124	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	22b70ba3-515f-437e-a191-b190cdee5c43	2017-05-17 16:37:23.363693
125	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	eb1fa658-c153-4fc4-b5d5-d16facafa3c7	2017-05-17 16:37:23.41924
126	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	9ede74ee-d8c3-4e96-a76f-f66df5d8f7c3	2017-05-17 16:37:23.476292
127	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	6d3d1a8d-a62b-4a52-9587-137ab080766b	2017-05-17 16:37:23.543426
128	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	4d04713c-5e77-4523-abcd-321fd36b9f37	2017-05-17 16:37:23.606571
129	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 2\narea_id: 1\n	1	\N	\N	49e6daa9-ef91-4cb6-b4ee-13009727780d	2017-05-17 16:37:23.817625
130	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	14aaf97a-e56e-4c56-9a4d-45af0568b633	2017-05-17 16:37:23.88761
131	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	cfc8f260-8006-426c-8b68-848d4196daee	2017-05-17 16:37:23.967519
132	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	45636e4d-0e85-45c4-b626-3e16d06113d5	2017-05-17 16:37:24.043303
133	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	552933f7-9711-4f01-b953-a2a8caace60c	2017-05-17 16:37:24.120055
189	40	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a01ca5b7-222a-4ce9-aa4b-536866adbd85	2017-05-17 16:37:36.996603
134	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	565db17e-68ec-4c1a-af75-9c833444fa98	2017-05-17 16:37:24.195298
135	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	f99353f8-546f-4660-b6b4-e800a36508af	2017-05-17 16:37:24.265708
136	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	33a47eff-dceb-43ca-924c-9f52883960cb	2017-05-17 16:37:24.340577
137	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	3aa5744f-3acc-41dc-a758-7010df1398ba	2017-05-17 16:37:24.406376
153	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	c39ae2d2-0811-4207-81c7-31d84007bbaa	2017-05-17 16:37:35.142915
138	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	95b843ae-da9a-4658-99fb-3fca2bbf0ee2	2017-05-17 16:37:24.474485
139	11	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-011\nnombre: Percentil\ndescripcion: Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes\n  en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para\n  hacerlo en escala y poder ganar dinero con ello.\ncalle: España\nnroDomicilio: '422'\npiso: ''\ndpto: ''\ntelefono: '4590432'\nemail: percentil@gmail.com\npagWeb: percentil.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	76cc469f-f746-4af3-b715-f2ba83b65aa8	2017-05-17 16:37:24.541676
140	12	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-012\nnombre: EmbryoTools\ndescripcion: " Son una referencia mundial en reproducción asistida. Trabajan en cuatro\n  ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos,\n  porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante\n  práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan\n  es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción\n  asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de\n  los productos que vayan a entrar en contacto con embriones humanos y por último\n  trabajan en la reproducción asistida en veterinaria."\ncalle: Mariano Moreno\nnroDomicilio: '4122'\npiso: ''\ndpto: ''\ntelefono: '465888'\nemail: embryotools@gmail.com\npagWeb: embryotools.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	722cdbbb-2603-4bb8-bdb5-1b58b8f5a56e	2017-05-17 16:37:24.617968
141	13	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-013\nnombre: Aplázame\ndescripcion: " Es un método de pago que se integra en el proceso de compra del comercio\n  electrónico y permite a los clientes de las tiendas online comprar con un crédito\n  instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su\n  método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando\n  para hacerlo en breve."\ncalle: Av. San Martin\nnroDomicilio: '4532'\npiso: ''\ndpto: ''\ntelefono: '453222'\nemail: aplazame@gmail.com\npagWeb: aplazame.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	62c5efbf-1e92-41ee-a0e8-950489cfd36e	2017-05-17 16:37:24.686848
142	14	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-014\nnombre: BrioAgro Technologies\ndescripcion: Deesarrollo de una tecnología para que el agricultor controle su explotación.\n  El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor,\n  a través de su dispositivo, se conecta a la nube para acceder a la información de\n  su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier\n  cambio en sus variables.\ncalle: 'Colon '\nnroDomicilio: '555'\npiso: ''\ndpto: ''\ntelefono: '4651244'\nemail: bioagro@gmail.com\npagWeb: bioagro.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	803ac6ab-7df2-4316-9a5e-922dcbcfc657	2017-05-17 16:37:24.761531
143	15	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-015\nnombre: Braingaze\ndescripcion: La tecnología desarrollada detecta un pequeño movimiento ocular que permite\n  determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad\n  (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y\n  dislexia.\ncalle: Miami\nnroDomicilio: '708'\npiso: ''\ndpto: ''\ntelefono: '490123'\nemail: baringaze@gmail.com\npagWeb: braingaze.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	f3f4b591-b9dd-48b5-b025-25b60810a158	2017-05-17 16:37:24.828207
144	16	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-016\nnombre: CreatorStats\ndescripcion: Mejoran la métrica de los ‘youtubers’.\ncalle: Inglaterra\nnroDomicilio: '200'\npiso: ''\ndpto: ''\ntelefono: '15432510'\nemail: creatorstats@gmail.com\npagWeb: creatorstats.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	9ca15b01-d817-4176-bc4d-61a8bc2cd422	2017-05-17 16:37:24.898449
145	17	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-017\nnombre: Alzhup\ndescripcion: Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar\n  de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología\n  como vehículo para que la solución sea accesible a todo el mundo. Implementan a\n  nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado\n  ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados\n  científicamente. Y también, herramientas para la memoria, capaces de personalizar\n  dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo\n  mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro\n  almacena los recuerdos y que difiere de los sistemas actuales computarizados.\ncalle: Constitucion\nnroDomicilio: '2222'\npiso: ''\ndpto: ''\ntelefono: '467632'\nemail: alzhup@gmail.com\npagWeb: alzhup.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	c4606993-3e57-4876-acb3-9cb6502d8795	2017-05-17 16:37:24.974163
190	41	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	c38199c9-48f6-4668-b08f-91aa7be424e2	2017-05-17 16:37:37.039837
146	18	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-018\nnombre: Axter Aerospace\ndescripcion: Están desarrollando un sistema de propulsión híbrida para las avionetas,\n  que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso\n  trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración\n  con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto\n  se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU.\n  De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción\n  y ensamblado.\ncalle: Ayacucho\nnroDomicilio: '9200'\npiso: ''\ndpto: ''\ntelefono: '432111'\nemail: axteraerospace@gmail.com\npagWeb: axteraerospace.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	5057e88a-c1e9-464b-a39e-2489e8fcaf09	2017-05-17 16:37:25.052097
147	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	46bf146c-35f6-4e33-9694-6ea8da2b2063	2017-05-17 16:37:34.758332
148	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	51cabc13-a92a-420f-8500-dfd2f9db81e7	2017-05-17 16:37:34.80943
149	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	caee3b3a-a6d7-44b1-bcb6-0d807bef22a8	2017-05-17 16:37:34.874684
150	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c7e5bfac-0694-4229-a1d4-665550731cf4	2017-05-17 16:37:34.99283
151	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	c6ef4b01-ee26-4742-b171-8908420ed81f	2017-05-17 16:37:35.040898
152	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	be14b97d-cc6d-4bdf-b2e3-0ed944d93915	2017-05-17 16:37:35.08773
155	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	a0043f60-60bf-45f6-9298-1ae88e1040dd	2017-05-17 16:37:35.254551
156	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	f6714a70-1d30-45df-8de3-ac564dd7602c	2017-05-17 16:37:35.306431
157	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	8449611c-5cb5-44d7-bb7e-4f4b9ca0e104	2017-05-17 16:37:35.359737
158	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	dbf655a1-1b72-47a8-a644-e95dbb3beacc	2017-05-17 16:37:35.40642
159	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b299e0c4-1c4b-42ab-bf22-7941572536ef	2017-05-17 16:37:35.451726
160	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	4ecc662c-d38a-459d-bfca-8c2cff6b8593	2017-05-17 16:37:35.495526
161	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	67199a56-4d70-4403-b99f-60753826aae4	2017-05-17 16:37:35.540278
162	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	adad4547-1e40-4ad5-98fa-fa10048d46ff	2017-05-17 16:37:35.583599
163	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	5645e535-d304-4b21-a541-8ef58a3c26a2	2017-05-17 16:37:35.631041
164	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	6a8bf802-6558-4cce-a84d-1016027a93ca	2017-05-17 16:37:35.682788
165	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	c5a48197-12fa-4dd5-820d-6c24227f747a	2017-05-17 16:37:35.745428
166	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0c791377-2b1c-40d9-bf36-d3e524436546	2017-05-17 16:37:35.798899
167	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	167abbce-727a-4f09-9f34-d064c5de914a	2017-05-17 16:37:35.851761
168	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	0c804a99-84f4-4f40-a182-23cefccb14a2	2017-05-17 16:37:35.909984
169	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	3f4a3988-6d71-4666-851d-b0c7f9b30302	2017-05-17 16:37:35.963558
170	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	4f245dad-a8ff-48f7-a91c-e5825f1a90e3	2017-05-17 16:37:36.015414
171	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	3b0dbd44-77b8-436d-9bef-946c0dedd1e2	2017-05-17 16:37:36.060755
172	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	97a34afd-03bf-49cd-9f47-626aeb5b8362	2017-05-17 16:37:36.112112
173	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	39d7149c-001b-4527-8725-8ae0cd0badd5	2017-05-17 16:37:36.163145
174	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	caccae8c-759e-45b5-9c5c-fa08a7dd0886	2017-05-17 16:37:36.21743
175	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	5478399c-c94d-4880-8bb0-4f52ed4410f8	2017-05-17 16:37:36.263756
176	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	435eccd8-0a08-486f-b60c-4a6a5869c4c8	2017-05-17 16:37:36.321239
177	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	2efa98f6-68a2-4f55-932b-48d45344b34f	2017-05-17 16:37:36.37811
178	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	1cd143b4-3ae5-418d-b438-ae4e732aa186	2017-05-17 16:37:36.433834
179	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	03ba087a-8fd5-4652-b91c-344630dabb44	2017-05-17 16:37:36.488033
180	31	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	7b48cd09-ec5c-4610-a5d7-d93e72410999	2017-05-17 16:37:36.540853
181	32	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	5084dafe-b098-4d3e-9cec-5e742191f176	2017-05-17 16:37:36.597998
182	33	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	665f2f68-0018-422e-b215-932d2075baad	2017-05-17 16:37:36.669455
183	34	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	7818a2e8-cbe3-433c-9524-e425231d0caa	2017-05-17 16:37:36.715904
191	42	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c36f8b75-aa0f-44ed-aa17-37cc36fa0947	2017-05-17 16:37:37.085022
192	43	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	a0a40c31-5ac8-485c-a6bd-ac2ede76cf92	2017-05-17 16:37:37.130028
193	44	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	800b2314-3b3c-4a21-83b0-47baad8ab493	2017-05-17 16:37:37.191698
194	45	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	98592eac-44f5-422a-b7b9-455626045629	2017-05-17 16:37:37.250044
195	46	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b94d9e11-ca91-43bf-a716-b231dec08227	2017-05-17 16:37:37.300098
196	47	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	dd6e930d-56f0-4e28-85b2-3249880e0717	2017-05-17 16:37:37.377091
197	48	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	3370c4f1-24fd-43b8-91a4-e7611fc7b87d	2017-05-17 16:37:37.43911
198	49	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b046e67e-f7cd-4f22-a5e8-d0c855067c25	2017-05-17 16:37:37.494064
199	50	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	9e3b488c-5f13-41f5-9ae7-64c6df61c7a8	2017-05-17 16:37:37.559044
200	51	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	601db31c-4d7f-4e37-a40d-1e27cc95ff88	2017-05-17 16:37:37.653102
201	52	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	defb8058-d84e-4e2f-ab2a-33d338b685fd	2017-05-17 16:37:37.712725
202	53	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	8a16c17a-d29b-4842-ad00-01e495ba7af0	2017-05-17 16:37:37.765144
203	54	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: 3\n	1	\N	\N	b4046493-9737-492f-ae6f-7e5277720bdc	2017-05-17 16:37:37.818566
204	55	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-02\nproyecto_id: 1\nactividad_id: 4\nestado_id: 3\n	1	\N	\N	6f7061f0-2cf3-4d29-a324-6f792535c681	2017-05-17 16:37:37.878687
205	56	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-08\nproyecto_id: 1\nactividad_id: 5\nestado_id: 3\n	1	\N	\N	09fbfadd-1878-48be-81d8-d51492133c1f	2017-05-17 16:37:37.933528
206	57	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-18\nproyecto_id: 1\nactividad_id: 6\nestado_id: 3\n	1	\N	\N	70f214d7-6856-4b79-a1df-4fedffdcbac0	2017-05-17 16:37:37.984229
207	58	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-04-26\nproyecto_id: 1\nactividad_id: 7\nestado_id: 3\n	1	\N	\N	780f678b-923e-45e4-b4b4-70e1bd951ec3	2017-05-17 16:37:38.028873
208	59	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: 2017-05-27\nproyecto_id: 1\nactividad_id: 8\nestado_id: 2\n	1	\N	\N	eb54d1a7-d585-4f89-8251-9dc6167bbcd8	2017-05-17 16:37:38.076041
209	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	ab1356ef-bd7c-4b7f-9896-d34d584e2e7e	2017-05-17 16:37:41.909031
210	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	3a4c5576-b33e-4646-aa13-5564dccd8d61	2017-05-17 16:37:42.025673
211	1	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Efectivo\n	1	\N	\N	9afd71da-21f2-4ba3-a455-dfc4adaf2bea	2017-05-17 16:37:42.124978
212	2	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta de crédito Visa\n	1	\N	\N	d0a1c451-3302-4418-b10a-bb9f326e5e91	2017-05-17 16:37:42.17938
213	3	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta Naranja\n	1	\N	\N	0d95f7be-7acc-4c83-84d0-06c893c4ed9e	2017-05-17 16:37:42.235938
214	4	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Saldo de cuenta\n	1	\N	\N	5cfeaf91-6825-464d-a7fa-7d2df48351c9	2017-05-17 16:37:42.291435
215	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\ninicio: 2017-01-01\nmonto: 200.0\n	1	\N	\N	0b98373c-9f16-4b46-9c06-374f63e324a5	2017-05-17 16:37:42.602302
216	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\ninicio: 2017-02-01\nmonto: 200.0\n	1	\N	\N	251cc0e9-fccc-445f-8f55-4ca1ec0d0724	2017-05-17 16:37:42.687838
217	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\ninicio: 2017-03-01\nmonto: 200.0\n	1	\N	\N	9f000105-f41c-4ad1-b14b-41a45ff655ba	2017-05-17 16:37:42.762716
218	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\ninicio: 2017-04-01\nmonto: 200.0\n	1	\N	\N	dbb31d28-fd8e-4921-8503-91a877d4c01b	2017-05-17 16:37:42.835096
219	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\ninicio: 2017-05-01\nmonto: 200.0\n	1	\N	\N	549fd0ef-efa4-49b1-bc27-72d7c8048cfd	2017-05-17 16:37:42.899162
220	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\ninicio: 2017-06-01\nmonto: 200.0\n	1	\N	\N	f0e1e1c5-490f-4d08-b02f-fd798ec17558	2017-05-17 16:37:42.964791
221	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\ninicio: 2017-07-01\nmonto: 200.0\n	1	\N	\N	9c5c7599-f591-4910-b7b0-ffd208e50271	2017-05-17 16:37:43.031197
222	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\ninicio: 2017-08-01\nmonto: 200.0\n	1	\N	\N	5cc97542-5f83-44f5-a609-8b0d413a3d5f	2017-05-17 16:37:43.086368
223	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\ninicio: 2017-09-01\nmonto: 200.0\n	1	\N	\N	cd7f143f-9aed-4d4b-8aa4-b5273652ef48	2017-05-17 16:37:43.160187
224	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\ninicio: 2017-10-01\nmonto: 200.0\n	1	\N	\N	d5dc6b66-401e-406b-96eb-0ba34122c14d	2017-05-17 16:37:43.220847
225	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\ninicio: 2017-11-01\nmonto: 200.0\n	1	\N	\N	2d5e5d56-8a9b-4b42-848c-ab5569e60cee	2017-05-17 16:37:43.290099
226	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\ninicio: 2017-12-01\nmonto: 200.0\n	1	\N	\N	6777ef51-1a48-4c5d-9c09-2bf1cf454935	2017-05-17 16:37:43.353682
227	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 51\nproyecto_id: 1\n	1	\N	\N	3da67559-f7dc-48b9-9114-973f0ad6d631	2017-05-17 16:37:44.034602
228	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 52\nproyecto_id: 2\n	1	\N	\N	065b8eba-612d-41d1-8f7b-cbd27ce1a822	2017-05-17 16:37:44.10037
229	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 54\nproyecto_id: 3\n	1	\N	\N	c12894ec-19e4-4781-8a8d-b762a90d2dd6	2017-05-17 16:37:44.164819
230	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 56\nproyecto_id: 4\n	1	\N	\N	0e73a80f-9e13-4759-8e7a-5e184fe30ded	2017-05-17 16:37:44.229593
231	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 58\nproyecto_id: 5\n	1	\N	\N	16cbdea8-4e2e-4cd1-844e-f25d4a20cc56	2017-05-17 16:37:44.295896
232	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 60\nproyecto_id: 6\n	1	\N	\N	8d4c5aa2-c5df-4c66-9474-199080cb9659	2017-05-17 16:37:44.348652
233	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 63\nproyecto_id: 7\n	1	\N	\N	2ba5945f-a6b5-4c5c-9290-df5ceece8979	2017-05-17 16:37:44.428376
234	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 8\n	1	\N	\N	550c54d5-25d3-4890-8127-19b8beae0b61	2017-05-17 16:37:44.497072
235	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 9\n	1	\N	\N	5722e985-54b8-4cae-9594-e2ed27a92142	2017-05-17 16:37:44.562566
236	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 69\nproyecto_id: 10\n	1	\N	\N	43c31aa4-ffef-48fd-88c2-830f9e472943	2017-05-17 16:37:44.616297
237	11	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 0017-12-10\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 71\nproyecto_id: 11\n	1	\N	\N	800e8ae3-29af-4771-99ac-681a7b36a43f	2017-05-17 16:37:44.673243
238	12	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 12\n	1	\N	\N	248a8598-420d-4e26-9009-bca8d06a6e9c	2017-05-17 16:37:44.742763
239	13	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 99\nproyecto_id: 13\n	1	\N	\N	a16e0b9c-c180-4651-99db-c16cb97a250e	2017-05-17 16:37:44.838608
240	14	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 80\nproyecto_id: 14\n	1	\N	\N	f8853b83-d82b-432a-af01-33d26e27c3a5	2017-05-17 16:37:44.93527
241	15	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 89\nproyecto_id: 15\n	1	\N	\N	4216d997-3174-4182-bb68-24b51f5628c3	2017-05-17 16:37:44.992206
242	16	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 16\n	1	\N	\N	267db38e-de57-4b68-ae10-f85939ed0899	2017-05-17 16:37:45.051222
243	17	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 97\nproyecto_id: 17\n	1	\N	\N	a5422c56-8a6e-4b36-a1e2-6f45d36589a7	2017-05-17 16:37:45.116899
244	18	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 75\nproyecto_id: 18\n	1	\N	\N	a3f0fcd2-5bf3-4e2d-8b26-3a3a6d1d0c21	2017-05-17 16:37:45.166627
245	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	efcd9cd0-0fd3-4b70-bb6f-f44295ef5c1d	2017-05-17 16:37:45.36465
246	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	82de75b9-4fae-4753-86ae-a2cac14b9248	2017-05-17 16:37:45.458684
247	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	0479becd-b37f-48e3-9b15-006748733539	2017-05-17 16:37:45.550663
248	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	3fd7ab78-3938-4aac-af34-e73059ad319e	2017-05-17 16:37:45.738478
249	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	8705816c-fdfb-47ca-9fbc-b31c4078a1d1	2017-05-17 16:37:45.856003
250	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	19f52f0b-1d2e-4883-8c96-0b809a50dcff	2017-05-17 16:37:45.939406
251	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	8765ab51-b7cd-41bd-9db3-9650955abbeb	2017-05-17 16:37:46.031214
252	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	2d2efb60-fcbd-402e-b534-744a368bc646	2017-05-17 16:37:46.134337
253	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	ef1c1d2f-f8b8-4741-9020-f9108eeab58d	2017-05-17 16:37:46.232283
254	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	e02ca6c4-7498-4cf0-95cb-d69a144847bb	2017-05-17 16:37:46.317356
255	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	f9706e3d-dbd4-4ae2-a6a4-bd92a1380e52	2017-05-17 16:37:46.411476
256	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	830afc8d-938c-4d6d-820d-e19f29e5b7ad	2017-05-17 16:37:46.555714
257	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	abb897c6-820d-4a21-aea9-e0bced1e8b38	2017-05-17 16:37:46.817324
258	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	7218ea37-5c64-4944-9e43-d9f4db1608fd	2017-05-17 16:37:46.901982
259	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	6eaf6107-e103-4027-952f-bdad97ccf414	2017-05-17 16:37:46.985983
260	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	b6e3f9d2-a9db-4d88-ab72-3b4e6cfde90b	2017-05-17 16:37:47.092295
261	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	8c4e3304-0a33-41a3-99b9-ccaa5daae0c0	2017-05-17 16:37:47.17994
262	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	e2d35470-05f4-4b2f-a5e8-7f3510ebbf50	2017-05-17 16:37:47.259698
263	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	91a3f2e0-1a3d-4e76-bfb2-54db4f54cbfd	2017-05-17 16:37:47.34406
264	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	6044f84b-044e-441f-a34e-81663627ab47	2017-05-17 16:37:47.444791
265	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	262e79c8-de77-40d0-a018-464a8e9d4af2	2017-05-17 16:37:47.55111
266	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	2540ebf4-3dab-4c26-99d7-96315eb75c42	2017-05-17 16:37:47.636773
267	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	d2669a85-49a1-47d6-9304-716cb9ac18a8	2017-05-17 16:37:47.71891
268	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	a6c95ebe-2ea8-4096-88d4-8ad39cc8f54e	2017-05-17 16:37:47.825815
269	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	cc9bbfbc-e313-4822-aded-4aa2744a16fe	2017-05-17 16:37:47.920358
270	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	d4120ddc-b536-4736-bf52-1afb9681c010	2017-05-17 16:37:48.003756
271	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	9533b10c-8531-4227-b90d-4ad1abc86aea	2017-05-17 16:37:48.085163
272	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	bb0ae46f-ce1b-486c-b4d5-37d89d8b3162	2017-05-17 16:37:48.202422
273	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	a1eab9d7-697e-4d3d-9fa5-2e87f88016da	2017-05-17 16:37:48.307875
365	2	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 5\nevento_id: 1\n	1	\N	\N	28630033-f7e9-4b65-b94a-9a547fdb9e21	2017-05-17 16:37:57.672981
274	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	e5af0b4a-bae9-4079-985f-22d824f2d3cc	2017-05-17 16:37:48.396428
275	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	04f23b6e-a3df-4ddf-bedf-eebad92784f9	2017-05-17 16:37:48.488886
276	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	125f2559-7d40-494f-ab4c-5621ba296e6b	2017-05-17 16:37:48.590611
277	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	1e6bac1c-386f-4592-b06c-8a5a5d11cd49	2017-05-17 16:37:48.686804
278	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	b2c07504-16ae-415a-8310-5ceacf2c6b52	2017-05-17 16:37:48.808728
279	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	3231ca9c-03f0-4603-a79b-4f2f09617aef	2017-05-17 16:37:48.898088
280	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	61a887ca-52a5-4369-b753-a1e9f058d50c	2017-05-17 16:37:49.000271
281	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	26a0e2ce-5f7e-41bb-b404-e0ca0f659e67	2017-05-17 16:37:49.098748
282	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	15a57e99-9286-4c56-ade1-47a58e11089f	2017-05-17 16:37:49.184757
283	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	4af1c990-16cc-4a06-ab57-3e1fd1b26831	2017-05-17 16:37:49.27601
284	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	b2f53fbe-208c-4621-9903-721e6a6a7e7a	2017-05-17 16:37:49.382527
285	41	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	bd0bafc9-753b-4e8e-a710-fc5467f02d8b	2017-05-17 16:37:49.496039
286	42	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	3d9f9618-a307-4943-96ed-0dd5f6185666	2017-05-17 16:37:49.579556
287	43	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	79c24038-eee2-4c64-9548-4bfab24a3d44	2017-05-17 16:37:49.663
288	44	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	896e2652-e8e6-4b2c-9c41-762fe09c910e	2017-05-17 16:37:49.76927
289	45	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	03ca4853-1a8d-4045-9d07-3f95364850bf	2017-05-17 16:37:49.875991
290	46	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	f7bde824-19f5-4124-9757-bf503d59fba9	2017-05-17 16:37:49.97056
291	47	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	77d03de8-bc50-4b7f-ba34-583b03b6e22a	2017-05-17 16:37:50.058526
292	48	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	0de3bfa9-e51a-466c-aa61-4f913bfedcb4	2017-05-17 16:37:50.158415
293	49	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	a6180002-d6d2-4fae-90a5-6e63d7482af6	2017-05-17 16:37:50.263613
294	50	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	f79e7326-4584-4159-8c56-6ee86d6f3a6a	2017-05-17 16:37:50.350063
295	51	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	92b32250-4129-4d34-bd09-e1723c4f7aa6	2017-05-17 16:37:50.432202
296	52	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	5a77dcd9-e29d-4e81-ae35-28e62da2a1f8	2017-05-17 16:37:50.537353
297	53	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	de47c61a-0ac4-47f5-a4b6-49ca9e05d178	2017-05-17 16:37:50.654292
298	54	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	89d39540-6a91-4e56-bf31-35a7e9cdb040	2017-05-17 16:37:50.7507
299	55	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	8ce260e6-602d-4cb1-bdb5-58903e3d6fef	2017-05-17 16:37:50.843309
300	56	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	1aa8e495-25a0-46bc-9e75-a0cfec8cb4ad	2017-05-17 16:37:50.944519
301	57	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	355293ed-127b-4c2c-a01e-15eebb150a67	2017-05-17 16:37:51.044879
302	58	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	ac3529da-3251-47ab-bb29-8b034c28fb41	2017-05-17 16:37:51.123879
303	59	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	8ca2af81-24ec-49fc-89dd-e2110ed1274a	2017-05-17 16:37:51.210331
304	60	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	34e293cc-c65a-40f8-b495-fbb238fadaed	2017-05-17 16:37:51.314393
305	61	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	d9524e5e-8a82-4ba1-bc43-07494798856a	2017-05-17 16:37:51.42779
306	62	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	9653c19b-d2b2-4d8e-b8df-171450ab8810	2017-05-17 16:37:51.56186
307	63	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	f36a4308-3bf2-4c38-b096-3efe95f62296	2017-05-17 16:37:51.652084
308	64	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	a8be29f0-4a3d-4b2c-81de-2da60ed7a5bd	2017-05-17 16:37:51.760851
309	65	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	0c6d91fe-6466-47cd-82dd-38b299e48a6c	2017-05-17 16:37:51.865235
310	66	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	f70aa3ff-64d1-48f4-97d0-ced97b806022	2017-05-17 16:37:51.961361
311	67	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	9d4009c3-f938-4e99-bca7-17ed06c88f10	2017-05-17 16:37:52.054461
312	68	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	69c52244-823a-442a-b00f-36c18ee6eb45	2017-05-17 16:37:52.155588
313	69	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	462df0d1-3a78-4c53-89b6-b8cb770adb08	2017-05-17 16:37:52.254398
314	70	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	2ad71baa-7cba-4fee-80d3-b9b05f4dc3a4	2017-05-17 16:37:52.343039
315	71	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	cb979a25-3ab8-44a3-83fd-44ca0dd9e59d	2017-05-17 16:37:52.431806
316	72	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	be446cc8-a09a-450a-b9b6-0eedb794df59	2017-05-17 16:37:52.536792
317	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	4b37f4f9-8a1d-449c-91bd-70f3759b4d81	2017-05-17 16:37:52.669448
318	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	d6593291-aa7c-403f-bdcb-a7129264c1c4	2017-05-17 16:37:52.734617
319	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	a7b8119e-e474-4679-8af2-3c44912b197d	2017-05-17 16:37:52.79239
320	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	2c44faf9-0957-4479-a5db-b23fee769b09	2017-05-17 16:37:52.847147
321	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	217f7d9a-aadc-4658-b62a-2e9092ce26b3	2017-05-17 16:37:52.903006
322	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	db0185dd-5008-4a11-8e26-54026279f75c	2017-05-17 16:37:52.963596
323	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	48ba1a4b-ae21-4709-8c71-f095f6aac5a5	2017-05-17 16:37:53.014773
324	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	fa11d053-d307-4ede-8cda-dc6927a4e8eb	2017-05-17 16:37:53.067483
325	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	d3534c34-42a5-4e4d-9132-09882ecb8525	2017-05-17 16:37:53.11314
326	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	93dcc5ca-bdc9-4e8d-906a-2c5afbbdeaf4	2017-05-17 16:37:53.155795
327	11	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 11\n	1	\N	\N	0af45aed-b38f-4cf1-ab19-d09fdb88985d	2017-05-17 16:37:53.20206
328	12	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 12\n	1	\N	\N	364469b9-5a3e-40e6-931d-946186d6f29b	2017-05-17 16:37:53.258512
329	13	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 13\n	1	\N	\N	1c1191c5-25a4-4b99-b3a5-703d1bfe6105	2017-05-17 16:37:53.31315
330	14	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 14\n	1	\N	\N	5770a61c-408e-46f2-b3f8-60840c720be7	2017-05-17 16:37:53.368113
331	15	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 15\n	1	\N	\N	04d2d8bd-77f4-44d5-8666-bcca804d8310	2017-05-17 16:37:53.412315
332	16	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 16\n	1	\N	\N	d4428b0b-c804-46c6-9320-75b3b5564ea3	2017-05-17 16:37:53.458502
333	17	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 17\n	1	\N	\N	31e1e7a6-ba90-4fb7-ac6a-703893e5854d	2017-05-17 16:37:53.512053
334	18	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 18\n	1	\N	\N	1c449354-3f24-4c66-9daa-5346dc2abbc8	2017-05-17 16:37:53.568936
335	1	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Marketing\ndescripcion: Análisis del comportamiento de los mercados y de los consumidores\n	1	\N	\N	21b03a85-6d3a-4feb-b732-b4c7d9888d6e	2017-05-17 16:37:53.681342
336	2	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	8a6963bf-91b9-4630-b8d4-1c6458cca093	2017-05-17 16:37:53.752415
337	3	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	c1f5954b-7abb-4832-b091-78dadf8aef4b	2017-05-17 16:37:53.801331
338	4	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	cb99a58d-0bf2-493a-9c6c-665e3704821e	2017-05-17 16:37:53.859478
339	5	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Multimedios\ndescripcion: Televisión, Radio, Periódicos, Internet\n	1	\N	\N	1213d064-cc8e-4e86-a662-bcab960a14f0	2017-05-17 16:37:53.928599
340	6	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Community Manager\ndescripcion: Es el profesional responsable de construir, gestionar y administrar la\n  comunidad online alrededor de una marca en Internet, creando y manteniendo relaciones\n  estables y duraderas con sus clientes, sus fans y, en general, cualquier usuario\n  interesado en la marca.\n	1	\N	\N	8e85dade-042f-4c1c-a448-ce35cf57d9da	2017-05-17 16:37:53.979582
341	7	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: El crowdfunding o micromecenazgo, en castellano, es una red de financiación\n  colectiva, normalmente online, que a través de donaciones económicas o de otro tipo,\n  consiguen financiar un determinado proyecto a cambio de recompensas, participaciones\n  de forma altruista.\n	1	\N	\N	cc8e4648-51c2-41d4-88cc-010bb19bb5d3	2017-05-17 16:37:54.024468
342	8	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador Java\ndescripcion: "-"\n	1	\N	\N	ca06272f-2de3-495e-a971-13b1dbdc316c	2017-05-17 16:37:54.078848
343	9	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador PHP\ndescripcion: "-"\n	1	\N	\N	05779f52-12df-4600-8d06-0e59b8e6a093	2017-05-17 16:37:54.124419
344	10	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Programador web\ndescripcion: Programador en los lenguajes HTML, CSS, Javascript.\n	1	\N	\N	c6815245-51ea-4f00-968f-c13ab49d26fb	2017-05-17 16:37:54.181855
345	11	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Impresiones de anuncios gigantes\ndescripcion: Carteles Publicitarios, vallas, gigantografías\n	1	\N	\N	501aa2a1-f3ad-458c-8872-a75a52818021	2017-05-17 16:37:54.235657
346	12	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Consultoría\ndescripcion: "-"\n	1	\N	\N	fb5d0d01-facc-4790-b7e6-c6aa40d9a9a6	2017-05-17 16:37:54.293039
347	101	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-001\nnombre: María Rosa\napellido: Conti\nnroIdentificacion: '25644132'\nfechaNacimiento: 1975-07-03\ncalle: Ituzaingo\nnroDomicilio: '245'\npiso: '12'\ndpto: B\ntelefono: '424568'\nemail: mrconti@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c472a47e-206c-4eb9-abc9-53b3f95ba8d5	2017-05-17 16:37:54.465429
348	102	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-002\nnombre: Berta\napellido: Rivera\nnroIdentificacion: '33958772'\nfechaNacimiento: 1989-04-11\ncalle: Leandro Gómez\nnroDomicilio: '5886'\npiso: \ndpto: \ntelefono: '4598765'\nemail: brivera@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	40eca2fd-eb10-45ba-bbd9-04f04b8126ec	2017-05-17 16:37:54.565839
349	103	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-003\nnombre: Juliana\napellido: Castiglione\nnroIdentificacion: '30444512'\nfechaNacimiento: 1980-12-09\ncalle: Brisas\nnroDomicilio: '3280'\npiso: '3'\ndpto: '20'\ntelefono: '555321'\nemail: jcastiglione@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	972b2b57-0029-4821-ae93-88082487955b	2017-05-17 16:37:54.653893
350	104	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-004\nnombre: Nahuel\napellido: Estevez\nnroIdentificacion: '19423568'\nfechaNacimiento: 1966-11-28\ncalle: Av. Alta Gracia\nnroDomicilio: '5332'\npiso: \ndpto: \ntelefono: '154632108'\nemail: nestevez@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 2\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	56785705-291f-4f6d-bfca-487f7743f203	2017-05-17 16:37:54.740699
351	105	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-005\nnombre: Pablo\napellido: Gomez\nnroIdentificacion: '25221305'\nfechaNacimiento: 1970-03-05\ncalle: Neruda\nnroDomicilio: '7393'\npiso: '8'\ndpto: A\ntelefono: '154245689'\nemail: pablogomez@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	587ac9ee-91de-47f1-b3d2-fa120ea42f5c	2017-05-17 16:37:54.831411
352	106	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-006\nnombre: Abigail\napellido: Coronado\nnroIdentificacion: '37926793'\nfechaNacimiento: 1994-03-21\ncalle: Florencio Varela\nnroDomicilio: '5659'\npiso: \ndpto: \ntelefono: '432666'\nemail: abigailcoronado@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7ea1ad9b-cddd-408c-a6a5-59ab900f6679	2017-05-17 16:37:54.9164
353	107	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-007\nnombre: Hilda\napellido: Zielinski\nnroIdentificacion: '25334991'\nfechaNacimiento: 1970-04-07\ncalle: Joaquin Suarez\nnroDomicilio: '6863'\npiso: '6'\ndpto: '15'\ntelefono: '4478909'\nemail: hildazielinski@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0a7268e1-f452-4c9f-b91a-57ff7d475df9	2017-05-17 16:37:55.008531
354	108	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-008\nnombre: Antonio\napellido: Goncalves Melo\nnroIdentificacion: '34008128'\nfechaNacimiento: 1989-05-29\ncalle: Maldonado\nnroDomicilio: '2757'\npiso: \ndpto: \ntelefono: '4498049'\nemail: antoniogm@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	d36a7acb-3a3e-4df0-9e24-06841d8887c6	2017-05-17 16:37:55.09896
355	109	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-009\nnombre: Isabela\napellido: Correa\nnroIdentificacion: '41889321'\nfechaNacimiento: 1997-11-04\ncalle: Marejada\nnroDomicilio: '5656'\npiso: \ndpto: \ntelefono: '4482122'\nemail: isacorrea@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5ba24124-b8fd-4063-be78-b2bc065bcf3b	2017-05-17 16:37:55.187271
356	110	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-010\nnombre: Franco\napellido: Maur\nnroIdentificacion: '41336729'\nfechaNacimiento: 1997-03-04\ncalle: Corrientes\nnroDomicilio: '314'\npiso: \ndpto: \ntelefono: '4498049'\nemail: francomaur@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cb9977d2-6807-4c32-9a39-edf78e6441f0	2017-05-17 16:37:55.278018
357	111	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-011\nnombre: Felix\napellido: Baer\nnroIdentificacion: '30228128'\nfechaNacimiento: 1980-08-16\ncalle: Maldonado\nnroDomicilio: '9000'\npiso: \ndpto: \ntelefono: '4601406'\nemail: felixbaer@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4df83c94-a35d-4dc5-bfc2-7004d33c7d14	2017-05-17 16:37:55.364798
358	112	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-012\nnombre: Eileen\napellido: Macías Vargas\nnroIdentificacion: '39756412'\nfechaNacimiento: 1996-01-19\ncalle: Yapeyú\nnroDomicilio: '3778'\npiso: \ndpto: \ntelefono: '497986'\nemail: mercedesgarcia@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	74ff2ef6-f45d-4b07-b679-10991496c0c2	2017-05-17 16:37:55.457962
359	113	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-013\nnombre: Mercedes\napellido: García\nnroIdentificacion: '34561928'\nfechaNacimiento: 1989-05-29\ncalle: Maldonado\nnroDomicilio: '2757'\npiso: \ndpto: \ntelefono: '5557120'\nemail: antoniogm@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	97b4fa2b-53f2-4028-957d-32eaf977bf6a	2017-05-17 16:37:55.541091
360	114	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-014\nnombre: Clea\napellido: Espino\nnroIdentificacion: '24666124'\nfechaNacimiento: 1975-08-04\ncalle: Tomás Guido\nnroDomicilio: '8740'\npiso: \ndpto: \ntelefono: '4981777'\nemail: cleaespino@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e4dcde68-67fe-4aec-9cf7-f64d2532ee5c	2017-05-17 16:37:55.630434
361	115	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-015\nnombre: Paul\napellido: Flores Acosta\nnroIdentificacion: '31672155'\nfechaNacimiento: 1985-06-21\ncalle: Resistencia\nnroDomicilio: '1813'\npiso: \ndpto: \ntelefono: '4231456'\nemail: paulfloresacosta@gmail.com\ntipo: Contacto\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1ec5d9d1-b1aa-467e-a693-a1c339a6850a	2017-05-17 16:37:55.721061
362	1	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-001\nnombre: 'Reunion con Programadores '\ndescripcion: Evento que tiene como objetivo poner en contacto programadores con miembros\n  de equipos de los distintos proyectos para que celebren contratos de sistemas de\n  gestión del negocio de dichos proyectos.\ndia: 2017-05-15\nhora: 2000-01-01 08:00:00.000000000 -03:00\n	1	\N	\N	e9d4853b-7062-4ce0-8af5-68d51b049aaf	2017-05-17 16:37:56.934489
363	2	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-002\nnombre: Conferencia de Marketing\ndescripcion: 'Presentación de distintos expertos en el área de marketing que tiene\n  como objetivo que los miembros de equipos de proyectos adquieran conocimientos básicos\n  sobre como promocionar de manera apropiada su producto o servicio. '\ndia: 2017-05-16\nhora: 2000-01-01 08:00:00.000000000 -03:00\n	1	\N	\N	fb99cfe0-ab16-4180-8c2d-cde17c746e81	2017-05-17 16:37:57.00456
364	1	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 4\nevento_id: 1\n	1	\N	\N	0b39c2bb-a682-4e45-bc1b-aad811e4c5b3	2017-05-17 16:37:57.61619
368	5	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 9\nevento_id: 1\n	1	\N	\N	e80bbc71-a4f4-4004-994e-79831ac2f052	2017-05-17 16:37:57.827993
369	6	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 14\nevento_id: 1\n	1	\N	\N	9c485f59-67b4-4d77-96fd-3963057e631b	2017-05-17 16:37:57.883028
370	7	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 16\nevento_id: 1\n	1	\N	\N	8b39e46a-ec70-4d77-b6ee-78f001b53364	2017-05-17 16:37:57.937937
371	8	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 1\nevento_id: 2\n	1	\N	\N	d8fee228-7adb-443b-a573-088e19487200	2017-05-17 16:37:57.995082
372	9	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 2\nevento_id: 2\n	1	\N	\N	60468a3a-3486-4fff-be9c-f411e4f99855	2017-05-17 16:37:58.049216
373	10	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 3\nevento_id: 2\n	1	\N	\N	32c70023-fed8-4729-b676-5055a7ce4245	2017-05-17 16:37:58.10776
374	11	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 4\nevento_id: 2\n	1	\N	\N	694e70f6-106e-4f39-a0df-4367a7207866	2017-05-17 16:37:58.158809
375	12	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 5\nevento_id: 2\n	1	\N	\N	502dba09-37dd-4ef7-8ac9-c6d018c7b70d	2017-05-17 16:37:58.216595
376	13	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 6\nevento_id: 2\n	1	\N	\N	628a1cac-9966-4abf-bbe5-097338f8fb83	2017-05-17 16:37:58.278259
377	14	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 7\nevento_id: 2\n	1	\N	\N	38841e6b-8eb0-434e-a181-7db09f3a7c87	2017-05-17 16:37:58.33738
378	15	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 8\nevento_id: 2\n	1	\N	\N	b874b953-4409-4ee6-8a61-a49279c6d674	2017-05-17 16:37:58.394143
379	16	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 9\nevento_id: 2\n	1	\N	\N	c8ec1c50-ee57-4337-800f-7afbbfbc0bdb	2017-05-17 16:37:58.45018
380	17	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 10\nevento_id: 2\n	1	\N	\N	b49fe1c1-c251-456b-b0eb-3b5f5201d94b	2017-05-17 16:37:58.512522
381	18	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 11\nevento_id: 2\n	1	\N	\N	a4d82192-d728-421c-b370-80c49fe037b1	2017-05-17 16:37:58.571851
382	19	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 12\nevento_id: 2\n	1	\N	\N	6ab72185-9c30-4461-bc65-d3de77ac7a6a	2017-05-17 16:37:58.634801
383	20	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 13\nevento_id: 2\n	1	\N	\N	ad33c1f8-ea1b-4255-aae2-800fee12dd9e	2017-05-17 16:37:58.724942
384	21	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 14\nevento_id: 2\n	1	\N	\N	7737253b-6d1e-471e-9298-b834c53ee451	2017-05-17 16:37:58.77683
385	22	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 15\nevento_id: 2\n	1	\N	\N	604c5da4-a2b7-4581-b63d-432439ec0144	2017-05-17 16:37:58.829148
386	23	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 16\nevento_id: 2\n	1	\N	\N	6f0bd9e9-d2bc-4d5b-89f2-090239da75a2	2017-05-17 16:37:58.886342
387	24	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 17\nevento_id: 2\n	1	\N	\N	764b8cc2-70db-4d6d-9c3a-92040d9121f5	2017-05-17 16:37:58.975451
388	25	EventoProyecto	\N	\N	1	\N	\N	create	---\nproyecto_id: 18\nevento_id: 2\n	1	\N	\N	a8eee2fa-7c1c-405d-94f9-52cfe337e1fa	2017-05-17 16:37:59.043364
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 439, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-05-17 16:37:12.663338	2017-05-17 16:37:12.663338	1	1
2	Apostoles	2017-05-17 16:37:12.704354	2017-05-17 16:37:12.704354	1	1
3	Bella Vista	2017-05-17 16:37:12.73733	2017-05-17 16:37:12.73733	2	1
4	Encarnación	2017-05-17 16:37:12.770669	2017-05-17 16:37:12.770669	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, inicio, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	2017-01-01	200	2017-05-17 16:37:42.569565	2017-05-17 16:37:42.569565
2	CP-002	Cuota de Febrero	Febrero 2017	2017-02-01	200	2017-05-17 16:37:42.660907	2017-05-17 16:37:42.660907
3	CP-003	Cuota de Marzo	Marzo 2017	2017-03-01	200	2017-05-17 16:37:42.739695	2017-05-17 16:37:42.739695
4	CP-004	Cuota de Abril	Abril 2017	2017-04-01	200	2017-05-17 16:37:42.812069	2017-05-17 16:37:42.812069
5	CP-005	Cuota de Mayo	Mayo 2017	2017-05-01	200	2017-05-17 16:37:42.879065	2017-05-17 16:37:42.879065
6	CP-006	Cuota de Junio	Junio 2017	2017-06-01	200	2017-05-17 16:37:42.944603	2017-05-17 16:37:42.944603
7	CP-007	Cuota de Julio	Julio 2017	2017-07-01	200	2017-05-17 16:37:43.01081	2017-05-17 16:37:43.01081
8	CP-008	Cuota de Agosto	Agosto 2017	2017-08-01	200	2017-05-17 16:37:43.066737	2017-05-17 16:37:43.066737
9	CP-009	Cuota de Septiembre	Septiembre 2017	2017-09-01	200	2017-05-17 16:37:43.135405	2017-05-17 16:37:43.135405
10	CP-010	Cuota de Octubre	Octubre 2017	2017-10-01	200	2017-05-17 16:37:43.200274	2017-05-17 16:37:43.200274
11	CP-011	Cuota de Noviembre	Noviembre 2017	2017-11-01	200	2017-05-17 16:37:43.268298	2017-05-17 16:37:43.268298
12	CP-012	Cuota de Diciembre	Diciembre 2017	2017-12-01	200	2017-05-17 16:37:43.332983	2017-05-17 16:37:43.332983
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
1	\N	Peak Startup	Desarrollando ideas juntos	30-54570225-4	Responsable Inscripto	Av. Corrientes	4287			4401604	peakstartup@gmail.com	peakstartup.com	2017-05-17 16:52:32.691492	2017-05-17 16:52:32.691492	1	1	1	1	Peak-Startup-Logo.png
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
1	2017-01-01	2017-04-30	2017-05-17 16:37:44.001156	2017-05-17 16:37:44.001156	\N	51	1
2	2017-01-01	2017-04-30	2017-05-17 16:37:44.068342	2017-05-17 16:37:44.068342	\N	52	2
3	2017-01-01	2017-04-30	2017-05-17 16:37:44.135601	2017-05-17 16:37:44.135601	\N	54	3
4	2017-01-01	2017-04-30	2017-05-17 16:37:44.204895	2017-05-17 16:37:44.204895	\N	56	4
5	2017-01-01	2017-04-30	2017-05-17 16:37:44.269397	2017-05-17 16:37:44.269397	\N	58	5
6	2017-01-01	2017-04-30	2017-05-17 16:37:44.323473	2017-05-17 16:37:44.323473	\N	60	6
7	2017-01-01	2017-04-30	2017-05-17 16:37:44.383408	2017-05-17 16:37:44.383408	\N	63	7
8	2017-01-01	2017-04-30	2017-05-17 16:37:44.467887	2017-05-17 16:37:44.467887	\N	65	8
9	2017-01-01	2017-04-30	2017-05-17 16:37:44.536347	2017-05-17 16:37:44.536347	\N	67	9
10	2017-01-01	2017-04-30	2017-05-17 16:37:44.591317	2017-05-17 16:37:44.591317	\N	69	10
11	0017-12-10	2017-04-30	2017-05-17 16:37:44.647086	2017-05-17 16:37:44.647086	\N	71	11
12	2017-01-01	2017-04-30	2017-05-17 16:37:44.71636	2017-05-17 16:37:44.71636	\N	65	12
13	2017-01-01	2017-04-30	2017-05-17 16:37:44.779549	2017-05-17 16:37:44.779549	\N	99	13
14	2017-01-01	2017-04-30	2017-05-17 16:37:44.902422	2017-05-17 16:37:44.902422	\N	80	14
15	2017-01-01	2017-04-30	2017-05-17 16:37:44.969884	2017-05-17 16:37:44.969884	\N	89	15
16	2017-01-01	2017-04-30	2017-05-17 16:37:45.026526	2017-05-17 16:37:45.026526	\N	67	16
17	2017-01-01	2017-04-30	2017-05-17 16:37:45.092485	2017-05-17 16:37:45.092485	\N	97	17
18	2017-01-01	2017-04-30	2017-05-17 16:37:45.146898	2017-05-17 16:37:45.146898	\N	75	18
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 18, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
5	0	2017-05-17 16:37:52.885744	2017-05-17 16:37:52.885744	5
6	0	2017-05-17 16:37:52.942304	2017-05-17 16:37:52.942304	6
7	0	2017-05-17 16:37:52.997611	2017-05-17 16:37:52.997611	7
8	0	2017-05-17 16:37:53.051187	2017-05-17 16:37:53.051187	8
9	0	2017-05-17 16:37:53.097972	2017-05-17 16:37:53.097972	9
10	0	2017-05-17 16:37:53.139823	2017-05-17 16:37:53.139823	10
11	0	2017-05-17 16:37:53.186012	2017-05-17 16:37:53.186012	11
12	0	2017-05-17 16:37:53.242519	2017-05-17 16:37:53.242519	12
13	0	2017-05-17 16:37:53.295989	2017-05-17 16:37:53.295989	13
14	0	2017-05-17 16:37:53.352043	2017-05-17 16:37:53.352043	14
15	0	2017-05-17 16:37:53.396047	2017-05-17 16:37:53.396047	15
16	0	2017-05-17 16:37:53.441156	2017-05-17 16:37:53.441156	16
17	0	2017-05-17 16:37:53.49614	2017-05-17 16:37:53.49614	17
18	0	2017-05-17 16:37:53.552776	2017-05-17 16:37:53.552776	18
1	0	2017-05-17 16:37:52.643677	2017-05-17 16:42:54.472813	1
2	68	2017-05-17 16:37:52.718081	2017-05-17 16:45:54.595869	2
3	12	2017-05-17 16:37:52.775553	2017-05-17 16:47:01.313552	3
4	224	2017-05-17 16:37:52.829108	2017-05-17 19:18:03.646908	4
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 18, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
10	288	f	2017-05-17 16:37:46.293423	2017-05-17 16:37:46.293423	2	3	3	\N	\N
11	288	f	2017-05-17 16:37:46.389638	2017-05-17 16:37:46.389638	3	3	3	\N	\N
12	288	f	2017-05-17 16:37:46.526537	2017-05-17 16:37:46.526537	4	3	3	\N	\N
15	288	f	2017-05-17 16:37:46.965758	2017-05-17 16:37:46.965758	3	4	4	\N	\N
16	288	f	2017-05-17 16:37:47.07138	2017-05-17 16:37:47.07138	4	4	4	\N	\N
17	288	f	2017-05-17 16:37:47.160404	2017-05-17 16:37:47.160404	1	5	5	\N	\N
18	288	f	2017-05-17 16:37:47.238837	2017-05-17 16:37:47.238837	2	5	5	\N	\N
19	288	f	2017-05-17 16:37:47.321112	2017-05-17 16:37:47.321112	3	5	5	\N	\N
20	288	f	2017-05-17 16:37:47.423748	2017-05-17 16:37:47.423748	4	5	5	\N	\N
21	288	f	2017-05-17 16:37:47.531365	2017-05-17 16:37:47.531365	1	6	6	\N	\N
22	288	f	2017-05-17 16:37:47.615912	2017-05-17 16:37:47.615912	2	6	6	\N	\N
23	288	f	2017-05-17 16:37:47.698722	2017-05-17 16:37:47.698722	3	6	6	\N	\N
24	288	f	2017-05-17 16:37:47.804051	2017-05-17 16:37:47.804051	4	6	6	\N	\N
25	288	f	2017-05-17 16:37:47.898988	2017-05-17 16:37:47.898988	1	7	7	\N	\N
26	288	f	2017-05-17 16:37:47.98422	2017-05-17 16:37:47.98422	2	7	7	\N	\N
27	288	f	2017-05-17 16:37:48.063509	2017-05-17 16:37:48.063509	3	7	7	\N	\N
28	288	f	2017-05-17 16:37:48.173649	2017-05-17 16:37:48.173649	4	7	7	\N	\N
29	288	f	2017-05-17 16:37:48.284722	2017-05-17 16:37:48.284722	1	8	8	\N	\N
30	288	f	2017-05-17 16:37:48.374095	2017-05-17 16:37:48.374095	2	8	8	\N	\N
31	288	f	2017-05-17 16:37:48.467435	2017-05-17 16:37:48.467435	3	8	8	\N	\N
32	288	f	2017-05-17 16:37:48.568015	2017-05-17 16:37:48.568015	4	8	8	\N	\N
33	288	f	2017-05-17 16:37:48.665554	2017-05-17 16:37:48.665554	1	9	9	\N	\N
34	288	f	2017-05-17 16:37:48.787613	2017-05-17 16:37:48.787613	2	9	9	\N	\N
35	288	f	2017-05-17 16:37:48.8765	2017-05-17 16:37:48.8765	3	9	9	\N	\N
36	288	f	2017-05-17 16:37:48.978772	2017-05-17 16:37:48.978772	4	9	9	\N	\N
37	288	f	2017-05-17 16:37:49.076253	2017-05-17 16:37:49.076253	1	10	10	\N	\N
38	288	f	2017-05-17 16:37:49.163994	2017-05-17 16:37:49.163994	2	10	10	\N	\N
39	288	f	2017-05-17 16:37:49.255714	2017-05-17 16:37:49.255714	3	10	10	\N	\N
40	288	f	2017-05-17 16:37:49.36041	2017-05-17 16:37:49.36041	4	10	10	\N	\N
41	288	f	2017-05-17 16:37:49.475049	2017-05-17 16:37:49.475049	1	11	11	\N	\N
42	288	f	2017-05-17 16:37:49.559696	2017-05-17 16:37:49.559696	2	11	11	\N	\N
43	288	f	2017-05-17 16:37:49.643229	2017-05-17 16:37:49.643229	3	11	11	\N	\N
44	288	f	2017-05-17 16:37:49.749051	2017-05-17 16:37:49.749051	4	11	11	\N	\N
45	288	f	2017-05-17 16:37:49.855775	2017-05-17 16:37:49.855775	1	12	12	\N	\N
46	288	f	2017-05-17 16:37:49.950851	2017-05-17 16:37:49.950851	2	12	12	\N	\N
47	288	f	2017-05-17 16:37:50.036428	2017-05-17 16:37:50.036428	3	12	12	\N	\N
48	288	f	2017-05-17 16:37:50.13475	2017-05-17 16:37:50.13475	4	12	12	\N	\N
49	288	f	2017-05-17 16:37:50.24032	2017-05-17 16:37:50.24032	1	13	13	\N	\N
50	288	f	2017-05-17 16:37:50.330313	2017-05-17 16:37:50.330313	2	13	13	\N	\N
51	288	f	2017-05-17 16:37:50.410832	2017-05-17 16:37:50.410832	3	13	13	\N	\N
52	288	f	2017-05-17 16:37:50.517171	2017-05-17 16:37:50.517171	4	13	13	\N	\N
53	288	f	2017-05-17 16:37:50.632828	2017-05-17 16:37:50.632828	1	14	14	\N	\N
54	288	f	2017-05-17 16:37:50.727723	2017-05-17 16:37:50.727723	2	14	14	\N	\N
55	288	f	2017-05-17 16:37:50.821573	2017-05-17 16:37:50.821573	3	14	14	\N	\N
56	288	f	2017-05-17 16:37:50.923026	2017-05-17 16:37:50.923026	4	14	14	\N	\N
57	288	f	2017-05-17 16:37:51.025301	2017-05-17 16:37:51.025301	1	15	15	\N	\N
58	288	f	2017-05-17 16:37:51.103957	2017-05-17 16:37:51.103957	2	15	15	\N	\N
59	288	f	2017-05-17 16:37:51.190148	2017-05-17 16:37:51.190148	3	15	15	\N	\N
60	288	f	2017-05-17 16:37:51.294631	2017-05-17 16:37:51.294631	4	15	15	\N	\N
61	288	f	2017-05-17 16:37:51.40681	2017-05-17 16:37:51.40681	1	16	16	\N	\N
62	288	f	2017-05-17 16:37:51.494529	2017-05-17 16:37:51.494529	2	16	16	\N	\N
63	288	f	2017-05-17 16:37:51.631917	2017-05-17 16:37:51.631917	3	16	16	\N	\N
64	288	f	2017-05-17 16:37:51.734948	2017-05-17 16:37:51.734948	4	16	16	\N	\N
65	288	f	2017-05-17 16:37:51.843079	2017-05-17 16:37:51.843079	1	17	17	\N	\N
66	288	f	2017-05-17 16:37:51.939016	2017-05-17 16:37:51.939016	2	17	17	\N	\N
67	288	f	2017-05-17 16:37:52.032814	2017-05-17 16:37:52.032814	3	17	17	\N	\N
68	288	f	2017-05-17 16:37:52.136308	2017-05-17 16:37:52.136308	4	17	17	\N	\N
69	288	f	2017-05-17 16:37:52.232873	2017-05-17 16:37:52.232873	1	18	18	\N	\N
70	288	f	2017-05-17 16:37:52.319212	2017-05-17 16:37:52.319212	2	18	18	\N	\N
71	288	f	2017-05-17 16:37:52.411127	2017-05-17 16:37:52.411127	3	18	18	\N	\N
72	288	f	2017-05-17 16:37:52.51463	2017-05-17 16:37:52.51463	4	18	18	\N	\N
1	288	t	2017-05-17 16:37:45.330821	2017-05-17 16:39:51.766785	1	1	1	1	\N
2	288	t	2017-05-17 16:37:45.436546	2017-05-17 16:41:02.117731	2	1	1	2	\N
3	288	t	2017-05-17 16:37:45.525136	2017-05-17 16:41:46.628985	3	1	1	3	\N
4	288	t	2017-05-17 16:37:45.71348	2017-05-17 16:42:54.425824	4	1	1	4	\N
5	288	t	2017-05-17 16:37:45.82323	2017-05-17 16:44:22.343877	1	2	2	5	\N
6	288	t	2017-05-17 16:37:45.916775	2017-05-17 16:44:22.391363	2	2	2	5	\N
7	288	t	2017-05-17 16:37:46.010638	2017-05-17 16:45:54.513701	3	2	2	6	\N
8	288	t	2017-05-17 16:37:46.113915	2017-05-17 16:45:54.555162	4	2	2	6	\N
9	288	t	2017-05-17 16:37:46.209437	2017-05-17 16:47:01.272493	1	3	3	7	\N
13	288	t	2017-05-17 16:37:46.795281	2017-05-17 16:47:43.681379	1	4	4	8	\N
14	288	t	2017-05-17 16:37:46.882588	2017-05-17 19:18:03.607134	2	4	4	9	\N
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
1	Finanzas	2017-05-17 16:37:12.998844	2017-05-17 16:37:12.998844
2	Recursos Humanos	2017-05-17 16:37:13.164549	2017-05-17 16:37:13.164549
3	Evaluación	2017-05-17 16:37:13.21734	2017-05-17 16:37:13.21734
4	Logística	2017-05-17 16:37:13.273927	2017-05-17 16:37:13.273927
5	Dirección	2017-05-17 16:37:13.318297	2017-05-17 16:37:13.318297
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-05-17 16:37:41.883823	2017-05-17 16:37:41.883823
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
1	Marketing	Análisis del comportamiento de los mercados y de los consumidores	2017-05-17 16:37:53.660143	2017-05-17 16:37:53.660143
2	Diseño Gráfico	-	2017-05-17 16:37:53.732635	2017-05-17 16:37:53.732635
3	Diseño Web	-	2017-05-17 16:37:53.784752	2017-05-17 16:37:53.784752
4	Fotografía	-	2017-05-17 16:37:53.842031	2017-05-17 16:37:53.842031
5	Multimedios	Televisión, Radio, Periódicos, Internet	2017-05-17 16:37:53.907494	2017-05-17 16:37:53.907494
6	Community Manager	Es el profesional responsable de construir, gestionar y administrar la comunidad online alrededor de una marca en Internet, creando y manteniendo relaciones estables y duraderas con sus clientes, sus fans y, en general, cualquier usuario interesado en la marca.	2017-05-17 16:37:53.962679	2017-05-17 16:37:53.962679
7	Crowdfunding	El crowdfunding o micromecenazgo, en castellano, es una red de financiación colectiva, normalmente online, que a través de donaciones económicas o de otro tipo, consiguen financiar un determinado proyecto a cambio de recompensas, participaciones de forma altruista.	2017-05-17 16:37:54.00745	2017-05-17 16:37:54.00745
8	Programador Java	-	2017-05-17 16:37:54.063364	2017-05-17 16:37:54.063364
9	Programador PHP	-	2017-05-17 16:37:54.107624	2017-05-17 16:37:54.107624
10	Programador web	Programador en los lenguajes HTML, CSS, Javascript.	2017-05-17 16:37:54.166025	2017-05-17 16:37:54.166025
11	Impresiones de anuncios gigantes	Carteles Publicitarios, vallas, gigantografías	2017-05-17 16:37:54.219525	2017-05-17 16:37:54.219525
12	Consultoría	-	2017-05-17 16:37:54.276799	2017-05-17 16:37:54.276799
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 12, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-05-17 16:37:34.727822	2017-05-17 16:37:34.727822
2	Doing	f	1	\N	2017-05-17 16:37:34.791246	2017-05-17 16:37:34.791246
3	Done	t	2	\N	2017-05-17 16:37:34.853256	2017-05-17 16:37:34.853256
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-05-17 16:37:22.588237	2017-05-17 16:37:22.588237
2	Incubación	-	1	2017-05-17 16:37:22.647683	2017-05-17 16:37:22.647683
3	post incubacion	-	2	2017-05-17 16:37:22.70422	2017-05-17 16:37:22.70422
4	Cuarta etapa	-	\N	2017-05-17 16:37:22.754275	2017-05-17 16:37:22.754275
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at) FROM stdin;
1	EV-001	Reunion con Programadores 	Evento que tiene como objetivo poner en contacto programadores con miembros de equipos de los distintos proyectos para que celebren contratos de sistemas de gestión del negocio de dichos proyectos.	2017-05-15	08:00:00	2017-05-17 16:37:56.905031	2017-05-17 16:37:56.905031
2	EV-002	Conferencia de Marketing	Presentación de distintos expertos en el área de marketing que tiene como objetivo que los miembros de equipos de proyectos adquieran conocimientos básicos sobre como promocionar de manera apropiada su producto o servicio. 	2017-05-16	08:00:00	2017-05-17 16:37:56.981083	2017-05-17 16:37:56.981083
3	EV-003	Diseño meetup	-	2017-05-18	16:30:00	2017-05-17 16:56:55.707353	2017-05-17 16:56:55.707353
4	EV-004	Consultoria 2	-	2017-05-19	19:21:00	2017-05-17 19:22:20.071228	2017-05-17 19:22:20.071228
\.


--
-- Data for Name: eventos_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_especialidades (id, created_at, updated_at, especialidad_de_contacto_id, evento_id) FROM stdin;
1	2017-05-17 16:37:57.074287	2017-05-17 16:37:57.074287	3	1
2	2017-05-17 16:37:57.103517	2017-05-17 16:37:57.103517	10	1
3	2017-05-17 16:37:57.125209	2017-05-17 16:37:57.125209	8	1
4	2017-05-17 16:37:57.148506	2017-05-17 16:37:57.148506	9	1
5	2017-05-17 16:37:57.170653	2017-05-17 16:37:57.170653	1	2
6	2017-05-17 16:37:57.194474	2017-05-17 16:37:57.194474	5	2
7	2017-05-17 16:37:57.225529	2017-05-17 16:37:57.225529	12	2
8	2017-05-17 16:56:55.92045	2017-05-17 16:56:55.92045	2	3
9	2017-05-17 19:22:20.303399	2017-05-17 19:22:20.303399	12	4
\.


--
-- Name: eventos_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_especialidades_id_seq', 9, true);


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_id_seq', 4, true);


--
-- Data for Name: eventos_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos_proyectos (id, created_at, updated_at, proyecto_id, evento_id) FROM stdin;
1	2017-05-17 16:37:57.591159	2017-05-17 16:37:57.591159	4	1
2	2017-05-17 16:37:57.655268	2017-05-17 16:37:57.655268	5	1
3	2017-05-17 16:37:57.708106	2017-05-17 16:37:57.708106	7	1
4	2017-05-17 16:37:57.753654	2017-05-17 16:37:57.753654	8	1
5	2017-05-17 16:37:57.811155	2017-05-17 16:37:57.811155	9	1
6	2017-05-17 16:37:57.865391	2017-05-17 16:37:57.865391	14	1
7	2017-05-17 16:37:57.920043	2017-05-17 16:37:57.920043	16	1
8	2017-05-17 16:37:57.977195	2017-05-17 16:37:57.977195	1	2
9	2017-05-17 16:37:58.03254	2017-05-17 16:37:58.03254	2	2
10	2017-05-17 16:37:58.090171	2017-05-17 16:37:58.090171	3	2
11	2017-05-17 16:37:58.142033	2017-05-17 16:37:58.142033	4	2
12	2017-05-17 16:37:58.19978	2017-05-17 16:37:58.19978	5	2
13	2017-05-17 16:37:58.255641	2017-05-17 16:37:58.255641	6	2
14	2017-05-17 16:37:58.319848	2017-05-17 16:37:58.319848	7	2
15	2017-05-17 16:37:58.375767	2017-05-17 16:37:58.375767	8	2
16	2017-05-17 16:37:58.431142	2017-05-17 16:37:58.431142	9	2
17	2017-05-17 16:37:58.494443	2017-05-17 16:37:58.494443	10	2
18	2017-05-17 16:37:58.555647	2017-05-17 16:37:58.555647	11	2
19	2017-05-17 16:37:58.617582	2017-05-17 16:37:58.617582	12	2
20	2017-05-17 16:37:58.687181	2017-05-17 16:37:58.687181	13	2
21	2017-05-17 16:37:58.756641	2017-05-17 16:37:58.756641	14	2
22	2017-05-17 16:37:58.811929	2017-05-17 16:37:58.811929	15	2
23	2017-05-17 16:37:58.865991	2017-05-17 16:37:58.865991	16	2
24	2017-05-17 16:37:58.931208	2017-05-17 16:37:58.931208	17	2
25	2017-05-17 16:37:59.022314	2017-05-17 16:37:59.022314	18	2
26	2017-05-17 16:56:55.724689	2017-05-17 16:56:55.724689	3	3
27	2017-05-17 16:56:55.791702	2017-05-17 16:56:55.791702	5	3
28	2017-05-17 16:56:55.840019	2017-05-17 16:56:55.840019	6	3
29	2017-05-17 19:22:20.09822	2017-05-17 19:22:20.09822	3	4
30	2017-05-17 19:22:20.17534	2017-05-17 19:22:20.17534	7	4
31	2017-05-17 19:22:20.215623	2017-05-17 19:22:20.215623	8	4
\.


--
-- Name: eventos_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_proyectos_id_seq', 31, true);


--
-- Data for Name: historiales; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY historiales (id, "fechaHora", created_at, updated_at, actividad_proyecto_id, estado_id, proyecto_id, user_id) FROM stdin;
1	2017-01-01 11:20:00	2017-05-17 16:37:38.148915	2017-05-17 16:37:38.148915	1	1	1	1
2	2017-01-01 11:20:00	2017-05-17 16:37:38.179723	2017-05-17 16:37:38.179723	2	1	1	1
3	2017-01-01 11:21:00	2017-05-17 16:37:38.200663	2017-05-17 16:37:38.200663	3	1	1	1
4	2017-01-01 11:22:00	2017-05-17 16:37:38.222292	2017-05-17 16:37:38.222292	1	2	1	1
5	2017-01-02 11:22:00	2017-05-17 16:37:38.246367	2017-05-17 16:37:38.246367	2	2	1	1
6	2017-01-08 11:23:00	2017-05-17 16:37:38.268299	2017-05-17 16:37:38.268299	3	2	1	1
7	2017-01-01 11:23:00	2017-05-17 16:37:38.290396	2017-05-17 16:37:38.290396	1	3	1	1
8	2017-01-06 11:24:00	2017-05-17 16:37:38.311635	2017-05-17 16:37:38.311635	2	3	1	1
9	2017-01-12 15:46:17	2017-05-17 16:37:38.33458	2017-05-17 16:37:38.33458	3	3	1	1
10	2017-01-17 15:51:14	2017-05-17 16:37:38.355289	2017-05-17 16:37:38.355289	55	1	1	1
11	2017-01-23 15:51:58	2017-05-17 16:37:38.379396	2017-05-17 16:37:38.379396	56	1	1	1
12	2017-02-02 15:52:39	2017-05-17 16:37:38.400584	2017-05-17 16:37:38.400584	57	1	1	1
13	2017-02-11 15:54:06	2017-05-17 16:37:38.422424	2017-05-17 16:37:38.422424	58	1	1	1
14	2017-02-23 15:55:59	2017-05-17 16:37:38.44618	2017-05-17 16:37:38.44618	59	1	1	1
15	2017-03-01 15:51:14	2017-05-17 16:37:38.466826	2017-05-17 16:37:38.466826	55	2	1	1
16	2017-03-08 15:51:58	2017-05-17 16:37:38.49028	2017-05-17 16:37:38.49028	56	2	1	1
17	2017-03-15 15:52:39	2017-05-17 16:37:38.511696	2017-05-17 16:37:38.511696	57	2	1	1
18	2017-03-21 15:54:06	2017-05-17 16:37:38.534772	2017-05-17 16:37:38.534772	58	2	1	1
19	2017-03-28 15:55:59	2017-05-17 16:37:38.55598	2017-05-17 16:37:38.55598	59	2	1	1
20	2017-04-01 15:51:14	2017-05-17 16:37:38.577687	2017-05-17 16:37:38.577687	55	3	1	1
21	2017-04-10 15:51:58	2017-05-17 16:37:38.602021	2017-05-17 16:37:38.602021	56	3	1	1
22	2017-04-17 15:52:39	2017-05-17 16:37:38.622571	2017-05-17 16:37:38.622571	57	3	1	1
23	2017-04-25 15:54:06	2017-05-17 16:37:38.646327	2017-05-17 16:37:38.646327	58	3	1	1
24	2017-01-01 11:20:00	2017-05-17 16:37:38.668477	2017-05-17 16:37:38.668477	4	1	2	1
25	2017-01-01 11:20:00	2017-05-17 16:37:38.690175	2017-05-17 16:37:38.690175	5	1	2	1
26	2017-01-01 11:21:00	2017-05-17 16:37:38.711047	2017-05-17 16:37:38.711047	6	1	2	1
27	2017-01-01 11:22:00	2017-05-17 16:37:38.734672	2017-05-17 16:37:38.734672	4	2	2	1
28	2017-01-02 11:22:00	2017-05-17 16:37:38.755998	2017-05-17 16:37:38.755998	5	2	2	1
29	2017-01-08 11:23:00	2017-05-17 16:37:38.779678	2017-05-17 16:37:38.779678	6	2	2	1
30	2017-01-01 11:23:00	2017-05-17 16:37:38.801007	2017-05-17 16:37:38.801007	4	3	2	1
31	2017-01-06 11:24:00	2017-05-17 16:37:38.822665	2017-05-17 16:37:38.822665	5	3	2	1
32	2017-01-01 11:20:00	2017-05-17 16:37:38.845673	2017-05-17 16:37:38.845673	7	1	3	1
33	2017-01-01 11:20:00	2017-05-17 16:37:38.866979	2017-05-17 16:37:38.866979	8	1	3	1
34	2017-01-01 11:21:00	2017-05-17 16:37:38.890386	2017-05-17 16:37:38.890386	9	1	3	1
35	2017-01-01 11:22:00	2017-05-17 16:37:38.913073	2017-05-17 16:37:38.913073	7	2	3	1
36	2017-01-02 11:22:00	2017-05-17 16:37:38.935024	2017-05-17 16:37:38.935024	8	2	3	1
37	2017-01-08 11:23:00	2017-05-17 16:37:38.956091	2017-05-17 16:37:38.956091	9	2	3	1
38	2017-01-01 11:23:00	2017-05-17 16:37:38.979684	2017-05-17 16:37:38.979684	7	3	3	1
39	2017-01-06 11:24:00	2017-05-17 16:37:39.001739	2017-05-17 16:37:39.001739	8	3	3	1
40	2017-01-01 11:20:00	2017-05-17 16:37:39.022474	2017-05-17 16:37:39.022474	10	1	4	1
41	2017-01-01 11:20:00	2017-05-17 16:37:39.046259	2017-05-17 16:37:39.046259	11	1	4	1
42	2017-01-01 11:21:00	2017-05-17 16:37:39.067228	2017-05-17 16:37:39.067228	12	1	4	1
43	2017-01-01 11:22:00	2017-05-17 16:37:39.090951	2017-05-17 16:37:39.090951	10	2	4	1
44	2017-01-02 11:22:00	2017-05-17 16:37:39.112166	2017-05-17 16:37:39.112166	11	2	4	1
45	2017-01-08 11:23:00	2017-05-17 16:37:39.135139	2017-05-17 16:37:39.135139	12	2	4	1
46	2017-01-01 11:23:00	2017-05-17 16:37:39.156503	2017-05-17 16:37:39.156503	10	3	4	1
47	2017-01-06 11:24:00	2017-05-17 16:37:39.179368	2017-05-17 16:37:39.179368	11	3	4	1
48	2017-01-01 11:20:00	2017-05-17 16:37:39.20105	2017-05-17 16:37:39.20105	13	1	5	1
49	2017-01-01 11:20:00	2017-05-17 16:37:39.222565	2017-05-17 16:37:39.222565	14	1	5	1
50	2017-01-01 11:21:00	2017-05-17 16:37:39.256532	2017-05-17 16:37:39.256532	15	1	5	1
51	2017-01-01 11:22:00	2017-05-17 16:37:39.279774	2017-05-17 16:37:39.279774	13	2	5	1
52	2017-01-02 11:22:00	2017-05-17 16:37:39.31134	2017-05-17 16:37:39.31134	14	2	5	1
53	2017-01-08 11:23:00	2017-05-17 16:37:39.334872	2017-05-17 16:37:39.334872	15	2	5	1
54	2017-01-01 11:23:00	2017-05-17 16:37:39.356534	2017-05-17 16:37:39.356534	13	3	5	1
55	2017-01-06 11:24:00	2017-05-17 16:37:39.378959	2017-05-17 16:37:39.378959	14	3	5	1
56	2017-01-01 11:20:00	2017-05-17 16:37:39.401137	2017-05-17 16:37:39.401137	16	1	6	1
57	2017-01-01 11:20:00	2017-05-17 16:37:39.422953	2017-05-17 16:37:39.422953	17	1	6	1
58	2017-01-01 11:21:00	2017-05-17 16:37:39.446397	2017-05-17 16:37:39.446397	18	1	6	1
59	2017-01-01 11:22:00	2017-05-17 16:37:39.467264	2017-05-17 16:37:39.467264	16	2	6	1
60	2017-01-02 11:22:00	2017-05-17 16:37:39.489456	2017-05-17 16:37:39.489456	17	2	6	1
61	2017-01-08 11:23:00	2017-05-17 16:37:39.512461	2017-05-17 16:37:39.512461	18	2	6	1
62	2017-01-01 11:23:00	2017-05-17 16:37:39.53538	2017-05-17 16:37:39.53538	16	3	6	1
63	2017-01-06 11:24:00	2017-05-17 16:37:39.556599	2017-05-17 16:37:39.556599	17	3	6	1
64	2017-01-01 11:20:00	2017-05-17 16:37:39.578655	2017-05-17 16:37:39.578655	19	1	7	1
65	2017-01-01 11:20:00	2017-05-17 16:37:39.601752	2017-05-17 16:37:39.601752	20	1	7	1
66	2017-01-01 11:21:00	2017-05-17 16:37:39.624495	2017-05-17 16:37:39.624495	21	1	7	1
67	2017-01-01 11:22:00	2017-05-17 16:37:39.644879	2017-05-17 16:37:39.644879	19	2	7	1
68	2017-01-02 11:22:00	2017-05-17 16:37:39.669265	2017-05-17 16:37:39.669265	20	2	7	1
69	2017-01-08 11:23:00	2017-05-17 16:37:39.690935	2017-05-17 16:37:39.690935	21	2	7	1
70	2017-01-01 11:23:00	2017-05-17 16:37:39.712301	2017-05-17 16:37:39.712301	19	3	7	1
71	2017-01-06 11:24:00	2017-05-17 16:37:39.735438	2017-05-17 16:37:39.735438	20	3	7	1
72	2017-01-01 11:20:00	2017-05-17 16:37:39.758031	2017-05-17 16:37:39.758031	22	1	8	1
73	2017-01-01 11:20:00	2017-05-17 16:37:39.77982	2017-05-17 16:37:39.77982	23	1	8	1
74	2017-01-01 11:21:00	2017-05-17 16:37:39.801401	2017-05-17 16:37:39.801401	24	1	8	1
75	2017-01-01 11:22:00	2017-05-17 16:37:39.824591	2017-05-17 16:37:39.824591	22	2	8	1
76	2017-01-02 11:22:00	2017-05-17 16:37:39.846571	2017-05-17 16:37:39.846571	23	2	8	1
77	2017-01-08 11:23:00	2017-05-17 16:37:39.877901	2017-05-17 16:37:39.877901	24	2	8	1
78	2017-01-01 11:23:00	2017-05-17 16:37:39.902901	2017-05-17 16:37:39.902901	22	3	8	1
79	2017-01-06 11:24:00	2017-05-17 16:37:39.923331	2017-05-17 16:37:39.923331	23	3	8	1
80	2017-01-01 11:20:00	2017-05-17 16:37:39.945663	2017-05-17 16:37:39.945663	25	1	9	1
81	2017-01-01 11:20:00	2017-05-17 16:37:39.969545	2017-05-17 16:37:39.969545	26	1	9	1
82	2017-01-01 11:21:00	2017-05-17 16:37:39.98928	2017-05-17 16:37:39.98928	27	1	9	1
83	2017-01-01 11:22:00	2017-05-17 16:37:40.012244	2017-05-17 16:37:40.012244	25	2	9	1
84	2017-01-02 11:22:00	2017-05-17 16:37:40.035811	2017-05-17 16:37:40.035811	26	2	9	1
85	2017-01-08 11:23:00	2017-05-17 16:37:40.057694	2017-05-17 16:37:40.057694	27	2	9	1
86	2017-01-01 11:23:00	2017-05-17 16:37:40.091459	2017-05-17 16:37:40.091459	25	3	9	1
87	2017-01-06 11:24:00	2017-05-17 16:37:40.113923	2017-05-17 16:37:40.113923	26	3	9	1
88	2017-01-01 11:20:00	2017-05-17 16:37:40.134812	2017-05-17 16:37:40.134812	28	1	10	1
89	2017-01-01 11:20:00	2017-05-17 16:37:40.158117	2017-05-17 16:37:40.158117	29	1	10	1
90	2017-01-01 11:21:00	2017-05-17 16:37:40.180647	2017-05-17 16:37:40.180647	30	1	10	1
91	2017-01-01 11:22:00	2017-05-17 16:37:40.203677	2017-05-17 16:37:40.203677	28	2	10	1
92	2017-01-02 11:22:00	2017-05-17 16:37:40.224157	2017-05-17 16:37:40.224157	29	2	10	1
93	2017-01-08 11:23:00	2017-05-17 16:37:40.244749	2017-05-17 16:37:40.244749	30	2	10	1
94	2017-01-01 11:23:00	2017-05-17 16:37:40.267252	2017-05-17 16:37:40.267252	28	3	10	1
95	2017-01-06 11:24:00	2017-05-17 16:37:40.291178	2017-05-17 16:37:40.291178	29	3	10	1
96	2017-01-01 11:20:00	2017-05-17 16:37:40.312408	2017-05-17 16:37:40.312408	31	1	11	1
97	2017-01-01 11:20:00	2017-05-17 16:37:40.335837	2017-05-17 16:37:40.335837	32	1	11	1
98	2017-01-01 11:21:00	2017-05-17 16:37:40.357407	2017-05-17 16:37:40.357407	33	1	11	1
99	2017-01-01 11:22:00	2017-05-17 16:37:40.378628	2017-05-17 16:37:40.378628	31	2	11	1
100	2017-01-02 11:22:00	2017-05-17 16:37:40.4023	2017-05-17 16:37:40.4023	32	2	11	1
101	2017-01-08 11:23:00	2017-05-17 16:37:40.423482	2017-05-17 16:37:40.423482	33	2	11	1
102	2017-01-01 11:23:00	2017-05-17 16:37:40.446997	2017-05-17 16:37:40.446997	31	3	11	1
103	2017-01-06 11:24:00	2017-05-17 16:37:40.467886	2017-05-17 16:37:40.467886	32	3	11	1
104	2017-01-01 11:20:00	2017-05-17 16:37:40.490193	2017-05-17 16:37:40.490193	34	1	12	1
105	2017-01-01 11:20:00	2017-05-17 16:37:40.513658	2017-05-17 16:37:40.513658	35	1	12	1
106	2017-01-01 11:21:00	2017-05-17 16:37:40.53523	2017-05-17 16:37:40.53523	36	1	12	1
107	2017-01-01 11:22:00	2017-05-17 16:37:40.557567	2017-05-17 16:37:40.557567	34	2	12	1
108	2017-01-02 11:22:00	2017-05-17 16:37:40.578771	2017-05-17 16:37:40.578771	35	2	12	1
109	2017-01-08 11:23:00	2017-05-17 16:37:40.602375	2017-05-17 16:37:40.602375	36	2	12	1
110	2017-01-01 11:23:00	2017-05-17 16:37:40.622983	2017-05-17 16:37:40.622983	34	3	12	1
111	2017-01-06 11:24:00	2017-05-17 16:37:40.646176	2017-05-17 16:37:40.646176	35	3	12	1
112	2017-01-01 11:20:00	2017-05-17 16:37:40.667839	2017-05-17 16:37:40.667839	37	1	13	1
113	2017-01-01 11:20:00	2017-05-17 16:37:40.689483	2017-05-17 16:37:40.689483	38	1	13	1
114	2017-01-01 11:21:00	2017-05-17 16:37:40.714022	2017-05-17 16:37:40.714022	39	1	13	1
115	2017-01-01 11:22:00	2017-05-17 16:37:40.736087	2017-05-17 16:37:40.736087	37	2	13	1
116	2017-01-02 11:22:00	2017-05-17 16:37:40.757876	2017-05-17 16:37:40.757876	38	2	13	1
117	2017-01-08 11:23:00	2017-05-17 16:37:40.779643	2017-05-17 16:37:40.779643	39	2	13	1
118	2017-01-01 11:23:00	2017-05-17 16:37:40.802401	2017-05-17 16:37:40.802401	37	3	13	1
119	2017-01-06 11:24:00	2017-05-17 16:37:40.824898	2017-05-17 16:37:40.824898	38	3	13	1
120	2017-01-01 11:20:00	2017-05-17 16:37:40.845298	2017-05-17 16:37:40.845298	40	1	14	1
121	2017-01-01 11:20:00	2017-05-17 16:37:40.867265	2017-05-17 16:37:40.867265	41	1	14	1
122	2017-01-01 11:21:00	2017-05-17 16:37:40.892243	2017-05-17 16:37:40.892243	42	1	14	1
123	2017-01-01 11:22:00	2017-05-17 16:37:40.912236	2017-05-17 16:37:40.912236	40	2	14	1
124	2017-01-02 11:22:00	2017-05-17 16:37:40.934825	2017-05-17 16:37:40.934825	41	2	14	1
125	2017-01-08 11:23:00	2017-05-17 16:37:40.956785	2017-05-17 16:37:40.956785	42	2	14	1
126	2017-01-01 11:23:00	2017-05-17 16:37:40.979602	2017-05-17 16:37:40.979602	40	3	14	1
127	2017-01-06 11:24:00	2017-05-17 16:37:41.003412	2017-05-17 16:37:41.003412	41	3	14	1
128	2017-01-01 11:20:00	2017-05-17 16:37:41.02398	2017-05-17 16:37:41.02398	43	1	15	1
129	2017-01-01 11:20:00	2017-05-17 16:37:41.046608	2017-05-17 16:37:41.046608	44	1	15	1
130	2017-01-01 11:21:00	2017-05-17 16:37:41.070606	2017-05-17 16:37:41.070606	45	1	15	1
131	2017-01-01 11:22:00	2017-05-17 16:37:41.09061	2017-05-17 16:37:41.09061	43	2	15	1
132	2017-01-02 11:22:00	2017-05-17 16:37:41.11321	2017-05-17 16:37:41.11321	44	2	15	1
133	2017-01-08 11:23:00	2017-05-17 16:37:41.13498	2017-05-17 16:37:41.13498	45	2	15	1
134	2017-01-01 11:23:00	2017-05-17 16:37:41.158244	2017-05-17 16:37:41.158244	43	3	15	1
135	2017-01-06 11:24:00	2017-05-17 16:37:41.179877	2017-05-17 16:37:41.179877	44	3	15	1
136	2017-01-01 11:20:00	2017-05-17 16:37:41.200714	2017-05-17 16:37:41.200714	46	1	16	1
137	2017-01-01 11:20:00	2017-05-17 16:37:41.224536	2017-05-17 16:37:41.224536	47	1	16	1
138	2017-01-01 11:21:00	2017-05-17 16:37:41.247696	2017-05-17 16:37:41.247696	48	1	16	1
139	2017-01-01 11:22:00	2017-05-17 16:37:41.26768	2017-05-17 16:37:41.26768	46	2	16	1
140	2017-01-02 11:22:00	2017-05-17 16:37:41.29106	2017-05-17 16:37:41.29106	47	2	16	1
141	2017-01-08 11:23:00	2017-05-17 16:37:41.323197	2017-05-17 16:37:41.323197	48	2	16	1
142	2017-01-01 11:23:00	2017-05-17 16:37:41.345438	2017-05-17 16:37:41.345438	46	3	16	1
143	2017-01-06 11:24:00	2017-05-17 16:37:41.378905	2017-05-17 16:37:41.378905	47	3	16	1
144	2017-01-01 11:20:00	2017-05-17 16:37:41.406025	2017-05-17 16:37:41.406025	49	1	17	1
145	2017-01-01 11:20:00	2017-05-17 16:37:41.445182	2017-05-17 16:37:41.445182	50	1	17	1
146	2017-01-01 11:21:00	2017-05-17 16:37:41.467631	2017-05-17 16:37:41.467631	51	1	17	1
147	2017-01-01 11:22:00	2017-05-17 16:37:41.501495	2017-05-17 16:37:41.501495	49	2	17	1
148	2017-01-02 11:22:00	2017-05-17 16:37:41.52425	2017-05-17 16:37:41.52425	50	2	17	1
149	2017-01-08 11:23:00	2017-05-17 16:37:41.55885	2017-05-17 16:37:41.55885	51	2	17	1
150	2017-01-01 11:23:00	2017-05-17 16:37:41.579031	2017-05-17 16:37:41.579031	49	3	17	1
151	2017-01-06 11:24:00	2017-05-17 16:37:41.609002	2017-05-17 16:37:41.609002	50	3	17	1
152	2017-01-01 11:20:00	2017-05-17 16:37:41.657026	2017-05-17 16:37:41.657026	52	1	18	1
153	2017-01-01 11:20:00	2017-05-17 16:37:41.67927	2017-05-17 16:37:41.67927	53	1	18	1
154	2017-01-01 11:21:00	2017-05-17 16:37:41.702318	2017-05-17 16:37:41.702318	54	1	18	1
155	2017-01-01 11:22:00	2017-05-17 16:37:41.723684	2017-05-17 16:37:41.723684	52	2	18	1
156	2017-01-02 11:22:00	2017-05-17 16:37:41.745697	2017-05-17 16:37:41.745697	53	2	18	1
157	2017-01-08 11:23:00	2017-05-17 16:37:41.767707	2017-05-17 16:37:41.767707	54	2	18	1
158	2017-01-01 11:23:00	2017-05-17 16:37:41.790337	2017-05-17 16:37:41.790337	52	3	18	1
159	2017-01-06 11:24:00	2017-05-17 16:37:41.813691	2017-05-17 16:37:41.813691	53	3	18	1
160	2017-05-17 19:15:00.772766	2017-05-17 19:15:00.775075	2017-05-17 19:15:01.217084	59	3	1	1
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 160, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-05-17 16:37:42.000096	2017-05-17 16:37:42.000096
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
1	Actividad	2017-05-17 16:37:27.023014	2017-05-17 16:37:27.023014
2	Area	2017-05-17 16:37:27.056471	2017-05-17 16:37:27.056471
3	Ciudad	2017-05-17 16:37:27.077861	2017-05-17 16:37:27.077861
4	ConceptoDePago	2017-05-17 16:37:27.099277	2017-05-17 16:37:27.099277
5	Contacto	2017-05-17 16:37:27.120467	2017-05-17 16:37:27.120467
6	Contrato	2017-05-17 16:37:27.144886	2017-05-17 16:37:27.144886
7	Cuenta	2017-05-17 16:37:27.166379	2017-05-17 16:37:27.166379
8	Departamento	2017-05-17 16:37:27.187466	2017-05-17 16:37:27.187466
9	Descuento	2017-05-17 16:37:27.210348	2017-05-17 16:37:27.210348
10	Empleado	2017-05-17 16:37:27.23339	2017-05-17 16:37:27.23339
11	EspecialidadDeContacto	2017-05-17 16:37:27.255187	2017-05-17 16:37:27.255187
12	Estado	2017-05-17 16:37:27.276193	2017-05-17 16:37:27.276193
13	Etapa	2017-05-17 16:37:27.300534	2017-05-17 16:37:27.300534
14	Evento	2017-05-17 16:37:27.321313	2017-05-17 16:37:27.321313
15	EventoProyecto	2017-05-17 16:37:27.344572	2017-05-17 16:37:27.344572
16	MiembroEquipo	2017-05-17 16:37:27.367145	2017-05-17 16:37:27.367145
17	Pago	2017-05-17 16:37:27.389169	2017-05-17 16:37:27.389169
18	Pais	2017-05-17 16:37:27.411831	2017-05-17 16:37:27.411831
19	Provincia	2017-05-17 16:37:27.432756	2017-05-17 16:37:27.432756
20	Proyecto	2017-05-17 16:37:27.453731	2017-05-17 16:37:27.453731
21	Rol	2017-05-17 16:37:27.477678	2017-05-17 16:37:27.477678
22	RolDeEmpleado	2017-05-17 16:37:27.499362	2017-05-17 16:37:27.499362
23	TipoDocumento	2017-05-17 16:37:27.522934	2017-05-17 16:37:27.522934
24	TipoDePago	2017-05-17 16:37:27.544372	2017-05-17 16:37:27.544372
25	User	2017-05-17 16:37:27.565824	2017-05-17 16:37:27.565824
26	ActividadProyecto	2017-05-17 16:37:27.587103	2017-05-17 16:37:27.587103
27	CuotaPorCliente	2017-05-17 16:37:27.61117	2017-05-17 16:37:27.61117
28	Accion	2017-05-17 16:37:27.631613	2017-05-17 16:37:27.631613
29	Modelo	2017-05-17 16:37:27.655129	2017-05-17 16:37:27.655129
\.


--
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('modelos_id_seq', 29, true);


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos (id, fecha, monto, created_at, updated_at, tipo_de_pago_id, proyecto_id, persona_id, cuenta_id, contrato_id) FROM stdin;
1	2017-05-17	288	2017-05-17 16:39:51.515473	2017-05-17 16:39:51.515473	\N	1	51	1	1
2	2017-05-17	288	2017-05-17 16:41:01.962085	2017-05-17 16:41:01.962085	\N	1	51	1	1
3	2017-05-17	288	2017-05-17 16:41:46.491894	2017-05-17 16:41:46.491894	\N	1	51	1	1
4	2017-05-17	288	2017-05-17 16:42:54.277065	2017-05-17 16:42:54.277065	\N	1	51	1	1
5	2017-05-17	576	2017-05-17 16:44:22.144045	2017-05-17 16:44:22.144045	\N	2	52	2	2
6	2017-05-17	576	2017-05-17 16:45:54.320239	2017-05-17 16:45:54.320239	\N	2	52	2	2
7	2017-05-17	288	2017-05-17 16:47:01.138295	2017-05-17 16:47:01.138295	\N	3	54	3	3
8	2017-05-17	288	2017-05-17 16:47:43.547992	2017-05-17 16:47:43.547992	\N	4	56	4	4
9	2017-05-17	288	2017-05-17 19:18:03.389795	2017-05-17 19:18:03.389795	\N	4	56	4	4
\.


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_id_seq', 9, true);


--
-- Data for Name: pagos_metodos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos_metodos (id, monto, created_at, updated_at, pago_id, tipo_de_pago_id) FROM stdin;
1	288	2017-05-17 16:39:51.685216	2017-05-17 16:39:51.685216	1	1
2	700	2017-05-17 16:41:02.050608	2017-05-17 16:41:02.050608	2	1
3	412	2017-05-17 16:41:46.566198	2017-05-17 16:41:46.566198	3	4
4	124	2017-05-17 16:42:54.359508	2017-05-17 16:42:54.359508	4	4
5	164	2017-05-17 16:42:54.367345	2017-05-17 16:42:54.367345	4	2
6	200	2017-05-17 16:44:22.222069	2017-05-17 16:44:22.222069	5	1
7	376	2017-05-17 16:44:22.230589	2017-05-17 16:44:22.230589	5	3
8	510	2017-05-17 16:45:54.401713	2017-05-17 16:45:54.401713	6	1
9	100	2017-05-17 16:45:54.409601	2017-05-17 16:45:54.409601	6	2
10	300	2017-05-17 16:47:01.21297	2017-05-17 16:47:01.21297	7	1
11	800	2017-05-17 16:47:43.625147	2017-05-17 16:47:43.625147	8	1
12	512	2017-05-17 19:18:03.500254	2017-05-17 19:18:03.500254	9	4
\.


--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_metodos_id_seq', 12, true);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY paises (id, nombre, created_at, updated_at) FROM stdin;
1	Argentina	2017-05-17 16:37:12.37585	2017-05-17 16:37:12.37585
2	Paraguay	2017-05-17 16:37:12.407924	2017-05-17 16:37:12.407924
3	Brasil	2017-05-17 16:37:12.429323	2017-05-17 16:37:12.429323
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-05-17 16:37:27.721166	2017-05-17 16:37:27.721166	1	1
2	2017-05-17 16:37:27.75101	2017-05-17 16:37:27.75101	2	1
3	2017-05-17 16:37:27.773423	2017-05-17 16:37:27.773423	3	1
4	2017-05-17 16:37:27.7958	2017-05-17 16:37:27.7958	4	1
5	2017-05-17 16:37:27.818168	2017-05-17 16:37:27.818168	1	2
6	2017-05-17 16:37:27.839213	2017-05-17 16:37:27.839213	2	2
7	2017-05-17 16:37:27.863059	2017-05-17 16:37:27.863059	3	2
8	2017-05-17 16:37:27.884502	2017-05-17 16:37:27.884502	4	2
9	2017-05-17 16:37:27.906419	2017-05-17 16:37:27.906419	1	3
10	2017-05-17 16:37:27.929128	2017-05-17 16:37:27.929128	2	3
11	2017-05-17 16:37:27.950772	2017-05-17 16:37:27.950772	3	3
12	2017-05-17 16:37:27.973999	2017-05-17 16:37:27.973999	4	3
13	2017-05-17 16:37:27.9955	2017-05-17 16:37:27.9955	1	4
14	2017-05-17 16:37:28.018363	2017-05-17 16:37:28.018363	2	4
15	2017-05-17 16:37:28.039471	2017-05-17 16:37:28.039471	3	4
16	2017-05-17 16:37:28.062711	2017-05-17 16:37:28.062711	4	4
17	2017-05-17 16:37:28.08626	2017-05-17 16:37:28.08626	1	5
18	2017-05-17 16:37:28.105364	2017-05-17 16:37:28.105364	2	5
19	2017-05-17 16:37:28.129232	2017-05-17 16:37:28.129232	3	5
20	2017-05-17 16:37:28.150544	2017-05-17 16:37:28.150544	4	5
21	2017-05-17 16:37:28.173739	2017-05-17 16:37:28.173739	1	6
22	2017-05-17 16:37:28.19587	2017-05-17 16:37:28.19587	2	6
23	2017-05-17 16:37:28.218058	2017-05-17 16:37:28.218058	3	6
24	2017-05-17 16:37:28.239903	2017-05-17 16:37:28.239903	4	6
25	2017-05-17 16:37:28.261355	2017-05-17 16:37:28.261355	1	7
26	2017-05-17 16:37:28.284019	2017-05-17 16:37:28.284019	2	7
27	2017-05-17 16:37:28.305464	2017-05-17 16:37:28.305464	3	7
28	2017-05-17 16:37:28.32926	2017-05-17 16:37:28.32926	4	7
29	2017-05-17 16:37:28.35089	2017-05-17 16:37:28.35089	1	8
30	2017-05-17 16:37:28.373601	2017-05-17 16:37:28.373601	2	8
31	2017-05-17 16:37:28.395237	2017-05-17 16:37:28.395237	3	8
32	2017-05-17 16:37:28.418473	2017-05-17 16:37:28.418473	4	8
33	2017-05-17 16:37:28.440552	2017-05-17 16:37:28.440552	1	9
34	2017-05-17 16:37:28.462879	2017-05-17 16:37:28.462879	2	9
35	2017-05-17 16:37:28.484465	2017-05-17 16:37:28.484465	3	9
36	2017-05-17 16:37:28.506502	2017-05-17 16:37:28.506502	4	9
37	2017-05-17 16:37:28.529231	2017-05-17 16:37:28.529231	1	10
38	2017-05-17 16:37:28.551597	2017-05-17 16:37:28.551597	2	10
39	2017-05-17 16:37:28.572692	2017-05-17 16:37:28.572692	3	10
40	2017-05-17 16:37:28.594945	2017-05-17 16:37:28.594945	4	10
41	2017-05-17 16:37:28.61711	2017-05-17 16:37:28.61711	1	11
42	2017-05-17 16:37:28.651821	2017-05-17 16:37:28.651821	2	11
43	2017-05-17 16:37:28.683754	2017-05-17 16:37:28.683754	3	11
44	2017-05-17 16:37:28.709226	2017-05-17 16:37:28.709226	4	11
45	2017-05-17 16:37:28.727939	2017-05-17 16:37:28.727939	1	12
46	2017-05-17 16:37:28.750104	2017-05-17 16:37:28.750104	2	12
47	2017-05-17 16:37:28.772539	2017-05-17 16:37:28.772539	3	12
48	2017-05-17 16:37:28.794829	2017-05-17 16:37:28.794829	4	12
49	2017-05-17 16:37:28.81914	2017-05-17 16:37:28.81914	1	13
50	2017-05-17 16:37:28.840267	2017-05-17 16:37:28.840267	2	13
51	2017-05-17 16:37:28.861507	2017-05-17 16:37:28.861507	3	13
52	2017-05-17 16:37:28.885469	2017-05-17 16:37:28.885469	4	13
53	2017-05-17 16:37:28.90708	2017-05-17 16:37:28.90708	1	14
54	2017-05-17 16:37:28.930158	2017-05-17 16:37:28.930158	2	14
55	2017-05-17 16:37:28.950769	2017-05-17 16:37:28.950769	3	14
56	2017-05-17 16:37:28.974285	2017-05-17 16:37:28.974285	4	14
57	2017-05-17 16:37:28.995378	2017-05-17 16:37:28.995378	1	15
58	2017-05-17 16:37:29.019078	2017-05-17 16:37:29.019078	2	15
59	2017-05-17 16:37:29.03922	2017-05-17 16:37:29.03922	3	15
60	2017-05-17 16:37:29.062074	2017-05-17 16:37:29.062074	4	15
61	2017-05-17 16:37:29.085206	2017-05-17 16:37:29.085206	1	16
62	2017-05-17 16:37:29.107281	2017-05-17 16:37:29.107281	2	16
63	2017-05-17 16:37:29.129371	2017-05-17 16:37:29.129371	3	16
64	2017-05-17 16:37:29.151925	2017-05-17 16:37:29.151925	4	16
65	2017-05-17 16:37:29.174075	2017-05-17 16:37:29.174075	1	17
66	2017-05-17 16:37:29.195773	2017-05-17 16:37:29.195773	2	17
67	2017-05-17 16:37:29.218804	2017-05-17 16:37:29.218804	3	17
68	2017-05-17 16:37:29.240041	2017-05-17 16:37:29.240041	4	17
69	2017-05-17 16:37:29.261884	2017-05-17 16:37:29.261884	1	18
70	2017-05-17 16:37:29.284863	2017-05-17 16:37:29.284863	2	18
71	2017-05-17 16:37:29.306261	2017-05-17 16:37:29.306261	3	18
72	2017-05-17 16:37:29.329478	2017-05-17 16:37:29.329478	4	18
73	2017-05-17 16:37:29.351398	2017-05-17 16:37:29.351398	1	19
74	2017-05-17 16:37:29.372856	2017-05-17 16:37:29.372856	2	19
75	2017-05-17 16:37:29.395527	2017-05-17 16:37:29.395527	3	19
76	2017-05-17 16:37:29.417537	2017-05-17 16:37:29.417537	4	19
77	2017-05-17 16:37:29.440214	2017-05-17 16:37:29.440214	1	20
78	2017-05-17 16:37:29.461924	2017-05-17 16:37:29.461924	2	20
79	2017-05-17 16:37:29.485182	2017-05-17 16:37:29.485182	3	20
80	2017-05-17 16:37:29.507842	2017-05-17 16:37:29.507842	4	20
81	2017-05-17 16:37:29.529573	2017-05-17 16:37:29.529573	1	21
82	2017-05-17 16:37:29.552302	2017-05-17 16:37:29.552302	2	21
83	2017-05-17 16:37:29.574275	2017-05-17 16:37:29.574275	3	21
84	2017-05-17 16:37:29.597711	2017-05-17 16:37:29.597711	4	21
85	2017-05-17 16:37:29.630334	2017-05-17 16:37:29.630334	1	22
86	2017-05-17 16:37:29.653298	2017-05-17 16:37:29.653298	2	22
87	2017-05-17 16:37:29.685416	2017-05-17 16:37:29.685416	3	22
88	2017-05-17 16:37:29.708077	2017-05-17 16:37:29.708077	4	22
89	2017-05-17 16:37:29.751935	2017-05-17 16:37:29.751935	1	23
90	2017-05-17 16:37:29.775688	2017-05-17 16:37:29.775688	2	23
91	2017-05-17 16:37:29.807776	2017-05-17 16:37:29.807776	3	23
92	2017-05-17 16:37:29.829534	2017-05-17 16:37:29.829534	4	23
93	2017-05-17 16:37:29.864029	2017-05-17 16:37:29.864029	1	24
94	2017-05-17 16:37:29.885609	2017-05-17 16:37:29.885609	2	24
95	2017-05-17 16:37:29.908484	2017-05-17 16:37:29.908484	3	24
96	2017-05-17 16:37:29.930351	2017-05-17 16:37:29.930351	4	24
97	2017-05-17 16:37:29.952831	2017-05-17 16:37:29.952831	1	25
98	2017-05-17 16:37:29.975332	2017-05-17 16:37:29.975332	2	25
99	2017-05-17 16:37:29.998155	2017-05-17 16:37:29.998155	3	25
100	2017-05-17 16:37:30.018412	2017-05-17 16:37:30.018412	4	25
101	2017-05-17 16:37:30.042567	2017-05-17 16:37:30.042567	5	20
102	2017-05-17 16:37:30.063924	2017-05-17 16:37:30.063924	6	1
103	2017-05-17 16:37:30.08738	2017-05-17 16:37:30.08738	6	2
104	2017-05-17 16:37:30.108986	2017-05-17 16:37:30.108986	6	3
105	2017-05-17 16:37:30.130746	2017-05-17 16:37:30.130746	6	4
106	2017-05-17 16:37:30.154059	2017-05-17 16:37:30.154059	6	5
107	2017-05-17 16:37:30.174781	2017-05-17 16:37:30.174781	6	6
108	2017-05-17 16:37:30.197501	2017-05-17 16:37:30.197501	6	7
109	2017-05-17 16:37:30.220233	2017-05-17 16:37:30.220233	6	8
110	2017-05-17 16:37:30.240983	2017-05-17 16:37:30.240983	6	9
111	2017-05-17 16:37:30.263458	2017-05-17 16:37:30.263458	6	10
112	2017-05-17 16:37:30.286064	2017-05-17 16:37:30.286064	6	11
113	2017-05-17 16:37:30.307291	2017-05-17 16:37:30.307291	6	12
114	2017-05-17 16:37:30.333717	2017-05-17 16:37:30.333717	6	13
115	2017-05-17 16:37:30.363131	2017-05-17 16:37:30.363131	6	14
116	2017-05-17 16:37:30.388997	2017-05-17 16:37:30.388997	6	15
117	2017-05-17 16:37:30.407686	2017-05-17 16:37:30.407686	6	16
118	2017-05-17 16:37:30.430199	2017-05-17 16:37:30.430199	6	17
119	2017-05-17 16:37:30.464136	2017-05-17 16:37:30.464136	6	18
120	2017-05-17 16:37:30.485236	2017-05-17 16:37:30.485236	6	19
121	2017-05-17 16:37:30.507835	2017-05-17 16:37:30.507835	6	20
122	2017-05-17 16:37:30.530966	2017-05-17 16:37:30.530966	6	21
123	2017-05-17 16:37:30.55356	2017-05-17 16:37:30.55356	6	22
124	2017-05-17 16:37:30.575	2017-05-17 16:37:30.575	6	23
125	2017-05-17 16:37:30.598377	2017-05-17 16:37:30.598377	6	24
126	2017-05-17 16:37:30.619047	2017-05-17 16:37:30.619047	6	25
127	2017-05-17 16:37:30.688276	2017-05-17 16:37:30.688276	2	26
128	2017-05-17 16:37:30.729973	2017-05-17 16:37:30.729973	4	26
129	2017-05-17 16:37:30.752323	2017-05-17 16:37:30.752323	6	26
130	2017-05-17 16:37:30.774338	2017-05-17 16:37:30.774338	5	17
131	2017-05-17 16:37:30.796879	2017-05-17 16:37:30.796879	5	14
132	2017-05-17 16:37:30.818854	2017-05-17 16:37:30.818854	5	6
133	2017-05-17 16:37:30.853063	2017-05-17 16:37:30.853063	1	27
134	2017-05-17 16:37:30.875782	2017-05-17 16:37:30.875782	3	27
135	2017-05-17 16:37:30.898428	2017-05-17 16:37:30.898428	4	27
136	2017-05-17 16:37:30.919349	2017-05-17 16:37:30.919349	5	27
137	2017-05-17 16:37:30.941546	2017-05-17 16:37:30.941546	6	27
138	2017-05-17 16:37:30.96459	2017-05-17 16:37:30.96459	7	20
139	2017-05-17 16:37:30.987391	2017-05-17 16:37:30.987391	7	14
140	2017-05-17 16:37:31.009048	2017-05-17 16:37:31.009048	7	15
141	2017-05-17 16:37:31.031116	2017-05-17 16:37:31.031116	1	28
142	2017-05-17 16:37:31.052785	2017-05-17 16:37:31.052785	2	28
143	2017-05-17 16:37:31.086966	2017-05-17 16:37:31.086966	3	28
144	2017-05-17 16:37:31.109365	2017-05-17 16:37:31.109365	4	28
145	2017-05-17 16:37:31.142737	2017-05-17 16:37:31.142737	6	28
146	2017-05-17 16:37:31.165034	2017-05-17 16:37:31.165034	1	29
147	2017-05-17 16:37:31.186519	2017-05-17 16:37:31.186519	2	29
148	2017-05-17 16:37:31.208143	2017-05-17 16:37:31.208143	3	29
149	2017-05-17 16:37:31.231735	2017-05-17 16:37:31.231735	4	29
150	2017-05-17 16:37:31.253955	2017-05-17 16:37:31.253955	6	29
151	2017-05-17 16:37:31.275542	2017-05-17 16:37:31.275542	8	1
152	2017-05-17 16:37:31.298294	2017-05-17 16:37:31.298294	8	4
153	2017-05-17 16:37:31.319045	2017-05-17 16:37:31.319045	8	5
154	2017-05-17 16:37:31.340765	2017-05-17 16:37:31.340765	8	6
155	2017-05-17 16:37:31.363497	2017-05-17 16:37:31.363497	8	7
156	2017-05-17 16:37:31.387293	2017-05-17 16:37:31.387293	8	8
157	2017-05-17 16:37:31.407837	2017-05-17 16:37:31.407837	8	9
158	2017-05-17 16:37:31.429614	2017-05-17 16:37:31.429614	8	10
159	2017-05-17 16:37:31.464198	2017-05-17 16:37:31.464198	8	11
160	2017-05-17 16:37:31.486077	2017-05-17 16:37:31.486077	8	12
161	2017-05-17 16:37:31.520613	2017-05-17 16:37:31.520613	8	13
162	2017-05-17 16:37:31.598374	2017-05-17 16:37:31.598374	8	14
163	2017-05-17 16:37:31.681141	2017-05-17 16:37:31.681141	8	15
164	2017-05-17 16:37:31.709341	2017-05-17 16:37:31.709341	8	16
165	2017-05-17 16:37:31.731819	2017-05-17 16:37:31.731819	8	17
166	2017-05-17 16:37:31.754095	2017-05-17 16:37:31.754095	8	20
167	2017-05-17 16:37:31.774658	2017-05-17 16:37:31.774658	8	22
168	2017-05-17 16:37:31.798178	2017-05-17 16:37:31.798178	8	24
169	2017-05-17 16:37:31.819657	2017-05-17 16:37:31.819657	8	26
170	2017-05-17 16:37:31.843185	2017-05-17 16:37:31.843185	8	27
171	2017-05-17 16:37:31.865038	2017-05-17 16:37:31.865038	9	1
172	2017-05-17 16:37:31.886463	2017-05-17 16:37:31.886463	9	4
173	2017-05-17 16:37:31.909452	2017-05-17 16:37:31.909452	9	5
174	2017-05-17 16:37:31.931772	2017-05-17 16:37:31.931772	9	6
175	2017-05-17 16:37:31.954326	2017-05-17 16:37:31.954326	9	7
176	2017-05-17 16:37:31.97595	2017-05-17 16:37:31.97595	9	8
177	2017-05-17 16:37:31.99707	2017-05-17 16:37:31.99707	9	9
178	2017-05-17 16:37:32.019989	2017-05-17 16:37:32.019989	9	10
179	2017-05-17 16:37:32.041606	2017-05-17 16:37:32.041606	9	11
180	2017-05-17 16:37:32.064615	2017-05-17 16:37:32.064615	9	12
181	2017-05-17 16:37:32.087483	2017-05-17 16:37:32.087483	9	13
182	2017-05-17 16:37:32.109009	2017-05-17 16:37:32.109009	9	14
183	2017-05-17 16:37:32.131273	2017-05-17 16:37:32.131273	9	15
184	2017-05-17 16:37:32.154226	2017-05-17 16:37:32.154226	9	16
185	2017-05-17 16:37:32.175994	2017-05-17 16:37:32.175994	9	17
186	2017-05-17 16:37:32.198716	2017-05-17 16:37:32.198716	9	20
187	2017-05-17 16:37:32.222686	2017-05-17 16:37:32.222686	9	22
188	2017-05-17 16:37:32.253052	2017-05-17 16:37:32.253052	9	24
189	2017-05-17 16:37:32.275406	2017-05-17 16:37:32.275406	9	26
190	2017-05-17 16:37:32.297389	2017-05-17 16:37:32.297389	9	27
191	2017-05-17 16:37:32.320223	2017-05-17 16:37:32.320223	9	28
192	2017-05-17 16:37:32.343203	2017-05-17 16:37:32.343203	9	29
193	2017-05-17 16:37:32.365169	2017-05-17 16:37:32.365169	10	1
194	2017-05-17 16:37:32.386362	2017-05-17 16:37:32.386362	10	4
195	2017-05-17 16:37:32.40966	2017-05-17 16:37:32.40966	10	5
196	2017-05-17 16:37:32.430952	2017-05-17 16:37:32.430952	10	6
197	2017-05-17 16:37:32.454167	2017-05-17 16:37:32.454167	10	7
198	2017-05-17 16:37:32.476303	2017-05-17 16:37:32.476303	10	8
199	2017-05-17 16:37:32.498746	2017-05-17 16:37:32.498746	10	9
200	2017-05-17 16:37:32.520107	2017-05-17 16:37:32.520107	10	10
201	2017-05-17 16:37:32.543017	2017-05-17 16:37:32.543017	10	11
202	2017-05-17 16:37:32.564386	2017-05-17 16:37:32.564386	10	12
203	2017-05-17 16:37:32.587498	2017-05-17 16:37:32.587498	10	13
204	2017-05-17 16:37:32.609737	2017-05-17 16:37:32.609737	10	14
205	2017-05-17 16:37:32.631572	2017-05-17 16:37:32.631572	10	15
206	2017-05-17 16:37:32.65302	2017-05-17 16:37:32.65302	10	16
207	2017-05-17 16:37:32.675732	2017-05-17 16:37:32.675732	10	17
208	2017-05-17 16:37:32.696817	2017-05-17 16:37:32.696817	10	20
209	2017-05-17 16:37:32.720602	2017-05-17 16:37:32.720602	10	22
210	2017-05-17 16:37:32.742177	2017-05-17 16:37:32.742177	10	24
211	2017-05-17 16:37:32.764578	2017-05-17 16:37:32.764578	10	26
212	2017-05-17 16:37:32.787071	2017-05-17 16:37:32.787071	10	27
213	2017-05-17 16:37:32.809251	2017-05-17 16:37:32.809251	11	5
214	2017-05-17 16:37:32.831943	2017-05-17 16:37:32.831943	11	10
215	2017-05-17 16:37:32.853527	2017-05-17 16:37:32.853527	11	13
216	2017-05-17 16:37:32.874868	2017-05-17 16:37:32.874868	11	14
217	2017-05-17 16:37:32.898043	2017-05-17 16:37:32.898043	11	15
218	2017-05-17 16:37:32.92063	2017-05-17 16:37:32.92063	11	16
219	2017-05-17 16:37:32.943165	2017-05-17 16:37:32.943165	11	17
220	2017-05-17 16:37:32.96482	2017-05-17 16:37:32.96482	11	28
221	2017-05-17 16:37:32.986681	2017-05-17 16:37:32.986681	11	29
222	2017-05-17 16:37:33.008807	2017-05-17 16:37:33.008807	12	5
223	2017-05-17 16:37:33.031068	2017-05-17 16:37:33.031068	12	10
224	2017-05-17 16:37:33.05422	2017-05-17 16:37:33.05422	12	13
225	2017-05-17 16:37:33.075523	2017-05-17 16:37:33.075523	12	14
226	2017-05-17 16:37:33.098849	2017-05-17 16:37:33.098849	12	16
227	2017-05-17 16:37:33.119399	2017-05-17 16:37:33.119399	13	20
228	2017-05-17 16:37:33.142359	2017-05-17 16:37:33.142359	13	27
229	2017-05-17 16:37:33.164618	2017-05-17 16:37:33.164618	14	20
230	2017-05-17 16:37:33.188172	2017-05-17 16:37:33.188172	15	20
231	2017-05-17 16:37:33.209027	2017-05-17 16:37:33.209027	15	27
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
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.044983	2017-05-17 16:37:14.044983	1	1	1	1	5	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.146944	2017-05-17 16:37:14.146944	1	1	1	1	4	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.224492	2017-05-17 16:37:14.224492	1	1	1	1	3	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.303043	2017-05-17 16:37:14.303043	1	1	1	1	2	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.395098	2017-05-17 16:37:14.395098	1	1	1	1	1	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.480793	2017-05-17 16:37:14.480793	1	1	1	1	4	1	7
7	EMP-007	Maria	Gonzalez	36134076	1991-11-05	176	7141			4401604	mg@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.559614	2017-05-17 16:37:14.559614	1	1	1	1	5	1	8
8	EMP-008	Elena	Ceballos	25198461	1974-05-06	Tereré	7302	4	B	4355987	ec@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.648008	2017-05-17 16:37:14.648008	1	1	1	1	4	1	7
9	EMP-009	Alberto	Padilla	33843657	1986-10-17	Rivera	6872			459885	ap@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.723692	2017-05-17 16:37:14.723692	1	1	1	1	3	1	4
10	EMP-010	Fernando	Gonzalez	33980912	1987-01-21	Tereré	1187			4456980	fg@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.80369	2017-05-17 16:37:14.80369	1	1	1	1	2	1	3
11	EMP-011	Tiago	Gonzalez	38187222	1995-06-08	Castilla	8299	10	15	4444176	tiagogonzales@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.88081	2017-05-17 16:37:14.88081	1	1	1	1	1	1	2
12	EMP-012	Cintia	Castro	22612413	1970-02-20	Av. Andalucia	7415	12	A	4255987	cintiacastro@gmail.com	Empleado	Empleado	2017-05-17 16:37:14.968689	2017-05-17 16:37:14.968689	1	1	1	1	4	1	7
13	EMP-013	Josefina	Jardin	36025176	1991-11-05	176	7141			4401604	josefinajardin@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.046391	2017-05-17 16:37:15.046391	1	1	1	1	5	1	8
14	EMP-014	Diana	Rivas	25948001	1974-05-06	Tereré	7302	4	B	4355987	dianarivas@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.124654	2017-05-17 16:37:15.124654	1	1	1	1	4	1	7
15	EMP-015	Dario	Gonzalez	33880019	1986-10-17	Rivera	6872			459885	dariogonzalez@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.220189	2017-05-17 16:37:15.220189	1	1	1	1	3	1	4
16	EMP-016	Ciro	Zamora	33983707	1987-01-21	Tereré	1187			4456980	cirozamora@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.305382	2017-05-17 16:37:15.305382	1	1	1	1	2	1	3
17	EMP-017	Zoe	Vazquez	3818104	1995-06-08	Castilla	8299	10	15	4444176	zoevazquez@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.394835	2017-05-17 16:37:15.394835	1	1	1	1	1	1	2
18	EMP-018	Cristian	Gonzalez	22659193	1970-02-20	Av. Andalucia	7415	12	A	4255987	cristiangonzalez@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.483863	2017-05-17 16:37:15.483863	1	1	1	1	4	1	7
19	EMP-019	Ana	Manfrin	36222076	1991-11-05	176	7141			4401604	anamanfrin@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.557813	2017-05-17 16:37:15.557813	1	1	1	1	5	1	8
20	EMP-020	Martina	Adamo	25841001	1974-05-06	Tereré	7302	4	B	4355987	martinaadamo@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.640568	2017-05-17 16:37:15.640568	1	1	1	1	4	1	7
21	EMP-021	Roberto	Milani	33880333	1986-10-17	Rivera	6872			459885	robertomilani@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.725105	2017-05-17 16:37:15.725105	1	1	1	1	3	1	4
22	EMP-022	Victor	Gonzalez	33984447	1987-01-21	Tereré	1187			4456980	victorgonzalez@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.806288	2017-05-17 16:37:15.806288	1	1	1	1	2	1	3
23	EMP-023	Alejandro	Cambril	38113409	1995-06-08	Castilla	8299	10	15	4444176	alejandrocambril@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.883116	2017-05-17 16:37:15.883116	1	1	1	1	1	1	2
24	EMP-024	Luis	Rizzo	22543493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luisrizzo@gmail.com	Empleado	Empleado	2017-05-17 16:37:15.961676	2017-05-17 16:37:15.961676	1	1	1	1	4	1	7
25	EMP-025	Mario	Rosas	36060986	1991-11-05	176	7141			4401604	mariorosas@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.039027	2017-05-17 16:37:16.039027	1	1	1	1	5	1	8
26	EMP-026	Analia	Granados	25131701	1974-05-06	Tereré	7302	4	B	4355987	analiagranados@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.117349	2017-05-17 16:37:16.117349	1	1	1	1	4	1	7
27	EMP-027	Leonor	Gonzalez	33888717	1986-10-17	Rivera	6872			459885	leonorgonzalez@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.227289	2017-05-17 16:37:16.227289	1	1	1	1	3	1	4
28	EMP-028	Victor	Baresi	33928407	1987-01-21	Tereré	1187			4456980	victorbaresi@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.303898	2017-05-17 16:37:16.303898	1	1	1	1	2	1	3
29	EMP-029	Silvana	Lazzaga	38918849	1995-06-08	Castilla	8299	10	15	4444176	silvanalazzaga@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.39161	2017-05-17 16:37:16.39161	1	1	1	1	1	1	2
30	EMP-030	Juana	Calabrese	220192493	1970-02-20	Av. Andalucia	7415	12	A	4255987	janacalabrese@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.47077	2017-05-17 16:37:16.47077	1	1	1	1	4	1	7
31	EMP-031	Juliana	Lombardi	38613849	1995-06-08	Castilla	8299	10	15	4444176	julianalombardi@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.559	2017-05-17 16:37:16.559	1	1	1	1	1	1	2
32	EMP-032	Enrique	Cano	22451493	1970-02-20	Av. Andalucia	7415	12	A	4255987	enriquecano@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.637288	2017-05-17 16:37:16.637288	1	1	1	1	4	1	7
33	EMP-033	Gilda	Lombarde	36064356	1991-11-05	176	7141			4401604	gildalombarde@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.715215	2017-05-17 16:37:16.715215	1	1	1	1	5	1	8
34	EMP-034	Martin	Bande	25124501	1974-05-06	Tereré	7302	4	B	4355987	martinbande@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.793101	2017-05-17 16:37:16.793101	1	1	1	1	4	1	7
35	EMP-035	Gabriel	Ferruccio	33451657	1986-10-17	Rivera	6872			459885	gabrielferuccio@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.869683	2017-05-17 16:37:16.869683	1	1	1	1	3	1	4
36	EMP-036	Juan	Mazzanti	33956107	1987-01-21	Tereré	1187			4456980	juanmazzanti@gmail.com	Empleado	Empleado	2017-05-17 16:37:16.949393	2017-05-17 16:37:16.949393	1	1	1	1	2	1	3
37	EMP-037	Karina	Fiorentino	38663849	1995-06-08	Castilla	8299	10	15	4444176	karinafiorentino@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.026119	2017-05-17 16:37:17.026119	1	1	1	1	1	1	2
38	EMP-038	Osvaldo	Pagnotto	22019493	1970-02-20	Av. Andalucia	7415	12	A	4255987	osvaldopagnotto@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.105964	2017-05-17 16:37:17.105964	1	1	1	1	4	1	7
39	EMP-039	Margarita	Giordano	36068886	1991-11-05	176	7141			4401604	margaritagiordano@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.185035	2017-05-17 16:37:17.185035	1	1	1	1	5	1	8
40	EMP-040	Rosa	Napolitano	2576401	1974-05-06	Tereré	7302	4	B	4355987	rosanapolitano@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.273662	2017-05-17 16:37:17.273662	1	1	1	1	4	1	7
41	EMP-041	Magdalena	Bruno	38817849	1995-06-08	Castilla	8299	10	15	4444176	mardalenabruno@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.362155	2017-05-17 16:37:17.362155	1	1	1	1	1	1	2
42	EMP-042	Mauricio	Costa	22755493	1970-02-20	Av. Andalucia	7415	12	A	4255987	mauriciocosta@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.437562	2017-05-17 16:37:17.437562	1	1	1	1	4	1	7
43	EMP-043	Ivan	Costas	36755076	1991-11-05	176	7141			4401604	ivancostas@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.514998	2017-05-17 16:37:17.514998	1	1	1	1	5	1	8
44	EMP-044	Pablo	Davide	251934401	1974-05-06	Tereré	7302	4	B	4355987	pablodavide@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.593308	2017-05-17 16:37:17.593308	1	1	1	1	4	1	7
45	EMP-045	Nicolas	Medina	33801927	1986-10-17	Rivera	6872			459885	nicolasmedina@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.681371	2017-05-17 16:37:17.681371	1	1	1	1	3	1	4
46	EMP-046	Celeste	Milano	35122307	1987-01-21	Tereré	1187			4456980	celestemilano@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.764703	2017-05-17 16:37:17.764703	1	1	1	1	2	1	3
47	EMP-047	Sebastian	Schiavone	38175649	1995-06-08	Castilla	8299	10	15	4444176	sebastianschiavone@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.861047	2017-05-17 16:37:17.861047	1	1	1	1	1	1	2
48	EMP-048	Ruben	Almedina	22891493	1970-02-20	Av. Andalucia	7415	12	A	4255987	rubenalmedina@gmail.com	Empleado	Empleado	2017-05-17 16:37:17.94066	2017-05-17 16:37:17.94066	1	1	1	1	4	1	7
49	EMP-049	Cristian	Camiño	36093716	1991-11-05	176	7141			4401604	cristiancamiño@gmail.com	Empleado	Empleado	2017-05-17 16:37:18.030116	2017-05-17 16:37:18.030116	1	1	1	1	5	1	8
50	EMP-050	Monica	Conti	25888001	1974-05-06	Tereré	7302	4	B	4355987	monicaconti@gmail.com	Empleado	Empleado	2017-05-17 16:37:18.114945	2017-05-17 16:37:18.114945	1	1	1	1	4	1	7
51	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.250171	2017-05-17 16:37:18.250171	1	1	2	2	\N	1	\N
52	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.336642	2017-05-17 16:37:18.336642	1	1	2	1	\N	1	\N
53	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.460768	2017-05-17 16:37:18.460768	1	1	2	1	\N	1	\N
54	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.537856	2017-05-17 16:37:18.537856	1	1	2	1	\N	1	\N
55	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.616248	2017-05-17 16:37:18.616248	1	1	2	1	\N	1	\N
56	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.692381	2017-05-17 16:37:18.692381	1	1	2	2	\N	1	\N
57	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.771722	2017-05-17 16:37:18.771722	1	1	2	1	\N	1	\N
58	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.859543	2017-05-17 16:37:18.859543	1	1	2	1	\N	1	\N
59	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:18.938156	2017-05-17 16:37:18.938156	1	1	2	1	\N	1	\N
60	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.026514	2017-05-17 16:37:19.026514	1	1	2	2	\N	1	\N
61	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.105236	2017-05-17 16:37:19.105236	1	1	2	1	\N	1	\N
62	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.194679	2017-05-17 16:37:19.194679	1	1	2	1	\N	1	\N
63	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.271804	2017-05-17 16:37:19.271804	1	1	2	1	\N	1	\N
64	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.348849	2017-05-17 16:37:19.348849	1	1	2	2	\N	1	\N
65	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.42748	2017-05-17 16:37:19.42748	1	1	2	1	\N	1	\N
66	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.517554	2017-05-17 16:37:19.517554	1	1	2	1	\N	1	\N
67	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.595828	2017-05-17 16:37:19.595828	1	1	2	1	\N	1	\N
68	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.682203	2017-05-17 16:37:19.682203	1	1	2	2	\N	1	\N
69	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.764498	2017-05-17 16:37:19.764498	1	1	2	1	\N	1	\N
70	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.838746	2017-05-17 16:37:19.838746	1	1	2	1	\N	1	\N
71	ME-021	Lidia	Delucci	28088944	1981-01-29	Chile	6144			481898	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.916325	2017-05-17 16:37:19.916325	1	1	2	1	\N	1	\N
72	ME-022	Leonor	Gomez Santos	40560231	1996-03-13	Plaza Mayor	2637			4536662	leonorgs@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:19.994786	2017-05-17 16:37:19.994786	1	1	2	1	\N	1	\N
73	ME-023	Lara	Gonçalves	29075344	1980-07-19	España	1415			4498457	laragoncalves@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.072045	2017-05-17 16:37:20.072045	1	1	2	1	\N	1	\N
74	ME-024	Martin	Diaz	26070390	1976-08-11	calle Nueva	1826			491088	martindiaz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.14941	2017-05-17 16:37:20.14941	1	1	2	1	\N	1	\N
75	ME-025	Marina	Diaz	26070394	1976-08-11	calle Nueva	1826			491088	marinadiaz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.237704	2017-05-17 16:37:20.237704	1	1	2	1	\N	1	\N
76	ME-026	Gerardo	Urbina	29234987	1980-05-31	Álamo	6162			455433	gerardou@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.317006	2017-05-17 16:37:20.317006	1	1	2	1	\N	1	\N
77	ME-027	Silvio	Quiroz	35465922	1990-02-27	Álamo	2128			415176	silvioquiroz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.407576	2017-05-17 16:37:20.407576	1	1	2	1	\N	1	\N
78	ME-028	Gabriela	Garcia	33457976	1987-12-19	Alem	123			451912	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.493405	2017-05-17 16:37:20.493405	1	1	2	1	\N	1	\N
79	ME-029	Leonardo	Rios	29524865	1981-11-30	Concepcion	5139			4590871	lidiadelucci@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.581291	2017-05-17 16:37:20.581291	1	1	2	1	\N	1	\N
80	ME-030	Ubaldo	Gomez	34123456	1990-04-08	Entre Rios	1235			456798	ubaldogomez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.706386	2017-05-17 16:37:20.706386	1	1	2	1	\N	1	\N
81	ME-031	Silvio	Gonzalez	29092236	1980-05-16	Cordoba	7213			4501923	silviogonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.796519	2017-05-17 16:37:20.796519	1	1	2	1	\N	1	\N
82	ME-032	Rosa	Fernandez	20112254	1968-09-13	San Martin	1028			4567895	rosafernandez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.885237	2017-05-17 16:37:20.885237	1	1	2	1	\N	1	\N
83	ME-033	Alejandro	Fernandez	20998871	1987-05-16	Santa Fe	4812			4311235	alefernandez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:20.970942	2017-05-17 16:37:20.970942	1	1	2	1	\N	1	\N
84	ME-034	Hugo	Rios	40034940	1998-11-30	Alvear	5028			481341	hugorios@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.053232	2017-05-17 16:37:21.053232	1	1	2	1	\N	1	\N
85	ME-035	Mario	Garcia	24654447	1976-04-08	Roca	193			4212351	mariogarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.140372	2017-05-17 16:37:21.140372	1	1	2	1	\N	1	\N
86	ME-036	Marina	Moralez	36421952	1992-08-19	Ucrania	9371			451241	marimamoralez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.217246	2017-05-17 16:37:21.217246	1	1	2	1	\N	1	\N
87	ME-037	Silvina	Portillo	26498388	1976-06-05	Av Queirel	7621			431214	silvinaportillo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.303765	2017-05-17 16:37:21.303765	1	1	2	1	\N	1	\N
88	ME-038	Maria	Maciel	33428434	1989-09-04	Paraguay	600			4761602	mariamaciel@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.386383	2017-05-17 16:37:21.386383	1	1	2	1	\N	1	\N
89	ME-039	Angeles	Granados	31452518	1981-04-09	Uruguay	12			481858	angelesgranados@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.476119	2017-05-17 16:37:21.476119	1	1	2	1	\N	1	\N
90	ME-040	Cintia	Gutierrez	29701192	1992-11-05	Av Roca	464			483498	cintiagutierrez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.633354	2017-05-17 16:37:21.633354	1	1	2	1	\N	1	\N
91	ME-041	David	Sedillo	36371823	1975-07-23	Centenario	6135			481018	davidsedillo@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.729042	2017-05-17 16:37:21.729042	1	1	2	1	\N	1	\N
92	ME-042	Sofia	Garcia	25370180	1998-01-13	Las Flores	1234			409498	sofiagarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.805888	2017-05-17 16:37:21.805888	1	1	2	1	\N	1	\N
93	ME-043	Alicia	Villalba	27455263	1979-04-17	Las Palmeras	9876			420184	alivillalba@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.893886	2017-05-17 16:37:21.893886	1	1	2	1	\N	1	\N
94	ME-044	Luis	Gonzalez	36182911	1992-06-19	Las Orquideas	900			495712	luisgonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:21.976727	2017-05-17 16:37:21.976727	1	1	2	1	\N	1	\N
95	ME-045	Ernesto	Da Luz	30346514	1983-06-19	Rosas	2463			413048	ernestodaluz@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:22.063624	2017-05-17 16:37:22.063624	1	1	2	1	\N	1	\N
96	ME-046	Luciano	Garcia	39019733	1996-03-13	Colon	8123			412451	lucianogarcia@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:22.149314	2017-05-17 16:37:22.149314	1	1	2	1	\N	1	\N
97	ME-047	Gerardo	Cano	29232117	1980-07-19	Escuelita	9173			462093	gerardocano@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:22.239824	2017-05-17 16:37:22.239824	1	1	2	1	\N	1	\N
98	ME-048	Hector	Rincon	29222287	1980-05-31	Japon	2546			471927	hectorrincon@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:22.316786	2017-05-17 16:37:22.316786	1	1	2	1	\N	1	\N
99	ME-049	Alberto	Gonzalez	35225922	1990-02-27	Colombia	2871			431570	albertogonzalez@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:22.395671	2017-05-17 16:37:22.395671	1	1	2	1	\N	1	\N
100	ME-050	Roberto	Lujan	35461122	1990-05-27	Noruega	1980			401938	robertolujan@gmail.com	MiembroEquipo	MiembroEquipo	2017-05-17 16:37:22.472595	2017-05-17 16:37:22.472595	1	1	2	1	\N	1	\N
101	CO-001	María Rosa	Conti	25644132	1975-07-03	Ituzaingo	245	12	B	424568	mrconti@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.431677	2017-05-17 16:37:54.431677	1	1	1	1	\N	1	\N
102	CO-002	Berta	Rivera	33958772	1989-04-11	Leandro Gómez	5886	\N	\N	4598765	brivera@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.530668	2017-05-17 16:37:54.530668	1	1	1	2	\N	1	\N
103	CO-003	Juliana	Castiglione	30444512	1980-12-09	Brisas	3280	3	20	555321	jcastiglione@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.622102	2017-05-17 16:37:54.622102	1	1	1	1	\N	1	\N
104	CO-004	Nahuel	Estevez	19423568	1966-11-28	Av. Alta Gracia	5332	\N	\N	154632108	nestevez@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.707841	2017-05-17 16:37:54.707841	1	1	1	2	\N	1	\N
105	CO-005	Pablo	Gomez	25221305	1970-03-05	Neruda	7393	8	A	154245689	pablogomez@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.799782	2017-05-17 16:37:54.799782	1	1	1	1	\N	1	\N
106	CO-006	Abigail	Coronado	37926793	1994-03-21	Florencio Varela	5659	\N	\N	432666	abigailcoronado@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.885295	2017-05-17 16:37:54.885295	1	1	1	1	\N	1	\N
107	CO-007	Hilda	Zielinski	25334991	1970-04-07	Joaquin Suarez	6863	6	15	4478909	hildazielinski@gmail.com	Contacto	Contacto	2017-05-17 16:37:54.976569	2017-05-17 16:37:54.976569	1	1	1	1	\N	1	\N
108	CO-008	Antonio	Goncalves Melo	34008128	1989-05-29	Maldonado	2757	\N	\N	4498049	antoniogm@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.068463	2017-05-17 16:37:55.068463	1	1	1	1	\N	1	\N
109	CO-009	Isabela	Correa	41889321	1997-11-04	Marejada	5656	\N	\N	4482122	isacorrea@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.153402	2017-05-17 16:37:55.153402	1	1	1	1	\N	1	\N
110	CO-010	Franco	Maur	41336729	1997-03-04	Corrientes	314	\N	\N	4498049	francomaur@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.245734	2017-05-17 16:37:55.245734	1	1	1	1	\N	1	\N
111	CO-011	Felix	Baer	30228128	1980-08-16	Maldonado	9000	\N	\N	4601406	felixbaer@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.333292	2017-05-17 16:37:55.333292	1	1	1	1	\N	1	\N
112	CO-012	Eileen	Macías Vargas	39756412	1996-01-19	Yapeyú	3778	\N	\N	497986	mercedesgarcia@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.426041	2017-05-17 16:37:55.426041	1	1	1	1	\N	1	\N
113	CO-013	Mercedes	García	34561928	1989-05-29	Maldonado	2757	\N	\N	5557120	antoniogm@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.509376	2017-05-17 16:37:55.509376	1	1	1	1	\N	1	\N
114	CO-014	Clea	Espino	24666124	1975-08-04	Tomás Guido	8740	\N	\N	4981777	cleaespino@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.59752	2017-05-17 16:37:55.59752	1	1	1	1	\N	1	\N
115	CO-015	Paul	Flores Acosta	31672155	1985-06-21	Resistencia	1813	\N	\N	4231456	paulfloresacosta@gmail.com	Contacto	Contacto	2017-05-17 16:37:55.689529	2017-05-17 16:37:55.689529	1	1	1	1	\N	1	\N
\.


--
-- Data for Name: personas_especialidades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_especialidades (id, created_at, updated_at, persona_id, especialidad_de_contacto_id) FROM stdin;
1	2017-05-17 16:37:55.787686	2017-05-17 16:37:55.787686	101	1
2	2017-05-17 16:37:55.814792	2017-05-17 16:37:55.814792	101	5
3	2017-05-17 16:37:55.837845	2017-05-17 16:37:55.837845	102	2
4	2017-05-17 16:37:55.859187	2017-05-17 16:37:55.859187	102	11
5	2017-05-17 16:37:55.882043	2017-05-17 16:37:55.882043	103	2
6	2017-05-17 16:37:55.903154	2017-05-17 16:37:55.903154	103	3
7	2017-05-17 16:37:55.925206	2017-05-17 16:37:55.925206	103	10
8	2017-05-17 16:37:55.947921	2017-05-17 16:37:55.947921	104	3
9	2017-05-17 16:37:55.969745	2017-05-17 16:37:55.969745	104	8
10	2017-05-17 16:37:55.993102	2017-05-17 16:37:55.993102	104	9
11	2017-05-17 16:37:56.014506	2017-05-17 16:37:56.014506	104	10
12	2017-05-17 16:37:56.037678	2017-05-17 16:37:56.037678	105	7
13	2017-05-17 16:37:56.059484	2017-05-17 16:37:56.059484	106	2
14	2017-05-17 16:37:56.08194	2017-05-17 16:37:56.08194	106	3
15	2017-05-17 16:37:56.103112	2017-05-17 16:37:56.103112	106	4
16	2017-05-17 16:37:56.125592	2017-05-17 16:37:56.125592	107	6
17	2017-05-17 16:37:56.148099	2017-05-17 16:37:56.148099	107	7
18	2017-05-17 16:37:56.170605	2017-05-17 16:37:56.170605	108	1
19	2017-05-17 16:37:56.192506	2017-05-17 16:37:56.192506	108	12
20	2017-05-17 16:37:56.21439	2017-05-17 16:37:56.21439	109	1
21	2017-05-17 16:37:56.237444	2017-05-17 16:37:56.237444	109	7
22	2017-05-17 16:37:56.259797	2017-05-17 16:37:56.259797	110	3
23	2017-05-17 16:37:56.281744	2017-05-17 16:37:56.281744	110	9
24	2017-05-17 16:37:56.303135	2017-05-17 16:37:56.303135	111	1
25	2017-05-17 16:37:56.326672	2017-05-17 16:37:56.326672	111	2
26	2017-05-17 16:37:56.348882	2017-05-17 16:37:56.348882	111	11
27	2017-05-17 16:37:56.369255	2017-05-17 16:37:56.369255	112	4
28	2017-05-17 16:37:56.415501	2017-05-17 16:37:56.415501	113	2
29	2017-05-17 16:37:56.441387	2017-05-17 16:37:56.441387	113	4
30	2017-05-17 16:37:56.604795	2017-05-17 16:37:56.604795	114	7
31	2017-05-17 16:37:56.728644	2017-05-17 16:37:56.728644	114	12
32	2017-05-17 16:37:56.770728	2017-05-17 16:37:56.770728	115	8
\.


--
-- Name: personas_especialidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_especialidades_id_seq', 32, true);


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
1	2017-05-17 16:37:57.287636	2017-05-17 16:37:57.287636	1	103
2	2017-05-17 16:37:57.319421	2017-05-17 16:37:57.319421	1	104
3	2017-05-17 16:37:57.38105	2017-05-17 16:37:57.38105	1	110
4	2017-05-17 16:37:57.403669	2017-05-17 16:37:57.403669	1	115
5	2017-05-17 16:37:57.427113	2017-05-17 16:37:57.427113	2	101
6	2017-05-17 16:37:57.453419	2017-05-17 16:37:57.453419	2	108
7	2017-05-17 16:37:57.480814	2017-05-17 16:37:57.480814	2	109
8	2017-05-17 16:37:57.503393	2017-05-17 16:37:57.503393	2	111
9	2017-05-17 16:37:57.52636	2017-05-17 16:37:57.52636	2	114
10	2017-05-17 16:56:55.906262	2017-05-17 16:56:55.906262	3	102
11	2017-05-17 19:22:20.271093	2017-05-17 19:22:20.271093	4	102
12	2017-05-17 19:22:20.293008	2017-05-17 19:22:20.293008	4	108
\.


--
-- Name: personas_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_eventos_id_seq', 12, true);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 115, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-05-17 16:37:25.113607	2017-05-17 16:37:25.113607	1	51
2	2017-05-17 16:37:25.139213	2017-05-17 16:37:25.139213	1	2
3	2017-05-17 16:37:25.162029	2017-05-17 16:37:25.162029	2	2
4	2017-05-17 16:37:25.183406	2017-05-17 16:37:25.183406	2	52
5	2017-05-17 16:37:25.206305	2017-05-17 16:37:25.206305	2	53
6	2017-05-17 16:37:25.227326	2017-05-17 16:37:25.227326	3	6
7	2017-05-17 16:37:25.249993	2017-05-17 16:37:25.249993	3	54
8	2017-05-17 16:37:25.272523	2017-05-17 16:37:25.272523	3	55
9	2017-05-17 16:37:25.294837	2017-05-17 16:37:25.294837	4	6
10	2017-05-17 16:37:25.317374	2017-05-17 16:37:25.317374	4	56
11	2017-05-17 16:37:25.338949	2017-05-17 16:37:25.338949	4	57
12	2017-05-17 16:37:25.362125	2017-05-17 16:37:25.362125	5	2
13	2017-05-17 16:37:25.383012	2017-05-17 16:37:25.383012	5	58
14	2017-05-17 16:37:25.405386	2017-05-17 16:37:25.405386	5	59
15	2017-05-17 16:37:25.42845	2017-05-17 16:37:25.42845	6	2
16	2017-05-17 16:37:25.450966	2017-05-17 16:37:25.450966	6	60
17	2017-05-17 16:37:25.473159	2017-05-17 16:37:25.473159	6	61
18	2017-05-17 16:37:25.494485	2017-05-17 16:37:25.494485	6	62
19	2017-05-17 16:37:25.517588	2017-05-17 16:37:25.517588	7	6
20	2017-05-17 16:37:25.539043	2017-05-17 16:37:25.539043	7	63
21	2017-05-17 16:37:25.562109	2017-05-17 16:37:25.562109	7	64
22	2017-05-17 16:37:25.584034	2017-05-17 16:37:25.584034	8	2
23	2017-05-17 16:37:25.606338	2017-05-17 16:37:25.606338	8	65
24	2017-05-17 16:37:25.6278	2017-05-17 16:37:25.6278	9	6
25	2017-05-17 16:37:25.650819	2017-05-17 16:37:25.650819	9	66
26	2017-05-17 16:37:25.672245	2017-05-17 16:37:25.672245	9	67
27	2017-05-17 16:37:25.694765	2017-05-17 16:37:25.694765	10	2
28	2017-05-17 16:37:25.717561	2017-05-17 16:37:25.717561	10	68
29	2017-05-17 16:37:25.739339	2017-05-17 16:37:25.739339	10	69
30	2017-05-17 16:37:25.76209	2017-05-17 16:37:25.76209	10	70
31	2017-05-17 16:37:25.783264	2017-05-17 16:37:25.783264	11	71
32	2017-05-17 16:37:25.805284	2017-05-17 16:37:25.805284	11	72
33	2017-05-17 16:37:25.828132	2017-05-17 16:37:25.828132	11	8
34	2017-05-17 16:37:25.85016	2017-05-17 16:37:25.85016	12	57
35	2017-05-17 16:37:25.872604	2017-05-17 16:37:25.872604	12	65
36	2017-05-17 16:37:25.895378	2017-05-17 16:37:25.895378	12	6
37	2017-05-17 16:37:25.91759	2017-05-17 16:37:25.91759	13	96
38	2017-05-17 16:37:25.938984	2017-05-17 16:37:25.938984	13	99
39	2017-05-17 16:37:25.961896	2017-05-17 16:37:25.961896	13	8
40	2017-05-17 16:37:25.982907	2017-05-17 16:37:25.982907	14	80
41	2017-05-17 16:37:26.005159	2017-05-17 16:37:26.005159	14	100
42	2017-05-17 16:37:26.028169	2017-05-17 16:37:26.028169	14	12
43	2017-05-17 16:37:26.05094	2017-05-17 16:37:26.05094	15	89
44	2017-05-17 16:37:26.072693	2017-05-17 16:37:26.072693	15	90
45	2017-05-17 16:37:26.095522	2017-05-17 16:37:26.095522	15	92
46	2017-05-17 16:37:26.118004	2017-05-17 16:37:26.118004	15	8
47	2017-05-17 16:37:26.139323	2017-05-17 16:37:26.139323	16	65
48	2017-05-17 16:37:26.161234	2017-05-17 16:37:26.161234	16	67
49	2017-05-17 16:37:26.183381	2017-05-17 16:37:26.183381	16	77
50	2017-05-17 16:37:26.206739	2017-05-17 16:37:26.206739	16	6
51	2017-05-17 16:37:26.228913	2017-05-17 16:37:26.228913	17	96
52	2017-05-17 16:37:26.251351	2017-05-17 16:37:26.251351	17	97
53	2017-05-17 16:37:26.273114	2017-05-17 16:37:26.273114	17	2
54	2017-05-17 16:37:26.295314	2017-05-17 16:37:26.295314	18	75
55	2017-05-17 16:37:26.317745	2017-05-17 16:37:26.317745	18	76
56	2017-05-17 16:37:26.339499	2017-05-17 16:37:26.339499	18	77
57	2017-05-17 16:37:26.362389	2017-05-17 16:37:26.362389	18	14
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 57, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-05-17 16:37:12.498917	2017-05-17 16:37:12.498917	1
2	Corrientes	2017-05-17 16:37:12.530844	2017-05-17 16:37:12.530844	1
3	Itapúa	2017-05-17 16:37:12.564092	2017-05-17 16:37:12.564092	2
4	Bahia	2017-05-17 16:37:12.584021	2017-05-17 16:37:12.584021	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-05-17 16:37:23.856368	2017-05-17 16:37:23.856368	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-05-17 16:37:23.936544	2017-05-17 16:37:23.936544	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-05-17 16:37:24.013905	2017-05-17 16:37:24.013905	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-05-17 16:37:24.091201	2017-05-17 16:37:24.091201	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-05-17 16:37:24.166897	2017-05-17 16:37:24.166897	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-05-17 16:37:24.238018	2017-05-17 16:37:24.238018	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-05-17 16:37:24.313707	2017-05-17 16:37:24.313707	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-05-17 16:37:24.378884	2017-05-17 16:37:24.378884	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-05-17 16:37:24.444658	2017-05-17 16:37:24.444658	1	1	1	1	1
11	PR-011	Percentil	Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para hacerlo en escala y poder ganar dinero con ello.	España	422			4590432	percentil@gmail.com	percentil.com	2017-05-17 16:37:24.514665	2017-05-17 16:37:24.514665	1	1	1	1	1
12	PR-012	EmbryoTools	 Son una referencia mundial en reproducción asistida. Trabajan en cuatro ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos, porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de los productos que vayan a entrar en contacto con embriones humanos y por último trabajan en la reproducción asistida en veterinaria.	Mariano Moreno	4122			465888	embryotools@gmail.com	embryotools.com	2017-05-17 16:37:24.590938	2017-05-17 16:37:24.590938	1	1	1	1	1
13	PR-013	Aplázame	 Es un método de pago que se integra en el proceso de compra del comercio electrónico y permite a los clientes de las tiendas online comprar con un crédito instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando para hacerlo en breve.	Av. San Martin	4532			453222	aplazame@gmail.com	aplazame.com	2017-05-17 16:37:24.65591	2017-05-17 16:37:24.65591	1	1	1	1	1
14	PR-014	BrioAgro Technologies	Deesarrollo de una tecnología para que el agricultor controle su explotación. El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor, a través de su dispositivo, se conecta a la nube para acceder a la información de su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier cambio en sus variables.	Colon 	555			4651244	bioagro@gmail.com	bioagro.com	2017-05-17 16:37:24.735004	2017-05-17 16:37:24.735004	1	1	1	1	1
15	PR-015	Braingaze	La tecnología desarrollada detecta un pequeño movimiento ocular que permite determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y dislexia.	Miami	708			490123	baringaze@gmail.com	braingaze.com	2017-05-17 16:37:24.800976	2017-05-17 16:37:24.800976	1	1	1	1	1
16	PR-016	CreatorStats	Mejoran la métrica de los ‘youtubers’.	Inglaterra	200			15432510	creatorstats@gmail.com	creatorstats.com	2017-05-17 16:37:24.869541	2017-05-17 16:37:24.869541	1	1	1	1	1
17	PR-017	Alzhup	Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología como vehículo para que la solución sea accesible a todo el mundo. Implementan a nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados científicamente. Y también, herramientas para la memoria, capaces de personalizar dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro almacena los recuerdos y que difiere de los sistemas actuales computarizados.	Constitucion	2222			467632	alzhup@gmail.com	alzhup.com	2017-05-17 16:37:24.944786	2017-05-17 16:37:24.944786	1	1	1	1	1
18	PR-018	Axter Aerospace	Están desarrollando un sistema de propulsión híbrida para las avionetas, que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU. De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción y ensamblado.	Ayacucho	9200			432111	axteraerospace@gmail.com	axteraerospace.com	2017-05-17 16:37:25.023422	2017-05-17 16:37:25.023422	1	1	1	1	1
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-05-17 16:37:23.777567	2017-05-17 19:15:00.912747	1	1	1	3	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 18, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-05-17 16:37:33.274162	2017-05-17 16:37:33.274162
2	super_admin	2017-05-17 16:37:33.297308	2017-05-17 16:37:33.297308
3	Encargado de Proyectos (mentor)	2017-05-17 16:37:33.320213	2017-05-17 16:37:33.320213
4	Miembro de Equipo	2017-05-17 16:37:33.341679	2017-05-17 16:37:33.341679
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-05-17 16:37:13.407522	2017-05-17 16:37:13.407522	1
2	Encargado de recaudaciones e ingresos	2017-05-17 16:37:13.46449	2017-05-17 16:37:13.46449	1
3	Jefe de Recursos Humanos	2017-05-17 16:37:13.517108	2017-05-17 16:37:13.517108	2
4	Jefe de mercadeo	2017-05-17 16:37:13.562064	2017-05-17 16:37:13.562064	3
5	jefe de producción	2017-05-17 16:37:13.620344	2017-05-17 16:37:13.620344	3
6	Investigación y desarrollo	2017-05-17 16:37:13.676201	2017-05-17 16:37:13.676201	4
7	Capacitación - Mentoring	2017-05-17 16:37:13.732134	2017-05-17 16:37:13.732134	4
8	Director General	2017-05-17 16:37:13.784945	2017-05-17 16:37:13.784945	5
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
1	5	years	4	2017-05-17 16:37:42.410912	2017-05-17 19:08:19.830631
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, true);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-05-17 16:37:12.912821	2017-05-17 16:37:12.912821
2	Libreta de Enrolamiento	2017-05-17 16:37:12.938634	2017-05-17 16:37:12.938634
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-05-17 16:37:42.104003	2017-05-17 16:37:42.104003
2	Tarjeta de crédito Visa	2017-05-17 16:37:42.162936	2017-05-17 16:37:42.162936
3	Tarjeta Naranja	2017-05-17 16:37:42.219112	2017-05-17 16:37:42.219112
4	Saldo de cuenta	2017-05-17 16:37:42.27457	2017-05-17 16:37:42.27457
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-05-17 16:37:34.341745	2017-05-17 16:37:34.341745	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-05-17 16:37:34.597491	2017-05-17 16:37:34.597491	2	1
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	1	2017-05-17 18:27:13.521597	2017-05-17 18:27:13.521597	127.0.0.1	127.0.0.1	2017-05-17 16:37:34.088272	2017-05-17 18:27:13.525909	1	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-05-17 16:37:43.406416	2017-05-17 16:37:43.406416	1	1
2	2017-01-20	2017-05-17 16:37:43.422833	2017-05-17 16:37:43.422833	1	1
3	2017-02-10	2017-05-17 16:37:43.4459	2017-05-17 16:37:43.4459	2	1
4	2017-02-20	2017-05-17 16:37:43.46717	2017-05-17 16:37:43.46717	2	1
5	2017-03-10	2017-05-17 16:37:43.490281	2017-05-17 16:37:43.490281	3	1
6	2017-03-20	2017-05-17 16:37:43.512802	2017-05-17 16:37:43.512802	3	1
7	2017-04-10	2017-05-17 16:37:43.535279	2017-05-17 16:37:43.535279	4	1
8	2017-04-20	2017-05-17 16:37:43.557431	2017-05-17 16:37:43.557431	4	1
9	2017-05-10	2017-05-17 16:37:43.578472	2017-05-17 16:37:43.578472	5	1
10	2017-05-20	2017-05-17 16:37:43.60101	2017-05-17 16:37:43.60101	5	1
11	2017-06-10	2017-05-17 16:37:43.623957	2017-05-17 16:37:43.623957	6	1
12	2017-06-20	2017-05-17 16:37:43.646595	2017-05-17 16:37:43.646595	6	1
13	2017-07-10	2017-05-17 16:37:43.667221	2017-05-17 16:37:43.667221	7	1
14	2017-07-20	2017-05-17 16:37:43.691042	2017-05-17 16:37:43.691042	7	1
15	2017-08-10	2017-05-17 16:37:43.71228	2017-05-17 16:37:43.71228	8	1
16	2017-08-20	2017-05-17 16:37:43.734936	2017-05-17 16:37:43.734936	8	1
17	2017-09-10	2017-05-17 16:37:43.757167	2017-05-17 16:37:43.757167	9	1
18	2017-09-20	2017-05-17 16:37:43.779679	2017-05-17 16:37:43.779679	9	1
19	2017-10-10	2017-05-17 16:37:43.801153	2017-05-17 16:37:43.801153	10	1
20	2017-10-20	2017-05-17 16:37:43.824013	2017-05-17 16:37:43.824013	10	1
21	2017-11-10	2017-05-17 16:37:43.855693	2017-05-17 16:37:43.855693	11	1
22	2017-11-20	2017-05-17 16:37:43.878944	2017-05-17 16:37:43.878944	11	1
23	2017-12-10	2017-05-17 16:37:43.902933	2017-05-17 16:37:43.902933	12	1
24	2017-12-20	2017-05-17 16:37:43.923906	2017-05-17 16:37:43.923906	12	1
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

