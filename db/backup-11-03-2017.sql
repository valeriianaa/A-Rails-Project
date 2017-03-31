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
    updated_at timestamp without time zone NOT NULL,
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
1	Crear	create	2017-03-01 02:44:53.806831	2017-03-01 02:44:53.806831
2	Eliminar	destroy	2017-03-01 02:44:53.838601	2017-03-01 02:44:53.838601
3	Ver	show	2017-03-01 02:44:53.87152	2017-03-01 02:44:53.87152
4	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-03-01 02:44:53.903015	2017-03-01 02:44:53.903015
5	Index	index	2017-03-01 02:44:53.927508	2017-03-01 02:44:53.927508
6	Editar	update	2017-03-01 02:44:53.959222	2017-03-01 02:44:53.959222
7	Estadisticas	estadistica	2017-03-01 02:44:53.982139	2017-03-01 02:44:53.982139
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 7, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	--- []\n	2017-03-01 02:44:49.560016	2017-03-01 02:44:49.560016	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-03-01 02:44:49.67507	2017-03-01 02:44:49.67507	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-03-01 02:44:49.778664	2017-03-01 02:44:49.778664	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-03-01 02:44:49.853815	2017-03-01 02:44:49.853815	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-03-01 02:44:49.929104	2017-03-01 02:44:49.929104	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-03-01 02:44:50.006057	2017-03-01 02:44:50.006057	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-03-01 02:44:50.088055	2017-03-01 02:44:50.088055	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-03-01 02:44:50.172486	2017-03-01 02:44:50.172486	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-03-01 02:44:50.235851	2017-03-01 02:44:50.235851	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-03-01 02:44:50.310012	2017-03-01 02:44:50.310012	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-03-01 02:44:50.394351	2017-03-01 02:44:50.394351	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-03-01 02:44:59.988842	2017-03-01 02:44:59.988842	1	1	3
2	\N	2017-03-01 02:45:00.063573	2017-03-01 02:45:00.063573	1	2	3
4	\N	2017-03-01 02:45:00.165412	2017-03-01 02:45:00.165412	2	1	3
5	\N	2017-03-01 02:45:00.219827	2017-03-01 02:45:00.219827	2	2	3
6	\N	2017-03-01 02:45:00.275243	2017-03-01 02:45:00.275243	2	3	2
7	\N	2017-03-01 02:45:00.330159	2017-03-01 02:45:00.330159	3	1	3
8	\N	2017-03-01 02:45:00.375519	2017-03-01 02:45:00.375519	3	2	3
9	\N	2017-03-01 02:45:00.431109	2017-03-01 02:45:00.431109	3	3	2
10	\N	2017-03-01 02:45:00.480114	2017-03-01 02:45:00.480114	4	1	3
11	\N	2017-03-01 02:45:00.531408	2017-03-01 02:45:00.531408	4	2	3
12	\N	2017-03-01 02:45:00.586933	2017-03-01 02:45:00.586933	4	3	2
13	\N	2017-03-01 02:45:00.641662	2017-03-01 02:45:00.641662	5	1	3
14	\N	2017-03-01 02:45:00.697248	2017-03-01 02:45:00.697248	5	2	3
15	\N	2017-03-01 02:45:00.74169	2017-03-01 02:45:00.74169	5	3	2
16	\N	2017-03-01 02:45:00.786031	2017-03-01 02:45:00.786031	6	1	3
17	\N	2017-03-01 02:45:00.831316	2017-03-01 02:45:00.831316	6	2	3
18	\N	2017-03-01 02:45:00.875039	2017-03-01 02:45:00.875039	6	3	2
19	\N	2017-03-01 02:45:00.920628	2017-03-01 02:45:00.920628	7	1	3
20	\N	2017-03-01 02:45:00.964186	2017-03-01 02:45:00.964186	7	2	3
21	\N	2017-03-01 02:45:01.008786	2017-03-01 02:45:01.008786	7	3	2
22	\N	2017-03-01 02:45:01.055457	2017-03-01 02:45:01.055457	8	1	3
23	\N	2017-03-01 02:45:01.097332	2017-03-01 02:45:01.097332	8	2	3
24	\N	2017-03-01 02:45:01.142269	2017-03-01 02:45:01.142269	8	3	2
25	\N	2017-03-01 02:45:01.186037	2017-03-01 02:45:01.186037	9	1	3
26	\N	2017-03-01 02:45:01.231179	2017-03-01 02:45:01.231179	9	2	3
27	\N	2017-03-01 02:45:01.277076	2017-03-01 02:45:01.277076	9	3	2
28	\N	2017-03-01 02:45:01.375579	2017-03-01 02:45:01.375579	10	1	3
29	\N	2017-03-01 02:45:01.42123	2017-03-01 02:45:01.42123	10	2	3
30	\N	2017-03-01 02:45:01.464084	2017-03-01 02:45:01.464084	10	3	2
31	\N	2017-03-01 02:45:01.510422	2017-03-01 02:45:01.510422	11	1	3
32	\N	2017-03-01 02:45:01.553513	2017-03-01 02:45:01.553513	11	2	3
33	\N	2017-03-01 02:45:01.598302	2017-03-01 02:45:01.598302	11	3	2
34	\N	2017-03-01 02:45:01.642111	2017-03-01 02:45:01.642111	12	1	3
35	\N	2017-03-01 02:45:01.688504	2017-03-01 02:45:01.688504	12	2	3
36	\N	2017-03-01 02:45:01.731233	2017-03-01 02:45:01.731233	12	3	2
37	\N	2017-03-01 02:45:01.775886	2017-03-01 02:45:01.775886	13	1	3
38	\N	2017-03-01 02:45:01.820302	2017-03-01 02:45:01.820302	13	2	3
39	\N	2017-03-01 02:45:01.865934	2017-03-01 02:45:01.865934	13	3	2
40	\N	2017-03-01 02:45:01.90883	2017-03-01 02:45:01.90883	14	1	3
41	\N	2017-03-01 02:45:01.954353	2017-03-01 02:45:01.954353	14	2	3
42	\N	2017-03-01 02:45:01.99844	2017-03-01 02:45:01.99844	14	3	2
43	\N	2017-03-01 02:45:02.043917	2017-03-01 02:45:02.043917	15	1	3
44	\N	2017-03-01 02:45:02.08748	2017-03-01 02:45:02.08748	15	2	3
45	\N	2017-03-01 02:45:02.142341	2017-03-01 02:45:02.142341	15	3	2
46	\N	2017-03-01 02:45:02.187455	2017-03-01 02:45:02.187455	16	1	3
47	\N	2017-03-01 02:45:02.231044	2017-03-01 02:45:02.231044	16	2	3
48	\N	2017-03-01 02:45:02.275902	2017-03-01 02:45:02.275902	16	3	2
49	\N	2017-03-01 02:45:02.334846	2017-03-01 02:45:02.334846	17	1	3
50	\N	2017-03-01 02:45:02.398481	2017-03-01 02:45:02.398481	17	2	3
51	\N	2017-03-01 02:45:02.45443	2017-03-01 02:45:02.45443	17	3	2
52	\N	2017-03-01 02:45:02.509125	2017-03-01 02:45:02.509125	18	1	3
53	\N	2017-03-01 02:45:02.552861	2017-03-01 02:45:02.552861	18	2	3
54	\N	2017-03-01 02:45:02.609202	2017-03-01 02:45:02.609202	18	3	2
3	\N	2017-03-01 02:45:00.108545	2017-03-01 09:22:35.76147	1	3	3
55	\N	2017-03-01 09:22:36.011363	2017-03-01 09:22:36.011363	1	4	\N
56	\N	2017-03-01 09:22:36.058856	2017-03-01 09:22:36.058856	1	5	\N
57	\N	2017-03-01 09:22:36.097098	2017-03-01 09:22:36.097098	1	6	\N
58	\N	2017-03-01 09:22:36.139085	2017-03-01 09:22:36.139085	1	7	\N
59	\N	2017-03-01 09:22:36.179769	2017-03-01 09:22:36.179769	1	8	\N
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 59, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-03-01 02:44:38.170173	2017-03-01 02:44:38.170173
2	Rural	2017-03-01 02:44:38.19629	2017-03-01 02:44:38.19629
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
342	1	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-03-01\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 7\ncuenta_id: 1\n	1	\N	127.0.0.1	1ca79bee-cf02-445e-8be9-dd19acef6cbf	2017-03-01 02:49:28.686201
343	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 1\n	2	\N	127.0.0.1	1ca79bee-cf02-445e-8be9-dd19acef6cbf	2017-03-01 02:49:28.754351
344	1	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	1ca79bee-cf02-445e-8be9-dd19acef6cbf	2017-03-01 02:49:28.808203
345	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 412.0\n	2	\N	127.0.0.1	1ca79bee-cf02-445e-8be9-dd19acef6cbf	2017-03-01 02:49:28.895377
346	2	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-03-01\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 7\ncuenta_id: 1\n	1	\N	127.0.0.1	29e3e43a-5f3b-4e60-8391-5467825c6768	2017-03-01 02:50:01.487395
347	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 2\n	2	\N	127.0.0.1	29e3e43a-5f3b-4e60-8391-5467825c6768	2017-03-01 02:50:01.540433
348	2	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	29e3e43a-5f3b-4e60-8391-5467825c6768	2017-03-01 02:50:01.58927
349	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 412.0\n- 124.0\n	3	\N	127.0.0.1	29e3e43a-5f3b-4e60-8391-5467825c6768	2017-03-01 02:50:01.630704
350	3	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-03-01\nmonto: 200.0\ntipo_de_pago_id: \nproyecto_id: 1\npersona_id: 7\ncuenta_id: 1\n	1	\N	127.0.0.1	0b9884db-baf8-444c-96da-b262ff3ed63c	2017-03-01 02:50:39.696043
351	3	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 3\n	2	\N	127.0.0.1	0b9884db-baf8-444c-96da-b262ff3ed63c	2017-03-01 02:50:39.746773
352	3	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	0b9884db-baf8-444c-96da-b262ff3ed63c	2017-03-01 02:50:39.786717
353	1	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 124.0\n- 24.0\n	4	\N	127.0.0.1	0b9884db-baf8-444c-96da-b262ff3ed63c	2017-03-01 02:50:39.823007
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	2e9dbac1-e23b-4653-a00c-1bc8dd9d5814	2017-03-01 02:44:38.443166
354	3	ActividadProyecto	\N	\N	1	User	\N	update	---\nestado_id:\n- 2\n- 3\n	2	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:35.823178
355	1	Proyecto	\N	\N	1	User	\N	update	---\netapa_id:\n- 1\n- 2\n	2	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:35.974464
356	55	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 4\nestado_id: \n	1	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:36.034487
357	56	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 5\nestado_id: \n	1	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:36.07455
358	57	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 6\nestado_id: \n	1	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:36.116049
359	58	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 7\nestado_id: \n	1	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:36.156453
360	59	ActividadProyecto	\N	\N	1	User	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 8\nestado_id: \n	1	\N	127.0.0.1	61eccd7b-7d9a-423e-824f-4e8e25832094	2017-03-01 09:22:36.196267
361	4	Pago	\N	\N	1	User	\N	create	---\nfecha: 2017-03-01\nmonto: 288.0\ntipo_de_pago_id: \nproyecto_id: 2\npersona_id: 8\ncuenta_id: 2\n	1	\N	127.0.0.1	dcf04de1-0fee-4f4c-82e9-7180ad088b22	2017-03-01 09:28:07.978958
362	5	CuotaPorCliente	\N	\N	1	User	\N	update	---\npago_id:\n- \n- 4\n	2	\N	127.0.0.1	dcf04de1-0fee-4f4c-82e9-7180ad088b22	2017-03-01 09:28:08.034153
363	5	CuotaPorCliente	\N	\N	1	User	\N	update	---\nestado:\n- false\n- true\n	3	\N	127.0.0.1	dcf04de1-0fee-4f4c-82e9-7180ad088b22	2017-03-01 09:28:08.082999
364	2	Cuenta	\N	\N	1	User	\N	update	---\nsaldo:\n- 0.0\n- 2.0\n	2	\N	127.0.0.1	dcf04de1-0fee-4f4c-82e9-7180ad088b22	2017-03-01 09:28:08.127174
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	f45e1cd4-30f9-4a2d-a595-0e0b8b8f8578	2017-03-01 02:44:38.529209
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	8a856b8c-8a2b-420d-a010-f0f51772e4d1	2017-03-01 02:44:38.587286
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	075e601f-0cb3-4309-858c-44690d558349	2017-03-01 02:44:38.635464
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	4fcfe7ea-0da6-4682-b672-b4eb93ff12b4	2017-03-01 02:44:38.699236
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	089f936b-688d-4458-9b5c-90079e8ec4f6	2017-03-01 02:44:38.807532
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	89cfc1b1-5754-478f-96d7-bf219190bba5	2017-03-01 02:44:38.861385
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	f32a5c97-f346-4869-a106-367f97cb5704	2017-03-01 02:44:38.928225
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	7a997603-ea22-47df-90af-65da0911c53c	2017-03-01 02:44:38.986075
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	bd2d34d8-4fa9-4464-8ad0-11d002dea475	2017-03-01 02:44:39.058634
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	290080e7-d626-4da5-8e8a-6117c867130d	2017-03-01 02:44:39.153912
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	00c97372-9fb9-4b2b-90c0-3fd7a7ef15ff	2017-03-01 02:44:39.205005
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	b2baa3b5-77ad-42c8-b9c8-35209b69cf36	2017-03-01 02:44:39.259826
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	5e09a4fc-db4a-4ffc-8bd8-60a4212fe3aa	2017-03-01 02:44:39.564097
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	abe514b0-e87f-4da6-b30b-ecb657b10c5a	2017-03-01 02:44:39.695411
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	33d4cf23-a3ff-4495-8f61-f8f2e6df7e7c	2017-03-01 02:44:39.779792
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	3d9657b7-a207-40f9-9ddc-3f6039cf5f89	2017-03-01 02:44:39.871746
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	8f397110-8067-49f2-83da-5748688aedd0	2017-03-01 02:44:39.955652
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	55ff5472-cfbb-4d8b-8e2d-658eb56b947a	2017-03-01 02:44:40.051415
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-007\nnombre: Maria\napellido: Gonzalez\nnroIdentificacion: '36134076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mg@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	eca73c22-882c-4016-8fdf-9282591240ba	2017-03-01 02:44:40.145384
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-008\nnombre: Elena\napellido: Ceballos\nnroIdentificacion: '25198461'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: ec@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	59ddcf72-e176-42eb-9ade-a9b66107434a	2017-03-01 02:44:40.238083
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-009\nnombre: Alberto\napellido: Padilla\nnroIdentificacion: '33843657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: ap@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	ee3878ae-fb3c-44b9-86cf-eed43c434446	2017-03-01 02:44:40.3332
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-010\nnombre: Fernando\napellido: Gonzalez\nnroIdentificacion: '33980912'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: fg@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	62c1d247-3145-4cb7-a420-26df93ff70eb	2017-03-01 02:44:40.415556
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-011\nnombre: Tiago\napellido: Gonzalez\nnroIdentificacion: '38187222'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: tiagogonzales@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	cf1926b4-cbd9-47f4-929a-affbf2123ee5	2017-03-01 02:44:40.505917
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-012\nnombre: Cintia\napellido: Castro\nnroIdentificacion: '22612413'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cintiacastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	b4e76c8f-8897-419a-9394-278887dc4cae	2017-03-01 02:44:40.593349
180	35	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	d857fded-9dc4-4030-a864-03f28fab153e	2017-03-01 02:45:01.706174
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-013\nnombre: Josefina\napellido: Jardin\nnroIdentificacion: '36025176'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: josefinajardin@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	6c51abbf-e021-4eeb-9e80-0eec8c698fa2	2017-03-01 02:44:40.680532
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-014\nnombre: Diana\napellido: Rivas\nnroIdentificacion: '25948001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: dianarivas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	1b2fecdf-abc1-4efb-967a-831fa854111a	2017-03-01 02:44:40.774935
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-015\nnombre: Dario\napellido: Gonzalez\nnroIdentificacion: '33880019'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: dariogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	ae5c3e41-3cf6-43f5-bace-7f8f35c8466d	2017-03-01 02:44:40.859599
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-016\nnombre: Ciro\napellido: Zamora\nnroIdentificacion: '33983707'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: cirozamora@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	3bb0e922-fd4e-4cb5-8319-e764d5a9bbd0	2017-03-01 02:44:40.955202
146	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f52891a5-32d5-400a-8ba9-84b90f954edb	2017-03-01 02:45:00.015403
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-017\nnombre: Zoe\napellido: Vazquez\nnroIdentificacion: '3818104'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoevazquez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	62c56169-e911-4e38-93f4-3ec64f05668e	2017-03-01 02:44:41.04596
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-018\nnombre: Cristian\napellido: Gonzalez\nnroIdentificacion: '22659193'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cristiangonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	3d4588cc-7767-42ff-ae79-d83169c351aa	2017-03-01 02:44:41.13472
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-019\nnombre: Ana\napellido: Manfrin\nnroIdentificacion: '36222076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: anamanfrin@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	fe45016d-4510-4ddf-82c0-914839a8a8c3	2017-03-01 02:44:41.277313
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-020\nnombre: Martina\napellido: Adamo\nnroIdentificacion: '25841001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaadamo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	06a9e186-36f6-4043-8da0-4b46b7be846c	2017-03-01 02:44:41.373924
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-021\nnombre: Roberto\napellido: Milani\nnroIdentificacion: '33880333'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: robertomilani@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	91e2f0fe-d8b8-4018-a294-03f1c6dd5980	2017-03-01 02:44:41.461726
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-022\nnombre: Victor\napellido: Gonzalez\nnroIdentificacion: '33984447'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	12fe21c6-cd1f-4a20-9331-b20fbb139eef	2017-03-01 02:44:41.561534
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-023\nnombre: Alejandro\napellido: Cambril\nnroIdentificacion: '38113409'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: alejandrocambril@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	be0aa804-6c33-4c5f-8ec4-ef090724c643	2017-03-01 02:44:41.737466
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-024\nnombre: Luis\napellido: Rizzo\nnroIdentificacion: '22543493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luisrizzo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	18b3ac23-051c-4625-931b-208419debf49	2017-03-01 02:44:41.875931
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-025\nnombre: Mario\napellido: Rosas\nnroIdentificacion: '36060986'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mariorosas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	48a173f8-a901-4405-a655-ee150af07aa5	2017-03-01 02:44:41.980864
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-026\nnombre: Analia\napellido: Granados\nnroIdentificacion: '25131701'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: analiagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	f0312ed2-cc92-468f-a043-3fa4416d1b73	2017-03-01 02:44:42.083614
40	27	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-027\nnombre: Leonor\napellido: Gonzalez\nnroIdentificacion: '33888717'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: leonorgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	830e32e2-45a7-4dbd-9c11-bbe087e939b6	2017-03-01 02:44:42.174357
41	28	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-028\nnombre: Victor\napellido: Baresi\nnroIdentificacion: '33928407'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorbaresi@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	b71c5be5-ec5f-42d1-a135-20297d8e7a71	2017-03-01 02:44:42.259438
42	29	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-029\nnombre: Silvana\napellido: Lazzaga\nnroIdentificacion: '38918849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: silvanalazzaga@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	d254efd3-c7ab-4d44-879c-a51cbf2078f8	2017-03-01 02:44:42.338724
43	30	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-030\nnombre: Juana\napellido: Calabrese\nnroIdentificacion: '220192493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: janacalabrese@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	67aee637-77b0-43cf-821c-04f9045b8269	2017-03-01 02:44:42.426395
44	31	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-031\nnombre: Juliana\napellido: Lombardi\nnroIdentificacion: '38613849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: julianalombardi@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	3f4a315e-3014-4254-97f9-04a2907e15c4	2017-03-01 02:44:42.516215
45	32	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-032\nnombre: Enrique\napellido: Cano\nnroIdentificacion: '22451493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: enriquecano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	a61f06c9-d38d-49fd-90dd-888eb16a76ac	2017-03-01 02:44:42.619889
147	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	5a91af1e-a047-4963-bfd1-889416fa7000	2017-03-01 02:45:00.082782
148	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	4f2a787f-bac9-4108-a404-37d6fd7b7ab1	2017-03-01 02:45:00.129573
46	33	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-033\nnombre: Gilda\napellido: Lombarde\nnroIdentificacion: '36064356'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: gildalombarde@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	50fb1be9-dbbd-4141-a648-78e987f28188	2017-03-01 02:44:42.716346
47	34	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-034\nnombre: Martin\napellido: Bande\nnroIdentificacion: '25124501'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinbande@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	275b69b6-76b2-405f-a680-b9a09a3fdf9f	2017-03-01 02:44:42.803387
48	35	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-035\nnombre: Gabriel\napellido: Ferruccio\nnroIdentificacion: '33451657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: gabrielferuccio@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	91255b06-455f-4a45-83d8-400552a32c6a	2017-03-01 02:44:42.889337
49	36	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-036\nnombre: Juan\napellido: Mazzanti\nnroIdentificacion: '33956107'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: juanmazzanti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	411acf1a-1602-45ae-833b-459bf0ca6185	2017-03-01 02:44:42.995209
50	37	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-037\nnombre: Karina\napellido: Fiorentino\nnroIdentificacion: '38663849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: karinafiorentino@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	03a5a534-ce85-4d67-ae1b-c582356a29ee	2017-03-01 02:44:43.082206
51	38	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-038\nnombre: Osvaldo\napellido: Pagnotto\nnroIdentificacion: '22019493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: osvaldopagnotto@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	bea92993-a277-4683-9462-817b495ec5ae	2017-03-01 02:44:43.171556
52	39	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-039\nnombre: Margarita\napellido: Giordano\nnroIdentificacion: '36068886'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: margaritagiordano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	2be3762b-7088-4421-bde4-eacada56ef0e	2017-03-01 02:44:43.268505
53	40	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-040\nnombre: Rosa\napellido: Napolitano\nnroIdentificacion: '2576401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: rosanapolitano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	c3b439be-4228-405e-b37c-33ebd77c4f3f	2017-03-01 02:44:43.356215
54	41	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-041\nnombre: Magdalena\napellido: Bruno\nnroIdentificacion: '38817849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: mardalenabruno@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	9576d231-dd2f-4992-a944-9e7b74c0d90f	2017-03-01 02:44:43.452434
55	42	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-042\nnombre: Mauricio\napellido: Costa\nnroIdentificacion: '22755493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: mauriciocosta@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	8e30603a-3b3d-4b42-8d74-01b56f703013	2017-03-01 02:44:43.576455
56	43	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-043\nnombre: Ivan\napellido: Costas\nnroIdentificacion: '36755076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: ivancostas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	d0901644-084f-4fa8-a926-15f524498485	2017-03-01 02:44:43.654606
57	44	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-044\nnombre: Pablo\napellido: Davide\nnroIdentificacion: '251934401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: pablodavide@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	25f164e0-5e2e-4e5f-91a2-b7adcf74b013	2017-03-01 02:44:43.746793
58	45	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-045\nnombre: Nicolas\napellido: Medina\nnroIdentificacion: '33801927'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: nicolasmedina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	05a41a91-2de8-4b1c-9fb5-1b6afc10c112	2017-03-01 02:44:43.843494
181	36	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	01fb9ede-b5d0-4dff-a6f3-38f28c96a786	2017-03-01 02:45:01.748424
182	37	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	33bee9ad-093d-4c8e-800f-cf63fd83ed60	2017-03-01 02:45:01.792071
59	46	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-046\nnombre: Celeste\napellido: Milano\nnroIdentificacion: '35122307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: celestemilano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	a993ffe6-79c2-4ef5-b65e-90e14fe0f80a	2017-03-01 02:44:43.941464
60	47	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-047\nnombre: Sebastian\napellido: Schiavone\nnroIdentificacion: '38175649'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: sebastianschiavone@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	f58addcb-4409-4e46-aca0-bcf1ebad1e2d	2017-03-01 02:44:44.042681
77	64	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	58ca1210-b96d-439b-946a-86fcdcc77051	2017-03-01 02:44:45.918024
61	48	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-048\nnombre: Ruben\napellido: Almedina\nnroIdentificacion: '22891493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: rubenalmedina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	db095c2e-70de-4e55-9695-186c8989484c	2017-03-01 02:44:44.156045
62	49	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-049\nnombre: Cristian\napellido: Camiño\nnroIdentificacion: '36093716'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: cristiancamiño@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	77cf5152-708c-4f3b-ad28-e192f23d0f6e	2017-03-01 02:44:44.270054
63	50	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-050\nnombre: Monica\napellido: Conti\nnroIdentificacion: '25888001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: monicaconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	82b24247-e301-4c19-88f3-950667ec0299	2017-03-01 02:44:44.347479
64	51	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	52c85436-1fd9-4d05-a2cb-8c4ddd9c32df	2017-03-01 02:44:44.494453
65	52	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4e718bc4-8bcf-4e31-bbe2-e9b182ebef67	2017-03-01 02:44:44.61478
66	53	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	358bb4de-8e37-48f0-a6c1-830c3a5f6a63	2017-03-01 02:44:44.761064
67	54	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1b36a3d4-8dbc-49cb-80cf-06b2437c0ad6	2017-03-01 02:44:44.870092
68	55	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a55a7f7c-9fd6-4b74-8eb3-f44639804a9f	2017-03-01 02:44:44.959574
69	56	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1bf63b15-c8c9-4c92-82a1-f4e2d2ede483	2017-03-01 02:44:45.055064
70	57	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7e00d834-1030-4764-bc36-89d9d004dc59	2017-03-01 02:44:45.15301
71	58	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	efb6840c-be7d-483c-a679-9cc4d7de7196	2017-03-01 02:44:45.26932
72	59	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	aa8391b9-ec1c-46d7-98b1-3ef80ab9f84a	2017-03-01 02:44:45.365931
73	60	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ed7ca550-0980-4959-a88e-8c49852d9cad	2017-03-01 02:44:45.45996
74	61	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2a33e711-f877-40b1-b1ad-1c168ddf82fa	2017-03-01 02:44:45.573207
75	62	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	15cc9338-e5de-4071-9680-62f8f5d06324	2017-03-01 02:44:45.677645
76	63	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	eda8dafd-e091-402d-87a3-c4c53c6d01ad	2017-03-01 02:44:45.78315
131	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	1e930478-6dbb-4d20-8cfc-2b322c901333	2017-03-01 02:44:51.231763
78	65	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b5c0ac58-3838-4e07-95a9-749d155e64e3	2017-03-01 02:44:46.029611
79	66	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1cf63519-2794-4443-91dc-fc401c68512a	2017-03-01 02:44:46.14354
80	67	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	53e01ea9-3206-460e-a1f1-50d788154a3d	2017-03-01 02:44:46.250036
81	68	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b044699a-73b1-4256-be6e-0d956d3e1952	2017-03-01 02:44:46.341614
82	69	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	66948142-c351-4336-93f3-e9a9edd2950a	2017-03-01 02:44:46.433065
83	70	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	06158e93-d6ad-4cec-8378-a8189780afdb	2017-03-01 02:44:46.515989
84	71	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-021\nnombre: Lidia\napellido: Delucci\nnroIdentificacion: '28088944'\nfechaNacimiento: 1981-01-29\ncalle: Chile\nnroDomicilio: '6144'\npiso: ''\ndpto: ''\ntelefono: '481898'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c8891ba6-bcad-468d-969c-094e049447ee	2017-03-01 02:44:46.606949
85	72	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-022\nnombre: Leonor\napellido: Gomez Santos\nnroIdentificacion: '40560231'\nfechaNacimiento: 1996-03-13\ncalle: Plaza Mayor\nnroDomicilio: '2637'\npiso: ''\ndpto: ''\ntelefono: '4536662'\nemail: leonorgs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5efd4cd5-3f36-4771-bcc5-0519850829d9	2017-03-01 02:44:46.702494
86	73	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-023\nnombre: Lara\napellido: Gonçalves\nnroIdentificacion: '29075344'\nfechaNacimiento: 1980-07-19\ncalle: España\nnroDomicilio: '1415'\npiso: ''\ndpto: ''\ntelefono: '4498457'\nemail: laragoncalves@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	66061caa-eb37-4474-9ed6-9d03cd4a7235	2017-03-01 02:44:46.797149
87	74	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-024\nnombre: Martin\napellido: Diaz\nnroIdentificacion: '26070390'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: martindiaz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6d4d9526-5327-4256-ab00-33ba2ce20dc4	2017-03-01 02:44:46.898877
88	75	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-025\nnombre: Marina\napellido: Diaz\nnroIdentificacion: '26070394'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: marinadiaz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4ca6b715-4f90-4ef6-bb44-a8b80eae1c6a	2017-03-01 02:44:46.988226
89	76	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-026\nnombre: Gerardo\napellido: Urbina\nnroIdentificacion: '29234987'\nfechaNacimiento: 1980-05-31\ncalle: "Álamo"\nnroDomicilio: '6162'\npiso: ''\ndpto: ''\ntelefono: '455433'\nemail: gerardou@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a140071c-f2c5-4952-a8b6-7c8edf2a7266	2017-03-01 02:44:47.081212
90	77	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-027\nnombre: Silvio\napellido: Quiroz\nnroIdentificacion: '35465922'\nfechaNacimiento: 1990-02-27\ncalle: "Álamo"\nnroDomicilio: '2128'\npiso: ''\ndpto: ''\ntelefono: '415176'\nemail: silvioquiroz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cc34d868-2643-42b1-98bd-5f289a200cf7	2017-03-01 02:44:47.195915
91	78	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-028\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '33457976'\nfechaNacimiento: 1987-12-19\ncalle: Alem\nnroDomicilio: '123'\npiso: ''\ndpto: ''\ntelefono: '451912'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fd9cbf35-c588-4ce4-a987-f1c818adae27	2017-03-01 02:44:47.321817
92	79	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-029\nnombre: Leonardo\napellido: Rios\nnroIdentificacion: '29524865'\nfechaNacimiento: 1981-11-30\ncalle: Concepcion\nnroDomicilio: '5139'\npiso: ''\ndpto: ''\ntelefono: '4590871'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	62e35646-02fb-4a33-a45d-0fe07fd80e19	2017-03-01 02:44:47.415524
93	80	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-030\nnombre: Ubaldo\napellido: Gomez\nnroIdentificacion: '34123456'\nfechaNacimiento: 1990-04-08\ncalle: Entre Rios\nnroDomicilio: '1235'\npiso: ''\ndpto: ''\ntelefono: '456798'\nemail: ubaldogomez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	812ae411-8743-411c-bfe2-2c3b1266ffe2	2017-03-01 02:44:47.491507
94	81	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-031\nnombre: Silvio\napellido: Gonzalez\nnroIdentificacion: '29092236'\nfechaNacimiento: 1980-05-16\ncalle: Cordoba\nnroDomicilio: '7213'\npiso: ''\ndpto: ''\ntelefono: '4501923'\nemail: silviogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fa7fa368-d6f9-4311-8139-653a68ae5696	2017-03-01 02:44:47.567734
95	82	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-032\nnombre: Rosa\napellido: Fernandez\nnroIdentificacion: '20112254'\nfechaNacimiento: 1968-09-13\ncalle: San Martin\nnroDomicilio: '1028'\npiso: ''\ndpto: ''\ntelefono: '4567895'\nemail: rosafernandez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e40e0cfb-0b78-402e-86b1-4c26b2700af5	2017-03-01 02:44:47.696961
96	83	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-033\nnombre: Alejandro\napellido: Fernandez\nnroIdentificacion: '20998871'\nfechaNacimiento: 1987-05-16\ncalle: Santa Fe\nnroDomicilio: '4812'\npiso: ''\ndpto: ''\ntelefono: '4311235'\nemail: alefernandez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b6c9c9f2-3d9a-41e0-869b-3d5f3848924b	2017-03-01 02:44:47.7803
97	84	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-034\nnombre: Hugo\napellido: Rios\nnroIdentificacion: '40034940'\nfechaNacimiento: 1998-11-30\ncalle: Alvear\nnroDomicilio: '5028'\npiso: ''\ndpto: ''\ntelefono: '481341'\nemail: hugorios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cbc03d94-cae2-47f8-bd13-de6b7b9a576c	2017-03-01 02:44:47.861587
98	85	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-035\nnombre: Mario\napellido: Garcia\nnroIdentificacion: '24654447'\nfechaNacimiento: 1976-04-08\ncalle: Roca\nnroDomicilio: '193'\npiso: ''\ndpto: ''\ntelefono: '4212351'\nemail: mariogarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	51e0177e-5286-466c-be39-4fda3c827abb	2017-03-01 02:44:47.947066
99	86	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-036\nnombre: Marina\napellido: Moralez\nnroIdentificacion: '36421952'\nfechaNacimiento: 1992-08-19\ncalle: Ucrania\nnroDomicilio: '9371'\npiso: ''\ndpto: ''\ntelefono: '451241'\nemail: marimamoralez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	be312aea-b623-4e9c-82a4-655d807b44ff	2017-03-01 02:44:48.025557
100	87	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-037\nnombre: Silvina\napellido: Portillo\nnroIdentificacion: '26498388'\nfechaNacimiento: 1976-06-05\ncalle: Av Queirel\nnroDomicilio: '7621'\npiso: ''\ndpto: ''\ntelefono: '431214'\nemail: silvinaportillo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4f8b97aa-6417-40e3-8944-d047f18adcf3	2017-03-01 02:44:48.101973
101	88	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-038\nnombre: Maria\napellido: Maciel\nnroIdentificacion: '33428434'\nfechaNacimiento: 1989-09-04\ncalle: Paraguay\nnroDomicilio: '600'\npiso: ''\ndpto: ''\ntelefono: '4761602'\nemail: mariamaciel@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1e333fce-7338-42ea-a671-6fc636ba18a6	2017-03-01 02:44:48.18242
102	89	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-039\nnombre: Angeles\napellido: Granados\nnroIdentificacion: '31452518'\nfechaNacimiento: 1981-04-09\ncalle: Uruguay\nnroDomicilio: '12'\npiso: ''\ndpto: ''\ntelefono: '481858'\nemail: angelesgranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c4145c2b-fc0c-4b3e-99e6-ebbde725f28d	2017-03-01 02:44:48.266701
103	90	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-040\nnombre: Cintia\napellido: Gutierrez\nnroIdentificacion: '29701192'\nfechaNacimiento: 1992-11-05\ncalle: Av Roca\nnroDomicilio: '464'\npiso: ''\ndpto: ''\ntelefono: '483498'\nemail: cintiagutierrez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2d65ee5c-f1ec-46f4-966f-29720dfd0339	2017-03-01 02:44:48.364212
104	91	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-041\nnombre: David\napellido: Sedillo\nnroIdentificacion: '36371823'\nfechaNacimiento: 1975-07-23\ncalle: Centenario\nnroDomicilio: '6135'\npiso: ''\ndpto: ''\ntelefono: '481018'\nemail: davidsedillo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	32a36360-9949-433c-9472-063ad36c3a46	2017-03-01 02:44:48.449191
105	92	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-042\nnombre: Sofia\napellido: Garcia\nnroIdentificacion: '25370180'\nfechaNacimiento: 1998-01-13\ncalle: Las Flores\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '409498'\nemail: sofiagarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	981cd093-3384-4eac-adb1-c05434a6d2d2	2017-03-01 02:44:48.539797
106	93	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-043\nnombre: Alicia\napellido: Villalba\nnroIdentificacion: '27455263'\nfechaNacimiento: 1979-04-17\ncalle: Las Palmeras\nnroDomicilio: '9876'\npiso: ''\ndpto: ''\ntelefono: '420184'\nemail: alivillalba@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2e5e1eda-e5a4-4192-8707-54c09e4b4bfb	2017-03-01 02:44:48.632514
107	94	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-044\nnombre: Luis\napellido: Gonzalez\nnroIdentificacion: '36182911'\nfechaNacimiento: 1992-06-19\ncalle: Las Orquideas\nnroDomicilio: '900'\npiso: ''\ndpto: ''\ntelefono: '495712'\nemail: luisgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a7074b04-f4f2-48a2-9532-66da6009a612	2017-03-01 02:44:48.736424
108	95	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-045\nnombre: Ernesto\napellido: Da Luz\nnroIdentificacion: '30346514'\nfechaNacimiento: 1983-06-19\ncalle: Rosas\nnroDomicilio: '2463'\npiso: ''\ndpto: ''\ntelefono: '413048'\nemail: ernestodaluz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5689dfd3-9d68-494e-ac21-278c98406e15	2017-03-01 02:44:48.8452
109	96	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-046\nnombre: Luciano\napellido: Garcia\nnroIdentificacion: '39019733'\nfechaNacimiento: 1996-03-13\ncalle: Colon\nnroDomicilio: '8123'\npiso: ''\ndpto: ''\ntelefono: '412451'\nemail: lucianogarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ae2a074b-2a6e-4e1f-84bc-ce9480f2e169	2017-03-01 02:44:48.945163
110	97	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-047\nnombre: Gerardo\napellido: Cano\nnroIdentificacion: '29232117'\nfechaNacimiento: 1980-07-19\ncalle: Escuelita\nnroDomicilio: '9173'\npiso: ''\ndpto: ''\ntelefono: '462093'\nemail: gerardocano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4e7b9ddc-9b6c-48f0-a202-b67cc870d1ef	2017-03-01 02:44:49.051574
111	98	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-048\nnombre: Hector\napellido: Rincon\nnroIdentificacion: '29222287'\nfechaNacimiento: 1980-05-31\ncalle: Japon\nnroDomicilio: '2546'\npiso: ''\ndpto: ''\ntelefono: '471927'\nemail: hectorrincon@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0ce18054-17d6-4e00-98af-6d28fd2488f1	2017-03-01 02:44:49.135932
112	99	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-049\nnombre: Alberto\napellido: Gonzalez\nnroIdentificacion: '35225922'\nfechaNacimiento: 1990-02-27\ncalle: Colombia\nnroDomicilio: '2871'\npiso: ''\ndpto: ''\ntelefono: '431570'\nemail: albertogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a581dbb8-0dbe-4180-a536-0c68ce54fdcf	2017-03-01 02:44:49.225009
113	100	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-050\nnombre: Roberto\napellido: Lujan\nnroIdentificacion: '35461122'\nfechaNacimiento: 1990-05-27\ncalle: Noruega\nnroDomicilio: '1980'\npiso: ''\ndpto: ''\ntelefono: '401938'\nemail: robertolujan@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	bd59bee6-097f-4f43-9d1f-64f655e5b1d6	2017-03-01 02:44:49.314106
114	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: []\netapa_id: 1\n	1	\N	\N	71084be7-383e-4a7f-80ba-dcf0f97b2a96	2017-03-01 02:44:49.588278
115	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	9dc77ecb-7b60-48b5-b1a2-4787cbabe5cb	2017-03-01 02:44:49.722887
116	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	d5b7db57-7278-49f3-ab3d-5f5c021f47cc	2017-03-01 02:44:49.80887
117	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	4fd06996-6ee5-4174-b769-e6022c4aa0fa	2017-03-01 02:44:49.88331
118	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	de3388c0-0362-483d-9782-38f336d4b1e7	2017-03-01 02:44:49.954213
119	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	5e193e62-a420-44b7-a95b-eded8988d2c5	2017-03-01 02:44:50.043555
120	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	0bbda066-d9d2-465a-851d-7948bce68c0d	2017-03-01 02:44:50.119761
121	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	482515f0-7b97-49e7-ad95-abf384a0af66	2017-03-01 02:44:50.192009
122	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	f72a92b6-b6b8-4898-8ac2-63cac9938c09	2017-03-01 02:44:50.257647
123	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	a2a1bbd6-3699-46ca-a49d-465680a385aa	2017-03-01 02:44:50.339079
124	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	9d6af893-a3ac-4b58-aebb-4e4619ad48a7	2017-03-01 02:44:50.42121
125	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	d963f1d5-f030-4b73-81ef-660d326c8683	2017-03-01 02:44:50.703375
126	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	4d464520-baee-456b-8ddd-fde94b8431ce	2017-03-01 02:44:50.790995
127	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	bfe0f1ff-d1e8-4cdf-b48c-8859f4d16bb4	2017-03-01 02:44:50.868342
128	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	65180c31-15f2-4eb3-b6ae-e552b9450acb	2017-03-01 02:44:50.980625
129	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	796fd564-2026-480e-a242-6f9b77227d7e	2017-03-01 02:44:51.065978
130	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	6ef22668-ce21-4522-816d-b267bdfafc42	2017-03-01 02:44:51.147712
144	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	e0868662-5048-43c1-bc6d-189c586b61a5	2017-03-01 02:44:59.853816
145	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	29f7a649-e28e-4a43-b2ff-b4ffe77395c7	2017-03-01 02:44:59.914286
132	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	a383b188-d729-46c9-85a1-4e0a11738b9c	2017-03-01 02:44:51.311466
133	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	aed6da2d-f80d-4bf7-9747-3646a1fdcc7e	2017-03-01 02:44:51.388295
134	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	41fb00c4-b7b4-4743-b20e-606807e9ceca	2017-03-01 02:44:51.483077
135	11	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-011\nnombre: Percentil\ndescripcion: Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes\n  en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para\n  hacerlo en escala y poder ganar dinero con ello.\ncalle: España\nnroDomicilio: '422'\npiso: ''\ndpto: ''\ntelefono: '4590432'\nemail: percentil@gmail.com\npagWeb: percentil.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	4a617381-00af-4155-90f1-189816d9026e	2017-03-01 02:44:51.575859
136	12	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-012\nnombre: EmbryoTools\ndescripcion: " Son una referencia mundial en reproducción asistida. Trabajan en cuatro\n  ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos,\n  porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante\n  práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan\n  es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción\n  asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de\n  los productos que vayan a entrar en contacto con embriones humanos y por último\n  trabajan en la reproducción asistida en veterinaria."\ncalle: Mariano Moreno\nnroDomicilio: '4122'\npiso: ''\ndpto: ''\ntelefono: '465888'\nemail: embryotools@gmail.com\npagWeb: embryotools.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	65787c8f-b749-470b-b1f5-8a2ee41ddc79	2017-03-01 02:44:51.657584
137	13	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-013\nnombre: Aplázame\ndescripcion: " Es un método de pago que se integra en el proceso de compra del comercio\n  electrónico y permite a los clientes de las tiendas online comprar con un crédito\n  instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su\n  método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando\n  para hacerlo en breve."\ncalle: Av. San Martin\nnroDomicilio: '4532'\npiso: ''\ndpto: ''\ntelefono: '453222'\nemail: aplazame@gmail.com\npagWeb: aplazame.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	4ed6eb7b-e657-45d9-8cf3-371ced1f8979	2017-03-01 02:44:51.743962
138	14	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-014\nnombre: BrioAgro Technologies\ndescripcion: Deesarrollo de una tecnología para que el agricultor controle su explotación.\n  El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor,\n  a través de su dispositivo, se conecta a la nube para acceder a la información de\n  su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier\n  cambio en sus variables.\ncalle: 'Colon '\nnroDomicilio: '555'\npiso: ''\ndpto: ''\ntelefono: '4651244'\nemail: bioagro@gmail.com\npagWeb: bioagro.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	dba517e3-c1b6-4d94-ae8c-3478ee04ecad	2017-03-01 02:44:51.826473
139	15	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-015\nnombre: Braingaze\ndescripcion: La tecnología desarrollada detecta un pequeño movimiento ocular que permite\n  determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad\n  (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y\n  dislexia.\ncalle: Miami\nnroDomicilio: '708'\npiso: ''\ndpto: ''\ntelefono: '490123'\nemail: baringaze@gmail.com\npagWeb: braingaze.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	6077bfe5-8b48-4bc7-a8fe-e1b1737d4efc	2017-03-01 02:44:51.932779
140	16	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-016\nnombre: CreatorStats\ndescripcion: Mejoran la métrica de los ‘youtubers’.\ncalle: Inglaterra\nnroDomicilio: '200'\npiso: ''\ndpto: ''\ntelefono: '15432510'\nemail: creatorstats@gmail.com\npagWeb: creatorstats.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	dd455a6d-3a1a-4bed-b0f9-d231ea23bb91	2017-03-01 02:44:52.005963
141	17	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-017\nnombre: Alzhup\ndescripcion: Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar\n  de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología\n  como vehículo para que la solución sea accesible a todo el mundo. Implementan a\n  nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado\n  ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados\n  científicamente. Y también, herramientas para la memoria, capaces de personalizar\n  dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo\n  mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro\n  almacena los recuerdos y que difiere de los sistemas actuales computarizados.\ncalle: Constitucion\nnroDomicilio: '2222'\npiso: ''\ndpto: ''\ntelefono: '467632'\nemail: alzhup@gmail.com\npagWeb: alzhup.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	a8b4aecb-e213-4099-aaac-b679cb72d792	2017-03-01 02:44:52.073902
183	38	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	84560b4e-4a62-440f-81b2-753a7a7fb9a7	2017-03-01 02:45:01.839048
142	18	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-018\nnombre: Axter Aerospace\ndescripcion: Están desarrollando un sistema de propulsión híbrida para las avionetas,\n  que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso\n  trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración\n  con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto\n  se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU.\n  De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción\n  y ensamblado.\ncalle: Ayacucho\nnroDomicilio: '9200'\npiso: ''\ndpto: ''\ntelefono: '432111'\nemail: axteraerospace@gmail.com\npagWeb: axteraerospace.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	887d5195-3606-460f-9fc3-6335031914ae	2017-03-01 02:44:52.139597
143	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	fb742d7c-d4d9-49d9-b030-d0b185a08edc	2017-03-01 02:44:59.79142
149	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	67d0d479-6569-4527-9c88-343583708723	2017-03-01 02:45:00.184136
150	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	2480c310-4e6c-492c-bb64-60f30c9a8b6a	2017-03-01 02:45:00.241688
151	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0a5527e4-d1fa-4689-ab0d-60efa1dd3f53	2017-03-01 02:45:00.297465
152	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	7f471915-d6ac-42d1-ba41-0667b63b2bb5	2017-03-01 02:45:00.348085
153	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	54d6dd2c-ea3f-4eec-af76-0eb55191d225	2017-03-01 02:45:00.393201
154	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	aa6105d1-89af-4e69-932d-937555a5e944	2017-03-01 02:45:00.449142
155	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	e25ece11-0e03-4a14-9313-aea535a128a1	2017-03-01 02:45:00.498426
156	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	41afe7ec-ec8e-4436-adfb-943fb34bc776	2017-03-01 02:45:00.551542
157	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	effc9288-0901-4a9d-b27f-ae0b86dc9be6	2017-03-01 02:45:00.603983
158	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	b273439c-6a72-442a-800f-0f514ef4b32d	2017-03-01 02:45:00.665342
159	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	6e7865af-044e-4acb-9a75-970a8f8f891a	2017-03-01 02:45:00.715672
160	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	ba74f221-8428-4ef7-896e-2acc9248c9cc	2017-03-01 02:45:00.759449
161	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	74c58afe-13aa-4749-95f3-0b88db5cef1e	2017-03-01 02:45:00.803563
162	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	97b4f047-328e-4670-a58b-c99e90012b9c	2017-03-01 02:45:00.851383
163	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	5d462dd9-0d5f-4eb4-b139-930b79656bd5	2017-03-01 02:45:00.892102
164	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	94884cfc-8de6-46af-8391-dc0b1268af8d	2017-03-01 02:45:00.939622
165	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	8eb496a1-a8c9-45d6-8f5f-2530ccde3dad	2017-03-01 02:45:00.980852
166	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	6ef6e55a-8644-40b3-9b12-8f703fe2fed7	2017-03-01 02:45:01.024225
167	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	523c4fc6-01d6-4d68-ad68-8f5d41ed3d18	2017-03-01 02:45:01.0732
168	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	da0a1439-7db0-4522-a107-9f333d348fbd	2017-03-01 02:45:01.114573
169	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	fd8219d0-3510-4bcd-8be9-0707683da03c	2017-03-01 02:45:01.161834
170	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f236b8cb-844e-4aeb-91cf-50dc6feb0f9e	2017-03-01 02:45:01.203536
171	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	ac3aa66a-f35c-431a-bc91-27768ece6308	2017-03-01 02:45:01.249429
172	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	82afa525-1966-4aaf-a091-27cd1032e892	2017-03-01 02:45:01.296894
173	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	1e2a63d6-dadd-4865-87f5-163920d1bf69	2017-03-01 02:45:01.393364
174	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	65ff6443-42ff-46bf-8b43-d82d919dc9b1	2017-03-01 02:45:01.439508
175	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	d7cbe9a1-be84-44cb-989a-cf9fc1c43da0	2017-03-01 02:45:01.481716
176	31	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	ce936a6d-cdf9-4c17-a344-d6e681778356	2017-03-01 02:45:01.526906
177	32	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	4fb02eb3-6c2d-4c22-80e0-8c2de4088378	2017-03-01 02:45:01.571313
178	33	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	65f921e2-9209-42e7-9d23-ae1e7277fc0f	2017-03-01 02:45:01.617628
179	34	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c56b93da-cca2-40eb-a64f-bc4571a51b10	2017-03-01 02:45:01.659368
184	39	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	7cb20f2a-0306-4dd8-8be9-c3b0e364a4c2	2017-03-01 02:45:01.884017
185	40	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	0e1e5bca-90dc-49fa-b64c-349fd875aba1	2017-03-01 02:45:01.926774
186	41	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b94241f3-7611-418f-9a72-3efab3af193a	2017-03-01 02:45:01.970937
187	42	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	b130d94b-e395-428d-a852-2d9bf5653c7b	2017-03-01 02:45:02.016249
188	43	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	b61f26dd-b804-4777-ad23-cd3d497992b4	2017-03-01 02:45:02.062607
189	44	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	1984cdfa-6231-4714-a0c6-b62261cd47b2	2017-03-01 02:45:02.10808
190	45	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	88767695-9435-4dd8-9ddb-8abda2aa65a9	2017-03-01 02:45:02.158892
191	46	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	3a1e3f3f-330b-4e29-89c2-c64e6bcfcc69	2017-03-01 02:45:02.206676
192	47	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	7f44a0ee-ac28-4259-9a0a-ad68aa56ce2e	2017-03-01 02:45:02.249596
193	48	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	144a5a01-7773-450e-99dd-e9e03cee6f25	2017-03-01 02:45:02.296093
194	49	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	9d4ab90a-60b2-4ea6-9e36-6e36a108eaca	2017-03-01 02:45:02.356862
195	50	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b2a75b7c-2ed6-4eb8-9b76-f1553a821519	2017-03-01 02:45:02.421217
196	51	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	91a8406a-2a85-4ce0-bbc7-b9794fdaa18d	2017-03-01 02:45:02.472226
197	52	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	1a76549f-4c2d-48b1-8717-e7eb64d95a17	2017-03-01 02:45:02.528307
198	53	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	2d176ae0-dcb6-4cd0-a6b7-bf08fb28e801	2017-03-01 02:45:02.57177
199	54	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	239ceb67-b255-4af1-8d6d-ccea6d4b0839	2017-03-01 02:45:02.628475
200	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	f0e057e3-5d91-4b7f-8ed0-6060a1bbf96a	2017-03-01 02:45:06.59263
201	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	41f6be12-7cee-453d-a10b-141048a4853a	2017-03-01 02:45:06.692207
202	1	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Efectivo\n	1	\N	\N	8d6499b5-f378-482a-9a6c-f2e2036ee858	2017-03-01 02:45:06.855879
203	2	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta de crédito Visa\n	1	\N	\N	bb22978b-6c5c-4425-80e0-1f18f15a4c5f	2017-03-01 02:45:06.906864
204	3	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta Naranja\n	1	\N	\N	a4810087-dfd7-477c-959a-cc26354c0532	2017-03-01 02:45:06.951747
205	4	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Saldo de cuenta\n	1	\N	\N	142a9677-fdc8-4ba7-84c2-1d4a15078881	2017-03-01 02:45:07.000225
206	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\nmonto: 200.0\n	1	\N	\N	0ffa01b6-d035-46fd-83b2-52f168f3b825	2017-03-01 02:45:07.119765
207	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\nmonto: 200.0\n	1	\N	\N	cf6e9848-51ed-43a9-b210-1a824e50a741	2017-03-01 02:45:07.194918
208	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\nmonto: 200.0\n	1	\N	\N	008a8896-7777-40cc-9b18-cc8c846d32c3	2017-03-01 02:45:07.276879
209	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\nmonto: 200.0\n	1	\N	\N	c55b377d-c041-43ea-af3e-7c3348f3a53a	2017-03-01 02:45:07.344446
210	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\nmonto: 200.0\n	1	\N	\N	8afc1ec4-7699-4444-9d99-d45fb6d461d6	2017-03-01 02:45:07.412784
211	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\nmonto: 200.0\n	1	\N	\N	3b1e24bc-e891-455f-a060-3993f6feb237	2017-03-01 02:45:07.47269
212	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\nmonto: 200.0\n	1	\N	\N	cf8bd127-ca05-42b9-a7ca-f9ac9be6c77f	2017-03-01 02:45:07.524983
213	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\nmonto: 200.0\n	1	\N	\N	818de8f6-1f4e-412e-b936-d1b899d51caf	2017-03-01 02:45:07.603212
214	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\nmonto: 200.0\n	1	\N	\N	d72b5f49-2b11-4f67-aa9e-e3a700b28abe	2017-03-01 02:45:07.658029
215	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\nmonto: 200.0\n	1	\N	\N	1ad02389-3670-429d-a024-cc3db699cd8b	2017-03-01 02:45:07.724209
216	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\nmonto: 200.0\n	1	\N	\N	6aa4d260-b6e3-41a6-8056-4a529380dbaa	2017-03-01 02:45:07.783538
217	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\nmonto: 200.0\n	1	\N	\N	3151e3ac-c28c-45e3-a5ee-484650e90341	2017-03-01 02:45:07.851056
218	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 7\nproyecto_id: 1\n	1	\N	\N	dc61a374-edc8-4f7d-a8f9-16ecda7fdf43	2017-03-01 02:45:08.571656
219	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 8\nproyecto_id: 2\n	1	\N	\N	cf174da9-e0fa-4502-97b2-b14fbbd79213	2017-03-01 02:45:08.637189
220	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 10\nproyecto_id: 3\n	1	\N	\N	e32d1630-fa23-42a3-b49b-5802a8fd08e8	2017-03-01 02:45:08.689486
221	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 12\nproyecto_id: 4\n	1	\N	\N	e8a29134-2e7b-4283-88a4-9ee78f63f237	2017-03-01 02:45:08.749001
222	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 14\nproyecto_id: 5\n	1	\N	\N	122b7c8f-c80a-4589-92d2-02cc0ed398ba	2017-03-01 02:45:08.804113
223	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 19\nproyecto_id: 6\n	1	\N	\N	03a14bf1-aa63-4e08-b249-80473973b3ef	2017-03-01 02:45:08.873487
224	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 18\nproyecto_id: 7\n	1	\N	\N	5e372d1a-0fd2-4912-a055-8a92ce269518	2017-03-01 02:45:08.922687
225	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 21\nproyecto_id: 8\n	1	\N	\N	72c15d3e-5a1e-4560-bfa0-2182eecc471b	2017-03-01 02:45:08.982764
226	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 23\nproyecto_id: 9\n	1	\N	\N	91878f9c-b462-4595-9c2c-a6211aa811b3	2017-03-01 02:45:09.029624
227	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 25\nproyecto_id: 10\n	1	\N	\N	b1157c52-4ebe-41c6-bca2-23b76501bf00	2017-03-01 02:45:09.081159
228	11	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 0017-12-10\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 71\nproyecto_id: 11\n	1	\N	\N	c9fc77b5-4373-4c21-b4b1-b0498ef54107	2017-03-01 02:45:09.133217
229	12	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 12\n	1	\N	\N	d618014b-0d3c-4102-bec3-b6a445cce7cc	2017-03-01 02:45:09.190388
230	13	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 99\nproyecto_id: 13\n	1	\N	\N	aa57d771-0799-4c5a-81b9-5441f369e5e8	2017-03-01 02:45:09.263118
231	14	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 80\nproyecto_id: 14\n	1	\N	\N	dab432f5-3557-4068-9977-c1a41c61d9a9	2017-03-01 02:45:09.323592
232	15	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 89\nproyecto_id: 15\n	1	\N	\N	70435711-3539-4faf-a286-4e8001f5f773	2017-03-01 02:45:09.378694
233	16	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 16\n	1	\N	\N	dd3e70af-d315-488e-af1b-4243f6861375	2017-03-01 02:45:09.441965
234	17	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 97\nproyecto_id: 17\n	1	\N	\N	4e713cb8-b818-43da-b020-5fa086fc733b	2017-03-01 02:45:09.499449
235	18	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 75\nproyecto_id: 18\n	1	\N	\N	01ea815a-9b4d-4a5d-90c4-3e801baf4d27	2017-03-01 02:45:09.563148
236	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	675e6896-e61b-44ec-ab3e-a3f4f1f2e66a	2017-03-01 02:45:09.866845
237	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	e19e275b-8c15-409a-81f4-dadfcd1c24f3	2017-03-01 02:45:09.96556
238	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	41d1f14c-67df-4fbe-8bbc-66849f11605d	2017-03-01 02:45:10.049261
239	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	2f303aae-df3c-46de-828d-9ae76ce3121e	2017-03-01 02:45:10.124072
240	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	85fe969a-b17c-4603-883a-8169289c85f6	2017-03-01 02:45:10.204732
241	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	1c0c4e19-3c7c-4157-9986-2bb923695409	2017-03-01 02:45:10.297717
242	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	062e1dcd-e507-4b7c-99dd-64e9271fa42d	2017-03-01 02:45:10.374662
243	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	cd70f64a-e0a6-4de5-8c60-292272ebd0d9	2017-03-01 02:45:10.454167
244	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	caf78cbe-19db-4324-8468-c1169db6af31	2017-03-01 02:45:10.544205
245	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	f71d7796-5e88-4cd8-9d5b-e3b863e43431	2017-03-01 02:45:10.626259
246	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	2b6f9f71-6852-4842-acd4-e3127698a108	2017-03-01 02:45:10.708905
247	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	d64b3a35-96e9-4333-ba94-00e98fc4f912	2017-03-01 02:45:10.780622
248	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	47f88ebe-85fa-46c6-9aa4-26a00c312768	2017-03-01 02:45:10.870485
249	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	f0c891c0-5cf0-4b17-bd2e-8fbc84992933	2017-03-01 02:45:10.948974
250	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	2cb5b03c-2ab9-4334-b379-df495e1f5cbc	2017-03-01 02:45:11.030865
251	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	f1c04e1c-ab82-4fe4-b4e5-b808a86b9407	2017-03-01 02:45:11.111087
252	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	5add58b2-31ab-4364-acf0-788c79107d4b	2017-03-01 02:45:11.194865
253	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	b5d65944-983f-4b9b-a911-348fada670c7	2017-03-01 02:45:11.286116
254	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	311f90d2-0b7b-4b88-ac0a-177216ec8e78	2017-03-01 02:45:11.375474
255	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	d2d9d92b-4fe2-4c6c-8478-c29c80ec5869	2017-03-01 02:45:11.449937
256	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	70c491c0-7d21-424d-b2e7-935f2c234fcf	2017-03-01 02:45:11.52052
257	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	3bcf6b90-dc9d-4a59-a736-64633fa52947	2017-03-01 02:45:11.603061
258	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	ff9285e4-fab0-4c42-afe5-5827e4f9b338	2017-03-01 02:45:11.669014
259	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	4744667f-a442-48b3-916c-f5c017711943	2017-03-01 02:45:11.739627
260	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	9996bcba-a567-416f-8df1-4a15ff4e2333	2017-03-01 02:45:11.809237
261	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	71b198f0-b960-4043-85ea-be63f690b3de	2017-03-01 02:45:11.88756
262	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	3b548f00-e71d-40bd-aa61-662763513bc2	2017-03-01 02:45:11.95963
263	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	605519d7-095d-4dc4-b65a-1d570ce7a621	2017-03-01 02:45:12.030257
264	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	5ec612bf-f463-4758-87da-c50e01cc1bc8	2017-03-01 02:45:12.113422
265	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	73b84a39-6f45-4958-8654-c52d0dab6714	2017-03-01 02:45:12.190419
266	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	3da77763-91db-4709-81fc-2871c718b41a	2017-03-01 02:45:12.264061
267	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	ebee142f-e3c0-4f2b-8b55-ff5212696710	2017-03-01 02:45:12.336915
268	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	150280e8-e46d-4b3f-9036-5840432a4ffe	2017-03-01 02:45:12.437174
269	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	ac7f5cd0-c234-4e21-a75c-8b4c89a06f98	2017-03-01 02:45:12.520941
270	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	1bb6b53a-d61e-488a-8a8c-90585e016353	2017-03-01 02:45:12.600292
271	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	2138037b-e555-4a1c-bf35-6295291ff763	2017-03-01 02:45:12.743293
272	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	9b520107-96cb-4d4d-a51e-b279b5880774	2017-03-01 02:45:12.824226
273	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	0365ebe8-9eff-44a2-81d9-b9d8ed50728e	2017-03-01 02:45:12.902616
274	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	c7e09d4b-f734-4785-81aa-773988cf02c5	2017-03-01 02:45:12.972299
275	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	7548f561-ef87-4ff4-b3ad-fec6cecc391c	2017-03-01 02:45:13.038644
276	41	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	33b05a39-b009-45ed-adec-c3c00849a78f	2017-03-01 02:45:13.125742
277	42	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	f41baa9e-0867-4acd-8d13-f518e3b7b2e9	2017-03-01 02:45:13.205298
278	43	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	6116ee80-1ee3-4a6c-bafe-c15f05ffedca	2017-03-01 02:45:13.30176
279	44	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	034beeb3-44a1-4502-84e4-b66ad5b2899d	2017-03-01 02:45:13.390177
280	45	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	116f445d-100f-4310-95a9-e94fbe68aded	2017-03-01 02:45:13.494303
281	46	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	35031c8f-1104-457e-b4b0-5c639f652d4b	2017-03-01 02:45:13.579544
282	47	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	bf9ca8f7-e0f8-4927-aaec-260f9863d7e3	2017-03-01 02:45:13.656133
283	48	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	fd0af18a-a451-48f0-b867-52df65fd5067	2017-03-01 02:45:13.73761
284	49	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	6b67581b-5441-4e80-ba8e-a793859298e0	2017-03-01 02:45:13.838246
285	50	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	6bacfc5a-bcc8-456f-a0c0-72c283353f4f	2017-03-01 02:45:13.913704
286	51	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	58041bed-d42d-43d0-9f8a-3f119924151c	2017-03-01 02:45:14.007379
287	52	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	2acbaffd-9fba-458d-8705-6448681a2891	2017-03-01 02:45:14.082659
288	53	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	3ef8fdbc-f149-49e8-83b4-3fb1c2b6c43b	2017-03-01 02:45:14.181922
289	54	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	ee839694-4ebe-4a3c-abd4-cc628859e20a	2017-03-01 02:45:14.279783
290	55	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	721ee830-aeef-44d6-83a0-3ee9941db744	2017-03-01 02:45:14.361396
291	56	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	10d6aceb-e254-424c-80db-564c029ad398	2017-03-01 02:45:14.441817
292	57	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	05c0551b-887a-4390-b084-b0aa9bb73a3e	2017-03-01 02:45:14.533368
293	58	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	1bd83902-745f-45ca-8341-a5f8ee2c5e7e	2017-03-01 02:45:14.630207
294	59	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	15a21b55-2d58-47aa-9ebc-ee81efcda817	2017-03-01 02:45:14.706845
295	60	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	cfd0b96d-f945-41b1-912e-ba622e0becf6	2017-03-01 02:45:14.782921
296	61	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	68531503-9fdf-4f15-87f9-518c4e7db966	2017-03-01 02:45:14.872364
297	62	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	ced61e04-43dd-4c40-b4af-98774e585a05	2017-03-01 02:45:14.948153
298	63	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	05c19442-ad6c-4c88-9d4c-fd1aa1012aeb	2017-03-01 02:45:15.02503
299	64	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	c55aac9a-b6e3-4e71-bc1d-f070527fb1c1	2017-03-01 02:45:15.0932
300	65	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	ed08f919-6bac-40a6-82bd-e60da2d43132	2017-03-01 02:45:15.170836
301	66	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	b18710d3-590d-4418-bf8b-7a780b9b4a68	2017-03-01 02:45:15.245352
302	67	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	a808c281-e748-4d5c-9211-7f30b7379df3	2017-03-01 02:45:15.317729
303	68	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	336536e1-2cc1-4c00-9b70-dfad0b74e160	2017-03-01 02:45:15.40284
304	69	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	4437758a-f82f-43f1-afc6-1882e88657df	2017-03-01 02:45:15.4889
305	70	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	ceb8a225-33b0-4a15-8729-59071604248e	2017-03-01 02:45:15.624559
306	71	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	488fe589-2063-45f3-a4aa-14ad37c4755e	2017-03-01 02:45:15.705097
307	72	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	f698716f-d235-4a0d-bc74-0ca5a35ef355	2017-03-01 02:45:15.837387
308	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	d6ad0b27-b9f1-44ef-82a5-5b99f9fd5913	2017-03-01 02:45:15.963996
309	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	50a370c7-e495-463b-8fc5-c2298c276c41	2017-03-01 02:45:16.023735
310	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	b539615a-305a-4269-a02c-a71efbbb988e	2017-03-01 02:45:16.075947
311	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	ea5f4655-94e2-4e48-a2df-b84a8fe5628d	2017-03-01 02:45:16.121905
312	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	976b81c8-93c0-411f-87b0-6fc700b9bcf6	2017-03-01 02:45:16.169487
313	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	ee49eaf8-5e3a-456f-a7c5-801adb45ce5d	2017-03-01 02:45:16.232171
314	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	085a30e4-0679-4438-9d04-a7bd129c2f60	2017-03-01 02:45:16.296981
315	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	551d856d-8b92-4705-a2c4-e332856aec95	2017-03-01 02:45:16.349869
316	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	3f345dab-123c-4941-a546-00ec54e28f4d	2017-03-01 02:45:16.406075
317	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	9b43e147-c61d-403a-a17e-e07bb233295c	2017-03-01 02:45:16.472871
318	11	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 11\n	1	\N	\N	d6466c3d-ebd1-4988-9fe9-014cfaa9f693	2017-03-01 02:45:16.528267
319	12	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 12\n	1	\N	\N	5cdbc99b-b172-4003-8d2b-48dd343492af	2017-03-01 02:45:16.603783
320	13	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 13\n	1	\N	\N	31255b72-f589-46ae-8e53-db16a6b12782	2017-03-01 02:45:16.661496
321	14	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 14\n	1	\N	\N	9fa3b957-c987-4ac4-b7a1-267bedb8c120	2017-03-01 02:45:16.720823
322	15	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 15\n	1	\N	\N	1898ea18-92d0-41d2-b16f-1e3e5956c1b2	2017-03-01 02:45:16.767101
323	16	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 16\n	1	\N	\N	32b7b803-1380-4eca-a183-7017792a9ffc	2017-03-01 02:45:16.813018
324	17	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 17\n	1	\N	\N	20c3c55d-6376-4266-bfd2-2704000b992b	2017-03-01 02:45:16.857576
325	18	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 18\n	1	\N	\N	df277958-b53d-488b-9431-dbf96a791c52	2017-03-01 02:45:16.902406
326	1	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Marketing\ndescripcion: "-"\n	1	\N	\N	e1940800-d1ae-44b3-b188-4dbcad296d28	2017-03-01 02:45:17.046846
327	2	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	baaefaff-b33d-4f53-b18f-e0bce994ff12	2017-03-01 02:45:17.092486
328	3	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	99bbd589-511d-4638-8cc8-3fe82bce929a	2017-03-01 02:45:17.142722
329	4	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	488630a6-9df6-4a57-964d-1f42507dc7a4	2017-03-01 02:45:17.195629
330	5	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Multimedios\ndescripcion: "-"\n	1	\N	\N	eb16e880-6c1f-4108-adcb-6a62a66327d6	2017-03-01 02:45:17.240255
331	6	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Community Manager\ndescripcion: "-"\n	1	\N	\N	3bf61c92-afdc-4c6c-b9c8-1d823019a00f	2017-03-01 02:45:17.28062
332	7	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: "-"\n	1	\N	\N	bd9e8d7e-0723-465e-9913-c240eb884618	2017-03-01 02:45:17.330314
333	101	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-001\nnombre: María Rosa\napellido: Conti\nnroIdentificacion: '25644132'\nfechaNacimiento: 1975-07-03\ncalle: Ituzaingo\nnroDomicilio: '245'\npiso: '12'\ndpto: B\ntelefono: '424568'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 1\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b93f946f-0a31-4fd5-b4b7-b8aedb977217	2017-03-01 02:45:17.501733
334	102	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-002\nnombre: Berta\napellido: Rivera\nnroIdentificacion: '33958772'\nfechaNacimiento: 1989-04-11\ncalle: Leandro Gomez\nnroDomicilio: '5886'\npiso: \ndpto: \ntelefono: '4598765'\nemail: brivera@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 2\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a2f88e45-6a99-456f-8767-9e3cecdc8fb8	2017-03-01 02:45:17.591009
335	103	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-003\nnombre: Juliana\napellido: Castiglione\nnroIdentificacion: '30444512'\nfechaNacimiento: 1980-12-09\ncalle: Brisas\nnroDomicilio: '3280'\npiso: '5'\ndpto: '15'\ntelefono: '555321'\nemail: jcastiglione@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 3\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	38fbb3d4-4bd8-48de-8162-a624051a9e25	2017-03-01 02:45:17.679434
336	104	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-004\nnombre: Nahuel\napellido: Estevez\nnroIdentificacion: '19423568'\nfechaNacimiento: 1966-11-28\ncalle: Av. Alta Gracia\nnroDomicilio: '5332'\npiso: '12'\ndpto: B\ntelefono: '154632108'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 4\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7698efd7-fc65-4fbb-b35b-d065c74c1f7b	2017-03-01 02:45:17.769071
337	105	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-005\nnombre: Pablo\napellido: Gomez\nnroIdentificacion: '25221305'\nfechaNacimiento: 1970-03-05\ncalle: Neruda\nnroDomicilio: '7393'\npiso: '12'\ndpto: B\ntelefono: '154245689'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 5\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0255aff6-565d-4fd4-ba4f-c4f0d407bd68	2017-03-01 02:45:17.858755
338	106	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-006\nnombre: Abigaíl\napellido: Coronado\nnroIdentificacion: '37926793'\nfechaNacimiento: 1994-03-21\ncalle: F. Varela\nnroDomicilio: '5659'\npiso: '12'\ndpto: B\ntelefono: '432666'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 6\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f87563e3-4ee6-4666-9eac-8025e15d3962	2017-03-01 02:45:17.944413
339	107	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-007\nnombre: Hilda\napellido: Zielinski\nnroIdentificacion: '25334991'\nfechaNacimiento: 1970-04-07\ncalle: Joaquin Suarez\nnroDomicilio: '6863'\npiso: '12'\ndpto: B\ntelefono: '4478909'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 7\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	f1c75fbd-e810-4adc-b7ff-1cad2bc44cd4	2017-03-01 02:45:18.034898
340	1	Evento	\N	\N	\N	\N	\N	create	---\ncodigo: EV-001\nnombre: Charla de Marketing\ndescripcion: "-"\ndia: 2017-03-03\nhora: 2000-01-01 08:00:00.000000000 -03:00\npersona_id: \n	1	\N	\N	4b7de511-ec5e-4759-b9a4-c2e24a81d89a	2017-03-01 02:45:18.16926
341	2	Evento	\N	\N	\N	\N	\N	create	---\ncodigo: EV-002\nnombre: Reunión con diseñadores\ndescripcion: Reunión entre diseñadores gráficos, diseñadores web y miembros de los\n  diferentes proyectos\ndia: 2017-03-04\nhora: 2000-01-01 09:00:00.000000000 -03:00\npersona_id: \n	1	\N	\N	a301a3e5-0183-443e-8722-35837b4298f4	2017-03-01 02:45:18.272303
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 364, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-03-01 02:44:38.00647	2017-03-01 02:44:38.00647	1	1
2	Apostoles	2017-03-01 02:44:38.03682	2017-03-01 02:44:38.03682	1	1
3	Bella Vista	2017-03-01 02:44:38.070209	2017-03-01 02:44:38.070209	2	1
4	Encarnación	2017-03-01 02:44:38.104966	2017-03-01 02:44:38.104966	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	200	2017-03-01 02:45:07.093941	2017-03-01 02:45:07.093941
2	CP-002	Cuota de Febrero	Febrero 2017	200	2017-03-01 02:45:07.172953	2017-03-01 02:45:07.172953
3	CP-003	Cuota de Marzo	Marzo 2017	200	2017-03-01 02:45:07.253923	2017-03-01 02:45:07.253923
4	CP-004	Cuota de Abril	Abril 2017	200	2017-03-01 02:45:07.325744	2017-03-01 02:45:07.325744
5	CP-005	Cuota de Mayo	Mayo 2017	200	2017-03-01 02:45:07.395776	2017-03-01 02:45:07.395776
6	CP-006	Cuota de Junio	Junio 2017	200	2017-03-01 02:45:07.454359	2017-03-01 02:45:07.454359
7	CP-007	Cuota de Julio	Julio 2017	200	2017-03-01 02:45:07.506253	2017-03-01 02:45:07.506253
8	CP-008	Cuota de Agosto	Agosto 2017	200	2017-03-01 02:45:07.586964	2017-03-01 02:45:07.586964
9	CP-009	Cuota de Septiembre	Septiembre 2017	200	2017-03-01 02:45:07.639675	2017-03-01 02:45:07.639675
10	CP-010	Cuota de Octubre	Octubre 2017	200	2017-03-01 02:45:07.706602	2017-03-01 02:45:07.706602
11	CP-011	Cuota de Noviembre	Noviembre 2017	200	2017-03-01 02:45:07.765545	2017-03-01 02:45:07.765545
12	CP-012	Cuota de Diciembre	Diciembre 2017	200	2017-03-01 02:45:07.830531	2017-03-01 02:45:07.830531
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
1	\N	Peak Startup	Desarrollando ideas juntos	30-54570225-4	ri	Av. Corrientes	4287			4401604	\N	peakstartup.com	2017-03-01 04:57:08.53645	2017-03-01 04:57:08.53645	1	1	1	1	Peak-Startup-Logo.png
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
11	0017-12-10	2017-04-30	2017-03-01 02:45:09.112067	2017-03-01 02:45:09.112067	\N	71	11
12	2017-01-01	2017-04-30	2017-03-01 02:45:09.167709	2017-03-01 02:45:09.167709	\N	65	12
13	2017-01-01	2017-04-30	2017-03-01 02:45:09.233968	2017-03-01 02:45:09.233968	\N	99	13
14	2017-01-01	2017-04-30	2017-03-01 02:45:09.300518	2017-03-01 02:45:09.300518	\N	80	14
15	2017-01-01	2017-04-30	2017-03-01 02:45:09.356081	2017-03-01 02:45:09.356081	\N	89	15
16	2017-01-01	2017-04-30	2017-03-01 02:45:09.413062	2017-03-01 02:45:09.413062	\N	67	16
17	2017-01-01	2017-04-30	2017-03-01 02:45:09.478445	2017-03-01 02:45:09.478445	\N	97	17
18	2017-01-01	2017-04-30	2017-03-01 02:45:09.53411	2017-03-01 02:45:09.53411	\N	75	18
1	2017-01-01	2017-04-30	2017-03-01 02:45:08.527377	2017-03-01 02:45:08.527377	\N	51	1
2	2017-01-01	2017-04-30	2017-03-01 02:45:08.613288	2017-03-01 02:45:08.613288	\N	52	2
3	2017-01-01	2017-04-30	2017-03-01 02:45:08.668015	2017-03-01 02:45:08.668015	\N	54	3
4	2017-01-01	2017-04-30	2017-03-01 02:45:08.725543	2017-03-01 02:45:08.725543	\N	56	4
5	2017-01-01	2017-04-30	2017-03-01 02:45:08.780337	2017-03-01 02:45:08.780337	\N	58	5
6	2017-01-01	2017-04-30	2017-03-01 02:45:08.847237	2017-03-01 02:45:08.847237	\N	60	6
7	2017-01-01	2017-04-30	2017-03-01 02:45:08.90057	2017-03-01 02:45:08.90057	\N	63	7
8	2017-01-01	2017-04-30	2017-03-01 02:45:08.959764	2017-03-01 02:45:08.959764	\N	65	8
9	2017-01-01	2017-04-30	2017-03-01 02:45:09.012254	2017-03-01 02:45:09.012254	\N	67	9
10	2017-01-01	2017-04-30	2017-03-01 02:45:09.058849	2017-03-01 02:45:09.058849	\N	69	10
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 18, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
3	0	2017-03-01 02:45:16.061432	2017-03-01 02:45:16.061432	3
4	0	2017-03-01 02:45:16.105339	2017-03-01 02:45:16.105339	4
5	0	2017-03-01 02:45:16.150838	2017-03-01 02:45:16.150838	5
6	0	2017-03-01 02:45:16.213739	2017-03-01 02:45:16.213739	6
7	0	2017-03-01 02:45:16.272268	2017-03-01 02:45:16.272268	7
8	0	2017-03-01 02:45:16.328624	2017-03-01 02:45:16.328624	8
9	0	2017-03-01 02:45:16.382957	2017-03-01 02:45:16.382957	9
10	0	2017-03-01 02:45:16.453724	2017-03-01 02:45:16.453724	10
11	0	2017-03-01 02:45:16.506122	2017-03-01 02:45:16.506122	11
12	0	2017-03-01 02:45:16.572531	2017-03-01 02:45:16.572531	12
13	0	2017-03-01 02:45:16.638904	2017-03-01 02:45:16.638904	13
14	0	2017-03-01 02:45:16.706239	2017-03-01 02:45:16.706239	14
15	0	2017-03-01 02:45:16.753173	2017-03-01 02:45:16.753173	15
16	0	2017-03-01 02:45:16.797643	2017-03-01 02:45:16.797643	16
17	0	2017-03-01 02:45:16.841496	2017-03-01 02:45:16.841496	17
18	0	2017-03-01 02:45:16.887491	2017-03-01 02:45:16.887491	18
1	24	2017-03-01 02:45:15.94051	2017-03-01 02:50:39.812879	1
2	2	2017-03-01 02:45:16.005415	2017-03-01 09:28:08.113506	2
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 18, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
4	200	f	2017-03-01 02:45:10.101076	2017-03-01 02:45:10.101076	4	1	1	\N	\N
6	288	f	2017-03-01 02:45:10.275353	2017-03-01 02:45:10.275353	2	2	2	\N	\N
7	200	f	2017-03-01 02:45:10.355303	2017-03-01 02:45:10.355303	3	2	2	\N	\N
8	200	f	2017-03-01 02:45:10.430242	2017-03-01 02:45:10.430242	4	2	2	\N	\N
9	288	f	2017-03-01 02:45:10.521287	2017-03-01 02:45:10.521287	1	3	3	\N	\N
10	288	f	2017-03-01 02:45:10.605198	2017-03-01 02:45:10.605198	2	3	3	\N	\N
11	200	f	2017-03-01 02:45:10.689933	2017-03-01 02:45:10.689933	3	3	3	\N	\N
12	200	f	2017-03-01 02:45:10.762507	2017-03-01 02:45:10.762507	4	3	3	\N	\N
13	288	f	2017-03-01 02:45:10.849362	2017-03-01 02:45:10.849362	1	4	4	\N	\N
14	288	f	2017-03-01 02:45:10.926036	2017-03-01 02:45:10.926036	2	4	4	\N	\N
15	200	f	2017-03-01 02:45:11.009264	2017-03-01 02:45:11.009264	3	4	4	\N	\N
16	200	f	2017-03-01 02:45:11.089836	2017-03-01 02:45:11.089836	4	4	4	\N	\N
17	288	f	2017-03-01 02:45:11.173458	2017-03-01 02:45:11.173458	1	5	5	\N	\N
18	288	f	2017-03-01 02:45:11.265261	2017-03-01 02:45:11.265261	2	5	5	\N	\N
19	200	f	2017-03-01 02:45:11.349219	2017-03-01 02:45:11.349219	3	5	5	\N	\N
20	200	f	2017-03-01 02:45:11.431237	2017-03-01 02:45:11.431237	4	5	5	\N	\N
21	288	f	2017-03-01 02:45:11.502033	2017-03-01 02:45:11.502033	1	6	6	\N	\N
22	288	f	2017-03-01 02:45:11.583719	2017-03-01 02:45:11.583719	2	6	6	\N	\N
23	200	f	2017-03-01 02:45:11.65058	2017-03-01 02:45:11.65058	3	6	6	\N	\N
24	200	f	2017-03-01 02:45:11.719497	2017-03-01 02:45:11.719497	4	6	6	\N	\N
25	288	f	2017-03-01 02:45:11.790743	2017-03-01 02:45:11.790743	1	7	7	\N	\N
26	288	f	2017-03-01 02:45:11.868612	2017-03-01 02:45:11.868612	2	7	7	\N	\N
27	200	f	2017-03-01 02:45:11.940918	2017-03-01 02:45:11.940918	3	7	7	\N	\N
28	200	f	2017-03-01 02:45:12.009726	2017-03-01 02:45:12.009726	4	7	7	\N	\N
29	288	f	2017-03-01 02:45:12.0942	2017-03-01 02:45:12.0942	1	8	8	\N	\N
30	288	f	2017-03-01 02:45:12.171166	2017-03-01 02:45:12.171166	2	8	8	\N	\N
31	200	f	2017-03-01 02:45:12.241512	2017-03-01 02:45:12.241512	3	8	8	\N	\N
32	200	f	2017-03-01 02:45:12.316341	2017-03-01 02:45:12.316341	4	8	8	\N	\N
33	288	f	2017-03-01 02:45:12.416453	2017-03-01 02:45:12.416453	1	9	9	\N	\N
34	288	f	2017-03-01 02:45:12.502358	2017-03-01 02:45:12.502358	2	9	9	\N	\N
35	200	f	2017-03-01 02:45:12.576799	2017-03-01 02:45:12.576799	3	9	9	\N	\N
36	200	f	2017-03-01 02:45:12.715046	2017-03-01 02:45:12.715046	4	9	9	\N	\N
37	288	f	2017-03-01 02:45:12.8032	2017-03-01 02:45:12.8032	1	10	10	\N	\N
38	288	f	2017-03-01 02:45:12.882205	2017-03-01 02:45:12.882205	2	10	10	\N	\N
39	200	f	2017-03-01 02:45:12.953005	2017-03-01 02:45:12.953005	3	10	10	\N	\N
40	200	f	2017-03-01 02:45:13.01892	2017-03-01 02:45:13.01892	4	10	10	\N	\N
41	288	f	2017-03-01 02:45:13.102654	2017-03-01 02:45:13.102654	1	11	11	\N	\N
42	288	f	2017-03-01 02:45:13.182143	2017-03-01 02:45:13.182143	2	11	11	\N	\N
43	200	f	2017-03-01 02:45:13.278239	2017-03-01 02:45:13.278239	3	11	11	\N	\N
44	200	f	2017-03-01 02:45:13.365864	2017-03-01 02:45:13.365864	4	11	11	\N	\N
45	288	f	2017-03-01 02:45:13.463613	2017-03-01 02:45:13.463613	1	12	12	\N	\N
46	288	f	2017-03-01 02:45:13.559489	2017-03-01 02:45:13.559489	2	12	12	\N	\N
47	200	f	2017-03-01 02:45:13.63558	2017-03-01 02:45:13.63558	3	12	12	\N	\N
48	200	f	2017-03-01 02:45:13.718378	2017-03-01 02:45:13.718378	4	12	12	\N	\N
49	288	f	2017-03-01 02:45:13.802293	2017-03-01 02:45:13.802293	1	13	13	\N	\N
50	288	f	2017-03-01 02:45:13.892424	2017-03-01 02:45:13.892424	2	13	13	\N	\N
51	200	f	2017-03-01 02:45:13.984584	2017-03-01 02:45:13.984584	3	13	13	\N	\N
52	200	f	2017-03-01 02:45:14.060246	2017-03-01 02:45:14.060246	4	13	13	\N	\N
53	288	f	2017-03-01 02:45:14.154982	2017-03-01 02:45:14.154982	1	14	14	\N	\N
54	288	f	2017-03-01 02:45:14.250854	2017-03-01 02:45:14.250854	2	14	14	\N	\N
55	200	f	2017-03-01 02:45:14.333329	2017-03-01 02:45:14.333329	3	14	14	\N	\N
56	200	f	2017-03-01 02:45:14.422429	2017-03-01 02:45:14.422429	4	14	14	\N	\N
57	288	f	2017-03-01 02:45:14.508356	2017-03-01 02:45:14.508356	1	15	15	\N	\N
58	288	f	2017-03-01 02:45:14.610001	2017-03-01 02:45:14.610001	2	15	15	\N	\N
59	200	f	2017-03-01 02:45:14.684825	2017-03-01 02:45:14.684825	3	15	15	\N	\N
60	200	f	2017-03-01 02:45:14.763764	2017-03-01 02:45:14.763764	4	15	15	\N	\N
61	288	f	2017-03-01 02:45:14.852195	2017-03-01 02:45:14.852195	1	16	16	\N	\N
62	288	f	2017-03-01 02:45:14.926792	2017-03-01 02:45:14.926792	2	16	16	\N	\N
63	200	f	2017-03-01 02:45:15.005856	2017-03-01 02:45:15.005856	3	16	16	\N	\N
64	200	f	2017-03-01 02:45:15.075481	2017-03-01 02:45:15.075481	4	16	16	\N	\N
65	288	f	2017-03-01 02:45:15.146706	2017-03-01 02:45:15.146706	1	17	17	\N	\N
66	288	f	2017-03-01 02:45:15.225382	2017-03-01 02:45:15.225382	2	17	17	\N	\N
67	200	f	2017-03-01 02:45:15.297717	2017-03-01 02:45:15.297717	3	17	17	\N	\N
68	200	f	2017-03-01 02:45:15.381474	2017-03-01 02:45:15.381474	4	17	17	\N	\N
69	288	f	2017-03-01 02:45:15.469807	2017-03-01 02:45:15.469807	1	18	18	\N	\N
70	288	f	2017-03-01 02:45:15.604256	2017-03-01 02:45:15.604256	2	18	18	\N	\N
71	200	f	2017-03-01 02:45:15.67788	2017-03-01 02:45:15.67788	3	18	18	\N	\N
72	200	f	2017-03-01 02:45:15.815928	2017-03-01 02:45:15.815928	4	18	18	\N	\N
1	288	t	2017-03-01 02:45:09.840169	2017-03-01 02:49:28.798948	1	1	1	1	\N
2	288	t	2017-03-01 02:45:09.940195	2017-03-01 02:50:01.57795	2	1	1	2	\N
3	200	t	2017-03-01 02:45:10.030109	2017-03-01 02:50:39.77792	3	1	1	3	\N
5	288	t	2017-03-01 02:45:10.184853	2017-03-01 09:28:08.073321	1	2	2	4	\N
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
1	Finanzas	2017-03-01 02:44:38.336107	2017-03-01 02:44:38.336107
2	Recursos Humanos	2017-03-01 02:44:38.507188	2017-03-01 02:44:38.507188
3	Evaluación	2017-03-01 02:44:38.564454	2017-03-01 02:44:38.564454
4	Logística	2017-03-01 02:44:38.618248	2017-03-01 02:44:38.618248
5	Dirección	2017-03-01 02:44:38.675586	2017-03-01 02:44:38.675586
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-03-01 02:45:06.561052	2017-03-01 02:45:06.561052
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
1	Marketing	-	2017-03-01 02:45:17.024731	2017-03-01 02:45:17.024731
2	Diseño Gráfico	-	2017-03-01 02:45:17.078482	2017-03-01 02:45:17.078482
3	Diseño Web	-	2017-03-01 02:45:17.125028	2017-03-01 02:45:17.125028
4	Fotografía	-	2017-03-01 02:45:17.180231	2017-03-01 02:45:17.180231
5	Multimedios	-	2017-03-01 02:45:17.223606	2017-03-01 02:45:17.223606
6	Community Manager	-	2017-03-01 02:45:17.26719	2017-03-01 02:45:17.26719
7	Crowdfunding	-	2017-03-01 02:45:17.314166	2017-03-01 02:45:17.314166
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 7, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-03-01 02:44:59.765635	2017-03-01 02:44:59.765635
2	Doing	f	1	\N	2017-03-01 02:44:59.83341	2017-03-01 02:44:59.83341
3	Done	t	2	\N	2017-03-01 02:44:59.895418	2017-03-01 02:44:59.895418
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-03-01 02:44:49.397641	2017-03-01 02:44:49.397641
2	Incubación	-	1	2017-03-01 02:44:49.418997	2017-03-01 02:44:49.418997
3	post incubacion	-	2	2017-03-01 02:44:49.441142	2017-03-01 02:44:49.441142
4	Cuarta etapa	-	\N	2017-03-01 02:44:49.464178	2017-03-01 02:44:49.464178
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at, persona_id) FROM stdin;
1	EV-001	Charla de Marketing	-	2017-03-03	08:00:00	2017-03-01 02:45:18.14298	2017-03-01 02:45:18.14298	\N
2	EV-002	Reunión con diseñadores	Reunión entre diseñadores gráficos, diseñadores web y miembros de los diferentes proyectos	2017-03-04	09:00:00	2017-03-01 02:45:18.254226	2017-03-01 02:45:18.254226	\N
\.


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('eventos_id_seq', 2, true);


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
1	2017-01-01 08:20:00	2017-03-01 02:45:02.689795	2017-03-01 02:45:02.689795	1	1	1	3
2	2017-01-01 08:20:00	2017-03-01 02:45:02.720845	2017-03-01 02:45:02.720845	2	1	1	3
3	2017-01-01 08:21:00	2017-03-01 02:45:02.742695	2017-03-01 02:45:02.742695	3	1	1	3
4	2017-01-01 08:22:00	2017-03-01 02:45:02.765198	2017-03-01 02:45:02.765198	1	2	1	3
5	2017-01-02 08:22:00	2017-03-01 02:45:02.789995	2017-03-01 02:45:02.789995	2	2	1	3
6	2017-01-08 08:23:00	2017-03-01 02:45:02.810138	2017-03-01 02:45:02.810138	3	2	1	3
7	2017-01-01 08:23:00	2017-03-01 02:45:02.831545	2017-03-01 02:45:02.831545	1	3	1	3
8	2017-01-06 08:24:00	2017-03-01 02:45:02.853095	2017-03-01 02:45:02.853095	2	3	1	3
9	2017-01-01 08:20:00	2017-03-01 02:45:02.87637	2017-03-01 02:45:02.87637	4	1	2	3
10	2017-01-01 08:20:00	2017-03-01 02:45:02.898967	2017-03-01 02:45:02.898967	5	1	2	3
11	2017-01-01 08:21:00	2017-03-01 02:45:02.920083	2017-03-01 02:45:02.920083	6	1	2	3
12	2017-01-01 08:22:00	2017-03-01 02:45:02.943648	2017-03-01 02:45:02.943648	4	2	2	3
13	2017-01-02 08:22:00	2017-03-01 02:45:02.966268	2017-03-01 02:45:02.966268	5	2	2	3
14	2017-01-08 08:23:00	2017-03-01 02:45:02.987618	2017-03-01 02:45:02.987618	6	2	2	3
15	2017-01-01 08:23:00	2017-03-01 02:45:03.009589	2017-03-01 02:45:03.009589	4	3	2	3
16	2017-01-06 08:24:00	2017-03-01 02:45:03.032959	2017-03-01 02:45:03.032959	5	3	2	3
17	2017-01-01 08:20:00	2017-03-01 02:45:03.054138	2017-03-01 02:45:03.054138	7	1	3	2
18	2017-01-01 08:20:00	2017-03-01 02:45:03.077751	2017-03-01 02:45:03.077751	8	1	3	2
19	2017-01-01 08:21:00	2017-03-01 02:45:03.098799	2017-03-01 02:45:03.098799	9	1	3	2
20	2017-01-01 08:22:00	2017-03-01 02:45:03.120996	2017-03-01 02:45:03.120996	7	2	3	2
21	2017-01-02 08:22:00	2017-03-01 02:45:03.144487	2017-03-01 02:45:03.144487	8	2	3	2
22	2017-01-08 08:23:00	2017-03-01 02:45:03.16547	2017-03-01 02:45:03.16547	9	2	3	2
23	2017-01-01 08:23:00	2017-03-01 02:45:03.189132	2017-03-01 02:45:03.189132	7	3	3	2
24	2017-01-06 08:24:00	2017-03-01 02:45:03.209889	2017-03-01 02:45:03.209889	8	3	3	2
25	2017-01-01 08:20:00	2017-03-01 02:45:03.233258	2017-03-01 02:45:03.233258	10	1	4	2
26	2017-01-01 08:20:00	2017-03-01 02:45:03.255544	2017-03-01 02:45:03.255544	11	1	4	2
27	2017-01-01 08:21:00	2017-03-01 02:45:03.275801	2017-03-01 02:45:03.275801	12	1	4	2
28	2017-01-01 08:22:00	2017-03-01 02:45:03.354145	2017-03-01 02:45:03.354145	10	2	4	2
29	2017-01-02 08:22:00	2017-03-01 02:45:03.397986	2017-03-01 02:45:03.397986	11	2	4	2
30	2017-01-08 08:23:00	2017-03-01 02:45:03.421861	2017-03-01 02:45:03.421861	12	2	4	2
31	2017-01-01 08:23:00	2017-03-01 02:45:03.442837	2017-03-01 02:45:03.442837	10	3	4	2
32	2017-01-06 08:24:00	2017-03-01 02:45:03.464994	2017-03-01 02:45:03.464994	11	3	4	2
33	2017-01-01 08:20:00	2017-03-01 02:45:03.488225	2017-03-01 02:45:03.488225	13	1	5	3
34	2017-01-01 08:20:00	2017-03-01 02:45:03.510375	2017-03-01 02:45:03.510375	14	1	5	3
35	2017-01-01 08:21:00	2017-03-01 02:45:03.531959	2017-03-01 02:45:03.531959	15	1	5	3
36	2017-01-01 08:22:00	2017-03-01 02:45:03.555073	2017-03-01 02:45:03.555073	13	2	5	3
37	2017-01-02 08:22:00	2017-03-01 02:45:03.577198	2017-03-01 02:45:03.577198	14	2	5	3
38	2017-01-08 08:23:00	2017-03-01 02:45:03.597812	2017-03-01 02:45:03.597812	15	2	5	3
39	2017-01-01 08:23:00	2017-03-01 02:45:03.624475	2017-03-01 02:45:03.624475	13	3	5	3
40	2017-01-06 08:24:00	2017-03-01 02:45:03.647176	2017-03-01 02:45:03.647176	14	3	5	3
41	2017-01-01 08:20:00	2017-03-01 02:45:03.687807	2017-03-01 02:45:03.687807	16	1	6	3
42	2017-01-01 08:20:00	2017-03-01 02:45:03.709966	2017-03-01 02:45:03.709966	17	1	6	3
43	2017-01-01 08:21:00	2017-03-01 02:45:03.731215	2017-03-01 02:45:03.731215	18	1	6	3
44	2017-01-01 08:22:00	2017-03-01 02:45:03.755624	2017-03-01 02:45:03.755624	16	2	6	3
45	2017-01-02 08:22:00	2017-03-01 02:45:03.776261	2017-03-01 02:45:03.776261	17	2	6	3
46	2017-01-08 08:23:00	2017-03-01 02:45:03.798691	2017-03-01 02:45:03.798691	18	2	6	3
47	2017-01-01 08:23:00	2017-03-01 02:45:03.820328	2017-03-01 02:45:03.820328	16	3	6	3
48	2017-01-06 08:24:00	2017-03-01 02:45:03.845295	2017-03-01 02:45:03.845295	17	3	6	3
49	2017-01-01 08:20:00	2017-03-01 02:45:03.875848	2017-03-01 02:45:03.875848	19	1	7	2
50	2017-01-01 08:20:00	2017-03-01 02:45:03.897937	2017-03-01 02:45:03.897937	20	1	7	2
51	2017-01-01 08:21:00	2017-03-01 02:45:03.922624	2017-03-01 02:45:03.922624	21	1	7	2
52	2017-01-01 08:22:00	2017-03-01 02:45:03.943034	2017-03-01 02:45:03.943034	19	2	7	2
53	2017-01-02 08:22:00	2017-03-01 02:45:03.964444	2017-03-01 02:45:03.964444	20	2	7	2
54	2017-01-08 08:23:00	2017-03-01 02:45:03.988342	2017-03-01 02:45:03.988342	21	2	7	2
55	2017-01-01 08:23:00	2017-03-01 02:45:04.009341	2017-03-01 02:45:04.009341	19	3	7	2
56	2017-01-06 08:24:00	2017-03-01 02:45:04.031108	2017-03-01 02:45:04.031108	20	3	7	2
57	2017-01-01 08:20:00	2017-03-01 02:45:04.054802	2017-03-01 02:45:04.054802	22	1	8	3
58	2017-01-01 08:20:00	2017-03-01 02:45:04.076057	2017-03-01 02:45:04.076057	23	1	8	3
59	2017-01-01 08:21:00	2017-03-01 02:45:04.099403	2017-03-01 02:45:04.099403	24	1	8	3
60	2017-01-01 08:22:00	2017-03-01 02:45:04.120551	2017-03-01 02:45:04.120551	22	2	8	3
61	2017-01-02 08:22:00	2017-03-01 02:45:04.144608	2017-03-01 02:45:04.144608	23	2	8	3
62	2017-01-08 08:23:00	2017-03-01 02:45:04.165782	2017-03-01 02:45:04.165782	24	2	8	3
63	2017-01-01 08:23:00	2017-03-01 02:45:04.187576	2017-03-01 02:45:04.187576	22	3	8	3
64	2017-01-06 08:24:00	2017-03-01 02:45:04.211319	2017-03-01 02:45:04.211319	23	3	8	3
65	2017-01-01 08:20:00	2017-03-01 02:45:04.23214	2017-03-01 02:45:04.23214	25	1	9	2
66	2017-01-01 08:20:00	2017-03-01 02:45:04.254568	2017-03-01 02:45:04.254568	26	1	9	2
67	2017-01-01 08:21:00	2017-03-01 02:45:04.277866	2017-03-01 02:45:04.277866	27	1	9	2
68	2017-01-01 08:22:00	2017-03-01 02:45:04.299415	2017-03-01 02:45:04.299415	25	2	9	2
69	2017-01-02 08:22:00	2017-03-01 02:45:04.321237	2017-03-01 02:45:04.321237	26	2	9	2
70	2017-01-08 08:23:00	2017-03-01 02:45:04.344776	2017-03-01 02:45:04.344776	27	2	9	2
71	2017-01-01 08:23:00	2017-03-01 02:45:04.365776	2017-03-01 02:45:04.365776	25	3	9	2
72	2017-01-06 08:24:00	2017-03-01 02:45:04.389286	2017-03-01 02:45:04.389286	26	3	9	2
73	2017-01-01 08:20:00	2017-03-01 02:45:04.411234	2017-03-01 02:45:04.411234	28	1	10	3
74	2017-01-01 08:20:00	2017-03-01 02:45:04.4336	2017-03-01 02:45:04.4336	29	1	10	3
75	2017-01-01 08:21:00	2017-03-01 02:45:04.453754	2017-03-01 02:45:04.453754	30	1	10	3
76	2017-01-01 08:22:00	2017-03-01 02:45:04.476621	2017-03-01 02:45:04.476621	28	2	10	3
77	2017-01-02 08:22:00	2017-03-01 02:45:04.501455	2017-03-01 02:45:04.501455	29	2	10	3
78	2017-01-08 08:23:00	2017-03-01 02:45:04.52053	2017-03-01 02:45:04.52053	30	2	10	3
79	2017-01-01 08:23:00	2017-03-01 02:45:04.546475	2017-03-01 02:45:04.546475	28	3	10	3
80	2017-01-06 08:24:00	2017-03-01 02:45:04.883855	2017-03-01 02:45:04.883855	29	3	10	3
81	2017-01-01 08:20:00	2017-03-01 02:45:04.911194	2017-03-01 02:45:04.911194	31	1	11	3
82	2017-01-01 08:20:00	2017-03-01 02:45:04.932487	2017-03-01 02:45:04.932487	32	1	11	3
83	2017-01-01 08:21:00	2017-03-01 02:45:04.956087	2017-03-01 02:45:04.956087	33	1	11	3
84	2017-01-01 08:22:00	2017-03-01 02:45:04.978407	2017-03-01 02:45:04.978407	31	2	11	3
85	2017-01-02 08:22:00	2017-03-01 02:45:04.999368	2017-03-01 02:45:04.999368	32	2	11	3
86	2017-01-08 08:23:00	2017-03-01 02:45:05.021895	2017-03-01 02:45:05.021895	33	2	11	3
87	2017-01-01 08:23:00	2017-03-01 02:45:05.044627	2017-03-01 02:45:05.044627	31	3	11	3
88	2017-01-06 08:24:00	2017-03-01 02:45:05.065983	2017-03-01 02:45:05.065983	32	3	11	3
89	2017-01-01 08:20:00	2017-03-01 02:45:05.089701	2017-03-01 02:45:05.089701	34	1	12	3
90	2017-01-01 08:20:00	2017-03-01 02:45:05.110551	2017-03-01 02:45:05.110551	35	1	12	3
91	2017-01-01 08:21:00	2017-03-01 02:45:05.133889	2017-03-01 02:45:05.133889	36	1	12	3
92	2017-01-01 08:22:00	2017-03-01 02:45:05.155176	2017-03-01 02:45:05.155176	34	2	12	3
93	2017-01-02 08:22:00	2017-03-01 02:45:05.178661	2017-03-01 02:45:05.178661	35	2	12	3
94	2017-01-08 08:23:00	2017-03-01 02:45:05.200559	2017-03-01 02:45:05.200559	36	2	12	3
95	2017-01-01 08:23:00	2017-03-01 02:45:05.221553	2017-03-01 02:45:05.221553	34	3	12	3
96	2017-01-06 08:24:00	2017-03-01 02:45:05.243761	2017-03-01 02:45:05.243761	35	3	12	3
97	2017-01-01 08:20:00	2017-03-01 02:45:05.267122	2017-03-01 02:45:05.267122	37	1	13	2
98	2017-01-01 08:20:00	2017-03-01 02:45:05.289779	2017-03-01 02:45:05.289779	38	1	13	2
99	2017-01-01 08:21:00	2017-03-01 02:45:05.312025	2017-03-01 02:45:05.312025	39	1	13	2
100	2017-01-01 08:22:00	2017-03-01 02:45:05.333861	2017-03-01 02:45:05.333861	37	2	13	2
101	2017-01-02 08:22:00	2017-03-01 02:45:05.355312	2017-03-01 02:45:05.355312	38	2	13	2
102	2017-01-08 08:23:00	2017-03-01 02:45:05.378316	2017-03-01 02:45:05.378316	39	2	13	2
103	2017-01-01 08:23:00	2017-03-01 02:45:05.400867	2017-03-01 02:45:05.400867	37	3	13	2
104	2017-01-06 08:24:00	2017-03-01 02:45:05.422441	2017-03-01 02:45:05.422441	38	3	13	2
105	2017-01-01 08:20:00	2017-03-01 02:45:05.443898	2017-03-01 02:45:05.443898	40	1	14	2
106	2017-01-01 08:20:00	2017-03-01 02:45:05.46737	2017-03-01 02:45:05.46737	41	1	14	2
107	2017-01-01 08:21:00	2017-03-01 02:45:05.489847	2017-03-01 02:45:05.489847	42	1	14	2
108	2017-01-01 08:22:00	2017-03-01 02:45:05.531814	2017-03-01 02:45:05.531814	40	2	14	2
109	2017-01-02 08:22:00	2017-03-01 02:45:05.555211	2017-03-01 02:45:05.555211	41	2	14	2
110	2017-01-08 08:23:00	2017-03-01 02:45:05.59897	2017-03-01 02:45:05.59897	42	2	14	2
111	2017-01-01 08:23:00	2017-03-01 02:45:05.621005	2017-03-01 02:45:05.621005	40	3	14	2
112	2017-01-06 08:24:00	2017-03-01 02:45:05.667598	2017-03-01 02:45:05.667598	41	3	14	2
113	2017-01-01 08:20:00	2017-03-01 02:45:05.688564	2017-03-01 02:45:05.688564	43	1	15	3
114	2017-01-01 08:20:00	2017-03-01 02:45:05.734116	2017-03-01 02:45:05.734116	44	1	15	3
115	2017-01-01 08:21:00	2017-03-01 02:45:05.756517	2017-03-01 02:45:05.756517	45	1	15	3
116	2017-01-01 08:22:00	2017-03-01 02:45:05.789854	2017-03-01 02:45:05.789854	43	2	15	3
117	2017-01-02 08:22:00	2017-03-01 02:45:05.810827	2017-03-01 02:45:05.810827	44	2	15	3
118	2017-01-08 08:23:00	2017-03-01 02:45:05.832203	2017-03-01 02:45:05.832203	45	2	15	3
119	2017-01-01 08:23:00	2017-03-01 02:45:05.854433	2017-03-01 02:45:05.854433	43	3	15	3
120	2017-01-06 08:24:00	2017-03-01 02:45:05.878545	2017-03-01 02:45:05.878545	44	3	15	3
121	2017-01-01 08:20:00	2017-03-01 02:45:05.900513	2017-03-01 02:45:05.900513	46	1	16	3
122	2017-01-01 08:20:00	2017-03-01 02:45:05.921231	2017-03-01 02:45:05.921231	47	1	16	3
123	2017-01-01 08:21:00	2017-03-01 02:45:05.946352	2017-03-01 02:45:05.946352	48	1	16	3
124	2017-01-01 08:22:00	2017-03-01 02:45:05.966712	2017-03-01 02:45:05.966712	46	2	16	3
125	2017-01-02 08:22:00	2017-03-01 02:45:05.98767	2017-03-01 02:45:05.98767	47	2	16	3
126	2017-01-08 08:23:00	2017-03-01 02:45:06.01102	2017-03-01 02:45:06.01102	48	2	16	3
127	2017-01-01 08:23:00	2017-03-01 02:45:06.03353	2017-03-01 02:45:06.03353	46	3	16	3
128	2017-01-06 08:24:00	2017-03-01 02:45:06.055004	2017-03-01 02:45:06.055004	47	3	16	3
129	2017-01-01 08:20:00	2017-03-01 02:45:06.077366	2017-03-01 02:45:06.077366	49	1	17	3
130	2017-01-01 08:20:00	2017-03-01 02:45:06.099294	2017-03-01 02:45:06.099294	50	1	17	3
131	2017-01-01 08:21:00	2017-03-01 02:45:06.133112	2017-03-01 02:45:06.133112	51	1	17	3
132	2017-01-01 08:22:00	2017-03-01 02:45:06.157256	2017-03-01 02:45:06.157256	49	2	17	3
133	2017-01-02 08:22:00	2017-03-01 02:45:06.200297	2017-03-01 02:45:06.200297	50	2	17	3
134	2017-01-08 08:23:00	2017-03-01 02:45:06.221735	2017-03-01 02:45:06.221735	51	2	17	3
135	2017-01-01 08:23:00	2017-03-01 02:45:06.254566	2017-03-01 02:45:06.254566	49	3	17	3
136	2017-01-06 08:24:00	2017-03-01 02:45:06.310047	2017-03-01 02:45:06.310047	50	3	17	3
137	2017-01-01 08:20:00	2017-03-01 02:45:06.332762	2017-03-01 02:45:06.332762	52	1	18	3
138	2017-01-01 08:20:00	2017-03-01 02:45:06.354665	2017-03-01 02:45:06.354665	53	1	18	3
139	2017-01-01 08:21:00	2017-03-01 02:45:06.378418	2017-03-01 02:45:06.378418	54	1	18	3
140	2017-01-01 08:22:00	2017-03-01 02:45:06.40089	2017-03-01 02:45:06.40089	52	2	18	3
141	2017-01-02 08:22:00	2017-03-01 02:45:06.421268	2017-03-01 02:45:06.421268	53	2	18	3
142	2017-01-08 08:23:00	2017-03-01 02:45:06.444112	2017-03-01 02:45:06.444112	54	2	18	3
143	2017-01-01 08:23:00	2017-03-01 02:45:06.468019	2017-03-01 02:45:06.468019	52	3	18	3
144	2017-01-06 08:24:00	2017-03-01 02:45:06.487644	2017-03-01 02:45:06.487644	53	3	18	3
145	2017-03-01 09:22:35.86827	2017-03-01 09:22:35.869806	2017-03-01 09:22:36.250033	3	3	\N	1
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 145, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-03-01 02:45:06.666717	2017-03-01 02:45:06.666717
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
1	Actividad	2017-03-01 02:44:54.04455	2017-03-01 02:44:54.04455
2	Area	2017-03-01 02:44:54.06631	2017-03-01 02:44:54.06631
3	Ciudad	2017-03-01 02:44:54.088293	2017-03-01 02:44:54.088293
4	ConceptoDePago	2017-03-01 02:44:54.111524	2017-03-01 02:44:54.111524
5	Contacto	2017-03-01 02:44:54.132981	2017-03-01 02:44:54.132981
6	Contrato	2017-03-01 02:44:54.157146	2017-03-01 02:44:54.157146
7	Cuenta	2017-03-01 02:44:54.177056	2017-03-01 02:44:54.177056
8	Departamento	2017-03-01 02:44:54.201288	2017-03-01 02:44:54.201288
9	Descuento	2017-03-01 02:44:54.222394	2017-03-01 02:44:54.222394
10	Empleado	2017-03-01 02:44:54.243587	2017-03-01 02:44:54.243587
11	EspecialidadDeContacto	2017-03-01 02:44:54.266737	2017-03-01 02:44:54.266737
12	Estado	2017-03-01 02:44:54.289952	2017-03-01 02:44:54.289952
13	Etapa	2017-03-01 02:44:54.309521	2017-03-01 02:44:54.309521
14	Evento	2017-03-01 02:44:54.331993	2017-03-01 02:44:54.331993
15	EventoProyecto	2017-03-01 02:44:54.35601	2017-03-01 02:44:54.35601
16	MiembroEquipo	2017-03-01 02:44:54.378324	2017-03-01 02:44:54.378324
17	Pago	2017-03-01 02:44:54.399198	2017-03-01 02:44:54.399198
18	Pais	2017-03-01 02:44:54.422056	2017-03-01 02:44:54.422056
19	Provincia	2017-03-01 02:44:54.444406	2017-03-01 02:44:54.444406
20	Proyecto	2017-03-01 02:44:54.465946	2017-03-01 02:44:54.465946
21	Rol	2017-03-01 02:44:54.487798	2017-03-01 02:44:54.487798
22	RolDeEmpleado	2017-03-01 02:44:54.511832	2017-03-01 02:44:54.511832
23	TipoDocumento	2017-03-01 02:44:54.532179	2017-03-01 02:44:54.532179
24	TipoDePago	2017-03-01 02:44:54.611434	2017-03-01 02:44:54.611434
25	User	2017-03-01 02:44:54.64303	2017-03-01 02:44:54.64303
26	ActividadProyecto	2017-03-01 02:44:54.665693	2017-03-01 02:44:54.665693
27	CuotaPorCliente	2017-03-01 02:44:54.688747	2017-03-01 02:44:54.688747
\.


