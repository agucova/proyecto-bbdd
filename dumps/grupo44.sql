--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg20.04+1+b1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aerodromo; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.aerodromo (
    aerodromo_id integer NOT NULL,
    nombre character varying(256),
    codigo_icao character varying(4),
    codigo_iata character varying(3),
    latitud numeric(9,6),
    longitud numeric(9,6),
    "Ciudad.ciudad_id" integer
);


ALTER TABLE public.aerodromo OWNER TO grupo44;

--
-- Name: aerodromo_aerodromo_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.aerodromo_aerodromo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aerodromo_aerodromo_id_seq OWNER TO grupo44;

--
-- Name: aerodromo_aerodromo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.aerodromo_aerodromo_id_seq OWNED BY public.aerodromo.aerodromo_id;


--
-- Name: aeronave; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.aeronave (
    id_aeronave integer NOT NULL,
    nombre_aeronave character varying(256),
    codigo_aeronave character varying(7),
    modelo_aeronave character varying(40),
    peso_aeronave numeric(8,3)
);


ALTER TABLE public.aeronave OWNER TO grupo44;

--
-- Name: aeronave_id_aeronave_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.aeronave_id_aeronave_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aeronave_id_aeronave_seq OWNER TO grupo44;

--
-- Name: aeronave_id_aeronave_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.aeronave_id_aeronave_seq OWNED BY public.aeronave.id_aeronave;


--
-- Name: arribo; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.arribo (
    operacion_id integer NOT NULL,
    "FPL.fpl_id" integer,
    fecha_arribo timestamp without time zone,
    "Pista.id_pista_arribo" integer,
    "Puerto_Embarque.id_puerto_embarque_arribo" integer,
    "Aeronave.id_aeronave" integer
);


ALTER TABLE public.arribo OWNER TO grupo44;

--
-- Name: arribo_operacion_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.arribo_operacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arribo_operacion_id_seq OWNER TO grupo44;

--
-- Name: arribo_operacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.arribo_operacion_id_seq OWNED BY public.arribo.operacion_id;


--
-- Name: certificado_aeronave; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.certificado_aeronave (
    certificado_id integer NOT NULL,
    "Aeronave.id_aeronave" integer,
    fecha_habilitacion timestamp without time zone,
    fecha_termino timestamp without time zone
);


ALTER TABLE public.certificado_aeronave OWNER TO grupo44;

--
-- Name: certificado_aeronave_certificado_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.certificado_aeronave_certificado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificado_aeronave_certificado_id_seq OWNER TO grupo44;

--
-- Name: certificado_aeronave_certificado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.certificado_aeronave_certificado_id_seq OWNED BY public.certificado_aeronave.certificado_id;


--
-- Name: certificado_piloto; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.certificado_piloto (
    certificado_id integer NOT NULL,
    fecha_habilitacion timestamp without time zone,
    fecha_termino timestamp without time zone,
    categoria character varying(40),
    "Piloto.pasaporte" character varying(9)
);


ALTER TABLE public.certificado_piloto OWNER TO grupo44;

--
-- Name: certificado_piloto_certificado_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.certificado_piloto_certificado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificado_piloto_certificado_id_seq OWNER TO grupo44;

--
-- Name: certificado_piloto_certificado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.certificado_piloto_certificado_id_seq OWNED BY public.certificado_piloto.certificado_id;


--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.ciudad (
    ciudad_id integer NOT NULL,
    nombre_ciudad character varying(256),
    "pais.pais_id" integer
);


ALTER TABLE public.ciudad OWNER TO grupo44;

--
-- Name: ciudad_ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.ciudad_ciudad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_ciudad_id_seq OWNER TO grupo44;

--
-- Name: ciudad_ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.ciudad_ciudad_id_seq OWNED BY public.ciudad.ciudad_id;


--
-- Name: compania_aerea; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.compania_aerea (
    id_compania integer NOT NULL,
    codigo_compania character varying(3),
    nombre_compania character varying(256)
);


ALTER TABLE public.compania_aerea OWNER TO grupo44;

--
-- Name: compania_aerea_id_compania_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.compania_aerea_id_compania_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compania_aerea_id_compania_seq OWNER TO grupo44;

--
-- Name: compania_aerea_id_compania_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.compania_aerea_id_compania_seq OWNED BY public.compania_aerea.id_compania;


--
-- Name: despegue; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.despegue (
    operacion_id integer NOT NULL,
    "FPL.fpl_id" integer,
    fecha_despegue timestamp without time zone,
    "Pista.id_pista_despegue" integer,
    "Puerto_Embarque.id_puerto_embarque_despegue" integer,
    "Aeronave.id_aeronave" integer
);


ALTER TABLE public.despegue OWNER TO grupo44;

--
-- Name: despegue_operacion_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.despegue_operacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.despegue_operacion_id_seq OWNER TO grupo44;

--
-- Name: despegue_operacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.despegue_operacion_id_seq OWNED BY public.despegue.operacion_id;


--
-- Name: fpl; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.fpl (
    fpl_id integer NOT NULL,
    "FPL_Propuesta.propuesta_vuelo_id" integer,
    estado character varying(9),
    codigo character varying(7),
    fecha_salida timestamp without time zone,
    fecha_llegada timestamp without time zone,
    "Aerodromo.aerodromo_salida_id" integer,
    "Aerodromo.aerodromo_llegada_id" integer,
    fecha_envio_propuesta timestamp without time zone,
    "Ruta.ruta_id" integer,
    velocidad numeric(5,2),
    altitud numeric(7,2),
    tipo_vuelo character varying(20),
    max_pasajeros integer,
    realizado character varying(20),
    "Piloto.pasaporte_piloto" character varying(9),
    "Piloto.pasaporte_copiloto" character varying(9),
    "Compania_Aerea.id_compania" integer,
    "Aeronave.id_aeronave" integer
);


ALTER TABLE public.fpl OWNER TO grupo44;

--
-- Name: fpl_fpl_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.fpl_fpl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fpl_fpl_id_seq OWNER TO grupo44;

--
-- Name: fpl_fpl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.fpl_fpl_id_seq OWNED BY public.fpl.fpl_id;


--
-- Name: fpl_propuesta; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.fpl_propuesta (
    propuesta_vuelo_id integer NOT NULL,
    estado character varying(9),
    codigo character varying(7),
    fecha_salida timestamp without time zone,
    fecha_llegada timestamp without time zone,
    "Aerodromo.aerodromo_salida_id" integer,
    "Aerodromo.aerodromo_llegada_id" integer,
    fecha_envio_propuesta timestamp without time zone,
    "Compania_Aerea.id_compania" integer,
    "Aeronave.id_aeronave" integer
);


ALTER TABLE public.fpl_propuesta OWNER TO grupo44;

--
-- Name: fpl_propuesta_propuesta_vuelo_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.fpl_propuesta_propuesta_vuelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fpl_propuesta_propuesta_vuelo_id_seq OWNER TO grupo44;

--
-- Name: fpl_propuesta_propuesta_vuelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.fpl_propuesta_propuesta_vuelo_id_seq OWNED BY public.fpl_propuesta.propuesta_vuelo_id;


--
-- Name: pais; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.pais (
    pais_id integer NOT NULL,
    nombre_pais character varying(256)
);


ALTER TABLE public.pais OWNER TO grupo44;

--
-- Name: pais_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.pais_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_pais_id_seq OWNER TO grupo44;

--
-- Name: pais_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.pais_pais_id_seq OWNED BY public.pais.pais_id;


--
-- Name: piloto; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.piloto (
    pasaporte character varying(9) NOT NULL
);


ALTER TABLE public.piloto OWNER TO grupo44;

--
-- Name: pista; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.pista (
    pista_id integer NOT NULL,
    codigo_pista character varying(3),
    "Aerodromo.aerodromo_id" integer
);


ALTER TABLE public.pista OWNER TO grupo44;

--
-- Name: pista_pista_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.pista_pista_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pista_pista_id_seq OWNER TO grupo44;

--
-- Name: pista_pista_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.pista_pista_id_seq OWNED BY public.pista.pista_id;


--
-- Name: puerto_embarque; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.puerto_embarque (
    puerto_embarque_id integer NOT NULL,
    codigo_puerto_embarque character varying(3),
    "Aerodromo.aerodromo_id" integer
);


ALTER TABLE public.puerto_embarque OWNER TO grupo44;

--
-- Name: puerto_embarque_puerto_embarque_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.puerto_embarque_puerto_embarque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.puerto_embarque_puerto_embarque_id_seq OWNER TO grupo44;

--
-- Name: puerto_embarque_puerto_embarque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.puerto_embarque_puerto_embarque_id_seq OWNED BY public.puerto_embarque.puerto_embarque_id;


--
-- Name: punto; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.punto (
    id_punto integer NOT NULL,
    nombre_punto character varying(30),
    latitud numeric(9,6),
    longitud numeric(9,6)
);


ALTER TABLE public.punto OWNER TO grupo44;

--
-- Name: punto_id_punto_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.punto_id_punto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.punto_id_punto_seq OWNER TO grupo44;

--
-- Name: punto_id_punto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.punto_id_punto_seq OWNED BY public.punto.id_punto;


--
-- Name: puntos_ruta; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.puntos_ruta (
    "Ruta.ruta_id" integer NOT NULL,
    cardinalidad integer NOT NULL,
    "Punto.id_punto" integer
);


ALTER TABLE public.puntos_ruta OWNER TO grupo44;

--
-- Name: ruta; Type: TABLE; Schema: public; Owner: grupo44
--

CREATE TABLE public.ruta (
    ruta_id integer NOT NULL,
    nombre_ruta character varying(30)
);


ALTER TABLE public.ruta OWNER TO grupo44;

--
-- Name: ruta_ruta_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo44
--

CREATE SEQUENCE public.ruta_ruta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruta_ruta_id_seq OWNER TO grupo44;

--
-- Name: ruta_ruta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo44
--

ALTER SEQUENCE public.ruta_ruta_id_seq OWNED BY public.ruta.ruta_id;


--
-- Name: aerodromo aerodromo_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.aerodromo ALTER COLUMN aerodromo_id SET DEFAULT nextval('public.aerodromo_aerodromo_id_seq'::regclass);


--
-- Name: aeronave id_aeronave; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.aeronave ALTER COLUMN id_aeronave SET DEFAULT nextval('public.aeronave_id_aeronave_seq'::regclass);


--
-- Name: arribo operacion_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.arribo ALTER COLUMN operacion_id SET DEFAULT nextval('public.arribo_operacion_id_seq'::regclass);


--
-- Name: certificado_aeronave certificado_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.certificado_aeronave ALTER COLUMN certificado_id SET DEFAULT nextval('public.certificado_aeronave_certificado_id_seq'::regclass);


--
-- Name: certificado_piloto certificado_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.certificado_piloto ALTER COLUMN certificado_id SET DEFAULT nextval('public.certificado_piloto_certificado_id_seq'::regclass);


--
-- Name: ciudad ciudad_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN ciudad_id SET DEFAULT nextval('public.ciudad_ciudad_id_seq'::regclass);


--
-- Name: compania_aerea id_compania; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.compania_aerea ALTER COLUMN id_compania SET DEFAULT nextval('public.compania_aerea_id_compania_seq'::regclass);


--
-- Name: despegue operacion_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.despegue ALTER COLUMN operacion_id SET DEFAULT nextval('public.despegue_operacion_id_seq'::regclass);


--
-- Name: fpl fpl_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl ALTER COLUMN fpl_id SET DEFAULT nextval('public.fpl_fpl_id_seq'::regclass);


--
-- Name: fpl_propuesta propuesta_vuelo_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl_propuesta ALTER COLUMN propuesta_vuelo_id SET DEFAULT nextval('public.fpl_propuesta_propuesta_vuelo_id_seq'::regclass);


--
-- Name: pais pais_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.pais ALTER COLUMN pais_id SET DEFAULT nextval('public.pais_pais_id_seq'::regclass);


--
-- Name: pista pista_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.pista ALTER COLUMN pista_id SET DEFAULT nextval('public.pista_pista_id_seq'::regclass);


--
-- Name: puerto_embarque puerto_embarque_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.puerto_embarque ALTER COLUMN puerto_embarque_id SET DEFAULT nextval('public.puerto_embarque_puerto_embarque_id_seq'::regclass);


--
-- Name: punto id_punto; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.punto ALTER COLUMN id_punto SET DEFAULT nextval('public.punto_id_punto_seq'::regclass);


--
-- Name: ruta ruta_id; Type: DEFAULT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.ruta ALTER COLUMN ruta_id SET DEFAULT nextval('public.ruta_ruta_id_seq'::regclass);


--
-- Data for Name: aerodromo; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.aerodromo (aerodromo_id, nombre, codigo_icao, codigo_iata, latitud, longitud, "Ciudad.ciudad_id") FROM stdin;
71	Aeropuerto Internacional de Nueva York	XSAM	WHO	89.800000	171.200000	22
11	Aeropuerto Internacional John F. Kennedy	FOLH	CKR	18.100000	123.400000	22
57	Aeropuerto de Milan-Malpensa	TCGF	SPT	70.100000	56.300000	19
55	Aeropuerto de Roma-Fiumicino	TBJM	SFF	157.200000	26.700000	25
37	Aeropuerto Internacional Ben Gurion	NZTP	KZN	159.300000	167.200000	32
27	Aeropuerto Internacional de El Cairo	KZZS	HRV	103.800000	107.600000	9
73	Aeropuerto Internacional de Copiapo	XSZW	WKT	92.200000	129.600000	27
75	Aeropuerto Big Apple	YHEP	YGY	43.000000	118.100000	22
33	Aeropuerto Internacional de Pekin	NBMQ	JTM	133.500000	57.900000	3
45	Aeropuerto de Amsterdam-Schiphol	RCQR	OHI	37.100000	60.900000	0
65	Aeropuerto Internacional de Maiquetia Simon Bolivar	VBIT	UYL	144.000000	165.700000	6
41	Aeropuerto Internacional de Icheon	PVOW	LMF	159.100000	71.900000	29
15	Aeropuerto Internacional de San Francisco	GPRK	DUU	45.100000	142.800000	26
69	Aeropuerto Internacional Ataturk	XOEY	VNN	104.000000	154.400000	10
25	Aeropuerto Internacional Kingsford Smith	KMPW	HOX	22.500000	59.400000	31
67	Aeropuerto de Ibiza	XEWM	VBH	156.800000	54.800000	12
61	Aeropuerto Internacional Eleftherios Venizelos	UQQX	TQV	72.400000	102.600000	1
21	Aeropuerto Internacional Toronto Pearson	IWJC	HKA	40.200000	41.800000	34
35	Aeropuerto Internacional Pudong	NZTG	KFE	153.900000	115.700000	30
13	Aeropuerto Internacional de Miami	GAWW	CPH	96.100000	8.400000	18
63	Aeropuerto Internacional Indira Gandhi	URLQ	UAU	149.900000	125.700000	21
3	Aeropuerto Internacional de Ezeiza	BVWK	BAH	14.700000	51.200000	4
59	Aeropuerto de Hong Kong	TQQZ	TEF	142.600000	4.100000	11
7	Aeropuerto Internacional de Galeao	EEGZ	BXS	6.800000	90.300000	24
43	Aeropuerto Internacional de Carrasco	PYIM	NVI	66.400000	148.000000	20
29	Aeropuerto de Adolfo Suarez Madrid-Barajas	MBOO	HSJ	54.200000	174.500000	16
17	Aeropuerto de la Ciudad de Londres	GSPA	EPM	152.500000	76.900000	15
49	Aeropuerto Internacional El Alto	SGWN	QJM	173.500000	5.600000	13
53	Aeropuerto Internacional Jorge Chavez	TAZY	RRK	62.200000	148.100000	14
51	Aeropuerto Internacional de la Ciudad del Cabo	SIMJ	RFP	47.400000	157.100000	8
19	Aeropuerto de Paris-Charles de Gaulle	HGZT	HCM	147.200000	49.600000	23
31	Aeropuerto Josep Tarradellas Barcelona-El Prat	MVPW	JIZ	52.700000	165.200000	2
23	Aeropuerto Internacional de Melbourne	JKRA	HNB	19.500000	53.900000	17
5	Aeropuerto Internacional de Sao Paulo-Guarulhos	DZFP	BKT	17.900000	177.800000	28
1	Aeropuerto Internacional Arturo Merino Benitez	BLFS	AWR	75.400000	106.500000	27
9	Aeropuerto Internacional O'Hare	FCJT	BYB	166.500000	51.000000	7
47	Aeropuerto Internacional de Cancun	SDSC	PKS	103.300000	99.400000	5
39	Aeropuerto Internacional de Haneda	PFXE	LCX	153.800000	40.200000	33
77	Aeropuerto Internacional de Australia	ZGUA	ZLQ	27.300000	111.100000	31
\.


--
-- Data for Name: aeronave; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.aeronave (id_aeronave, nombre_aeronave, codigo_aeronave, modelo_aeronave, peso_aeronave) FROM stdin;
22	Boeing KC-135	PMJDMNY	Stratotanker	44.663
10	Embraer E190	HEPBRIE	E190-AR	27.853
29	Boeing 737	VEMIWPS	737-800	41.415
24	Airbus A380	REBDPFN	A380-700	267.000
33	Boeing 747	YSLMIYD	747-300	178.100
11	Eurocopter EC725	HNRJJQB	Cougar Mk.II	5.505
27	Bombardier Global	RWDSNHW	Global 8000	24.630
17	Boeing C-17	LNHBEFA	Globemaster III	127.913
8	Airbus A380	FSFMKAE	A380-800	276.000
25	Embraer E175	RHVXKLV	E175-AR	21.906
30	Bombardier Global	WCRZZTI	Global 7500	27.987
20	Boeing 747	NLBYLJG	747-ER	184.600
18	Airbus A220	MRUIKBP	A220-300	37.081
16	Boeing 737	KYKNUTH	737-900ER	44.675
7	Boeing 737	ECWYCIG	737-700	38.150
14	Bombardier CRJ	JQLPBYZ	CRJ900	22.480
31	Airbus A380	WRAPXAO	A380 Prestige	282.000
6	Embraer E175	DTNMCIK	E175-LR	21.886
5	Embraer Legacy	CZAGBGC	Legacy 450	10.425
34	Boeing 737	ZQZKYVL	737-400	33.200
2	Boeing 737	BQIKFIC	737-600	36.380
19	Bombardier CRJ	NEWSDBH	CRJ700	20.509
32	Embraer Praetor	WYPTNLZ	Praetor 600	11.503
4	Embraer E190	CQRMLHT	E190-LR	27.753
0	Boeing 747	ALYMGWS	747-100	162.400
26	Embraer Legacy	RVWDIMC	Legacy 500	10.750
3	Embraer Praetor	CMUZMTA	Praetor 500	10.391
9	Embraer Phenom	GNTSGWH	300E	5.349
1	Boeing 747	AMJXYDC	747-200B	174.000
13	Boeing 747	HVKSCXU	747-400	178.750
23	Airbus A380	PNILCYN	A380-800F	252.000
21	Airbus A220	OJFBABA	A220-100	35.221
12	Airbus A350	HTJXZZO	A350-900	104.600
15	Boeing 737	KDFWVBZ	737-500	31.300
28	Boeing 737	TPUYDBP	737-200	28.120
\.


