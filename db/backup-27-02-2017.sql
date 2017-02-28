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
1	Crear	create	2017-02-27 13:54:33.724688	2017-02-27 13:54:33.724688
2	Eliminar	destroy	2017-02-27 13:54:33.753069	2017-02-27 13:54:33.753069
3	Ver	show	2017-02-27 13:54:33.775698	2017-02-27 13:54:33.775698
4	Restringir acciones de acuerdo al tipo de persona	by_persona_type	2017-02-27 13:54:33.811787	2017-02-27 13:54:33.811787
5	Index	index	2017-02-27 13:54:33.843899	2017-02-27 13:54:33.843899
6	Editar	update	2017-02-27 13:54:33.878767	2017-02-27 13:54:33.878767
7	Estadisticas	estadistica	2017-02-27 13:54:33.909185	2017-02-27 13:54:33.909185
\.


--
-- Name: acciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('acciones_id_seq', 7, true);


--
-- Data for Name: actividades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades (id, nombre, descripcion, obligatorio, actividades_antecedentes, created_at, updated_at, etapa_id) FROM stdin;
1	Presentación de la idea	Nombre de la idea de emprendimiento y breve descripción	t	--- []\n	2017-02-27 13:54:29.540402	2017-02-27 13:54:29.540402	1
2	Análisis de factibilidad	Analisis de la factibilidad del emprendimiento es sus tres factores: económico, técnico y operativo	t	---\n- '1'\n	2017-02-27 13:54:29.641736	2017-02-27 13:54:29.641736	1
3	Evaluación	Los expertos de la incubadora evaluarán el proyecto presentado en base a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la siguiente etapa	t	---\n- '1'\n- '2'\n	2017-02-27 13:54:29.760466	2017-02-27 13:54:29.760466	1
4	Definicion del producto	El proyecto define en detalle cual será su actividad economica principal, qué y cómo es ese producto o servicio que desea comercializar	t	\N	2017-02-27 13:54:29.827041	2017-02-27 13:54:29.827041	2
5	Misión, Visión, Objetivos	Definicion de misión, visión, y objetivos generales y particulares del emprendimiento	f	---\n- '4'\n	2017-02-27 13:54:29.901608	2017-02-27 13:54:29.901608	2
6	Mercado - Clientes principales	Definicion del nicho de mercado	t	---\n- '4'\n	2017-02-27 13:54:29.966177	2017-02-27 13:54:29.966177	2
7	Búsqueda de financiamiento	Ponerse en contacto con personas que ayudarán al crecimiento del proyecto	f	\N	2017-02-27 13:54:30.029674	2017-02-27 13:54:30.029674	2
8	Asistencia a Conferencias	Cada emprendimiento debe asistir a por lo menos un evento que organice la empresa	t	\N	2017-02-27 13:54:30.082221	2017-02-27 13:54:30.082221	2
9	Seguimiento	Empresa en etapa de post incubacion	t	\N	2017-02-27 13:54:30.141473	2017-02-27 13:54:30.141473	3
10	Desarrollo de evento o conferencia	Los proyectos que lleguen a esta etapa deben dar charlas u organizar eventos para los nuevos emprendimientos en incubación	t	---\n- '9'\n	2017-02-27 13:54:30.202713	2017-02-27 13:54:30.202713	3
11	Financiamiento a un nuevo proyecto	Los proyectos que lleguen a esta etapa deben de poder financiar a otros emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento	t	---\n- '9'\n- '10'\n	2017-02-27 13:54:30.281485	2017-02-27 13:54:30.281485	3
\.


--
-- Name: actividades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_id_seq', 11, true);


--
-- Data for Name: actividades_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY actividades_proyectos (id, "fechaVencimiento", created_at, updated_at, proyecto_id, actividad_id, estado_id) FROM stdin;
2	\N	2017-02-27 13:54:32.102988	2017-02-27 13:54:32.102988	1	2	\N
4	\N	2017-02-27 13:54:32.214187	2017-02-27 13:54:32.214187	2	1	\N
5	\N	2017-02-27 13:54:32.269506	2017-02-27 13:54:32.269506	2	2	\N
6	\N	2017-02-27 13:54:32.323966	2017-02-27 13:54:32.323966	2	3	\N
7	\N	2017-02-27 13:54:32.379691	2017-02-27 13:54:32.379691	3	1	\N
8	\N	2017-02-27 13:54:32.434957	2017-02-27 13:54:32.434957	3	2	\N
9	\N	2017-02-27 13:54:32.479688	2017-02-27 13:54:32.479688	3	3	\N
10	\N	2017-02-27 13:54:32.53553	2017-02-27 13:54:32.53553	4	1	\N
11	\N	2017-02-27 13:54:32.592067	2017-02-27 13:54:32.592067	4	2	\N
12	\N	2017-02-27 13:54:32.646289	2017-02-27 13:54:32.646289	4	3	\N
13	\N	2017-02-27 13:54:32.703142	2017-02-27 13:54:32.703142	5	1	\N
14	\N	2017-02-27 13:54:32.759035	2017-02-27 13:54:32.759035	5	2	\N
15	\N	2017-02-27 13:54:32.814457	2017-02-27 13:54:32.814457	5	3	\N
16	\N	2017-02-27 13:54:32.869136	2017-02-27 13:54:32.869136	6	1	\N
17	\N	2017-02-27 13:54:32.913212	2017-02-27 13:54:32.913212	6	2	\N
18	\N	2017-02-27 13:54:32.956706	2017-02-27 13:54:32.956706	6	3	\N
19	\N	2017-02-27 13:54:33.003058	2017-02-27 13:54:33.003058	7	1	\N
20	\N	2017-02-27 13:54:33.058742	2017-02-27 13:54:33.058742	7	2	\N
21	\N	2017-02-27 13:54:33.114648	2017-02-27 13:54:33.114648	7	3	\N
22	\N	2017-02-27 13:54:33.168143	2017-02-27 13:54:33.168143	8	1	\N
23	\N	2017-02-27 13:54:33.213006	2017-02-27 13:54:33.213006	8	2	\N
24	\N	2017-02-27 13:54:33.257462	2017-02-27 13:54:33.257462	8	3	\N
25	\N	2017-02-27 13:54:33.346331	2017-02-27 13:54:33.346331	9	1	\N
26	\N	2017-02-27 13:54:33.402199	2017-02-27 13:54:33.402199	9	2	\N
27	\N	2017-02-27 13:54:33.447189	2017-02-27 13:54:33.447189	9	3	\N
28	\N	2017-02-27 13:54:33.503225	2017-02-27 13:54:33.503225	10	1	\N
29	\N	2017-02-27 13:54:33.559109	2017-02-27 13:54:33.559109	10	2	\N
30	\N	2017-02-27 13:54:33.613007	2017-02-27 13:54:33.613007	10	3	\N
1	\N	2017-02-27 13:54:32.012715	2017-02-27 17:48:03.963521	1	1	3
3	2017-02-25	2017-02-27 13:54:32.158985	2017-02-27 17:48:40.653418	1	3	1
\.