--
-- Name: modelos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('modelos_id_seq', 27, true);


--
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos (id, fecha, monto, created_at, updated_at, tipo_de_pago_id, proyecto_id, persona_id, cuenta_id) FROM stdin;
1	2017-03-01	288	2017-03-01 02:49:28.585984	2017-03-01 02:49:28.585984	\N	1	7	1
2	2017-03-01	288	2017-03-01 02:50:01.447161	2017-03-01 02:50:01.447161	\N	1	7	1
3	2017-03-01	200	2017-03-01 02:50:39.658371	2017-03-01 02:50:39.658371	\N	1	7	1
4	2017-03-01	288	2017-03-01 09:28:07.917421	2017-03-01 09:28:07.917421	\N	2	8	2
\.


--
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_id_seq', 4, true);


--
-- Data for Name: pagos_metodos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY pagos_metodos (id, monto, created_at, updated_at, pago_id, tipo_de_pago_id) FROM stdin;
1	700	2017-03-01 02:49:28.727565	2017-03-01 02:49:28.727565	1	1
2	412	2017-03-01 02:50:01.519406	2017-03-01 02:50:01.519406	2	4
3	124	2017-03-01 02:50:39.722673	2017-03-01 02:50:39.722673	3	4
4	100	2017-03-01 02:50:39.72897	2017-03-01 02:50:39.72897	3	1
5	290	2017-03-01 09:28:08.006239	2017-03-01 09:28:08.006239	4	1
\.