--
-- Data for Name: arribo; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.arribo (operacion_id, "FPL.fpl_id", fecha_arribo, "Pista.id_pista_arribo", "Puerto_Embarque.id_puerto_embarque_arribo", "Aeronave.id_aeronave") FROM stdin;
336	112	2022-06-09 20:32:00	151	225	33
150	50	2022-06-07 23:17:00	106	159	33
423	141	2022-05-23 19:30:00	123	185	33
219	73	2022-04-23 13:01:00	121	182	33
24	8	2022-05-18 15:29:00	152	233	33
480	160	2022-05-02 05:30:00	130	192	33
267	89	2022-06-21 15:10:00	144	216	9
651	217	2022-05-17 16:40:00	120	181	9
345	115	2022-06-25 17:20:00	142	214	9
48	16	2022-06-03 11:23:00	103	155	12
675	225	2022-05-25 13:24:00	120	185	12
648	216	2022-05-16 15:40:00	122	185	12
666	222	2022-05-22 13:00:00	122	184	12
222	74	2022-05-09 01:22:00	145	216	12
657	219	2022-05-19 13:40:00	122	181	12
576	192	2022-05-09 13:50:00	52	81	12
591	197	2022-04-14 19:12:00	116	172	12
540	180	2022-05-04 20:48:00	124	180	21
654	218	2022-05-18 14:40:00	122	180	21
258	86	2022-06-13 21:00:00	123	182	21
246	82	2022-06-07 16:03:00	124	185	21
261	87	2022-06-14 15:00:00	146	219	21
249	83	2022-06-08 20:03:00	147	217	21
435	145	2022-05-08 22:50:00	62	90	21
684	228	2022-05-02 10:19:00	131	192	21
207	69	2022-06-07 19:22:00	149	226	21
489	163	2022-06-17 18:53:00	154	229	30
75	25	2022-06-15 19:49:00	92	135	30
0	0	2022-05-29 03:11:00	124	180	30
186	62	2022-04-01 13:00:00	49	74	30
42	14	2022-05-18 21:33:00	103	153	11
450	150	2022-05-20 09:18:00	143	211	11
81	27	2022-05-15 21:12:00	133	203	11
315	105	2022-06-25 02:39:00	17	26	11
534	178	2022-05-14 16:00:00	75	112	6
669	223	2022-06-17 15:20:00	17	26	6
384	128	2022-06-18 23:34:00	121	180	6
141	47	2022-04-14 22:44:00	18	27	6
330	110	2022-06-20 12:08:00	120	180	24
333	111	2022-04-07 21:54:00	83	120	24
147	49	2022-04-10 22:23:00	131	197	24
102	34	2022-06-16 10:35:00	3	5	24
168	56	2022-05-20 11:15:00	116	173	24
192	64	2022-06-12 12:39:00	106	157	24
621	207	2022-06-18 19:32:00	65	100	24
303	101	2022-05-10 06:42:00	147	219	24
498	166	2022-06-25 18:27:00	5	6	24
354	118	2022-05-08 12:52:00	25	40	15
606	202	2022-04-22 08:09:00	93	139	15
711	237	2022-04-08 15:08:00	82	123	15
582	194	2022-05-31 12:50:00	129	196	15
600	200	2022-05-27 14:39:00	136	207	34
108	36	2022-06-24 17:53:00	65	101	34
21	7	2022-05-29 22:55:00	25	39	34
471	157	2022-06-07 14:03:00	121	185	34
693	231	2022-06-17 07:51:00	153	231	34
681	227	2022-05-01 15:20:00	122	182	34
210	70	2022-06-25 17:59:00	118	178	34
120	40	2022-05-21 14:18:00	101	150	34
93	31	2022-04-04 16:37:00	1	0	34
132	44	2022-04-22 12:11:00	142	212	28
9	3	2022-05-13 15:46:00	93	138	28
408	136	2022-05-08 12:22:00	62	95	28
459	153	2022-05-19 10:33:00	30	44	28
708	236	2022-05-24 23:37:00	114	172	28
327	109	2022-04-24 17:14:00	131	197	16
525	175	2022-04-17 17:22:00	34	53	16
546	182	2022-06-19 16:53:00	101	154	16
429	143	2022-06-01 13:11:00	32	45	16
255	85	2022-04-20 02:37:00	86	127	16
597	199	2022-04-15 02:07:00	90	132	25
198	66	2022-04-02 13:47:00	45	71	25
399	133	2022-04-03 16:22:00	17	26	25
405	135	2022-06-25 13:26:00	9	14	25
66	22	2022-06-14 16:55:00	118	175	25
564	188	2022-05-31 19:41:00	30	44	2
663	221	2022-05-22 13:30:00	124	185	2
585	195	2022-05-05 15:06:00	66	97	2
579	193	2022-04-06 14:41:00	43	65	2
30	10	2022-04-12 23:27:00	106	158	2
12	4	2022-05-01 11:19:00	63	90	2
213	71	2022-04-05 23:06:00	61	92	2
96	32	2022-04-07 21:56:00	66	101	20
57	19	2022-04-27 21:25:00	123	181	20
393	131	2022-06-17 11:47:00	35	48	20
156	52	2022-04-15 03:25:00	102	153	10
588	196	2022-04-16 19:04:00	20	33	10
516	172	2022-05-26 12:31:00	65	99	10
396	132	2022-06-20 16:50:00	46	71	18
252	84	2022-06-09 20:00:00	122	181	18
672	224	2022-05-24 13:20:00	123	181	18
639	213	2022-05-27 17:59:00	142	214	23
507	169	2022-05-15 22:21:00	94	138	23
444	148	2022-06-25 12:04:00	107	161	23
624	208	2022-04-11 09:29:00	124	180	23
369	123	2022-04-01 07:46:00	88	132	23
288	96	2022-04-25 23:14:00	89	132	23
6	2	2022-06-26 20:27:00	69	102	23
495	165	2022-04-06 10:10:00	46	71	1
84	28	2022-06-02 21:20:00	154	230	1
603	201	2022-05-31 18:42:00	20	35	1
36	12	2022-06-16 18:34:00	122	183	1
129	43	2022-05-02 23:52:00	27	38	1
264	88	2022-06-18 15:20:00	145	216	5
627	209	2022-06-17 16:40:00	145	216	5
240	80	2022-05-29 09:14:00	78	116	5
594	198	2022-05-03 07:46:00	41	61	5
378	126	2022-06-13 22:11:00	152	230	5
561	187	2022-05-11 10:55:00	1	4	5
729	243	2022-06-21 19:19:00	5	11	22
705	235	2022-05-27 18:29:00	30	44	22
699	233	2022-04-17 09:24:00	46	67	17
381	127	2022-05-07 11:55:00	62	94	17
414	138	2022-04-10 20:30:00	7	9	17
225	75	2022-06-16 05:19:00	142	215	8
18	6	2022-06-08 05:53:00	117	175	8
477	159	2022-04-03 21:58:00	142	212	8
426	142	2022-06-12 08:52:00	27	38	8
372	124	2022-04-20 10:17:00	0	3	32
360	120	2022-04-16 21:11:00	17	27	32
39	13	2022-05-10 19:18:00	81	125	32
294	98	2022-04-15 22:46:00	105	159	32
501	167	2022-04-21 11:38:00	10	12	32
375	125	2022-04-22 23:46:00	85	131	32
465	155	2022-06-01 23:06:00	145	216	4
612	204	2022-06-05 21:27:00	86	129	4
390	130	2022-06-06 18:31:00	66	97	4
321	107	2022-06-08 22:34:00	39	56	4
273	91	2022-05-01 06:27:00	77	116	4
348	116	2022-05-23 13:31:00	7	8	4
306	102	2022-04-04 11:05:00	145	218	4
720	240	2022-05-23 16:57:00	101	150	13
117	39	2022-04-14 19:34:00	136	206	13
504	168	2022-05-13 15:50:00	12	19	13
195	65	2022-04-15 17:22:00	121	182	13
15	5	2022-04-21 17:05:00	64	98	13
162	54	2022-04-21 12:29:00	93	143	13
723	241	2022-04-10 00:22:00	123	180	13
555	185	2022-04-13 21:15:00	116	169	13
702	234	2022-04-16 03:57:00	93	138	13
528	176	2022-04-19 23:28:00	132	193	13
135	45	2022-04-20 06:18:00	27	36	13
189	63	2022-04-20 20:55:00	110	166	13
234	78	2022-04-18 23:35:00	14	20	13
45	15	2022-05-16 23:14:00	1	2	0
78	26	2022-05-25 23:04:00	122	180	0
63	21	2022-05-07 07:47:00	137	204	0
279	93	2022-04-29 19:26:00	77	118	0
180	60	2022-06-03 23:35:00	126	190	31
558	186	2022-04-03 04:04:00	110	163	31
441	147	2022-04-28 17:11:00	1	4	31
72	24	2022-05-31 15:19:00	105	159	31
159	53	2022-06-24 10:34:00	146	216	31
714	238	2022-05-04 20:55:00	18	29	31
231	77	2022-06-09 00:22:00	124	182	3
687	229	2022-04-11 14:17:00	37	57	3
573	191	2022-05-26 05:47:00	126	190	3
27	9	2022-04-27 21:50:00	106	160	3
366	122	2022-04-05 15:36:00	31	45	3
717	239	2022-04-26 15:20:00	121	180	7
123	41	2022-06-16 15:47:00	11	14	7
165	55	2022-05-24 04:53:00	39	57	7
387	129	2022-04-19 12:45:00	130	197	7
144	48	2022-05-26 23:45:00	119	174	7
567	189	2022-05-02 17:29:00	98	146	19
522	174	2022-05-17 18:38:00	85	127	19
270	90	2022-05-05 15:36:00	105	157	19
33	11	2022-04-03 23:52:00	21	34	19
171	57	2022-05-22 22:41:00	63	93	19
99	33	2022-04-03 18:20:00	85	126	19
438	146	2022-05-09 18:06:00	110	165	19
447	149	2022-04-03 17:05:00	88	134	14
309	103	2022-05-18 05:46:00	17	27	14
696	232	2022-06-08 23:05:00	17	25	14
54	18	2022-04-19 16:23:00	19	31	14
177	59	2022-04-09 20:48:00	131	196	14
90	30	2022-05-24 02:49:00	78	116	26
357	119	2022-05-07 17:17:00	36	54	29
114	38	2022-05-26 22:45:00	18	26	29
519	173	2022-05-23 16:54:00	75	110	29
237	79	2022-05-06 06:45:00	135	198	29
\.


--
-- Data for Name: certificado_aeronave; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.certificado_aeronave (certificado_id, "Aeronave.id_aeronave", fecha_habilitacion, fecha_termino) FROM stdin;
4459	22	2022-02-20 00:00:00	2024-02-20 00:00:00
2387	22	2021-02-19 00:00:00	2023-02-19 00:00:00
3345	22	2023-02-21 00:00:00	2025-02-20 00:00:00
4826	10	2023-02-21 00:00:00	2025-02-20 00:00:00
487	10	2021-02-19 00:00:00	2023-02-19 00:00:00
4392	10	2022-02-20 00:00:00	2024-02-20 00:00:00
4421	29	2022-02-20 00:00:00	2024-02-20 00:00:00
1286	29	2023-02-21 00:00:00	2025-02-20 00:00:00
1106	29	2021-02-19 00:00:00	2023-02-19 00:00:00
123	24	2021-02-19 00:00:00	2023-02-19 00:00:00
4278	24	2022-02-20 00:00:00	2024-02-20 00:00:00
1427	24	2023-02-21 00:00:00	2025-02-20 00:00:00
1989	33	2023-02-21 00:00:00	2025-02-20 00:00:00
1175	33	2021-02-19 00:00:00	2023-02-19 00:00:00
186	33	2022-02-20 00:00:00	2024-02-20 00:00:00
1643	11	2022-02-20 00:00:00	2024-02-20 00:00:00
1419	11	2023-02-21 00:00:00	2025-02-20 00:00:00
3596	11	2021-02-19 00:00:00	2023-02-19 00:00:00
694	27	2023-02-21 00:00:00	2025-02-20 00:00:00
1018	27	2021-02-19 00:00:00	2023-02-19 00:00:00
2369	27	2022-02-20 00:00:00	2024-02-20 00:00:00
4030	17	2021-02-19 00:00:00	2023-02-19 00:00:00
3948	17	2023-02-21 00:00:00	2025-02-20 00:00:00
3247	17	2022-02-20 00:00:00	2024-02-20 00:00:00
2747	8	2022-02-20 00:00:00	2024-02-20 00:00:00
3506	8	2023-02-21 00:00:00	2025-02-20 00:00:00
2340	8	2021-02-19 00:00:00	2023-02-19 00:00:00
3815	25	2023-02-21 00:00:00	2025-02-20 00:00:00
3295	25	2022-02-20 00:00:00	2024-02-20 00:00:00
2722	25	2021-02-19 00:00:00	2023-02-19 00:00:00
4559	30	2022-02-20 00:00:00	2024-02-20 00:00:00
1761	30	2023-02-21 00:00:00	2025-02-20 00:00:00
2169	30	2021-02-19 00:00:00	2023-02-19 00:00:00
62	20	2022-02-20 00:00:00	2024-02-20 00:00:00
4804	20	2021-02-19 00:00:00	2023-02-19 00:00:00
483	20	2023-02-21 00:00:00	2025-02-20 00:00:00
422	18	2021-02-19 00:00:00	2023-02-19 00:00:00
1801	18	2022-02-20 00:00:00	2024-02-20 00:00:00
1886	18	2023-02-21 00:00:00	2025-02-20 00:00:00
1145	16	2023-02-21 00:00:00	2025-02-20 00:00:00
4600	16	2021-02-19 00:00:00	2023-02-19 00:00:00
215	16	2022-02-20 00:00:00	2024-02-20 00:00:00
4069	7	2021-02-19 00:00:00	2023-02-19 00:00:00
4306	7	2023-02-21 00:00:00	2025-02-20 00:00:00
3009	7	2022-02-20 00:00:00	2024-02-20 00:00:00
3236	14	2022-02-20 00:00:00	2024-02-20 00:00:00
3225	14	2023-02-21 00:00:00	2025-02-20 00:00:00
3989	14	2021-02-19 00:00:00	2023-02-19 00:00:00
3252	31	2022-02-20 00:00:00	2024-02-20 00:00:00
3667	31	2021-02-19 00:00:00	2023-02-19 00:00:00
1012	31	2023-02-21 00:00:00	2025-02-20 00:00:00
1086	6	2023-02-21 00:00:00	2025-02-20 00:00:00
3799	6	2021-02-19 00:00:00	2023-02-19 00:00:00
283	6	2022-02-20 00:00:00	2024-02-20 00:00:00
4720	5	2022-02-20 00:00:00	2024-02-20 00:00:00
529	5	2021-02-19 00:00:00	2023-02-19 00:00:00
3471	5	2023-02-21 00:00:00	2025-02-20 00:00:00
3829	34	2021-02-19 00:00:00	2023-02-19 00:00:00
3699	34	2022-02-20 00:00:00	2024-02-20 00:00:00
1723	34	2023-02-21 00:00:00	2025-02-20 00:00:00
849	2	2022-02-20 00:00:00	2024-02-20 00:00:00
3209	2	2021-02-19 00:00:00	2023-02-19 00:00:00
1807	2	2023-02-21 00:00:00	2025-02-20 00:00:00
3678	19	2022-02-20 00:00:00	2024-02-20 00:00:00
2548	19	2023-02-21 00:00:00	2025-02-20 00:00:00
4194	19	2021-02-19 00:00:00	2023-02-19 00:00:00
4002	32	2023-02-21 00:00:00	2025-02-20 00:00:00
4413	32	2021-02-19 00:00:00	2023-02-19 00:00:00
4294	32	2022-02-20 00:00:00	2024-02-20 00:00:00
2780	4	2023-02-21 00:00:00	2025-02-20 00:00:00
848	4	2022-02-20 00:00:00	2024-02-20 00:00:00
217	4	2021-02-19 00:00:00	2023-02-19 00:00:00
2695	0	2021-02-19 00:00:00	2023-02-19 00:00:00
4247	0	2022-02-20 00:00:00	2024-02-20 00:00:00
57	0	2023-02-21 00:00:00	2025-02-20 00:00:00
1220	26	2023-02-21 00:00:00	2025-02-20 00:00:00
361	26	2022-02-20 00:00:00	2024-02-20 00:00:00
428	26	2021-02-19 00:00:00	2023-02-19 00:00:00
2853	3	2023-02-21 00:00:00	2025-02-20 00:00:00
287	3	2022-02-20 00:00:00	2024-02-20 00:00:00
89	3	2021-02-19 00:00:00	2023-02-19 00:00:00
4751	9	2023-02-21 00:00:00	2025-02-20 00:00:00
3061	9	2021-02-19 00:00:00	2023-02-19 00:00:00
1096	9	2022-02-20 00:00:00	2024-02-20 00:00:00
4079	1	2022-02-20 00:00:00	2024-02-20 00:00:00
1809	1	2023-02-21 00:00:00	2025-02-20 00:00:00
3154	1	2021-02-19 00:00:00	2023-02-19 00:00:00
532	13	2023-02-21 00:00:00	2025-02-20 00:00:00
3802	13	2022-02-20 00:00:00	2024-02-20 00:00:00
1652	13	2021-02-19 00:00:00	2023-02-19 00:00:00
4674	23	2021-02-19 00:00:00	2023-02-19 00:00:00
1153	23	2022-02-20 00:00:00	2024-02-20 00:00:00
2573	23	2023-02-21 00:00:00	2025-02-20 00:00:00
829	21	2021-02-19 00:00:00	2023-02-19 00:00:00
2414	21	2022-02-20 00:00:00	2024-02-20 00:00:00
817	21	2023-02-21 00:00:00	2025-02-20 00:00:00
3256	12	2022-02-20 00:00:00	2024-02-20 00:00:00
206	12	2023-02-21 00:00:00	2025-02-20 00:00:00
2757	12	2021-02-19 00:00:00	2023-02-19 00:00:00
4652	15	2022-02-20 00:00:00	2024-02-20 00:00:00
4942	15	2023-02-21 00:00:00	2025-02-20 00:00:00
372	15	2021-02-19 00:00:00	2023-02-19 00:00:00
2134	28	2023-02-21 00:00:00	2025-02-20 00:00:00
4060	28	2022-02-20 00:00:00	2024-02-20 00:00:00
2785	28	2021-02-19 00:00:00	2023-02-19 00:00:00
\.


--
-- Data for Name: certificado_piloto; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.certificado_piloto (certificado_id, fecha_habilitacion, fecha_termino, categoria, "Piloto.pasaporte") FROM stdin;
19	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	G16561693
12	2020-06-17 00:00:00	2022-06-17 00:00:00	piloto privado	S26547035
13	2018-06-12 00:00:00	2020-06-11 00:00:00	piloto comercial	L01109034
49	2022-06-21 00:00:00	2024-06-21 00:00:00	piloto comercial	V51246373
29	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	F40422038
35	2020-06-18 00:00:00	2022-06-18 00:00:00	piloto comercial	B96464671
6	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	L01109034
30	2019-02-07 00:00:00	2021-02-06 00:00:00	piloto comercial	H50641909
20	2018-06-16 00:00:00	2020-06-15 00:00:00	piloto comercial	C02131672
40	2022-02-20 00:00:00	2024-02-20 00:00:00	piloto aviador militar	O88716397
14	2019-04-23 00:00:00	2021-04-22 00:00:00	piloto comercial	O88716397
11	2021-06-02 00:00:00	2023-06-02 00:00:00	piloto comercial	A35692355
5	2018-05-21 00:00:00	2020-05-20 00:00:00	piloto comercial	Q46419538
41	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto privado	C02131672
37	2020-09-08 00:00:00	2022-09-08 00:00:00	piloto comercial	L89163667
45	2021-06-01 00:00:00	2023-06-01 00:00:00	piloto comercial	J22810925
17	2021-02-19 00:00:00	2023-02-19 00:00:00	piloto privado	A85793465
47	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	E10934506
46	2020-06-17 00:00:00	2022-06-17 00:00:00	piloto comercial	S26547035
43	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto privado	L91489362
44	2020-12-25 00:00:00	2022-12-25 00:00:00	piloto privado	H06267236
34	2019-06-01 00:00:00	2021-05-31 00:00:00	piloto privado	J22810925
9	2018-05-20 00:00:00	2020-05-19 00:00:00	piloto comercial	Q49180524
16	2018-05-28 00:00:00	2020-05-27 00:00:00	piloto comercial	I74549867
2	2020-06-18 00:00:00	2022-06-18 00:00:00	piloto comercial	C02131672
22	2021-02-07 00:00:00	2023-02-07 00:00:00	piloto comercial	H50641909
21	2019-02-19 00:00:00	2021-02-18 00:00:00	piloto privado	A85793465
4	2018-06-08 00:00:00	2020-06-07 00:00:00	piloto comercial	V51246373
32	2020-06-18 00:00:00	2022-06-18 00:00:00	piloto aviador militar	L91489362
39	2018-05-19 00:00:00	2020-05-18 00:00:00	piloto privado	S26547035
50	2022-06-21 00:00:00	2024-06-21 00:00:00	piloto comercial	L01109034
8	2018-09-08 00:00:00	2020-09-07 00:00:00	piloto comercial	L89163667
33	2018-06-10 00:00:00	2020-06-09 00:00:00	piloto comercial	F40422038
51	2021-02-07 00:00:00	2023-02-07 00:00:00	piloto privado	H50641909
42	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	L91489362
15	2021-06-01 00:00:00	2023-06-01 00:00:00	piloto privado	J22810925
26	2020-12-25 00:00:00	2022-12-25 00:00:00	piloto aviador militar	H06267236
1	2019-04-06 00:00:00	2021-04-05 00:00:00	piloto comercial	O98651462
23	2019-06-02 00:00:00	2021-06-01 00:00:00	piloto comercial	A35692355
0	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	Q49180524
10	2018-06-11 00:00:00	2020-06-10 00:00:00	piloto comercial	G16561693
38	2018-05-25 00:00:00	2020-05-24 00:00:00	piloto comercial	B96464671
18	2018-06-15 00:00:00	2020-06-14 00:00:00	piloto privado	E10934506
28	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	I74549867
31	2021-04-23 00:00:00	2023-04-23 00:00:00	piloto comercial	O88716397
3	2018-05-26 00:00:00	2020-05-25 00:00:00	piloto aviador militar	L91489362
7	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	Q46419538
53	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	L91489362
25	2021-04-06 00:00:00	2023-04-06 00:00:00	piloto comercial	O98651462
27	2018-12-25 00:00:00	2020-12-24 00:00:00	piloto aviador militar	H06267236
48	2021-02-23 00:00:00	2023-02-23 00:00:00	piloto comercial	A85793465
52	2020-12-25 00:00:00	2022-12-25 00:00:00	piloto comercial	H06267236
24	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto comercial	V51246373
36	2020-06-19 00:00:00	2022-06-19 00:00:00	piloto privado	E10934506
\.


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.ciudad (ciudad_id, nombre_ciudad, "pais.pais_id") FROM stdin;
22	Nueva York	10
19	Milan	16
25	Roma	16
32	Tel Aviv	6
9	El Cairo	8
27	Santiago	5
3	Beijing	6
0	Amsterdam	19
6	Caracas	24
29	Seul	7
26	San Francisco	10
10	Estambul	22
31	Sidney	1
12	Ibiza	9
1	Atenas	12
34	Toronto	4
30	Shangai	6
18	Miami	10
21	Nueva Delhi	14
4	Buenos Aires	0
11	Hong Kong	13
24	Rio de Janeiro	3
20	Montevideo	23
16	Madrid	9
15	Londres	15
13	La Paz	2
14	Lima	20
8	Ciudad del Cabo	21
23	Paris	11
2	Barcelona	9
17	Melbourne	1
28	Sao Pablo	3
7	Chicago	10
5	Cancun	18
33	Tokio	17
\.