--
-- Name: actividades_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('actividades_proyectos_id_seq', 30, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY areas (id, nombre, created_at, updated_at) FROM stdin;
1	Urbana	2017-02-27 13:54:25.620183	2017-02-27 13:54:25.620183
2	Rural	2017-02-27 13:54:25.649168	2017-02-27 13:54:25.649168
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('areas_id_seq', 2, true);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY audits (id, auditable_id, auditable_type, associated_id, associated_type, user_id, user_type, username, action, audited_changes, version, comment, remote_address, request_uuid, created_at) FROM stdin;
182	1	Evento	\N	\N	1	User	\N	create	---\ncodigo: EV-001\nnombre: Charla de Marketing\ndescripcion: una charla de marketing\ndia: 2017-03-03\nhora: 2017-02-27 08:00:00.000000000 -03:00\npersona_id: \n	1	\N	127.0.0.1	4a53d0da-72c5-4ab0-9fa8-96ee0de0283d	2017-02-27 13:57:53.15879
183	2	Evento	\N	\N	1	User	\N	create	---\ncodigo: EV-002\nnombre: Reunion con diseñadores web\ndescripcion: "-"\ndia: 2017-03-04\nhora: 2017-02-27 09:00:00.000000000 -03:00\npersona_id: \n	1	\N	127.0.0.1	cf9eebe2-3365-47e2-a99f-03f153e3e915	2017-02-27 17:20:12.935587
184	1	ActividadProyecto	\N	\N	1	User	\N	update	---\nestado_id:\n- \n- 3\n	2	\N	127.0.0.1	1b768f76-8f1b-45b2-a212-b3a7dd5026c8	2017-02-27 17:48:03.985858
185	3	ActividadProyecto	\N	\N	1	User	\N	update	---\nfechaVencimiento:\n- \n- 2017-02-25\nestado_id:\n- \n- 1\n	2	\N	127.0.0.1	799b0086-c1a9-43de-9d93-7f3f499942ce	2017-02-27 17:48:40.669021
1	1	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Finanzas\n	1	\N	\N	3790c635-62f8-46ab-9bf5-a059d54ce5f3	2017-02-27 13:54:25.876679
2	2	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Recursos Humanos\n	1	\N	\N	dd66aee8-e2cd-45cf-a2e5-5543e07c8e30	2017-02-27 13:54:25.97507
3	3	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\n	1	\N	\N	6dd4bf42-4951-46e8-9a79-4c7f2371f9d3	2017-02-27 13:54:26.02624
4	4	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Logística\n	1	\N	\N	566c3404-27fc-4ed1-88dd-87e035f8f862	2017-02-27 13:54:26.087486
5	5	Departamento	\N	\N	1	\N	\N	create	---\nnombre: Dirección\n	1	\N	\N	1d000f6c-67ce-4e75-bdd5-53e6bbbac5bb	2017-02-27 13:54:26.131368
6	1	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de nómina\ndepartamento_id: 1\n	1	\N	\N	bd2cdd47-a661-4bad-b792-61d218efd5f9	2017-02-27 13:54:26.237929
7	2	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Encargado de recaudaciones e ingresos\ndepartamento_id: 1\n	1	\N	\N	d7fb2525-d404-47d6-90c1-28f3aadea876	2017-02-27 13:54:26.324068
8	3	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de Recursos Humanos\ndepartamento_id: 2\n	1	\N	\N	41f70803-b3c9-497d-ba3a-9d8702df5fa8	2017-02-27 13:54:26.379352
9	4	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Jefe de mercadeo\ndepartamento_id: 3\n	1	\N	\N	fddcd4a9-b026-4bd8-901e-6152c8b1c725	2017-02-27 13:54:26.432061
10	5	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: jefe de producción\ndepartamento_id: 3\n	1	\N	\N	1fb0c2f7-e823-497c-8b25-01658a5d007d	2017-02-27 13:54:26.489202
11	6	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Investigación y desarrollo\ndepartamento_id: 4\n	1	\N	\N	7c5c7142-926c-4886-b528-3a4b3ba2c92e	2017-02-27 13:54:26.547285
12	7	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Capacitación - Mentoring\ndepartamento_id: 4\n	1	\N	\N	c9e71981-9925-4fc0-9675-4df736fd766d	2017-02-27 13:54:26.600887
13	8	RolDeEmpleado	\N	\N	1	\N	\N	create	---\nnombre: Director General\ndepartamento_id: 5\n	1	\N	\N	67e4fc62-6c5a-48ac-9cbf-2f2860266fda	2017-02-27 13:54:26.65731
14	1	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-001\nnombre: Ana\napellido: Canteros\nnroIdentificacion: '36063076'\nfechaNacimiento: 1991-11-05\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4401604'\nemail: valeriianaa@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 5\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 8\n	1	\N	\N	bc2a604e-737a-4993-a6d2-fe47564f1318	2017-02-27 13:54:26.932783
51	1	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-001\nnombre: Pro Care, Jardines\ndescripcion: Mantenimiento de jardines\ncalle: '176'\nnroDomicilio: '7141'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: danischneider@gmail.com\npagWeb: ''\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	53d5c52c-f8b5-40cd-be1e-7233e09e37cd	2017-02-27 13:54:30.515112
15	2	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-002\nnombre: Martina\napellido: Quiñones\nnroIdentificacion: '25147001'\nfechaNacimiento: 1974-05-06\ncalle: Tereré\nnroDomicilio: '7302'\npiso: '4'\ndpto: B\ntelefono: '4355987'\nemail: martinaquinones@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 7\n	1	\N	\N	d4844bc6-4540-47d3-b5d4-9948b4440720	2017-02-27 13:54:27.042995
16	3	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-003\nnombre: Alba\napellido: Perez\nnroIdentificacion: '33880657'\nfechaNacimiento: 1986-10-17\ncalle: Rivera\nnroDomicilio: '6872'\npiso: ''\ndpto: ''\ntelefono: '459885'\nemail: albaperez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 3\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 4\n	1	\N	\N	e12ea0e3-c8d2-404b-a5ec-5fe76b507b3c	2017-02-27 13:54:27.172817
17	4	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-004\nnombre: Victor\napellido: Vazquez Valdez\nnroIdentificacion: '33988307'\nfechaNacimiento: 1987-01-21\ncalle: Tereré\nnroDomicilio: '1187'\npiso: ''\ndpto: ''\ntelefono: '4456980'\nemail: vvv@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 2\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 3\n	1	\N	\N	0ed4282c-c4fa-4ec3-a9fe-5ca9a0ada686	2017-02-27 13:54:27.283971
18	5	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-005\nnombre: Zoe\napellido: Cyr\nnroIdentificacion: '38187849'\nfechaNacimiento: 1995-06-08\ncalle: Castilla\nnroDomicilio: '8299'\npiso: '10'\ndpto: '15'\ntelefono: '4444176'\nemail: zoecyr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 1\nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: 2\n	1	\N	\N	2dca0a49-044f-46d8-afef-93cd26a882c0	2017-02-27 13:54:27.408614
19	6	Persona	\N	\N	1	\N	\N	create	---\ncodigo: EMP-006\nnombre: Luis\napellido: Castro\nnroIdentificacion: '22617493'\nfechaNacimiento: 1970-02-20\ncalle: Av. Andalucia\nnroDomicilio: '7415'\npiso: '12'\ndpto: A\ntelefono: '4255987'\nemail: luiscastro@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: 4\nespecialidad_de_contacto_id: \narea_id: \nrol_de_empleado_id: 7\n	1	\N	\N	8cbc0b4a-8631-4065-9843-87b43383559b	2017-02-27 13:54:27.518343
20	7	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-001\nnombre: Daniela\napellido: Schneider\nnroIdentificacion: '33976521'\nfechaNacimiento: 1987-12-19\ncalle: Av. Sarmiento\nnroDomicilio: '8076'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: danischneider@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4d822e28-3b08-4deb-a341-63ad21bbc781	2017-02-27 13:54:27.666681
21	8	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-002\nnombre: Ines\napellido: Osterhagen\nnroIdentificacion: '29717765'\nfechaNacimiento: 1981-11-30\ncalle: Belgrano\nnroDomicilio: '4827'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: inesosterhagen@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	b3ae6265-577c-4f63-9605-36eafde50995	2017-02-27 13:54:27.765959
22	9	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-003\nnombre: Miguel\napellido: Jablonski\nnroIdentificacion: '34029649'\nfechaNacimiento: 1990-04-08\ncalle: Los Llanos\nnroDomicilio: '9026'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: migueljablonski@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	efc268d4-efec-423e-a9f8-d76b3b92ff8a	2017-02-27 13:54:27.843402
23	10	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-004\nnombre: Ernesto\napellido: Barrios Rincón\nnroIdentificacion: '29441422'\nfechaNacimiento: 1980-05-16\ncalle: Av. Ucrania\nnroDomicilio: '5206'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: ernestobr@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	075b7b67-cb9d-49ad-9e88-85e46e3bb46d	2017-02-27 13:54:27.920267
24	11	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-005\nnombre: Evelyn\napellido: Matos\nnroIdentificacion: '20467791'\nfechaNacimiento: 1968-09-13\ncalle: Paseo\nnroDomicilio: '6118'\npiso: ''\ndpto: ''\ntelefono: '423649'\nemail: evelynmatos@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cef314c4-b986-4cb3-ae67-192003e7a5ba	2017-02-27 13:54:28.001848
25	12	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-006\nnombre: David\napellido: Molina\nnroIdentificacion: '20315192'\nfechaNacimiento: 1987-05-16\ncalle: Alemania\nnroDomicilio: '4650'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: davidmolina@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	0106ec43-5460-40de-b83e-d0cd50f079fa	2017-02-27 13:54:28.08616
65	5	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 2\nestado_id: \n	1	\N	\N	7383b8b9-60a9-4ade-8f0c-2f5c6fc36e05	2017-02-27 13:54:32.287956
26	13	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-007\nnombre: Gabriela\napellido: Garcia\nnroIdentificacion: '40044940'\nfechaNacimiento: 1998-11-30\ncalle: San Martín\nnroDomicilio: '1716'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: gabigarcia@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	219bc205-aeea-49d1-bcbe-073e8cea1f25	2017-02-27 13:54:28.178583
27	14	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-008\nnombre: Paola\napellido: Serrano\nnroIdentificacion: '24603447'\nfechaNacimiento: 1976-04-08\ncalle: Colon\nnroDomicilio: '2999'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: paolaserrano@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	cee77a44-9531-40c0-838b-33e245c0e862	2017-02-27 13:54:28.265734
28	15	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-009\nnombre: Benito\napellido: Granados\nnroIdentificacion: '36407952'\nfechaNacimiento: 1992-08-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: benitogranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	9a2f42be-4c26-4bca-ad88-7047ca237d1b	2017-02-27 13:54:28.341921
29	16	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-010\nnombre: Mirtha\napellido: Benavidez\nnroIdentificacion: '26435388'\nfechaNacimiento: 1976-06-05\ncalle: Río Negro\nnroDomicilio: '1933'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: mirthabenavidez@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	bf190d71-489b-4104-88eb-1d4691ae1ed5	2017-02-27 13:54:28.419319
30	17	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-011\nnombre: Hugo\napellido: Ibarra\nnroIdentificacion: '33428284'\nfechaNacimiento: 1989-09-04\ncalle: Tigre\nnroDomicilio: '4839'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: hugoibarra@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a37c3a7c-dd2a-4865-8f90-ec004967b581	2017-02-27 13:54:28.496603
79	19	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 1\nestado_id: \n	1	\N	\N	c0bbe64b-6b68-4996-8ae6-75c4e09ec71b	2017-02-27 13:54:33.020762
31	18	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-012\nnombre: Thalia\napellido: Ocampo\nnroIdentificacion: '31424518'\nfechaNacimiento: 1986-07-03\ncalle: Altamirano\nnroDomicilio: '3662'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: thaliaocampo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8f7f390b-08be-4479-afe2-11baf22bab6c	2017-02-27 13:54:28.581133
32	19	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-013\nnombre: Jose\napellido: Contreras\nnroIdentificacion: '29767192'\nfechaNacimiento: 1981-04-09\ncalle: 3 de Febrero\nnroDomicilio: '2691'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: josecontreras@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	43a41e95-bc3a-4363-8de5-b3894c7ba4ed	2017-02-27 13:54:28.6679
33	20	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-014\nnombre: Mariangeles\napellido: Elizondo\nnroIdentificacion: '36376423'\nfechaNacimiento: 1992-11-05\ncalle: Alcorta\nnroDomicilio: '1214'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: marelizondo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	a7d7f070-6e48-41a0-b0e6-27c63785c405	2017-02-27 13:54:28.759944
34	21	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-015\nnombre: Leonardo\napellido: Caballero Sosa\nnroIdentificacion: '25370940'\nfechaNacimiento: 1975-07-23\ncalle: Cte Izarduy\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: leocs@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	72556844-da46-4ec8-8b99-cf2bb09711bc	2017-02-27 13:54:28.856036
35	22	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-016\nnombre: Cintia\napellido: Rios\nnroIdentificacion: '40651702'\nfechaNacimiento: 1998-01-13\ncalle: Río Negro\nnroDomicilio: '1294'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: cintiarios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ba3fb5f9-ae38-415a-8dbd-489a164981b2	2017-02-27 13:54:28.945043
36	23	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-017\nnombre: Ana\napellido: Heredia Maestas\nnroIdentificacion: '27825263'\nfechaNacimiento: 1979-04-17\ncalle: Constitución\nnroDomicilio: '9934'\npiso: ''\ndpto: ''\ntelefono: '423606'\nemail: anaherediamaestas@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	058936ef-4140-48b2-ba7b-5b553dd920bf	2017-02-27 13:54:29.037054
37	24	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-018\nnombre: Diana\napellido: Arevalo\nnroIdentificacion: '36181611'\nfechaNacimiento: 1992-06-19\ncalle: Inglaterra\nnroDomicilio: '1945'\npiso: '3'\ndpto: '7'\ntelefono: '426924'\nemail: dianaarevalo@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 2\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	852700a8-b537-4cc6-98a1-df4bedd354ba	2017-02-27 13:54:29.11977
38	25	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-019\nnombre: Rosa\napellido: Granados\nnroIdentificacion: '30782514'\nfechaNacimiento: 1983-06-19\ncalle: Floresta\nnroDomicilio: '7744'\npiso: ''\ndpto: ''\ntelefono: '423722'\nemail: rosagranados@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	875865ec-4f49-46e8-b85a-e9e118a23417	2017-02-27 13:54:29.212643
39	26	Persona	\N	\N	1	\N	\N	create	---\ncodigo: ME-020\nnombre: Abril\napellido: Palacios\nnroIdentificacion: '39525733'\nfechaNacimiento: 1995-04-08\ncalle: Av Cervantes\nnroDomicilio: '1844'\npiso: '9'\ndpto: A\ntelefono: '423761'\nemail: abrilpalacios@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: \narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	dd2972ff-35d0-41b6-b269-92147b79e6db	2017-02-27 13:54:29.298891
40	1	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Presentación de la idea\ndescripcion: Nombre de la idea de emprendimiento y breve descripción\nobligatorio: true\nactividades_antecedentes: []\netapa_id: 1\n	1	\N	\N	7d20e3d6-914a-4eb2-a195-ff8a10ac8624	2017-02-27 13:54:29.567595
41	2	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Análisis de factibilidad\ndescripcion: 'Analisis de la factibilidad del emprendimiento es sus tres factores:\n  económico, técnico y operativo'\nobligatorio: true\nactividades_antecedentes:\n- '1'\netapa_id: 1\n	1	\N	\N	75b86210-76b1-46e3-94c8-e75fcc21cbe1	2017-02-27 13:54:29.68719
42	3	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Evaluación\ndescripcion: Los expertos de la incubadora evaluarán el proyecto presentado en base\n  a lo desarrollado en los pasos anteriores. Los proyectos aprobados pasarán a la\n  siguiente etapa\nobligatorio: true\nactividades_antecedentes:\n- '1'\n- '2'\netapa_id: 1\n	1	\N	\N	12a474f1-33b3-474c-8e53-9ae222480224	2017-02-27 13:54:29.783751
43	4	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Definicion del producto\ndescripcion: El proyecto define en detalle cual será su actividad economica principal,\n  qué y cómo es ese producto o servicio que desea comercializar\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	4f2719ae-0d56-49e1-ae06-fd8473cb398c	2017-02-27 13:54:29.85352
44	5	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Misión, Visión, Objetivos\ndescripcion: Definicion de misión, visión, y objetivos generales y particulares del\n  emprendimiento\nobligatorio: false\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	6c855c4d-4660-49aa-911f-048d2e3566d3	2017-02-27 13:54:29.923187
45	6	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Mercado - Clientes principales\ndescripcion: Definicion del nicho de mercado\nobligatorio: true\nactividades_antecedentes:\n- '4'\netapa_id: 2\n	1	\N	\N	d1681207-a69e-4e3e-96ec-d1f5e0ff4004	2017-02-27 13:54:29.989603
46	7	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Búsqueda de financiamiento\ndescripcion: Ponerse en contacto con personas que ayudarán al crecimiento del proyecto\nobligatorio: false\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	5c4f6265-8a86-44ec-99c9-0b852e80f3a0	2017-02-27 13:54:30.050483
47	8	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Asistencia a Conferencias\ndescripcion: Cada emprendimiento debe asistir a por lo menos un evento que organice\n  la empresa\nobligatorio: true\nactividades_antecedentes: \netapa_id: 2\n	1	\N	\N	3b2861c2-5142-4ec1-9440-6ad9afe57ab8	2017-02-27 13:54:30.100816
48	9	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Seguimiento\ndescripcion: Empresa en etapa de post incubacion\nobligatorio: true\nactividades_antecedentes: \netapa_id: 3\n	1	\N	\N	145fe939-fae7-410f-b5d7-4d4e90e57717	2017-02-27 13:54:30.161245
49	10	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Desarrollo de evento o conferencia\ndescripcion: Los proyectos que lleguen a esta etapa deben dar charlas u organizar\n  eventos para los nuevos emprendimientos en incubación\nobligatorio: true\nactividades_antecedentes:\n- '9'\netapa_id: 3\n	1	\N	\N	8c5a5f0c-52ed-4d98-b92a-a239d60dd72d	2017-02-27 13:54:30.231352
50	11	Actividad	\N	\N	1	\N	\N	create	---\nnombre: Financiamiento a un nuevo proyecto\ndescripcion: Los proyectos que lleguen a esta etapa deben de poder financiar a otros\n  emprendimientos emergentes o proveerles algun servicio que ayude a su crecimiento\nobligatorio: true\nactividades_antecedentes:\n- '9'\n- '10'\netapa_id: 3\n	1	\N	\N	27581c95-49c7-47e9-a414-65eceaa5c60b	2017-02-27 13:54:30.303242
52	2	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-002\nnombre: Trip -Drop, Turismo Solidario\ndescripcion: Plataforma web de gestión de ayuda a distintos colectivos (colegios,\n  orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros\n  con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa\n  que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita.\n  Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización\n  colectiva desde la experiencia individual.\ncalle: Av. San Martin\nnroDomicilio: '3141'\npiso: ''\ndpto: ''\ntelefono: 3758 423099\nemail: tripdrop@gmail.com\npagWeb: tripdrop.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 2\netapa_id: 1\narea_id: 1\n	1	\N	\N	b7c50637-a611-40f2-9418-51c11a42d8e7	2017-02-27 13:54:30.592066
53	3	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-003\nnombre: 'Idea Sitios '\ndescripcion: Diseño de páginas web\ncalle: Mariano Moreno\nnroDomicilio: '8787'\npiso: ''\ndpto: ''\ntelefono: '4465711'\nemail: ideassitios@gmail.com\npagWeb: ideassitios.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	a587b5fb-ea86-4863-bd06-0611eb44cc9f	2017-02-27 13:54:30.6693
54	4	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-004\nnombre: Homie\ndescripcion: Una plataforma online que permite al dueño de un inmueble determinar\n  en 48 hs si una persona es confiable o no para alquilar dicho inmueble.\ncalle: Alemania\nnroDomicilio: '4650'\npiso: ''\ndpto: ''\ntelefono: '154991812'\nemail: contacto@homie.com\npagWeb: homie.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	6b51d2e3-d591-4bbc-9d2b-e636b7f9f055	2017-02-27 13:54:30.752264
55	5	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-005\nnombre: Fondeadora\ndescripcion: Una plataforma de crowdfunding\ncalle: 'Colon '\nnroDomicilio: '700'\npiso: '1'\ndpto: '1'\ntelefono: '4419768'\nemail: fondeadora@gmail.com\npagWeb: fondeadora.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	8e6fca67-3525-46b1-b9ad-0c53636d30cf	2017-02-27 13:54:30.832462
56	6	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-006\nnombre: Obuu\ndescripcion: Hemos desarrollado un método para optimizar el aprovisionamiento logístico\n  mediante un software de preprocesado de datos con el que se pueden predecir las\n  necesidades de stock de piezas de repuesto y herramientas en caso de avería.\ncalle: 'Tigre '\nnroDomicilio: '500'\npiso: ''\ndpto: ''\ntelefono: '4596063'\nemail: obuu@gmail.com\npagWeb: obuu.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	f69b5bf1-2d28-416f-97c9-f19a811bccd4	2017-02-27 13:54:30.905337
57	7	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-007\nnombre: Odilo\ndescripcion: Una plataforma que permite a las bibliotecas de todo el país prestar\n  contenido digital.\ncalle: Miami\nnroDomicilio: '790'\npiso: '12'\ndpto: A\ntelefono: '459198'\nemail: odilo@gmail.com\npagWeb: odilo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 2\n	1	\N	\N	df83b776-f0a3-4258-8e0d-9d0d8cf1c688	2017-02-27 13:54:30.982695
58	8	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-008\nnombre: eHumanLife\ndescripcion: Una plataforma que permite pedir a través de videoconferencia una segunda\n  opinión médica a los mejores especialistas con traducción simultánea especializada\ncalle: Alemania\nnroDomicilio: '9123'\npiso: ''\ndpto: ''\ntelefono: '154701859'\nemail: ehumanlife@gmail.com\npagWeb: ehumanlife.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	a04690a6-d25a-499a-a183-a3d29939c2ab	2017-02-27 13:54:31.069271
59	9	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-009\nnombre: Endor nanotechnologies\ndescripcion: Una startup de investigación médica que fabrica cosmética para regenerar\n  la piel.\ncalle: Inglaterra\nnroDomicilio: '1234'\npiso: ''\ndpto: ''\ntelefono: '424063'\nemail: endor@gmail.com\npagWeb: endor.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	d001229a-a054-48ac-bdf0-fee9fb707a1b	2017-02-27 13:54:31.137282
60	10	Proyecto	\N	\N	1	\N	\N	create	---\ncodigo: PR-010\nnombre: MedBravo\ndescripcion: Software en la nube que quiere convertir a todos los hospitales del mundo\n  en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte\n  fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes\n  con cancer.\ncalle: Flores\nnroDomicilio: '704'\npiso: ''\ndpto: ''\ntelefono: '479842'\nemail: medbravo@gmail.com\npagWeb: medbravo.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\netapa_id: 1\narea_id: 1\n	1	\N	\N	32adbd0c-d924-47f5-9792-e9f2de251bfd	2017-02-27 13:54:31.21633
61	1	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 1\nestado_id: \n	1	\N	\N	98a49fd7-a819-4195-8a42-33baf73554e1	2017-02-27 13:54:32.041708
62	2	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 2\nestado_id: \n	1	\N	\N	0b473777-16aa-41a5-a7e9-f7418d8f73db	2017-02-27 13:54:32.121022
63	3	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 1\nactividad_id: 3\nestado_id: \n	1	\N	\N	56b60008-82ff-432a-8a46-2e1847bcbf0e	2017-02-27 13:54:32.179107
64	4	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 1\nestado_id: \n	1	\N	\N	80de71ee-b7a5-4109-a04e-6487f80c5def	2017-02-27 13:54:32.234689
66	6	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 2\nactividad_id: 3\nestado_id: \n	1	\N	\N	2dbf99e9-a2d8-4fe9-9e7a-d08d390c3fe4	2017-02-27 13:54:32.344982
67	7	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 1\nestado_id: \n	1	\N	\N	5519090d-8976-40d5-8a40-e8f071890c57	2017-02-27 13:54:32.398533
68	8	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 2\nestado_id: \n	1	\N	\N	5b261a67-dee9-427a-8405-b9e7ea658e0c	2017-02-27 13:54:32.452543
69	9	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 3\nactividad_id: 3\nestado_id: \n	1	\N	\N	1202ed4e-578d-479d-910c-3d788e721f33	2017-02-27 13:54:32.498973
70	10	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 1\nestado_id: \n	1	\N	\N	1eb839d6-b351-4047-92e0-edb5f8e21396	2017-02-27 13:54:32.555807
71	11	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 2\nestado_id: \n	1	\N	\N	23a7ce2a-16a2-4b3b-90c9-c9eb84c5d9d0	2017-02-27 13:54:32.610401
72	12	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 4\nactividad_id: 3\nestado_id: \n	1	\N	\N	648e0da9-aebd-417a-8ba9-2784100187a3	2017-02-27 13:54:32.667819
73	13	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 1\nestado_id: \n	1	\N	\N	e9ad8e98-6c2e-40aa-b3ac-e7d19851a98d	2017-02-27 13:54:32.721755
74	14	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 2\nestado_id: \n	1	\N	\N	5ce3a315-96e6-4a1d-8768-3ea865799906	2017-02-27 13:54:32.779601
75	15	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 5\nactividad_id: 3\nestado_id: \n	1	\N	\N	57f3e71d-5454-45c7-a7f8-d53bb71f3ab2	2017-02-27 13:54:32.833744
76	16	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 1\nestado_id: \n	1	\N	\N	672fbd08-dedc-426c-a33b-dbaf54d966b3	2017-02-27 13:54:32.887255
77	17	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 2\nestado_id: \n	1	\N	\N	393e5dc4-2581-4dca-83ae-824c1ca8167e	2017-02-27 13:54:32.931504
78	18	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 6\nactividad_id: 3\nestado_id: \n	1	\N	\N	843dc268-6256-46a6-804a-9b7ecd2ea07e	2017-02-27 13:54:32.975023
80	20	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 2\nestado_id: \n	1	\N	\N	cecf545f-dc12-4d62-b532-298d0dc31e70	2017-02-27 13:54:33.078693
81	21	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 7\nactividad_id: 3\nestado_id: \n	1	\N	\N	b7e5f3cb-ef24-4260-a7db-cecc64a63655	2017-02-27 13:54:33.135157
82	22	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 1\nestado_id: \n	1	\N	\N	2ecf1b22-c8e1-4303-bdab-e1dba5275058	2017-02-27 13:54:33.188472
83	23	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 2\nestado_id: \n	1	\N	\N	b8bb12c8-19a9-451f-a4b4-207ebe8f8af1	2017-02-27 13:54:33.230142
84	24	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 8\nactividad_id: 3\nestado_id: \n	1	\N	\N	12496915-792b-4903-b28d-5a4f83579b6b	2017-02-27 13:54:33.275574
85	25	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 1\nestado_id: \n	1	\N	\N	5134f86d-b7c6-4698-b622-cdb8481fb2b8	2017-02-27 13:54:33.3754
86	26	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 2\nestado_id: \n	1	\N	\N	66672fde-2cf5-42a0-9ccb-57dbc78d8d2c	2017-02-27 13:54:33.420015
87	27	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 9\nactividad_id: 3\nestado_id: \n	1	\N	\N	d98178b4-60f9-4cd9-8bfd-b34240df5cbd	2017-02-27 13:54:33.468167
88	28	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 1\nestado_id: \n	1	\N	\N	4d518a44-854d-4014-95dd-8b9b1474391d	2017-02-27 13:54:33.521034
89	29	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 2\nestado_id: \n	1	\N	\N	b6e26e1f-df6e-4f6d-8da3-6f9542d77cd9	2017-02-27 13:54:33.581195
90	30	ActividadProyecto	\N	\N	1	\N	\N	create	---\nfechaVencimiento: \nproyecto_id: 10\nactividad_id: 3\nestado_id: \n	1	\N	\N	9deb40a2-16e1-4374-afec-fdf612291137	2017-02-27 13:54:33.63484
91	1	Estado	\N	\N	1	\N	\N	create	---\nnombre: To do\nultimo: false\nprevious: \ncolor: \n	1	\N	\N	1a89c379-8f37-4154-8250-a4387ec6151d	2017-02-27 13:54:39.703023
92	2	Estado	\N	\N	1	\N	\N	create	---\nnombre: Doing\nultimo: false\nprevious: 1\ncolor: \n	1	\N	\N	1aa5b8a3-be85-4c68-aaac-8b64e84034bb	2017-02-27 13:54:39.762883
93	3	Estado	\N	\N	1	\N	\N	create	---\nnombre: Done\nultimo: true\nprevious: 2\ncolor: \n	1	\N	\N	edcdebd2-664a-4fb6-b484-763da34a969d	2017-02-27 13:54:39.825045
94	1	Descuento	\N	\N	1	\N	\N	create	---\nnombre: Descuento 10%\ndescripcion: "-"\nporcentaje: 10.0\n	1	\N	\N	3962da88-4747-48c8-93b1-dd41f6736467	2017-02-27 13:54:39.932279
95	1	Interes	\N	\N	1	\N	\N	create	---\nnombre: Interes 20%\ndescripcion: "-"\nporcentaje: 20.0\n	1	\N	\N	ce49ebf6-76e6-4713-a914-33801e147425	2017-02-27 13:54:40.025213
96	1	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-001\nnombre: Cuota de Enero\ndescripcion: Enero 2017\nmonto: 200.0\n	1	\N	\N	78d38ab2-4087-4952-b7d8-f542a48b775c	2017-02-27 13:54:40.142945
97	2	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-002\nnombre: Cuota de Febrero\ndescripcion: Febrero 2017\nmonto: 200.0\n	1	\N	\N	9a3b94b0-ca82-4068-8921-b1e3b9fe7bfa	2017-02-27 13:54:40.19832
98	3	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-003\nnombre: Cuota de Marzo\ndescripcion: Marzo 2017\nmonto: 200.0\n	1	\N	\N	9ad1371a-f4f6-491b-a7e6-4ead28c8e05a	2017-02-27 13:54:40.257284
99	4	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-004\nnombre: Cuota de Abril\ndescripcion: Abril 2017\nmonto: 200.0\n	1	\N	\N	b2234a96-55a6-4235-8cc7-339800539cfc	2017-02-27 13:54:40.325379
100	5	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-005\nnombre: Cuota de Mayo\ndescripcion: Mayo 2017\nmonto: 200.0\n	1	\N	\N	ebddc5c1-edc0-45dd-9977-e522a46047fa	2017-02-27 13:54:40.391325
101	6	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-006\nnombre: Cuota de Junio\ndescripcion: Junio 2017\nmonto: 200.0\n	1	\N	\N	159b28e6-2b6c-47bf-a3c0-8eaa8f89c69f	2017-02-27 13:54:40.501413
102	7	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-007\nnombre: Cuota de Julio\ndescripcion: Julio 2017\nmonto: 200.0\n	1	\N	\N	1b60ed11-9e51-4633-ae57-2d3d09a4ff0d	2017-02-27 13:54:40.614461
103	8	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-008\nnombre: Cuota de Agosto\ndescripcion: Agosto 2017\nmonto: 200.0\n	1	\N	\N	92dbebe7-fe29-4b08-8203-95cdfb2f6264	2017-02-27 13:54:40.673376
104	9	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-009\nnombre: Cuota de Septiembre\ndescripcion: Septiembre 2017\nmonto: 200.0\n	1	\N	\N	8b6101bd-205c-4647-8dbe-b3dd47d53d1c	2017-02-27 13:54:40.732529
105	10	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-010\nnombre: Cuota de Octubre\ndescripcion: Octubre 2017\nmonto: 200.0\n	1	\N	\N	124b2d5f-836e-4f8b-919d-abc087e14d38	2017-02-27 13:54:40.785789
106	11	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-011\nnombre: Cuota de Noviembre\ndescripcion: Noviembre 2017\nmonto: 200.0\n	1	\N	\N	2bde8da4-2928-434d-a0d2-7cf438a11894	2017-02-27 13:54:40.840885
107	12	ConceptoDePago	\N	\N	1	\N	\N	create	---\ncodigo: CP-012\nnombre: Cuota de Diciembre\ndescripcion: Diciembre 2017\nmonto: 200.0\n	1	\N	\N	18ed4184-9134-4c86-ae84-1c78c694bcec	2017-02-27 13:54:40.897504
108	1	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 7\nproyecto_id: 1\n	1	\N	\N	799f7be5-78d8-4de2-b0bf-625c424221ba	2017-02-27 13:54:41.609384
109	2	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 8\nproyecto_id: 2\n	1	\N	\N	d5ec0483-9666-4b85-be13-6c28a500b040	2017-02-27 13:54:41.659267
110	3	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 10\nproyecto_id: 3\n	1	\N	\N	b1fcca13-7e58-4b26-992d-bb4798a3c0d6	2017-02-27 13:54:41.716654
111	4	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 12\nproyecto_id: 4\n	1	\N	\N	71d7267d-ff72-4a66-a964-abe3fa835a1b	2017-02-27 13:54:41.768488
112	5	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 14\nproyecto_id: 5\n	1	\N	\N	d28d97e8-b5be-47f0-b512-4ae669530f82	2017-02-27 13:54:41.827693
113	6	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 19\nproyecto_id: 6\n	1	\N	\N	24bdd45e-9f8c-40ac-b885-adbe0286468a	2017-02-27 13:54:41.884642
114	7	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 18\nproyecto_id: 7\n	1	\N	\N	a36d05aa-d1aa-43bf-8d0c-73d3b50c8ce3	2017-02-27 13:54:41.938825
115	8	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 21\nproyecto_id: 8\n	1	\N	\N	0f7e634d-ec4b-47c9-bd07-f6646de82be8	2017-02-27 13:54:41.993605
116	9	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 23\nproyecto_id: 9\n	1	\N	\N	1308f878-a9d2-44be-aa34-fcb121a60bae	2017-02-27 13:54:42.04787
117	10	Contrato	\N	\N	1	\N	\N	create	---\nfecha_inicio: 2017-01-01\nfecha_fin: 2017-04-30\npersona_proyecto_id: \npersona_id: 25\nproyecto_id: 10\n	1	\N	\N	73a10e1a-be86-45f7-bf12-20800da20ae0	2017-02-27 13:54:42.101798
118	1	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	1868dbcd-4c81-4c61-b15b-a7e0c3c908b7	2017-02-27 13:54:42.285069
119	2	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	716feddf-a21e-4e2a-aa04-2df19cc2c5b7	2017-02-27 13:54:42.403492
120	3	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	903329de-92e4-4a25-bb71-01b7cf8b7f7a	2017-02-27 13:54:42.495749
121	4	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 1\ncontrato_id: 1\npago_id: \ndescuento_id: \n	1	\N	\N	0c098e2a-26fc-4d41-956c-d496e69e9ba0	2017-02-27 13:54:42.568435
122	5	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	731a3b35-2c81-4b10-8796-7bea174c7eaf	2017-02-27 13:54:42.665719
123	6	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	f62ac0e6-16e4-40b1-876f-e9c62cdf2982	2017-02-27 13:54:42.774553
124	7	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	9dc8bbd3-6950-4096-a1c2-151fd564290c	2017-02-27 13:54:42.916146
125	8	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 2\ncontrato_id: 2\npago_id: \ndescuento_id: \n	1	\N	\N	adfd91e8-082b-4e4b-9b45-84dccbf72224	2017-02-27 13:54:42.987456
126	9	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	1aa5a5b7-6d0d-4f63-8867-682f7c3f3b7c	2017-02-27 13:54:43.086714
127	10	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	fdbf0b64-c3be-40c3-a873-60da7bb1b006	2017-02-27 13:54:43.197741
128	11	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	5b7ad234-4b6b-4d10-a0c8-07b8564ca563	2017-02-27 13:54:43.291683
129	12	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 3\ncontrato_id: 3\npago_id: \ndescuento_id: \n	1	\N	\N	e49ead80-ca89-48a7-9dff-f67e7704d219	2017-02-27 13:54:43.37633
130	13	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	97c8608d-016f-4752-9ee6-35867f1cc8b7	2017-02-27 13:54:43.472777
131	14	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	9f1eb9c1-9039-4519-85d6-6fc011375744	2017-02-27 13:54:43.58479
132	15	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	0c003cc8-13f5-4d18-88a5-ec7345bcd13d	2017-02-27 13:54:43.687042
133	16	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 4\ncontrato_id: 4\npago_id: \ndescuento_id: \n	1	\N	\N	fc2156a9-052e-46a4-bf58-4fac3fe35eff	2017-02-27 13:54:43.768227
134	17	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	4f889d98-f7c0-4686-b2e1-f935353972bb	2017-02-27 13:54:43.859853
135	18	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	1b4d892a-9063-42d7-bfbc-c90c09b46ec3	2017-02-27 13:54:43.966156
136	19	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	aed793e0-e389-4f73-a802-371d39021056	2017-02-27 13:54:44.060828
137	20	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 5\ncontrato_id: 5\npago_id: \ndescuento_id: \n	1	\N	\N	78a0249c-c69b-47e4-aa71-e70354f77758	2017-02-27 13:54:44.164323
138	21	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	3b72c329-7f6d-4a24-9fac-5ff2b796e4da	2017-02-27 13:54:44.265969
139	22	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	d78f26a9-0b28-4f8e-852a-74b126864f04	2017-02-27 13:54:44.423145
140	23	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	07af6ced-5d5e-4f7e-a1ed-b9b90814ac3c	2017-02-27 13:54:44.530138
141	24	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 6\ncontrato_id: 6\npago_id: \ndescuento_id: \n	1	\N	\N	035574cb-7d4d-4304-bdce-6dfc57c8d001	2017-02-27 13:54:44.618515
142	25	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	45217de2-e9a9-4d6f-a203-dd8e4cf599fe	2017-02-27 13:54:44.70159
143	26	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	13f63bb9-8b4f-4d7e-9034-cf0b4262a1a1	2017-02-27 13:54:44.804346
144	27	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	53e44940-77c3-4a8a-bc33-8a715ba950b6	2017-02-27 13:54:44.893639
145	28	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 7\ncontrato_id: 7\npago_id: \ndescuento_id: \n	1	\N	\N	74f1c229-ae82-47c2-b97e-4d3cb959b5dc	2017-02-27 13:54:44.970531
146	29	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	bc64ac9e-04ef-4123-aefa-e1078a3f5950	2017-02-27 13:54:45.063897
147	30	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	fa8c54f7-3cce-4889-91c9-f70060709762	2017-02-27 13:54:45.171987
148	31	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	a97cfd1e-6469-4a9d-a8b6-0bda0be14c07	2017-02-27 13:54:45.258692
149	32	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 8\ncontrato_id: 8\npago_id: \ndescuento_id: \n	1	\N	\N	951883c0-2b7a-47d0-8e7d-8f481149ec5e	2017-02-27 13:54:45.340488
150	33	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	50850bc2-91fc-4b28-9f24-a84b7a483c52	2017-02-27 13:54:45.436376
151	34	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	5d85efb8-a82d-4b14-a22f-ddf9215b545c	2017-02-27 13:54:45.55796
152	35	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	bfc198c4-9e40-4130-9de7-d0d1b08113c1	2017-02-27 13:54:45.654371
153	36	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 9\ncontrato_id: 9\npago_id: \ndescuento_id: \n	1	\N	\N	7baa16dc-d48e-45d2-9b4f-754d9ae59e62	2017-02-27 13:54:45.737511
154	37	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 1\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	59c66735-2b9c-42ff-b3ed-3e45925fbb17	2017-02-27 13:54:45.830741
155	38	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 288.0\nestado: false\nconcepto_de_pago_id: 2\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	929bb784-46da-40fe-a876-8f20bf1676f8	2017-02-27 13:54:45.937625
156	39	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 3\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	8054ccdd-8127-4795-820d-1100019c0bae	2017-02-27 13:54:46.041268
157	40	CuotaPorCliente	\N	\N	1	\N	\N	create	---\nmontoTotal: 200.0\nestado: false\nconcepto_de_pago_id: 4\nproyecto_id: 10\ncontrato_id: 10\npago_id: \ndescuento_id: \n	1	\N	\N	0e2981bb-5650-4ff2-aad6-6c4bf7a23c6e	2017-02-27 13:54:46.110931
158	1	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 1\n	1	\N	\N	b3db486b-4415-41c8-a57c-568f71f2c750	2017-02-27 13:54:46.222741
159	2	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 2\n	1	\N	\N	92201b2d-d6f1-486d-9e02-94c630c3e184	2017-02-27 13:54:46.352314
160	3	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 3\n	1	\N	\N	42007433-941b-43e2-9b79-4321c218be67	2017-02-27 13:54:46.403054
161	4	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 4\n	1	\N	\N	6ce52d3a-3703-4019-b78f-9cf652b68d34	2017-02-27 13:54:46.44762
162	5	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 5\n	1	\N	\N	f25998ce-9c9e-4a5b-ad21-0d52ad155a9d	2017-02-27 13:54:46.505497
163	6	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 6\n	1	\N	\N	072b7ed9-b88c-44da-8347-5843fa636209	2017-02-27 13:54:46.564114
164	7	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 7\n	1	\N	\N	940e7d7a-a3f4-4cf6-aee2-2e4a5d0a3814	2017-02-27 13:54:46.617109
165	8	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 8\n	1	\N	\N	7c630bad-8af1-4bee-9eee-4c8cc03a29c0	2017-02-27 13:54:46.6766
166	9	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 9\n	1	\N	\N	d2bf53ee-feee-41d5-9160-f746ec3d39ac	2017-02-27 13:54:46.726405
167	10	Cuenta	\N	\N	1	\N	\N	create	---\nsaldo: 0.0\nproyecto_id: 10\n	1	\N	\N	5cb95c16-6766-450e-821a-2d23d16e55ec	2017-02-27 13:54:46.770151
168	1	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Marketing\ndescripcion: "-"\n	1	\N	\N	faee84b4-b353-4537-a94d-8919e645d0c5	2017-02-27 13:54:47.008722
169	2	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Diseño Gráfico\ndescripcion: "-"\n	1	\N	\N	dae49b05-36f7-43a3-a151-e1864cafdb7f	2017-02-27 13:54:47.060051
170	3	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Diseño Web\ndescripcion: "-"\n	1	\N	\N	c692f2fd-7080-4cea-993a-85f530e0d5f6	2017-02-27 13:54:47.105529
171	4	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Fotografía\ndescripcion: "-"\n	1	\N	\N	ae0bd2c3-a4ab-4498-9663-341d799b5560	2017-02-27 13:54:47.165007
172	5	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Multimedios\ndescripcion: "-"\n	1	\N	\N	5a7c76d0-38b7-40c7-951d-3ae3973c8e6d	2017-02-27 13:54:47.218809
173	6	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Community Manager\ndescripcion: "-"\n	1	\N	\N	c7b62e6d-eba4-4611-9af5-872c5d16eb83	2017-02-27 13:54:47.273857
174	7	EspecialidadDeContacto	\N	\N	\N	\N	\N	create	---\nnombre: Crowdfunding\ndescripcion: "-"\n	1	\N	\N	af18b3f9-242a-4864-9223-9250ada05163	2017-02-27 13:54:47.331767
175	27	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-001\nnombre: María Rosa\napellido: Conti\nnroIdentificacion: '25644132'\nfechaNacimiento: 1975-07-03\ncalle: Ituzaingo\nnroDomicilio: '245'\npiso: '12'\ndpto: B\ntelefono: '424568'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 1\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8c0617df-1086-4871-838a-d5255b79281c	2017-02-27 13:54:47.539123
176	28	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-002\nnombre: Berta\napellido: Rivera\nnroIdentificacion: '33958772'\nfechaNacimiento: 1989-04-11\ncalle: Leandro Gomez\nnroDomicilio: '5886'\npiso: \ndpto: \ntelefono: '4598765'\nemail: brivera@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 2\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	4d8fb3c7-1194-4119-b097-0e40ddade622	2017-02-27 13:54:47.683821
177	29	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-003\nnombre: Juliana\napellido: Castiglione\nnroIdentificacion: '30444512'\nfechaNacimiento: 1980-12-09\ncalle: Brisas\nnroDomicilio: '3280'\npiso: '5'\ndpto: '15'\ntelefono: '555321'\nemail: jcastiglione@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 3\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	40155e92-e0ed-4322-b3c2-f2bc0c2d57dd	2017-02-27 13:54:47.776088
178	30	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-004\nnombre: Nahuel\napellido: Estevez\nnroIdentificacion: '19423568'\nfechaNacimiento: 1966-11-28\ncalle: Av. Alta Gracia\nnroDomicilio: '5332'\npiso: '12'\ndpto: B\ntelefono: '154632108'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 4\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	8b3ec1e5-bbdb-4a9c-b813-2ea60b3e1a85	2017-02-27 13:54:47.873771
179	31	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-005\nnombre: Pablo\napellido: Gomez\nnroIdentificacion: '25221305'\nfechaNacimiento: 1970-03-05\ncalle: Neruda\nnroDomicilio: '7393'\npiso: '12'\ndpto: B\ntelefono: '154245689'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 5\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	fe65542f-23e7-4c23-bca6-dd1823135352	2017-02-27 13:54:47.971592
180	32	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-006\nnombre: Abigaíl\napellido: Coronado\nnroIdentificacion: '37926793'\nfechaNacimiento: 1994-03-21\ncalle: F. Varela\nnroDomicilio: '5659'\npiso: '12'\ndpto: B\ntelefono: '432666'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 6\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	356e373b-adf7-4bc0-8965-351a1ff3f6f7	2017-02-27 13:54:48.074374
181	33	Persona	\N	\N	\N	\N	\N	create	---\ncodigo: CO-007\nnombre: Hilda\napellido: Zielinski\nnroIdentificacion: '25334991'\nfechaNacimiento: 1970-04-07\ncalle: Joaquin Suarez\nnroDomicilio: '6863'\npiso: '12'\ndpto: B\ntelefono: '4478909'\nemail: mrconti@gmail.com\npais_id: 1\nprovincia_id: 1\nciudad_id: 1\ntipo_documento_id: 1\ndepartamento_id: \nespecialidad_de_contacto_id: 7\narea_id: 1\nrol_de_empleado_id: \n	1	\N	\N	ecb384af-dbc8-4cfb-abf6-b162802f7081	2017-02-27 13:54:48.17343
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('audits_id_seq', 185, true);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY ciudades (id, nombre, created_at, updated_at, provincia_id, pais_id) FROM stdin;
1	Posadas	2017-02-27 13:54:25.306179	2017-02-27 13:54:25.306179	1	1
2	Apostoles	2017-02-27 13:54:25.346961	2017-02-27 13:54:25.346961	1	1
3	Bella Vista	2017-02-27 13:54:25.522	2017-02-27 13:54:25.522	2	1
4	Encarnación	2017-02-27 13:54:25.558698	2017-02-27 13:54:25.558698	3	2
\.


--
-- Name: ciudades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('ciudades_id_seq', 4, true);


--
-- Data for Name: conceptos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY conceptos_de_pago (id, codigo, nombre, descripcion, monto, created_at, updated_at) FROM stdin;
1	CP-001	Cuota de Enero	Enero 2017	200	2017-02-27 13:54:40.117061	2017-02-27 13:54:40.117061
2	CP-002	Cuota de Febrero	Febrero 2017	200	2017-02-27 13:54:40.180325	2017-02-27 13:54:40.180325
3	CP-003	Cuota de Marzo	Marzo 2017	200	2017-02-27 13:54:40.237381	2017-02-27 13:54:40.237381
4	CP-004	Cuota de Abril	Abril 2017	200	2017-02-27 13:54:40.304743	2017-02-27 13:54:40.304743
5	CP-005	Cuota de Mayo	Mayo 2017	200	2017-02-27 13:54:40.371746	2017-02-27 13:54:40.371746
6	CP-006	Cuota de Junio	Junio 2017	200	2017-02-27 13:54:40.48326	2017-02-27 13:54:40.48326
7	CP-007	Cuota de Julio	Julio 2017	200	2017-02-27 13:54:40.546426	2017-02-27 13:54:40.546426
8	CP-008	Cuota de Agosto	Agosto 2017	200	2017-02-27 13:54:40.655925	2017-02-27 13:54:40.655925
9	CP-009	Cuota de Septiembre	Septiembre 2017	200	2017-02-27 13:54:40.71301	2017-02-27 13:54:40.71301
10	CP-010	Cuota de Octubre	Octubre 2017	200	2017-02-27 13:54:40.768263	2017-02-27 13:54:40.768263
11	CP-011	Cuota de Noviembre	Noviembre 2017	200	2017-02-27 13:54:40.823289	2017-02-27 13:54:40.823289
12	CP-012	Cuota de Diciembre	Diciembre 2017	200	2017-02-27 13:54:40.878991	2017-02-27 13:54:40.878991
\.


--
-- Name: conceptos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('conceptos_de_pago_id_seq', 12, true);


--
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY configuraciones (id, logo, nombre, eslogan, cuit, condicion_iva, numero_abandono, tiempo_abandono, calle, nro_domicilio, piso, dpto, telefono, email, pag_web, created_at, updated_at, pais_id, provincia_id, ciudad_id, area_id, logotipo) FROM stdin;
1	Peak-Startup-Logo.png	Peak Startup		30-54570225-4	ri	15	minutes	Av. Corrientes	4287			4401604	\N	peakstartup@gmail.com	2017-02-27 13:54:46.913744	2017-02-27 13:54:46.913744	1	1	1	1	\N
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
1	2017-01-01	2017-04-30	2017-02-27 13:54:41.579722	2017-02-27 13:54:41.579722	\N	7	1
2	2017-01-01	2017-04-30	2017-02-27 13:54:41.640167	2017-02-27 13:54:41.640167	\N	8	2
3	2017-01-01	2017-04-30	2017-02-27 13:54:41.695593	2017-02-27 13:54:41.695593	\N	10	3
4	2017-01-01	2017-04-30	2017-02-27 13:54:41.749124	2017-02-27 13:54:41.749124	\N	12	4
5	2017-01-01	2017-04-30	2017-02-27 13:54:41.806866	2017-02-27 13:54:41.806866	\N	14	5
6	2017-01-01	2017-04-30	2017-02-27 13:54:41.861543	2017-02-27 13:54:41.861543	\N	19	6
7	2017-01-01	2017-04-30	2017-02-27 13:54:41.916502	2017-02-27 13:54:41.916502	\N	18	7
8	2017-01-01	2017-04-30	2017-02-27 13:54:41.972393	2017-02-27 13:54:41.972393	\N	21	8
9	2017-01-01	2017-04-30	2017-02-27 13:54:42.027364	2017-02-27 13:54:42.027364	\N	23	9
10	2017-01-01	2017-04-30	2017-02-27 13:54:42.082934	2017-02-27 13:54:42.082934	\N	25	10
\.


--
-- Name: contratos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('contratos_id_seq', 10, true);


--
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuentas (id, saldo, created_at, updated_at, proyecto_id) FROM stdin;
1	0	2017-02-27 13:54:46.193667	2017-02-27 13:54:46.193667	1
2	0	2017-02-27 13:54:46.33455	2017-02-27 13:54:46.33455	2
3	0	2017-02-27 13:54:46.386878	2017-02-27 13:54:46.386878	3
4	0	2017-02-27 13:54:46.431423	2017-02-27 13:54:46.431423	4
5	0	2017-02-27 13:54:46.489297	2017-02-27 13:54:46.489297	5
6	0	2017-02-27 13:54:46.545552	2017-02-27 13:54:46.545552	6
7	0	2017-02-27 13:54:46.600673	2017-02-27 13:54:46.600673	7
8	0	2017-02-27 13:54:46.65521	2017-02-27 13:54:46.65521	8
9	0	2017-02-27 13:54:46.710405	2017-02-27 13:54:46.710405	9
10	0	2017-02-27 13:54:46.753854	2017-02-27 13:54:46.753854	10
\.


--
-- Name: cuentas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('cuentas_id_seq', 10, true);


--
-- Data for Name: cuotas_por_cliente; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY cuotas_por_cliente (id, "montoTotal", estado, created_at, updated_at, concepto_de_pago_id, proyecto_id, contrato_id, pago_id, descuento_id) FROM stdin;
1	288	f	2017-02-27 13:54:42.251933	2017-02-27 13:54:42.251933	1	1	1	\N	\N
2	288	f	2017-02-27 13:54:42.380597	2017-02-27 13:54:42.380597	2	1	1	\N	\N
3	200	f	2017-02-27 13:54:42.47321	2017-02-27 13:54:42.47321	3	1	1	\N	\N
4	200	f	2017-02-27 13:54:42.546229	2017-02-27 13:54:42.546229	4	1	1	\N	\N
5	288	f	2017-02-27 13:54:42.643064	2017-02-27 13:54:42.643064	1	2	2	\N	\N
6	288	f	2017-02-27 13:54:42.752615	2017-02-27 13:54:42.752615	2	2	2	\N	\N
7	200	f	2017-02-27 13:54:42.895784	2017-02-27 13:54:42.895784	3	2	2	\N	\N
8	200	f	2017-02-27 13:54:42.967282	2017-02-27 13:54:42.967282	4	2	2	\N	\N
9	288	f	2017-02-27 13:54:43.064948	2017-02-27 13:54:43.064948	1	3	3	\N	\N
10	288	f	2017-02-27 13:54:43.175786	2017-02-27 13:54:43.175786	2	3	3	\N	\N
11	200	f	2017-02-27 13:54:43.271086	2017-02-27 13:54:43.271086	3	3	3	\N	\N
12	200	f	2017-02-27 13:54:43.355916	2017-02-27 13:54:43.355916	4	3	3	\N	\N
13	288	f	2017-02-27 13:54:43.451159	2017-02-27 13:54:43.451159	1	4	4	\N	\N
14	288	f	2017-02-27 13:54:43.563388	2017-02-27 13:54:43.563388	2	4	4	\N	\N
15	200	f	2017-02-27 13:54:43.664646	2017-02-27 13:54:43.664646	3	4	4	\N	\N
16	200	f	2017-02-27 13:54:43.74562	2017-02-27 13:54:43.74562	4	4	4	\N	\N
17	288	f	2017-02-27 13:54:43.838692	2017-02-27 13:54:43.838692	1	5	5	\N	\N
18	288	f	2017-02-27 13:54:43.939865	2017-02-27 13:54:43.939865	2	5	5	\N	\N
19	200	f	2017-02-27 13:54:44.040138	2017-02-27 13:54:44.040138	3	5	5	\N	\N
20	200	f	2017-02-27 13:54:44.112174	2017-02-27 13:54:44.112174	4	5	5	\N	\N
21	288	f	2017-02-27 13:54:44.237154	2017-02-27 13:54:44.237154	1	6	6	\N	\N
22	288	f	2017-02-27 13:54:44.398697	2017-02-27 13:54:44.398697	2	6	6	\N	\N
23	200	f	2017-02-27 13:54:44.50951	2017-02-27 13:54:44.50951	3	6	6	\N	\N
24	200	f	2017-02-27 13:54:44.593811	2017-02-27 13:54:44.593811	4	6	6	\N	\N
25	288	f	2017-02-27 13:54:44.681977	2017-02-27 13:54:44.681977	1	7	7	\N	\N
26	288	f	2017-02-27 13:54:44.783764	2017-02-27 13:54:44.783764	2	7	7	\N	\N
27	200	f	2017-02-27 13:54:44.871473	2017-02-27 13:54:44.871473	3	7	7	\N	\N
28	200	f	2017-02-27 13:54:44.946584	2017-02-27 13:54:44.946584	4	7	7	\N	\N
29	288	f	2017-02-27 13:54:45.042413	2017-02-27 13:54:45.042413	1	8	8	\N	\N
30	288	f	2017-02-27 13:54:45.149673	2017-02-27 13:54:45.149673	2	8	8	\N	\N
31	200	f	2017-02-27 13:54:45.237117	2017-02-27 13:54:45.237117	3	8	8	\N	\N
32	200	f	2017-02-27 13:54:45.317732	2017-02-27 13:54:45.317732	4	8	8	\N	\N
33	288	f	2017-02-27 13:54:45.412442	2017-02-27 13:54:45.412442	1	9	9	\N	\N
34	288	f	2017-02-27 13:54:45.53782	2017-02-27 13:54:45.53782	2	9	9	\N	\N
35	200	f	2017-02-27 13:54:45.63254	2017-02-27 13:54:45.63254	3	9	9	\N	\N
36	200	f	2017-02-27 13:54:45.715701	2017-02-27 13:54:45.715701	4	9	9	\N	\N
37	288	f	2017-02-27 13:54:45.807192	2017-02-27 13:54:45.807192	1	10	10	\N	\N
38	288	f	2017-02-27 13:54:45.915931	2017-02-27 13:54:45.915931	2	10	10	\N	\N
39	200	f	2017-02-27 13:54:46.016784	2017-02-27 13:54:46.016784	3	10	10	\N	\N
40	200	f	2017-02-27 13:54:46.088616	2017-02-27 13:54:46.088616	4	10	10	\N	\N
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
1	Finanzas	2017-02-27 13:54:25.78487	2017-02-27 13:54:25.78487
2	Recursos Humanos	2017-02-27 13:54:25.960368	2017-02-27 13:54:25.960368
3	Evaluación	2017-02-27 13:54:26.005863	2017-02-27 13:54:26.005863
4	Logística	2017-02-27 13:54:26.071483	2017-02-27 13:54:26.071483
5	Dirección	2017-02-27 13:54:26.115444	2017-02-27 13:54:26.115444
\.


--
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('departamentos_id_seq', 5, true);


--
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY descuentos (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Descuento 10%	-	10	2017-02-27 13:54:39.906754	2017-02-27 13:54:39.906754
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
1	Marketing	-	2017-02-27 13:54:46.985117	2017-02-27 13:54:46.985117
2	Diseño Gráfico	-	2017-02-27 13:54:47.044964	2017-02-27 13:54:47.044964
3	Diseño Web	-	2017-02-27 13:54:47.089781	2017-02-27 13:54:47.089781
4	Fotografía	-	2017-02-27 13:54:47.148452	2017-02-27 13:54:47.148452
5	Multimedios	-	2017-02-27 13:54:47.20222	2017-02-27 13:54:47.20222
6	Community Manager	-	2017-02-27 13:54:47.258369	2017-02-27 13:54:47.258369
7	Crowdfunding	-	2017-02-27 13:54:47.3136	2017-02-27 13:54:47.3136
\.


--
-- Name: especialidades_de_contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('especialidades_de_contacto_id_seq', 7, true);


--
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY estados (id, nombre, ultimo, previous, color, created_at, updated_at) FROM stdin;
1	To do	f	\N	\N	2017-02-27 13:54:39.676853	2017-02-27 13:54:39.676853
2	Doing	f	1	\N	2017-02-27 13:54:39.741985	2017-02-27 13:54:39.741985
3	Done	t	2	\N	2017-02-27 13:54:39.805205	2017-02-27 13:54:39.805205
\.


--
-- Name: estados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('estados_id_seq', 3, true);


--
-- Data for Name: etapas; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY etapas (id, nombre, descripcion, "etapaAnterior", created_at, updated_at) FROM stdin;
1	Pre incubacion	-	\N	2017-02-27 13:54:29.379718	2017-02-27 13:54:29.379718
2	Incubación	-	1	2017-02-27 13:54:29.406732	2017-02-27 13:54:29.406732
3	post incubacion	-	2	2017-02-27 13:54:29.43905	2017-02-27 13:54:29.43905
4	Cuarta etapa	-	\N	2017-02-27 13:54:29.46176	2017-02-27 13:54:29.46176
\.


--
-- Name: etapas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('etapas_id_seq', 4, true);


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY eventos (id, codigo, nombre, descripcion, dia, hora, created_at, updated_at, persona_id) FROM stdin;
1	EV-001	Charla de Marketing	una charla de marketing	2017-03-03	08:00:00	2017-02-27 13:57:53.076301	2017-02-27 13:57:53.076301	\N
2	EV-002	Reunion con diseñadores web	-	2017-03-04	09:00:00	2017-02-27 17:20:12.878259	2017-02-27 17:20:12.878259	\N
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
1	2017-02-27 17:48:04.016577	2017-02-27 17:48:04.017893	2017-02-27 17:48:04.074419	1	3	\N	1
2	2017-02-27 17:48:40.698943	2017-02-27 17:48:40.700476	2017-02-27 17:48:40.738137	3	1	\N	1
\.


--
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('historiales_id_seq', 2, true);


--
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY intereses (id, nombre, descripcion, porcentaje, created_at, updated_at) FROM stdin;
1	Interes 20%	-	20	2017-02-27 13:54:40.000928	2017-02-27 13:54:40.000928
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
1	Actividad	2017-02-27 13:54:33.97394	2017-02-27 13:54:33.97394
2	Area	2017-02-27 13:54:34.007622	2017-02-27 13:54:34.007622
3	Ciudad	2017-02-27 13:54:34.02713	2017-02-27 13:54:34.02713
4	ConceptoDePago	2017-02-27 13:54:34.049712	2017-02-27 13:54:34.049712
5	Contacto	2017-02-27 13:54:34.070515	2017-02-27 13:54:34.070515
6	Contrato	2017-02-27 13:54:34.096736	2017-02-27 13:54:34.096736
7	Cuenta	2017-02-27 13:54:34.116265	2017-02-27 13:54:34.116265
8	Departamento	2017-02-27 13:54:34.13932	2017-02-27 13:54:34.13932
9	Descuento	2017-02-27 13:54:34.160124	2017-02-27 13:54:34.160124
10	Empleado	2017-02-27 13:54:34.184593	2017-02-27 13:54:34.184593
11	EspecialidadDeContacto	2017-02-27 13:54:34.207676	2017-02-27 13:54:34.207676
12	Estado	2017-02-27 13:54:34.227109	2017-02-27 13:54:34.227109
13	Etapa	2017-02-27 13:54:34.249878	2017-02-27 13:54:34.249878
14	Evento	2017-02-27 13:54:34.27371	2017-02-27 13:54:34.27371
15	EventoProyecto	2017-02-27 13:54:34.294349	2017-02-27 13:54:34.294349
16	MiembroEquipo	2017-02-27 13:54:34.316569	2017-02-27 13:54:34.316569
17	Pago	2017-02-27 13:54:34.339778	2017-02-27 13:54:34.339778
18	Pais	2017-02-27 13:54:34.360368	2017-02-27 13:54:34.360368
19	Provincia	2017-02-27 13:54:34.384946	2017-02-27 13:54:34.384946
20	Proyecto	2017-02-27 13:54:34.406612	2017-02-27 13:54:34.406612
21	Rol	2017-02-27 13:54:34.428833	2017-02-27 13:54:34.428833
22	RolDeEmpleado	2017-02-27 13:54:34.450468	2017-02-27 13:54:34.450468
23	TipoDocumento	2017-02-27 13:54:34.473822	2017-02-27 13:54:34.473822
24	TipoDePago	2017-02-27 13:54:34.494134	2017-02-27 13:54:34.494134
25	User	2017-02-27 13:54:34.516433	2017-02-27 13:54:34.516433
26	ActividadProyecto	2017-02-27 13:54:34.540148	2017-02-27 13:54:34.540148
27	CuotaPorCliente	2017-02-27 13:54:34.56106	2017-02-27 13:54:34.56106
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
1	Argentina	2017-02-27 13:54:24.864172	2017-02-27 13:54:24.864172
2	Paraguay	2017-02-27 13:54:25.060159	2017-02-27 13:54:25.060159
3	Brasil	2017-02-27 13:54:25.080518	2017-02-27 13:54:25.080518
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('paises_id_seq', 3, true);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY permisos (id, created_at, updated_at, accion_id, modelo_id) FROM stdin;
1	2017-02-27 13:54:34.627721	2017-02-27 13:54:34.627721	1	1
2	2017-02-27 13:54:34.658677	2017-02-27 13:54:34.658677	2	1
3	2017-02-27 13:54:34.679327	2017-02-27 13:54:34.679327	3	1
4	2017-02-27 13:54:34.702315	2017-02-27 13:54:34.702315	4	1
5	2017-02-27 13:54:34.726282	2017-02-27 13:54:34.726282	1	2
6	2017-02-27 13:54:34.748277	2017-02-27 13:54:34.748277	2	2
7	2017-02-27 13:54:34.769093	2017-02-27 13:54:34.769093	3	2
8	2017-02-27 13:54:34.791865	2017-02-27 13:54:34.791865	4	2
9	2017-02-27 13:54:34.814594	2017-02-27 13:54:34.814594	1	3
10	2017-02-27 13:54:34.837044	2017-02-27 13:54:34.837044	2	3
11	2017-02-27 13:54:34.859887	2017-02-27 13:54:34.859887	3	3
12	2017-02-27 13:54:34.881656	2017-02-27 13:54:34.881656	4	3
13	2017-02-27 13:54:34.903823	2017-02-27 13:54:34.903823	1	4
14	2017-02-27 13:54:34.926094	2017-02-27 13:54:34.926094	2	4
15	2017-02-27 13:54:34.947438	2017-02-27 13:54:34.947438	3	4
16	2017-02-27 13:54:34.969464	2017-02-27 13:54:34.969464	4	4
17	2017-02-27 13:54:34.992818	2017-02-27 13:54:34.992818	1	5
18	2017-02-27 13:54:35.059261	2017-02-27 13:54:35.059261	2	5
19	2017-02-27 13:54:35.115562	2017-02-27 13:54:35.115562	3	5
20	2017-02-27 13:54:35.226364	2017-02-27 13:54:35.226364	4	5
21	2017-02-27 13:54:35.24863	2017-02-27 13:54:35.24863	1	6
22	2017-02-27 13:54:35.269489	2017-02-27 13:54:35.269489	2	6
23	2017-02-27 13:54:35.291617	2017-02-27 13:54:35.291617	3	6
24	2017-02-27 13:54:35.315166	2017-02-27 13:54:35.315166	4	6
25	2017-02-27 13:54:35.337765	2017-02-27 13:54:35.337765	1	7
26	2017-02-27 13:54:35.359961	2017-02-27 13:54:35.359961	2	7
27	2017-02-27 13:54:35.382685	2017-02-27 13:54:35.382685	3	7
28	2017-02-27 13:54:35.483905	2017-02-27 13:54:35.483905	4	7
29	2017-02-27 13:54:35.51534	2017-02-27 13:54:35.51534	1	8
30	2017-02-27 13:54:35.536793	2017-02-27 13:54:35.536793	2	8
31	2017-02-27 13:54:35.582697	2017-02-27 13:54:35.582697	3	8
32	2017-02-27 13:54:35.603442	2017-02-27 13:54:35.603442	4	8
33	2017-02-27 13:54:35.63729	2017-02-27 13:54:35.63729	1	9
34	2017-02-27 13:54:35.658507	2017-02-27 13:54:35.658507	2	9
35	2017-02-27 13:54:35.691585	2017-02-27 13:54:35.691585	3	9
36	2017-02-27 13:54:35.714543	2017-02-27 13:54:35.714543	4	9
37	2017-02-27 13:54:35.748789	2017-02-27 13:54:35.748789	1	10
38	2017-02-27 13:54:35.769159	2017-02-27 13:54:35.769159	2	10
39	2017-02-27 13:54:35.792314	2017-02-27 13:54:35.792314	3	10
40	2017-02-27 13:54:35.81578	2017-02-27 13:54:35.81578	4	10
41	2017-02-27 13:54:35.837729	2017-02-27 13:54:35.837729	1	11
42	2017-02-27 13:54:35.859067	2017-02-27 13:54:35.859067	2	11
43	2017-02-27 13:54:35.881715	2017-02-27 13:54:35.881715	3	11
44	2017-02-27 13:54:35.903746	2017-02-27 13:54:35.903746	4	11
45	2017-02-27 13:54:35.926902	2017-02-27 13:54:35.926902	1	12
46	2017-02-27 13:54:35.948406	2017-02-27 13:54:35.948406	2	12
47	2017-02-27 13:54:35.971363	2017-02-27 13:54:35.971363	3	12
48	2017-02-27 13:54:35.992904	2017-02-27 13:54:35.992904	4	12
49	2017-02-27 13:54:36.014216	2017-02-27 13:54:36.014216	1	13
50	2017-02-27 13:54:36.039553	2017-02-27 13:54:36.039553	2	13
51	2017-02-27 13:54:36.069901	2017-02-27 13:54:36.069901	3	13
52	2017-02-27 13:54:36.091597	2017-02-27 13:54:36.091597	4	13
53	2017-02-27 13:54:36.237818	2017-02-27 13:54:36.237818	1	14
54	2017-02-27 13:54:36.293692	2017-02-27 13:54:36.293692	2	14
55	2017-02-27 13:54:36.326517	2017-02-27 13:54:36.326517	3	14
56	2017-02-27 13:54:36.34987	2017-02-27 13:54:36.34987	4	14
57	2017-02-27 13:54:36.382168	2017-02-27 13:54:36.382168	1	15
58	2017-02-27 13:54:36.403374	2017-02-27 13:54:36.403374	2	15
59	2017-02-27 13:54:36.426875	2017-02-27 13:54:36.426875	3	15
60	2017-02-27 13:54:36.448456	2017-02-27 13:54:36.448456	4	15
61	2017-02-27 13:54:36.471208	2017-02-27 13:54:36.471208	1	16
62	2017-02-27 13:54:36.492607	2017-02-27 13:54:36.492607	2	16
63	2017-02-27 13:54:36.515244	2017-02-27 13:54:36.515244	3	16
64	2017-02-27 13:54:36.537904	2017-02-27 13:54:36.537904	4	16
65	2017-02-27 13:54:36.559897	2017-02-27 13:54:36.559897	1	17
66	2017-02-27 13:54:36.581751	2017-02-27 13:54:36.581751	2	17
67	2017-02-27 13:54:36.60338	2017-02-27 13:54:36.60338	3	17
68	2017-02-27 13:54:36.626397	2017-02-27 13:54:36.626397	4	17
69	2017-02-27 13:54:36.647375	2017-02-27 13:54:36.647375	1	18
70	2017-02-27 13:54:36.670984	2017-02-27 13:54:36.670984	2	18
71	2017-02-27 13:54:36.693462	2017-02-27 13:54:36.693462	3	18
72	2017-02-27 13:54:36.714727	2017-02-27 13:54:36.714727	4	18
73	2017-02-27 13:54:36.737294	2017-02-27 13:54:36.737294	1	19
74	2017-02-27 13:54:36.758742	2017-02-27 13:54:36.758742	2	19
75	2017-02-27 13:54:36.78084	2017-02-27 13:54:36.78084	3	19
76	2017-02-27 13:54:36.804068	2017-02-27 13:54:36.804068	4	19
77	2017-02-27 13:54:36.826848	2017-02-27 13:54:36.826848	1	20
78	2017-02-27 13:54:36.848355	2017-02-27 13:54:36.848355	2	20
79	2017-02-27 13:54:36.870759	2017-02-27 13:54:36.870759	3	20
80	2017-02-27 13:54:36.893145	2017-02-27 13:54:36.893145	4	20
81	2017-02-27 13:54:36.914536	2017-02-27 13:54:36.914536	1	21
82	2017-02-27 13:54:36.938172	2017-02-27 13:54:36.938172	2	21
83	2017-02-27 13:54:36.96025	2017-02-27 13:54:36.96025	3	21
84	2017-02-27 13:54:36.982322	2017-02-27 13:54:36.982322	4	21
85	2017-02-27 13:54:37.004535	2017-02-27 13:54:37.004535	1	22
86	2017-02-27 13:54:37.026518	2017-02-27 13:54:37.026518	2	22
87	2017-02-27 13:54:37.048822	2017-02-27 13:54:37.048822	3	22
88	2017-02-27 13:54:37.072769	2017-02-27 13:54:37.072769	4	22
89	2017-02-27 13:54:37.091525	2017-02-27 13:54:37.091525	1	23
90	2017-02-27 13:54:37.114553	2017-02-27 13:54:37.114553	2	23
91	2017-02-27 13:54:37.137862	2017-02-27 13:54:37.137862	3	23
92	2017-02-27 13:54:37.15961	2017-02-27 13:54:37.15961	4	23
93	2017-02-27 13:54:37.182805	2017-02-27 13:54:37.182805	1	24
94	2017-02-27 13:54:37.203497	2017-02-27 13:54:37.203497	2	24
95	2017-02-27 13:54:37.226697	2017-02-27 13:54:37.226697	3	24
96	2017-02-27 13:54:37.248419	2017-02-27 13:54:37.248419	4	24
97	2017-02-27 13:54:37.269821	2017-02-27 13:54:37.269821	1	25
98	2017-02-27 13:54:37.292941	2017-02-27 13:54:37.292941	2	25
99	2017-02-27 13:54:37.315375	2017-02-27 13:54:37.315375	3	25
100	2017-02-27 13:54:37.337804	2017-02-27 13:54:37.337804	4	25
101	2017-02-27 13:54:37.359127	2017-02-27 13:54:37.359127	5	20
102	2017-02-27 13:54:37.382557	2017-02-27 13:54:37.382557	6	1
103	2017-02-27 13:54:37.403877	2017-02-27 13:54:37.403877	6	2
104	2017-02-27 13:54:37.42647	2017-02-27 13:54:37.42647	6	3
105	2017-02-27 13:54:37.448227	2017-02-27 13:54:37.448227	6	4
106	2017-02-27 13:54:37.471144	2017-02-27 13:54:37.471144	6	5
107	2017-02-27 13:54:37.493258	2017-02-27 13:54:37.493258	6	6
108	2017-02-27 13:54:37.514801	2017-02-27 13:54:37.514801	6	7
109	2017-02-27 13:54:37.53797	2017-02-27 13:54:37.53797	6	8
110	2017-02-27 13:54:37.560362	2017-02-27 13:54:37.560362	6	9
111	2017-02-27 13:54:37.582553	2017-02-27 13:54:37.582553	6	10
112	2017-02-27 13:54:37.603253	2017-02-27 13:54:37.603253	6	11
113	2017-02-27 13:54:37.625906	2017-02-27 13:54:37.625906	6	12
114	2017-02-27 13:54:37.64859	2017-02-27 13:54:37.64859	6	13
115	2017-02-27 13:54:37.670771	2017-02-27 13:54:37.670771	6	14
116	2017-02-27 13:54:37.693214	2017-02-27 13:54:37.693214	6	15
117	2017-02-27 13:54:37.715609	2017-02-27 13:54:37.715609	6	16
118	2017-02-27 13:54:37.737834	2017-02-27 13:54:37.737834	6	17
119	2017-02-27 13:54:37.759336	2017-02-27 13:54:37.759336	6	18
120	2017-02-27 13:54:37.782609	2017-02-27 13:54:37.782609	6	19
121	2017-02-27 13:54:37.803709	2017-02-27 13:54:37.803709	6	20
122	2017-02-27 13:54:37.826208	2017-02-27 13:54:37.826208	6	21
123	2017-02-27 13:54:37.848395	2017-02-27 13:54:37.848395	6	22
124	2017-02-27 13:54:37.871222	2017-02-27 13:54:37.871222	6	23
125	2017-02-27 13:54:37.893629	2017-02-27 13:54:37.893629	6	24
126	2017-02-27 13:54:37.915502	2017-02-27 13:54:37.915502	6	25
127	2017-02-27 13:54:37.93798	2017-02-27 13:54:37.93798	2	26
128	2017-02-27 13:54:37.959593	2017-02-27 13:54:37.959593	4	26
129	2017-02-27 13:54:37.982701	2017-02-27 13:54:37.982701	6	26
130	2017-02-27 13:54:38.003632	2017-02-27 13:54:38.003632	5	17
131	2017-02-27 13:54:38.02556	2017-02-27 13:54:38.02556	5	14
132	2017-02-27 13:54:38.048096	2017-02-27 13:54:38.048096	5	6
133	2017-02-27 13:54:38.069762	2017-02-27 13:54:38.069762	1	27
134	2017-02-27 13:54:38.093281	2017-02-27 13:54:38.093281	3	27
135	2017-02-27 13:54:38.11613	2017-02-27 13:54:38.11613	4	27
136	2017-02-27 13:54:38.137477	2017-02-27 13:54:38.137477	5	27
137	2017-02-27 13:54:38.160464	2017-02-27 13:54:38.160464	6	27
138	2017-02-27 13:54:38.181778	2017-02-27 13:54:38.181778	7	20
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
1	EMP-001	Ana	Canteros	36063076	1991-11-05	176	7141			4401604	valeriianaa@gmail.com	Empleado	2017-02-27 13:54:26.888019	2017-02-27 13:54:26.888019	1	1	1	1	5	\N	1	8
2	EMP-002	Martina	Quiñones	25147001	1974-05-06	Tereré	7302	4	B	4355987	martinaquinones@gmail.com	Empleado	2017-02-27 13:54:27.003859	2017-02-27 13:54:27.003859	1	1	1	1	4	\N	1	7
3	EMP-003	Alba	Perez	33880657	1986-10-17	Rivera	6872			459885	albaperez@gmail.com	Empleado	2017-02-27 13:54:27.138417	2017-02-27 13:54:27.138417	1	1	1	1	3	\N	1	4
4	EMP-004	Victor	Vazquez Valdez	33988307	1987-01-21	Tereré	1187			4456980	vvv@gmail.com	Empleado	2017-02-27 13:54:27.248612	2017-02-27 13:54:27.248612	1	1	1	1	2	\N	1	3
5	EMP-005	Zoe	Cyr	38187849	1995-06-08	Castilla	8299	10	15	4444176	zoecyr@gmail.com	Empleado	2017-02-27 13:54:27.37333	2017-02-27 13:54:27.37333	1	1	1	1	1	\N	1	2
6	EMP-006	Luis	Castro	22617493	1970-02-20	Av. Andalucia	7415	12	A	4255987	luiscastro@gmail.com	Empleado	2017-02-27 13:54:27.481748	2017-02-27 13:54:27.481748	1	1	1	1	4	\N	\N	7
7	ME-001	Daniela	Schneider	33976521	1987-12-19	Av. Sarmiento	8076	3	7	426924	danischneider@gmail.com	MiembroEquipo	2017-02-27 13:54:27.628055	2017-02-27 13:54:27.628055	1	1	2	2	\N	\N	1	\N
8	ME-002	Ines	Osterhagen	29717765	1981-11-30	Belgrano	4827			423722	inesosterhagen@gmail.com	MiembroEquipo	2017-02-27 13:54:27.734315	2017-02-27 13:54:27.734315	1	1	2	1	\N	\N	1	\N
9	ME-003	Miguel	Jablonski	34029649	1990-04-08	Los Llanos	9026	9	A	423761	migueljablonski@gmail.com	MiembroEquipo	2017-02-27 13:54:27.811678	2017-02-27 13:54:27.811678	1	1	2	1	\N	\N	1	\N
10	ME-004	Ernesto	Barrios Rincón	29441422	1980-05-16	Av. Ucrania	5206			423606	ernestobr@gmail.com	MiembroEquipo	2017-02-27 13:54:27.889019	2017-02-27 13:54:27.889019	1	1	2	1	\N	\N	1	\N
11	ME-005	Evelyn	Matos	20467791	1968-09-13	Paseo	6118			423649	evelynmatos@gmail.com	MiembroEquipo	2017-02-27 13:54:27.969961	2017-02-27 13:54:27.969961	1	1	2	1	\N	\N	1	\N
12	ME-006	David	Molina	20315192	1987-05-16	Alemania	4650	3	7	426924	davidmolina@gmail.com	MiembroEquipo	2017-02-27 13:54:28.056189	2017-02-27 13:54:28.056189	1	1	2	2	\N	\N	1	\N
13	ME-007	Gabriela	Garcia	40044940	1998-11-30	San Martín	1716			423722	gabigarcia@gmail.com	MiembroEquipo	2017-02-27 13:54:28.13464	2017-02-27 13:54:28.13464	1	1	2	1	\N	\N	1	\N
14	ME-008	Paola	Serrano	24603447	1976-04-08	Colon	2999	9	A	423761	paolaserrano@gmail.com	MiembroEquipo	2017-02-27 13:54:28.234172	2017-02-27 13:54:28.234172	1	1	2	1	\N	\N	1	\N
15	ME-009	Benito	Granados	36407952	1992-08-19	Floresta	7744			423606	benitogranados@gmail.com	MiembroEquipo	2017-02-27 13:54:28.31206	2017-02-27 13:54:28.31206	1	1	2	1	\N	\N	1	\N
16	ME-010	Mirtha	Benavidez	26435388	1976-06-05	Río Negro	1933	3	7	426924	mirthabenavidez@gmail.com	MiembroEquipo	2017-02-27 13:54:28.388734	2017-02-27 13:54:28.388734	1	1	2	2	\N	\N	1	\N
17	ME-011	Hugo	Ibarra	33428284	1989-09-04	Tigre	4839			423722	hugoibarra@gmail.com	MiembroEquipo	2017-02-27 13:54:28.466457	2017-02-27 13:54:28.466457	1	1	2	1	\N	\N	1	\N
18	ME-012	Thalia	Ocampo	31424518	1986-07-03	Altamirano	3662	9	A	423761	thaliaocampo@gmail.com	MiembroEquipo	2017-02-27 13:54:28.547537	2017-02-27 13:54:28.547537	1	1	2	1	\N	\N	1	\N
19	ME-013	Jose	Contreras	29767192	1981-04-09	3 de Febrero	2691			423606	josecontreras@gmail.com	MiembroEquipo	2017-02-27 13:54:28.638287	2017-02-27 13:54:28.638287	1	1	2	1	\N	\N	1	\N
20	ME-014	Mariangeles	Elizondo	36376423	1992-11-05	Alcorta	1214	3	7	426924	marelizondo@gmail.com	MiembroEquipo	2017-02-27 13:54:28.724152	2017-02-27 13:54:28.724152	1	1	2	2	\N	\N	1	\N
21	ME-015	Leonardo	Caballero Sosa	25370940	1975-07-23	Cte Izarduy	9123			423722	leocs@gmail.com	MiembroEquipo	2017-02-27 13:54:28.823946	2017-02-27 13:54:28.823946	1	1	2	1	\N	\N	1	\N
22	ME-016	Cintia	Rios	40651702	1998-01-13	Río Negro	1294	9	A	423761	cintiarios@gmail.com	MiembroEquipo	2017-02-27 13:54:28.912064	2017-02-27 13:54:28.912064	1	1	2	1	\N	\N	1	\N
23	ME-017	Ana	Heredia Maestas	27825263	1979-04-17	Constitución	9934			423606	anaherediamaestas@gmail.com	MiembroEquipo	2017-02-27 13:54:29.003766	2017-02-27 13:54:29.003766	1	1	2	1	\N	\N	1	\N
24	ME-018	Diana	Arevalo	36181611	1992-06-19	Inglaterra	1945	3	7	426924	dianaarevalo@gmail.com	MiembroEquipo	2017-02-27 13:54:29.088648	2017-02-27 13:54:29.088648	1	1	2	2	\N	\N	1	\N
25	ME-019	Rosa	Granados	30782514	1983-06-19	Floresta	7744			423722	rosagranados@gmail.com	MiembroEquipo	2017-02-27 13:54:29.181528	2017-02-27 13:54:29.181528	1	1	2	1	\N	\N	1	\N
26	ME-020	Abril	Palacios	39525733	1995-04-08	Av Cervantes	1844	9	A	423761	abrilpalacios@gmail.com	MiembroEquipo	2017-02-27 13:54:29.269024	2017-02-27 13:54:29.269024	1	1	2	1	\N	\N	1	\N
27	CO-001	María Rosa	Conti	25644132	1975-07-03	Ituzaingo	245	12	B	424568	mrconti@gmail.com	Contacto	2017-02-27 13:54:47.495583	2017-02-27 13:54:47.495583	1	1	1	1	\N	1	1	\N
28	CO-002	Berta	Rivera	33958772	1989-04-11	Leandro Gomez	5886	\N	\N	4598765	brivera@gmail.com	Contacto	2017-02-27 13:54:47.648098	2017-02-27 13:54:47.648098	1	1	1	1	\N	2	1	\N
29	CO-003	Juliana	Castiglione	30444512	1980-12-09	Brisas	3280	5	15	555321	jcastiglione@gmail.com	Contacto	2017-02-27 13:54:47.740745	2017-02-27 13:54:47.740745	1	1	1	1	\N	3	1	\N
30	CO-004	Nahuel	Estevez	19423568	1966-11-28	Av. Alta Gracia	5332	12	B	154632108	mrconti@gmail.com	Contacto	2017-02-27 13:54:47.840575	2017-02-27 13:54:47.840575	1	1	1	1	\N	4	1	\N
31	CO-005	Pablo	Gomez	25221305	1970-03-05	Neruda	7393	12	B	154245689	mrconti@gmail.com	Contacto	2017-02-27 13:54:47.935943	2017-02-27 13:54:47.935943	1	1	1	1	\N	5	1	\N
32	CO-006	Abigaíl	Coronado	37926793	1994-03-21	F. Varela	5659	12	B	432666	mrconti@gmail.com	Contacto	2017-02-27 13:54:48.041014	2017-02-27 13:54:48.041014	1	1	1	1	\N	6	1	\N
33	CO-007	Hilda	Zielinski	25334991	1970-04-07	Joaquin Suarez	6863	12	B	4478909	mrconti@gmail.com	Contacto	2017-02-27 13:54:48.137175	2017-02-27 13:54:48.137175	1	1	1	1	\N	7	1	\N
\.


--
-- Data for Name: personas_eventos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_eventos (id, created_at, updated_at, evento_id, persona_id) FROM stdin;
1	2017-02-27 17:20:12.887362	2017-02-27 17:20:12.887362	2	28
2	2017-02-27 17:20:12.897483	2017-02-27 17:20:12.897483	2	29
\.


--
-- Name: personas_eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_eventos_id_seq', 2, true);


--
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_id_seq', 33, true);


--
-- Data for Name: personas_proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY personas_proyectos (id, created_at, updated_at, proyecto_id, persona_id) FROM stdin;
1	2017-02-27 13:54:31.286223	2017-02-27 13:54:31.286223	1	7
2	2017-02-27 13:54:31.312721	2017-02-27 13:54:31.312721	1	2
3	2017-02-27 13:54:31.333498	2017-02-27 13:54:31.333498	2	2
4	2017-02-27 13:54:31.357308	2017-02-27 13:54:31.357308	2	8
5	2017-02-27 13:54:31.377908	2017-02-27 13:54:31.377908	2	9
6	2017-02-27 13:54:31.401361	2017-02-27 13:54:31.401361	3	6
7	2017-02-27 13:54:31.422858	2017-02-27 13:54:31.422858	3	10
8	2017-02-27 13:54:31.445879	2017-02-27 13:54:31.445879	3	11
9	2017-02-27 13:54:31.46744	2017-02-27 13:54:31.46744	4	6
10	2017-02-27 13:54:31.489902	2017-02-27 13:54:31.489902	4	12
11	2017-02-27 13:54:31.511407	2017-02-27 13:54:31.511407	4	13
12	2017-02-27 13:54:31.534788	2017-02-27 13:54:31.534788	5	2
13	2017-02-27 13:54:31.556815	2017-02-27 13:54:31.556815	5	14
14	2017-02-27 13:54:31.578623	2017-02-27 13:54:31.578623	5	15
15	2017-02-27 13:54:31.600899	2017-02-27 13:54:31.600899	6	2
16	2017-02-27 13:54:31.623816	2017-02-27 13:54:31.623816	6	16
17	2017-02-27 13:54:31.644781	2017-02-27 13:54:31.644781	6	17
18	2017-02-27 13:54:31.668286	2017-02-27 13:54:31.668286	6	19
19	2017-02-27 13:54:31.69055	2017-02-27 13:54:31.69055	7	6
20	2017-02-27 13:54:31.711962	2017-02-27 13:54:31.711962	7	18
21	2017-02-27 13:54:31.734955	2017-02-27 13:54:31.734955	7	20
22	2017-02-27 13:54:31.756254	2017-02-27 13:54:31.756254	8	2
23	2017-02-27 13:54:31.778621	2017-02-27 13:54:31.778621	8	21
24	2017-02-27 13:54:31.80186	2017-02-27 13:54:31.80186	9	6
25	2017-02-27 13:54:31.823314	2017-02-27 13:54:31.823314	9	22
26	2017-02-27 13:54:31.845943	2017-02-27 13:54:31.845943	9	23
27	2017-02-27 13:54:31.867652	2017-02-27 13:54:31.867652	10	2
28	2017-02-27 13:54:31.890369	2017-02-27 13:54:31.890369	10	24
29	2017-02-27 13:54:31.91254	2017-02-27 13:54:31.91254	10	25
30	2017-02-27 13:54:31.934221	2017-02-27 13:54:31.934221	10	26
\.


--
-- Name: personas_proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('personas_proyectos_id_seq', 30, true);


--
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY provincias (id, nombre, created_at, updated_at, pais_id) FROM stdin;
1	Misiones	2017-02-27 13:54:25.151242	2017-02-27 13:54:25.151242	1
2	Corrientes	2017-02-27 13:54:25.182775	2017-02-27 13:54:25.182775	1
3	Itapúa	2017-02-27 13:54:25.203704	2017-02-27 13:54:25.203704	2
4	Bahia	2017-02-27 13:54:25.225409	2017-02-27 13:54:25.225409	3
\.


--
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('provincias_id_seq', 4, true);


--
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY proyectos (id, codigo, nombre, descripcion, calle, "nroDomicilio", piso, dpto, telefono, email, "pagWeb", created_at, updated_at, pais_id, provincia_id, ciudad_id, etapa_id, area_id) FROM stdin;
1	PR-001	Pro Care, Jardines	Mantenimiento de jardines	176	7141			4465711	danischneider@gmail.com		2017-02-27 13:54:30.476132	2017-02-27 13:54:30.476132	1	1	1	1	1
2	PR-002	Trip -Drop, Turismo Solidario	Plataforma web de gestión de ayuda a distintos colectivos (colegios, orfanatos, comedores, residencias, tribus, comunidades, ONG, etc.) a través de viajeros con destino principal en países desfavorecidos. Busca conseguir que la ayuda directa que proporcionan los viajeros sea la adecuada y que llegue íntegra a quien la necesita. Sin aduanas, sin impuestos, sin intermediarios. Se intenta promover la sensibilización colectiva desde la experiencia individual.	Av. San Martin	3141			3758 423099	tripdrop@gmail.com	tripdrop.com	2017-02-27 13:54:30.563379	2017-02-27 13:54:30.563379	1	1	2	1	1
3	PR-003	Idea Sitios 	Diseño de páginas web	Mariano Moreno	8787			4465711	ideassitios@gmail.com	ideassitios.com	2017-02-27 13:54:30.639996	2017-02-27 13:54:30.639996	1	1	1	1	1
4	PR-004	Homie	Una plataforma online que permite al dueño de un inmueble determinar en 48 hs si una persona es confiable o no para alquilar dicho inmueble.	Alemania	4650			154991812	contacto@homie.com	homie.com	2017-02-27 13:54:30.721232	2017-02-27 13:54:30.721232	1	1	1	1	1
5	PR-005	Fondeadora	Una plataforma de crowdfunding	Colon 	700	1	1	4419768	fondeadora@gmail.com	fondeadora.com	2017-02-27 13:54:30.800004	2017-02-27 13:54:30.800004	1	1	1	1	1
6	PR-006	Obuu	Hemos desarrollado un método para optimizar el aprovisionamiento logístico mediante un software de preprocesado de datos con el que se pueden predecir las necesidades de stock de piezas de repuesto y herramientas en caso de avería.	Tigre 	500			4596063	obuu@gmail.com	obuu.com	2017-02-27 13:54:30.874478	2017-02-27 13:54:30.874478	1	1	1	1	1
7	PR-007	Odilo	Una plataforma que permite a las bibliotecas de todo el país prestar contenido digital.	Miami	790	12	A	459198	odilo@gmail.com	odilo.com	2017-02-27 13:54:30.95335	2017-02-27 13:54:30.95335	1	1	1	1	2
8	PR-008	eHumanLife	Una plataforma que permite pedir a través de videoconferencia una segunda opinión médica a los mejores especialistas con traducción simultánea especializada	Alemania	9123			154701859	ehumanlife@gmail.com	ehumanlife.com	2017-02-27 13:54:31.037788	2017-02-27 13:54:31.037788	1	1	1	1	1
9	PR-009	Endor nanotechnologies	Una startup de investigación médica que fabrica cosmética para regenerar la piel.	Inglaterra	1234			424063	endor@gmail.com	endor.com	2017-02-27 13:54:31.107786	2017-02-27 13:54:31.107786	1	1	1	1	1
10	PR-010	MedBravo	Software en la nube que quiere convertir a todos los hospitales del mundo en una red en la que pacientes, investigadores y oncólogos estén conectados y resulte fácil derivar enfermos a un ensayo clínico que pueda mejorar el pronóstico de pacientes con cancer.	Flores	704			479842	medbravo@gmail.com	medbravo.com	2017-02-27 13:54:31.189015	2017-02-27 13:54:31.189015	1	1	1	1	1
\.


--
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('proyectos_id_seq', 10, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles (id, nombre, created_at, updated_at) FROM stdin;
1	admin_empleados	2017-02-27 13:54:38.244488	2017-02-27 13:54:38.244488
2	super_admin	2017-02-27 13:54:38.269848	2017-02-27 13:54:38.269848
3	Encargado de Proyectos (mentor)	2017-02-27 13:54:38.293663	2017-02-27 13:54:38.293663
4	Miembro de Equipo	2017-02-27 13:54:38.315678	2017-02-27 13:54:38.315678
\.


--
-- Data for Name: roles_de_empleados; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY roles_de_empleados (id, nombre, created_at, updated_at, departamento_id) FROM stdin;
1	Encargado de nómina	2017-02-27 13:54:26.211807	2017-02-27 13:54:26.211807	1
2	Encargado de recaudaciones e ingresos	2017-02-27 13:54:26.307007	2017-02-27 13:54:26.307007	1
3	Jefe de Recursos Humanos	2017-02-27 13:54:26.361912	2017-02-27 13:54:26.361912	2
4	Jefe de mercadeo	2017-02-27 13:54:26.416278	2017-02-27 13:54:26.416278	3
5	jefe de producción	2017-02-27 13:54:26.472642	2017-02-27 13:54:26.472642	3
6	Investigación y desarrollo	2017-02-27 13:54:26.529099	2017-02-27 13:54:26.529099	4
7	Capacitación - Mentoring	2017-02-27 13:54:26.58435	2017-02-27 13:54:26.58435	4
8	Director General	2017-02-27 13:54:26.640162	2017-02-27 13:54:26.640162	5
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
1	DNI	2017-02-27 13:54:25.69901	2017-02-27 13:54:25.69901
2	Libreta de Enrolamiento	2017-02-27 13:54:25.727565	2017-02-27 13:54:25.727565
\.


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 2, true);


--
-- Data for Name: tipos_de_pago; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY tipos_de_pago (id, nombre, created_at, updated_at) FROM stdin;
\.


--
-- Name: tipos_de_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('tipos_de_pago_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, persona_id, rol_id) FROM stdin;
1	valeriianaa@gmail.com	$2a$11$IOIqTifJSSss5Ux4qvnwyet8eVOAXbLnDdygO/WWLL3gpl8eW7Bhu	\N	\N	\N	0	\N	\N	\N	\N	2017-02-27 13:54:39.064065	2017-02-27 13:54:39.064065	1	2
2	luiscastro@gmail.com	$2a$11$uFat0oc4vonnYiRH71Egde1ZjZ7jIQdFNyb9vLL0jOTtZfNhEJEFq	\N	\N	\N	0	\N	\N	\N	\N	2017-02-27 13:54:39.327638	2017-02-27 13:54:39.327638	6	3
3	mq@gmail.com	$2a$11$ozq2DVoT.jkbDsKalmbklOAtl6RElAHDuglwK0D/RVIinX/hIa2.m	\N	\N	\N	0	\N	\N	\N	\N	2017-02-27 13:54:39.60316	2017-02-27 13:54:39.60316	2	1
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ana
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Data for Name: vencimientos; Type: TABLE DATA; Schema: public; Owner: ana
--

COPY vencimientos (id, fecha, created_at, updated_at, concepto_de_pago_id, interes_id) FROM stdin;
1	2017-01-10	2017-02-27 13:54:40.962354	2017-02-27 13:54:40.962354	1	1
2	2017-01-20	2017-02-27 13:54:40.982239	2017-02-27 13:54:40.982239	1	1
3	2017-02-10	2017-02-27 13:54:41.004867	2017-02-27 13:54:41.004867	2	1
4	2017-02-20	2017-02-27 13:54:41.026352	2017-02-27 13:54:41.026352	2	1
5	2017-03-10	2017-02-27 13:54:41.048966	2017-02-27 13:54:41.048966	3	1
6	2017-03-20	2017-02-27 13:54:41.071608	2017-02-27 13:54:41.071608	3	1
7	2017-04-10	2017-02-27 13:54:41.0938	2017-02-27 13:54:41.0938	4	1
8	2017-04-20	2017-02-27 13:54:41.116372	2017-02-27 13:54:41.116372	4	1
9	2017-05-10	2017-02-27 13:54:41.138333	2017-02-27 13:54:41.138333	5	1
10	2017-05-20	2017-02-27 13:54:41.159366	2017-02-27 13:54:41.159366	5	1
11	2017-06-10	2017-02-27 13:54:41.181903	2017-02-27 13:54:41.181903	6	1
12	2017-06-20	2017-02-27 13:54:41.205309	2017-02-27 13:54:41.205309	6	1
13	2017-07-10	2017-02-27 13:54:41.22619	2017-02-27 13:54:41.22619	7	1
14	2017-07-10	2017-02-27 13:54:41.248685	2017-02-27 13:54:41.248685	7	1
15	2017-08-10	2017-02-27 13:54:41.294863	2017-02-27 13:54:41.294863	8	1
16	2017-08-10	2017-02-27 13:54:41.326824	2017-02-27 13:54:41.326824	8	1
17	2017-09-10	2017-02-27 13:54:41.350262	2017-02-27 13:54:41.350262	9	1
18	2017-09-20	2017-02-27 13:54:41.371144	2017-02-27 13:54:41.371144	9	1
19	2017-10-10	2017-02-27 13:54:41.394731	2017-02-27 13:54:41.394731	10	1
20	2017-10-20	2017-02-27 13:54:41.415788	2017-02-27 13:54:41.415788	10	1
21	2017-11-10	2017-02-27 13:54:41.438534	2017-02-27 13:54:41.438534	11	1
22	2017-11-20	2017-02-27 13:54:41.461274	2017-02-27 13:54:41.461274	11	1
23	2017-12-10	2017-02-27 13:54:41.48194	2017-02-27 13:54:41.48194	12	1
24	2017-12-10	2017-02-27 13:54:41.504338	2017-02-27 13:54:41.504338	12	1
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