--
-- Name: pagos_metodos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('pagos_metodos_id_seq', 5, true);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY paises (id, nombre, created_at, updated_at) FROM stdin;
1	Argentina	2017-03-01 02:44:37.718469	2017-03-01 02:44:37.718469
2	Paraguay	2017-03-01 02:44:37.74938	2017-03-01 02:44:37.74938
3	Brasil	2017-03-01 02:44:37.771723	2017-03-01 02:44:37.771723
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-03-01 02:44:54.750848	2017-03-01 02:44:54.750848	1	1
2	2017-03-01 02:44:54.774188	2017-03-01 02:44:54.774188	2	1
3	2017-03-01 02:44:54.795845	2017-03-01 02:44:54.795845	3	1
4	2017-03-01 02:44:54.818021	2017-03-01 02:44:54.818021	4	1
5	2017-03-01 02:44:54.839819	2017-03-01 02:44:54.839819	1	2
6	2017-03-01 02:44:54.863411	2017-03-01 02:44:54.863411	2	2
7	2017-03-01 02:44:54.885101	2017-03-01 02:44:54.885101	3	2
8	2017-03-01 02:44:54.906961	2017-03-01 02:44:54.906961	4	2
9	2017-03-01 02:44:54.929714	2017-03-01 02:44:54.929714	1	3
10	2017-03-01 02:44:54.951513	2017-03-01 02:44:54.951513	2	3
11	2017-03-01 02:44:54.973692	2017-03-01 02:44:54.973692	3	3
12	2017-03-01 02:44:54.996234	2017-03-01 02:44:54.996234	4	3
13	2017-03-01 02:44:55.017716	2017-03-01 02:44:55.017716	1	4
14	2017-03-01 02:44:55.040945	2017-03-01 02:44:55.040945	2	4
15	2017-03-01 02:44:55.061951	2017-03-01 02:44:55.061951	3	4
16	2017-03-01 02:44:55.085107	2017-03-01 02:44:55.085107	4	4
17	2017-03-01 02:44:55.1069	2017-03-01 02:44:55.1069	1	5
18	2017-03-01 02:44:55.129846	2017-03-01 02:44:55.129846	2	5
19	2017-03-01 02:44:55.152012	2017-03-01 02:44:55.152012	3	5
20	2017-03-01 02:44:55.173365	2017-03-01 02:44:55.173365	4	5
21	2017-03-01 02:44:55.196601	2017-03-01 02:44:55.196601	1	6
22	2017-03-01 02:44:55.218142	2017-03-01 02:44:55.218142	2	6
23	2017-03-01 02:44:55.239652	2017-03-01 02:44:55.239652	3	6
24	2017-03-01 02:44:55.306905	2017-03-01 02:44:55.306905	4	6
25	2017-03-01 02:44:55.329964	2017-03-01 02:44:55.329964	1	7
26	2017-03-01 02:44:55.351781	2017-03-01 02:44:55.351781	2	7
27	2017-03-01 02:44:55.374474	2017-03-01 02:44:55.374474	3	7
28	2017-03-01 02:44:55.396543	2017-03-01 02:44:55.396543	4	7
29	2017-03-01 02:44:55.418081	2017-03-01 02:44:55.418081	1	8
30	2017-03-01 02:44:55.440877	2017-03-01 02:44:55.440877	2	8
31	2017-03-01 02:44:55.463026	2017-03-01 02:44:55.463026	3	8
32	2017-03-01 02:44:55.484266	2017-03-01 02:44:55.484266	4	8
33	2017-03-01 02:44:55.507101	2017-03-01 02:44:55.507101	1	9
34	2017-03-01 02:44:55.528846	2017-03-01 02:44:55.528846	2	9
35	2017-03-01 02:44:55.551777	2017-03-01 02:44:55.551777	3	9
36	2017-03-01 02:44:55.574298	2017-03-01 02:44:55.574298	4	9
37	2017-03-01 02:44:55.596941	2017-03-01 02:44:55.596941	1	10
38	2017-03-01 02:44:55.6183	2017-03-01 02:44:55.6183	2	10
39	2017-03-01 02:44:55.641174	2017-03-01 02:44:55.641174	3	10
40	2017-03-01 02:44:55.662277	2017-03-01 02:44:55.662277	4	10
41	2017-03-01 02:44:55.685525	2017-03-01 02:44:55.685525	1	11
42	2017-03-01 02:44:55.70732	2017-03-01 02:44:55.70732	2	11
43	2017-03-01 02:44:55.751592	2017-03-01 02:44:55.751592	3	11
44	2017-03-01 02:44:55.795702	2017-03-01 02:44:55.795702	4	11
45	2017-03-01 02:44:55.829374	2017-03-01 02:44:55.829374	1	12
46	2017-03-01 02:44:55.906311	2017-03-01 02:44:55.906311	2	12
47	2017-03-01 02:44:55.952089	2017-03-01 02:44:55.952089	3	12
48	2017-03-01 02:44:55.973861	2017-03-01 02:44:55.973861	4	12
49	2017-03-01 02:44:55.99564	2017-03-01 02:44:55.99564	1	13
50	2017-03-01 02:44:56.01749	2017-03-01 02:44:56.01749	2	13
51	2017-03-01 02:44:56.039735	2017-03-01 02:44:56.039735	3	13
52	2017-03-01 02:44:56.061669	2017-03-01 02:44:56.061669	4	13
53	2017-03-01 02:44:56.084096	2017-03-01 02:44:56.084096	1	14
54	2017-03-01 02:44:56.10759	2017-03-01 02:44:56.10759	2	14
55	2017-03-01 02:44:56.130479	2017-03-01 02:44:56.130479	3	14
56	2017-03-01 02:44:56.15174	2017-03-01 02:44:56.15174	4	14
57	2017-03-01 02:44:56.173414	2017-03-01 02:44:56.173414	1	15
58	2017-03-01 02:44:56.196898	2017-03-01 02:44:56.196898	2	15
59	2017-03-01 02:44:56.217897	2017-03-01 02:44:56.217897	3	15
60	2017-03-01 02:44:56.241947	2017-03-01 02:44:56.241947	4	15
61	2017-03-01 02:44:56.262024	2017-03-01 02:44:56.262024	1	16
62	2017-03-01 02:44:56.284216	2017-03-01 02:44:56.284216	2	16
63	2017-03-01 02:44:56.306991	2017-03-01 02:44:56.306991	3	16
64	2017-03-01 02:44:56.334055	2017-03-01 02:44:56.334055	4	16
65	2017-03-01 02:44:56.350361	2017-03-01 02:44:56.350361	1	17
66	2017-03-01 02:44:56.373079	2017-03-01 02:44:56.373079	2	17
67	2017-03-01 02:44:56.395762	2017-03-01 02:44:56.395762	3	17
68	2017-03-01 02:44:56.417697	2017-03-01 02:44:56.417697	4	17
69	2017-03-01 02:44:56.439642	2017-03-01 02:44:56.439642	1	18
70	2017-03-01 02:44:56.462461	2017-03-01 02:44:56.462461	2	18
71	2017-03-01 02:44:56.483863	2017-03-01 02:44:56.483863	3	18
72	2017-03-01 02:44:56.506385	2017-03-01 02:44:56.506385	4	18
73	2017-03-01 02:44:56.529945	2017-03-01 02:44:56.529945	1	19
74	2017-03-01 02:44:56.550925	2017-03-01 02:44:56.550925	2	19
75	2017-03-01 02:44:56.573488	2017-03-01 02:44:56.573488	3	19
76	2017-03-01 02:44:56.596088	2017-03-01 02:44:56.596088	4	19
77	2017-03-01 02:44:56.61784	2017-03-01 02:44:56.61784	1	20
78	2017-03-01 02:44:56.639851	2017-03-01 02:44:56.639851	2	20
79	2017-03-01 02:44:56.662994	2017-03-01 02:44:56.662994	3	20
80	2017-03-01 02:44:56.684603	2017-03-01 02:44:56.684603	4	20
81	2017-03-01 02:44:56.70666	2017-03-01 02:44:56.70666	1	21
82	2017-03-01 02:44:56.729231	2017-03-01 02:44:56.729231	2	21
83	2017-03-01 02:44:56.750683	2017-03-01 02:44:56.750683	3	21
84	2017-03-01 02:44:56.772983	2017-03-01 02:44:56.772983	4	21
85	2017-03-01 02:44:56.795208	2017-03-01 02:44:56.795208	1	22
86	2017-03-01 02:44:56.81857	2017-03-01 02:44:56.81857	2	22
87	2017-03-01 02:44:56.839915	2017-03-01 02:44:56.839915	3	22
88	2017-03-01 02:44:56.862198	2017-03-01 02:44:56.862198	4	22
89	2017-03-01 02:44:56.885186	2017-03-01 02:44:56.885186	1	23
90	2017-03-01 02:44:56.906212	2017-03-01 02:44:56.906212	2	23
91	2017-03-01 02:44:56.929409	2017-03-01 02:44:56.929409	3	23
92	2017-03-01 02:44:56.951353	2017-03-01 02:44:56.951353	4	23
93	2017-03-01 02:44:56.972814	2017-03-01 02:44:56.972814	1	24
94	2017-03-01 02:44:56.995696	2017-03-01 02:44:56.995696	2	24
95	2017-03-01 02:44:57.018376	2017-03-01 02:44:57.018376	3	24
96	2017-03-01 02:44:57.051738	2017-03-01 02:44:57.051738	4	24
97	2017-03-01 02:44:57.072978	2017-03-01 02:44:57.072978	1	25
98	2017-03-01 02:44:57.10693	2017-03-01 02:44:57.10693	2	25
99	2017-03-01 02:44:57.129347	2017-03-01 02:44:57.129347	3	25
100	2017-03-01 02:44:57.150914	2017-03-01 02:44:57.150914	4	25
101	2017-03-01 02:44:57.172798	2017-03-01 02:44:57.172798	5	20
102	2017-03-01 02:44:57.196078	2017-03-01 02:44:57.196078	6	1
103	2017-03-01 02:44:57.217879	2017-03-01 02:44:57.217879	6	2
104	2017-03-01 02:44:57.240398	2017-03-01 02:44:57.240398	6	3
105	2017-03-01 02:44:57.262381	2017-03-01 02:44:57.262381	6	4
106	2017-03-01 02:44:57.284223	2017-03-01 02:44:57.284223	6	5
107	2017-03-01 02:44:57.306353	2017-03-01 02:44:57.306353	6	6
108	2017-03-01 02:44:57.328715	2017-03-01 02:44:57.328715	6	7
109	2017-03-01 02:44:57.35227	2017-03-01 02:44:57.35227	6	8
110	2017-03-01 02:44:57.373008	2017-03-01 02:44:57.373008	6	9
111	2017-03-01 02:44:57.395936	2017-03-01 02:44:57.395936	6	10
112	2017-03-01 02:44:57.417373	2017-03-01 02:44:57.417373	6	11
113	2017-03-01 02:44:57.441329	2017-03-01 02:44:57.441329	6	12
114	2017-03-01 02:44:57.462808	2017-03-01 02:44:57.462808	6	13
115	2017-03-01 02:44:57.484227	2017-03-01 02:44:57.484227	6	14
116	2017-03-01 02:44:57.51776	2017-03-01 02:44:57.51776	6	15
117	2017-03-01 02:44:57.539655	2017-03-01 02:44:57.539655	6	16
118	2017-03-01 02:44:57.574736	2017-03-01 02:44:57.574736	6	17
119	2017-03-01 02:44:57.596204	2017-03-01 02:44:57.596204	6	18
120	2017-03-01 02:44:57.630229	2017-03-01 02:44:57.630229	6	19
121	2017-03-01 02:44:57.651389	2017-03-01 02:44:57.651389	6	20
122	2017-03-01 02:44:57.673238	2017-03-01 02:44:57.673238	6	21
123	2017-03-01 02:44:57.697206	2017-03-01 02:44:57.697206	6	22
124	2017-03-01 02:44:57.717952	2017-03-01 02:44:57.717952	6	23
125	2017-03-01 02:44:57.739954	2017-03-01 02:44:57.739954	6	24
126	2017-03-01 02:44:57.763365	2017-03-01 02:44:57.763365	6	25
127	2017-03-01 02:44:57.785307	2017-03-01 02:44:57.785307	2	26
128	2017-03-01 02:44:57.806676	2017-03-01 02:44:57.806676	4	26
129	2017-03-01 02:44:57.829508	2017-03-01 02:44:57.829508	6	26
130	2017-03-01 02:44:57.852291	2017-03-01 02:44:57.852291	5	17
131	2017-03-01 02:44:57.87328	2017-03-01 02:44:57.87328	5	14
132	2017-03-01 02:44:57.895815	2017-03-01 02:44:57.895815	5	6
133	2017-03-01 02:44:57.918078	2017-03-01 02:44:57.918078	1	27
134	2017-03-01 02:44:57.939748	2017-03-01 02:44:57.939748	3	27
135	2017-03-01 02:44:57.964125	2017-03-01 02:44:57.964125	4	27
136	2017-03-01 02:44:57.986299	2017-03-01 02:44:57.986299	5	27
137	2017-03-01 02:44:58.006479	2017-03-01 02:44:58.006479	6	27
138	2017-03-01 02:44:58.029753	2017-03-01 02:44:58.029753	7	20
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
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	2017-03-01 02:44:39.518875	2017-03-01 02:44:39.518875	1	1	1	1	5	\N	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	2017-03-01 02:44:39.659321	2017-03-01 02:44:39.659321	1	1	1	1	4	\N	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	2017-03-01 02:44:39.747013	2017-03-01 02:44:39.747013	1	1	1	1	3	\N	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	2017-03-01 02:44:39.839499	2017-03-01 02:44:39.839499	1	1	1	1	2	\N	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	2017-03-01 02:44:39.923874	2017-03-01 02:44:39.923874	1	1	1	1	1	\N	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	2017-03-01 02:44:40.002461	2017-03-01 02:44:40.002461	1	1	1	1	4	\N	\N	7
7	EMP-007	Maria	Gonzalez	36134076	1991-11-05	176	7141			4401604	mg@gmail.com	Empleado	2017-03-01 02:44:40.105884	2017-03-01 02:44:40.105884	1	1	1	1	5	\N	1	8
8	EMP-008	Elena	Ceballos	25198461	1974-05-06	Tereré	7302	4	B	4355987	ec@gmail.com	Empleado	2017-03-01 02:44:40.205417	2017-03-01 02:44:40.205417	1	1	1	1	4	\N	1	7
9	EMP-009	Alberto	Padilla	33843657	1986-10-17	Rivera	6872			459885	ap@gmail.com	Empleado	2017-03-01 02:44:40.29688	2017-03-01 02:44:40.29688	1	1	1	1	3	\N	1	4
10	EMP-010	Fernando	Gonzalez	33980912	1987-01-21	Tereré	1187			4456980	fg@gmail.com	Empleado	2017-03-01 02:44:40.384584	2017-03-01 02:44:40.384584	1	1	1	1	2	\N	1	3
11	EMP-011	Tiago	Gonzalez	38187222	1995-06-08	Castilla	8299	10	15	4444176	tiagogonzales@gmail.com	Empleado	2017-03-01 02:44:40.472481	2017-03-01 02:44:40.472481	1	1	1	1	1	\N	1	2
12	EMP-012	Cintia	Castro	22612413	1970-02-20	Av. Andalucia	7415	12	A	4255987	cintiacastro@gmail.com	Empleado	2017-03-01 02:44:40.558778	2017-03-01 02:44:40.558778	1	1	1	1	4	\N	\N	7
13	EMP-013	Josefina	Jardin	36025176	1991-11-05	176	7141			4401604	josefinajardin@gmail.com	Empleado	2017-03-01 02:44:40.647849	2017-03-01 02:44:40.647849	1	1	1	1	5	\N	1	8
14	EMP-014	Diana	Rivas	25948001	1974-05-06	Tereré	7302	4	B	4355987	dianarivas@gmail.com	Empleado	2017-03-01 02:44:40.737089	2017-03-01 02:44:40.737089	1	1	1	1	4	\N	1	7
15	EMP-015	Dario	Gonzalez	33880019	1986-10-17	Rivera	6872			459885	dariogonzalez@gmail.com	Empleado	2017-03-01 02:44:40.827464	2017-03-01 02:44:40.827464	1	1	1	1	3	\N	1	4
16	EMP-016	Ciro	Zamora	33983707	1987-01-21	Tereré	1187			4456980	cirozamora@gmail.com	Empleado	2017-03-01 02:44:40.918491	2017-03-01 02:44:40.918491	1	1	1	1	2	\N	1	3
17	EMP-017	Zoe	Vazquez	3818104	1995-06-08	Castilla	8299	10	15	4444176	zoevazquez@gmail.com	Empleado	2017-03-01 02:44:41.008918	2017-03-01 02:44:41.008918	1	1	1	1	1	\N	1	2
18	EMP-018	Cristian	Gonzalez	22659193	1970-02-20	Av. Andalucia	7415	12	A	4255987	cristiangonzalez@gmail.com	Empleado	2017-03-01 02:44:41.09411	2017-03-01 02:44:41.09411	1	1	1	1	4	\N	\N	7
19	EMP-019	Ana	Manfrin	36222076	1991-11-05	176	7141			4401604	anamanfrin@gmail.com	Empleado	2017-03-01 02:44:41.237914	2017-03-01 02:44:41.237914	1	1	1	1	5	\N	1	8
20	EMP-020	Martina	Adamo	25841001	1974-05-06	Tereré	7302	4	B	4355987	martinaadamo@gmail.com	Empleado	2017-03-01 02:44:41.340268	2017-03-01 02:44:41.340268	1	1	1	1	4	\N	1	7
21	EMP-021	Roberto	Milani	33880333	1986-10-17	Rivera	6872			459885	robertomilani@gmail.com	Empleado	2017-03-01 02:44:41.430898	2017-03-01 02:44:41.430898	1	1	1	1	3	\N	1	4
22	EMP-022	Victor	Gonzalez	33984447	1987-01-21	Tereré	1187			4456980	victorgonzalez@gmail.com	Empleado	2017-03-01 02:44:41.516113	2017-03-01 02:44:41.516113	1	1	1	1	2	\N	1	3
23	EMP-023	Alejandro	Cambril	38113409	1995-06-08	Castilla	8299	10	15	4444176	alejandrocambril@gmail.com	Empleado	2017-03-01 02:44:41.703096	2017-03-01 02:44:41.703096	1	1	1	1	1	\N	1	2
24	EMP-024	Luis	Rizzo	22543493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luisrizzo@gmail.com	Empleado	2017-03-01 02:44:41.838052	2017-03-01 02:44:41.838052	1	1	1	1	4	\N	\N	7
25	EMP-025	Mario	Rosas	36060986	1991-11-05	176	7141			4401604	mariorosas@gmail.com	Empleado	2017-03-01 02:44:41.950548	2017-03-01 02:44:41.950548	1	1	1	1	5	\N	1	8
26	EMP-026	Analia	Granados	25131701	1974-05-06	Tereré	7302	4	B	4355987	analiagranados@gmail.com	Empleado	2017-03-01 02:44:42.026028	2017-03-01 02:44:42.026028	1	1	1	1	4	\N	1	7
27	EMP-027	Leonor	Gonzalez	33888717	1986-10-17	Rivera	6872			459885	leonorgonzalez@gmail.com	Empleado	2017-03-01 02:44:42.139858	2017-03-01 02:44:42.139858	1	1	1	1	3	\N	1	4
28	EMP-028	Victor	Baresi	33928407	1987-01-21	Tereré	1187			4456980	victorbaresi@gmail.com	Empleado	2017-03-01 02:44:42.224817	2017-03-01 02:44:42.224817	1	1	1	1	2	\N	1	3
29	EMP-029	Silvana	Lazzaga	38918849	1995-06-08	Castilla	8299	10	15	4444176	silvanalazzaga@gmail.com	Empleado	2017-03-01 02:44:42.303431	2017-03-01 02:44:42.303431	1	1	1	1	1	\N	1	2
30	EMP-030	Juana	Calabrese	220192493	1970-02-20	Av. Andalucia	7415	12	A	4255987	janacalabrese@gmail.com	Empleado	2017-03-01 02:44:42.393355	2017-03-01 02:44:42.393355	1	1	1	1	4	\N	\N	7
31	EMP-031	Juliana	Lombardi	38613849	1995-06-08	Castilla	8299	10	15	4444176	julianalombardi@gmail.com	Empleado	2017-03-01 02:44:42.479809	2017-03-01 02:44:42.479809	1	1	1	1	1	\N	1	2
32	EMP-032	Enrique	Cano	22451493	1970-02-20	Av. Andalucia	7415	12	A	4255987	enriquecano@gmail.com	Empleado	2017-03-01 02:44:42.572474	2017-03-01 02:44:42.572474	1	1	1	1	4	\N	\N	7
33	EMP-033	Gilda	Lombarde	36064356	1991-11-05	176	7141			4401604	gildalombarde@gmail.com	Empleado	2017-03-01 02:44:42.682251	2017-03-01 02:44:42.682251	1	1	1	1	5	\N	1	8
34	EMP-034	Martin	Bande	25124501	1974-05-06	Tereré	7302	4	B	4355987	martinbande@gmail.com	Empleado	2017-03-01 02:44:42.772972	2017-03-01 02:44:42.772972	1	1	1	1	4	\N	1	7
35	EMP-035	Gabriel	Ferruccio	33451657	1986-10-17	Rivera	6872			459885	gabrielferuccio@gmail.com	Empleado	2017-03-01 02:44:42.858088	2017-03-01 02:44:42.858088	1	1	1	1	3	\N	1	4
36	EMP-036	Juan	Mazzanti	33956107	1987-01-21	Tereré	1187			4456980	juanmazzanti@gmail.com	Empleado	2017-03-01 02:44:42.949874	2017-03-01 02:44:42.949874	1	1	1	1	2	\N	1	3
37	EMP-037	Karina	Fiorentino	38663849	1995-06-08	Castilla	8299	10	15	4444176	karinafiorentino@gmail.com	Empleado	2017-03-01 02:44:43.050213	2017-03-01 02:44:43.050213	1	1	1	1	1	\N	1	2
38	EMP-038	Osvaldo	Pagnotto	22019493	1970-02-20	Av. Andalucia	7415	12	A	4255987	osvaldopagnotto@gmail.com	Empleado	2017-03-01 02:44:43.138456	2017-03-01 02:44:43.138456	1	1	1	1	4	\N	\N	7
39	EMP-039	Margarita	Giordano	36068886	1991-11-05	176	7141			4401604	margaritagiordano@gmail.com	Empleado	2017-03-01 02:44:43.232818	2017-03-01 02:44:43.232818	1	1	1	1	5	\N	1	8
40	EMP-040	Rosa	Napolitano	2576401	1974-05-06	Tereré	7302	4	B	4355987	rosanapolitano@gmail.com	Empleado	2017-03-01 02:44:43.326361	2017-03-01 02:44:43.326361	1	1	1	1	4	\N	1	7
41	EMP-041	Magdalena	Bruno	38817849	1995-06-08	Castilla	8299	10	15	4444176	mardalenabruno@gmail.com	Empleado	2017-03-01 02:44:43.409245	2017-03-01 02:44:43.409245	1	1	1	1	1	\N	1	2
42	EMP-042	Mauricio	Costa	22755493	1970-02-20	Av. Andalucia	7415	12	A	4255987	mauriciocosta@gmail.com	Empleado	2017-03-01 02:44:43.535457	2017-03-01 02:44:43.535457	1	1	1	1	4	\N	\N	7
43	EMP-043	Ivan	Costas	36755076	1991-11-05	176	7141			4401604	ivancostas@gmail.com	Empleado	2017-03-01 02:44:43.625137	2017-03-01 02:44:43.625137	1	1	1	1	5	\N	1	8
44	EMP-044	Pablo	Davide	251934401	1974-05-06	Tereré	7302	4	B	4355987	pablodavide@gmail.com	Empleado	2017-03-01 02:44:43.71466	2017-03-01 02:44:43.71466	1	1	1	1	4	\N	1	7
45	EMP-045	Nicolas	Medina	33801927	1986-10-17	Rivera	6872			459885	nicolasmedina@gmail.com	Empleado	2017-03-01 02:44:43.801661	2017-03-01 02:44:43.801661	1	1	1	1	3	\N	1	4
46	EMP-046	Celeste	Milano	35122307	1987-01-21	Tereré	1187			4456980	celestemilano@gmail.com	Empleado	2017-03-01 02:44:43.907337	2017-03-01 02:44:43.907337	1	1	1	1	2	\N	1	3
47	EMP-047	Sebastian	Schiavone	38175649	1995-06-08	Castilla	8299	10	15	4444176	sebastianschiavone@gmail.com	Empleado	2017-03-01 02:44:44.005587	2017-03-01 02:44:44.005587	1	1	1	1	1	\N	1	2
48	EMP-048	Ruben	Almedina	22891493	1970-02-20	Av. Andalucia	7415	12	A	4255987	rubenalmedina@gmail.com	Empleado	2017-03-01 02:44:44.105327	2017-03-01 02:44:44.105327	1	1	1	1	4	\N	\N	7
49	EMP-049	Cristian	Camiño	36093716	1991-11-05	176	7141			4401604	cristiancamiño@gmail.com	Empleado	2017-03-01 02:44:44.222203	2017-03-01 02:44:44.222203	1	1	1	1	5	\N	1	8
50	EMP-050	Monica	Conti	25888001	1974-05-06	Tereré	7302	4	B	4355987	monicaconti@gmail.com	Empleado	2017-03-01 02:44:44.317282	2017-03-01 02:44:44.317282	1	1	1	1	4	\N	1	7
51	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	2017-03-01 02:44:44.454693	2017-03-01 02:44:44.454693	1	1	2	2	\N	\N	1	\N
52	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	2017-03-01 02:44:44.570167	2017-03-01 02:44:44.570167	1	1	2	1	\N	\N	1	\N
53	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	2017-03-01 02:44:44.671691	2017-03-01 02:44:44.671691	1	1	2	1	\N	\N	1	\N
54	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	2017-03-01 02:44:44.820088	2017-03-01 02:44:44.820088	1	1	2	1	\N	\N	1	\N
55	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	2017-03-01 02:44:44.92538	2017-03-01 02:44:44.92538	1	1	2	1	\N	\N	1	\N
56	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	2017-03-01 02:44:45.018006	2017-03-01 02:44:45.018006	1	1	2	2	\N	\N	1	\N
57	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	2017-03-01 02:44:45.108276	2017-03-01 02:44:45.108276	1	1	2	1	\N	\N	1	\N
58	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	2017-03-01 02:44:45.2259	2017-03-01 02:44:45.2259	1	1	2	1	\N	\N	1	\N
59	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	2017-03-01 02:44:45.332407	2017-03-01 02:44:45.332407	1	1	2	1	\N	\N	1	\N
60	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	2017-03-01 02:44:45.417422	2017-03-01 02:44:45.417422	1	1	2	2	\N	\N	1	\N
61	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	2017-03-01 02:44:45.532763	2017-03-01 02:44:45.532763	1	1	2	1	\N	\N	1	\N
62	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	2017-03-01 02:44:45.642099	2017-03-01 02:44:45.642099	1	1	2	1	\N	\N	1	\N
63	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	2017-03-01 02:44:45.740965	2017-03-01 02:44:45.740965	1	1	2	1	\N	\N	1	\N
64	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	2017-03-01 02:44:45.873375	2017-03-01 02:44:45.873375	1	1	2	2	\N	\N	1	\N
65	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	2017-03-01 02:44:45.98516	2017-03-01 02:44:45.98516	1	1	2	1	\N	\N	1	\N
66	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	2017-03-01 02:44:46.093907	2017-03-01 02:44:46.093907	1	1	2	1	\N	\N	1	\N
67	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	2017-03-01 02:44:46.216383	2017-03-01 02:44:46.216383	1	1	2	1	\N	\N	1	\N
68	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	2017-03-01 02:44:46.305922	2017-03-01 02:44:46.305922	1	1	2	2	\N	\N	1	\N
69	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	2017-03-01 02:44:46.393603	2017-03-01 02:44:46.393603	1	1	2	1	\N	\N	1	\N
70	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	2017-03-01 02:44:46.481993	2017-03-01 02:44:46.481993	1	1	2	1	\N	\N	1	\N
71	ME-021	Lidia	Delucci	28088944	1981-01-29	Chile	6144			481898	lidiadelucci@gmail.com	MiembroEquipo	2017-03-01 02:44:46.572253	2017-03-01 02:44:46.572253	1	1	2	1	\N	\N	1	\N
72	ME-022	Leonor	Gomez Santos	40560231	1996-03-13	Plaza Mayor	2637			4536662	leonorgs@gmail.com	MiembroEquipo	2017-03-01 02:44:46.660853	2017-03-01 02:44:46.660853	1	1	2	1	\N	\N	1	\N
73	ME-023	Lara	Gonçalves	29075344	1980-07-19	España	1415			4498457	laragoncalves@gmail.com	MiembroEquipo	2017-03-01 02:44:46.761642	2017-03-01 02:44:46.761642	1	1	2	1	\N	\N	1	\N
74	ME-024	Martin	Diaz	26070390	1976-08-11	calle Nueva	1826			491088	martindiaz@gmail.com	MiembroEquipo	2017-03-01 02:44:46.86306	2017-03-01 02:44:46.86306	1	1	2	1	\N	\N	1	\N
75	ME-025	Marina	Diaz	26070394	1976-08-11	calle Nueva	1826			491088	marinadiaz@gmail.com	MiembroEquipo	2017-03-01 02:44:46.953317	2017-03-01 02:44:46.953317	1	1	2	1	\N	\N	1	\N
76	ME-026	Gerardo	Urbina	29234987	1980-05-31	Álamo	6162			455433	gerardou@gmail.com	MiembroEquipo	2017-03-01 02:44:47.042234	2017-03-01 02:44:47.042234	1	1	2	1	\N	\N	1	\N
77	ME-027	Silvio	Quiroz	35465922	1990-02-27	Álamo	2128			415176	silvioquiroz@gmail.com	MiembroEquipo	2017-03-01 02:44:47.146478	2017-03-01 02:44:47.146478	1	1	2	1	\N	\N	1	\N
78	ME-028	Gabriela	Garcia	33457976	1987-12-19	Alem	123			451912	lidiadelucci@gmail.com	MiembroEquipo	2017-03-01 02:44:47.267366	2017-03-01 02:44:47.267366	1	1	2	1	\N	\N	1	\N
79	ME-029	Leonardo	Rios	29524865	1981-11-30	Concepcion	5139			4590871	lidiadelucci@gmail.com	MiembroEquipo	2017-03-01 02:44:47.384675	2017-03-01 02:44:47.384675	1	1	2	1	\N	\N	1	\N
80	ME-030	Ubaldo	Gomez	34123456	1990-04-08	Entre Rios	1235			456798	ubaldogomez@gmail.com	MiembroEquipo	2017-03-01 02:44:47.460308	2017-03-01 02:44:47.460308	1	1	2	1	\N	\N	1	\N
81	ME-031	Silvio	Gonzalez	29092236	1980-05-16	Cordoba	7213			4501923	silviogonzalez@gmail.com	MiembroEquipo	2017-03-01 02:44:47.53757	2017-03-01 02:44:47.53757	1	1	2	1	\N	\N	1	\N
82	ME-032	Rosa	Fernandez	20112254	1968-09-13	San Martin	1028			4567895	rosafernandez@gmail.com	MiembroEquipo	2017-03-01 02:44:47.616781	2017-03-01 02:44:47.616781	1	1	2	1	\N	\N	1	\N
83	ME-033	Alejandro	Fernandez	20998871	1987-05-16	Santa Fe	4812			4311235	alefernandez@gmail.com	MiembroEquipo	2017-03-01 02:44:47.750286	2017-03-01 02:44:47.750286	1	1	2	1	\N	\N	1	\N
84	ME-034	Hugo	Rios	40034940	1998-11-30	Alvear	5028			481341	hugorios@gmail.com	MiembroEquipo	2017-03-01 02:44:47.828118	2017-03-01 02:44:47.828118	1	1	2	1	\N	\N	1	\N
85	ME-035	Mario	Garcia	24654447	1976-04-08	Roca	193			4212351	mariogarcia@gmail.com	MiembroEquipo	2017-03-01 02:44:47.915659	2017-03-01 02:44:47.915659	1	1	2	1	\N	\N	1	\N
86	ME-036	Marina	Moralez	36421952	1992-08-19	Ucrania	9371			451241	marimamoralez@gmail.com	MiembroEquipo	2017-03-01 02:44:47.994104	2017-03-01 02:44:47.994104	1	1	2	1	\N	\N	1	\N
87	ME-037	Silvina	Portillo	26498388	1976-06-05	Av Queirel	7621			431214	silvinaportillo@gmail.com	MiembroEquipo	2017-03-01 02:44:48.071213	2017-03-01 02:44:48.071213	1	1	2	1	\N	\N	1	\N
88	ME-038	Maria	Maciel	33428434	1989-09-04	Paraguay	600			4761602	mariamaciel@gmail.com	MiembroEquipo	2017-03-01 02:44:48.150473	2017-03-01 02:44:48.150473	1	1	2	1	\N	\N	1	\N
89	ME-039	Angeles	Granados	31452518	1981-04-09	Uruguay	12			481858	angelesgranados@gmail.com	MiembroEquipo	2017-03-01 02:44:48.227999	2017-03-01 02:44:48.227999	1	1	2	1	\N	\N	1	\N
90	ME-040	Cintia	Gutierrez	29701192	1992-11-05	Av Roca	464			483498	cintiagutierrez@gmail.com	MiembroEquipo	2017-03-01 02:44:48.329565	2017-03-01 02:44:48.329565	1	1	2	1	\N	\N	1	\N
91	ME-041	David	Sedillo	36371823	1975-07-23	Centenario	6135			481018	davidsedillo@gmail.com	MiembroEquipo	2017-03-01 02:44:48.415351	2017-03-01 02:44:48.415351	1	1	2	1	\N	\N	1	\N
92	ME-042	Sofia	Garcia	25370180	1998-01-13	Las Flores	1234			409498	sofiagarcia@gmail.com	MiembroEquipo	2017-03-01 02:44:48.506983	2017-03-01 02:44:48.506983	1	1	2	1	\N	\N	1	\N
93	ME-043	Alicia	Villalba	27455263	1979-04-17	Las Palmeras	9876			420184	alivillalba@gmail.com	MiembroEquipo	2017-03-01 02:44:48.596482	2017-03-01 02:44:48.596482	1	1	2	1	\N	\N	1	\N
94	ME-044	Luis	Gonzalez	36182911	1992-06-19	Las Orquideas	900			495712	luisgonzalez@gmail.com	MiembroEquipo	2017-03-01 02:44:48.69657	2017-03-01 02:44:48.69657	1	1	2	1	\N	\N	1	\N
95	ME-045	Ernesto	Da Luz	30346514	1983-06-19	Rosas	2463			413048	ernestodaluz@gmail.com	MiembroEquipo	2017-03-01 02:44:48.801419	2017-03-01 02:44:48.801419	1	1	2	1	\N	\N	1	\N
96	ME-046	Luciano	Garcia	39019733	1996-03-13	Colon	8123			412451	lucianogarcia@gmail.com	MiembroEquipo	2017-03-01 02:44:48.90535	2017-03-01 02:44:48.90535	1	1	2	1	\N	\N	1	\N
97	ME-047	Gerardo	Cano	29232117	1980-07-19	Escuelita	9173			462093	gerardocano@gmail.com	MiembroEquipo	2017-03-01 02:44:49.008222	2017-03-01 02:44:49.008222	1	1	2	1	\N	\N	1	\N
98	ME-048	Hector	Rincon	29222287	1980-05-31	Japon	2546			471927	hectorrincon@gmail.com	MiembroEquipo	2017-03-01 02:44:49.105856	2017-03-01 02:44:49.105856	1	1	2	1	\N	\N	1	\N
99	ME-049	Alberto	Gonzalez	35225922	1990-02-27	Colombia	2871			431570	albertogonzalez@gmail.com	MiembroEquipo	2017-03-01 02:44:49.195712	2017-03-01 02:44:49.195712	1	1	2	1	\N	\N	1	\N
100	ME-050	Roberto	Lujan	35461122	1990-05-27	Noruega	1980			401938	robertolujan@gmail.com	MiembroEquipo	2017-03-01 02:44:49.275505	2017-03-01 02:44:49.275505	1	1	2	1	\N	\N	1	\N
101	CO-001	María Rosa	Conti	25644132	1975-07-03	Ituzaingo	245	12	B	424568	mrconti@gmail.com	Contacto	2017-03-01 02:45:17.465398	2017-03-01 02:45:17.465398	1	1	1	1	\N	1	1	\N
102	CO-002	Berta	Rivera	33958772	1989-04-11	Leandro Gomez	5886	\N	\N	4598765	brivera@gmail.com	Contacto	2017-03-01 02:45:17.559417	2017-03-01 02:45:17.559417	1	1	1	1	\N	2	1	\N
103	CO-003	Juliana	Castiglione	30444512	1980-12-09	Brisas	3280	5	15	555321	jcastiglione@gmail.com	Contacto	2017-03-01 02:45:17.648429	2017-03-01 02:45:17.648429	1	1	1	1	\N	3	1	\N
104	CO-004	Nahuel	Estevez	19423568	1966-11-28	Av. Alta Gracia	5332	12	B	154632108	mrconti@gmail.com	Contacto	2017-03-01 02:45:17.737442	2017-03-01 02:45:17.737442	1	1	1	1	\N	4	1	\N
105	CO-005	Pablo	Gomez	25221305	1970-03-05	Neruda	7393	12	B	154245689	mrconti@gmail.com	Contacto	2017-03-01 02:45:17.824932	2017-03-01 02:45:17.824932	1	1	1	1	\N	5	1	\N
106	CO-006	Abigaíl	Coronado	37926793	1994-03-21	F. Varela	5659	12	B	432666	mrconti@gmail.com	Contacto	2017-03-01 02:45:17.915421	2017-03-01 02:45:17.915421	1	1	1	1	\N	6	1	\N
107	CO-007	Hilda	Zielinski	25334991	1970-04-07	Joaquin Suarez	6863	12	B	4478909	mrconti@gmail.com	Contacto	2017-03-01 02:45:18.002541	2017-03-01 02:45:18.002541	1	1	1	1	\N	7	1	\N
\.


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
1	2017-03-01 02:45:18.322599	2017-03-01 02:45:18.322599	1	27
2	2017-03-01 02:45:18.341939	2017-03-01 02:45:18.341939	2	28
3	2017-03-01 02:45:18.364213	2017-03-01 02:45:18.364213	2	29
\.