--
-- Data for Name: compania_aerea; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.compania_aerea (id_compania, codigo_compania, nombre_compania) FROM stdin;
14	LAW	LAW
17	COG	OCEANAIR
19	UAN	UNITED
8	LRC	LACSA
10	UCA	LATAM CARGO
0	ADC	AEROVIAS DAP (centro/norte)
13	LAT	LATAM INTER
6	KAI	KALITTA AIR
11	LUD	LATAM DOMESTICO
4	ETA	ETHOPIAN AIRLINES
18	QAF	QANTAS
12	XLE	LATAM ECUADOR
7	KEA	KOREAN AIR
16	NCY	NO_COMPANY
15	MPH	MARTINAIR HOLLAND
3	EAL	EASTERN AIRLINES
2	BTA	BRITISH
1	AZI	ALITALIA
5	IBE	IBERIA
9	LAM	LATAM ARGENTINA
\.


--
-- Data for Name: despegue; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.despegue (operacion_id, "FPL.fpl_id", fecha_despegue, "Pista.id_pista_despegue", "Puerto_Embarque.id_puerto_embarque_despegue", "Aeronave.id_aeronave") FROM stdin;
336	112	2022-06-09 11:37:00	0	2	33
150	50	2022-06-06 09:04:00	152	231	33
423	141	2022-05-23 19:15:00	60	84	33
219	73	2022-04-23 10:02:00	81	120	33
24	8	2022-05-18 03:14:00	89	137	33
480	160	2022-05-01 12:06:00	95	140	33
267	89	2022-06-21 12:00:00	0	3	9
651	217	2022-05-17 11:50:00	79	114	9
345	115	2022-06-24 04:11:00	151	224	9
48	16	2022-06-03 02:15:00	64	99	12
675	225	2022-05-25 10:44:00	78	119	12
648	216	2022-05-16 10:20:00	79	114	12
666	222	2022-05-22 10:00:00	81	124	12
222	74	2022-05-09 00:56:00	29	45	12
657	219	2022-05-19 11:20:00	91	137	12
576	192	2022-05-09 07:32:00	93	140	12
591	197	2022-04-14 18:14:00	118	178	12
540	180	2022-05-04 19:23:00	64	96	21
654	218	2022-05-18 10:50:00	80	121	21
258	86	2022-06-13 12:00:00	81	120	21
246	82	2022-06-06 17:38:00	141	211	21
261	87	2022-06-14 10:00:00	24	30	21
249	83	2022-06-08 17:30:00	142	212	21
435	145	2022-05-07 18:43:00	3	4	21
684	228	2022-05-02 09:51:00	45	69	21
207	69	2022-06-07 18:53:00	42	63	21
489	163	2022-06-16 17:22:00	64	96	30
75	25	2022-06-14 00:18:00	131	196	30
0	0	2022-05-29 01:50:00	119	175	30
186	62	2022-04-01 03:26:00	150	227	30
42	14	2022-05-18 04:59:00	77	119	11
450	150	2022-05-20 06:01:00	11	16	11
81	27	2022-05-15 02:40:00	63	90	11
315	105	2022-06-25 02:07:00	24	35	11
534	178	2022-05-13 09:46:00	78	119	6
669	223	2022-06-17 01:45:00	78	117	6
384	128	2022-06-17 23:32:00	75	112	6
141	47	2022-04-14 11:02:00	140	209	6
330	110	2022-06-19 05:56:00	77	117	24
333	111	2022-04-07 10:27:00	33	49	24
147	49	2022-04-10 13:03:00	132	196	24
102	34	2022-06-16 00:51:00	60	84	24
168	56	2022-05-20 05:57:00	60	86	24
192	64	2022-06-12 00:52:00	70	106	24
621	207	2022-06-18 18:52:00	68	105	24
303	101	2022-05-10 02:00:00	36	54	24
498	166	2022-06-25 12:01:00	59	85	24
354	118	2022-05-08 03:27:00	77	117	15
606	202	2022-04-22 06:15:00	10	16	15
711	237	2022-04-08 02:45:00	56	87	15
582	194	2022-05-31 05:08:00	100	145	15
600	200	2022-05-27 00:12:00	78	117	34
108	36	2022-06-24 13:41:00	96	146	34
21	7	2022-05-29 01:26:00	124	185	34
471	157	2022-06-07 11:02:00	131	194	34
693	231	2022-06-17 01:00:00	83	124	34
681	227	2022-04-30 19:06:00	74	112	34
210	70	2022-06-25 15:34:00	134	198	34
120	40	2022-05-21 04:36:00	6	9	34
93	31	2022-04-04 15:19:00	29	46	34
132	44	2022-04-21 13:35:00	78	117	28
9	3	2022-05-13 14:38:00	48	73	28
408	136	2022-05-08 08:04:00	123	180	28
459	153	2022-05-19 05:39:00	103	154	28
708	236	2022-05-23 03:22:00	54	83	28
327	109	2022-04-24 12:07:00	77	114	16
525	175	2022-04-17 06:50:00	125	190	16
546	182	2022-06-19 08:57:00	153	228	16
429	143	2022-06-01 09:01:00	107	159	16
255	85	2022-04-19 11:18:00	45	67	16
597	199	2022-04-15 01:23:00	79	114	25
198	66	2022-04-02 07:09:00	10	13	25
399	133	2022-04-03 10:52:00	58	87	25
405	135	2022-06-24 17:43:00	53	78	25
66	22	2022-06-14 09:42:00	13	21	25
564	188	2022-05-31 01:37:00	79	114	2
663	221	2022-05-21 11:30:00	83	124	2
585	195	2022-05-05 05:01:00	74	111	2
579	193	2022-04-06 06:52:00	142	215	2
30	10	2022-04-12 00:12:00	106	158	2
12	4	2022-04-30 12:29:00	52	81	2
213	71	2022-04-04 18:02:00	117	177	2
96	32	2022-04-07 13:09:00	79	114	20
57	19	2022-04-27 08:57:00	84	121	20
393	131	2022-06-16 04:02:00	66	100	20
156	52	2022-04-15 00:10:00	92	134	10
588	196	2022-04-16 07:33:00	22	30	10
516	172	2022-05-26 03:44:00	151	225	10
396	132	2022-06-20 08:48:00	99	146	18
252	84	2022-06-09 18:00:00	83	120	18
672	224	2022-05-24 10:40:00	84	125	18
639	213	2022-05-27 14:57:00	98	146	23
507	169	2022-05-14 05:54:00	34	51	23
444	148	2022-06-25 01:08:00	128	194	23
624	208	2022-04-10 15:15:00	114	173	23
369	123	2022-04-01 06:33:00	106	158	23
288	96	2022-04-24 16:15:00	82	122	23
6	2	2022-06-26 15:10:00	11	12	23
495	165	2022-04-06 04:03:00	50	73	1
84	28	2022-06-02 07:14:00	11	13	1
603	201	2022-05-31 16:00:00	56	88	1
36	12	2022-06-16 00:29:00	20	30	1
129	43	2022-05-02 14:17:00	88	132	1
264	88	2022-06-18 11:00:00	10	15	5
627	209	2022-06-17 16:10:00	82	120	5
240	80	2022-05-28 08:47:00	75	109	5
594	198	2022-05-03 07:19:00	143	215	5
378	126	2022-06-12 20:21:00	70	105	5
561	187	2022-05-10 21:13:00	69	104	5
729	243	2022-06-21 03:14:00	9	16	22
705	235	2022-05-27 12:51:00	63	90	22
699	233	2022-04-17 01:55:00	152	233	17
381	127	2022-05-07 11:26:00	100	147	17
414	138	2022-04-10 10:35:00	111	164	17
225	75	2022-06-16 03:31:00	153	233	8
18	6	2022-06-08 05:42:00	123	180	8
477	159	2022-04-03 03:32:00	142	214	8
426	142	2022-06-11 14:59:00	32	43	8
372	124	2022-04-20 02:16:00	35	49	32
360	120	2022-04-16 01:25:00	115	173	32
39	13	2022-05-10 11:15:00	67	103	32
294	98	2022-04-15 03:19:00	147	218	32
501	167	2022-04-21 00:18:00	95	143	32
375	125	2022-04-22 22:05:00	26	36	32
465	155	2022-06-01 08:38:00	35	49	4
612	204	2022-06-05 06:12:00	130	196	4
390	130	2022-06-06 01:17:00	133	202	4
321	107	2022-06-08 10:59:00	134	200	4
273	91	2022-04-30 07:57:00	133	201	4
348	116	2022-05-22 19:37:00	17	27	4
306	102	2022-04-04 00:11:00	93	142	4
720	240	2022-05-23 05:06:00	33	49	13
117	39	2022-04-14 12:54:00	123	185	13
504	168	2022-05-13 13:39:00	129	196	13
195	65	2022-04-15 09:36:00	83	123	13
15	5	2022-04-21 15:10:00	141	213	13
162	54	2022-04-21 00:37:00	143	213	13
723	241	2022-04-09 23:49:00	112	169	13
555	185	2022-04-13 01:11:00	143	215	13
702	234	2022-04-16 03:16:00	151	222	13
528	176	2022-04-19 19:49:00	53	80	13
135	45	2022-04-19 04:19:00	45	69	13
189	63	2022-04-20 07:54:00	15	22	13
234	78	2022-04-18 19:43:00	109	162	13
45	15	2022-05-16 22:10:00	35	51	0
78	26	2022-05-25 21:46:00	67	102	0
63	21	2022-05-07 07:09:00	148	226	0
279	93	2022-04-29 11:26:00	137	205	0
180	60	2022-06-03 06:46:00	121	185	31
558	186	2022-04-02 15:26:00	142	213	31
441	147	2022-04-27 20:26:00	33	50	31
72	24	2022-05-31 13:04:00	145	220	31
159	53	2022-06-24 08:27:00	53	82	31
714	238	2022-05-04 10:20:00	87	127	31
231	77	2022-06-09 00:15:00	56	84	3
687	229	2022-04-11 13:44:00	28	45	3
573	191	2022-05-26 05:15:00	134	202	3
27	9	2022-04-27 15:20:00	135	200	3
366	122	2022-04-04 07:10:00	18	28	3
717	239	2022-04-26 01:45:00	83	121	7
123	41	2022-06-16 00:06:00	112	171	7
165	55	2022-05-23 13:45:00	115	173	7
387	129	2022-04-18 02:42:00	17	27	7
144	48	2022-05-26 09:21:00	109	165	7
567	189	2022-05-02 03:59:00	142	213	19
522	174	2022-05-16 08:17:00	98	147	19
270	90	2022-05-05 11:22:00	1	4	19
33	11	2022-04-03 10:57:00	54	82	19
171	57	2022-05-22 12:12:00	118	176	19
99	33	2022-04-03 06:25:00	117	176	19
438	146	2022-05-09 04:07:00	94	139	19
447	149	2022-04-03 17:01:00	149	225	14
309	103	2022-05-18 04:16:00	20	34	14
696	232	2022-06-08 17:04:00	85	130	14
54	18	2022-04-19 15:09:00	85	127	14
177	59	2022-04-08 08:46:00	46	66	14
90	30	2022-05-23 17:17:00	98	149	26
357	119	2022-05-07 09:17:00	32	47	29
114	38	2022-05-26 05:52:00	40	65	29
519	173	2022-05-23 12:27:00	150	227	29
237	79	2022-05-06 06:22:00	4	8	29
\.


