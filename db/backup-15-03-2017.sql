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
1	Crear	create	2017-03-14 09:33:40.344762	2017-03-14 09:33:40.344762
2	Eliminar	destroy	2017-03-14 09:33:40.375601	2017-03-14 09:33:40.375601
3	Ver	show	2017-03-14 09:33:40.407305	2017-03-14 09:33:40.407305
4	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-03-14 09:33:40.441501	2017-03-14 09:33:40.441501
5	Index	index	2017-03-14 09:33:40.474232	2017-03-14 09:33:40.474232
6	Editar	update	2017-03-14 09:33:40.495474	2017-03-14 09:33:40.495474
7	Estadisticas	estadistica	2017-03-14 09:33:40.518592	2017-03-14 09:33:40.518592
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 7, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	--- []\n	2017-03-14 09:33:36.684539	2017-03-14 09:33:36.684539	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-03-14 09:33:36.77057	2017-03-14 09:33:36.77057	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-03-14 09:33:36.84419	2017-03-14 09:33:36.84419	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-03-14 09:33:36.905368	2017-03-14 09:33:36.905368	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-03-14 09:33:36.964073	2017-03-14 09:33:36.964073	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-03-14 09:33:37.029701	2017-03-14 09:33:37.029701	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-03-14 09:33:37.094837	2017-03-14 09:33:37.094837	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-03-14 09:33:37.148485	2017-03-14 09:33:37.148485	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-03-14 09:33:37.20376	2017-03-14 09:33:37.20376	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-03-14 09:33:37.266326	2017-03-14 09:33:37.266326	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-03-14 09:33:37.391305	2017-03-14 09:33:37.391305	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
1	\N	2017-03-14 09:33:46.220547	2017-03-14 09:33:46.220547	1	1	3
2	\N	2017-03-14 09:33:46.278372	2017-03-14 09:33:46.278372	1	2	3
3	\N	2017-03-14 09:33:46.32284	2017-03-14 09:33:46.32284	1	3	2
4	\N	2017-03-14 09:33:46.379546	2017-03-14 09:33:46.379546	2	1	3
5	\N	2017-03-14 09:33:46.433769	2017-03-14 09:33:46.433769	2	2	3
6	\N	2017-03-14 09:33:46.489892	2017-03-14 09:33:46.489892	2	3	2
7	\N	2017-03-14 09:33:46.534114	2017-03-14 09:33:46.534114	3	1	3
8	\N	2017-03-14 09:33:46.589494	2017-03-14 09:33:46.589494	3	2	3
9	\N	2017-03-14 09:33:46.633907	2017-03-14 09:33:46.633907	3	3	2
10	\N	2017-03-14 09:33:46.690378	2017-03-14 09:33:46.690378	4	1	3
11	\N	2017-03-14 09:33:46.745588	2017-03-14 09:33:46.745588	4	2	3
12	\N	2017-03-14 09:33:46.801182	2017-03-14 09:33:46.801182	4	3	2
13	\N	2017-03-14 09:33:46.844849	2017-03-14 09:33:46.844849	5	1	3
14	\N	2017-03-14 09:33:46.889709	2017-03-14 09:33:46.889709	5	2	3
15	\N	2017-03-14 09:33:46.933916	2017-03-14 09:33:46.933916	5	3	2
16	\N	2017-03-14 09:33:46.97891	2017-03-14 09:33:46.97891	6	1	3
17	\N	2017-03-14 09:33:47.023183	2017-03-14 09:33:47.023183	6	2	3
18	\N	2017-03-14 09:33:47.067518	2017-03-14 09:33:47.067518	6	3	2
19	\N	2017-03-14 09:33:47.111986	2017-03-14 09:33:47.111986	7	1	3
20	\N	2017-03-14 09:33:47.156588	2017-03-14 09:33:47.156588	7	2	3
21	\N	2017-03-14 09:33:47.200876	2017-03-14 09:33:47.200876	7	3	2
22	\N	2017-03-14 09:33:47.282738	2017-03-14 09:33:47.282738	8	1	3
23	\N	2017-03-14 09:33:47.34705	2017-03-14 09:33:47.34705	8	2	3
24	\N	2017-03-14 09:33:47.401632	2017-03-14 09:33:47.401632	8	3	2
25	\N	2017-03-14 09:33:47.445929	2017-03-14 09:33:47.445929	9	1	3
26	\N	2017-03-14 09:33:47.500621	2017-03-14 09:33:47.500621	9	2	3
27	\N	2017-03-14 09:33:47.545154	2017-03-14 09:33:47.545154	9	3	2
28	\N	2017-03-14 09:33:47.590294	2017-03-14 09:33:47.590294	10	1	3
29	\N	2017-03-14 09:33:47.63587	2017-03-14 09:33:47.63587	10	2	3
30	\N	2017-03-14 09:33:47.689908	2017-03-14 09:33:47.689908	10	3	2
31	\N	2017-03-14 09:33:47.734789	2017-03-14 09:33:47.734789	11	1	3
32	\N	2017-03-14 09:33:47.791564	2017-03-14 09:33:47.791564	11	2	3
33	\N	2017-03-14 09:33:47.846051	2017-03-14 09:33:47.846051	11	3	2
34	\N	2017-03-14 09:33:47.890294	2017-03-14 09:33:47.890294	12	1	3
35	\N	2017-03-14 09:33:48.161531	2017-03-14 09:33:48.161531	12	2	3
36	\N	2017-03-14 09:33:48.212702	2017-03-14 09:33:48.212702	12	3	2
37	\N	2017-03-14 09:33:48.269216	2017-03-14 09:33:48.269216	13	1	3
38	\N	2017-03-14 09:33:48.324013	2017-03-14 09:33:48.324013	13	2	3
39	\N	2017-03-14 09:33:48.367536	2017-03-14 09:33:48.367536	13	3	2
40	\N	2017-03-14 09:33:48.412652	2017-03-14 09:33:48.412652	14	1	3
41	\N	2017-03-14 09:33:48.468406	2017-03-14 09:33:48.468406	14	2	3
42	\N	2017-03-14 09:33:48.51237	2017-03-14 09:33:48.51237	14	3	2
43	\N	2017-03-14 09:33:48.567792	2017-03-14 09:33:48.567792	15	1	3
44	\N	2017-03-14 09:33:48.612466	2017-03-14 09:33:48.612466	15	2	3
45	\N	2017-03-14 09:33:48.656895	2017-03-14 09:33:48.656895	15	3	2
46	\N	2017-03-14 09:33:48.70188	2017-03-14 09:33:48.70188	16	1	3
47	\N	2017-03-14 09:33:48.758694	2017-03-14 09:33:48.758694	16	2	3
48	\N	2017-03-14 09:33:48.801323	2017-03-14 09:33:48.801323	16	3	2
49	\N	2017-03-14 09:33:48.846209	2017-03-14 09:33:48.846209	17	1	3
50	\N	2017-03-14 09:33:48.890276	2017-03-14 09:33:48.890276	17	2	3
51	\N	2017-03-14 09:33:48.934995	2017-03-14 09:33:48.934995	17	3	2
52	\N	2017-03-14 09:33:48.979665	2017-03-14 09:33:48.979665	18	1	3
53	\N	2017-03-14 09:33:49.036195	2017-03-14 09:33:49.036195	18	2	3
54	\N	2017-03-14 09:33:49.079719	2017-03-14 09:33:49.079719	18	3	2
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 54, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-03-14 09:33:26.68184	2017-03-14 09:33:26.68184
2	Rural	2017-03-14 09:33:26.71188	2017-03-14 09:33:26.71188
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	93ad641b-fadb-4270-9b36-47f0b7a96df0	2017-03-14 09:33:26.93305
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	c69927c7-abd3-408a-878e-d5dfbd6e85d9	2017-03-14 09:33:27.48383
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	b44cd99a-c565-4c1c-a4a1-713efe6cfd6e	2017-03-14 09:33:27.539152
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	95779947-0422-49dc-8cdb-36a1ae1e2c80	2017-03-14 09:33:27.615965
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	31c2772b-3dc5-4248-a390-876692657e3c	2017-03-14 09:33:27.66147
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	37c5e305-9a5f-4093-a984-5d93c27a017b	2017-03-14 09:33:27.909072
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	ff96dba0-292c-4cdb-bfa2-546c06dc6f07	2017-03-14 09:33:27.992064
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	9c4fe2a5-9a88-446a-8572-956840bad957	2017-03-14 09:33:28.074458
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	55d3b970-8a0e-4b8f-ae04-805425a69f0e	2017-03-14 09:33:28.158171
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	5b23569c-f99e-41e1-96c4-25d20af2edbb	2017-03-14 09:33:28.240251
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	3e62cb21-3f94-40dc-bdbd-9ada477f5b11	2017-03-14 09:33:28.334773
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-007\nnombre: Maria\napellido: Gonzalez\nnroIdentificacion: '36134076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mg@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	3494db21-9e09-4e41-a46a-e7de50708b8f	2017-03-14 09:33:28.417649
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-008\nnombre: Elena\napellido: Ceballos\nnroIdentificacion: '25198461'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: ec@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	cab14602-99a6-471e-a243-ae3e96febb93	2017-03-14 09:33:28.504634
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-009\nnombre: Alberto\napellido: Padilla\nnroIdentificacion: '33843657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: ap@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	c25f8ffb-b5d8-456f-aa99-803903432cdc	2017-03-14 09:33:28.583258
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-010\nnombre: Fernando\napellido: Gonzalez\nnroIdentificacion: '33980912'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: fg@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	96fa856f-bcbd-450d-babe-607a4c53f676	2017-03-14 09:33:28.665005
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-011\nnombre: Tiago\napellido: Gonzalez\nnroIdentificacion: '38187222'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: tiagogonzales@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	8e2035c2-a3bc-4cd3-aee3-abb658008801	2017-03-14 09:33:28.750828
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-012\nnombre: Cintia\napellido: Castro\nnroIdentificacion: '22612413'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cintiacastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	9791c929-1897-4253-bdb4-e92759aac273	2017-03-14 09:33:28.828963
178	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	69aaf818-feb7-46f3-9584-4d16ce710e80	2017-03-14 09:33:47.655541
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-013\nnombre: Josefina\napellido: Jardin\nnroIdentificacion: '36025176'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: josefinajardin@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	18ff5bba-acda-4433-a171-d169ed317e28	2017-03-14 09:33:28.905815
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-014\nnombre: Diana\napellido: Rivas\nnroIdentificacion: '25948001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: dianarivas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	0145b2b1-6c44-47f8-9ee1-0842d5d5a869	2017-03-14 09:33:28.997802
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-015\nnombre: Dario\napellido: Gonzalez\nnroIdentificacion: '33880019'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: dariogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	670dc0f5-2d8d-4e1e-9fe7-6dcfc94e5555	2017-03-14 09:33:29.082236
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-016\nnombre: Ciro\napellido: Zamora\nnroIdentificacion: '33983707'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: cirozamora@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	22602206-c973-4538-a10a-79d2a5dd5d2b	2017-03-14 09:33:29.162196
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-017\nnombre: Zoe\napellido: Vazquez\nnroIdentificacion: '3818104'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoevazquez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	f2af193d-e140-491c-8e89-920f707cbe0f	2017-03-14 09:33:29.240478
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-018\nnombre: Cristian\napellido: Gonzalez\nnroIdentificacion: '22659193'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: cristiangonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	35e4beed-6987-49c4-94c1-09da77b1b6cd	2017-03-14 09:33:29.32811
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-019\nnombre: Ana\napellido: Manfrin\nnroIdentificacion: '36222076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: anamanfrin@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	ac5ffc24-4887-41d0-a259-286d45a392a9	2017-03-14 09:33:29.406527
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-020\nnombre: Martina\napellido: Adamo\nnroIdentificacion: '25841001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaadamo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	5d399e8c-8339-4fab-9bc3-4035a5d24307	2017-03-14 09:33:29.494372
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-021\nnombre: Roberto\napellido: Milani\nnroIdentificacion: '33880333'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: robertomilani@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	ce6acf2c-1280-4a87-9d11-5d1e1c174307	2017-03-14 09:33:29.573193
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-022\nnombre: Victor\napellido: Gonzalez\nnroIdentificacion: '33984447'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	c3145ece-403e-46ca-a0f2-82fee04b3cd7	2017-03-14 09:33:29.649379
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-023\nnombre: Alejandro\napellido: Cambril\nnroIdentificacion: '38113409'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: alejandrocambril@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	0d45f046-7260-4300-8b13-08a2dada8899	2017-03-14 09:33:29.728593
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-024\nnombre: Luis\napellido: Rizzo\nnroIdentificacion: '22543493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luisrizzo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	86d78e83-ba3f-4626-a4ab-15d7ba2ed9b1	2017-03-14 09:33:29.805139
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-025\nnombre: Mario\napellido: Rosas\nnroIdentificacion: '36060986'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: mariorosas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	afda1987-7165-4719-95bb-3264e052155f	2017-03-14 09:33:29.884052
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-026\nnombre: Analia\napellido: Granados\nnroIdentificacion: '25131701'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: analiagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	c6b4e88f-da8c-4b09-9ad4-4a86ff85e313	2017-03-14 09:33:29.986864
40	27	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-027\nnombre: Leonor\napellido: Gonzalez\nnroIdentificacion: '33888717'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: leonorgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	65827300-ca26-4446-b838-44d728e3f895	2017-03-14 09:33:30.074903
41	28	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-028\nnombre: Victor\napellido: Baresi\nnroIdentificacion: '33928407'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: victorbaresi@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	c33bc1f0-a9d3-415c-be01-5118cd46efd6	2017-03-14 09:33:30.212675
42	29	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-029\nnombre: Silvana\napellido: Lazzaga\nnroIdentificacion: '38918849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: silvanalazzaga@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	1ea6076b-182a-4b1d-bb0c-c1ec32ea35ac	2017-03-14 09:33:30.29438
43	30	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-030\nnombre: Juana\napellido: Calabrese\nnroIdentificacion: '220192493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: janacalabrese@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	7448b47f-19c4-4ea0-98fb-0666e0822def	2017-03-14 09:33:30.378628
44	31	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-031\nnombre: Juliana\napellido: Lombardi\nnroIdentificacion: '38613849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: julianalombardi@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	a93e0a8f-c1d5-4ada-8af4-7d40f6481258	2017-03-14 09:33:30.461289
184	35	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	9508659b-5023-4733-9103-0e3db8f5c5a0	2017-03-14 09:33:48.182059
190	41	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	6f4631b6-1e14-4e9a-9a85-9d054ccaf7d1	2017-03-14 09:33:48.486993
45	32	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-032\nnombre: Enrique\napellido: Cano\nnroIdentificacion: '22451493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: enriquecano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	187bd64f-7fbc-4d73-8215-903b32f39b32	2017-03-14 09:33:30.541045
46	33	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-033\nnombre: Gilda\napellido: Lombarde\nnroIdentificacion: '36064356'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: gildalombarde@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	4fe5eb5a-ba26-48ff-b979-c440db77799f	2017-03-14 09:33:30.617855
47	34	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-034\nnombre: Martin\napellido: Bande\nnroIdentificacion: '25124501'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinbande@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	2d1698de-d4a7-48d8-a26c-9802b93bdca5	2017-03-14 09:33:30.699809
48	35	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-035\nnombre: Gabriel\napellido: Ferruccio\nnroIdentificacion: '33451657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: gabrielferuccio@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	21538644-e1ce-4ee4-bd73-c61764277069	2017-03-14 09:33:30.785265
49	36	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-036\nnombre: Juan\napellido: Mazzanti\nnroIdentificacion: '33956107'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: juanmazzanti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	ffbfd894-dae5-47f9-ad65-f701ef9b7a79	2017-03-14 09:33:30.862699
50	37	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-037\nnombre: Karina\napellido: Fiorentino\nnroIdentificacion: '38663849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: karinafiorentino@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	1be30231-e7e9-4f39-9658-a2290b265061	2017-03-14 09:33:30.939812
51	38	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-038\nnombre: Osvaldo\napellido: Pagnotto\nnroIdentificacion: '22019493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: osvaldopagnotto@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	981e4a12-89ef-4a7c-98a8-1d786f8c77ed	2017-03-14 09:33:31.017487
52	39	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-039\nnombre: Margarita\napellido: Giordano\nnroIdentificacion: '36068886'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: margaritagiordano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	ceb54a78-5c74-476d-b413-96f76ce99e60	2017-03-14 09:33:31.117898
53	40	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-040\nnombre: Rosa\napellido: Napolitano\nnroIdentificacion: '2576401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: rosanapolitano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	6fc0723f-af3e-442e-b7c0-2c2fc5123cce	2017-03-14 09:33:31.194948
54	41	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-041\nnombre: Magdalena\napellido: Bruno\nnroIdentificacion: '38817849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: mardalenabruno@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	8e3c2c2a-52f1-4bae-a450-12bdd01c4101	2017-03-14 09:33:31.282379
55	42	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-042\nnombre: Mauricio\napellido: Costa\nnroIdentificacion: '22755493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: mauriciocosta@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	630f1429-3157-4607-a5bf-cad9767302aa	2017-03-14 09:33:31.362529
56	43	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-043\nnombre: Ivan\napellido: Costas\nnroIdentificacion: '36755076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: ivancostas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	155a5385-dab5-4e70-9386-9e2ca3754c0d	2017-03-14 09:33:31.441464
57	44	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-044\nnombre: Pablo\napellido: Davide\nnroIdentificacion: '251934401'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: pablodavide@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	b2b19775-03b2-4feb-bd3d-e9c89b4e055a	2017-03-14 09:33:31.530054
58	45	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-045\nnombre: Nicolas\napellido: Medina\nnroIdentificacion: '33801927'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: nicolasmedina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	820aeed8-d0a2-4528-9c1f-db96cdc80e43	2017-03-14 09:33:31.615974
179	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	a9167c1e-0ff7-4146-b12a-ed5ef20a3d22	2017-03-14 09:33:47.707123
180	31	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	2cf5cabf-51ef-4236-a07c-bf7f8d2ebbb1	2017-03-14 09:33:47.754431
59	46	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-046\nnombre: Celeste\napellido: Milano\nnroIdentificacion: '35122307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: celestemilano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	01452fd3-efe6-45b9-8eb3-87baa38ad38d	2017-03-14 09:33:31.697288
60	47	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-047\nnombre: Sebastian\napellido: Schiavone\nnroIdentificacion: '38175649'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: sebastianschiavone@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	10aec681-5823-4752-9544-e6e7330f5671	2017-03-14 09:33:31.783027
61	48	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-048\nnombre: Ruben\napellido: Almedina\nnroIdentificacion: '22891493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: rubenalmedina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	ed278d9d-6ec4-4343-ad26-f2e798db4f1a	2017-03-14 09:33:31.866563
62	49	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-049\nnombre: Cristian\napellido: Camiño\nnroIdentificacion: '36093716'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: cristiancamiño@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	cf2f6d26-5c41-40f1-b592-1e82cf80a208	2017-03-14 09:33:31.951733
63	50	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-050\nnombre: Monica\napellido: Conti\nnroIdentificacion: '25888001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: monicaconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	4655309c-55f5-4a53-b08b-7c442566e359	2017-03-14 09:33:32.036951
64	51	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	339e11ce-2e33-4d8d-916a-f46fc6cd97b1	2017-03-14 09:33:32.178866
65	52	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cd98ea98-a81e-48f8-9063-493dcba623d6	2017-03-14 09:33:32.264329
66	53	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9486f829-6c17-4065-a750-87a03c6d2959	2017-03-14 09:33:32.387965
67	54	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	92b4b902-9fca-4b56-b517-02dcf36e7e93	2017-03-14 09:33:32.473591
68	55	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1a0c0184-3651-43d9-a16c-8d5effb049f5	2017-03-14 09:33:32.54683
69	56	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	378e4b0a-0a86-4334-b621-3594a1b9014c	2017-03-14 09:33:32.632445
70	57	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fab4bc3a-b89c-42d6-91ec-562e55c4a52c	2017-03-14 09:33:32.717582
71	58	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	11268ff4-ada2-4ce0-b6e7-2f8835ff4a60	2017-03-14 09:33:32.797194
72	59	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	212105a5-1376-4022-9aca-02a1a4798b50	2017-03-14 09:33:32.873446
73	60	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	29ef427c-342b-42cd-9bf8-01e88788785f	2017-03-14 09:33:32.952107
74	61	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	60c195ad-c2de-4a19-9e18-c475d17570e6	2017-03-14 09:33:33.040627
75	62	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6da83017-b4cd-424f-8e91-7b1fbf4fafa1	2017-03-14 09:33:33.116605
76	63	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	85157dd2-0616-46c3-84e6-bc346ab080ab	2017-03-14 09:33:33.196098
186	37	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c772689a-a35e-4d54-974b-ca42429e3df6	2017-03-14 09:33:48.289809
187	38	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	98278384-9bb0-4a5d-aaa3-eb6d24919904	2017-03-14 09:33:48.342761
77	64	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	7bfa5cdf-9bd1-405e-b975-d6ba09566d89	2017-03-14 09:33:33.273836
78	65	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8c6915c2-e9cb-4102-9ecb-72fe6637cdd1	2017-03-14 09:33:33.352054
79	66	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4343d8ff-ca79-4e8a-a0a3-b35fa75a14b6	2017-03-14 09:33:33.430113
80	67	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	18cccc62-d3bc-46d8-86df-3443124d3afa	2017-03-14 09:33:33.508201
81	68	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	87da5efd-1272-4a21-832e-9e81e767f5de	2017-03-14 09:33:33.59312
82	69	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fbb4875e-f69a-4305-a7a3-bb18f25f5f32	2017-03-14 09:33:33.67889
83	70	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	643ab6d7-20f5-44f4-b39b-959ce1a022e5	2017-03-14 09:33:33.764425
84	71	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-021\nnombre: Lidia\napellido: Delucci\nnroIdentificacion: '28088944'\nfechaNacimiento: 1981-01-29\ncalle: Chile\nnroDomicilio: '6144'\npiso: ''\ndpto: ''\ntelefono: '481898'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	afbfac62-d6ac-489e-9796-9dbc03f3aaa9	2017-03-14 09:33:33.850868
85	72	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-022\nnombre: Leonor\napellido: Gomez Santos\nnroIdentificacion: '40560231'\nfechaNacimiento: 1996-03-13\ncalle: Plaza Mayor\nnroDomicilio: '2637'\npiso: ''\ndpto: ''\ntelefono: '4536662'\nemail: leonorgs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a4e7dbe2-f414-459f-8de2-bf8e3f56022c	2017-03-14 09:33:33.934384
86	73	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-023\nnombre: Lara\napellido: Gonçalves\nnroIdentificacion: '29075344'\nfechaNacimiento: 1980-07-19\ncalle: España\nnroDomicilio: '1415'\npiso: ''\ndpto: ''\ntelefono: '4498457'\nemail: laragoncalves@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a7e5fdcc-92bc-4728-be75-a01daf03f433	2017-03-14 09:33:34.015812
87	74	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-024\nnombre: Martin\napellido: Diaz\nnroIdentificacion: '26070390'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: martindiaz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5fdf1f1e-6bef-4f85-b29d-ada372b06472	2017-03-14 09:33:34.096762
88	75	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-025\nnombre: Marina\napellido: Diaz\nnroIdentificacion: '26070394'\nfechaNacimiento: 1976-08-11\ncalle: calle Nueva\nnroDomicilio: '1826'\npiso: ''\ndpto: ''\ntelefono: '491088'\nemail: marinadiaz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a5e70837-c020-4b78-b9f2-863c282f2384	2017-03-14 09:33:34.174432
89	76	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-026\nnombre: Gerardo\napellido: Urbina\nnroIdentificacion: '29234987'\nfechaNacimiento: 1980-05-31\ncalle: "Álamo"\nnroDomicilio: '6162'\npiso: ''\ndpto: ''\ntelefono: '455433'\nemail: gerardou@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	46ce68cf-5d83-4c2f-833f-dc759d39628f	2017-03-14 09:33:34.261995
90	77	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-027\nnombre: Silvio\napellido: Quiroz\nnroIdentificacion: '35465922'\nfechaNacimiento: 1990-02-27\ncalle: "Álamo"\nnroDomicilio: '2128'\npiso: ''\ndpto: ''\ntelefono: '415176'\nemail: silvioquiroz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3d8d81f0-d471-402e-a85b-c6e6e6407df0	2017-03-14 09:33:34.342177
91	78	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-028\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '33457976'\nfechaNacimiento: 1987-12-19\ncalle: Alem\nnroDomicilio: '123'\npiso: ''\ndpto: ''\ntelefono: '451912'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a69b4ae2-df9c-4cf7-8006-08a61ed46815	2017-03-14 09:33:34.417744
92	79	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-029\nnombre: Leonardo\napellido: Rios\nnroIdentificacion: '29524865'\nfechaNacimiento: 1981-11-30\ncalle: Concepcion\nnroDomicilio: '5139'\npiso: ''\ndpto: ''\ntelefono: '4590871'\nemail: lidiadelucci@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a9ed8a46-0ccf-48a8-aa51-645126948674	2017-03-14 09:33:34.493223
93	80	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-030\nnombre: Ubaldo\napellido: Gomez\nnroIdentificacion: '34123456'\nfechaNacimiento: 1990-04-08\ncalle: Entre Rios\nnroDomicilio: '1235'\npiso: ''\ndpto: ''\ntelefono: '456798'\nemail: ubaldogomez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c166d3ba-9f76-40a7-a4e1-1c2e26e0eafc	2017-03-14 09:33:34.578522
94	81	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-031\nnombre: Silvio\napellido: Gonzalez\nnroIdentificacion: '29092236'\nfechaNacimiento: 1980-05-16\ncalle: Cordoba\nnroDomicilio: '7213'\npiso: ''\ndpto: ''\ntelefono: '4501923'\nemail: silviogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	2d29c5d0-7c7e-44c6-8092-954ef8501f06	2017-03-14 09:33:34.66208
95	82	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-032\nnombre: Rosa\napellido: Fernandez\nnroIdentificacion: '20112254'\nfechaNacimiento: 1968-09-13\ncalle: San Martin\nnroDomicilio: '1028'\npiso: ''\ndpto: ''\ntelefono: '4567895'\nemail: rosafernandez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	da86ce04-e9e0-4940-9e6a-23abf325eec2	2017-03-14 09:33:34.788009
96	83	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-033\nnombre: Alejandro\napellido: Fernandez\nnroIdentificacion: '20998871'\nfechaNacimiento: 1987-05-16\ncalle: Santa Fe\nnroDomicilio: '4812'\npiso: ''\ndpto: ''\ntelefono: '4311235'\nemail: alefernandez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	deb570b5-7f2a-4d6c-b12c-8dafd35910ee	2017-03-14 09:33:34.877773
97	84	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-034\nnombre: Hugo\napellido: Rios\nnroIdentificacion: '40034940'\nfechaNacimiento: 1998-11-30\ncalle: Alvear\nnroDomicilio: '5028'\npiso: ''\ndpto: ''\ntelefono: '481341'\nemail: hugorios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b54ce6e8-b945-43d7-99e6-6ac31cb49044	2017-03-14 09:33:34.962209
98	85	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-035\nnombre: Mario\napellido: Garcia\nnroIdentificacion: '24654447'\nfechaNacimiento: 1976-04-08\ncalle: Roca\nnroDomicilio: '193'\npiso: ''\ndpto: ''\ntelefono: '4212351'\nemail: mariogarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	08e2b785-f82b-477a-ba05-4939fe67773a	2017-03-14 09:33:35.04879
99	86	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-036\nnombre: Marina\napellido: Moralez\nnroIdentificacion: '36421952'\nfechaNacimiento: 1992-08-19\ncalle: Ucrania\nnroDomicilio: '9371'\npiso: ''\ndpto: ''\ntelefono: '451241'\nemail: marimamoralez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	01ced537-468d-4dee-9a89-1b1aeb1e8a77	2017-03-14 09:33:35.132953
100	87	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-037\nnombre: Silvina\napellido: Portillo\nnroIdentificacion: '26498388'\nfechaNacimiento: 1976-06-05\ncalle: Av Queirel\nnroDomicilio: '7621'\npiso: ''\ndpto: ''\ntelefono: '431214'\nemail: silvinaportillo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	81f87aef-4681-4e32-abcc-cb3679da35cd	2017-03-14 09:33:35.218976
101	88	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-038\nnombre: Maria\napellido: Maciel\nnroIdentificacion: '33428434'\nfechaNacimiento: 1989-09-04\ncalle: Paraguay\nnroDomicilio: '600'\npiso: ''\ndpto: ''\ntelefono: '4761602'\nemail: mariamaciel@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	bcb27e86-c158-4436-b557-e49a3f2a939f	2017-03-14 09:33:35.304125
102	89	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-039\nnombre: Angeles\napellido: Granados\nnroIdentificacion: '31452518'\nfechaNacimiento: 1981-04-09\ncalle: Uruguay\nnroDomicilio: '12'\npiso: ''\ndpto: ''\ntelefono: '481858'\nemail: angelesgranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4e573203-67ae-484d-8abe-1351abcecb15	2017-03-14 09:33:35.385655
103	90	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-040\nnombre: Cintia\napellido: Gutierrez\nnroIdentificacion: '29701192'\nfechaNacimiento: 1992-11-05\ncalle: Av Roca\nnroDomicilio: '464'\npiso: ''\ndpto: ''\ntelefono: '483498'\nemail: cintiagutierrez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4f64513c-db7c-4f60-aaf0-7cf84af0b64e	2017-03-14 09:33:35.462154
104	91	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-041\nnombre: David\napellido: Sedillo\nnroIdentificacion: '36371823'\nfechaNacimiento: 1975-07-23\ncalle: Centenario\nnroDomicilio: '6135'\npiso: ''\ndpto: ''\ntelefono: '481018'\nemail: davidsedillo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	1e5edb35-bb2f-49d4-ab7b-8cde375415f6	2017-03-14 09:33:35.541152
105	92	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-042\nnombre: Sofia\napellido: Garcia\nnroIdentificacion: '25370180'\nfechaNacimiento: 1998-01-13\ncalle: Las Flores\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '409498'\nemail: sofiagarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	14e80243-d3f0-4a40-bf6d-8ec34479240e	2017-03-14 09:33:35.620461
106	93	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-043\nnombre: Alicia\napellido: Villalba\nnroIdentificacion: '27455263'\nfechaNacimiento: 1979-04-17\ncalle: Las Palmeras\nnroDomicilio: '9876'\npiso: ''\ndpto: ''\ntelefono: '420184'\nemail: alivillalba@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c16e6459-132d-42d5-9c06-ff86cf35d963	2017-03-14 09:33:35.709909
107	94	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-044\nnombre: Luis\napellido: Gonzalez\nnroIdentificacion: '36182911'\nfechaNacimiento: 1992-06-19\ncalle: Las Orquideas\nnroDomicilio: '900'\npiso: ''\ndpto: ''\ntelefono: '495712'\nemail: luisgonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e3552f9f-4279-4471-8950-da32cacffbc1	2017-03-14 09:33:35.798379
108	95	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-045\nnombre: Ernesto\napellido: Da Luz\nnroIdentificacion: '30346514'\nfechaNacimiento: 1983-06-19\ncalle: Rosas\nnroDomicilio: '2463'\npiso: ''\ndpto: ''\ntelefono: '413048'\nemail: ernestodaluz@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	48fdf79b-c711-499e-800d-da1ed9052b45	2017-03-14 09:33:35.875012
109	96	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-046\nnombre: Luciano\napellido: Garcia\nnroIdentificacion: '39019733'\nfechaNacimiento: 1996-03-13\ncalle: Colon\nnroDomicilio: '8123'\npiso: ''\ndpto: ''\ntelefono: '412451'\nemail: lucianogarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	c80043d1-bf6b-4dde-a322-b2ab3fb1ae51	2017-03-14 09:33:35.954096
110	97	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-047\nnombre: Gerardo\napellido: Cano\nnroIdentificacion: '29232117'\nfechaNacimiento: 1980-07-19\ncalle: Escuelita\nnroDomicilio: '9173'\npiso: ''\ndpto: ''\ntelefono: '462093'\nemail: gerardocano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	3ca38605-aead-42dd-b332-908faf849925	2017-03-14 09:33:36.044209
111	98	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-048\nnombre: Hector\napellido: Rincon\nnroIdentificacion: '29222287'\nfechaNacimiento: 1980-05-31\ncalle: Japon\nnroDomicilio: '2546'\npiso: ''\ndpto: ''\ntelefono: '471927'\nemail: hectorrincon@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b3134f40-42c4-4414-b8e2-81e573ba453d	2017-03-14 09:33:36.140477
112	99	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-049\nnombre: Alberto\napellido: Gonzalez\nnroIdentificacion: '35225922'\nfechaNacimiento: 1990-02-27\ncalle: Colombia\nnroDomicilio: '2871'\npiso: ''\ndpto: ''\ntelefono: '431570'\nemail: albertogonzalez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	e4b61052-ab8b-47c3-9cef-df036767f41a	2017-03-14 09:33:36.220528
113	100	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-050\nnombre: Roberto\napellido: Lujan\nnroIdentificacion: '35461122'\nfechaNacimiento: 1990-05-27\ncalle: Noruega\nnroDomicilio: '1980'\npiso: ''\ndpto: ''\ntelefono: '401938'\nemail: robertolujan@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fc6d19c8-b5ff-4fc5-8b39-cedde83e4466	2017-03-14 09:33:36.306818
114	1	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Pre incubacion\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	5c4df840-eacf-4f8f-b544-4d21dee3e23f	2017-03-14 09:33:36.419747
115	2	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Incubación\ndescripcion: "-"\netapaAnterior: 1\n	1	\N	\N	0e66a092-4c77-40f0-8e73-817f9ba92216	2017-03-14 09:33:36.478805
116	3	Etapa	\N	\N	1	\N	\N	create	---\nnombre: post incubacion\ndescripcion: "-"\netapaAnterior: 2\n	1	\N	\N	f3d9dda5-e074-43af-8ad1-cc264129fcff	2017-03-14 09:33:36.531146
117	4	Etapa	\N	\N	1	\N	\N	create	---\nnombre: Cuarta etapa\ndescripcion: "-"\netapaAnterior: \n	1	\N	\N	0e6456fc-c6ad-45d3-8dfc-66535d59bd98	2017-03-14 09:33:36.587967
118	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: []\netapa_id: 1\n	1	\N	\N	6175b60e-457d-47fa-b5cb-e9d38944921c	2017-03-14 09:33:36.716146
119	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	4b2444a3-64ee-4e07-b1fc-eafb51b3d106	2017-03-14 09:33:36.79269
120	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	42f13385-0e29-4917-9873-d81b61449ad9	2017-03-14 09:33:36.866937
121	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	254da34d-3e59-4c02-abd4-b2ca2b9b7378	2017-03-14 09:33:36.927512
122	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	51402a84-0b4c-4026-b3f0-9b864bec6003	2017-03-14 09:33:36.986118
123	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	8ecbb1c8-1810-4ba2-b36f-35de509b2995	2017-03-14 09:33:37.051861
124	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	2476e418-eda0-41e0-941e-9c7dd787761b	2017-03-14 09:33:37.114084
125	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	9d9c4ca3-15be-4046-8840-f26c4c3dc4db	2017-03-14 09:33:37.17104
126	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	6221930c-fd7f-4895-98be-86debd095bc8	2017-03-14 09:33:37.223772
127	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	2a92fa49-9bc1-4675-8c02-52a4f417781a	2017-03-14 09:33:37.340724
128	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	1c3b9fac-30bf-4d62-9f07-a5559fc03d55	2017-03-14 09:33:37.413719
129	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	f66711aa-dfbe-4f05-8b21-6f502509a6ac	2017-03-14 09:33:37.616765
338	102	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-002\nnombre: Berta\napellido: Rivera\nnroIdentificacion: '33958772'\nfechaNacimiento: 1989-04-11\ncalle: Leandro Gomez\nnroDomicilio: '5886'\npiso: \ndpto: \ntelefono: '4598765'\nemail: brivera@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 2\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	dd0c9507-92c7-4e44-b8c2-e1a48332dbf0	2017-03-14 09:34:03.767987
130	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	ae66f18b-3b20-4a99-b86e-d18380acc849	2017-03-14 09:33:37.693807
131	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	aac1161c-8405-4e36-8206-53e1db39c092	2017-03-14 09:33:37.76901
181	32	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	63a630a3-4a43-4f89-a4c6-e7ed8245a3ea	2017-03-14 09:33:47.8107
188	39	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 13\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0ddd43a4-f930-466e-b329-ced7a6034564	2017-03-14 09:33:48.385681
189	40	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	5965d16b-6f26-4ead-8953-51be2765ac5c	2017-03-14 09:33:48.43355
132	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	86f5050a-1126-4755-aa2f-1b2e3610eabd	2017-03-14 09:33:37.84755
133	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	96e7adb7-ca0d-4159-9759-cdf0cfb1d507	2017-03-14 09:33:37.931863
134	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	5189b146-833a-475d-83c9-989e93b7c5c0	2017-03-14 09:33:38.073195
135	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	bd7e2943-0584-40db-86b1-abd0c57aab6b	2017-03-14 09:33:38.148235
136	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	36552eb4-4501-44c1-be5a-d85f0a642cf5	2017-03-14 09:33:38.221594
137	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	78ad993f-0b6b-42f5-a337-087e3c3f98a1	2017-03-14 09:33:38.287562
138	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	b06ce222-aa14-4219-9852-0a44dc99e5f6	2017-03-14 09:33:38.356878
139	11	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-011\nnombre: Percentil\ndescripcion: Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes\n  en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para\n  hacerlo en escala y poder ganar dinero con ello.\ncalle: España\nnroDomicilio: '422'\npiso: ''\ndpto: ''\ntelefono: '4590432'\nemail: percentil@gmail.com\npagWeb: percentil.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	300a681f-bffa-4a1a-af29-d481f854f9cd	2017-03-14 09:33:38.436648
140	12	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-012\nnombre: EmbryoTools\ndescripcion: " Son una referencia mundial en reproducción asistida. Trabajan en cuatro\n  ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos,\n  porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante\n  práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan\n  es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción\n  asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de\n  los productos que vayan a entrar en contacto con embriones humanos y por último\n  trabajan en la reproducción asistida en veterinaria."\ncalle: Mariano Moreno\nnroDomicilio: '4122'\npiso: ''\ndpto: ''\ntelefono: '465888'\nemail: embryotools@gmail.com\npagWeb: embryotools.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	c630c132-0055-4f01-9c1b-b7ef3b9774f6	2017-03-14 09:33:38.513347
141	13	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-013\nnombre: Aplázame\ndescripcion: " Es un método de pago que se integra en el proceso de compra del comercio\n  electrónico y permite a los clientes de las tiendas online comprar con un crédito\n  instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su\n  método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando\n  para hacerlo en breve."\ncalle: Av. San Martin\nnroDomicilio: '4532'\npiso: ''\ndpto: ''\ntelefono: '453222'\nemail: aplazame@gmail.com\npagWeb: aplazame.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	559d720d-5822-4e42-9ada-0ccdec083eaa	2017-03-14 09:33:38.589823
147	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	d306dd31-0971-44b8-89e5-049f593f9adb	2017-03-14 09:33:46.002451
142	14	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-014\nnombre: BrioAgro Technologies\ndescripcion: Deesarrollo de una tecnología para que el agricultor controle su explotación.\n  El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor,\n  a través de su dispositivo, se conecta a la nube para acceder a la información de\n  su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier\n  cambio en sus variables.\ncalle: 'Colon '\nnroDomicilio: '555'\npiso: ''\ndpto: ''\ntelefono: '4651244'\nemail: bioagro@gmail.com\npagWeb: bioagro.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	af5e7dae-de66-4523-a9bd-8d430cacb363	2017-03-14 09:33:38.666605
143	15	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-015\nnombre: Braingaze\ndescripcion: La tecnología desarrollada detecta un pequeño movimiento ocular que permite\n  determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad\n  (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y\n  dislexia.\ncalle: Miami\nnroDomicilio: '708'\npiso: ''\ndpto: ''\ntelefono: '490123'\nemail: baringaze@gmail.com\npagWeb: braingaze.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	007d6390-6aab-47a4-b033-da38d6d774f7	2017-03-14 09:33:38.734724
144	16	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-016\nnombre: CreatorStats\ndescripcion: Mejoran la métrica de los ‘youtubers’.\ncalle: Inglaterra\nnroDomicilio: '200'\npiso: ''\ndpto: ''\ntelefono: '15432510'\nemail: creatorstats@gmail.com\npagWeb: creatorstats.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	7e9b0475-501d-447e-8336-2eb3df76f038	2017-03-14 09:33:38.810347
182	33	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 11\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0d1a5fe9-b243-4dbf-94ed-f667eb2b6213	2017-03-14 09:33:47.864241
183	34	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	37ec0639-51d5-4b67-b73f-a2345d1c4b11	2017-03-14 09:33:47.907747
145	17	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-017\nnombre: Alzhup\ndescripcion: Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar\n  de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología\n  como vehículo para que la solución sea accesible a todo el mundo. Implementan a\n  nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado\n  ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados\n  científicamente. Y también, herramientas para la memoria, capaces de personalizar\n  dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo\n  mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro\n  almacena los recuerdos y que difiere de los sistemas actuales computarizados.\ncalle: Constitucion\nnroDomicilio: '2222'\npiso: ''\ndpto: ''\ntelefono: '467632'\nemail: alzhup@gmail.com\npagWeb: alzhup.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	280ff371-52e7-4f06-9391-b52712f2729c	2017-03-14 09:33:38.879817
146	18	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-018\nnombre: Axter Aerospace\ndescripcion: Están desarrollando un sistema de propulsión híbrida para las avionetas,\n  que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso\n  trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración\n  con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto\n  se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU.\n  De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción\n  y ensamblado.\ncalle: Ayacucho\nnroDomicilio: '9200'\npiso: ''\ndpto: ''\ntelefono: '432111'\nemail: axteraerospace@gmail.com\npagWeb: axteraerospace.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	84f12887-164b-47f8-bc1e-24d55309d292	2017-03-14 09:33:38.959732
148	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	6ed8965e-dca7-4556-87d4-b6fc0c20bde8	2017-03-14 09:33:46.061026
149	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	f75585e8-34b8-43c1-aed3-c1f24ffada14	2017-03-14 09:33:46.141299
150	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	e68fc763-de53-4121-b57c-4f167967e1ef	2017-03-14 09:33:46.250304
151	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	56cc45e1-75de-4fc1-a4ec-efee567de353	2017-03-14 09:33:46.296145
152	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	b97ac63a-de69-44fc-91d8-e888c56ae727	2017-03-14 09:33:46.342665
153	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	2476432f-e4e4-4d6d-a51e-da2c2c95eb3c	2017-03-14 09:33:46.399341
154	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	295fc5a4-a7c6-479a-9436-dddec7f3dd0f	2017-03-14 09:33:46.453198
155	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	b76741b4-b43d-46aa-86de-1d5c5593cb1c	2017-03-14 09:33:46.508824
156	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	5202e670-8a48-4cc2-ae43-2b77e1249bfc	2017-03-14 09:33:46.553358
157	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b2bab18c-0d0a-42ad-bde9-3026f178a2c2	2017-03-14 09:33:46.606645
158	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	410e9a87-6fc5-4432-a41a-bb1a6f662022	2017-03-14 09:33:46.655157
159	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	f84ea5a9-4ad8-4561-9f83-7f5e541a91d2	2017-03-14 09:33:46.7097
160	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	9ba0017e-6311-4dc8-826b-794fa0513130	2017-03-14 09:33:46.765757
161	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	5e8a855b-ed3e-472d-a8f3-9b836648f92d	2017-03-14 09:33:46.818966
162	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	941c145b-df3c-4311-ab97-5565256fe2df	2017-03-14 09:33:46.864
163	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	416c2821-cc6e-4646-a515-abb923d90ff9	2017-03-14 09:33:46.907943
164	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	0f8a466a-63eb-47cf-8211-6f0274d6f6a8	2017-03-14 09:33:46.952483
165	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	87fd7d58-f633-4b4d-9ba7-a66ab9b2b3a8	2017-03-14 09:33:46.997617
206	1	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Efectivo\n	1	\N	\N	1a2d3898-5acc-4451-9864-276a67bb6262	2017-03-14 09:33:52.735983
166	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	adff284b-6112-4c0e-9e80-01f3cade6b74	2017-03-14 09:33:47.041998
167	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	9f5863a1-2023-42c6-933f-4a6ff06f6f0f	2017-03-14 09:33:47.086353
168	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c77ec6cb-c553-4fd1-ba0f-4cd1909f8749	2017-03-14 09:33:47.129847
169	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	497dd77d-0b55-4048-9138-838b443c4a06	2017-03-14 09:33:47.174628
170	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	a42b5bbb-9cf7-49b3-8483-e2fc7b1f657e	2017-03-14 09:33:47.219636
171	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	b5ff61c0-ed84-4730-af6c-68dae3073a8d	2017-03-14 09:33:47.310676
172	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	57554d7a-0158-448a-b888-9d27718ec0e0	2017-03-14 09:33:47.367058
173	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	770ebf2e-fc58-4691-8774-8de3f0bcd8ef	2017-03-14 09:33:47.419704
174	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	fbe1a1c5-b2e2-4e1d-ad23-9212a271484d	2017-03-14 09:33:47.466194
175	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	b74cc4bd-f7de-43cb-84c4-90def813ccad	2017-03-14 09:33:47.517406
176	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	7b5b71f1-b030-431b-98f4-cd2aede7948a	2017-03-14 09:33:47.562014
177	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	43191a35-88b3-49b8-93f9-7ab15d0c03f8	2017-03-14 09:33:47.609047
185	36	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 12\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	9f3e2750-0e60-4e7e-91e6-61d6eb40bad9	2017-03-14 09:33:48.232125
191	42	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 14\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	60f04eb5-4d67-492a-a2ad-dadf101fe061	2017-03-14 09:33:48.530417
192	43	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	b086980d-f6bb-4670-a825-dc6b0ced8942	2017-03-14 09:33:48.585001
193	44	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	df39c921-2c8b-491b-aefa-8b832e06ed9b	2017-03-14 09:33:48.630094
194	45	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 15\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	e23abbc5-08ba-4d28-ad84-1a777b34ddc9	2017-03-14 09:33:48.675193
195	46	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	426656b8-9ba1-4e40-9b91-4b7ea747ceac	2017-03-14 09:33:48.722528
196	47	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	28aa08ea-3b04-4217-b4b6-872d832dab4a	2017-03-14 09:33:48.77624
197	48	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 16\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	f68fec08-b7da-4a6d-a79b-e6e7fa6696d7	2017-03-14 09:33:48.819333
198	49	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	50b8f504-7495-4064-9439-e896d1f337b2	2017-03-14 09:33:48.864905
199	50	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	1d098e7a-4f80-43d6-9b8a-eda418c7f66b	2017-03-14 09:33:48.909526
200	51	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 17\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	2ba007e6-584a-458a-8900-70ff9317a2a7	2017-03-14 09:33:48.95342
201	52	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 1\nestado_id: 3\n	1	\N	\N	c18d0ce3-1ef7-462a-a438-1ac5298feec4	2017-03-14 09:33:48.998061
202	53	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 2\nestado_id: 3\n	1	\N	\N	c1c56673-17c5-40e6-a82f-4d4e1027986a	2017-03-14 09:33:49.053603
203	54	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 18\nactividad_id: 3\nestado_id: 2\n	1	\N	\N	6238812b-cff1-448d-aaca-064032f87f69	2017-03-14 09:33:49.097715
204	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	099854fe-cdba-4f08-bf53-6b863a1e82fe	2017-03-14 09:33:52.522402
205	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	339e3f97-5c80-42e8-abeb-2ae67ff7f054	2017-03-14 09:33:52.631831
207	2	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta de crédito Visa\n	1	\N	\N	c73221f2-9f95-499c-9274-e6dbb20cea28	2017-03-14 09:33:52.793957
208	3	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Tarjeta Naranja\n	1	\N	\N	dbc6bce1-8953-4333-8835-e289c75590ec	2017-03-14 09:33:52.856899
209	4	TipoDePago	\N	\N	1	\N	\N	create	---\nnombre: Saldo de cuenta\n	1	\N	\N	6facd7cd-af74-4db5-bfb1-d11c3fab4703	2017-03-14 09:33:52.913833
210	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\nmonto: 200.0\n	1	\N	\N	143c2889-eb54-44b7-9370-c95e2acb0afd	2017-03-14 09:33:53.117461
211	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\nmonto: 200.0\n	1	\N	\N	9064022c-0697-4c1c-82cd-87ea85aaf669	2017-03-14 09:33:53.178052
212	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\nmonto: 200.0\n	1	\N	\N	e6f77fce-b259-49e8-9244-9b4a82225164	2017-03-14 09:33:53.24184
213	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\nmonto: 200.0\n	1	\N	\N	8968d605-2826-4079-b0b8-a035fc0c6a5a	2017-03-14 09:33:53.311722
214	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\nmonto: 200.0\n	1	\N	\N	d0423e36-ee38-4912-a426-f38a4d3b22ce	2017-03-14 09:33:53.383665
215	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\nmonto: 200.0\n	1	\N	\N	e4f5c003-0823-41ce-a9e3-a712a9d6e377	2017-03-14 09:33:53.44745
216	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\nmonto: 200.0\n	1	\N	\N	e7beede4-89a5-439e-ad49-2a07f6ae8c9c	2017-03-14 09:33:53.514211
217	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\nmonto: 200.0\n	1	\N	\N	e42833c6-3b82-4728-a1d8-ca1609286649	2017-03-14 09:33:53.582697
218	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\nmonto: 200.0\n	1	\N	\N	c1844cc9-c4c4-4dc4-86e3-51003f57224d	2017-03-14 09:33:53.649583
219	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\nmonto: 200.0\n	1	\N	\N	ed0cb1a2-43c6-4daf-acd2-e1e329ede086	2017-03-14 09:33:53.73516
220	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\nmonto: 200.0\n	1	\N	\N	101b3528-fee0-4f65-91f9-2f8b6424e0bd	2017-03-14 09:33:53.804075
221	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\nmonto: 200.0\n	1	\N	\N	8206ced8-a4de-4bf4-a222-516bd0d8bd1a	2017-03-14 09:33:53.872426
222	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 51\nproyecto_id: 1\n	1	\N	\N	559a7d79-0638-4523-9a1c-0769c4ab5847	2017-03-14 09:33:54.552591
223	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 52\nproyecto_id: 2\n	1	\N	\N	2cfb68d9-cca5-47c1-aa6a-fb4d38fbd644	2017-03-14 09:33:54.616492
224	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 54\nproyecto_id: 3\n	1	\N	\N	ab31ff3b-d773-4080-b6d5-37b85f0682a0	2017-03-14 09:33:54.67107
225	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 56\nproyecto_id: 4\n	1	\N	\N	88993a14-564d-49d7-9770-73b3dd8b0236	2017-03-14 09:33:54.728566
226	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 58\nproyecto_id: 5\n	1	\N	\N	44aed0e1-b6f4-4897-9550-1e8a07503d6f	2017-03-14 09:33:54.785642
227	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 60\nproyecto_id: 6\n	1	\N	\N	b62ea81d-1b37-4508-8189-d79af965eabe	2017-03-14 09:33:54.837161
228	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 63\nproyecto_id: 7\n	1	\N	\N	a06baff6-43bd-466e-971d-6f17fad2c8b4	2017-03-14 09:33:54.889033
229	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 8\n	1	\N	\N	75233dae-3810-405a-bb90-e0d1b8058c42	2017-03-14 09:33:54.946061
230	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 9\n	1	\N	\N	53b4a62d-1d0b-48eb-aec6-690c590f5c96	2017-03-14 09:33:55.006904
231	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 69\nproyecto_id: 10\n	1	\N	\N	468dc58d-eab6-429a-9b78-60f3eba461c7	2017-03-14 09:33:55.058477
232	11	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 0017-12-10\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 71\nproyecto_id: 11\n	1	\N	\N	294d4b32-6349-4497-a1e1-184a6badebb8	2017-03-14 09:33:55.11398
233	12	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 65\nproyecto_id: 12\n	1	\N	\N	135017ad-2326-4a52-9f4c-5fc73ba5e04b	2017-03-14 09:33:55.241892
234	13	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 99\nproyecto_id: 13\n	1	\N	\N	8f4da594-73c5-4511-b289-4ddac4c5806d	2017-03-14 09:33:55.302012
235	14	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 80\nproyecto_id: 14\n	1	\N	\N	5a3fe06f-7519-4115-abbd-28f733913514	2017-03-14 09:33:55.355911
236	15	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 89\nproyecto_id: 15\n	1	\N	\N	1604f928-ffff-44a2-97e6-28f0cf5a7499	2017-03-14 09:33:55.400846
237	16	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 67\nproyecto_id: 16\n	1	\N	\N	27a1ec67-8beb-4913-aa9b-011e18a3b7fe	2017-03-14 09:33:55.45903
238	17	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 97\nproyecto_id: 17\n	1	\N	\N	78275431-05df-4675-9864-9095d2eea3ee	2017-03-14 09:33:55.511049
239	18	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 75\nproyecto_id: 18\n	1	\N	\N	dacae8f5-9311-45cb-8b2b-be3a904af0b3	2017-03-14 09:33:55.568331
240	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	5d23a87a-61e3-46c3-a27a-a0bc5e63e51e	2017-03-14 09:33:55.74114
241	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	7ba0127f-2559-49e0-bb06-3b45b7b351e2	2017-03-14 09:33:55.833453
242	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	e2c2cf82-2f7a-4dd3-af8e-015a70906905	2017-03-14 09:33:55.921361
243	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	109e1c47-f4fa-4371-80ae-7b735818dde0	2017-03-14 09:33:56.017273
244	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	d7e6328a-425b-4fdd-a8db-044334ef84bd	2017-03-14 09:33:56.095281
245	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	cb473e40-db72-45b1-9f75-d196c5a5c631	2017-03-14 09:33:56.181847
246	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	c2ec9750-c0da-4192-9d91-c782d90f093d	2017-03-14 09:33:56.264841
247	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	02f79e34-d603-44bb-96bb-27a2d8d35a1f	2017-03-14 09:33:56.356922
248	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	464386b2-99b4-4046-b9bf-833e588f4ab5	2017-03-14 09:33:56.44329
249	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	de22c2a2-abd1-48ce-9848-0df42cb6a6b6	2017-03-14 09:33:56.528755
250	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	f7c108d6-ec9f-49aa-bb83-f99cae75e994	2017-03-14 09:33:56.620573
251	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	f494181e-a0c2-4c62-b090-c802be346490	2017-03-14 09:33:56.710931
252	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	c2af7302-a326-4d33-994b-0e3ea8a5648b	2017-03-14 09:33:56.794856
253	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	af1c7e04-c3bf-4ac1-955b-a8a1f8437c09	2017-03-14 09:33:56.872922
254	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	25b85c7c-9fb2-47fa-8301-372107c4de36	2017-03-14 09:33:56.960866
255	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	b09a702b-4762-41b2-aa40-7ab13a1c3113	2017-03-14 09:33:57.046337
256	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	f53bf117-eab7-4acc-80ed-dbfa974491e2	2017-03-14 09:33:57.127872
257	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	6eb8a4d1-fa19-4a02-8c15-2b842e353f5b	2017-03-14 09:33:57.224159
258	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	a52c657c-9fd8-4bfd-a28b-1be51e82ddf9	2017-03-14 09:33:57.309164
259	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	f3ecf858-beaf-4f9e-a4d1-538985eb650f	2017-03-14 09:33:57.402987
260	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	1015a11b-3a68-428e-8b52-730de09e19ee	2017-03-14 09:33:57.48847
261	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	ec793092-ff5b-4919-9aae-0e6e2d674e60	2017-03-14 09:33:57.57378
262	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	6dcf764f-aec9-4782-8d08-cd0918b141b8	2017-03-14 09:33:57.664709
263	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	2c0e762f-dcc7-4732-9e3c-c3de63f8e680	2017-03-14 09:33:57.753496
264	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	adb49b2a-bfd2-4b85-9dca-d9f124978dcf	2017-03-14 09:33:57.841798
265	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	cabc12b4-3efb-4e8d-ba5e-7624a33943c2	2017-03-14 09:33:57.931589
266	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	3c55db00-91a0-4322-a570-16d677ad86b4	2017-03-14 09:33:58.049405
267	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	1a874bc5-a016-4603-b1df-52413165aabb	2017-03-14 09:33:58.152048
268	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	d9a95f26-1d57-481f-b1a9-c11bd5bcc0cd	2017-03-14 09:33:58.280062
269	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	d92ef41e-0a02-4c1e-b910-b6c525764dff	2017-03-14 09:33:58.365735
270	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	27a1c1ce-24ee-45c1-b1bb-390c7ca0e88b	2017-03-14 09:33:58.451567
271	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	f0c0d032-36b7-46bd-8806-674364558016	2017-03-14 09:33:58.552399
272	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	52e2964b-139f-43ac-8f04-005935dfa063	2017-03-14 09:33:58.640505
273	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	0c557956-cbc1-44d7-ac9f-e18b286dea28	2017-03-14 09:33:58.72685
274	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	fd810266-1bcd-432d-bdcb-29f45ea26f92	2017-03-14 09:33:58.807502
275	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	8966d720-74fe-4cb1-885e-5b942441859e	2017-03-14 09:33:58.891467
276	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	66c16d2b-3153-47d4-b542-a97766cfa9f4	2017-03-14 09:33:58.975661
277	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	13da705e-48ea-48de-9c07-d047e5b10d98	2017-03-14 09:33:59.048796
278	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	9f0b9cd5-ac1c-4912-8941-daaf8be18dbd	2017-03-14 09:33:59.13288
279	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	2cc2e809-cd7a-4564-a8b1-2c96af487fe7	2017-03-14 09:33:59.225931
280	41	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	908bbfe8-8f93-4731-8f22-a0ef1649d314	2017-03-14 09:33:59.311125
281	42	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	407c3811-e416-49bc-9075-ee630aab8ded	2017-03-14 09:33:59.396101
282	43	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	55d2d4a3-7140-4477-892a-99434daa1216	2017-03-14 09:33:59.474545
283	44	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 11\ncontrato_id: 11\npago_id: \ndescuento_id: \n	1	\N	\N	20dbe7e8-0648-4413-8997-b978f9427ce6	2017-03-14 09:33:59.568797
284	45	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	829094de-f2f3-47cf-88dd-d53d185fa8b3	2017-03-14 09:33:59.652225
285	46	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	fb478463-4cce-461f-8761-00ec286c635b	2017-03-14 09:33:59.729746
286	47	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	84293211-6a78-452e-baf9-af31c9dccd91	2017-03-14 09:33:59.810139
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	8ce64b40-7c08-46cb-8d63-13366f817c34	2017-03-14 09:33:27.017254
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	36955368-e353-4606-ab25-eb2997d2c65c	2017-03-14 09:33:27.074305
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	47ec9a51-e071-4885-815f-1a05466a0125	2017-03-14 09:33:27.126093
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	4e7bf3d8-24ce-40de-a9f3-5f145c1eabc8	2017-03-14 09:33:27.170571
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	bd58a5d7-a616-41d5-a28e-1e812980a15f	2017-03-14 09:33:27.259396
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	b10d6d27-3337-4512-abbd-23212dfb1771	2017-03-14 09:33:27.316535
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	1aa5c32f-9f24-41af-9646-1159c55f52ca	2017-03-14 09:33:27.373577
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	2d43d524-1cc8-435c-967f-e98d7ccd55c1	2017-03-14 09:33:27.429881
312	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	335ecb82-079a-4375-afe2-83d81bdcccf5	2017-03-14 09:34:02.094717
287	48	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 12\ncontrato_id: 12\npago_id: \ndescuento_id: \n	1	\N	\N	8d79ee92-82ab-4d41-963a-6adee20c3f84	2017-03-14 09:33:59.903807
288	49	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	e781bee4-5bb7-4c71-aaee-49aaaaebfb15	2017-03-14 09:33:59.998741
289	50	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	ea297958-4e40-48d6-806a-98d7bef2e5eb	2017-03-14 09:34:00.086129
290	51	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	416c3a2f-0795-4cac-a3ae-9c1013115e39	2017-03-14 09:34:00.163601
291	52	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 13\ncontrato_id: 13\npago_id: \ndescuento_id: \n	1	\N	\N	fd1bc3a0-636e-497a-a873-29b2f6109ad6	2017-03-14 09:34:00.248585
292	53	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	61fb99e0-78bc-4339-aa98-764a82220c6c	2017-03-14 09:34:00.330271
293	54	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	0efc6990-2a65-4aa5-8ce5-98e67277e23b	2017-03-14 09:34:00.406288
294	55	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	dcc65b45-acac-4de4-9de2-5fa9b673be16	2017-03-14 09:34:00.491682
295	56	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 14\ncontrato_id: 14\npago_id: \ndescuento_id: \n	1	\N	\N	f722bad7-e25a-4ea8-b51c-080fd1a6218c	2017-03-14 09:34:00.582509
296	57	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	d2bfb1cd-77c1-4651-8b4c-6f8e028543e6	2017-03-14 09:34:00.664083
297	58	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	b75763a4-82df-47e6-9799-6b80662594e6	2017-03-14 09:34:00.74144
298	59	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	c1c48306-2e70-4c02-b2e8-b35dc425c8c8	2017-03-14 09:34:00.82142
300	61	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	47832888-911d-4d4a-b687-a4bd9359f6ef	2017-03-14 09:34:01.040967
301	62	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	198ece44-c81f-4e45-8cb9-45f1fe76661a	2017-03-14 09:34:01.119238
302	63	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	c195bfdf-fc2f-43f2-9137-f1cc409eaa43	2017-03-14 09:34:01.210341
303	64	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 16\ncontrato_id: 16\npago_id: \ndescuento_id: \n	1	\N	\N	1fc474d7-7604-457b-a733-084842da80ee	2017-03-14 09:34:01.305148
304	65	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	f027e663-f7a8-45fe-9c82-c2c354882efd	2017-03-14 09:34:01.389422
305	66	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	e0690e7a-b8f0-4219-aabf-791ecdc5bc50	2017-03-14 09:34:01.475482
306	67	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	ef1bdfd3-8295-4fe0-95e6-d3b289a42578	2017-03-14 09:34:01.564736
307	68	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 17\ncontrato_id: 17\npago_id: \ndescuento_id: \n	1	\N	\N	3686013f-ff48-4f7e-b689-769e06cb3be0	2017-03-14 09:34:01.651558
308	69	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	53497060-f829-4940-bcae-1fbabd57f540	2017-03-14 09:34:01.732547
299	60	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 15\ncontrato_id: 15\npago_id: \ndescuento_id: \n	1	\N	\N	72e7167a-f2aa-4c0d-ac23-1d2897a189a7	2017-03-14 09:34:00.917543
309	70	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	09cf27d3-7cd9-4c98-a1bb-3b341780ea99	2017-03-14 09:34:01.820614
310	71	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 240.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	615e7b91-d14e-49fb-8b96-04fb3ccabc33	2017-03-14 09:34:01.904984
311	72	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 18\ncontrato_id: 18\npago_id: \ndescuento_id: \n	1	\N	\N	c0be5a6a-13d7-429c-baf8-553f3fc3a258	2017-03-14 09:34:01.994059
313	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	af5e1652-0f93-426b-a10d-187f3a32ebd0	2017-03-14 09:34:02.15254
314	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	c2fc49dc-f956-47d4-a9bc-3f609710d1df	2017-03-14 09:34:02.206415
315	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	ae581f73-4316-4736-8436-2ab65ec1e845	2017-03-14 09:34:02.262259
316	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	4a6ea735-a0c4-4c29-bc88-c9c8729c616b	2017-03-14 09:34:02.315161
317	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	3b1ee6d4-f95d-4a5e-9ca0-60d41ca2b8ae	2017-03-14 09:34:02.361167
318	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	e5dad767-39bf-44e4-acca-0fd7b0b514a2	2017-03-14 09:34:02.416548
319	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	1f21534d-8deb-48b0-85e4-1c63e9949acb	2017-03-14 09:34:02.471967
320	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	54039d26-c186-4155-bffe-60b1da86f2dc	2017-03-14 09:34:02.528414
321	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	615314e1-59c0-4c5b-99e2-b7f460b8848b	2017-03-14 09:34:02.585209
322	11	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 11\n	1	\N	\N	586109a8-d285-4b3c-a6a2-df8de636ffb6	2017-03-14 09:34:02.637402
323	12	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 12\n	1	\N	\N	e6d360a4-9c94-4298-b083-5896d29a107a	2017-03-14 09:34:02.681761
324	13	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 13\n	1	\N	\N	33dc6348-286a-48da-81f8-07a93a323a91	2017-03-14 09:34:02.72946
325	14	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 14\n	1	\N	\N	fcdeca37-1f12-443d-bcb6-96a69304f933	2017-03-14 09:34:02.781846
326	15	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 15\n	1	\N	\N	0fe3cc0b-8cd2-46ce-8811-bcb3f066b4b9	2017-03-14 09:34:02.828232
327	16	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 16\n	1	\N	\N	a2b81246-c72c-4f01-afa4-599c59f1b172	2017-03-14 09:34:02.883225
328	17	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 17\n	1	\N	\N	455cf43a-823d-4201-af96-93185414d851	2017-03-14 09:34:02.938604
329	18	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 18\n	1	\N	\N	e5271f4f-7a2d-4b14-8bb3-429f864c4645	2017-03-14 09:34:03.006355
330	1	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Marketing\ndescripcion: "-"\n	1	\N	\N	ee6ef627-2cb5-4926-9ec3-c328d901f9a0	2017-03-14 09:34:03.157901
331	2	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	88cf5a6a-8c0e-430d-999c-ca7a734b57ab	2017-03-14 09:34:03.212661
332	3	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	47a81aa9-6eac-4843-a212-ef8d9f45a813	2017-03-14 09:34:03.264434
333	4	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	fd24e40f-decd-4f0d-a71d-ebc6394a52dd	2017-03-14 09:34:03.321435
334	5	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Multimedios\ndescripcion: "-"\n	1	\N	\N	f52b75d0-49cb-4af7-a367-9612e57e5225	2017-03-14 09:34:03.375831
335	6	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Community Manager\ndescripcion: "-"\n	1	\N	\N	027b06c1-15c3-49da-8937-15ba265b9315	2017-03-14 09:34:03.421055
336	7	EspecialidadDeContacto	\N	\N	1	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: "-"\n	1	\N	\N	1b706ecc-b7c0-4b47-8504-e82490011ed2	2017-03-14 09:34:03.477718
337	101	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-001\nnombre: María Rosa\napellido: Conti\nnroIdentificacion: '25644132'\nfechaNacimiento: 1975-07-03\ncalle: Ituzaingo\nnroDomicilio: '245'\npiso: '12'\ndpto: B\ntelefono: '424568'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 1\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b58af779-e0ec-4036-9b44-589cfa7768fa	2017-03-14 09:34:03.624996
339	103	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-003\nnombre: Juliana\napellido: Castiglione\nnroIdentificacion: '30444512'\nfechaNacimiento: 1980-12-09\ncalle: Brisas\nnroDomicilio: '3280'\npiso: '5'\ndpto: '15'\ntelefono: '555321'\nemail: jcastiglione@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 3\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	76ea814d-dbfb-4bf7-ac27-4703c74bcf27	2017-03-14 09:34:03.864071
340	104	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-004\nnombre: Nahuel\napellido: Estevez\nnroIdentificacion: '19423568'\nfechaNacimiento: 1966-11-28\ncalle: Av. Alta Gracia\nnroDomicilio: '5332'\npiso: '12'\ndpto: B\ntelefono: '154632108'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 4\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	489cc4b1-a90a-44ca-a6a0-d3bdd6a984d7	2017-03-14 09:34:03.950951
341	105	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-005\nnombre: Pablo\napellido: Gomez\nnroIdentificacion: '25221305'\nfechaNacimiento: 1970-03-05\ncalle: Neruda\nnroDomicilio: '7393'\npiso: '12'\ndpto: B\ntelefono: '154245689'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 5\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	548658b4-466b-4820-95a5-3d447490284b	2017-03-14 09:34:04.040147
342	106	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-006\nnombre: Abigaíl\napellido: Coronado\nnroIdentificacion: '37926793'\nfechaNacimiento: 1994-03-21\ncalle: F. Varela\nnroDomicilio: '5659'\npiso: '12'\ndpto: B\ntelefono: '432666'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 6\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	5f60f4cb-8f5b-497f-be7b-0cfe5306fcc2	2017-03-14 09:34:04.13242
343	107	Persona	\N	\N	1	\N	\N	create	---\ncodigo: CO-007\nnombre: Hilda\napellido: Zielinski\nnroIdentificacion: '25334991'\nfechaNacimiento: 1970-04-07\ncalle: Joaquin Suarez\nnroDomicilio: '6863'\npiso: '12'\ndpto: B\ntelefono: '4478909'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 7\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	6cc76bb2-15ff-44af-bed3-6bd4690bb45e	2017-03-14 09:34:04.226991
344	1	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-001\nnombre: Charla de Marketing\ndescripcion: "-"\ndia: 2017-03-03\nhora: 2000-01-01 08:00:00.000000000 -03:00\npersona_id: \n	1	\N	\N	2750ddeb-eb1a-4c7b-abec-dd26bbf0df9e	2017-03-14 09:34:04.366743
345	2	Evento	\N	\N	1	\N	\N	create	---\ncodigo: EV-002\nnombre: Reunión con diseñadores\ndescripcion: Reunión entre diseñadores gráficos, diseñadores web y miembros de los\n  diferentes proyectos\ndia: 2017-03-04\nhora: 2000-01-01 09:00:00.000000000 -03:00\npersona_id: \n	1	\N	\N	a2dec287-449a-4133-956e-f4a5d6695f57	2017-03-14 09:34:04.44169
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 345, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-03-14 09:33:26.518405	2017-03-14 09:33:26.518405	1	1
2	Apostoles	2017-03-14 09:33:26.55453	2017-03-14 09:33:26.55453	1	1
3	Bella Vista	2017-03-14 09:33:26.587573	2017-03-14 09:33:26.587573	2	1
4	Encarnación	2017-03-14 09:33:26.619161	2017-03-14 09:33:26.619161	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	200	2017-03-14 09:33:53.089198	2017-03-14 09:33:53.089198
2	CP-002	Cuota de Febrero	Febrero 2017	200	2017-03-14 09:33:53.157904	2017-03-14 09:33:53.157904
3	CP-003	Cuota de Marzo	Marzo 2017	200	2017-03-14 09:33:53.223064	2017-03-14 09:33:53.223064
4	CP-004	Cuota de Abril	Abril 2017	200	2017-03-14 09:33:53.291483	2017-03-14 09:33:53.291483
5	CP-005	Cuota de Mayo	Mayo 2017	200	2017-03-14 09:33:53.360405	2017-03-14 09:33:53.360405
6	CP-006	Cuota de Junio	Junio 2017	200	2017-03-14 09:33:53.426474	2017-03-14 09:33:53.426474
7	CP-007	Cuota de Julio	Julio 2017	200	2017-03-14 09:33:53.492333	2017-03-14 09:33:53.492333
8	CP-008	Cuota de Agosto	Agosto 2017	200	2017-03-14 09:33:53.561687	2017-03-14 09:33:53.561687
9	CP-009	Cuota de Septiembre	Septiembre 2017	200	2017-03-14 09:33:53.628079	2017-03-14 09:33:53.628079
10	CP-010	Cuota de Octubre	Octubre 2017	200	2017-03-14 09:33:53.714095	2017-03-14 09:33:53.714095
11	CP-011	Cuota de Noviembre	Noviembre 2017	200	2017-03-14 09:33:53.782898	2017-03-14 09:33:53.782898
12	CP-012	Cuota de Diciembre	Diciembre 2017	200	2017-03-14 09:33:53.851037	2017-03-14 09:33:53.851037
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
1	2017-01-01	2017-04-30	2017-03-14 09:33:54.520145	2017-03-14 09:33:54.520145	\N	51	1
2	2017-01-01	2017-04-30	2017-03-14 09:33:54.593659	2017-03-14 09:33:54.593659	\N	52	2
3	2017-01-01	2017-04-30	2017-03-14 09:33:54.647882	2017-03-14 09:33:54.647882	\N	54	3
4	2017-01-01	2017-04-30	2017-03-14 09:33:54.703471	2017-03-14 09:33:54.703471	\N	56	4
5	2017-01-01	2017-04-30	2017-03-14 09:33:54.76015	2017-03-14 09:33:54.76015	\N	58	5
6	2017-01-01	2017-04-30	2017-03-14 09:33:54.814909	2017-03-14 09:33:54.814909	\N	60	6
7	2017-01-01	2017-04-30	2017-03-14 09:33:54.870072	2017-03-14 09:33:54.870072	\N	63	7
8	2017-01-01	2017-04-30	2017-03-14 09:33:54.926866	2017-03-14 09:33:54.926866	\N	65	8
9	2017-01-01	2017-04-30	2017-03-14 09:33:54.981659	2017-03-14 09:33:54.981659	\N	67	9
10	2017-01-01	2017-04-30	2017-03-14 09:33:55.036721	2017-03-14 09:33:55.036721	\N	69	10
11	0017-12-10	2017-04-30	2017-03-14 09:33:55.093911	2017-03-14 09:33:55.093911	\N	71	11
12	2017-01-01	2017-04-30	2017-03-14 09:33:55.150377	2017-03-14 09:33:55.150377	\N	65	12
13	2017-01-01	2017-04-30	2017-03-14 09:33:55.282045	2017-03-14 09:33:55.282045	\N	99	13
14	2017-01-01	2017-04-30	2017-03-14 09:33:55.337108	2017-03-14 09:33:55.337108	\N	80	14
15	2017-01-01	2017-04-30	2017-03-14 09:33:55.38106	2017-03-14 09:33:55.38106	\N	89	15
16	2017-01-01	2017-04-30	2017-03-14 09:33:55.437312	2017-03-14 09:33:55.437312	\N	67	16
17	2017-01-01	2017-04-30	2017-03-14 09:33:55.492543	2017-03-14 09:33:55.492543	\N	97	17
18	2017-01-01	2017-04-30	2017-03-14 09:33:55.548441	2017-03-14 09:33:55.548441	\N	75	18
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 18, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
1	0	2017-03-14 09:34:02.069145	2017-03-14 09:34:02.069145	1
2	0	2017-03-14 09:34:02.135188	2017-03-14 09:34:02.135188	2
3	0	2017-03-14 09:34:02.189066	2017-03-14 09:34:02.189066	3
4	0	2017-03-14 09:34:02.245172	2017-03-14 09:34:02.245172	4
5	0	2017-03-14 09:34:02.298883	2017-03-14 09:34:02.298883	5
6	0	2017-03-14 09:34:02.343839	2017-03-14 09:34:02.343839	6
7	0	2017-03-14 09:34:02.398863	2017-03-14 09:34:02.398863	7
8	0	2017-03-14 09:34:02.455911	2017-03-14 09:34:02.455911	8
9	0	2017-03-14 09:34:02.512658	2017-03-14 09:34:02.512658	9
10	0	2017-03-14 09:34:02.568448	2017-03-14 09:34:02.568448	10
11	0	2017-03-14 09:34:02.621945	2017-03-14 09:34:02.621945	11
12	0	2017-03-14 09:34:02.666051	2017-03-14 09:34:02.666051	12
13	0	2017-03-14 09:34:02.712716	2017-03-14 09:34:02.712716	13
14	0	2017-03-14 09:34:02.766007	2017-03-14 09:34:02.766007	14
15	0	2017-03-14 09:34:02.810704	2017-03-14 09:34:02.810704	15
16	0	2017-03-14 09:34:02.865772	2017-03-14 09:34:02.865772	16
17	0	2017-03-14 09:34:02.921541	2017-03-14 09:34:02.921541	17
18	0	2017-03-14 09:34:02.989686	2017-03-14 09:34:02.989686	18
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 18, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
1	288	f	2017-03-14 09:33:55.708301	2017-03-14 09:33:55.708301	1	1	1	\N	\N
2	288	f	2017-03-14 09:33:55.812429	2017-03-14 09:33:55.812429	2	1	1	\N	\N
3	240	f	2017-03-14 09:33:55.900659	2017-03-14 09:33:55.900659	3	1	1	\N	\N
4	200	f	2017-03-14 09:33:55.993208	2017-03-14 09:33:55.993208	4	1	1	\N	\N
5	288	f	2017-03-14 09:33:56.072685	2017-03-14 09:33:56.072685	1	2	2	\N	\N
6	288	f	2017-03-14 09:33:56.161848	2017-03-14 09:33:56.161848	2	2	2	\N	\N
7	240	f	2017-03-14 09:33:56.244403	2017-03-14 09:33:56.244403	3	2	2	\N	\N
8	200	f	2017-03-14 09:33:56.33498	2017-03-14 09:33:56.33498	4	2	2	\N	\N
9	288	f	2017-03-14 09:33:56.422487	2017-03-14 09:33:56.422487	1	3	3	\N	\N
10	288	f	2017-03-14 09:33:56.508255	2017-03-14 09:33:56.508255	2	3	3	\N	\N
11	240	f	2017-03-14 09:33:56.598781	2017-03-14 09:33:56.598781	3	3	3	\N	\N
12	200	f	2017-03-14 09:33:56.69105	2017-03-14 09:33:56.69105	4	3	3	\N	\N
13	288	f	2017-03-14 09:33:56.773467	2017-03-14 09:33:56.773467	1	4	4	\N	\N
14	288	f	2017-03-14 09:33:56.851031	2017-03-14 09:33:56.851031	2	4	4	\N	\N
15	240	f	2017-03-14 09:33:56.940533	2017-03-14 09:33:56.940533	3	4	4	\N	\N
16	200	f	2017-03-14 09:33:57.02469	2017-03-14 09:33:57.02469	4	4	4	\N	\N
17	288	f	2017-03-14 09:33:57.107667	2017-03-14 09:33:57.107667	1	5	5	\N	\N
18	288	f	2017-03-14 09:33:57.201748	2017-03-14 09:33:57.201748	2	5	5	\N	\N
19	240	f	2017-03-14 09:33:57.288971	2017-03-14 09:33:57.288971	3	5	5	\N	\N
20	200	f	2017-03-14 09:33:57.380592	2017-03-14 09:33:57.380592	4	5	5	\N	\N
21	288	f	2017-03-14 09:33:57.465404	2017-03-14 09:33:57.465404	1	6	6	\N	\N
22	288	f	2017-03-14 09:33:57.553281	2017-03-14 09:33:57.553281	2	6	6	\N	\N
23	240	f	2017-03-14 09:33:57.644244	2017-03-14 09:33:57.644244	3	6	6	\N	\N
24	200	f	2017-03-14 09:33:57.732877	2017-03-14 09:33:57.732877	4	6	6	\N	\N
25	288	f	2017-03-14 09:33:57.820111	2017-03-14 09:33:57.820111	1	7	7	\N	\N
26	288	f	2017-03-14 09:33:57.909023	2017-03-14 09:33:57.909023	2	7	7	\N	\N
27	240	f	2017-03-14 09:33:58.028844	2017-03-14 09:33:58.028844	3	7	7	\N	\N
28	200	f	2017-03-14 09:33:58.128877	2017-03-14 09:33:58.128877	4	7	7	\N	\N
29	288	f	2017-03-14 09:33:58.257558	2017-03-14 09:33:58.257558	1	8	8	\N	\N
30	288	f	2017-03-14 09:33:58.345269	2017-03-14 09:33:58.345269	2	8	8	\N	\N
31	240	f	2017-03-14 09:33:58.43104	2017-03-14 09:33:58.43104	3	8	8	\N	\N
32	200	f	2017-03-14 09:33:58.52788	2017-03-14 09:33:58.52788	4	8	8	\N	\N
33	288	f	2017-03-14 09:33:58.620662	2017-03-14 09:33:58.620662	1	9	9	\N	\N
34	288	f	2017-03-14 09:33:58.700787	2017-03-14 09:33:58.700787	2	9	9	\N	\N
35	240	f	2017-03-14 09:33:58.788035	2017-03-14 09:33:58.788035	3	9	9	\N	\N
36	200	f	2017-03-14 09:33:58.869728	2017-03-14 09:33:58.869728	4	9	9	\N	\N
37	288	f	2017-03-14 09:33:58.95439	2017-03-14 09:33:58.95439	1	10	10	\N	\N
38	288	f	2017-03-14 09:33:59.029448	2017-03-14 09:33:59.029448	2	10	10	\N	\N
39	240	f	2017-03-14 09:33:59.112784	2017-03-14 09:33:59.112784	3	10	10	\N	\N
40	200	f	2017-03-14 09:33:59.206274	2017-03-14 09:33:59.206274	4	10	10	\N	\N
41	288	f	2017-03-14 09:33:59.289399	2017-03-14 09:33:59.289399	1	11	11	\N	\N
42	288	f	2017-03-14 09:33:59.375026	2017-03-14 09:33:59.375026	2	11	11	\N	\N
43	240	f	2017-03-14 09:33:59.453583	2017-03-14 09:33:59.453583	3	11	11	\N	\N
44	200	f	2017-03-14 09:33:59.547181	2017-03-14 09:33:59.547181	4	11	11	\N	\N
45	288	f	2017-03-14 09:33:59.630624	2017-03-14 09:33:59.630624	1	12	12	\N	\N
46	288	f	2017-03-14 09:33:59.709944	2017-03-14 09:33:59.709944	2	12	12	\N	\N
47	240	f	2017-03-14 09:33:59.789108	2017-03-14 09:33:59.789108	3	12	12	\N	\N
48	200	f	2017-03-14 09:33:59.881551	2017-03-14 09:33:59.881551	4	12	12	\N	\N
49	288	f	2017-03-14 09:33:59.977172	2017-03-14 09:33:59.977172	1	13	13	\N	\N
50	288	f	2017-03-14 09:34:00.066047	2017-03-14 09:34:00.066047	2	13	13	\N	\N
51	240	f	2017-03-14 09:34:00.143119	2017-03-14 09:34:00.143119	3	13	13	\N	\N
52	200	f	2017-03-14 09:34:00.226997	2017-03-14 09:34:00.226997	4	13	13	\N	\N
53	288	f	2017-03-14 09:34:00.310314	2017-03-14 09:34:00.310314	1	14	14	\N	\N
54	288	f	2017-03-14 09:34:00.386039	2017-03-14 09:34:00.386039	2	14	14	\N	\N
55	240	f	2017-03-14 09:34:00.469699	2017-03-14 09:34:00.469699	3	14	14	\N	\N
56	200	f	2017-03-14 09:34:00.562778	2017-03-14 09:34:00.562778	4	14	14	\N	\N
57	288	f	2017-03-14 09:34:00.644124	2017-03-14 09:34:00.644124	1	15	15	\N	\N
58	288	f	2017-03-14 09:34:00.720739	2017-03-14 09:34:00.720739	2	15	15	\N	\N
59	240	f	2017-03-14 09:34:00.799224	2017-03-14 09:34:00.799224	3	15	15	\N	\N
60	200	f	2017-03-14 09:34:00.895197	2017-03-14 09:34:00.895197	4	15	15	\N	\N
61	288	f	2017-03-14 09:34:01.019872	2017-03-14 09:34:01.019872	1	16	16	\N	\N
62	288	f	2017-03-14 09:34:01.099005	2017-03-14 09:34:01.099005	2	16	16	\N	\N
63	240	f	2017-03-14 09:34:01.189617	2017-03-14 09:34:01.189617	3	16	16	\N	\N
64	200	f	2017-03-14 09:34:01.283229	2017-03-14 09:34:01.283229	4	16	16	\N	\N
65	288	f	2017-03-14 09:34:01.368281	2017-03-14 09:34:01.368281	1	17	17	\N	\N
66	288	f	2017-03-14 09:34:01.453695	2017-03-14 09:34:01.453695	2	17	17	\N	\N
67	240	f	2017-03-14 09:34:01.542767	2017-03-14 09:34:01.542767	3	17	17	\N	\N
68	200	f	2017-03-14 09:34:01.629678	2017-03-14 09:34:01.629678	4	17	17	\N	\N
69	288	f	2017-03-14 09:34:01.712083	2017-03-14 09:34:01.712083	1	18	18	\N	\N
70	288	f	2017-03-14 09:34:01.797374	2017-03-14 09:34:01.797374	2	18	18	\N	\N
71	240	f	2017-03-14 09:34:01.885323	2017-03-14 09:34:01.885323	3	18	18	\N	\N
72	200	f	2017-03-14 09:34:01.972769	2017-03-14 09:34:01.972769	4	18	18	\N	\N
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
1	Finanzas	2017-03-14 09:33:26.844576	2017-03-14 09:33:26.844576
2	Recursos Humanos	2017-03-14 09:33:27.002276	2017-03-14 09:33:27.002276
3	Evaluación	2017-03-14 09:33:27.055978	2017-03-14 09:33:27.055978
4	Logística	2017-03-14 09:33:27.112118	2017-03-14 09:33:27.112118
5	Dirección	2017-03-14 09:33:27.154946	2017-03-14 09:33:27.154946
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-03-14 09:33:52.494879	2017-03-14 09:33:52.494879
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
1	Marketing	-	2017-03-14 09:34:03.135942	2017-03-14 09:34:03.135942
2	Diseño Gráfico	-	2017-03-14 09:34:03.195084	2017-03-14 09:34:03.195084
3	Diseño Web	-	2017-03-14 09:34:03.248481	2017-03-14 09:34:03.248481
4	Fotografía	-	2017-03-14 09:34:03.304327	2017-03-14 09:34:03.304327
5	Multimedios	-	2017-03-14 09:34:03.359892	2017-03-14 09:34:03.359892
6	Community Manager	-	2017-03-14 09:34:03.404503	2017-03-14 09:34:03.404503
7	Crowdfunding	-	2017-03-14 09:34:03.461438	2017-03-14 09:34:03.461438
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 7, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-03-14 09:33:45.978748	2017-03-14 09:33:45.978748
2	Doing	f	1	\N	2017-03-14 09:33:46.039854	2017-03-14 09:33:46.039854
3	Done	t	2	\N	2017-03-14 09:33:46.119582	2017-03-14 09:33:46.119582
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-03-14 09:33:36.396232	2017-03-14 09:33:36.396232
2	Incubación	-	1	2017-03-14 09:33:36.460344	2017-03-14 09:33:36.460344
3	post incubacion	-	2	2017-03-14 09:33:36.513247	2017-03-14 09:33:36.513247
4	Cuarta etapa	-	\N	2017-03-14 09:33:36.57105	2017-03-14 09:33:36.57105
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at, persona_id) FROM stdin;
1	EV-001	Charla de Marketing	-	2017-03-03	08:00:00	2017-03-14 09:34:04.338758	2017-03-14 09:34:04.338758	\N
2	EV-002	Reunión con diseñadores	Reunión entre diseñadores gráficos, diseñadores web y miembros de los diferentes proyectos	2017-03-04	09:00:00	2017-03-14 09:34:04.420044	2017-03-14 09:34:04.420044	\N
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
1	2017-01-01 08:20:00	2017-03-14 09:33:49.161963	2017-03-14 09:33:49.161963	1	1	1	3
2	2017-01-01 08:20:00	2017-03-14 09:33:49.191807	2017-03-14 09:33:49.191807	2	1	1	3
3	2017-01-01 08:21:00	2017-03-14 09:33:49.212859	2017-03-14 09:33:49.212859	3	1	1	3
4	2017-01-01 08:22:00	2017-03-14 09:33:49.236789	2017-03-14 09:33:49.236789	1	2	1	3
5	2017-01-02 08:22:00	2017-03-14 09:33:49.257918	2017-03-14 09:33:49.257918	2	2	1	3
6	2017-01-08 08:23:00	2017-03-14 09:33:49.281488	2017-03-14 09:33:49.281488	3	2	1	3
7	2017-01-01 08:23:00	2017-03-14 09:33:49.303207	2017-03-14 09:33:49.303207	1	3	1	3
8	2017-01-06 08:24:00	2017-03-14 09:33:49.324559	2017-03-14 09:33:49.324559	2	3	1	3
9	2017-01-01 08:20:00	2017-03-14 09:33:49.34636	2017-03-14 09:33:49.34636	4	1	2	3
10	2017-01-01 08:20:00	2017-03-14 09:33:49.370878	2017-03-14 09:33:49.370878	5	1	2	3
11	2017-01-01 08:21:00	2017-03-14 09:33:49.392538	2017-03-14 09:33:49.392538	6	1	2	3
12	2017-01-01 08:22:00	2017-03-14 09:33:49.413584	2017-03-14 09:33:49.413584	4	2	2	3
13	2017-01-02 08:22:00	2017-03-14 09:33:49.436972	2017-03-14 09:33:49.436972	5	2	2	3
14	2017-01-08 08:23:00	2017-03-14 09:33:49.459155	2017-03-14 09:33:49.459155	6	2	2	3
15	2017-01-01 08:23:00	2017-03-14 09:33:49.480996	2017-03-14 09:33:49.480996	4	3	2	3
16	2017-01-06 08:24:00	2017-03-14 09:33:49.501805	2017-03-14 09:33:49.501805	5	3	2	3
17	2017-01-01 08:20:00	2017-03-14 09:33:49.524238	2017-03-14 09:33:49.524238	7	1	3	2
18	2017-01-01 08:20:00	2017-03-14 09:33:49.547686	2017-03-14 09:33:49.547686	8	1	3	2
19	2017-01-01 08:21:00	2017-03-14 09:33:49.568814	2017-03-14 09:33:49.568814	9	1	3	2
20	2017-01-01 08:22:00	2017-03-14 09:33:49.5925	2017-03-14 09:33:49.5925	7	2	3	2
21	2017-01-02 08:22:00	2017-03-14 09:33:49.613891	2017-03-14 09:33:49.613891	8	2	3	2
22	2017-01-08 08:23:00	2017-03-14 09:33:49.635207	2017-03-14 09:33:49.635207	9	2	3	2
23	2017-01-01 08:23:00	2017-03-14 09:33:49.659211	2017-03-14 09:33:49.659211	7	3	3	2
24	2017-01-06 08:24:00	2017-03-14 09:33:49.680048	2017-03-14 09:33:49.680048	8	3	3	2
25	2017-01-01 08:20:00	2017-03-14 09:33:49.703774	2017-03-14 09:33:49.703774	10	1	4	2
26	2017-01-01 08:20:00	2017-03-14 09:33:49.724996	2017-03-14 09:33:49.724996	11	1	4	2
27	2017-01-01 08:21:00	2017-03-14 09:33:49.747835	2017-03-14 09:33:49.747835	12	1	4	2
28	2017-01-01 08:22:00	2017-03-14 09:33:49.768625	2017-03-14 09:33:49.768625	10	2	4	2
29	2017-01-02 08:22:00	2017-03-14 09:33:49.792368	2017-03-14 09:33:49.792368	11	2	4	2
30	2017-01-08 08:23:00	2017-03-14 09:33:49.813859	2017-03-14 09:33:49.813859	12	2	4	2
31	2017-01-01 08:23:00	2017-03-14 09:33:49.837175	2017-03-14 09:33:49.837175	10	3	4	2
32	2017-01-06 08:24:00	2017-03-14 09:33:49.858619	2017-03-14 09:33:49.858619	11	3	4	2
33	2017-01-01 08:20:00	2017-03-14 09:33:49.88162	2017-03-14 09:33:49.88162	13	1	5	3
34	2017-01-01 08:20:00	2017-03-14 09:33:49.902964	2017-03-14 09:33:49.902964	14	1	5	3
35	2017-01-01 08:21:00	2017-03-14 09:33:49.924605	2017-03-14 09:33:49.924605	15	1	5	3
36	2017-01-01 08:22:00	2017-03-14 09:33:49.948339	2017-03-14 09:33:49.948339	13	2	5	3
37	2017-01-02 08:22:00	2017-03-14 09:33:49.968618	2017-03-14 09:33:49.968618	14	2	5	3
38	2017-01-08 08:23:00	2017-03-14 09:33:49.992758	2017-03-14 09:33:49.992758	15	2	5	3
39	2017-01-01 08:23:00	2017-03-14 09:33:50.013863	2017-03-14 09:33:50.013863	13	3	5	3
40	2017-01-06 08:24:00	2017-03-14 09:33:50.037434	2017-03-14 09:33:50.037434	14	3	5	3
41	2017-01-01 08:20:00	2017-03-14 09:33:50.058602	2017-03-14 09:33:50.058602	16	1	6	3
42	2017-01-01 08:20:00	2017-03-14 09:33:50.080472	2017-03-14 09:33:50.080472	17	1	6	3
43	2017-01-01 08:21:00	2017-03-14 09:33:50.103941	2017-03-14 09:33:50.103941	18	1	6	3
44	2017-01-01 08:22:00	2017-03-14 09:33:50.124788	2017-03-14 09:33:50.124788	16	2	6	3
45	2017-01-02 08:22:00	2017-03-14 09:33:50.148024	2017-03-14 09:33:50.148024	17	2	6	3
46	2017-01-08 08:23:00	2017-03-14 09:33:50.168622	2017-03-14 09:33:50.168622	18	2	6	3
47	2017-01-01 08:23:00	2017-03-14 09:33:50.192645	2017-03-14 09:33:50.192645	16	3	6	3
48	2017-01-06 08:24:00	2017-03-14 09:33:50.213837	2017-03-14 09:33:50.213837	17	3	6	3
49	2017-01-01 08:20:00	2017-03-14 09:33:50.235908	2017-03-14 09:33:50.235908	19	1	7	2
50	2017-01-01 08:20:00	2017-03-14 09:33:50.259782	2017-03-14 09:33:50.259782	20	1	7	2
51	2017-01-01 08:21:00	2017-03-14 09:33:50.281723	2017-03-14 09:33:50.281723	21	1	7	2
52	2017-01-01 08:22:00	2017-03-14 09:33:50.303517	2017-03-14 09:33:50.303517	19	2	7	2
53	2017-01-02 08:22:00	2017-03-14 09:33:50.324839	2017-03-14 09:33:50.324839	20	2	7	2
54	2017-01-08 08:23:00	2017-03-14 09:33:50.346777	2017-03-14 09:33:50.346777	21	2	7	2
55	2017-01-01 08:23:00	2017-03-14 09:33:50.368986	2017-03-14 09:33:50.368986	19	3	7	2
56	2017-01-06 08:24:00	2017-03-14 09:33:50.392085	2017-03-14 09:33:50.392085	20	3	7	2
57	2017-01-01 08:20:00	2017-03-14 09:33:50.414706	2017-03-14 09:33:50.414706	22	1	8	3
58	2017-01-01 08:20:00	2017-03-14 09:33:50.435884	2017-03-14 09:33:50.435884	23	1	8	3
59	2017-01-01 08:21:00	2017-03-14 09:33:50.458988	2017-03-14 09:33:50.458988	24	1	8	3
60	2017-01-01 08:22:00	2017-03-14 09:33:50.480462	2017-03-14 09:33:50.480462	22	2	8	3
61	2017-01-02 08:22:00	2017-03-14 09:33:50.503877	2017-03-14 09:33:50.503877	23	2	8	3
62	2017-01-08 08:23:00	2017-03-14 09:33:50.525083	2017-03-14 09:33:50.525083	24	2	8	3
63	2017-01-01 08:23:00	2017-03-14 09:33:50.546861	2017-03-14 09:33:50.546861	22	3	8	3
64	2017-01-06 08:24:00	2017-03-14 09:33:50.569418	2017-03-14 09:33:50.569418	23	3	8	3
65	2017-01-01 08:20:00	2017-03-14 09:33:50.593152	2017-03-14 09:33:50.593152	25	1	9	2
66	2017-01-01 08:20:00	2017-03-14 09:33:50.614412	2017-03-14 09:33:50.614412	26	1	9	2
67	2017-01-01 08:21:00	2017-03-14 09:33:50.635924	2017-03-14 09:33:50.635924	27	1	9	2
68	2017-01-01 08:22:00	2017-03-14 09:33:50.658789	2017-03-14 09:33:50.658789	25	2	9	2
69	2017-01-02 08:22:00	2017-03-14 09:33:50.681072	2017-03-14 09:33:50.681072	26	2	9	2
70	2017-01-08 08:23:00	2017-03-14 09:33:50.702517	2017-03-14 09:33:50.702517	27	2	9	2
71	2017-01-01 08:23:00	2017-03-14 09:33:50.726663	2017-03-14 09:33:50.726663	25	3	9	2
72	2017-01-06 08:24:00	2017-03-14 09:33:50.748576	2017-03-14 09:33:50.748576	26	3	9	2
73	2017-01-01 08:20:00	2017-03-14 09:33:50.76968	2017-03-14 09:33:50.76968	28	1	10	3
74	2017-01-01 08:20:00	2017-03-14 09:33:50.7932	2017-03-14 09:33:50.7932	29	1	10	3
75	2017-01-01 08:21:00	2017-03-14 09:33:50.814622	2017-03-14 09:33:50.814622	30	1	10	3
76	2017-01-01 08:22:00	2017-03-14 09:33:50.836161	2017-03-14 09:33:50.836161	28	2	10	3
77	2017-01-02 08:22:00	2017-03-14 09:33:50.859955	2017-03-14 09:33:50.859955	29	2	10	3
78	2017-01-08 08:23:00	2017-03-14 09:33:50.880718	2017-03-14 09:33:50.880718	30	2	10	3
79	2017-01-01 08:23:00	2017-03-14 09:33:50.905531	2017-03-14 09:33:50.905531	28	3	10	3
80	2017-01-06 08:24:00	2017-03-14 09:33:50.924678	2017-03-14 09:33:50.924678	29	3	10	3
81	2017-01-01 08:20:00	2017-03-14 09:33:50.948685	2017-03-14 09:33:50.948685	31	1	11	3
82	2017-01-01 08:20:00	2017-03-14 09:33:50.969778	2017-03-14 09:33:50.969778	32	1	11	3
83	2017-01-01 08:21:00	2017-03-14 09:33:50.991822	2017-03-14 09:33:50.991822	33	1	11	3
84	2017-01-01 08:22:00	2017-03-14 09:33:51.01569	2017-03-14 09:33:51.01569	31	2	11	3
85	2017-01-02 08:22:00	2017-03-14 09:33:51.036206	2017-03-14 09:33:51.036206	32	2	11	3
86	2017-01-08 08:23:00	2017-03-14 09:33:51.059434	2017-03-14 09:33:51.059434	33	2	11	3
87	2017-01-01 08:23:00	2017-03-14 09:33:51.080956	2017-03-14 09:33:51.080956	31	3	11	3
88	2017-01-06 08:24:00	2017-03-14 09:33:51.12474	2017-03-14 09:33:51.12474	32	3	11	3
89	2017-01-01 08:20:00	2017-03-14 09:33:51.148455	2017-03-14 09:33:51.148455	34	1	12	3
90	2017-01-01 08:20:00	2017-03-14 09:33:51.169779	2017-03-14 09:33:51.169779	35	1	12	3
91	2017-01-01 08:21:00	2017-03-14 09:33:51.193762	2017-03-14 09:33:51.193762	36	1	12	3
92	2017-01-01 08:22:00	2017-03-14 09:33:51.214656	2017-03-14 09:33:51.214656	34	2	12	3
93	2017-01-02 08:22:00	2017-03-14 09:33:51.236346	2017-03-14 09:33:51.236346	35	2	12	3
94	2017-01-08 08:23:00	2017-03-14 09:33:51.259686	2017-03-14 09:33:51.259686	36	2	12	3
95	2017-01-01 08:23:00	2017-03-14 09:33:51.282258	2017-03-14 09:33:51.282258	34	3	12	3
96	2017-01-06 08:24:00	2017-03-14 09:33:51.302608	2017-03-14 09:33:51.302608	35	3	12	3
97	2017-01-01 08:20:00	2017-03-14 09:33:51.32536	2017-03-14 09:33:51.32536	37	1	13	2
98	2017-01-01 08:20:00	2017-03-14 09:33:51.348993	2017-03-14 09:33:51.348993	38	1	13	2
99	2017-01-01 08:21:00	2017-03-14 09:33:51.370075	2017-03-14 09:33:51.370075	39	1	13	2
100	2017-01-01 08:22:00	2017-03-14 09:33:51.393536	2017-03-14 09:33:51.393536	37	2	13	2
101	2017-01-02 08:22:00	2017-03-14 09:33:51.415183	2017-03-14 09:33:51.415183	38	2	13	2
102	2017-01-08 08:23:00	2017-03-14 09:33:51.436486	2017-03-14 09:33:51.436486	39	2	13	2
103	2017-01-01 08:23:00	2017-03-14 09:33:51.460144	2017-03-14 09:33:51.460144	37	3	13	2
104	2017-01-06 08:24:00	2017-03-14 09:33:51.481065	2017-03-14 09:33:51.481065	38	3	13	2
105	2017-01-01 08:20:00	2017-03-14 09:33:51.504555	2017-03-14 09:33:51.504555	40	1	14	2
106	2017-01-01 08:20:00	2017-03-14 09:33:51.562789	2017-03-14 09:33:51.562789	41	1	14	2
107	2017-01-01 08:21:00	2017-03-14 09:33:51.592916	2017-03-14 09:33:51.592916	42	1	14	2
108	2017-01-01 08:22:00	2017-03-14 09:33:51.615065	2017-03-14 09:33:51.615065	40	2	14	2
109	2017-01-02 08:22:00	2017-03-14 09:33:51.637599	2017-03-14 09:33:51.637599	41	2	14	2
110	2017-01-08 08:23:00	2017-03-14 09:33:51.659754	2017-03-14 09:33:51.659754	42	2	14	2
111	2017-01-01 08:23:00	2017-03-14 09:33:51.680887	2017-03-14 09:33:51.680887	40	3	14	2
112	2017-01-06 08:24:00	2017-03-14 09:33:51.704783	2017-03-14 09:33:51.704783	41	3	14	2
113	2017-01-01 08:20:00	2017-03-14 09:33:51.725816	2017-03-14 09:33:51.725816	43	1	15	3
114	2017-01-01 08:20:00	2017-03-14 09:33:51.747687	2017-03-14 09:33:51.747687	44	1	15	3
115	2017-01-01 08:21:00	2017-03-14 09:33:51.771693	2017-03-14 09:33:51.771693	45	1	15	3
116	2017-01-01 08:22:00	2017-03-14 09:33:51.792022	2017-03-14 09:33:51.792022	43	2	15	3
117	2017-01-02 08:22:00	2017-03-14 09:33:51.815623	2017-03-14 09:33:51.815623	44	2	15	3
118	2017-01-08 08:23:00	2017-03-14 09:33:51.836524	2017-03-14 09:33:51.836524	45	2	15	3
119	2017-01-01 08:23:00	2017-03-14 09:33:51.860561	2017-03-14 09:33:51.860561	43	3	15	3
120	2017-01-06 08:24:00	2017-03-14 09:33:51.880519	2017-03-14 09:33:51.880519	44	3	15	3
121	2017-01-01 08:20:00	2017-03-14 09:33:51.903952	2017-03-14 09:33:51.903952	46	1	16	3
122	2017-01-01 08:20:00	2017-03-14 09:33:51.924496	2017-03-14 09:33:51.924496	47	1	16	3
123	2017-01-01 08:21:00	2017-03-14 09:33:51.947988	2017-03-14 09:33:51.947988	48	1	16	3
124	2017-01-01 08:22:00	2017-03-14 09:33:51.970533	2017-03-14 09:33:51.970533	46	2	16	3
125	2017-01-02 08:22:00	2017-03-14 09:33:51.992295	2017-03-14 09:33:51.992295	47	2	16	3
126	2017-01-08 08:23:00	2017-03-14 09:33:52.015626	2017-03-14 09:33:52.015626	48	2	16	3
127	2017-01-01 08:23:00	2017-03-14 09:33:52.036788	2017-03-14 09:33:52.036788	46	3	16	3
128	2017-01-06 08:24:00	2017-03-14 09:33:52.058369	2017-03-14 09:33:52.058369	47	3	16	3
129	2017-01-01 08:20:00	2017-03-14 09:33:52.082764	2017-03-14 09:33:52.082764	49	1	17	3
130	2017-01-01 08:20:00	2017-03-14 09:33:52.104798	2017-03-14 09:33:52.104798	50	1	17	3
131	2017-01-01 08:21:00	2017-03-14 09:33:52.126088	2017-03-14 09:33:52.126088	51	1	17	3
132	2017-01-01 08:22:00	2017-03-14 09:33:52.14956	2017-03-14 09:33:52.14956	49	2	17	3
133	2017-01-02 08:22:00	2017-03-14 09:33:52.171069	2017-03-14 09:33:52.171069	50	2	17	3
134	2017-01-08 08:23:00	2017-03-14 09:33:52.192453	2017-03-14 09:33:52.192453	51	2	17	3
135	2017-01-01 08:23:00	2017-03-14 09:33:52.216168	2017-03-14 09:33:52.216168	49	3	17	3
136	2017-01-06 08:24:00	2017-03-14 09:33:52.237134	2017-03-14 09:33:52.237134	50	3	17	3
137	2017-01-01 08:20:00	2017-03-14 09:33:52.26045	2017-03-14 09:33:52.26045	52	1	18	3
138	2017-01-01 08:20:00	2017-03-14 09:33:52.281524	2017-03-14 09:33:52.281524	53	1	18	3
139	2017-01-01 08:21:00	2017-03-14 09:33:52.304997	2017-03-14 09:33:52.304997	54	1	18	3
140	2017-01-01 08:22:00	2017-03-14 09:33:52.326221	2017-03-14 09:33:52.326221	52	2	18	3
141	2017-01-02 08:22:00	2017-03-14 09:33:52.349087	2017-03-14 09:33:52.349087	53	2	18	3
142	2017-01-08 08:23:00	2017-03-14 09:33:52.371333	2017-03-14 09:33:52.371333	54	2	18	3
143	2017-01-01 08:23:00	2017-03-14 09:33:52.392326	2017-03-14 09:33:52.392326	52	3	18	3
144	2017-01-06 08:24:00	2017-03-14 09:33:52.415199	2017-03-14 09:33:52.415199	53	3	18	3
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 144, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-03-14 09:33:52.606278	2017-03-14 09:33:52.606278
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
1	Actividad	2017-03-14 09:33:40.582928	2017-03-14 09:33:40.582928
2	Area	2017-03-14 09:33:40.615034	2017-03-14 09:33:40.615034
3	Ciudad	2017-03-14 09:33:40.637337	2017-03-14 09:33:40.637337
4	ConceptoDePago	2017-03-14 09:33:40.669352	2017-03-14 09:33:40.669352
5	Contacto	2017-03-14 09:33:40.693102	2017-03-14 09:33:40.693102
6	Contrato	2017-03-14 09:33:40.726621	2017-03-14 09:33:40.726621
7	Cuenta	2017-03-14 09:33:40.749117	2017-03-14 09:33:40.749117
8	Departamento	2017-03-14 09:33:40.78171	2017-03-14 09:33:40.78171
9	Descuento	2017-03-14 09:33:40.803126	2017-03-14 09:33:40.803126
10	Empleado	2017-03-14 09:33:40.83625	2017-03-14 09:33:40.83625
11	EspecialidadDeContacto	2017-03-14 09:33:40.859902	2017-03-14 09:33:40.859902
12	Estado	2017-03-14 09:33:40.881764	2017-03-14 09:33:40.881764
13	Etapa	2017-03-14 09:33:40.904174	2017-03-14 09:33:40.904174
14	Evento	2017-03-14 09:33:40.926399	2017-03-14 09:33:40.926399
15	EventoProyecto	2017-03-14 09:33:40.948884	2017-03-14 09:33:40.948884
16	MiembroEquipo	2017-03-14 09:33:40.971004	2017-03-14 09:33:40.971004
17	Pago	2017-03-14 09:33:40.992592	2017-03-14 09:33:40.992592
18	Pais	2017-03-14 09:33:41.016071	2017-03-14 09:33:41.016071
19	Provincia	2017-03-14 09:33:41.037457	2017-03-14 09:33:41.037457
20	Proyecto	2017-03-14 09:33:41.058725	2017-03-14 09:33:41.058725
21	Rol	2017-03-14 09:33:41.102703	2017-03-14 09:33:41.102703
22	RolDeEmpleado	2017-03-14 09:33:41.125124	2017-03-14 09:33:41.125124
23	TipoDocumento	2017-03-14 09:33:41.14838	2017-03-14 09:33:41.14838
24	TipoDePago	2017-03-14 09:33:41.170993	2017-03-14 09:33:41.170993
25	User	2017-03-14 09:33:41.192611	2017-03-14 09:33:41.192611
26	ActividadProyecto	2017-03-14 09:33:41.213857	2017-03-14 09:33:41.213857
27	CuotaPorCliente	2017-03-14 09:33:41.236934	2017-03-14 09:33:41.236934
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
1	Argentina	2017-03-14 09:33:26.253446	2017-03-14 09:33:26.253446
2	Paraguay	2017-03-14 09:33:26.277797	2017-03-14 09:33:26.277797
3	Brasil	2017-03-14 09:33:26.298077	2017-03-14 09:33:26.298077
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-03-14 09:33:41.370268	2017-03-14 09:33:41.370268	1	1
2	2017-03-14 09:33:41.399211	2017-03-14 09:33:41.399211	2	1
3	2017-03-14 09:33:41.422158	2017-03-14 09:33:41.422158	3	1
4	2017-03-14 09:33:41.443255	2017-03-14 09:33:41.443255	4	1
5	2017-03-14 09:33:41.466519	2017-03-14 09:33:41.466519	1	2
6	2017-03-14 09:33:41.488088	2017-03-14 09:33:41.488088	2	2
7	2017-03-14 09:33:41.510979	2017-03-14 09:33:41.510979	3	2
8	2017-03-14 09:33:41.53209	2017-03-14 09:33:41.53209	4	2
9	2017-03-14 09:33:41.555601	2017-03-14 09:33:41.555601	1	3
10	2017-03-14 09:33:41.577283	2017-03-14 09:33:41.577283	2	3
11	2017-03-14 09:33:41.599018	2017-03-14 09:33:41.599018	3	3
12	2017-03-14 09:33:41.621714	2017-03-14 09:33:41.621714	4	3
13	2017-03-14 09:33:41.644685	2017-03-14 09:33:41.644685	1	4
14	2017-03-14 09:33:41.666216	2017-03-14 09:33:41.666216	2	4
15	2017-03-14 09:33:41.687945	2017-03-14 09:33:41.687945	3	4
16	2017-03-14 09:33:41.711088	2017-03-14 09:33:41.711088	4	4
17	2017-03-14 09:33:41.733799	2017-03-14 09:33:41.733799	1	5
18	2017-03-14 09:33:41.766729	2017-03-14 09:33:41.766729	2	5
19	2017-03-14 09:33:41.787994	2017-03-14 09:33:41.787994	3	5
20	2017-03-14 09:33:41.811036	2017-03-14 09:33:41.811036	4	5
21	2017-03-14 09:33:41.832731	2017-03-14 09:33:41.832731	1	6
22	2017-03-14 09:33:41.855805	2017-03-14 09:33:41.855805	2	6
23	2017-03-14 09:33:41.876724	2017-03-14 09:33:41.876724	3	6
24	2017-03-14 09:33:41.899572	2017-03-14 09:33:41.899572	4	6
25	2017-03-14 09:33:41.921733	2017-03-14 09:33:41.921733	1	7
26	2017-03-14 09:33:41.944869	2017-03-14 09:33:41.944869	2	7
27	2017-03-14 09:33:41.966217	2017-03-14 09:33:41.966217	3	7
28	2017-03-14 09:33:41.988174	2017-03-14 09:33:41.988174	4	7
29	2017-03-14 09:33:42.011323	2017-03-14 09:33:42.011323	1	8
30	2017-03-14 09:33:42.033317	2017-03-14 09:33:42.033317	2	8
31	2017-03-14 09:33:42.056071	2017-03-14 09:33:42.056071	3	8
32	2017-03-14 09:33:42.076761	2017-03-14 09:33:42.076761	4	8
33	2017-03-14 09:33:42.100323	2017-03-14 09:33:42.100323	1	9
34	2017-03-14 09:33:42.121894	2017-03-14 09:33:42.121894	2	9
35	2017-03-14 09:33:42.14465	2017-03-14 09:33:42.14465	3	9
36	2017-03-14 09:33:42.166606	2017-03-14 09:33:42.166606	4	9
37	2017-03-14 09:33:42.188134	2017-03-14 09:33:42.188134	1	10
38	2017-03-14 09:33:42.211322	2017-03-14 09:33:42.211322	2	10
39	2017-03-14 09:33:42.232617	2017-03-14 09:33:42.232617	3	10
40	2017-03-14 09:33:42.255686	2017-03-14 09:33:42.255686	4	10
41	2017-03-14 09:33:42.277102	2017-03-14 09:33:42.277102	1	11
42	2017-03-14 09:33:42.300397	2017-03-14 09:33:42.300397	2	11
43	2017-03-14 09:33:42.322648	2017-03-14 09:33:42.322648	3	11
44	2017-03-14 09:33:42.343174	2017-03-14 09:33:42.343174	4	11
45	2017-03-14 09:33:42.366685	2017-03-14 09:33:42.366685	1	12
46	2017-03-14 09:33:42.387979	2017-03-14 09:33:42.387979	2	12
47	2017-03-14 09:33:42.41134	2017-03-14 09:33:42.41134	3	12
48	2017-03-14 09:33:42.432736	2017-03-14 09:33:42.432736	4	12
49	2017-03-14 09:33:42.45585	2017-03-14 09:33:42.45585	1	13
50	2017-03-14 09:33:42.476961	2017-03-14 09:33:42.476961	2	13
51	2017-03-14 09:33:42.499815	2017-03-14 09:33:42.499815	3	13
52	2017-03-14 09:33:42.522025	2017-03-14 09:33:42.522025	4	13
53	2017-03-14 09:33:42.544042	2017-03-14 09:33:42.544042	1	14
54	2017-03-14 09:33:42.567205	2017-03-14 09:33:42.567205	2	14
55	2017-03-14 09:33:42.588248	2017-03-14 09:33:42.588248	3	14
56	2017-03-14 09:33:42.611535	2017-03-14 09:33:42.611535	4	14
57	2017-03-14 09:33:42.633135	2017-03-14 09:33:42.633135	1	15
58	2017-03-14 09:33:42.654795	2017-03-14 09:33:42.654795	2	15
59	2017-03-14 09:33:42.677304	2017-03-14 09:33:42.677304	3	15
60	2017-03-14 09:33:42.700399	2017-03-14 09:33:42.700399	4	15
61	2017-03-14 09:33:42.722589	2017-03-14 09:33:42.722589	1	16
62	2017-03-14 09:33:42.743729	2017-03-14 09:33:42.743729	2	16
63	2017-03-14 09:33:42.766971	2017-03-14 09:33:42.766971	3	16
64	2017-03-14 09:33:42.788745	2017-03-14 09:33:42.788745	4	16
65	2017-03-14 09:33:42.811706	2017-03-14 09:33:42.811706	1	17
66	2017-03-14 09:33:42.833164	2017-03-14 09:33:42.833164	2	17
67	2017-03-14 09:33:42.856042	2017-03-14 09:33:42.856042	3	17
68	2017-03-14 09:33:42.877767	2017-03-14 09:33:42.877767	4	17
69	2017-03-14 09:33:42.899841	2017-03-14 09:33:42.899841	1	18
70	2017-03-14 09:33:42.966071	2017-03-14 09:33:42.966071	2	18
71	2017-03-14 09:33:42.988556	2017-03-14 09:33:42.988556	3	18
72	2017-03-14 09:33:43.011777	2017-03-14 09:33:43.011777	4	18
73	2017-03-14 09:33:43.032617	2017-03-14 09:33:43.032617	1	19
74	2017-03-14 09:33:43.054941	2017-03-14 09:33:43.054941	2	19
75	2017-03-14 09:33:43.076903	2017-03-14 09:33:43.076903	3	19
76	2017-03-14 09:33:43.099803	2017-03-14 09:33:43.099803	4	19
77	2017-03-14 09:33:43.122203	2017-03-14 09:33:43.122203	1	20
78	2017-03-14 09:33:43.144715	2017-03-14 09:33:43.144715	2	20
79	2017-03-14 09:33:43.16642	2017-03-14 09:33:43.16642	3	20
80	2017-03-14 09:33:43.189559	2017-03-14 09:33:43.189559	4	20
81	2017-03-14 09:33:43.211729	2017-03-14 09:33:43.211729	1	21
82	2017-03-14 09:33:43.233667	2017-03-14 09:33:43.233667	2	21
83	2017-03-14 09:33:43.25461	2017-03-14 09:33:43.25461	3	21
84	2017-03-14 09:33:43.277953	2017-03-14 09:33:43.277953	4	21
85	2017-03-14 09:33:43.299319	2017-03-14 09:33:43.299319	1	22
86	2017-03-14 09:33:43.323104	2017-03-14 09:33:43.323104	2	22
87	2017-03-14 09:33:43.344116	2017-03-14 09:33:43.344116	3	22
88	2017-03-14 09:33:43.367529	2017-03-14 09:33:43.367529	4	22
89	2017-03-14 09:33:43.388813	2017-03-14 09:33:43.388813	1	23
90	2017-03-14 09:33:43.411742	2017-03-14 09:33:43.411742	2	23
91	2017-03-14 09:33:43.432877	2017-03-14 09:33:43.432877	3	23
92	2017-03-14 09:33:43.456255	2017-03-14 09:33:43.456255	4	23
93	2017-03-14 09:33:43.477751	2017-03-14 09:33:43.477751	1	24
94	2017-03-14 09:33:43.510398	2017-03-14 09:33:43.510398	2	24
95	2017-03-14 09:33:43.532807	2017-03-14 09:33:43.532807	3	24
96	2017-03-14 09:33:43.567497	2017-03-14 09:33:43.567497	4	24
97	2017-03-14 09:33:43.588548	2017-03-14 09:33:43.588548	1	25
98	2017-03-14 09:33:43.622725	2017-03-14 09:33:43.622725	2	25
99	2017-03-14 09:33:43.644834	2017-03-14 09:33:43.644834	3	25
100	2017-03-14 09:33:43.677119	2017-03-14 09:33:43.677119	4	25
101	2017-03-14 09:33:43.700518	2017-03-14 09:33:43.700518	5	20
102	2017-03-14 09:33:43.722525	2017-03-14 09:33:43.722525	6	1
103	2017-03-14 09:33:43.74513	2017-03-14 09:33:43.74513	6	2
104	2017-03-14 09:33:43.767675	2017-03-14 09:33:43.767675	6	3
105	2017-03-14 09:33:43.789038	2017-03-14 09:33:43.789038	6	4
106	2017-03-14 09:33:43.811804	2017-03-14 09:33:43.811804	6	5
107	2017-03-14 09:33:43.832927	2017-03-14 09:33:43.832927	6	6
108	2017-03-14 09:33:43.855326	2017-03-14 09:33:43.855326	6	7
109	2017-03-14 09:33:43.878107	2017-03-14 09:33:43.878107	6	8
110	2017-03-14 09:33:43.899636	2017-03-14 09:33:43.899636	6	9
111	2017-03-14 09:33:43.922135	2017-03-14 09:33:43.922135	6	10
112	2017-03-14 09:33:43.946159	2017-03-14 09:33:43.946159	6	11
113	2017-03-14 09:33:43.967299	2017-03-14 09:33:43.967299	6	12
114	2017-03-14 09:33:43.988842	2017-03-14 09:33:43.988842	6	13
115	2017-03-14 09:33:44.012053	2017-03-14 09:33:44.012053	6	14
116	2017-03-14 09:33:44.032683	2017-03-14 09:33:44.032683	6	15
117	2017-03-14 09:33:44.056372	2017-03-14 09:33:44.056372	6	16
118	2017-03-14 09:33:44.078708	2017-03-14 09:33:44.078708	6	17
119	2017-03-14 09:33:44.09974	2017-03-14 09:33:44.09974	6	18
120	2017-03-14 09:33:44.122979	2017-03-14 09:33:44.122979	6	19
121	2017-03-14 09:33:44.144726	2017-03-14 09:33:44.144726	6	20
122	2017-03-14 09:33:44.167692	2017-03-14 09:33:44.167692	6	21
123	2017-03-14 09:33:44.188972	2017-03-14 09:33:44.188972	6	22
124	2017-03-14 09:33:44.211839	2017-03-14 09:33:44.211839	6	23
125	2017-03-14 09:33:44.232914	2017-03-14 09:33:44.232914	6	24
126	2017-03-14 09:33:44.255089	2017-03-14 09:33:44.255089	6	25
127	2017-03-14 09:33:44.27846	2017-03-14 09:33:44.27846	2	26
128	2017-03-14 09:33:44.301101	2017-03-14 09:33:44.301101	4	26
129	2017-03-14 09:33:44.322776	2017-03-14 09:33:44.322776	6	26
130	2017-03-14 09:33:44.34447	2017-03-14 09:33:44.34447	5	17
131	2017-03-14 09:33:44.367698	2017-03-14 09:33:44.367698	5	14
132	2017-03-14 09:33:44.389728	2017-03-14 09:33:44.389728	5	6
133	2017-03-14 09:33:44.412086	2017-03-14 09:33:44.412086	1	27
134	2017-03-14 09:33:44.432966	2017-03-14 09:33:44.432966	3	27
135	2017-03-14 09:33:44.455505	2017-03-14 09:33:44.455505	4	27
136	2017-03-14 09:33:44.478204	2017-03-14 09:33:44.478204	5	27
137	2017-03-14 09:33:44.50016	2017-03-14 09:33:44.50016	6	27
138	2017-03-14 09:33:44.52328	2017-03-14 09:33:44.52328	7	20
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
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	2017-03-14 09:33:27.864425	2017-03-14 09:33:27.864425	1	1	1	1	5	\N	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	2017-03-14 09:33:27.960943	2017-03-14 09:33:27.960943	1	1	1	1	4	\N	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	2017-03-14 09:33:28.040343	2017-03-14 09:33:28.040343	1	1	1	1	3	\N	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	2017-03-14 09:33:28.127344	2017-03-14 09:33:28.127344	1	1	1	1	2	\N	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	2017-03-14 09:33:28.205765	2017-03-14 09:33:28.205765	1	1	1	1	1	\N	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	2017-03-14 09:33:28.298509	2017-03-14 09:33:28.298509	1	1	1	1	4	\N	1	7
7	EMP-007	Maria	Gonzalez	36134076	1991-11-05	176	7141			4401604	mg@gmail.com	Empleado	2017-03-14 09:33:28.387535	2017-03-14 09:33:28.387535	1	1	1	1	5	\N	1	8
8	EMP-008	Elena	Ceballos	25198461	1974-05-06	Tereré	7302	4	B	4355987	ec@gmail.com	Empleado	2017-03-14 09:33:28.474764	2017-03-14 09:33:28.474764	1	1	1	1	4	\N	1	7
9	EMP-009	Alberto	Padilla	33843657	1986-10-17	Rivera	6872			459885	ap@gmail.com	Empleado	2017-03-14 09:33:28.552138	2017-03-14 09:33:28.552138	1	1	1	1	3	\N	1	4
10	EMP-010	Fernando	Gonzalez	33980912	1987-01-21	Tereré	1187			4456980	fg@gmail.com	Empleado	2017-03-14 09:33:28.629604	2017-03-14 09:33:28.629604	1	1	1	1	2	\N	1	3
11	EMP-011	Tiago	Gonzalez	38187222	1995-06-08	Castilla	8299	10	15	4444176	tiagogonzales@gmail.com	Empleado	2017-03-14 09:33:28.718665	2017-03-14 09:33:28.718665	1	1	1	1	1	\N	1	2
12	EMP-012	Cintia	Castro	22612413	1970-02-20	Av. Andalucia	7415	12	A	4255987	cintiacastro@gmail.com	Empleado	2017-03-14 09:33:28.796069	2017-03-14 09:33:28.796069	1	1	1	1	4	\N	1	7
13	EMP-013	Josefina	Jardin	36025176	1991-11-05	176	7141			4401604	josefinajardin@gmail.com	Empleado	2017-03-14 09:33:28.873729	2017-03-14 09:33:28.873729	1	1	1	1	5	\N	1	8
14	EMP-014	Diana	Rivas	25948001	1974-05-06	Tereré	7302	4	B	4355987	dianarivas@gmail.com	Empleado	2017-03-14 09:33:28.96597	2017-03-14 09:33:28.96597	1	1	1	1	4	\N	1	7
15	EMP-015	Dario	Gonzalez	33880019	1986-10-17	Rivera	6872			459885	dariogonzalez@gmail.com	Empleado	2017-03-14 09:33:29.052348	2017-03-14 09:33:29.052348	1	1	1	1	3	\N	1	4
16	EMP-016	Ciro	Zamora	33983707	1987-01-21	Tereré	1187			4456980	cirozamora@gmail.com	Empleado	2017-03-14 09:33:29.129099	2017-03-14 09:33:29.129099	1	1	1	1	2	\N	1	3
17	EMP-017	Zoe	Vazquez	3818104	1995-06-08	Castilla	8299	10	15	4444176	zoevazquez@gmail.com	Empleado	2017-03-14 09:33:29.208698	2017-03-14 09:33:29.208698	1	1	1	1	1	\N	1	2
18	EMP-018	Cristian	Gonzalez	22659193	1970-02-20	Av. Andalucia	7415	12	A	4255987	cristiangonzalez@gmail.com	Empleado	2017-03-14 09:33:29.295505	2017-03-14 09:33:29.295505	1	1	1	1	4	\N	1	7
19	EMP-019	Ana	Manfrin	36222076	1991-11-05	176	7141			4401604	anamanfrin@gmail.com	Empleado	2017-03-14 09:33:29.374188	2017-03-14 09:33:29.374188	1	1	1	1	5	\N	1	8
20	EMP-020	Martina	Adamo	25841001	1974-05-06	Tereré	7302	4	B	4355987	martinaadamo@gmail.com	Empleado	2017-03-14 09:33:29.461816	2017-03-14 09:33:29.461816	1	1	1	1	4	\N	1	7
21	EMP-021	Roberto	Milani	33880333	1986-10-17	Rivera	6872			459885	robertomilani@gmail.com	Empleado	2017-03-14 09:33:29.541274	2017-03-14 09:33:29.541274	1	1	1	1	3	\N	1	4
22	EMP-022	Victor	Gonzalez	33984447	1987-01-21	Tereré	1187			4456980	victorgonzalez@gmail.com	Empleado	2017-03-14 09:33:29.617568	2017-03-14 09:33:29.617568	1	1	1	1	2	\N	1	3
23	EMP-023	Alejandro	Cambril	38113409	1995-06-08	Castilla	8299	10	15	4444176	alejandrocambril@gmail.com	Empleado	2017-03-14 09:33:29.696862	2017-03-14 09:33:29.696862	1	1	1	1	1	\N	1	2
24	EMP-024	Luis	Rizzo	22543493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luisrizzo@gmail.com	Empleado	2017-03-14 09:33:29.773898	2017-03-14 09:33:29.773898	1	1	1	1	4	\N	1	7
25	EMP-025	Mario	Rosas	36060986	1991-11-05	176	7141			4401604	mariorosas@gmail.com	Empleado	2017-03-14 09:33:29.851747	2017-03-14 09:33:29.851747	1	1	1	1	5	\N	1	8
26	EMP-026	Analia	Granados	25131701	1974-05-06	Tereré	7302	4	B	4355987	analiagranados@gmail.com	Empleado	2017-03-14 09:33:29.956686	2017-03-14 09:33:29.956686	1	1	1	1	4	\N	1	7
27	EMP-027	Leonor	Gonzalez	33888717	1986-10-17	Rivera	6872			459885	leonorgonzalez@gmail.com	Empleado	2017-03-14 09:33:30.043477	2017-03-14 09:33:30.043477	1	1	1	1	3	\N	1	4
28	EMP-028	Victor	Baresi	33928407	1987-01-21	Tereré	1187			4456980	victorbaresi@gmail.com	Empleado	2017-03-14 09:33:30.180855	2017-03-14 09:33:30.180855	1	1	1	1	2	\N	1	3
29	EMP-029	Silvana	Lazzaga	38918849	1995-06-08	Castilla	8299	10	15	4444176	silvanalazzaga@gmail.com	Empleado	2017-03-14 09:33:30.26419	2017-03-14 09:33:30.26419	1	1	1	1	1	\N	1	2
30	EMP-030	Juana	Calabrese	220192493	1970-02-20	Av. Andalucia	7415	12	A	4255987	janacalabrese@gmail.com	Empleado	2017-03-14 09:33:30.345678	2017-03-14 09:33:30.345678	1	1	1	1	4	\N	1	7
31	EMP-031	Juliana	Lombardi	38613849	1995-06-08	Castilla	8299	10	15	4444176	julianalombardi@gmail.com	Empleado	2017-03-14 09:33:30.43123	2017-03-14 09:33:30.43123	1	1	1	1	1	\N	1	2
32	EMP-032	Enrique	Cano	22451493	1970-02-20	Av. Andalucia	7415	12	A	4255987	enriquecano@gmail.com	Empleado	2017-03-14 09:33:30.510894	2017-03-14 09:33:30.510894	1	1	1	1	4	\N	1	7
33	EMP-033	Gilda	Lombarde	36064356	1991-11-05	176	7141			4401604	gildalombarde@gmail.com	Empleado	2017-03-14 09:33:30.58566	2017-03-14 09:33:30.58566	1	1	1	1	5	\N	1	8
34	EMP-034	Martin	Bande	25124501	1974-05-06	Tereré	7302	4	B	4355987	martinbande@gmail.com	Empleado	2017-03-14 09:33:30.667175	2017-03-14 09:33:30.667175	1	1	1	1	4	\N	1	7
35	EMP-035	Gabriel	Ferruccio	33451657	1986-10-17	Rivera	6872			459885	gabrielferuccio@gmail.com	Empleado	2017-03-14 09:33:30.754859	2017-03-14 09:33:30.754859	1	1	1	1	3	\N	1	4
36	EMP-036	Juan	Mazzanti	33956107	1987-01-21	Tereré	1187			4456980	juanmazzanti@gmail.com	Empleado	2017-03-14 09:33:30.83007	2017-03-14 09:33:30.83007	1	1	1	1	2	\N	1	3
37	EMP-037	Karina	Fiorentino	38663849	1995-06-08	Castilla	8299	10	15	4444176	karinafiorentino@gmail.com	Empleado	2017-03-14 09:33:30.907932	2017-03-14 09:33:30.907932	1	1	1	1	1	\N	1	2
38	EMP-038	Osvaldo	Pagnotto	22019493	1970-02-20	Av. Andalucia	7415	12	A	4255987	osvaldopagnotto@gmail.com	Empleado	2017-03-14 09:33:30.985404	2017-03-14 09:33:30.985404	1	1	1	1	4	\N	1	7
39	EMP-039	Margarita	Giordano	36068886	1991-11-05	176	7141			4401604	margaritagiordano@gmail.com	Empleado	2017-03-14 09:33:31.084893	2017-03-14 09:33:31.084893	1	1	1	1	5	\N	1	8
40	EMP-040	Rosa	Napolitano	2576401	1974-05-06	Tereré	7302	4	B	4355987	rosanapolitano@gmail.com	Empleado	2017-03-14 09:33:31.162705	2017-03-14 09:33:31.162705	1	1	1	1	4	\N	1	7
41	EMP-041	Magdalena	Bruno	38817849	1995-06-08	Castilla	8299	10	15	4444176	mardalenabruno@gmail.com	Empleado	2017-03-14 09:33:31.250611	2017-03-14 09:33:31.250611	1	1	1	1	1	\N	1	2
42	EMP-042	Mauricio	Costa	22755493	1970-02-20	Av. Andalucia	7415	12	A	4255987	mauriciocosta@gmail.com	Empleado	2017-03-14 09:33:31.330458	2017-03-14 09:33:31.330458	1	1	1	1	4	\N	1	7
43	EMP-043	Ivan	Costas	36755076	1991-11-05	176	7141			4401604	ivancostas@gmail.com	Empleado	2017-03-14 09:33:31.408731	2017-03-14 09:33:31.408731	1	1	1	1	5	\N	1	8
44	EMP-044	Pablo	Davide	251934401	1974-05-06	Tereré	7302	4	B	4355987	pablodavide@gmail.com	Empleado	2017-03-14 09:33:31.496611	2017-03-14 09:33:31.496611	1	1	1	1	4	\N	1	7
45	EMP-045	Nicolas	Medina	33801927	1986-10-17	Rivera	6872			459885	nicolasmedina@gmail.com	Empleado	2017-03-14 09:33:31.585802	2017-03-14 09:33:31.585802	1	1	1	1	3	\N	1	4
46	EMP-046	Celeste	Milano	35122307	1987-01-21	Tereré	1187			4456980	celestemilano@gmail.com	Empleado	2017-03-14 09:33:31.665868	2017-03-14 09:33:31.665868	1	1	1	1	2	\N	1	3
47	EMP-047	Sebastian	Schiavone	38175649	1995-06-08	Castilla	8299	10	15	4444176	sebastianschiavone@gmail.com	Empleado	2017-03-14 09:33:31.751963	2017-03-14 09:33:31.751963	1	1	1	1	1	\N	1	2
48	EMP-048	Ruben	Almedina	22891493	1970-02-20	Av. Andalucia	7415	12	A	4255987	rubenalmedina@gmail.com	Empleado	2017-03-14 09:33:31.834136	2017-03-14 09:33:31.834136	1	1	1	1	4	\N	1	7
49	EMP-049	Cristian	Camiño	36093716	1991-11-05	176	7141			4401604	cristiancamiño@gmail.com	Empleado	2017-03-14 09:33:31.91927	2017-03-14 09:33:31.91927	1	1	1	1	5	\N	1	8
50	EMP-050	Monica	Conti	25888001	1974-05-06	Tereré	7302	4	B	4355987	monicaconti@gmail.com	Empleado	2017-03-14 09:33:32.006663	2017-03-14 09:33:32.006663	1	1	1	1	4	\N	1	7
51	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	2017-03-14 09:33:32.144372	2017-03-14 09:33:32.144372	1	1	2	2	\N	\N	1	\N
52	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	2017-03-14 09:33:32.232785	2017-03-14 09:33:32.232785	1	1	2	1	\N	\N	1	\N
53	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	2017-03-14 09:33:32.311668	2017-03-14 09:33:32.311668	1	1	2	1	\N	\N	1	\N
54	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	2017-03-14 09:33:32.44366	2017-03-14 09:33:32.44366	1	1	2	1	\N	\N	1	\N
55	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	2017-03-14 09:33:32.517463	2017-03-14 09:33:32.517463	1	1	2	1	\N	\N	1	\N
56	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	2017-03-14 09:33:32.60009	2017-03-14 09:33:32.60009	1	1	2	2	\N	\N	1	\N
57	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	2017-03-14 09:33:32.687243	2017-03-14 09:33:32.687243	1	1	2	1	\N	\N	1	\N
58	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	2017-03-14 09:33:32.766955	2017-03-14 09:33:32.766955	1	1	2	1	\N	\N	1	\N
59	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	2017-03-14 09:33:32.840879	2017-03-14 09:33:32.840879	1	1	2	1	\N	\N	1	\N
60	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	2017-03-14 09:33:32.919825	2017-03-14 09:33:32.919825	1	1	2	2	\N	\N	1	\N
61	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	2017-03-14 09:33:33.009534	2017-03-14 09:33:33.009534	1	1	2	1	\N	\N	1	\N
62	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	2017-03-14 09:33:33.084911	2017-03-14 09:33:33.084911	1	1	2	1	\N	\N	1	\N
63	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	2017-03-14 09:33:33.163263	2017-03-14 09:33:33.163263	1	1	2	1	\N	\N	1	\N
64	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	2017-03-14 09:33:33.241914	2017-03-14 09:33:33.241914	1	1	2	2	\N	\N	1	\N
65	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	2017-03-14 09:33:33.320353	2017-03-14 09:33:33.320353	1	1	2	1	\N	\N	1	\N
66	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	2017-03-14 09:33:33.397539	2017-03-14 09:33:33.397539	1	1	2	1	\N	\N	1	\N
67	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	2017-03-14 09:33:33.475272	2017-03-14 09:33:33.475272	1	1	2	1	\N	\N	1	\N
68	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	2017-03-14 09:33:33.563638	2017-03-14 09:33:33.563638	1	1	2	2	\N	\N	1	\N
69	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	2017-03-14 09:33:33.64733	2017-03-14 09:33:33.64733	1	1	2	1	\N	\N	1	\N
70	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	2017-03-14 09:33:33.734373	2017-03-14 09:33:33.734373	1	1	2	1	\N	\N	1	\N
71	ME-021	Lidia	Delucci	28088944	1981-01-29	Chile	6144			481898	lidiadelucci@gmail.com	MiembroEquipo	2017-03-14 09:33:33.819105	2017-03-14 09:33:33.819105	1	1	2	1	\N	\N	1	\N
72	ME-022	Leonor	Gomez Santos	40560231	1996-03-13	Plaza Mayor	2637			4536662	leonorgs@gmail.com	MiembroEquipo	2017-03-14 09:33:33.901663	2017-03-14 09:33:33.901663	1	1	2	1	\N	\N	1	\N
73	ME-023	Lara	Gonçalves	29075344	1980-07-19	España	1415			4498457	laragoncalves@gmail.com	MiembroEquipo	2017-03-14 09:33:33.984773	2017-03-14 09:33:33.984773	1	1	2	1	\N	\N	1	\N
74	ME-024	Martin	Diaz	26070390	1976-08-11	calle Nueva	1826			491088	martindiaz@gmail.com	MiembroEquipo	2017-03-14 09:33:34.065432	2017-03-14 09:33:34.065432	1	1	2	1	\N	\N	1	\N
75	ME-025	Marina	Diaz	26070394	1976-08-11	calle Nueva	1826			491088	marinadiaz@gmail.com	MiembroEquipo	2017-03-14 09:33:34.142231	2017-03-14 09:33:34.142231	1	1	2	1	\N	\N	1	\N
76	ME-026	Gerardo	Urbina	29234987	1980-05-31	Álamo	6162			455433	gerardou@gmail.com	MiembroEquipo	2017-03-14 09:33:34.231812	2017-03-14 09:33:34.231812	1	1	2	1	\N	\N	1	\N
77	ME-027	Silvio	Quiroz	35465922	1990-02-27	Álamo	2128			415176	silvioquiroz@gmail.com	MiembroEquipo	2017-03-14 09:33:34.311501	2017-03-14 09:33:34.311501	1	1	2	1	\N	\N	1	\N
78	ME-028	Gabriela	Garcia	33457976	1987-12-19	Alem	123			451912	lidiadelucci@gmail.com	MiembroEquipo	2017-03-14 09:33:34.386349	2017-03-14 09:33:34.386349	1	1	2	1	\N	\N	1	\N
79	ME-029	Leonardo	Rios	29524865	1981-11-30	Concepcion	5139			4590871	lidiadelucci@gmail.com	MiembroEquipo	2017-03-14 09:33:34.463101	2017-03-14 09:33:34.463101	1	1	2	1	\N	\N	1	\N
80	ME-030	Ubaldo	Gomez	34123456	1990-04-08	Entre Rios	1235			456798	ubaldogomez@gmail.com	MiembroEquipo	2017-03-14 09:33:34.546424	2017-03-14 09:33:34.546424	1	1	2	1	\N	\N	1	\N
81	ME-031	Silvio	Gonzalez	29092236	1980-05-16	Cordoba	7213			4501923	silviogonzalez@gmail.com	MiembroEquipo	2017-03-14 09:33:34.63093	2017-03-14 09:33:34.63093	1	1	2	1	\N	\N	1	\N
82	ME-032	Rosa	Fernandez	20112254	1968-09-13	San Martin	1028			4567895	rosafernandez@gmail.com	MiembroEquipo	2017-03-14 09:33:34.7578	2017-03-14 09:33:34.7578	1	1	2	1	\N	\N	1	\N
83	ME-033	Alejandro	Fernandez	20998871	1987-05-16	Santa Fe	4812			4311235	alefernandez@gmail.com	MiembroEquipo	2017-03-14 09:33:34.845324	2017-03-14 09:33:34.845324	1	1	2	1	\N	\N	1	\N
84	ME-034	Hugo	Rios	40034940	1998-11-30	Alvear	5028			481341	hugorios@gmail.com	MiembroEquipo	2017-03-14 09:33:34.932077	2017-03-14 09:33:34.932077	1	1	2	1	\N	\N	1	\N
85	ME-035	Mario	Garcia	24654447	1976-04-08	Roca	193			4212351	mariogarcia@gmail.com	MiembroEquipo	2017-03-14 09:33:35.018617	2017-03-14 09:33:35.018617	1	1	2	1	\N	\N	1	\N
86	ME-036	Marina	Moralez	36421952	1992-08-19	Ucrania	9371			451241	marimamoralez@gmail.com	MiembroEquipo	2017-03-14 09:33:35.10072	2017-03-14 09:33:35.10072	1	1	2	1	\N	\N	1	\N
87	ME-037	Silvina	Portillo	26498388	1976-06-05	Av Queirel	7621			431214	silvinaportillo@gmail.com	MiembroEquipo	2017-03-14 09:33:35.186457	2017-03-14 09:33:35.186457	1	1	2	1	\N	\N	1	\N
88	ME-038	Maria	Maciel	33428434	1989-09-04	Paraguay	600			4761602	mariamaciel@gmail.com	MiembroEquipo	2017-03-14 09:33:35.274256	2017-03-14 09:33:35.274256	1	1	2	1	\N	\N	1	\N
89	ME-039	Angeles	Granados	31452518	1981-04-09	Uruguay	12			481858	angelesgranados@gmail.com	MiembroEquipo	2017-03-14 09:33:35.35319	2017-03-14 09:33:35.35319	1	1	2	1	\N	\N	1	\N
90	ME-040	Cintia	Gutierrez	29701192	1992-11-05	Av Roca	464			483498	cintiagutierrez@gmail.com	MiembroEquipo	2017-03-14 09:33:35.431972	2017-03-14 09:33:35.431972	1	1	2	1	\N	\N	1	\N
91	ME-041	David	Sedillo	36371823	1975-07-23	Centenario	6135			481018	davidsedillo@gmail.com	MiembroEquipo	2017-03-14 09:33:35.510862	2017-03-14 09:33:35.510862	1	1	2	1	\N	\N	1	\N
92	ME-042	Sofia	Garcia	25370180	1998-01-13	Las Flores	1234			409498	sofiagarcia@gmail.com	MiembroEquipo	2017-03-14 09:33:35.587723	2017-03-14 09:33:35.587723	1	1	2	1	\N	\N	1	\N
93	ME-043	Alicia	Villalba	27455263	1979-04-17	Las Palmeras	9876			420184	alivillalba@gmail.com	MiembroEquipo	2017-03-14 09:33:35.67777	2017-03-14 09:33:35.67777	1	1	2	1	\N	\N	1	\N
94	ME-044	Luis	Gonzalez	36182911	1992-06-19	Las Orquideas	900			495712	luisgonzalez@gmail.com	MiembroEquipo	2017-03-14 09:33:35.764855	2017-03-14 09:33:35.764855	1	1	2	1	\N	\N	1	\N
95	ME-045	Ernesto	Da Luz	30346514	1983-06-19	Rosas	2463			413048	ernestodaluz@gmail.com	MiembroEquipo	2017-03-14 09:33:35.8426	2017-03-14 09:33:35.8426	1	1	2	1	\N	\N	1	\N
96	ME-046	Luciano	Garcia	39019733	1996-03-13	Colon	8123			412451	lucianogarcia@gmail.com	MiembroEquipo	2017-03-14 09:33:35.921062	2017-03-14 09:33:35.921062	1	1	2	1	\N	\N	1	\N
97	ME-047	Gerardo	Cano	29232117	1980-07-19	Escuelita	9173			462093	gerardocano@gmail.com	MiembroEquipo	2017-03-14 09:33:36.01376	2017-03-14 09:33:36.01376	1	1	2	1	\N	\N	1	\N
98	ME-048	Hector	Rincon	29222287	1980-05-31	Japon	2546			471927	hectorrincon@gmail.com	MiembroEquipo	2017-03-14 09:33:36.109025	2017-03-14 09:33:36.109025	1	1	2	1	\N	\N	1	\N
99	ME-049	Alberto	Gonzalez	35225922	1990-02-27	Colombia	2871			431570	albertogonzalez@gmail.com	MiembroEquipo	2017-03-14 09:33:36.187822	2017-03-14 09:33:36.187822	1	1	2	1	\N	\N	1	\N
100	ME-050	Roberto	Lujan	35461122	1990-05-27	Noruega	1980			401938	robertolujan@gmail.com	MiembroEquipo	2017-03-14 09:33:36.275666	2017-03-14 09:33:36.275666	1	1	2	1	\N	\N	1	\N
101	CO-001	María Rosa	Conti	25644132	1975-07-03	Ituzaingo	245	12	B	424568	mrconti@gmail.com	Contacto	2017-03-14 09:34:03.586174	2017-03-14 09:34:03.586174	1	1	1	1	\N	1	1	\N
102	CO-002	Berta	Rivera	33958772	1989-04-11	Leandro Gomez	5886	\N	\N	4598765	brivera@gmail.com	Contacto	2017-03-14 09:34:03.687627	2017-03-14 09:34:03.687627	1	1	1	1	\N	2	1	\N
103	CO-003	Juliana	Castiglione	30444512	1980-12-09	Brisas	3280	5	15	555321	jcastiglione@gmail.com	Contacto	2017-03-14 09:34:03.828201	2017-03-14 09:34:03.828201	1	1	1	1	\N	3	1	\N
104	CO-004	Nahuel	Estevez	19423568	1966-11-28	Av. Alta Gracia	5332	12	B	154632108	mrconti@gmail.com	Contacto	2017-03-14 09:34:03.919263	2017-03-14 09:34:03.919263	1	1	1	1	\N	4	1	\N
105	CO-005	Pablo	Gomez	25221305	1970-03-05	Neruda	7393	12	B	154245689	mrconti@gmail.com	Contacto	2017-03-14 09:34:04.006472	2017-03-14 09:34:04.006472	1	1	1	1	\N	5	1	\N
106	CO-006	Abigaíl	Coronado	37926793	1994-03-21	F. Varela	5659	12	B	432666	mrconti@gmail.com	Contacto	2017-03-14 09:34:04.097488	2017-03-14 09:34:04.097488	1	1	1	1	\N	6	1	\N
107	CO-007	Hilda	Zielinski	25334991	1970-04-07	Joaquin Suarez	6863	12	B	4478909	mrconti@gmail.com	Contacto	2017-03-14 09:34:04.192897	2017-03-14 09:34:04.192897	1	1	1	1	\N	7	1	\N
\.


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
1	2017-03-14 09:34:04.517643	2017-03-14 09:34:04.517643	1	27
2	2017-03-14 09:34:04.544681	2017-03-14 09:34:04.544681	2	28
3	2017-03-14 09:34:04.567861	2017-03-14 09:34:04.567861	2	29
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
1	2017-03-14 09:33:39.025274	2017-03-14 09:33:39.025274	1	51
2	2017-03-14 09:33:39.055077	2017-03-14 09:33:39.055077	1	2
3	2017-03-14 09:33:39.076139	2017-03-14 09:33:39.076139	2	2
4	2017-03-14 09:33:39.099124	2017-03-14 09:33:39.099124	2	52
5	2017-03-14 09:33:39.12146	2017-03-14 09:33:39.12146	2	53
6	2017-03-14 09:33:39.143723	2017-03-14 09:33:39.143723	3	6
7	2017-03-14 09:33:39.164613	2017-03-14 09:33:39.164613	3	54
8	2017-03-14 09:33:39.187062	2017-03-14 09:33:39.187062	3	55
9	2017-03-14 09:33:39.21058	2017-03-14 09:33:39.21058	4	6
10	2017-03-14 09:33:39.232031	2017-03-14 09:33:39.232031	4	56
11	2017-03-14 09:33:39.255124	2017-03-14 09:33:39.255124	4	57
12	2017-03-14 09:33:39.27633	2017-03-14 09:33:39.27633	5	2
13	2017-03-14 09:33:39.299334	2017-03-14 09:33:39.299334	5	58
14	2017-03-14 09:33:39.320938	2017-03-14 09:33:39.320938	5	59
15	2017-03-14 09:33:39.342737	2017-03-14 09:33:39.342737	6	2
16	2017-03-14 09:33:39.366071	2017-03-14 09:33:39.366071	6	60
17	2017-03-14 09:33:39.388264	2017-03-14 09:33:39.388264	6	61
18	2017-03-14 09:33:39.410417	2017-03-14 09:33:39.410417	6	62
19	2017-03-14 09:33:39.432399	2017-03-14 09:33:39.432399	7	6
20	2017-03-14 09:33:39.454974	2017-03-14 09:33:39.454974	7	63
21	2017-03-14 09:33:39.475854	2017-03-14 09:33:39.475854	7	64
22	2017-03-14 09:33:39.499342	2017-03-14 09:33:39.499342	8	2
23	2017-03-14 09:33:39.521005	2017-03-14 09:33:39.521005	8	65
24	2017-03-14 09:33:39.544135	2017-03-14 09:33:39.544135	9	6
25	2017-03-14 09:33:39.565268	2017-03-14 09:33:39.565268	9	66
26	2017-03-14 09:33:39.588311	2017-03-14 09:33:39.588311	9	67
27	2017-03-14 09:33:39.60993	2017-03-14 09:33:39.60993	10	2
28	2017-03-14 09:33:39.632762	2017-03-14 09:33:39.632762	10	68
29	2017-03-14 09:33:39.654784	2017-03-14 09:33:39.654784	10	69
30	2017-03-14 09:33:39.677096	2017-03-14 09:33:39.677096	10	70
31	2017-03-14 09:33:39.69958	2017-03-14 09:33:39.69958	11	71
32	2017-03-14 09:33:39.72101	2017-03-14 09:33:39.72101	11	72
33	2017-03-14 09:33:39.742747	2017-03-14 09:33:39.742747	11	8
34	2017-03-14 09:33:39.766244	2017-03-14 09:33:39.766244	12	57
35	2017-03-14 09:33:39.787486	2017-03-14 09:33:39.787486	12	65
36	2017-03-14 09:33:39.810239	2017-03-14 09:33:39.810239	12	6
37	2017-03-14 09:33:39.832759	2017-03-14 09:33:39.832759	13	96
38	2017-03-14 09:33:39.855206	2017-03-14 09:33:39.855206	13	99
39	2017-03-14 09:33:39.876147	2017-03-14 09:33:39.876147	13	8
40	2017-03-14 09:33:39.900094	2017-03-14 09:33:39.900094	14	80
41	2017-03-14 09:33:39.920609	2017-03-14 09:33:39.920609	14	100
42	2017-03-14 09:33:39.942715	2017-03-14 09:33:39.942715	14	12
43	2017-03-14 09:33:39.966154	2017-03-14 09:33:39.966154	15	89
44	2017-03-14 09:33:39.988338	2017-03-14 09:33:39.988338	15	90
45	2017-03-14 09:33:40.009836	2017-03-14 09:33:40.009836	15	92
46	2017-03-14 09:33:40.032995	2017-03-14 09:33:40.032995	15	8
47	2017-03-14 09:33:40.054935	2017-03-14 09:33:40.054935	16	65
48	2017-03-14 09:33:40.076588	2017-03-14 09:33:40.076588	16	67
49	2017-03-14 09:33:40.099888	2017-03-14 09:33:40.099888	16	77
50	2017-03-14 09:33:40.120715	2017-03-14 09:33:40.120715	16	6
51	2017-03-14 09:33:40.144123	2017-03-14 09:33:40.144123	17	96
52	2017-03-14 09:33:40.165885	2017-03-14 09:33:40.165885	17	97
53	2017-03-14 09:33:40.187285	2017-03-14 09:33:40.187285	17	2
54	2017-03-14 09:33:40.210471	2017-03-14 09:33:40.210471	18	75
55	2017-03-14 09:33:40.233025	2017-03-14 09:33:40.233025	18	76
56	2017-03-14 09:33:40.255011	2017-03-14 09:33:40.255011	18	77
57	2017-03-14 09:33:40.276647	2017-03-14 09:33:40.276647	18	14
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 57, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-03-14 09:33:26.366165	2017-03-14 09:33:26.366165	1
2	Corrientes	2017-03-14 09:33:26.390093	2017-03-14 09:33:26.390093	1
3	Itapúa	2017-03-14 09:33:26.41173	2017-03-14 09:33:26.41173	2
4	Bahia	2017-03-14 09:33:26.433491	2017-03-14 09:33:26.433491	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-03-14 09:33:37.573356	2017-03-14 09:33:37.573356	1	1	1	1	1
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-03-14 09:33:37.662777	2017-03-14 09:33:37.662777	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-03-14 09:33:37.738371	2017-03-14 09:33:37.738371	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-03-14 09:33:37.818269	2017-03-14 09:33:37.818269	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-03-14 09:33:37.899506	2017-03-14 09:33:37.899506	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-03-14 09:33:38.04165	2017-03-14 09:33:38.04165	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-03-14 09:33:38.118233	2017-03-14 09:33:38.118233	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-03-14 09:33:38.192648	2017-03-14 09:33:38.192648	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-03-14 09:33:38.260009	2017-03-14 09:33:38.260009	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-03-14 09:33:38.3285	2017-03-14 09:33:38.3285	1	1	1	1	1
11	PR-011	Percentil	Tienda online de ropa casi nueva en Misiones. Se han convertido en líderes en varias ciudades de la provincia. Han diseñado la tecnología y unos procesos para hacerlo en escala y poder ganar dinero con ello.	España	422			4590432	percentil@gmail.com	percentil.com	2017-03-14 09:33:38.406981	2017-03-14 09:33:38.406981	1	1	1	1	1
12	PR-012	EmbryoTools	 Son una referencia mundial en reproducción asistida. Trabajan en cuatro ámbitos diferentes. Una de sus líneas de trabajo es la formación de embriólogos, porque las técnicas de reproducción asistida son muy delicadas, se necesita bastante práctica y no se puede adquirir con embriones humanos. Otra línea en la que trabajan es en la consultoría a clínicas y fabricantes de productos para clínicas de reproducción asistida. Ofrecen también un servicio para controlar la toxicidad de los lotes de los productos que vayan a entrar en contacto con embriones humanos y por último trabajan en la reproducción asistida en veterinaria.	Mariano Moreno	4122			465888	embryotools@gmail.com	embryotools.com	2017-03-14 09:33:38.485417	2017-03-14 09:33:38.485417	1	1	1	1	1
13	PR-013	Aplázame	 Es un método de pago que se integra en el proceso de compra del comercio electrónico y permite a los clientes de las tiendas online comprar con un crédito instantáneo. Para conseguirlo convencieron a las tiendas para que integraran su método. Ya ofrecen sus créditos en 30 tiendas online, y tienen otras 70 esperando para hacerlo en breve.	Av. San Martin	4532			453222	aplazame@gmail.com	aplazame.com	2017-03-14 09:33:38.562563	2017-03-14 09:33:38.562563	1	1	1	1	1
14	PR-014	BrioAgro Technologies	Deesarrollo de una tecnología para que el agricultor controle su explotación. El dispositivo recoge toda la información sensible y la manda a la nube, y el agricultor, a través de su dispositivo, se conecta a la nube para acceder a la información de su invernadero. Se recoge todo a tiempo real, lo que permite controlar cualquier cambio en sus variables.	Colon 	555			4651244	bioagro@gmail.com	bioagro.com	2017-03-14 09:33:38.637829	2017-03-14 09:33:38.637829	1	1	1	1	1
15	PR-015	Braingaze	La tecnología desarrollada detecta un pequeño movimiento ocular que permite determinar si el paciente sufre Trastorno por Déficit de Atención e Hiperactividad (TDAH). Dentro del campo del diagnóstico, están trabajando también con autismo y dislexia.	Miami	708			490123	baringaze@gmail.com	braingaze.com	2017-03-14 09:33:38.705499	2017-03-14 09:33:38.705499	1	1	1	1	1
16	PR-016	CreatorStats	Mejoran la métrica de los ‘youtubers’.	Inglaterra	200			15432510	creatorstats@gmail.com	creatorstats.com	2017-03-14 09:33:38.782214	2017-03-14 09:33:38.782214	1	1	1	1	1
17	PR-017	Alzhup	Se centran en el problema de cómo convivir con el Alzheimer y cómo  dotar de mayor calidad de vida a los pacientes y su entorno. AlzhUp utiliza la tecnología como vehículo para que la solución sea accesible a todo el mundo. Implementan a nivel digital herramientas basadas en terapias no farmacológicas, que han demostrado ser efectivas y capaces de retardar el deterioro cognitivo con resultados validados científicamente. Y también, herramientas para la memoria, capaces de personalizar dichas terapias y que se basan en la catalogación de recuerdos gracias a un algoritmo mnemotécnico, en estudio de patente, que simula la forma real en la que el cerebro almacena los recuerdos y que difiere de los sistemas actuales computarizados.	Constitucion	2222			467632	alzhup@gmail.com	alzhup.com	2017-03-14 09:33:38.849962	2017-03-14 09:33:38.849962	1	1	1	1	1
18	PR-018	Axter Aerospace	Están desarrollando un sistema de propulsión híbrida para las avionetas, que hace que continúen volando en caso de fallo del motor. Tras dos años de intenso trabajo, han finalizado el desarrollo de la propulsión eléctrica y su integración con ese tipo de aviones. El sistema sirve para cualquier tipo de avioneta. El producto se vende en un kit para que el propio piloto lo monte, algo muy habitual en EE UU. De momento, fabrican ellos, y si aumenta la demanda, crearán una planta de producción y ensamblado.	Ayacucho	9200			432111	axteraerospace@gmail.com	axteraerospace.com	2017-03-14 09:33:38.929274	2017-03-14 09:33:38.929274	1	1	1	1	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 18, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-03-14 09:33:44.58455	2017-03-14 09:33:44.58455
2	super_admin	2017-03-14 09:33:44.610973	2017-03-14 09:33:44.610973
3	Encargado de Proyectos (mentor)	2017-03-14 09:33:44.632792	2017-03-14 09:33:44.632792
4	Miembro de Equipo	2017-03-14 09:33:44.656301	2017-03-14 09:33:44.656301
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-03-14 09:33:27.235585	2017-03-14 09:33:27.235585	1
2	Encargado de recaudaciones e ingresos	2017-03-14 09:33:27.299519	2017-03-14 09:33:27.299519	1
3	Jefe de Recursos Humanos	2017-03-14 09:33:27.356308	2017-03-14 09:33:27.356308	2
4	Jefe de mercadeo	2017-03-14 09:33:27.413504	2017-03-14 09:33:27.413504	3
5	jefe de producción	2017-03-14 09:33:27.466099	2017-03-14 09:33:27.466099	3
6	Investigación y desarrollo	2017-03-14 09:33:27.523146	2017-03-14 09:33:27.523146	4
7	Capacitación - Mentoring	2017-03-14 09:33:27.599617	2017-03-14 09:33:27.599617	4
8	Director General	2017-03-14 09:33:27.644298	2017-03-14 09:33:27.644298	5
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
1	5	minutes	4	2017-03-14 09:33:52.979174	2017-03-14 09:33:52.979174
\.