--
-- Name: personas_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_eventos_id_seq', 3, true);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 107, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-03-01 02:44:52.197395	2017-03-01 02:44:52.197395	1	51
2	2017-03-01 02:44:52.216541	2017-03-01 02:44:52.216541	1	2
3	2017-03-01 02:44:52.239488	2017-03-01 02:44:52.239488	2	2
4	2017-03-01 02:44:52.260569	2017-03-01 02:44:52.260569	2	52
5	2017-03-01 02:44:52.282825	2017-03-01 02:44:52.282825	2	53
6	2017-03-01 02:44:52.30516	2017-03-01 02:44:52.30516	3	6
7	2017-03-01 02:44:52.327381	2017-03-01 02:44:52.327381	3	54
8	2017-03-01 02:44:52.349526	2017-03-01 02:44:52.349526	3	55
9	2017-03-01 02:44:52.3729	2017-03-01 02:44:52.3729	4	6
10	2017-03-01 02:44:52.394357	2017-03-01 02:44:52.394357	4	56
11	2017-03-01 02:44:52.450872	2017-03-01 02:44:52.450872	4	57
12	2017-03-01 02:44:52.532525	2017-03-01 02:44:52.532525	5	2
13	2017-03-01 02:44:52.573363	2017-03-01 02:44:52.573363	5	58
14	2017-03-01 02:44:52.632458	2017-03-01 02:44:52.632458	5	59
15	2017-03-01 02:44:52.72581	2017-03-01 02:44:52.72581	6	2
16	2017-03-01 02:44:52.77257	2017-03-01 02:44:52.77257	6	60
17	2017-03-01 02:44:52.795214	2017-03-01 02:44:52.795214	6	61
18	2017-03-01 02:44:52.816972	2017-03-01 02:44:52.816972	6	62
19	2017-03-01 02:44:52.83981	2017-03-01 02:44:52.83981	7	6
20	2017-03-01 02:44:52.862445	2017-03-01 02:44:52.862445	7	63
21	2017-03-01 02:44:52.884558	2017-03-01 02:44:52.884558	7	64
22	2017-03-01 02:44:52.90664	2017-03-01 02:44:52.90664	8	2
23	2017-03-01 02:44:52.927794	2017-03-01 02:44:52.927794	8	65
24	2017-03-01 02:44:52.951278	2017-03-01 02:44:52.951278	9	6
25	2017-03-01 02:44:52.97214	2017-03-01 02:44:52.97214	9	66
26	2017-03-01 02:44:52.994947	2017-03-01 02:44:52.994947	9	67
27	2017-03-01 02:44:53.017945	2017-03-01 02:44:53.017945	10	2
28	2017-03-01 02:44:53.039877	2017-03-01 02:44:53.039877	10	68
29	2017-03-01 02:44:53.062637	2017-03-01 02:44:53.062637	10	69
30	2017-03-01 02:44:53.083635	2017-03-01 02:44:53.083635	10	70
31	2017-03-01 02:44:53.10687	2017-03-01 02:44:53.10687	11	71
32	2017-03-01 02:44:53.128059	2017-03-01 02:44:53.128059	11	72
33	2017-03-01 02:44:53.151428	2017-03-01 02:44:53.151428	11	8
34	2017-03-01 02:44:53.172912	2017-03-01 02:44:53.172912	12	57
35	2017-03-01 02:44:53.195944	2017-03-01 02:44:53.195944	12	65
36	2017-03-01 02:44:53.218002	2017-03-01 02:44:53.218002	12	6
37	2017-03-01 02:44:53.240273	2017-03-01 02:44:53.240273	13	96
38	2017-03-01 02:44:53.302042	2017-03-01 02:44:53.302042	13	99
39	2017-03-01 02:44:53.328108	2017-03-01 02:44:53.328108	13	8
40	2017-03-01 02:44:53.351092	2017-03-01 02:44:53.351092	14	80
41	2017-03-01 02:44:53.372474	2017-03-01 02:44:53.372474	14	100
42	2017-03-01 02:44:53.395599	2017-03-01 02:44:53.395599	14	12
43	2017-03-01 02:44:53.417119	2017-03-01 02:44:53.417119	15	89
44	2017-03-01 02:44:53.440306	2017-03-01 02:44:53.440306	15	90
45	2017-03-01 02:44:53.461917	2017-03-01 02:44:53.461917	15	92
46	2017-03-01 02:44:53.484831	2017-03-01 02:44:53.484831	15	8
47	2017-03-01 02:44:53.507254	2017-03-01 02:44:53.507254	16	65
48	2017-03-01 02:44:53.528096	2017-03-01 02:44:53.528096	16	67
49	2017-03-01 02:44:53.55147	2017-03-01 02:44:53.55147	16	77
50	2017-03-01 02:44:53.573621	2017-03-01 02:44:53.573621	16	6
51	2017-03-01 02:44:53.595899	2017-03-01 02:44:53.595899	17	96
52	2017-03-01 02:44:53.631702	2017-03-01 02:44:53.631702	17	97
53	2017-03-01 02:44:53.650648	2017-03-01 02:44:53.650648	17	2
54	2017-03-01 02:44:53.672889	2017-03-01 02:44:53.672889	18	75
55	2017-03-01 02:44:53.695665	2017-03-01 02:44:53.695665	18	76
56	2017-03-01 02:44:53.718071	2017-03-01 02:44:53.718071	18	77
57	2017-03-01 02:44:53.740041	2017-03-01 02:44:53.740041	18	14
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 57, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-03-01 02:44:37.836399	2017-03-01 02:44:37.836399	1
2	Corrientes	2017-03-01 02:44:37.864348	2017-03-01 02:44:37.864348	1
3	Itapúa	2017-03-01 02:44:37.899784	2017-03-01 02:44:37.899784	2
4	Bahia	2017-03-01 02:44:37.927887	2017-03-01 02:44:37.927887	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-03-01 02:44:50.751935	2017-03-01 02:44:50.751935	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-03-01 02:44:50.840597	2017-03-01 02:44:50.840597	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-03-01 02:44:50.945424	2017-03-01 02:44:50.945424	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-03-01 02:44:51.034101	2017-03-01 02:44:51.034101	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-03-01 02:44:51.111191	2017-03-01 02:44:51.111191	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-03-01 02:44:51.201915	2017-03-01 02:44:51.201915	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-03-01 02:44:51.280972	2017-03-01 02:44:51.280972	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-03-01 02:44:51.356252	2017-03-01 02:44:51.356252	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-03-01 02:44:51.45212	2017-03-01 02:44:51.45212	1	1	1	1	1
11	PR-011	Percentil	Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para hacerlo en escala y poder ganar dinero con ello.	España	422			4590432	percentil@gmail.com	percentil.com	2017-03-01 02:44:51.538112	2017-03-01 02:44:51.538112	1	1	1	1	1
12	PR-012	EmbryoTools	 Son una referencia mundial en reproducción asistida. Trabajan en cuatro ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos, porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de los productos que vayan a entrar en contacto con embriones humanos y por último trabajan en la reproducción asistida en veterinaria.	Mariano Moreno	4122			465888	embryotools@gmail.com	embryotools.com	2017-03-01 02:44:51.62227	2017-03-01 02:44:51.62227	1	1	1	1	1
13	PR-013	Aplázame	 Es un método de pago que se integra en el proceso de compra del comercio electrónico y permite a los clientes de las tiendas online comprar con un crédito instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando para hacerlo en breve.	Av. San Martin	4532			453222	aplazame@gmail.com	aplazame.com	2017-03-01 02:44:51.713897	2017-03-01 02:44:51.713897	1	1	1	1	1
14	PR-014	BrioAgro Technologies	Deesarrollo de una tecnología para que el agricultor controle su explotación. El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor, a través de su dispositivo, se conecta a la nube para acceder a la información de su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier cambio en sus variables.	Colon 	555			4651244	bioagro@gmail.com	bioagro.com	2017-03-01 02:44:51.794158	2017-03-01 02:44:51.794158	1	1	1	1	1
15	PR-015	Braingaze	La tecnología desarrollada detecta un pequeño movimiento ocular que permite determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y dislexia.	Miami	708			490123	baringaze@gmail.com	braingaze.com	2017-03-01 02:44:51.903655	2017-03-01 02:44:51.903655	1	1	1	1	1
16	PR-016	CreatorStats	Mejoran la métrica de los ‘youtubers’.	Inglaterra	200			15432510	creatorstats@gmail.com	creatorstats.com	2017-03-01 02:44:51.978292	2017-03-01 02:44:51.978292	1	1	1	1	1
17	PR-017	Alzhup	Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología como vehículo para que la solución sea accesible a todo el mundo. Implementan a nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados científicamente. Y también, herramientas para la memoria, capaces de personalizar dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro almacena los recuerdos y que difiere de los sistemas actuales computarizados.	Constitucion	2222			467632	alzhup@gmail.com	alzhup.com	2017-03-01 02:44:52.046557	2017-03-01 02:44:52.046557	1	1	1	1	1
18	PR-018	Axter Aerospace	Están desarrollando un sistema de propulsión híbrida para las avionetas, que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU. De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción y ensamblado.	Ayacucho	9200			432111	axteraerospace@gmail.com	axteraerospace.com	2017-03-01 02:44:52.112029	2017-03-01 02:44:52.112029	1	1	1	1	1
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-03-01 02:44:50.664373	2017-03-01 09:22:35.958273	1	1	1	2	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 18, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-03-01 02:44:58.110026	2017-03-01 02:44:58.110026
2	super_admin	2017-03-01 02:44:58.140031	2017-03-01 02:44:58.140031
3	Encargado de Proyectos (mentor)	2017-03-01 02:44:58.163102	2017-03-01 02:44:58.163102
4	Miembro de Equipo	2017-03-01 02:44:58.185218	2017-03-01 02:44:58.185218
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-03-01 02:44:38.784512	2017-03-01 02:44:38.784512	1
2	Encargado de recaudaciones e ingresos	2017-03-01 02:44:38.845685	2017-03-01 02:44:38.845685	1
3	Jefe de Recursos Humanos	2017-03-01 02:44:38.909011	2017-03-01 02:44:38.909011	2
4	Jefe de mercadeo	2017-03-01 02:44:38.968681	2017-03-01 02:44:38.968681	3
5	jefe de producción	2017-03-01 02:44:39.031051	2017-03-01 02:44:39.031051	3
6	Investigación y desarrollo	2017-03-01 02:44:39.09761	2017-03-01 02:44:39.09761	4
7	Capacitación - Mentoring	2017-03-01 02:44:39.18566	2017-03-01 02:44:39.18566	4
8	Director General	2017-03-01 02:44:39.242092	2017-03-01 02:44:39.242092	5
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
20170227122859
20170227122903
20170227122909
\.