--
-- Data for Name: fpl; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.fpl (fpl_id, "FPL_Propuesta.propuesta_vuelo_id", estado, codigo, fecha_salida, fecha_llegada, "Aerodromo.aerodromo_salida_id", "Aerodromo.aerodromo_llegada_id", fecha_envio_propuesta, "Ruta.ruta_id", velocidad, altitud, tipo_vuelo, max_pasajeros, realizado, "Piloto.pasaporte_piloto", "Piloto.pasaporte_copiloto", "Compania_Aerea.id_compania", "Aeronave.id_aeronave") FROM stdin;
136	112	aceptado	LAW1451	2022-05-08 08:04:00	2022-05-08 12:22:00	61	31	2022-04-08 08:04:00	191	225.78	12478.26	comercial	56	realizado	O98651462	\N	14	28
153	125	aceptado	LAW9189	2022-05-19 05:39:00	2022-05-19 10:33:00	51	15	2022-04-19 05:39:00	111	239.99	12740.55	comercial	56	realizado	O98651462	A85793465	14	28
226	186	aceptado	UCA3459	2022-04-24 10:22:00	2022-04-24 16:51:00	73	9	2022-03-24 10:22:00	228	252.64	11725.10	comercial	56	no realizado	E10934506	\N	10	28
100	83	aceptado	KAI8425	2022-05-04 20:08:00	2022-05-04 20:30:00	27	3	2022-04-04 20:08:00	48	245.36	11999.41	comercial	56	no realizado	Q46419538	\N	6	28
156	128	pendiente	LRC1458	2022-04-22 08:08:00	2022-04-22 08:11:00	57	7	2022-03-22 08:08:00	35	257.43	12587.34	comercial	56	no realizado	J22810925	\N	8	28
236	192	aceptado	XLE4241	2022-05-23 03:22:00	2022-05-24 23:37:00	27	57	2022-04-23 03:22:00	194	277.81	10807.55	comercial	56	realizado	B96464671	\N	12	28
3	1	pendiente	ADC4277	2022-05-13 14:38:00	2022-05-13 15:46:00	25	47	2022-04-13 14:38:00	9	275.63	12947.04	comercial	56	no realizado	E10934506	\N	0	28
114	95	aceptado	LAM2243	2022-06-09 04:38:00	2022-06-10 10:45:00	65	45	2022-05-09 04:38:00	224	253.59	10389.27	comercial	56	no realizado	J22810925	\N	9	28
29	21	aceptado	BTA3276	2022-04-28 01:27:00	2022-04-28 14:25:00	53	51	2022-03-28 01:27:00	233	236.71	11560.45	comercial	44	no realizado	E10934506	\N	2	14
103	86	aceptado	KAI9172	2022-05-18 04:16:00	2022-05-18 05:46:00	11	9	2022-04-18 04:16:00	142	252.59	11903.64	comercial	44	realizado	A85793465	H50641909	6	14
149	122	aceptado	LAW7592	2022-04-03 17:01:00	2022-04-03 17:05:00	75	45	2022-03-03 17:01:00	87	234.51	10291.01	comercial	44	realizado	O98651462	\N	14	14
18	12	aceptado	AZI3471	2022-04-19 15:09:00	2022-04-19 16:23:00	43	11	2022-03-19 15:09:00	137	224.74	12244.11	comercial	44	realizado	Q49180524	\N	1	14
232	190	aceptado	XLE2673	2022-06-08 17:04:00	2022-06-08 23:05:00	43	9	2022-05-08 17:04:00	93	268.52	11751.88	comercial	44	realizado	B96464671	\N	12	14
145	118	aceptado	LAW5896	2022-05-07 18:43:00	2022-05-08 22:50:00	1	31	2022-04-07 18:43:00	72	251.16	10425.81	comercial	70	realizado	L01109034	\N	14	21
42	32	pendiente	COG1158	2022-06-25 00:09:00	2022-06-25 02:47:00	33	21	2022-05-25 00:09:00	40	258.23	12495.79	comercial	70	no realizado	O98651462	\N	17	21
83	68	aceptado	KAI2237	2022-06-08 17:30:00	2022-06-08 20:03:00	71	73	2022-05-08 17:30:00	71	276.33	12379.03	comercial	70	realizado	H50641909	Q46419538	6	21
69	56	aceptado	ETA8691	2022-06-07 18:53:00	2022-06-07 19:22:00	21	75	2022-05-07 18:53:00	122	229.53	11731.30	comercial	70	realizado	I74549867	J22810925	4	21
88	73	aceptado	KAI2457	2022-06-18 11:00:00	2022-06-18 15:20:00	5	73	2022-05-18 11:00:00	71	276.33	12379.03	comercial	70	realizado	H50641909	\N	6	21
86	71	aceptado	KAI2257	2022-06-13 12:00:00	2022-06-13 21:00:00	41	61	2022-05-13 12:00:00	71	276.33	12379.03	comercial	70	realizado	Q49180524	E10934506	6	21
228	188	pendiente	UCA7235	2022-05-02 09:51:00	2022-05-02 10:19:00	23	65	2022-04-02 09:51:00	43	275.63	11160.01	comercial	70	no realizado	E10934506	L89163667	10	21
104	87	rechazado	KAI9232	2022-04-23 17:59:00	2022-04-23 23:27:00	53	39	2022-03-23 17:59:00	45	234.43	12242.75	comercial	70	no realizado	E10934506	\N	6	21
87	72	aceptado	KAI2357	2022-06-14 10:00:00	2022-06-14 15:00:00	11	73	2022-05-13 10:00:00	71	276.33	12379.03	comercial	70	realizado	E10934506	H50641909	6	21
32	23	aceptado	BTA4764	2022-04-07 13:09:00	2022-04-07 21:56:00	39	33	2022-03-07 13:09:00	45	224.55	12737.25	comercial	70	realizado	Q46419538	\N	2	21
84	69	aceptado	KAI2247	2022-06-09 18:00:00	2022-06-09 20:00:00	41	61	2022-05-09 18:00:00	71	276.33	12379.03	comercial	70	realizado	E10934506	\N	6	21
82	67	aceptado	KAI2227	2022-06-06 17:38:00	2022-06-07 16:03:00	71	61	2022-05-06 17:38:00	71	276.33	12379.03	comercial	70	realizado	Q46419538	\N	6	21
207	169	aceptado	UAN2468	2022-06-18 18:52:00	2022-06-18 19:32:00	35	33	2022-05-18 18:52:00	214	222.52	10218.64	comercial	534	realizado	O88716397	\N	19	24
111	92	aceptado	KEA7139	2022-04-07 10:27:00	2022-04-07 21:54:00	17	41	2022-03-07 10:27:00	242	279.85	12260.46	comercial	534	realizado	O98651462	Q49180524	7	24
110	91	aceptado	KEA5763	2022-06-19 05:56:00	2022-06-20 12:08:00	39	61	2022-05-19 05:56:00	64	230.96	10137.99	comercial	534	realizado	O98651462	\N	7	24
154	126	aceptado	LAW9612	2022-05-25 06:09:00	2022-05-26 15:04:00	19	35	2022-04-25 06:09:00	221	262.91	11009.93	comercial	534	no realizado	A85793465	\N	14	24
166	135	aceptado	LRC9582	2022-06-25 12:01:00	2022-06-25 18:27:00	29	3	2022-05-25 12:01:00	100	259.08	12854.57	comercial	534	realizado	L89163667	J22810925	8	24
101	84	aceptado	KAI8523	2022-05-10 02:00:00	2022-05-10 06:42:00	19	73	2022-04-10 02:00:00	125	244.90	10233.88	comercial	534	realizado	H50641909	Q49180524	6	24
64	52	aceptado	ETA6487	2022-06-12 00:52:00	2022-06-12 12:39:00	35	53	2022-05-12 00:52:00	74	274.07	12089.87	comercial	534	realizado	L01109034	\N	4	24
56	46	aceptado	EAL8614	2022-05-20 05:57:00	2022-05-20 11:15:00	29	57	2022-04-20 05:57:00	179	242.02	11916.36	comercial	534	realizado	O88716397	S26547035	3	24
49	39	aceptado	COG7359	2022-04-10 13:03:00	2022-04-10 22:23:00	65	65	2022-03-10 13:03:00	106	258.51	11547.77	comercial	534	realizado	O98651462	H50641909	17	24
34	25	aceptado	BTA6437	2022-06-16 00:51:00	2022-06-16 10:35:00	29	1	2022-05-16 00:51:00	102	227.96	11926.58	comercial	534	realizado	F40422038	\N	2	24
160	131	aceptado	LRC4781	2022-05-01 12:06:00	2022-05-02 05:30:00	47	65	2022-04-01 12:06:00	43	249.21	10764.10	comercial	356	realizado	S26547035	V51246373	8	33
141	115	aceptado	LAW3477	2022-05-23 19:15:00	2022-05-23 19:30:00	29	61	2022-04-23 19:15:00	100	279.52	11261.99	comercial	356	realizado	V51246373	L01109034	14	33
73	60	aceptado	IBE2338	2022-04-23 10:02:00	2022-04-23 13:01:00	41	61	2022-03-23 10:02:00	137	239.31	10852.03	comercial	356	realizado	B96464671	G16561693	5	33
81	66	aceptado	KAI1864	2022-05-19 08:42:00	2022-05-19 09:16:00	29	73	2022-04-19 08:42:00	215	274.56	11799.59	comercial	356	no realizado	Q49180524	\N	6	33
176	144	aceptado	LUD7177	2022-04-19 19:49:00	2022-04-19 23:28:00	27	65	2022-03-19 19:49:00	258	248.59	11456.69	comercial	357	realizado	O88716397	C02131672	11	33
72	59	aceptado	IBE1653	2022-06-17 03:44:00	2022-06-17 19:57:00	31	19	2022-05-17 03:44:00	225	244.83	10328.73	comercial	356	no realizado	H50641909	\N	5	33
112	93	aceptado	KEA7963	2022-06-09 11:37:00	2022-06-09 20:32:00	1	75	2022-05-09 11:37:00	69	272.58	11010.78	comercial	356	realizado	O98651462	\N	7	33
121	101	pendiente	LAM9656	2022-05-06 16:33:00	2022-05-06 20:07:00	11	47	2022-04-06 16:33:00	3	272.04	11627.91	comercial	356	no realizado	A35692355	\N	9	33
50	40	aceptado	COG7539	2022-06-06 09:04:00	2022-06-07 23:17:00	77	53	2022-05-06 09:04:00	240	256.63	11859.02	comercial	356	realizado	A85793465	\N	17	33
8	6	aceptado	ADC9112	2022-05-18 03:14:00	2022-05-18 15:29:00	45	77	2022-04-18 03:14:00	199	229.17	12666.63	comercial	356	realizado	Q46419538	\N	0	33
179	147	pendiente	LUD9513	2022-04-01 07:02:00	2022-04-02 19:20:00	23	43	2022-03-01 07:02:00	30	242.29	10242.00	comercial	356	no realizado	J22810925	O88716397	11	33
205	168	aceptado	UAN1658	2022-04-07 11:18:00	2022-04-07 16:04:00	29	37	2022-03-07 11:18:00	230	256.07	12344.11	comercial	356	no realizado	C02131672	\N	19	33
206	\N	rechazado	UAN1938	2022-04-08 22:13:00	2022-04-08 23:56:00	65	27	\N	257	547.23	12080.67	privado	20	no realizado	A85793465	C02131672	\N	3
122	\N	aceptado	LAM9681	2022-04-04 07:10:00	2022-04-05 15:36:00	9	15	\N	306	552.02	10265.38	privado	20	realizado	S26547035	L91489362	\N	3
229	\N	aceptado	UCA9699	2022-04-11 13:44:00	2022-04-11 14:17:00	15	19	\N	237	489.35	12725.88	privado	20	realizado	E10934506	A85793465	\N	3
67	\N	rechazado	ETA7337	2022-06-10 05:14:00	2022-06-10 09:44:00	45	57	\N	283	585.57	10631.68	privado	20	no realizado	H06267236	\N	\N	3
22	\N	aceptado	AZI7128	2022-06-14 09:42:00	2022-06-14 16:55:00	7	59	\N	305	443.56	11476.29	privado	20	realizado	J22810925	\N	\N	3
162	\N	pendiente	LRC6215	2022-05-23 16:55:00	2022-05-23 20:32:00	5	13	\N	125	449.98	11664.65	privado	20	no realizado	H06267236	E10934506	\N	3
171	139	aceptado	LUD3851	2022-04-26 05:35:00	2022-04-26 11:05:00	67	47	2022-03-26 05:35:00	177	232.13	12957.77	comercial	209	no realizado	J22810925	\N	11	12
197	161	aceptado	NCY9851	2022-04-14 18:14:00	2022-04-14 19:12:00	59	57	2022-03-14 18:14:00	94	250.60	12028.69	comercial	209	realizado	V51246373	\N	16	12
180	148	aceptado	MPH1782	2022-05-04 19:23:00	2022-05-04 20:48:00	33	61	2022-04-04 19:23:00	115	248.49	12148.15	comercial	209	realizado	I74549867	V51246373	15	12
224	184	aceptado	UCA2799	2022-05-24 10:40:00	2022-05-24 13:20:00	41	61	2022-04-24 10:40:00	143	232.38	10529.93	comercial	209	realizado	E10934506	\N	10	12
217	177	aceptado	UCA2299	2022-05-17 11:50:00	2022-05-17 16:40:00	39	61	2022-04-17 11:50:00	143	232.38	10529.93	comercial	209	realizado	B96464671	\N	10	12
74	61	aceptado	IBE3388	2022-05-09 00:56:00	2022-05-09 01:22:00	15	73	2022-04-09 00:56:00	131	257.54	10064.59	comercial	209	realizado	S26547035	\N	5	12
225	185	aceptado	UCA2899	2022-05-25 10:44:00	2022-05-25 13:24:00	39	61	2022-04-25 10:44:00	143	232.38	10529.93	comercial	209	realizado	E10934506	J22810925	10	12
218	178	aceptado	UCA2399	2022-05-18 10:50:00	2022-05-18 14:40:00	41	61	2022-04-18 10:50:00	143	232.38	10529.93	comercial	209	realizado	L89163667	B96464671	10	12
192	156	aceptado	NCY5615	2022-05-09 07:32:00	2022-05-09 13:50:00	47	27	2022-04-09 07:32:00	246	243.14	11232.95	comercial	209	realizado	V51246373	L89163667	16	12
219	179	aceptado	UCA2499	2022-05-19 11:20:00	2022-05-19 13:40:00	45	61	2022-04-19 11:20:00	143	232.38	10529.93	comercial	209	realizado	E10934506	\N	10	12
216	176	aceptado	UCA2199	2022-05-16 10:20:00	2022-05-16 15:40:00	39	61	2022-04-16 10:20:00	143	232.38	10529.93	comercial	209	realizado	L89163667	E10934506	10	12
222	182	aceptado	UCA2699	2022-05-22 10:00:00	2022-05-22 13:00:00	41	61	2022-04-22 10:00:00	143	232.38	10529.93	comercial	209	realizado	B96464671	\N	10	12
139	114	pendiente	LAW2798	2022-04-08 12:12:00	2022-04-08 21:37:00	25	15	2022-03-08 12:12:00	10	254.79	10498.03	comercial	209	no realizado	O98651462	\N	14	12
123	102	aceptado	LAT1186	2022-04-01 06:33:00	2022-04-01 07:46:00	53	45	2022-03-01 06:33:00	75	231.87	11667.06	comercial	82	realizado	H06267236	Q49180524	13	29
211	171	pendiente	UAN4941	2022-06-24 00:42:00	2022-06-24 06:05:00	71	17	2022-05-24 00:42:00	27	259.13	11399.25	comercial	82	no realizado	O98651462	\N	19	29
38	28	aceptado	BTA6916	2022-05-26 05:52:00	2022-05-26 22:45:00	21	9	2022-04-26 05:52:00	161	238.93	12280.59	comercial	82	realizado	A85793465	\N	2	29
173	141	aceptado	LUD5927	2022-05-23 12:27:00	2022-05-23 16:54:00	75	37	2022-04-23 12:27:00	23	254.34	10001.41	comercial	82	realizado	G16561693	\N	11	29
79	65	aceptado	IBE9967	2022-05-06 06:22:00	2022-05-06 06:45:00	3	67	2022-04-06 06:22:00	181	250.46	10676.28	comercial	82	realizado	A35692355	L89163667	5	29
68	55	aceptado	ETA7625	2022-04-07 06:35:00	2022-04-07 19:23:00	61	77	2022-03-07 06:35:00	229	222.26	11149.46	comercial	82	no realizado	J22810925	\N	4	29
119	99	aceptado	LAM9554	2022-05-07 09:17:00	2022-05-07 17:17:00	15	19	2022-04-07 09:17:00	238	231.46	12526.83	comercial	82	realizado	J22810925	C02131672	9	29
37	27	aceptado	BTA6727	2022-06-25 00:18:00	2022-06-25 20:27:00	41	29	2022-05-25 00:18:00	148	272.26	11430.75	comercial	82	no realizado	L89163667	\N	2	29
155	127	aceptado	LAW9752	2022-06-01 08:38:00	2022-06-01 23:06:00	17	73	2022-05-01 08:38:00	133	274.17	10180.26	comercial	55	realizado	A85793465	\N	14	4
102	85	aceptado	KAI8597	2022-04-04 00:11:00	2022-04-04 11:05:00	47	73	2022-03-04 00:11:00	141	237.90	11640.43	comercial	55	realizado	A85793465	\N	6	4
130	106	aceptado	LAT5421	2022-06-06 01:17:00	2022-06-06 18:31:00	67	33	2022-05-06 01:17:00	153	227.10	11030.85	comercial	55	realizado	Q49180524	O98651462	13	4
107	89	aceptado	KEA2947	2022-06-08 10:59:00	2022-06-08 22:34:00	67	19	2022-05-08 10:59:00	90	226.02	11980.82	comercial	55	realizado	G16561693	\N	7	4
204	167	aceptado	QAF8375	2022-06-05 06:12:00	2022-06-05 21:27:00	65	43	2022-05-05 06:12:00	82	247.72	10650.58	comercial	55	realizado	O98651462	A85793465	18	4
92	77	pendiente	KAI5174	2022-05-10 00:21:00	2022-05-10 08:36:00	1	13	2022-04-10 00:21:00	2	230.74	10446.61	comercial	55	no realizado	Q49180524	\N	6	4
91	76	aceptado	KAI3589	2022-04-30 07:57:00	2022-05-01 06:27:00	67	39	2022-03-30 07:57:00	245	234.87	10092.79	comercial	55	realizado	H50641909	Q49180524	6	4
27	19	aceptado	BTA1332	2022-05-15 02:40:00	2022-05-15 21:12:00	31	67	2022-04-15 02:40:00	207	269.07	10169.44	comercial	55	realizado	E10934506	O98651462	2	4
15	10	aceptado	AZI2817	2022-05-16 22:10:00	2022-05-16 23:14:00	17	1	2022-04-16 22:10:00	89	244.43	11427.16	comercial	324	realizado	Q46419538	L89163667	1	0
12	9	aceptado	AZI1524	2022-06-16 00:29:00	2022-06-16 18:34:00	11	61	2022-05-16 00:29:00	151	271.41	12956.61	comercial	324	realizado	L89163667	\N	1	0
93	78	aceptado	KAI6386	2022-04-29 11:26:00	2022-04-29 19:26:00	69	39	2022-03-29 11:26:00	53	264.79	11172.53	comercial	324	realizado	H50641909	\N	6	0
26	18	aceptado	BTA1165	2022-05-25 21:46:00	2022-05-25 23:04:00	35	61	2022-04-25 21:46:00	107	236.16	10505.66	comercial	324	realizado	E10934506	\N	2	0
21	15	aceptado	AZI6817	2022-05-07 07:09:00	2022-05-07 07:47:00	75	69	2022-04-07 07:09:00	121	250.17	10216.55	comercial	324	realizado	Q46419538	\N	1	0
5	3	aceptado	ADC6283	2022-04-21 15:10:00	2022-04-21 17:05:00	71	33	2022-03-21 15:10:00	268	222.31	10426.22	comercial	357	realizado	L01109034	E10934506	0	13
45	35	aceptado	COG4299	2022-04-19 04:19:00	2022-04-20 06:18:00	23	13	2022-03-19 04:19:00	270	230.18	11647.94	comercial	357	realizado	O98651462	\N	17	13
54	44	aceptado	EAL7933	2022-04-21 00:37:00	2022-04-21 12:29:00	71	47	2022-03-21 00:37:00	263	253.79	11344.54	comercial	357	realizado	O88716397	A85793465	3	13
241	197	aceptado	XLE7933	2022-04-09 23:49:00	2022-04-10 00:22:00	57	61	2022-03-09 23:49:00	209	269.63	10553.60	comercial	357	realizado	E10934506	\N	12	13
199	162	aceptado	QAF4466	2022-04-15 01:23:00	2022-04-15 02:07:00	39	45	2022-03-15 01:23:00	46	267.37	10976.59	comercial	357	realizado	F40422038	A85793465	18	13
185	151	aceptado	NCY1133	2022-04-13 01:11:00	2022-04-13 21:15:00	71	57	2022-03-13 01:11:00	261	279.67	11417.85	comercial	357	realizado	V51246373	L89163667	16	13
63	51	aceptado	ETA5917	2022-04-20 07:54:00	2022-04-20 20:55:00	7	55	2022-03-20 07:54:00	22	270.31	10190.23	comercial	357	realizado	G16561693	B96464671	4	13
65	53	aceptado	ETA6742	2022-04-15 09:36:00	2022-04-15 17:22:00	41	61	2022-03-15 09:36:00	186	261.48	12708.15	comercial	357	realizado	J22810925	I74549867	4	13
78	64	aceptado	IBE8751	2022-04-18 19:43:00	2022-04-18 23:35:00	55	7	2022-03-18 19:43:00	22	262.47	11206.79	comercial	357	realizado	G16561693	\N	5	13
23	16	pendiente	AZI7766	2022-04-10 05:37:00	2022-04-10 21:35:00	45	23	2022-03-10 05:37:00	17	226.90	11636.69	comercial	357	no realizado	A85793465	Q49180524	1	13
240	196	aceptado	XLE5463	2022-05-23 05:06:00	2022-05-23 16:57:00	17	51	2022-04-23 05:06:00	114	263.34	12675.40	comercial	357	realizado	E10934506	\N	12	13
39	29	aceptado	BTA8394	2022-04-14 12:54:00	2022-04-14 19:34:00	61	69	2022-03-14 12:54:00	269	228.52	11233.68	comercial	357	realizado	E10934506	Q46419538	2	13
234	191	aceptado	XLE3285	2022-04-16 03:16:00	2022-04-16 03:57:00	75	47	2022-03-16 03:16:00	264	230.70	12132.10	comercial	357	realizado	B96464671	E10934506	12	13
168	137	aceptado	LUD1927	2022-05-13 13:39:00	2022-05-13 15:50:00	65	7	2022-04-13 13:39:00	138	242.65	10834.01	comercial	357	realizado	G16561693	C02131672	11	13
90	75	aceptado	KAI2862	2022-05-05 11:22:00	2022-05-05 15:36:00	1	53	2022-04-05 11:22:00	79	234.89	11517.73	comercial	41	realizado	A85793465	\N	6	19
220	180	rechazado	UCA2521	2022-06-15 10:35:00	2022-06-15 12:01:00	27	45	2022-05-15 10:35:00	41	274.82	12874.06	comercial	41	no realizado	B96464671	\N	10	19
11	8	aceptado	ADC9962	2022-04-03 10:57:00	2022-04-03 23:52:00	27	11	2022-03-03 10:57:00	152	222.35	10847.41	comercial	41	realizado	H50641909	Q46419538	0	19
174	142	aceptado	LUD6229	2022-05-16 08:17:00	2022-05-17 18:38:00	49	43	2022-04-16 08:17:00	68	227.49	11557.50	comercial	41	realizado	C02131672	J22810925	11	19
51	41	pendiente	COG8521	2022-06-02 10:24:00	2022-06-03 20:55:00	47	21	2022-05-02 10:24:00	22	241.45	12293.41	comercial	41	no realizado	I74549867	\N	17	19
242	198	pendiente	XLE8718	2022-05-30 07:03:00	2022-05-31 00:51:00	11	33	2022-04-30 07:03:00	7	275.21	12214.18	comercial	41	no realizado	B96464671	\N	12	19
146	119	aceptado	LAW6318	2022-05-09 04:07:00	2022-05-09 18:06:00	47	55	2022-04-09 04:07:00	210	230.96	10661.79	comercial	41	realizado	O98651462	V51246373	14	19
189	154	aceptado	NCY4311	2022-05-02 03:59:00	2022-05-02 17:29:00	71	49	2022-04-02 03:59:00	66	272.72	10125.68	comercial	41	realizado	L89163667	\N	16	19
59	49	aceptado	ETA1424	2022-04-08 08:46:00	2022-04-09 20:48:00	23	65	2022-03-08 08:46:00	42	223.52	11944.22	comercial	41	realizado	A35692355	J22810925	4	19
215	175	pendiente	UAN6566	2022-05-13 06:38:00	2022-05-13 21:24:00	77	73	2022-04-13 06:38:00	39	274.72	10590.24	comercial	41	no realizado	F40422038	\N	19	19
57	47	aceptado	EAL9637	2022-05-22 12:12:00	2022-05-22 22:41:00	59	31	2022-04-22 12:12:00	51	260.91	11734.52	comercial	41	realizado	O88716397	\N	3	19
212	172	aceptado	UAN4998	2022-05-01 08:46:00	2022-05-01 23:52:00	17	77	2022-04-01 08:46:00	220	232.13	10956.44	comercial	504	no realizado	A85793465	\N	19	23
96	80	aceptado	KAI7192	2022-04-24 16:15:00	2022-04-25 23:14:00	41	45	2022-03-24 16:15:00	103	230.88	10140.91	comercial	504	realizado	H50641909	Q46419538	6	23
147	120	aceptado	LAW6351	2022-04-27 20:26:00	2022-04-28 17:11:00	17	1	2022-03-27 20:26:00	88	273.49	10038.60	comercial	504	realizado	L01109034	\N	14	23
76	63	pendiente	IBE6559	2022-04-08 13:49:00	2022-04-08 19:22:00	1	23	2022-03-08 13:49:00	36	229.82	12359.32	comercial	504	no realizado	G16561693	\N	5	23
169	138	aceptado	LUD2683	2022-05-14 05:54:00	2022-05-15 22:21:00	17	47	2022-04-14 05:54:00	105	229.02	11770.54	comercial	504	realizado	G16561693	\N	11	23
148	121	aceptado	LAW7561	2022-06-25 01:08:00	2022-06-25 12:04:00	65	53	2022-05-25 01:08:00	62	222.08	11273.91	comercial	504	realizado	A85793465	O98651462	14	23
2	0	aceptado	ADC3293	2022-06-26 15:10:00	2022-06-26 20:27:00	5	35	2022-05-26 15:10:00	32	265.96	11489.52	comercial	504	realizado	J22810925	H50641909	0	23
208	170	aceptado	UAN2881	2022-04-10 15:15:00	2022-04-11 09:29:00	57	61	2022-03-10 15:15:00	208	254.07	12303.07	comercial	504	realizado	A85793465	C02131672	19	23
213	173	aceptado	UAN5954	2022-05-27 14:57:00	2022-05-27 17:59:00	49	71	2022-04-27 14:57:00	67	239.41	11352.56	comercial	504	realizado	F40422038	\N	19	23
117	97	rechazado	LAM5782	2022-06-06 18:54:00	2022-06-07 22:29:00	61	7	2022-05-06 18:54:00	48	234.19	11633.80	comercial	504	no realizado	S26547035	\N	9	23
230	\N	pendiente	XLE1281	2022-06-12 00:55:00	2022-06-12 02:31:00	9	37	\N	315	270.95	15934.51	militar	255	no realizado	H06267236	\N	\N	17
1	\N	pendiente	ADC2433	2022-05-03 13:59:00	2022-05-03 22:19:00	29	23	\N	314	328.99	16946.16	militar	255	no realizado	H06267236	\N	\N	17
221	181	aceptado	UCA2599	2022-05-21 11:30:00	2022-05-22 13:30:00	41	61	2022-04-21 11:30:00	143	232.38	10529.93	comercial	209	realizado	E10934506	J22810925	10	17
138	\N	aceptado	LAW2633	2022-04-10 10:35:00	2022-04-10 20:30:00	55	3	\N	324	275.83	16206.22	militar	255	realizado	O88716397	\N	\N	17
127	\N	aceptado	LAT3715	2022-05-07 11:26:00	2022-05-07 11:55:00	49	31	\N	321	289.80	15367.09	militar	255	realizado	H06267236	O88716397	\N	17
233	\N	aceptado	XLE2688	2022-04-17 01:55:00	2022-04-17 09:24:00	77	23	\N	327	346.98	16704.81	militar	255	realizado	L91489362	H06267236	\N	17
140	\N	pendiente	LAW3425	2022-06-15 03:30:00	2022-06-15 04:46:00	37	25	\N	176	297.64	16968.01	militar	255	no realizado	L91489362	H06267236	\N	17
144	\N	rechazado	LAW4728	2022-04-22 17:51:00	2022-04-22 19:28:00	35	67	\N	318	309.40	16130.14	militar	255	no realizado	O88716397	L91489362	\N	17
183	\N	rechazado	MPH5842	2022-06-04 19:24:00	2022-06-04 21:36:00	73	5	\N	49	518.00	11605.86	privado	20	no realizado	J22810925	\N	\N	5
94	\N	pendiente	KAI6421	2022-04-22 02:01:00	2022-04-22 03:26:00	19	65	\N	275	435.46	11615.62	privado	20	no realizado	J22810925	S26547035	\N	5
80	\N	aceptado	KAI1624	2022-05-28 08:47:00	2022-05-29 09:14:00	37	39	\N	159	482.72	12252.12	privado	20	realizado	C02131672	\N	\N	5
97	\N	rechazado	KAI7757	2022-04-06 19:58:00	2022-04-06 23:46:00	63	13	\N	284	440.49	12747.52	privado	20	no realizado	L91489362	H06267236	\N	5
126	\N	aceptado	LAT3525	2022-06-12 20:21:00	2022-06-13 22:11:00	35	77	\N	311	561.60	11305.34	privado	20	realizado	L91489362	\N	\N	5
187	\N	aceptado	NCY3825	2022-05-10 21:13:00	2022-05-11 10:55:00	35	1	\N	309	495.45	11538.72	privado	20	realizado	E10934506	L91489362	\N	5
209	\N	aceptado	UAN3311	2022-06-17 16:10:00	2022-06-17 16:40:00	41	73	\N	301	556.33	11552.56	privado	20	realizado	H06267236	\N	\N	5
198	\N	aceptado	QAF2773	2022-05-03 07:19:00	2022-05-03 07:46:00	71	21	\N	147	539.56	10966.91	privado	20	realizado	S26547035	A85793465	\N	5
194	158	aceptado	NCY6746	2022-05-31 05:08:00	2022-05-31 12:50:00	49	65	2022-04-30 05:08:00	153	231.06	11493.06	comercial	66	realizado	V51246373	L89163667	16	34
7	5	aceptado	ADC8249	2022-05-29 01:26:00	2022-05-29 22:55:00	61	13	2022-04-29 01:26:00	90	230.14	12331.98	comercial	66	realizado	J22810925	E10934506	0	34
36	26	aceptado	BTA6594	2022-06-24 13:41:00	2022-06-24 17:53:00	49	33	2022-05-24 13:41:00	66	249.10	12213.73	comercial	66	realizado	O98651462	A85793465	2	34
106	88	aceptado	KEA1414	2022-04-03 09:06:00	2022-04-03 20:57:00	29	47	2022-03-03 09:06:00	218	277.25	10612.57	comercial	66	no realizado	G16561693	\N	7	34
44	34	aceptado	COG3144	2022-04-21 13:35:00	2022-04-22 12:11:00	39	71	2022-03-21 13:35:00	213	248.08	12273.77	comercial	56	realizado	A85793465	H50641909	17	34
227	187	aceptado	UCA4751	2022-04-30 19:06:00	2022-05-01 15:20:00	37	61	2022-03-30 19:06:00	162	276.21	11855.80	comercial	66	realizado	L89163667	\N	10	34
40	30	aceptado	BTA8963	2022-05-21 04:36:00	2022-05-21 14:18:00	3	51	2022-04-21 04:36:00	166	227.81	10472.11	comercial	66	realizado	Q46419538	\N	2	34
31	22	aceptado	BTA4673	2022-04-04 15:19:00	2022-04-04 16:37:00	15	1	2022-03-04 15:19:00	14	229.82	10066.85	comercial	66	realizado	O98651462	E10934506	2	34
231	189	aceptado	XLE1416	2022-06-17 01:00:00	2022-06-17 07:51:00	41	77	2022-05-17 01:00:00	196	242.54	11320.75	comercial	66	realizado	L01109034	B96464671	12	34
157	129	aceptado	LRC4224	2022-06-07 11:02:00	2022-06-07 14:03:00	65	61	2022-05-07 11:02:00	80	251.63	12825.67	comercial	66	realizado	S26547035	L89163667	8	34
200	163	aceptado	QAF4555	2022-05-27 00:12:00	2022-05-27 14:39:00	39	69	2022-04-27 00:12:00	53	260.97	10599.70	comercial	66	realizado	A85793465	\N	18	34
70	57	aceptado	ETA8726	2022-06-25 15:34:00	2022-06-25 17:59:00	67	59	2022-05-25 15:34:00	168	267.59	12446.44	comercial	66	realizado	A35692355	\N	4	34
237	193	aceptado	XLE4796	2022-04-08 02:45:00	2022-04-08 15:08:00	29	41	2022-03-08 02:45:00	149	264.78	12938.02	comercial	66	realizado	B96464671	E10934506	12	34
182	149	aceptado	MPH4719	2022-06-19 08:57:00	2022-06-19 16:53:00	77	51	2022-05-19 08:57:00	208	232.04	11673.10	comercial	89	realizado	V51246373	\N	15	16
151	123	pendiente	LAW8124	2022-06-18 02:12:00	2022-06-18 04:43:00	69	3	2022-05-18 02:12:00	26	259.70	11886.07	comercial	89	no realizado	A85793465	\N	14	16
190	155	rechazado	NCY4322	2022-06-21 04:26:00	2022-06-21 08:04:00	39	45	2022-05-21 04:26:00	47	232.20	12589.07	comercial	89	no realizado	L89163667	\N	16	16
175	143	aceptado	LUD7112	2022-04-17 06:50:00	2022-04-17 17:22:00	63	17	2022-03-17 06:50:00	108	267.89	12264.46	comercial	89	realizado	C02131672	\N	11	16
143	117	aceptado	LAW4374	2022-06-01 09:01:00	2022-06-01 13:11:00	53	15	2022-05-01 09:01:00	84	249.10	10082.09	comercial	89	realizado	O98651462	L01109034	14	16
85	70	aceptado	KAI2257	2022-04-19 11:18:00	2022-04-20 02:37:00	23	43	2022-03-19 11:18:00	29	241.19	11112.56	comercial	89	realizado	H50641909	\N	6	16
109	90	aceptado	KEA5177	2022-04-24 12:07:00	2022-04-24 17:14:00	39	65	2022-03-24 12:07:00	156	259.57	12406.17	comercial	89	realizado	O98651462	B96464671	7	16
163	\N	aceptado	LRC6557	2022-06-16 17:22:00	2022-06-17 18:53:00	33	77	\N	135	558.70	12754.15	privado	55	realizado	L91489362	\N	\N	30
25	\N	aceptado	AZI8744	2022-06-14 00:18:00	2022-06-15 19:49:00	65	45	\N	223	589.64	10556.06	privado	55	realizado	C02131672	\N	\N	30
62	\N	aceptado	ETA4955	2022-04-01 03:26:00	2022-04-01 13:00:00	75	25	\N	181	500.75	11029.05	privado	55	realizado	C02131672	E10934506	\N	30
186	152	aceptado	NCY3184	2022-04-02 15:26:00	2022-04-03 04:04:00	71	55	2022-03-02 15:26:00	86	235.30	10118.19	comercial	564	realizado	A85793465	\N	16	31
238	194	aceptado	XLE4859	2022-05-04 10:20:00	2022-05-04 20:55:00	43	9	2022-04-04 10:20:00	122	256.85	11534.80	comercial	564	realizado	H50641909	\N	12	31
60	50	aceptado	ETA2413	2022-06-03 06:46:00	2022-06-03 23:35:00	61	63	2022-05-03 06:46:00	78	228.19	12996.00	comercial	564	realizado	J22810925	\N	4	31
24	17	aceptado	AZI8574	2022-05-31 13:04:00	2022-05-31 15:19:00	73	53	2022-04-30 13:04:00	134	244.35	10359.04	comercial	564	realizado	Q49180524	L89163667	1	31
58	48	pendiente	EAL9981	2022-04-17 02:42:00	2022-04-17 21:15:00	3	23	2022-03-17 02:42:00	4	226.76	10193.87	comercial	72	no realizado	O88716397	\N	3	2
188	153	aceptado	NCY3933	2022-05-31 01:37:00	2022-05-31 19:41:00	39	15	2022-04-30 01:37:00	118	257.99	10346.71	comercial	72	realizado	A85793465	L01109034	16	2
195	159	aceptado	NCY8756	2022-05-05 05:01:00	2022-05-05 15:06:00	37	33	2022-04-05 05:01:00	80	239.21	12262.40	comercial	72	realizado	V51246373	\N	16	2
193	157	aceptado	NCY5888	2022-04-06 06:52:00	2022-04-06 14:41:00	71	21	2022-03-06 06:52:00	148	241.50	10984.45	comercial	72	realizado	L01109034	\N	16	2
161	132	pendiente	LRC5343	2022-04-08 18:00:00	2022-04-08 19:49:00	23	21	2022-03-08 18:00:00	1	223.69	11831.11	comercial	72	no realizado	J22810925	\N	8	2
10	7	pendiente	ADC9771	2022-04-12 00:12:00	2022-04-12 23:27:00	53	53	2022-03-12 00:12:00	5	223.05	12872.86	comercial	72	no realizado	H50641909	\N	0	2
71	58	rechazado	IBE1383	2022-04-04 18:02:00	2022-04-05 23:06:00	59	31	2022-03-04 18:02:00	52	233.30	10258.86	comercial	72	no realizado	A35692355	\N	5	2
210	\N	pendiente	UAN4384	2022-06-25 15:36:00	2022-06-25 23:35:00	61	21	\N	204	261.94	16279.40	militar	89	no realizado	H06267236	\N	\N	22
35	\N	rechazado	BTA6525	2022-06-11 01:44:00	2022-06-11 03:24:00	15	67	\N	119	283.45	16402.68	militar	89	no realizado	L91489362	\N	\N	22
235	\N	aceptado	XLE4213	2022-05-27 12:51:00	2022-05-27 18:29:00	31	15	\N	326	323.47	15995.83	militar	89	realizado	H06267236	\N	\N	22
243	\N	aceptado	XLE9888	2022-06-21 03:14:00	2022-06-21 19:19:00	5	3	\N	157	299.50	15884.71	militar	89	realizado	H06267236	\N	\N	22
196	160	aceptado	NCY9589	2022-04-16 07:33:00	2022-04-16 19:04:00	11	11	2022-03-16 07:33:00	95	270.25	10213.93	comercial	55	realizado	L01109034	L89163667	16	10
52	42	aceptado	COG9963	2022-04-15 00:10:00	2022-04-15 03:25:00	45	51	2022-03-15 00:10:00	132	246.87	10048.18	comercial	55	realizado	C02131672	I74549867	17	10
152	124	pendiente	LAW9141	2022-04-30 09:54:00	2022-05-01 22:52:00	31	7	2022-03-30 09:54:00	21	234.04	11398.88	comercial	55	no realizado	O98651462	\N	14	10
172	140	aceptado	LUD5592	2022-05-26 03:44:00	2022-05-26 12:31:00	75	33	2022-04-26 03:44:00	130	233.99	10179.65	comercial	55	realizado	J22810925	O88716397	11	10
202	165	aceptado	QAF8273	2022-04-22 06:15:00	2022-04-22 08:09:00	5	47	2022-03-22 06:15:00	123	269.76	10983.23	comercial	62	realizado	C02131672	\N	18	15
177	145	pendiente	LUD8647	2022-06-20 08:57:00	2022-06-20 13:07:00	33	57	2022-05-20 08:57:00	6	274.55	11093.90	comercial	62	no realizado	O98651462	\N	11	15
4	2	aceptado	ADC4365	2022-04-30 12:29:00	2022-05-01 11:19:00	27	31	2022-03-30 12:29:00	170	254.96	11468.23	comercial	66	realizado	L01109034	\N	0	15
118	98	aceptado	LAM8686	2022-05-08 03:27:00	2022-05-08 12:52:00	39	13	2022-04-08 03:27:00	60	234.66	10056.75	comercial	62	realizado	J22810925	\N	9	15
201	164	aceptado	QAF6392	2022-05-31 16:00:00	2022-05-31 18:42:00	29	11	2022-04-30 16:00:00	237	260.73	11084.34	comercial	348	realizado	F40422038	C02131672	18	1
164	133	pendiente	LRC6743	2022-04-03 07:58:00	2022-04-03 17:59:00	73	33	2022-03-03 07:58:00	8	270.15	10238.26	comercial	348	no realizado	V51246373	S26547035	8	1
165	134	aceptado	LRC7787	2022-04-06 04:03:00	2022-04-06 10:10:00	25	23	2022-03-06 04:03:00	128	276.48	11008.93	comercial	348	realizado	S26547035	\N	8	1
28	20	aceptado	BTA2668	2022-06-02 07:14:00	2022-06-02 21:20:00	5	77	2022-05-02 07:14:00	188	240.89	11537.91	comercial	348	realizado	E10934506	\N	2	1
43	33	aceptado	COG2223	2022-05-02 14:17:00	2022-05-02 23:52:00	45	13	2022-04-02 14:17:00	202	234.07	11813.04	comercial	348	realizado	C02131672	\N	17	1
99	82	aceptado	KAI7891	2022-05-18 15:08:00	2022-05-18 23:09:00	23	69	2022-04-18 15:08:00	232	256.23	10501.64	comercial	348	no realizado	A85793465	\N	6	1
6	4	aceptado	ADC7913	2022-06-08 05:42:00	2022-06-08 05:53:00	61	59	2022-05-08 05:42:00	123	270.37	10365.98	comercial	552	realizado	E10934506	\N	0	8
46	36	aceptado	COG6133	2022-04-08 02:02:00	2022-04-08 23:32:00	9	3	2022-03-08 02:02:00	161	279.93	11583.45	comercial	552	no realizado	I74549867	\N	17	8
159	130	aceptado	LRC4743	2022-04-03 03:32:00	2022-04-03 21:58:00	71	71	2022-03-03 03:32:00	239	272.72	12946.99	comercial	552	realizado	J22810925	\N	8	8
142	116	aceptado	LAW4331	2022-06-11 14:59:00	2022-06-12 08:52:00	15	13	2022-05-11 14:59:00	69	255.35	12609.54	comercial	552	realizado	V51246373	\N	14	8
75	62	aceptado	IBE4998	2022-06-16 03:31:00	2022-06-16 05:19:00	77	71	2022-05-16 03:31:00	126	240.59	10648.60	comercial	552	realizado	G16561693	B96464671	5	8
41	31	aceptado	BTA9626	2022-06-16 00:06:00	2022-06-16 15:47:00	57	5	2022-05-16 00:06:00	235	251.35	10028.88	comercial	76	realizado	Q46419538	E10934506	2	7
17	11	pendiente	AZI2919	2022-04-04 19:41:00	2022-04-04 23:10:00	3	23	2022-03-04 19:41:00	3	250.07	11236.14	comercial	76	no realizado	C02131672	A85793465	1	7
53	43	aceptado	EAL6494	2022-06-24 08:27:00	2022-06-24 10:34:00	27	73	2022-05-24 08:27:00	173	263.10	12355.40	comercial	76	realizado	A85793465	\N	3	7
55	45	aceptado	EAL8271	2022-05-23 13:45:00	2022-05-24 04:53:00	57	19	2022-04-23 13:45:00	249	222.92	10173.84	comercial	76	realizado	O88716397	\N	3	7
48	38	aceptado	COG6548	2022-05-26 09:21:00	2022-05-26 23:45:00	55	59	2022-04-26 09:21:00	113	235.17	10063.04	comercial	76	realizado	I74549867	\N	17	7
239	195	aceptado	XLE5111	2022-04-26 01:45:00	2022-04-26 15:20:00	41	61	2022-03-26 01:45:00	17	273.38	11912.48	comercial	76	realizado	B96464671	E10934506	12	7
115	\N	aceptado	LAM4234	2022-06-24 04:11:00	2022-06-25 17:20:00	75	71	\N	300	508.21	12185.64	privado	10	realizado	H50641909	\N	\N	9
16	\N	aceptado	AZI2865	2022-06-03 02:15:00	2022-06-03 11:23:00	33	51	\N	295	578.89	12307.93	privado	10	realizado	A85793465	\N	\N	9
9	\N	aceptado	ADC9476	2022-04-27 15:20:00	2022-04-27 21:50:00	67	53	\N	118	608.59	12739.91	privado	10	realizado	J22810925	C02131672	\N	9
66	54	aceptado	ETA7128	2022-04-02 07:09:00	2022-04-02 13:47:00	5	23	2022-03-02 07:09:00	243	274.55	12140.98	comercial	43	realizado	I74549867	\N	4	25
20	14	pendiente	AZI6648	2022-06-22 08:59:00	2022-06-22 16:13:00	19	41	2022-05-22 08:59:00	16	227.65	11816.40	comercial	43	no realizado	L89163667	\N	1	25
214	174	aceptado	UAN6387	2022-04-28 05:19:00	2022-04-28 11:02:00	13	71	2022-03-28 05:19:00	226	229.69	12577.68	comercial	43	no realizado	F40422038	O88716397	19	25
135	111	aceptado	LAW1134	2022-06-24 17:43:00	2022-06-25 13:26:00	27	5	2022-05-24 17:43:00	211	271.45	10550.24	comercial	43	realizado	V51246373	L01109034	14	25
116	96	aceptado	LAM4734	2022-05-22 19:37:00	2022-05-23 13:31:00	9	3	2022-04-22 19:37:00	162	264.74	10233.21	comercial	43	realizado	A85793465	A35692355	9	25
133	109	aceptado	LAT6995	2022-04-03 10:52:00	2022-04-03 16:22:00	29	9	2022-03-03 10:52:00	184	248.59	11686.59	comercial	43	realizado	I74549867	\N	13	25
128	104	aceptado	LAT4157	2022-06-17 23:32:00	2022-06-18 23:34:00	37	61	2022-05-17 23:32:00	163	240.96	12722.86	comercial	43	realizado	J22810925	O98651462	13	6
223	183	aceptado	UCA2714	2022-06-17 01:45:00	2022-06-17 15:20:00	39	9	2022-05-17 01:45:00	171	222.64	10911.26	comercial	43	realizado	E10934506	L89163667	10	6
47	37	aceptado	COG6236	2022-04-14 11:02:00	2022-04-14 22:44:00	69	9	2022-03-14 11:02:00	172	270.52	10897.85	comercial	43	realizado	C02131672	A85793465	17	6
137	113	aceptado	LAW2589	2022-04-17 12:33:00	2022-04-17 23:42:00	15	51	2022-03-17 12:33:00	110	260.74	10194.72	comercial	43	no realizado	A85793465	\N	14	6
178	146	aceptado	LUD9372	2022-05-13 09:46:00	2022-05-14 16:00:00	39	37	2022-04-13 09:46:00	160	278.60	11057.91	comercial	43	realizado	O88716397	\N	11	6
105	\N	aceptado	KAI9934	2022-06-25 02:07:00	2022-06-25 02:39:00	11	9	\N	141	274.88	15856.53	militar	11	realizado	H06267236	\N	\N	11
181	\N	rechazado	MPH2457	2022-06-27 01:15:00	2022-06-27 01:15:00	23	71	\N	320	278.74	15239.36	militar	11	no realizado	H06267236	\N	\N	11
150	\N	aceptado	LAW7833	2022-05-20 06:01:00	2022-05-20 09:18:00	5	71	\N	322	343.82	16673.88	militar	11	realizado	L91489362	H06267236	\N	11
14	\N	aceptado	AZI2474	2022-05-18 04:59:00	2022-05-18 21:33:00	39	51	\N	331	253.21	16977.97	militar	11	realizado	L91489362	\N	\N	11
131	107	aceptado	LAT5532	2022-06-16 04:02:00	2022-06-17 11:47:00	33	17	2022-05-16 04:02:00	234	250.43	11634.36	comercial	369	realizado	Q49180524	\N	13	20
19	13	aceptado	AZI6476	2022-04-27 08:57:00	2022-04-27 21:25:00	41	61	2022-03-27 08:57:00	92	277.06	12043.92	comercial	369	realizado	Q49180524	A85793465	1	20
95	79	pendiente	KAI6683	2022-04-05 09:17:00	2022-04-05 20:16:00	75	55	2022-03-05 09:17:00	19	266.48	10767.40	comercial	369	no realizado	A85793465	\N	6	20
184	150	aceptado	MPH7574	2022-04-05 02:29:00	2022-04-05 03:47:00	73	45	2022-03-05 02:29:00	227	223.03	12569.05	comercial	369	no realizado	I74549867	\N	15	20
203	166	aceptado	QAF8281	2022-06-05 17:56:00	2022-06-05 22:48:00	45	39	2022-05-05 17:56:00	46	228.41	11950.49	comercial	369	no realizado	C02131672	\N	18	20
124	103	aceptado	LAT2175	2022-04-20 02:16:00	2022-04-20 10:17:00	17	1	2022-03-20 02:16:00	88	264.17	10330.16	comercial	23	realizado	Q49180524	\N	13	32
125	\N	aceptado	LAT3518	2022-04-22 22:05:00	2022-04-22 23:46:00	13	43	\N	313	534.41	11064.49	privado	23	realizado	C02131672	J22810925	\N	32
13	\N	aceptado	AZI1818	2022-05-10 11:15:00	2022-05-10 19:18:00	35	41	\N	308	425.01	10366.67	privado	23	realizado	C02131672	H50641909	\N	32
120	100	aceptado	LAM9574	2022-04-16 01:25:00	2022-04-16 21:11:00	57	9	2022-03-16 01:25:00	271	277.64	10915.07	comercial	23	realizado	J22810925	\N	9	32
158	\N	pendiente	LRC4249	2022-05-30 05:00:00	2022-05-31 11:47:00	39	41	\N	282	583.48	11892.55	privado	23	no realizado	C02131672	\N	\N	32
108	\N	rechazado	KEA4138	2022-06-14 14:27:00	2022-06-15 03:35:00	61	53	\N	286	538.13	10062.81	privado	23	no realizado	A85793465	\N	\N	32
98	81	aceptado	KAI7891	2022-04-15 03:19:00	2022-04-15 22:46:00	73	53	2022-03-15 03:19:00	134	230.61	11578.35	comercial	23	realizado	H50641909	\N	6	32
129	105	aceptado	LAT4657	2022-04-18 02:42:00	2022-04-19 12:45:00	9	65	2022-03-18 02:42:00	274	260.28	12535.72	comercial	23	realizado	S26547035	\N	13	32
167	136	aceptado	LRC9669	2022-04-21 00:18:00	2022-04-21 11:38:00	47	5	2022-03-21 00:18:00	122	223.79	11325.50	comercial	23	realizado	S26547035	\N	8	32
77	\N	aceptado	IBE8288	2022-06-09 00:15:00	2022-06-09 00:22:00	29	61	\N	99	477.56	10381.64	privado	21	realizado	S26547035	\N	\N	26
61	\N	pendiente	ETA4214	2022-06-04 08:12:00	2022-06-04 08:53:00	43	5	\N	277	536.53	11478.22	privado	21	no realizado	E10934506	A85793465	\N	26
191	\N	aceptado	NCY5556	2022-05-26 05:15:00	2022-05-26 05:47:00	67	63	\N	312	482.32	11476.10	privado	21	realizado	C02131672	H50641909	\N	26
30	\N	aceptado	BTA3645	2022-05-23 17:17:00	2022-05-24 02:49:00	49	39	\N	299	542.82	10683.72	privado	21	realizado	J22810925	\N	\N	26
89	74	aceptado	KAI2657	2022-06-21 12:00:00	2022-06-21 15:10:00	1	73	2022-05-18 12:00:00	71	276.33	12379.03	comercial	70	realizado	Q46419538	E10934506	6	18
132	108	aceptado	LAT6973	2022-06-20 08:48:00	2022-06-20 16:50:00	49	23	2022-05-20 08:48:00	201	242.94	10376.47	comercial	74	realizado	S26547035	J22810925	13	18
134	110	pendiente	LAT9621	2022-06-08 04:18:00	2022-06-08 05:30:00	51	49	2022-05-08 04:18:00	11	260.94	10096.66	comercial	74	no realizado	S26547035	\N	13	18
113	94	aceptado	KEA8133	2022-05-26 20:20:00	2022-05-26 22:18:00	57	69	2022-04-26 20:20:00	194	260.43	11292.63	comercial	74	no realizado	O98651462	\N	7	18
170	\N	pendiente	LUD3665	2022-05-02 19:49:00	2022-05-03 17:53:00	3	43	\N	281	564.57	10356.95	privado	49	no realizado	A85793465	L91489362	\N	27
0	\N	aceptado	ADC1828	2022-05-29 01:50:00	2022-05-29 03:11:00	59	61	\N	123	538.47	12506.79	privado	49	realizado	A85793465	\N	\N	27
33	24	aceptado	BTA5535	2022-04-03 06:25:00	2022-04-03 18:20:00	59	43	2022-03-03 06:25:00	104	272.35	11920.87	comercial	41	realizado	E10934506	A85793465	2	27
\.