--
-- Name: systemsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('systemsettings_id_seq', 1, true);


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipo_documentos (id, nombre, created_at, updated_at) FROM stdin;
1	DNI	2017-03-14 09:33:26.76458	2017-03-14 09:33:26.76458
2	Libreta de Enrolamiento	2017-03-14 09:33:26.788029	2017-03-14 09:33:26.788029
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
1	Efectivo	2017-03-14 09:33:52.712152	2017-03-14 09:33:52.712152
2	Tarjeta de crédito Visa	2017-03-14 09:33:52.776626	2017-03-14 09:33:52.776626
3	Tarjeta Naranja	2017-03-14 09:33:52.839892	2017-03-14 09:33:52.839892
4	Saldo de cuenta	2017-03-14 09:33:52.896813	2017-03-14 09:33:52.896813
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	0	\N	\N	\N	\N	2017-03-14 09:33:45.40218	2017-03-14 09:33:45.40218	1	2
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-03-14 09:33:45.657084	2017-03-14 09:33:45.657084	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-03-14 09:33:45.91181	2017-03-14 09:33:45.91181	2	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-03-14 09:33:53.922086	2017-03-14 09:33:53.922086	1	1
2	2017-01-20	2017-03-14 09:33:53.94908	2017-03-14 09:33:53.94908	1	1
3	2017-02-10	2017-03-14 09:33:53.971824	2017-03-14 09:33:53.971824	2	1
4	2017-02-20	2017-03-14 09:33:53.990925	2017-03-14 09:33:53.990925	2	1
5	2017-03-10	2017-03-14 09:33:54.013542	2017-03-14 09:33:54.013542	3	1
6	2017-03-20	2017-03-14 09:33:54.037677	2017-03-14 09:33:54.037677	3	1
7	2017-04-10	2017-03-14 09:33:54.058989	2017-03-14 09:33:54.058989	4	1
8	2017-04-20	2017-03-14 09:33:54.080561	2017-03-14 09:33:54.080561	4	1
9	2017-05-10	2017-03-14 09:33:54.10385	2017-03-14 09:33:54.10385	5	1
10	2017-05-20	2017-03-14 09:33:54.125581	2017-03-14 09:33:54.125581	5	1
11	2017-06-10	2017-03-14 09:33:54.147231	2017-03-14 09:33:54.147231	6	1
12	2017-06-20	2017-03-14 09:33:54.170018	2017-03-14 09:33:54.170018	6	1
13	2017-07-10	2017-03-14 09:33:54.191113	2017-03-14 09:33:54.191113	7	1
14	2017-07-20	2017-03-14 09:33:54.214403	2017-03-14 09:33:54.214403	7	1
15	2017-08-10	2017-03-14 09:33:54.235993	2017-03-14 09:33:54.235993	8	1
16	2017-08-20	2017-03-14 09:33:54.259094	2017-03-14 09:33:54.259094	8	1
17	2017-09-10	2017-03-14 09:33:54.282147	2017-03-14 09:33:54.282147	9	1
18	2017-09-20	2017-03-14 09:33:54.303588	2017-03-14 09:33:54.303588	9	1
19	2017-10-10	2017-03-14 09:33:54.324919	2017-03-14 09:33:54.324919	10	1
20	2017-10-20	2017-03-14 09:33:54.347242	2017-03-14 09:33:54.347242	10	1
21	2017-11-10	2017-03-14 09:33:54.369977	2017-03-14 09:33:54.369977	11	1
22	2017-11-20	2017-03-14 09:33:54.39132	2017-03-14 09:33:54.39132	11	1
23	2017-12-10	2017-03-14 09:33:54.416058	2017-03-14 09:33:54.416058	12	1
24	2017-12-20	2017-03-14 09:33:54.438586	2017-03-14 09:33:54.438586	12	1
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