--
-- Data for Name: systemsettings; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY systemsettings (id, numero_abandono, tiempo_abandono, tipo_de_pago_id, created_at, updated_at) FROM stdin;
1	5	minutes	4	2017-03-01 02:48:19.267399	2017-03-01 02:48:19.267399
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, true);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-03-01 02:44:38.246319	2017-03-01 02:44:38.246319
2	Libreta de Enrolamiento	2017-03-01 02:44:38.271465	2017-03-01 02:44:38.271465
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-03-01 02:45:06.835402	2017-03-01 02:45:06.835402
2	Tarjeta de crédito Visa	2017-03-01 02:45:06.892854	2017-03-01 02:45:06.892854
3	Tarjeta Naranja	2017-03-01 02:45:06.936119	2017-03-01 02:45:06.936119
4	Saldo de cuenta	2017-03-01 02:45:06.984577	2017-03-01 02:45:06.984577
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	0	\N	\N	\N	\N	2017-03-01 02:44:59.122168	2017-03-01 02:44:59.122168	1	2
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-03-01 02:44:59.37329	2017-03-01 02:44:59.37329	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-03-01 02:44:59.632838	2017-03-01 02:44:59.632838	2	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-03-01 02:45:07.928892	2017-03-01 02:45:07.928892	1	1
2	2017-01-20	2017-03-01 02:45:07.957118	2017-03-01 02:45:07.957118	1	1
3	2017-02-10	2017-03-01 02:45:07.978085	2017-03-01 02:45:07.978085	2	1
4	2017-02-20	2017-03-01 02:45:08.000984	2017-03-01 02:45:08.000984	2	1
5	2017-03-10	2017-03-01 02:45:08.021482	2017-03-01 02:45:08.021482	3	1
6	2017-03-20	2017-03-01 02:45:08.044424	2017-03-01 02:45:08.044424	3	1
7	2017-04-10	2017-03-01 02:45:08.066639	2017-03-01 02:45:08.066639	4	1
8	2017-04-20	2017-03-01 02:45:08.089031	2017-03-01 02:45:08.089031	4	1
9	2017-05-10	2017-03-01 02:45:08.111558	2017-03-01 02:45:08.111558	5	1
10	2017-05-20	2017-03-01 02:45:08.131464	2017-03-01 02:45:08.131464	5	1
11	2017-06-10	2017-03-01 02:45:08.154446	2017-03-01 02:45:08.154446	6	1
12	2017-06-20	2017-03-01 02:45:08.176533	2017-03-01 02:45:08.176533	6	1
13	2017-07-10	2017-03-01 02:45:08.19833	2017-03-01 02:45:08.19833	7	1
14	2017-07-20	2017-03-01 02:45:08.222937	2017-03-01 02:45:08.222937	7	1
15	2017-08-10	2017-03-01 02:45:08.245471	2017-03-01 02:45:08.245471	8	1
16	2017-08-20	2017-03-01 02:45:08.267059	2017-03-01 02:45:08.267059	8	1
17	2017-09-10	2017-03-01 02:45:08.288872	2017-03-01 02:45:08.288872	9	1
18	2017-09-20	2017-03-01 02:45:08.312264	2017-03-01 02:45:08.312264	9	1
19	2017-10-10	2017-03-01 02:45:08.334349	2017-03-01 02:45:08.334349	10	1
20	2017-10-20	2017-03-01 02:45:08.35543	2017-03-01 02:45:08.35543	10	1
21	2017-11-10	2017-03-01 02:45:08.379175	2017-03-01 02:45:08.379175	11	1
22	2017-11-20	2017-03-01 02:45:08.399926	2017-03-01 02:45:08.399926	11	1
23	2017-12-10	2017-03-01 02:45:08.422189	2017-03-01 02:45:08.422189	12	1
24	2017-12-20	2017-03-01 02:45:08.445367	2017-03-01 02:45:08.445367	12	1
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