--
-- Data for Name: fpl_propuesta; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.fpl_propuesta (propuesta_vuelo_id, estado, codigo, fecha_salida, fecha_llegada, "Aerodromo.aerodromo_salida_id", "Aerodromo.aerodromo_llegada_id", fecha_envio_propuesta, "Compania_Aerea.id_compania", "Aeronave.id_aeronave") FROM stdin;
1	pendiente	ADC4277	2022-05-13 14:38:00	2022-05-13 15:46:00	25	47	2022-04-13 14:38:00	0	28
83	aceptado	KAI8425	2022-05-04 20:08:00	2022-05-04 20:30:00	27	3	2022-04-04 20:08:00	6	28
128	pendiente	LRC1458	2022-04-22 08:08:00	2022-04-22 08:11:00	57	7	2022-03-22 08:08:00	8	28
125	aceptado	LAW9189	2022-05-19 05:39:00	2022-05-19 10:33:00	51	15	2022-04-19 05:39:00	14	28
192	aceptado	XLE4241	2022-05-23 03:22:00	2022-05-24 23:37:00	27	57	2022-04-23 03:22:00	12	28
112	aceptado	LAW1451	2022-05-08 08:04:00	2022-05-08 12:22:00	61	31	2022-04-08 08:04:00	14	28
95	aceptado	LAM2243	2022-06-09 04:38:00	2022-06-10 10:45:00	65	45	2022-05-09 04:38:00	9	28
186	aceptado	UCA3459	2022-04-24 10:22:00	2022-04-24 16:51:00	73	9	2022-03-24 10:22:00	10	28
122	aceptado	LAW7592	2022-04-03 17:01:00	2022-04-03 17:05:00	75	45	2022-03-03 17:01:00	14	14
190	aceptado	XLE2673	2022-06-08 17:04:00	2022-06-08 23:05:00	43	9	2022-05-08 17:04:00	12	14
21	aceptado	BTA3276	2022-04-28 01:27:00	2022-04-28 14:25:00	53	51	2022-03-28 01:27:00	2	14
86	aceptado	KAI9172	2022-05-18 04:16:00	2022-05-18 05:46:00	11	9	2022-04-18 04:16:00	6	14
12	aceptado	AZI3471	2022-04-19 15:09:00	2022-04-19 16:23:00	43	11	2022-03-19 15:09:00	1	14
32	pendiente	COG1158	2022-06-25 00:09:00	2022-06-25 02:47:00	33	21	2022-05-25 00:09:00	17	21
68	aceptado	KAI2237	2022-06-08 17:30:00	2022-06-08 20:03:00	71	73	2022-05-08 17:30:00	6	21
56	aceptado	ETA8691	2022-06-07 18:53:00	2022-06-07 19:22:00	21	75	2022-05-07 18:53:00	4	21
118	aceptado	LAW5896	2022-05-07 18:43:00	2022-05-08 22:50:00	1	31	2022-04-07 18:43:00	14	21
72	aceptado	KAI2357	2022-06-14 10:00:00	2022-06-14 15:00:00	11	73	2022-05-13 10:00:00	6	21
69	aceptado	KAI2247	2022-06-09 18:00:00	2022-06-09 20:00:00	41	61	2022-05-09 18:00:00	6	21
67	aceptado	KAI2227	2022-06-06 17:38:00	2022-06-07 16:03:00	71	61	2022-05-06 17:38:00	6	21
71	aceptado	KAI2257	2022-06-13 12:00:00	2022-06-13 21:00:00	41	61	2022-05-13 12:00:00	6	21
73	aceptado	KAI2457	2022-06-18 11:00:00	2022-06-18 15:20:00	5	73	2022-05-18 11:00:00	6	21
188	pendiente	UCA7235	2022-05-02 09:51:00	2022-05-02 10:19:00	23	65	2022-04-02 09:51:00	10	21
23	aceptado	BTA4764	2022-04-07 13:09:00	2022-04-07 21:56:00	39	33	2022-03-07 13:09:00	2	21
87	rechazado	KAI9232	2022-04-23 17:59:00	2022-04-23 23:27:00	53	39	2022-03-23 17:59:00	6	21
92	aceptado	KEA7139	2022-04-07 10:27:00	2022-04-07 21:54:00	17	41	2022-03-07 10:27:00	7	24
126	aceptado	LAW9612	2022-05-25 06:09:00	2022-05-26 15:04:00	19	35	2022-04-25 06:09:00	14	24
39	aceptado	COG7359	2022-04-10 13:03:00	2022-04-10 22:23:00	65	65	2022-03-10 13:03:00	17	24
46	aceptado	EAL8614	2022-05-20 05:57:00	2022-05-20 11:15:00	29	57	2022-04-20 05:57:00	3	24
52	aceptado	ETA6487	2022-06-12 00:52:00	2022-06-12 12:39:00	35	53	2022-05-12 00:52:00	4	24
84	aceptado	KAI8523	2022-05-10 02:00:00	2022-05-10 06:42:00	19	73	2022-04-10 02:00:00	6	24
135	aceptado	LRC9582	2022-06-25 12:01:00	2022-06-25 18:27:00	29	3	2022-05-25 12:01:00	8	24
91	aceptado	KEA5763	2022-06-19 05:56:00	2022-06-20 12:08:00	39	61	2022-05-19 05:56:00	7	24
169	aceptado	UAN2468	2022-06-18 18:52:00	2022-06-18 19:32:00	35	33	2022-05-18 18:52:00	19	24
25	aceptado	BTA6437	2022-06-16 00:51:00	2022-06-16 10:35:00	29	1	2022-05-16 00:51:00	2	24
168	aceptado	UAN1658	2022-04-07 11:18:00	2022-04-07 16:04:00	29	37	2022-03-07 11:18:00	19	33
131	aceptado	LRC4781	2022-05-01 12:06:00	2022-05-02 05:30:00	47	65	2022-04-01 12:06:00	8	33
6	aceptado	ADC9112	2022-05-18 03:14:00	2022-05-18 15:29:00	45	77	2022-04-18 03:14:00	0	33
59	aceptado	IBE1653	2022-06-17 03:44:00	2022-06-17 19:57:00	31	19	2022-05-17 03:44:00	5	33
66	aceptado	KAI1864	2022-05-19 08:42:00	2022-05-19 09:16:00	29	73	2022-04-19 08:42:00	6	33
101	pendiente	LAM9656	2022-05-06 16:33:00	2022-05-06 20:07:00	11	47	2022-04-06 16:33:00	9	33
147	pendiente	LUD9513	2022-04-01 07:02:00	2022-04-02 19:20:00	23	43	2022-03-01 07:02:00	11	33
60	aceptado	IBE2338	2022-04-23 10:02:00	2022-04-23 13:01:00	41	61	2022-03-23 10:02:00	5	33
115	aceptado	LAW3477	2022-05-23 19:15:00	2022-05-23 19:30:00	29	61	2022-04-23 19:15:00	14	33
144	aceptado	LUD7177	2022-04-19 19:49:00	2022-04-19 23:28:00	27	65	2022-03-19 19:49:00	11	33
93	aceptado	KEA7963	2022-06-09 11:37:00	2022-06-09 20:32:00	1	75	2022-05-09 11:37:00	7	33
40	aceptado	COG7539	2022-06-06 09:04:00	2022-06-07 23:17:00	77	53	2022-05-06 09:04:00	17	33
182	aceptado	UCA2699	2022-05-22 10:00:00	2022-05-22 13:00:00	41	61	2022-04-22 10:00:00	10	12
185	aceptado	UCA2899	2022-05-25 10:44:00	2022-05-25 13:24:00	39	61	2022-04-25 10:44:00	10	12
139	aceptado	LUD3851	2022-04-26 05:35:00	2022-04-26 11:05:00	67	47	2022-03-26 05:35:00	11	12
161	aceptado	NCY9851	2022-04-14 18:14:00	2022-04-14 19:12:00	59	57	2022-03-14 18:14:00	16	12
178	aceptado	UCA2399	2022-05-18 10:50:00	2022-05-18 14:40:00	41	61	2022-04-18 10:50:00	10	12
61	aceptado	IBE3388	2022-05-09 00:56:00	2022-05-09 01:22:00	15	73	2022-04-09 00:56:00	5	12
177	aceptado	UCA2299	2022-05-17 11:50:00	2022-05-17 16:40:00	39	61	2022-04-17 11:50:00	10	12
156	aceptado	NCY5615	2022-05-09 07:32:00	2022-05-09 13:50:00	47	27	2022-04-09 07:32:00	16	12
184	aceptado	UCA2799	2022-05-24 10:40:00	2022-05-24 13:20:00	41	61	2022-04-24 10:40:00	10	12
114	pendiente	LAW2798	2022-04-08 12:12:00	2022-04-08 21:37:00	25	15	2022-03-08 12:12:00	14	12
179	aceptado	UCA2499	2022-05-19 11:20:00	2022-05-19 13:40:00	45	61	2022-04-19 11:20:00	10	12
148	aceptado	MPH1782	2022-05-04 19:23:00	2022-05-04 20:48:00	33	61	2022-04-04 19:23:00	15	12
176	aceptado	UCA2199	2022-05-16 10:20:00	2022-05-16 15:40:00	39	61	2022-04-16 10:20:00	10	12
102	aceptado	LAT1186	2022-04-01 06:33:00	2022-04-01 07:46:00	53	45	2022-03-01 06:33:00	13	29
65	aceptado	IBE9967	2022-05-06 06:22:00	2022-05-06 06:45:00	3	67	2022-04-06 06:22:00	5	29
141	aceptado	LUD5927	2022-05-23 12:27:00	2022-05-23 16:54:00	75	37	2022-04-23 12:27:00	11	29
55	aceptado	ETA7625	2022-04-07 06:35:00	2022-04-07 19:23:00	61	77	2022-03-07 06:35:00	4	29
99	aceptado	LAM9554	2022-05-07 09:17:00	2022-05-07 17:17:00	15	19	2022-04-07 09:17:00	9	29
171	pendiente	UAN4941	2022-06-24 00:42:00	2022-06-24 06:05:00	71	17	2022-05-24 00:42:00	19	29
28	aceptado	BTA6916	2022-05-26 05:52:00	2022-05-26 22:45:00	21	9	2022-04-26 05:52:00	2	29
27	aceptado	BTA6727	2022-06-25 00:18:00	2022-06-25 20:27:00	41	29	2022-05-25 00:18:00	2	29
77	pendiente	KAI5174	2022-05-10 00:21:00	2022-05-10 08:36:00	1	13	2022-04-10 00:21:00	6	4
167	aceptado	QAF8375	2022-06-05 06:12:00	2022-06-05 21:27:00	65	43	2022-05-05 06:12:00	18	4
127	aceptado	LAW9752	2022-06-01 08:38:00	2022-06-01 23:06:00	17	73	2022-05-01 08:38:00	14	4
85	aceptado	KAI8597	2022-04-04 00:11:00	2022-04-04 11:05:00	47	73	2022-03-04 00:11:00	6	4
19	aceptado	BTA1332	2022-05-15 02:40:00	2022-05-15 21:12:00	31	67	2022-04-15 02:40:00	2	4
106	aceptado	LAT5421	2022-06-06 01:17:00	2022-06-06 18:31:00	67	33	2022-05-06 01:17:00	13	4
89	aceptado	KEA2947	2022-06-08 10:59:00	2022-06-08 22:34:00	67	19	2022-05-08 10:59:00	7	4
76	aceptado	KAI3589	2022-04-30 07:57:00	2022-05-01 06:27:00	67	39	2022-03-30 07:57:00	6	4
78	aceptado	KAI6386	2022-04-29 11:26:00	2022-04-29 19:26:00	69	39	2022-03-29 11:26:00	6	0
9	aceptado	AZI1524	2022-06-16 00:29:00	2022-06-16 18:34:00	11	61	2022-05-16 00:29:00	1	0
10	aceptado	AZI2817	2022-05-16 22:10:00	2022-05-16 23:14:00	17	1	2022-04-16 22:10:00	1	0
15	aceptado	AZI6817	2022-05-07 07:09:00	2022-05-07 07:47:00	75	69	2022-04-07 07:09:00	1	0
18	aceptado	BTA1165	2022-05-25 21:46:00	2022-05-25 23:04:00	35	61	2022-04-25 21:46:00	2	0
53	aceptado	ETA6742	2022-04-15 09:36:00	2022-04-15 17:22:00	41	61	2022-03-15 09:36:00	4	13
191	aceptado	XLE3285	2022-04-16 03:16:00	2022-04-16 03:57:00	75	47	2022-03-16 03:16:00	12	13
197	aceptado	XLE7933	2022-04-09 23:49:00	2022-04-10 00:22:00	57	61	2022-03-09 23:49:00	12	13
196	aceptado	XLE5463	2022-05-23 05:06:00	2022-05-23 16:57:00	17	51	2022-04-23 05:06:00	12	13
64	aceptado	IBE8751	2022-04-18 19:43:00	2022-04-18 23:35:00	55	7	2022-03-18 19:43:00	5	13
29	aceptado	BTA8394	2022-04-14 12:54:00	2022-04-14 19:34:00	61	69	2022-03-14 12:54:00	2	13
44	aceptado	EAL7933	2022-04-21 00:37:00	2022-04-21 12:29:00	71	47	2022-03-21 00:37:00	3	13
35	aceptado	COG4299	2022-04-19 04:19:00	2022-04-20 06:18:00	23	13	2022-03-19 04:19:00	17	13
3	aceptado	ADC6283	2022-04-21 15:10:00	2022-04-21 17:05:00	71	33	2022-03-21 15:10:00	0	13
51	aceptado	ETA5917	2022-04-20 07:54:00	2022-04-20 20:55:00	7	55	2022-03-20 07:54:00	4	13
151	aceptado	NCY1133	2022-04-13 01:11:00	2022-04-13 21:15:00	71	57	2022-03-13 01:11:00	16	13
162	aceptado	QAF4466	2022-04-15 01:23:00	2022-04-15 02:07:00	39	45	2022-03-15 01:23:00	18	13
137	aceptado	LUD1927	2022-05-13 13:39:00	2022-05-13 15:50:00	65	7	2022-04-13 13:39:00	11	13
16	pendiente	AZI7766	2022-04-10 05:37:00	2022-04-10 21:35:00	45	23	2022-03-10 05:37:00	1	13
175	pendiente	UAN6566	2022-05-13 06:38:00	2022-05-13 21:24:00	77	73	2022-04-13 06:38:00	19	19
154	aceptado	NCY4311	2022-05-02 03:59:00	2022-05-02 17:29:00	71	49	2022-04-02 03:59:00	16	19
8	aceptado	ADC9962	2022-04-03 10:57:00	2022-04-03 23:52:00	27	11	2022-03-03 10:57:00	0	19
75	aceptado	KAI2862	2022-05-05 11:22:00	2022-05-05 15:36:00	1	53	2022-04-05 11:22:00	6	19
119	aceptado	LAW6318	2022-05-09 04:07:00	2022-05-09 18:06:00	47	55	2022-04-09 04:07:00	14	19
198	pendiente	XLE8718	2022-05-30 07:03:00	2022-05-31 00:51:00	11	33	2022-04-30 07:03:00	12	19
41	pendiente	COG8521	2022-06-02 10:24:00	2022-06-03 20:55:00	47	21	2022-05-02 10:24:00	17	19
49	aceptado	ETA1424	2022-04-08 08:46:00	2022-04-09 20:48:00	23	65	2022-03-08 08:46:00	4	19
142	aceptado	LUD6229	2022-05-16 08:17:00	2022-05-17 18:38:00	49	43	2022-04-16 08:17:00	11	19
180	rechazado	UCA2521	2022-06-15 10:35:00	2022-06-15 12:01:00	27	45	2022-05-15 10:35:00	10	19
47	aceptado	EAL9637	2022-05-22 12:12:00	2022-05-22 22:41:00	59	31	2022-04-22 12:12:00	3	19
120	aceptado	LAW6351	2022-04-27 20:26:00	2022-04-28 17:11:00	17	1	2022-03-27 20:26:00	14	23
173	aceptado	UAN5954	2022-05-27 14:57:00	2022-05-27 17:59:00	49	71	2022-04-27 14:57:00	19	23
97	rechazado	LAM5782	2022-06-06 18:54:00	2022-06-07 22:29:00	61	7	2022-05-06 18:54:00	9	23
172	aceptado	UAN4998	2022-05-01 08:46:00	2022-05-01 23:52:00	17	77	2022-04-01 08:46:00	19	23
170	aceptado	UAN2881	2022-04-10 15:15:00	2022-04-11 09:29:00	57	61	2022-03-10 15:15:00	19	23
80	aceptado	KAI7192	2022-04-24 16:15:00	2022-04-25 23:14:00	41	45	2022-03-24 16:15:00	6	23
63	pendiente	IBE6559	2022-04-08 13:49:00	2022-04-08 19:22:00	1	23	2022-03-08 13:49:00	5	23
0	aceptado	ADC3293	2022-06-26 15:10:00	2022-06-26 20:27:00	5	35	2022-05-26 15:10:00	0	23
121	aceptado	LAW7561	2022-06-25 01:08:00	2022-06-25 12:04:00	65	53	2022-05-25 01:08:00	14	23
138	aceptado	LUD2683	2022-05-14 05:54:00	2022-05-15 22:21:00	17	47	2022-04-14 05:54:00	11	23
181	aceptado	UCA2599	2022-05-21 11:30:00	2022-05-22 13:30:00	41	61	2022-04-21 11:30:00	10	17
163	aceptado	QAF4555	2022-05-27 00:12:00	2022-05-27 14:39:00	39	69	2022-04-27 00:12:00	18	34
26	aceptado	BTA6594	2022-06-24 13:41:00	2022-06-24 17:53:00	49	33	2022-05-24 13:41:00	2	34
129	aceptado	LRC4224	2022-06-07 11:02:00	2022-06-07 14:03:00	65	61	2022-05-07 11:02:00	8	34
22	aceptado	BTA4673	2022-04-04 15:19:00	2022-04-04 16:37:00	15	1	2022-03-04 15:19:00	2	34
57	aceptado	ETA8726	2022-06-25 15:34:00	2022-06-25 17:59:00	67	59	2022-05-25 15:34:00	4	34
34	aceptado	COG3144	2022-04-21 13:35:00	2022-04-22 12:11:00	39	71	2022-03-21 13:35:00	17	34
193	aceptado	XLE4796	2022-04-08 02:45:00	2022-04-08 15:08:00	29	41	2022-03-08 02:45:00	12	34
88	aceptado	KEA1414	2022-04-03 09:06:00	2022-04-03 20:57:00	29	47	2022-03-03 09:06:00	7	34
189	aceptado	XLE1416	2022-06-17 01:00:00	2022-06-17 07:51:00	41	77	2022-05-17 01:00:00	12	34
30	aceptado	BTA8963	2022-05-21 04:36:00	2022-05-21 14:18:00	3	51	2022-04-21 04:36:00	2	34
5	aceptado	ADC8249	2022-05-29 01:26:00	2022-05-29 22:55:00	61	13	2022-04-29 01:26:00	0	34
158	aceptado	NCY6746	2022-05-31 05:08:00	2022-05-31 12:50:00	49	65	2022-04-30 05:08:00	16	34
187	aceptado	UCA4751	2022-04-30 19:06:00	2022-05-01 15:20:00	37	61	2022-03-30 19:06:00	10	34
70	aceptado	KAI2257	2022-04-19 11:18:00	2022-04-20 02:37:00	23	43	2022-03-19 11:18:00	6	16
155	rechazado	NCY4322	2022-06-21 04:26:00	2022-06-21 08:04:00	39	45	2022-05-21 04:26:00	16	16
143	aceptado	LUD7112	2022-04-17 06:50:00	2022-04-17 17:22:00	63	17	2022-03-17 06:50:00	11	16
149	aceptado	MPH4719	2022-06-19 08:57:00	2022-06-19 16:53:00	77	51	2022-05-19 08:57:00	15	16
123	pendiente	LAW8124	2022-06-18 02:12:00	2022-06-18 04:43:00	69	3	2022-05-18 02:12:00	14	16
117	aceptado	LAW4374	2022-06-01 09:01:00	2022-06-01 13:11:00	53	15	2022-05-01 09:01:00	14	16
90	aceptado	KEA5177	2022-04-24 12:07:00	2022-04-24 17:14:00	39	65	2022-03-24 12:07:00	7	16
152	aceptado	NCY3184	2022-04-02 15:26:00	2022-04-03 04:04:00	71	55	2022-03-02 15:26:00	16	31
194	aceptado	XLE4859	2022-05-04 10:20:00	2022-05-04 20:55:00	43	9	2022-04-04 10:20:00	12	31
17	aceptado	AZI8574	2022-05-31 13:04:00	2022-05-31 15:19:00	73	53	2022-04-30 13:04:00	1	31
50	aceptado	ETA2413	2022-06-03 06:46:00	2022-06-03 23:35:00	61	63	2022-05-03 06:46:00	4	31
48	pendiente	EAL9981	2022-04-17 02:42:00	2022-04-17 21:15:00	3	23	2022-03-17 02:42:00	3	2
159	aceptado	NCY8756	2022-05-05 05:01:00	2022-05-05 15:06:00	37	33	2022-04-05 05:01:00	16	2
7	pendiente	ADC9771	2022-04-12 00:12:00	2022-04-12 23:27:00	53	53	2022-03-12 00:12:00	0	2
132	pendiente	LRC5343	2022-04-08 18:00:00	2022-04-08 19:49:00	23	21	2022-03-08 18:00:00	8	2
153	aceptado	NCY3933	2022-05-31 01:37:00	2022-05-31 19:41:00	39	15	2022-04-30 01:37:00	16	2
58	rechazado	IBE1383	2022-04-04 18:02:00	2022-04-05 23:06:00	59	31	2022-03-04 18:02:00	5	2
157	aceptado	NCY5888	2022-04-06 06:52:00	2022-04-06 14:41:00	71	21	2022-03-06 06:52:00	16	2
42	aceptado	COG9963	2022-04-15 00:10:00	2022-04-15 03:25:00	45	51	2022-03-15 00:10:00	17	10
124	pendiente	LAW9141	2022-04-30 09:54:00	2022-05-01 22:52:00	31	7	2022-03-30 09:54:00	14	10
160	aceptado	NCY9589	2022-04-16 07:33:00	2022-04-16 19:04:00	11	11	2022-03-16 07:33:00	16	10
140	aceptado	LUD5592	2022-05-26 03:44:00	2022-05-26 12:31:00	75	33	2022-04-26 03:44:00	11	10
165	aceptado	QAF8273	2022-04-22 06:15:00	2022-04-22 08:09:00	5	47	2022-03-22 06:15:00	18	15
2	aceptado	ADC4365	2022-04-30 12:29:00	2022-05-01 11:19:00	27	31	2022-03-30 12:29:00	0	15
145	pendiente	LUD8647	2022-06-20 08:57:00	2022-06-20 13:07:00	33	57	2022-05-20 08:57:00	11	15
98	aceptado	LAM8686	2022-05-08 03:27:00	2022-05-08 12:52:00	39	13	2022-04-08 03:27:00	9	15
33	aceptado	COG2223	2022-05-02 14:17:00	2022-05-02 23:52:00	45	13	2022-04-02 14:17:00	17	1
164	aceptado	QAF6392	2022-05-31 16:00:00	2022-05-31 18:42:00	29	11	2022-04-30 16:00:00	18	1
133	pendiente	LRC6743	2022-04-03 07:58:00	2022-04-03 17:59:00	73	33	2022-03-03 07:58:00	8	1
134	aceptado	LRC7787	2022-04-06 04:03:00	2022-04-06 10:10:00	25	23	2022-03-06 04:03:00	8	1
82	aceptado	KAI7891	2022-05-18 15:08:00	2022-05-18 23:09:00	23	69	2022-04-18 15:08:00	6	1
20	aceptado	BTA2668	2022-06-02 07:14:00	2022-06-02 21:20:00	5	77	2022-05-02 07:14:00	2	1
36	aceptado	COG6133	2022-04-08 02:02:00	2022-04-08 23:32:00	9	3	2022-03-08 02:02:00	17	8
116	aceptado	LAW4331	2022-06-11 14:59:00	2022-06-12 08:52:00	15	13	2022-05-11 14:59:00	14	8
130	aceptado	LRC4743	2022-04-03 03:32:00	2022-04-03 21:58:00	71	71	2022-03-03 03:32:00	8	8
62	aceptado	IBE4998	2022-06-16 03:31:00	2022-06-16 05:19:00	77	71	2022-05-16 03:31:00	5	8
4	aceptado	ADC7913	2022-06-08 05:42:00	2022-06-08 05:53:00	61	59	2022-05-08 05:42:00	0	8
38	aceptado	COG6548	2022-05-26 09:21:00	2022-05-26 23:45:00	55	59	2022-04-26 09:21:00	17	7
31	aceptado	BTA9626	2022-06-16 00:06:00	2022-06-16 15:47:00	57	5	2022-05-16 00:06:00	2	7
45	aceptado	EAL8271	2022-05-23 13:45:00	2022-05-24 04:53:00	57	19	2022-04-23 13:45:00	3	7
11	pendiente	AZI2919	2022-04-04 19:41:00	2022-04-04 23:10:00	3	23	2022-03-04 19:41:00	1	7
195	aceptado	XLE5111	2022-04-26 01:45:00	2022-04-26 15:20:00	41	61	2022-03-26 01:45:00	12	7
43	aceptado	EAL6494	2022-06-24 08:27:00	2022-06-24 10:34:00	27	73	2022-05-24 08:27:00	3	7
111	aceptado	LAW1134	2022-06-24 17:43:00	2022-06-25 13:26:00	27	5	2022-05-24 17:43:00	14	25
14	pendiente	AZI6648	2022-06-22 08:59:00	2022-06-22 16:13:00	19	41	2022-05-22 08:59:00	1	25
96	aceptado	LAM4734	2022-05-22 19:37:00	2022-05-23 13:31:00	9	3	2022-04-22 19:37:00	9	25
54	aceptado	ETA7128	2022-04-02 07:09:00	2022-04-02 13:47:00	5	23	2022-03-02 07:09:00	4	25
174	aceptado	UAN6387	2022-04-28 05:19:00	2022-04-28 11:02:00	13	71	2022-03-28 05:19:00	19	25
109	aceptado	LAT6995	2022-04-03 10:52:00	2022-04-03 16:22:00	29	9	2022-03-03 10:52:00	13	25
146	aceptado	LUD9372	2022-05-13 09:46:00	2022-05-14 16:00:00	39	37	2022-04-13 09:46:00	11	6
37	aceptado	COG6236	2022-04-14 11:02:00	2022-04-14 22:44:00	69	9	2022-03-14 11:02:00	17	6
113	aceptado	LAW2589	2022-04-17 12:33:00	2022-04-17 23:42:00	15	51	2022-03-17 12:33:00	14	6
104	aceptado	LAT4157	2022-06-17 23:32:00	2022-06-18 23:34:00	37	61	2022-05-17 23:32:00	13	6
183	aceptado	UCA2714	2022-06-17 01:45:00	2022-06-17 15:20:00	39	9	2022-05-17 01:45:00	10	6
107	aceptado	LAT5532	2022-06-16 04:02:00	2022-06-17 11:47:00	33	17	2022-05-16 04:02:00	13	20
166	aceptado	QAF8281	2022-06-05 17:56:00	2022-06-05 22:48:00	45	39	2022-05-05 17:56:00	18	20
13	aceptado	AZI6476	2022-04-27 08:57:00	2022-04-27 21:25:00	41	61	2022-03-27 08:57:00	1	20
150	aceptado	MPH7574	2022-04-05 02:29:00	2022-04-05 03:47:00	73	45	2022-03-05 02:29:00	15	20
79	pendiente	KAI6683	2022-04-05 09:17:00	2022-04-05 20:16:00	75	55	2022-03-05 09:17:00	6	20
105	aceptado	LAT4657	2022-04-18 02:42:00	2022-04-19 12:45:00	9	65	2022-03-18 02:42:00	13	32
81	aceptado	KAI7891	2022-04-15 03:19:00	2022-04-15 22:46:00	73	53	2022-03-15 03:19:00	6	32
136	aceptado	LRC9669	2022-04-21 00:18:00	2022-04-21 11:38:00	47	5	2022-03-21 00:18:00	8	32
103	aceptado	LAT2175	2022-04-20 02:16:00	2022-04-20 10:17:00	17	1	2022-03-20 02:16:00	13	32
100	aceptado	LAM9574	2022-04-16 01:25:00	2022-04-16 21:11:00	57	9	2022-03-16 01:25:00	9	32
110	pendiente	LAT9621	2022-06-08 04:18:00	2022-06-08 05:30:00	51	49	2022-05-08 04:18:00	13	18
108	aceptado	LAT6973	2022-06-20 08:48:00	2022-06-20 16:50:00	49	23	2022-05-20 08:48:00	13	18
94	aceptado	KEA8133	2022-05-26 20:20:00	2022-05-26 22:18:00	57	69	2022-04-26 20:20:00	7	18
74	aceptado	KAI2657	2022-06-21 12:00:00	2022-06-21 15:10:00	1	73	2022-05-18 12:00:00	6	18
24	aceptado	BTA5535	2022-04-03 06:25:00	2022-04-03 18:20:00	59	43	2022-03-03 06:25:00	2	27
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.pais (pais_id, nombre_pais) FROM stdin;
10	Estados Unidos
16	Italia
6	China
8	Egipto
5	Chile
19	Paises Bajos
24	Venezuela
7	Corea del Sur
22	Turquia
1	Australia
9	España
12	Grecia
4	Canada
14	India
0	Argentina
13	Hong Kong
3	Brasil
23	Uruguay
15	Inglaterra
2	Bolivia
20	Peru
21	Sudafrica
11	Francia
18	Mexico
17	Japon
\.


--
-- Data for Name: piloto; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.piloto (pasaporte) FROM stdin;
G16561693
S26547035
L01109034
V51246373
F40422038
B96464671
H50641909
C02131672
O88716397
A35692355
Q46419538
L89163667
J22810925
A85793465
E10934506
L91489362
H06267236
Q49180524
I74549867
O98651462
\.


--
-- Data for Name: pista; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.pista (pista_id, codigo_pista, "Aerodromo.aerodromo_id") FROM stdin;
141	23R	71
22	71R	11
116	88L	57
108	33R	55
76	84R	37
54	46L	27
145	55L	73
115	76L	57
149	15L	75
66	99R	33
88	11L	45
130	26L	65
19	16R	11
82	26L	41
29	19L	15
139	68R	69
136	28L	69
50	92R	25
134	37L	67
120	26L	61
49	45R	25
43	86R	21
131	45L	65
69	42R	35
26	83R	13
41	62L	21
126	77L	63
137	37R	69
75	62R	37
8	98L	3
91	60R	45
4	16L	3
118	37L	59
70	72L	35
13	23R	7
51	95L	25
85	29R	43
5	45L	3
58	52R	29
142	27L	71
34	54L	17
31	36R	15
40	22L	21
99	85L	49
135	98R	67
107	91L	53
104	73L	51
87	70L	43
39	99L	19
124	90L	61
63	84L	31
83	58R	41
45	72L	23
127	89R	63
25	25L	13
97	49L	49
112	42L	57
146	80L	73
10	34L	5
67	29R	35
12	19L	7
72	31L	37
102	37L	51
101	15L	51
2	72R	1
138	58R	69
47	18L	25
18	96R	9
95	64R	47
90	44R	45
60	63L	29
16	90L	7
33	19R	17
32	72R	15
0	14L	1
9	16R	5
17	79L	9
71	18R	37
121	27L	61
65	94L	33
106	83L	53
84	69R	41
3	80R	1
46	85R	23
144	51L	73
30	30L	15
129	22L	65
37	46L	19
79	72L	39
114	69R	57
15	73L	7
14	32R	7
119	56L	59
52	14L	27
151	70R	75
98	56L	49
117	24R	59
110	91L	55
48	38R	25
6	71R	3
36	15R	19
125	71R	63
42	74R	21
140	85R	69
77	15L	39
28	16L	15
21	36L	11
64	19L	33
109	44R	55
81	25L	41
74	57L	37
35	64R	17
80	16L	41
86	55L	43
147	89L	73
53	45L	27
57	46L	29
153	43L	77
154	57R	77
61	28R	31
150	24R	75
27	92L	13
105	20R	53
62	38R	31
73	38L	37
89	28L	45
123	63R	61
122	35L	61
92	80R	45
94	47R	47
1	55R	1
143	60L	71
68	41R	35
93	45R	47
100	94L	49
55	96L	27
23	81L	11
11	51R	5
152	34R	77
78	63R	39
24	89L	11
20	32R	11
103	53L	51
148	12L	75
56	34L	29
7	76L	3
38	55R	19
113	51R	57
128	21R	65
111	99L	55
133	14R	67
96	42L	49
59	62R	29
44	89L	21
132	59R	65
\.


--
-- Data for Name: puerto_embarque; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.puerto_embarque (puerto_embarque_id, codigo_puerto_embarque, "Aerodromo.aerodromo_id") FROM stdin;
214	844	71
35	902	11
172	580	57
30	285	11
167	933	55
109	458	37
83	968	27
216	275	73
227	972	75
101	988	33
135	597	45
192	204	65
34	885	11
125	952	41
44	248	15
209	858	69
208	847	69
42	101	15
72	208	25
200	475	67
185	693	61
77	763	25
61	197	21
169	352	57
212	509	71
103	500	35
41	981	13
191	806	63
112	852	37
6	285	3
133	233	45
7	565	3
176	578	59
107	972	35
22	708	7
199	133	67
45	835	15
74	444	25
130	462	43
88	906	29
51	668	17
188	577	63
64	930	21
145	272	49
217	339	73
80	542	27
171	488	57
201	548	67
160	787	53
150	106	51
127	251	43
54	674	19
184	605	61
92	434	31
122	286	41
67	345	23
47	921	15
189	664	63
20	635	7
40	802	13
146	418	49
17	967	5
144	237	49
155	899	51
18	245	7
111	516	37
152	231	51
11	932	3
194	517	65
225	510	75
4	755	1
205	693	69
55	725	19
26	487	9
143	933	47
180	349	61
87	641	29
14	499	5
19	407	7
170	369	57
2	567	1
204	681	69
27	514	9
113	985	37
183	462	61
23	906	7
96	122	33
73	308	25
128	285	43
123	308	41
151	112	51
1	466	1
70	771	23
220	721	73
46	917	15
223	295	75
224	430	75
76	732	25
193	205	65
126	131	43
118	954	39
120	134	41
198	126	67
21	693	7
211	491	71
178	761	59
79	541	27
181	386	61
129	431	43
105	829	35
177	628	59
163	380	55
58	857	19
131	740	43
8	601	3
63	923	21
100	735	33
206	754	69
115	620	39
166	744	55
210	474	71
108	154	37
182	405	61
53	990	17
159	756	53
187	246	63
221	807	73
81	599	27
60	100	21
89	928	29
52	704	17
124	719	41
106	918	35
233	997	77
229	413	77
3	710	1
95	946	31
97	295	33
37	373	13
59	879	19
48	122	17
36	319	13
15	717	5
90	263	31
82	678	27
99	722	33
75	605	25
140	627	47
62	351	21
153	674	51
165	629	55
138	319	47
94	580	31
116	735	39
5	863	1
137	749	45
141	731	47
0	306	1
147	446	49
31	363	11
43	246	15
24	138	9
142	840	47
173	683	57
197	900	65
32	535	11
50	363	17
102	223	35
132	208	45
69	703	23
85	349	29
110	505	37
219	490	73
196	872	65
29	973	9
202	630	67
91	335	31
10	775	3
57	769	19
38	645	13
98	390	33
121	253	41
136	680	45
230	559	77
218	472	73
9	632	3
168	119	57
117	791	39
162	114	55
164	504	55
134	560	45
71	818	23
16	895	5
149	799	49
104	538	35
231	577	77
222	131	75
186	206	63
25	477	9
114	376	39
28	942	9
119	991	39
175	244	59
49	271	17
207	799	69
226	630	75
154	775	51
13	480	5
158	532	53
93	498	31
195	781	65
148	563	49
33	884	11
84	148	29
56	737	19
65	949	21
179	936	59
161	924	53
86	454	29
139	558	47
203	971	67
157	414	53
232	684	77
174	240	59
78	179	27
190	667	63
213	765	71
66	102	23
215	918	71
228	388	77
39	674	13
68	407	23
156	181	53
12	321	5
\.


--
-- Data for Name: punto; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.punto (id_punto, nombre_punto, latitud, longitud) FROM stdin;
8	MUBIL	-38.915556	-72.252222
15	ASALA	-27.675556	-108.439444
12	IVDM	-32.944167	-71.470278
18	VUDAP	-23.143889	-68.805000
17	ANGAT	-23.151944	-68.553056
2	OPURA	-45.268611	-71.955000
1	BAL	-45.913056	-71.712500
10	SIROV	-34.584722	-70.622778
4	MUKSO	-43.280278	-72.974444
6	SASTI	-42.591944	-73.228333
3	REKET	-44.098889	-72.380833
0	MUNER	-52.000000	-71.310000
9	GE025	-37.353156	-72.419825
14	EDSUK	-31.416667	-90.000000
16	ARMOS	-24.291667	-67.979167
11	EL138	-33.401844	-70.642517
5	URIDA	-43.275278	-72.670556
7	TESEX	-38.931111	-71.433611
13	GUVOL	-32.375000	-70.225000
19	SOTKU	-21.866667	-68.062500
\.


--
-- Data for Name: puntos_ruta; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.puntos_ruta ("Ruta.ruta_id", cardinalidad, "Punto.id_punto") FROM stdin;
228	1	8
11	0	15
245	1	8
300	0	12
60	1	18
210	5	17
194	3	2
92	1	1
157	1	10
152	1	4
14	3	18
135	0	12
132	2	1
162	1	6
312	2	3
227	1	17
271	2	0
105	2	18
86	3	18
122	1	9
321	0	2
308	2	8
69	0	14
71	1	9
181	1	3
229	1	9
42	1	9
113	2	8
311	2	16
115	1	11
99	1	11
308	3	4
142	2	4
49	1	11
324	0	11
86	1	11
151	3	2
314	0	0
113	0	15
202	0	1
5	1	5
88	1	17
156	1	7
2	1	16
84	0	15
8	1	14
121	1	3
245	3	17
157	2	16
53	1	5
32	3	13
82	0	12
130	1	16
60	0	2
49	0	14
90	1	4
177	1	0
67	0	0
268	0	10
249	3	16
163	1	19
284	2	7
232	0	0
286	2	8
179	0	14
87	1	19
168	2	8
312	1	5
261	0	0
135	2	18
36	1	10
156	0	11
72	2	17
80	1	2
47	2	6
160	0	10
188	0	0
40	1	4
141	2	16
36	0	11
126	3	6
122	0	11
115	0	0
22	1	9
299	1	1
312	0	11
179	2	4
263	1	3
321	2	13
71	0	0
306	1	6
199	1	17
176	3	6
82	1	11
148	1	1
286	0	14
224	2	19
35	2	1
166	1	6
314	2	7
159	3	19
35	1	19
88	2	13
36	3	13
52	1	2
324	2	7
110	3	13
1	1	8
172	0	5
17	3	1
42	0	11
202	1	6
184	0	5
159	0	0
102	1	9
62	0	12
221	1	10
210	1	5
5	2	13
8	2	11
242	1	3
89	2	0
201	0	12
261	1	11
210	3	19
283	1	3
86	2	9
8	0	15
66	1	4
7	2	3
305	2	17
162	0	16
95	1	7
5	0	9
218	1	5
249	2	1
311	3	13
67	2	18
36	2	3
138	0	15
331	0	5
153	0	5
264	3	16
238	2	13
71	4	10
111	1	19
151	0	15
72	4	13
269	0	15
237	2	3
82	3	6
94	1	3
305	1	3
156	2	17
41	1	6
119	0	15
295	4	18
149	2	4
62	1	14
177	3	13
295	3	4
201	2	5
72	1	19
30	3	17
64	0	9
45	1	13
224	1	10
242	2	17
49	2	2
17	1	10
232	3	17
170	3	7
295	5	13
126	1	10
74	1	3
196	2	10
207	1	16
331	1	2
119	3	4
223	1	2
327	2	4
52	2	3
213	1	6
21	0	5
223	2	18
186	0	3
27	0	15
264	0	0
125	0	1
7	0	0
237	3	1
107	1	3
48	1	10
283	2	1
100	5	6
243	0	11
246	0	11
184	2	3
239	2	6
19	1	18
100	0	9
100	3	4
7	4	13
40	2	19
210	4	3
86	0	12
286	3	1
204	1	19
39	1	17
211	0	5
115	2	5
238	0	0
134	0	15
286	1	9
299	0	11
234	1	4
228	0	5
249	0	15
26	1	9
100	4	16
103	0	4
246	1	5
326	1	0
89	4	17
201	1	14
126	2	4
108	1	13
29	0	0
141	0	15
147	1	1
9	1	10
224	0	5
295	0	12
161	0	12
301	0	11
159	4	13
113	1	12
270	0	11
300	1	11
191	0	7
114	1	18
168	3	13
103	1	13
188	1	8
233	2	6
306	0	15
207	0	5
43	0	14
143	1	9
137	2	0
71	2	8
6	0	10
233	1	19
114	0	5
160	1	19
94	0	8
235	1	4
64	2	1
3	1	14
226	0	0
51	2	16
130	0	3
106	2	13
239	1	19
84	1	4
105	3	19
80	2	10
211	2	6
8	5	17
53	0	0
115	4	16
171	0	14
221	0	15
172	1	19
131	1	2
321	1	4
322	0	7
152	3	13
194	0	15
225	1	17
257	2	1
128	2	2
107	0	18
142	0	15
141	3	13
23	1	18
131	0	5
176	4	13
82	2	10
163	0	14
78	0	12
72	3	16
148	0	19
168	1	5
223	3	6
119	4	18
213	0	14
69	2	17
314	1	8
69	1	5
62	2	0
3	2	11
131	2	17
52	0	12
327	1	9
226	2	2
110	0	11
245	0	15
209	0	12
137	5	18
123	0	15
269	4	4
119	5	16
269	1	5
143	0	14
308	0	11
43	2	5
51	0	0
21	1	1
301	2	17
243	1	17
137	4	5
26	2	6
270	2	10
66	0	0
107	3	16
151	1	5
161	1	6
271	3	9
106	0	10
270	1	8
281	0	0
234	0	10
315	0	2
199	0	0
75	1	7
49	3	4
102	2	1
277	1	6
181	0	2
113	4	1
284	0	14
258	1	6
238	1	7
67	1	11
153	1	4
68	0	18
132	1	18
6	2	16
160	2	6
157	0	2
42	2	7
264	1	3
14	4	17
282	1	11
326	3	17
170	1	9
119	2	10
132	3	16
274	2	3
240	3	16
110	2	8
93	1	0
88	0	18
89	3	10
186	1	1
133	2	3
75	0	15
306	2	13
269	2	7
121	0	19
100	1	7
4	0	8
324	1	5
196	1	2
239	0	14
232	1	7
133	3	17
237	0	2
46	1	8
225	0	10
107	2	1
318	0	8
115	5	6
39	0	18
26	0	12
105	0	15
283	0	15
102	0	11
215	1	4
199	2	6
220	0	14
242	3	6
45	0	11
215	0	8
123	1	9
274	1	18
43	3	4
173	1	13
204	0	15
282	2	2
74	0	19
99	0	12
8	3	5
78	1	14
246	2	2
4	1	7
14	5	13
271	1	12
211	1	3
40	0	14
313	1	0
137	0	15
125	1	16
201	3	6
9	0	8
64	1	8
10	0	18
237	1	19
110	1	5
95	0	0
14	2	11
168	0	12
62	3	10
48	0	14
228	2	16
147	0	14
152	0	12
221	2	6
29	1	5
6	1	4
30	0	14
133	1	7
318	1	17
257	1	10
89	0	15
104	2	3
218	2	7
320	1	18
14	0	12
115	3	18
149	0	0
225	2	6
171	1	5
199	3	13
226	1	5
191	3	6
32	0	14
99	2	10
218	3	3
51	3	6
113	3	17
309	3	16
93	0	12
209	1	1
309	0	9
324	3	2
46	0	14
68	1	1
176	0	2
126	0	2
249	1	3
104	1	18
281	1	18
21	2	6
232	2	3
119	1	12
1	0	5
32	2	11
305	3	1
179	3	6
27	1	0
128	1	8
42	3	3
149	1	5
208	2	16
1	2	3
142	1	9
29	2	18
108	0	5
8	4	8
90	0	9
35	3	16
194	2	8
300	2	8
40	3	13
284	3	2
80	0	12
275	2	10
277	0	3
313	2	10
159	1	2
322	1	13
258	0	11
17	0	8
326	0	15
240	0	14
268	1	17
22	2	8
245	2	10
159	2	4
147	2	6
243	2	13
71	3	7
220	1	2
196	3	3
315	1	19
308	1	9
282	0	0
274	0	7
240	1	10
17	2	4
47	1	16
170	2	8
72	0	5
30	2	2
210	0	12
214	2	16
71	5	16
90	2	17
130	2	13
223	0	12
326	2	19
79	2	6
92	0	4
79	0	15
152	2	6
257	0	11
151	2	8
240	2	19
23	0	10
214	0	11
176	2	16
311	0	12
132	4	6
271	4	1
275	0	15
210	2	18
208	0	12
242	0	8
7	1	19
191	1	10
2	0	11
106	1	18
270	3	17
191	2	3
295	2	2
313	3	6
269	3	2
235	0	9
16	1	9
275	3	16
87	0	18
173	0	3
7	3	17
3	3	4
220	2	13
105	1	9
311	1	10
118	0	11
208	1	11
137	3	9
118	2	6
132	0	15
137	1	12
166	0	9
135	1	4
177	0	12
11	1	17
118	1	10
3	0	15
284	1	5
22	0	12
100	2	10
41	0	17
305	0	15
47	0	8
230	1	3
74	2	6
227	0	2
19	0	4
184	1	4
320	0	7
230	0	15
179	1	7
95	2	2
194	1	5
35	0	8
214	1	9
229	0	12
271	0	15
10	1	16
89	1	14
275	1	12
111	0	7
264	2	17
143	2	3
295	1	11
79	1	16
43	1	0
309	1	2
177	2	8
263	0	0
32	1	0
170	0	12
176	1	1
104	0	11
133	0	9
151	4	17
218	0	0
301	1	18
141	1	11
327	0	0
134	1	2
138	1	10
14	1	14
128	0	11
233	0	11
30	1	7
51	1	19
196	0	15
313	0	14
16	0	0
309	2	10
\.


--
-- Data for Name: ruta; Type: TABLE DATA; Schema: public; Owner: grupo44
--

COPY public.ruta (ruta_id, nombre_ruta) FROM stdin;
228	XY8HXC
11	AMG0GS
245	6IYJIK
300	IY1YAZ
60	YA5VU9
210	Q0XMOZ
194	C6MFJ0
92	0OYDGV
157	NTF3K1
152	T8J2A0
14	PBHR03
135	8CPCJB
132	76XPPH
162	O7OQR3
312	70TYMP
227	QBQ6QT
271	5K548W
105	CVHVC0
86	H8ID3I
122	ZFC7QM
321	7R5YGB
308	VN5469
69	TWK2ZE
71	L248II
181	NTSDHY
229	XEX24O
42	PZUXC8
113	GLECPA
311	LMY0DE
115	O7MTOF
99	0FC33O
142	998DPO
49	XQ6QMN
324	8ZGVVP
151	XBHKZ2
314	JXY6NN
202	DHNAQQ
5	DTJDOT
88	U7A5XD
156	5WKRUK
2	IVQT9M
84	OIMFT2
8	Z9DVWY
121	KVFVS3
53	08WJ2A
32	MYWPY3
82	Z9K3CD
130	0F8ACU
90	NVAUJH
177	QE27HB
67	VAK51S
268	ERN3ZD
249	YSHISN
163	0DX8J2
284	0NK93O
232	5AQIX4
286	XJCAHW
179	D39FOL
87	ADUY39
168	CLMP9Z
261	MXCEKE
36	PWUA8T
72	5WQG5X
80	RYB3S9
47	KC8Y62
160	33HVQ2
188	2PEM5U
40	ZJEMX8
141	TDHVBC
126	547UP9
22	5FGXT6
299	NNK13O
263	J05NI3
306	EDJULU
199	HB98Y1
176	E5QY6A
148	GSFY17
224	QBLJD7
35	QP3D71
166	M0E2VC
159	CBCT9Z
52	QWTLFA
110	LHZ8BA
1	18KY7P
172	INYWS2
17	TIK99A
184	A4JX1P
102	FJX9RD
62	LX4Z31
221	ZTPPMK
242	QI906L
89	KEF2AH
201	FCECHM
283	Y0JJ90
66	4O7SL8
7	K5GOZD
305	RN5PVG
95	67QMBI
218	TJLV8L
138	JOGXIR
331	L5H2JJ
153	7T70C3
264	WXDI7Q
238	RAPNV8
111	GBAZ35
269	CPEQJR
237	JHLV8U
94	J0UAKI
41	4MRN2Z
119	AE7NNK
295	0WGM07
149	H07ABK
30	P1JNML
64	NHUYKH
45	M9SML5
170	8RJNOB
74	XB19B5
196	68MKO9
207	RQAS4J
223	7GVJ3W
327	NIVBRI
213	VADNG3
21	4DLT9Q
186	S7EFQ0
27	ZDG1DV
125	F71WGY
107	0MNBOM
48	T4G2CY
100	VRNJVM
243	69PTPZ
246	IDJFQ8
239	TNA65C
19	CUCU9Q
204	9UZAXU
39	Q34PN1
211	GK49N2
134	TKEQEZ
234	G4VW9B
26	B49HOM
103	MS97RE
326	MUYMAK
108	FHJOHU
29	GSXAVL
147	VHJA8G
9	TB95J3
161	9A0HFS
301	3XLBGH
270	XB3LLU
191	3PEMHF
114	Q0ZEMU
233	72V258
43	FESY8M
143	RARD48
137	4WJGOV
6	3F14TA
235	FZX3OV
3	1ZBIZ1
226	UGA3UB
51	23TZRO
106	CGIQEZ
171	9MTMR5
131	JDWRK1
322	UIQV7E
225	1YTYZ0
257	H1DOFB
128	MKSXGD
23	LC9Z05
78	6DD62K
209	QQ1Y9B
123	75GQI2
281	UB4BM2
315	99K7HE
75	8619FY
277	Q78AIJ
258	RRFFPL
68	LFTSZ8
282	7V3T0U
274	IW42AW
240	N1OP3K
93	3A7NAK
133	FD7RM3
4	3FW5YK
46	1XY0L9
318	A6DMKI
215	DIH3AP
220	0RNPEG
173	1BE5WY
313	HDZ23A
10	JX93RP
104	XQ4CKY
320	K91QGP
309	MHYOIA
208	32VJOV
275	S3YYD8
214	NACJ1T
79	AUPP3K
16	4CV43U
118	DNU0LJ
230	9EWF41
\.


--
-- Name: aerodromo_aerodromo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.aerodromo_aerodromo_id_seq', 1, false);


--
-- Name: aeronave_id_aeronave_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.aeronave_id_aeronave_seq', 1, false);


--
-- Name: arribo_operacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.arribo_operacion_id_seq', 1, false);


--
-- Name: certificado_aeronave_certificado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.certificado_aeronave_certificado_id_seq', 1, false);


--
-- Name: certificado_piloto_certificado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.certificado_piloto_certificado_id_seq', 1, false);


--
-- Name: ciudad_ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.ciudad_ciudad_id_seq', 1, false);


--
-- Name: compania_aerea_id_compania_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.compania_aerea_id_compania_seq', 1, false);


--
-- Name: despegue_operacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.despegue_operacion_id_seq', 1, false);


--
-- Name: fpl_fpl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.fpl_fpl_id_seq', 1, false);


--
-- Name: fpl_propuesta_propuesta_vuelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.fpl_propuesta_propuesta_vuelo_id_seq', 1, false);


--
-- Name: pais_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.pais_pais_id_seq', 1, false);


--
-- Name: pista_pista_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.pista_pista_id_seq', 1, false);


--
-- Name: puerto_embarque_puerto_embarque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.puerto_embarque_puerto_embarque_id_seq', 1, false);


--
-- Name: punto_id_punto_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.punto_id_punto_seq', 1, false);


--
-- Name: ruta_ruta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo44
--

SELECT pg_catalog.setval('public.ruta_ruta_id_seq', 1, false);


--
-- Name: aerodromo aerodromo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.aerodromo
    ADD CONSTRAINT aerodromo_pkey PRIMARY KEY (aerodromo_id);


--
-- Name: aeronave aeronave_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.aeronave
    ADD CONSTRAINT aeronave_pkey PRIMARY KEY (id_aeronave);


--
-- Name: arribo arribo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.arribo
    ADD CONSTRAINT arribo_pkey PRIMARY KEY (operacion_id);


--
-- Name: certificado_aeronave certificado_aeronave_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.certificado_aeronave
    ADD CONSTRAINT certificado_aeronave_pkey PRIMARY KEY (certificado_id);


--
-- Name: certificado_piloto certificado_piloto_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.certificado_piloto
    ADD CONSTRAINT certificado_piloto_pkey PRIMARY KEY (certificado_id);


--
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (ciudad_id);


--
-- Name: compania_aerea compania_aerea_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.compania_aerea
    ADD CONSTRAINT compania_aerea_pkey PRIMARY KEY (id_compania);


--
-- Name: despegue despegue_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.despegue
    ADD CONSTRAINT despegue_pkey PRIMARY KEY (operacion_id);


--
-- Name: fpl fpl_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT fpl_pkey PRIMARY KEY (fpl_id);


--
-- Name: fpl_propuesta fpl_propuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl_propuesta
    ADD CONSTRAINT fpl_propuesta_pkey PRIMARY KEY (propuesta_vuelo_id);


--
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (pais_id);


--
-- Name: piloto piloto_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.piloto
    ADD CONSTRAINT piloto_pkey PRIMARY KEY (pasaporte);


--
-- Name: pista pista_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.pista
    ADD CONSTRAINT pista_pkey PRIMARY KEY (pista_id);


--
-- Name: puerto_embarque puerto_embarque_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.puerto_embarque
    ADD CONSTRAINT puerto_embarque_pkey PRIMARY KEY (puerto_embarque_id);


--
-- Name: punto punto_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.punto
    ADD CONSTRAINT punto_pkey PRIMARY KEY (id_punto);


--
-- Name: puntos_ruta puntos_ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.puntos_ruta
    ADD CONSTRAINT puntos_ruta_pkey PRIMARY KEY ("Ruta.ruta_id", cardinalidad);


--
-- Name: ruta ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (ruta_id);


--
-- Name: aerodromo aerodromo_Ciudad.ciudad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.aerodromo
    ADD CONSTRAINT "aerodromo_Ciudad.ciudad_id_fkey" FOREIGN KEY ("Ciudad.ciudad_id") REFERENCES public.ciudad(ciudad_id);


--
-- Name: arribo arribo_Aeronave.id_aeronave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.arribo
    ADD CONSTRAINT "arribo_Aeronave.id_aeronave_fkey" FOREIGN KEY ("Aeronave.id_aeronave") REFERENCES public.aeronave(id_aeronave);


--
-- Name: arribo arribo_FPL.fpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.arribo
    ADD CONSTRAINT "arribo_FPL.fpl_id_fkey" FOREIGN KEY ("FPL.fpl_id") REFERENCES public.fpl(fpl_id);


--
-- Name: arribo arribo_Pista.id_pista_arribo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.arribo
    ADD CONSTRAINT "arribo_Pista.id_pista_arribo_fkey" FOREIGN KEY ("Pista.id_pista_arribo") REFERENCES public.pista(pista_id);


--
-- Name: arribo arribo_Puerto_Embarque.id_puerto_embarque_arribo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.arribo
    ADD CONSTRAINT "arribo_Puerto_Embarque.id_puerto_embarque_arribo_fkey" FOREIGN KEY ("Puerto_Embarque.id_puerto_embarque_arribo") REFERENCES public.puerto_embarque(puerto_embarque_id);


--
-- Name: certificado_piloto certificado_piloto_Piloto.pasaporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.certificado_piloto
    ADD CONSTRAINT "certificado_piloto_Piloto.pasaporte_fkey" FOREIGN KEY ("Piloto.pasaporte") REFERENCES public.piloto(pasaporte);


--
-- Name: ciudad ciudad_pais.pais_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT "ciudad_pais.pais_id_fkey" FOREIGN KEY ("pais.pais_id") REFERENCES public.pais(pais_id);


--
-- Name: despegue despegue_Aeronave.id_aeronave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.despegue
    ADD CONSTRAINT "despegue_Aeronave.id_aeronave_fkey" FOREIGN KEY ("Aeronave.id_aeronave") REFERENCES public.aeronave(id_aeronave);


--
-- Name: despegue despegue_FPL.fpl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.despegue
    ADD CONSTRAINT "despegue_FPL.fpl_id_fkey" FOREIGN KEY ("FPL.fpl_id") REFERENCES public.fpl(fpl_id);


--
-- Name: despegue despegue_Pista.id_pista_despegue_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.despegue
    ADD CONSTRAINT "despegue_Pista.id_pista_despegue_fkey" FOREIGN KEY ("Pista.id_pista_despegue") REFERENCES public.pista(pista_id);


--
-- Name: despegue despegue_Puerto_Embarque.id_puerto_embarque_despegue_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.despegue
    ADD CONSTRAINT "despegue_Puerto_Embarque.id_puerto_embarque_despegue_fkey" FOREIGN KEY ("Puerto_Embarque.id_puerto_embarque_despegue") REFERENCES public.puerto_embarque(puerto_embarque_id);


--
-- Name: fpl fpl_Aerodromo.aerodromo_llegada_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Aerodromo.aerodromo_llegada_id_fkey" FOREIGN KEY ("Aerodromo.aerodromo_llegada_id") REFERENCES public.aerodromo(aerodromo_id);


--
-- Name: fpl fpl_Aerodromo.aerodromo_salida_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Aerodromo.aerodromo_salida_id_fkey" FOREIGN KEY ("Aerodromo.aerodromo_salida_id") REFERENCES public.aerodromo(aerodromo_id);


--
-- Name: fpl fpl_Aeronave.id_aeronave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Aeronave.id_aeronave_fkey" FOREIGN KEY ("Aeronave.id_aeronave") REFERENCES public.aeronave(id_aeronave);


--
-- Name: fpl fpl_Compania_Aerea.id_compania_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Compania_Aerea.id_compania_fkey" FOREIGN KEY ("Compania_Aerea.id_compania") REFERENCES public.compania_aerea(id_compania);


--
-- Name: fpl fpl_FPL_Propuesta.propuesta_vuelo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_FPL_Propuesta.propuesta_vuelo_id_fkey" FOREIGN KEY ("FPL_Propuesta.propuesta_vuelo_id") REFERENCES public.fpl_propuesta(propuesta_vuelo_id);


--
-- Name: fpl fpl_Piloto.pasaporte_copiloto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Piloto.pasaporte_copiloto_fkey" FOREIGN KEY ("Piloto.pasaporte_copiloto") REFERENCES public.piloto(pasaporte);


--
-- Name: fpl fpl_Piloto.pasaporte_piloto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Piloto.pasaporte_piloto_fkey" FOREIGN KEY ("Piloto.pasaporte_piloto") REFERENCES public.piloto(pasaporte);


--
-- Name: fpl fpl_Ruta.ruta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl
    ADD CONSTRAINT "fpl_Ruta.ruta_id_fkey" FOREIGN KEY ("Ruta.ruta_id") REFERENCES public.ruta(ruta_id);


--
-- Name: fpl_propuesta fpl_propuesta_Aerodromo.aerodromo_llegada_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl_propuesta
    ADD CONSTRAINT "fpl_propuesta_Aerodromo.aerodromo_llegada_id_fkey" FOREIGN KEY ("Aerodromo.aerodromo_llegada_id") REFERENCES public.aerodromo(aerodromo_id);


--
-- Name: fpl_propuesta fpl_propuesta_Aerodromo.aerodromo_salida_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl_propuesta
    ADD CONSTRAINT "fpl_propuesta_Aerodromo.aerodromo_salida_id_fkey" FOREIGN KEY ("Aerodromo.aerodromo_salida_id") REFERENCES public.aerodromo(aerodromo_id);


--
-- Name: fpl_propuesta fpl_propuesta_Aeronave.id_aeronave_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl_propuesta
    ADD CONSTRAINT "fpl_propuesta_Aeronave.id_aeronave_fkey" FOREIGN KEY ("Aeronave.id_aeronave") REFERENCES public.aeronave(id_aeronave);


--
-- Name: fpl_propuesta fpl_propuesta_Compania_Aerea.id_compania_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.fpl_propuesta
    ADD CONSTRAINT "fpl_propuesta_Compania_Aerea.id_compania_fkey" FOREIGN KEY ("Compania_Aerea.id_compania") REFERENCES public.compania_aerea(id_compania);


--
-- Name: pista pista_Aerodromo.aerodromo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.pista
    ADD CONSTRAINT "pista_Aerodromo.aerodromo_id_fkey" FOREIGN KEY ("Aerodromo.aerodromo_id") REFERENCES public.aerodromo(aerodromo_id);


--
-- Name: puerto_embarque puerto_embarque_Aerodromo.aerodromo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.puerto_embarque
    ADD CONSTRAINT "puerto_embarque_Aerodromo.aerodromo_id_fkey" FOREIGN KEY ("Aerodromo.aerodromo_id") REFERENCES public.aerodromo(aerodromo_id);


--
-- Name: puntos_ruta puntos_ruta_Punto.id_punto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.puntos_ruta
    ADD CONSTRAINT "puntos_ruta_Punto.id_punto_fkey" FOREIGN KEY ("Punto.id_punto") REFERENCES public.punto(id_punto);


--
-- Name: puntos_ruta puntos_ruta_Ruta.ruta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: grupo44
--

ALTER TABLE ONLY public.puntos_ruta
    ADD CONSTRAINT "puntos_ruta_Ruta.ruta_id_fkey" FOREIGN KEY ("Ruta.ruta_id") REFERENCES public.ruta(ruta_id);


--
-- PostgreSQL database dump complete
--

