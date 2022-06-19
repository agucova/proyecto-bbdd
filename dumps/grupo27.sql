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


--
-- Name: tipo_usuario; Type: TYPE; Schema: public; Owner: grupo27
--

CREATE TYPE public.tipo_usuario AS ENUM (
    'admin_dgac',
    'compañia_aerea',
    'pasajero'
);


ALTER TYPE public.tipo_usuario OWNER TO grupo27;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aerodromo; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.aerodromo (
    id integer NOT NULL,
    icao character(4) NOT NULL,
    iata character(3) NOT NULL,
    id_ciudad integer NOT NULL,
    nombre character varying(120) NOT NULL,
    posicion point NOT NULL
);


ALTER TABLE public.aerodromo OWNER TO grupo27;

--
-- Name: aerodromo_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.aerodromo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aerodromo_id_seq OWNER TO grupo27;

--
-- Name: aerodromo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.aerodromo_id_seq OWNED BY public.aerodromo.id;


--
-- Name: aerolinea; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.aerolinea (
    id integer NOT NULL,
    codigo character(3) NOT NULL,
    nombre character varying(80) NOT NULL
);


ALTER TABLE public.aerolinea OWNER TO grupo27;

--
-- Name: aerolinea_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.aerolinea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aerolinea_id_seq OWNER TO grupo27;

--
-- Name: aerolinea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.aerolinea_id_seq OWNED BY public.aerolinea.id;


--
-- Name: avion; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.avion (
    id integer NOT NULL,
    codigo character(7) NOT NULL,
    id_modelo integer NOT NULL
);


ALTER TABLE public.avion OWNER TO grupo27;

--
-- Name: avion_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.avion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.avion_id_seq OWNER TO grupo27;

--
-- Name: avion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.avion_id_seq OWNED BY public.avion.id;


--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.ciudad (
    id integer NOT NULL,
    id_pais integer NOT NULL,
    nombre character varying(60) NOT NULL
);


ALTER TABLE public.ciudad OWNER TO grupo27;

--
-- Name: costo; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.costo (
    id_ruta integer NOT NULL,
    id_modelo integer NOT NULL,
    monto numeric NOT NULL
);


ALTER TABLE public.costo OWNER TO grupo27;

--
-- Name: licencia; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.licencia (
    id integer NOT NULL,
    id_piloto integer NOT NULL
);


ALTER TABLE public.licencia OWNER TO grupo27;

--
-- Name: modelo; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.modelo (
    id integer NOT NULL,
    codigo character varying(40) NOT NULL,
    id_nombre integer NOT NULL,
    peso double precision NOT NULL
);


ALTER TABLE public.modelo OWNER TO grupo27;

--
-- Name: nombre_modelo; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.nombre_modelo (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.nombre_modelo OWNER TO grupo27;

--
-- Name: pais; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.pais (
    id integer NOT NULL,
    nombre character varying(80) NOT NULL
);


ALTER TABLE public.pais OWNER TO grupo27;

--
-- Name: pais_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pais_id_seq OWNER TO grupo27;

--
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.pais_id_seq OWNED BY public.pais.id;


--
-- Name: pasajero; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.pasajero (
    id integer NOT NULL,
    pasaporte character varying(40) NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_nacimiento date NOT NULL,
    nacionalidad character varying(50) NOT NULL
);


ALTER TABLE public.pasajero OWNER TO grupo27;

--
-- Name: punto_ruta; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.punto_ruta (
    id_ruta integer NOT NULL,
    indice integer NOT NULL,
    nombre character varying(100) NOT NULL,
    posicion point NOT NULL
);


ALTER TABLE public.punto_ruta OWNER TO grupo27;

--
-- Name: reserva; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.reserva (
    id integer NOT NULL,
    codigo character(12) NOT NULL,
    id_reservante integer NOT NULL
);


ALTER TABLE public.reserva OWNER TO grupo27;

--
-- Name: ruta; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.ruta (
    id integer NOT NULL,
    nombre character(6) NOT NULL
);


ALTER TABLE public.ruta OWNER TO grupo27;

--
-- Name: ruta_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.ruta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruta_id_seq OWNER TO grupo27;

--
-- Name: ruta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.ruta_id_seq OWNED BY public.ruta.id;


--
-- Name: ticket; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.ticket (
    id integer NOT NULL,
    id_vuelo integer NOT NULL,
    id_reserva integer NOT NULL,
    id_pasajero integer NOT NULL,
    asiento integer NOT NULL,
    clase character varying(20) NOT NULL,
    comida_y_maleta boolean NOT NULL
);


ALTER TABLE public.ticket OWNER TO grupo27;

--
-- Name: trabajador; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.trabajador (
    id integer NOT NULL,
    pasaporte character varying(40) NOT NULL,
    nombre character varying(120) NOT NULL,
    fecha_nacimiento date NOT NULL
);


ALTER TABLE public.trabajador OWNER TO grupo27;

--
-- Name: trabajador_aerolinea; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.trabajador_aerolinea (
    id_trabajador integer NOT NULL,
    id_aerolinea integer NOT NULL
);


ALTER TABLE public.trabajador_aerolinea OWNER TO grupo27;

--
-- Name: trabajador_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.trabajador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trabajador_id_seq OWNER TO grupo27;

--
-- Name: trabajador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.trabajador_id_seq OWNED BY public.trabajador.id;


--
-- Name: trabajador_vuelo; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.trabajador_vuelo (
    id_vuelo integer NOT NULL,
    id_trabajador integer NOT NULL,
    rol character varying(100) NOT NULL
);


ALTER TABLE public.trabajador_vuelo OWNER TO grupo27;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    clave character varying(300) NOT NULL,
    tipo public.tipo_usuario NOT NULL
);


ALTER TABLE public.usuario OWNER TO grupo27;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

ALTER TABLE public.usuario ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: vuelo; Type: TABLE; Schema: public; Owner: grupo27
--

CREATE TABLE public.vuelo (
    id integer NOT NULL,
    id_aerolinea integer NOT NULL,
    id_origen integer NOT NULL,
    id_destino integer NOT NULL,
    id_avion integer NOT NULL,
    id_ruta integer NOT NULL,
    codigo character varying(20) NOT NULL,
    fecha_salida timestamp with time zone NOT NULL,
    fecha_llegada timestamp with time zone NOT NULL,
    velocidad double precision NOT NULL,
    altitud double precision NOT NULL,
    estado character varying(20) NOT NULL
);


ALTER TABLE public.vuelo OWNER TO grupo27;

--
-- Name: vuelo_id_seq; Type: SEQUENCE; Schema: public; Owner: grupo27
--

CREATE SEQUENCE public.vuelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuelo_id_seq OWNER TO grupo27;

--
-- Name: vuelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: grupo27
--

ALTER SEQUENCE public.vuelo_id_seq OWNED BY public.vuelo.id;


--
-- Name: aerodromo id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerodromo ALTER COLUMN id SET DEFAULT nextval('public.aerodromo_id_seq'::regclass);


--
-- Name: aerolinea id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerolinea ALTER COLUMN id SET DEFAULT nextval('public.aerolinea_id_seq'::regclass);


--
-- Name: avion id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.avion ALTER COLUMN id SET DEFAULT nextval('public.avion_id_seq'::regclass);


--
-- Name: pais id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.pais ALTER COLUMN id SET DEFAULT nextval('public.pais_id_seq'::regclass);


--
-- Name: ruta id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ruta ALTER COLUMN id SET DEFAULT nextval('public.ruta_id_seq'::regclass);


--
-- Name: trabajador id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador ALTER COLUMN id SET DEFAULT nextval('public.trabajador_id_seq'::regclass);


--
-- Name: vuelo id; Type: DEFAULT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo ALTER COLUMN id SET DEFAULT nextval('public.vuelo_id_seq'::regclass);


--
-- Data for Name: aerodromo; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.aerodromo (id, icao, iata, id_ciudad, nombre, posicion) FROM stdin;
41	PVOW	LMF	25	Aeropuerto Internacional de Icheon	(159.1,71.9)
21	IWJC	HKA	18	Aeropuerto Internacional Toronto Pearson	(40.2,41.8)
55	TBJM	SFF	33	Aeropuerto de Roma-Fiumicino	(157.2,26.7)
25	KMPW	HOX	29	Aeropuerto Internacional Kingsford Smith	(22.5,59.4)
23	JKRA	HNB	30	Aeropuerto Internacional de Melbourne	(19.5,53.9)
69	XOEY	VNN	2	Aeropuerto Internacional Ataturk	(104,154.4)
43	PYIM	NVI	5	Aeropuerto Internacional de Carrasco	(66.4,148)
75	YHEP	YGY	9	Aeropuerto Big Apple	(43,118.1)
1	BLFS	AWR	19	Aeropuerto Internacional Arturo Merino Benítez	(75.4,106.5)
15	GPRK	DUU	10	Aeropuerto Internacional de San Francisco	(45.1,142.8)
77	ZGUA	ZLQ	29	Aeropuerto Internacional de Australia	(27.3,111.1)
29	MBOO	HSJ	6	Aeropuerto de Adolfo Suárez Madrid-Barajas	(54.2,174.5)
27	KZZS	HRV	31	Aeropuerto Internacional de El Cairo	(103.8,107.6)
19	HGZT	HCM	15	Aeropuerto de París-Charles de Gaulle	(147.2,49.6)
7	EEGZ	BXS	20	Aeropuerto Internacional de Galeão	(6.8,90.3)
57	TCGF	SPT	34	Aeropuerto de Milán-Malpensa	(70.1,56.3)
71	XSAM	WHO	9	Aeropuerto Internacional de Nueva York	(89.8,171.2)
67	XEWM	VBH	7	Aeropuerto de Ibiza	(156.8,54.8)
13	GAWW	CPH	11	Aeropuerto Internacional de Miami	(96.1,8.4)
39	PFXE	LCX	32	Aeropuerto Internacional de Haneda	(153.8,40.2)
31	MVPW	JIZ	8	Aeropuerto Josep Tarradellas Barcelona-El Prat	(52.7,165.2)
17	GSPA	EPM	23	Aeropuerto de la Ciudad de Londres	(152.5,76.9)
49	SGWN	QJM	22	Aeropuerto Internacional El Alto	(173.5,5.6)
33	NBMQ	JTM	26	Aeropuerto Internacional de Pekín	(133.5,57.9)
9	FCJT	BYB	12	Aeropuerto Internacional O'Hare	(166.5,51)
73	XSZW	WKT	19	Aeropuerto Internacional de Copiapo	(92.2,129.6)
35	NZTG	KFE	27	Aeropuerto Internacional Pudong	(153.9,115.7)
45	RCQR	OHI	4	Aeropuerto de Ámsterdam-Schiphol	(37.1,60.9)
63	URLQ	UAU	17	Aeropuerto Internacional Indira Gandhi	(149.9,125.7)
47	SDSC	PKS	24	Aeropuerto Internacional de Cancún	(103.3,99.4)
5	DZFP	BKT	21	Aeropuerto Internacional de São Paulo-Guarulhos	(17.9,177.8)
51	SIMJ	RFP	16	Aeropuerto Internacional de la Ciudad del Cabo	(47.4,157.1)
53	TAZY	RRK	13	Aeropuerto Internacional Jorge Chávez	(62.2,148.1)
65	VBIT	UYL	14	Aeropuerto Internacional de Maiquetía Simón Bolívar	(144,165.7)
3	BVWK	BAH	3	Aeropuerto Internacional de Ezeiza	(14.7,51.2)
59	TQQZ	TEF	1	Aeropuerto de Hong Kong	(142.6,4.1)
37	NZTP	KZN	28	Aeropuerto Internacional Ben Gurión	(159.3,167.2)
61	UQQX	TQV	35	Aeropuerto Internacional Eleftherios Venizelos	(72.4,102.6)
11	FOLH	CKR	9	Aeropuerto Internacional John F. Kennedy	(18.1,123.4)
\.


--
-- Data for Name: aerolinea; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.aerolinea (id, codigo, nombre) FROM stdin;
1	ADC	AEROVIAS DAP (centro/norte)
2	AZI	ALITALIA
3	BTA	BRITISH
4	COG	OCEANAIR
5	EAL	EASTERN AIRLINES
6	ETA	ETHOPIAN AIRLINES
7	IBE	IBERIA
8	KAI	KALITTA AIR
9	KEA	KOREAN AIR
10	LAM	LATAM ARGENTINA
11	LAT	LATAM INTER
12	LAW	LAW
13	LRC	LACSA
14	LUD	LATAM DOMESTICO
15	MPH	MARTINAIR HOLLAND
16	NCY	NO_COMPANY
17	QAF	QANTAS
18	UAN	UNITED
19	UCA	LATAM CARGO
20	XLE	LATAM ECUADOR
\.


--
-- Data for Name: avion; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.avion (id, codigo, id_modelo) FROM stdin;
1	HVKSCXU	1
2	ZQZKYVL	2
3	YSLMIYD	3
4	NEWSDBH	4
5	JQLPBYZ	5
6	OJFBABA	6
7	WYPTNLZ	7
8	HTJXZZO	8
9	ALYMGWS	9
10	DTNMCIK	10
11	TPUYDBP	11
12	RHVXKLV	12
13	REBDPFN	13
14	HEPBRIE	14
15	WRAPXAO	15
16	ECWYCIG	16
17	FSFMKAE	17
18	KDFWVBZ	18
19	VEMIWPS	19
20	PNILCYN	20
21	KYKNUTH	21
22	CQRMLHT	22
23	LNHBEFA	23
24	NLBYLJG	24
25	AMJXYDC	25
26	BQIKFIC	26
27	MRUIKBP	27
28	RWDSNHW	28
\.


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.ciudad (id, id_pais, nombre) FROM stdin;
1	1	Hong Kong
2	2	Estambul
3	3	Buenos Aires
4	4	Amsterdam
5	5	Montevideo
6	6	Madrid
7	6	Ibiza
8	6	Barcelona
9	7	Nueva York
10	7	San Francisco
11	7	Miami
12	7	Chicago
13	8	Lima
14	9	Caracas
15	10	Paris
16	11	Ciudad del Cabo
17	12	Nueva Delhi
18	13	Toronto
19	14	Santiago
20	15	Rio de Janeiro
21	15	Sao Pablo
22	16	La Paz
23	17	Londres
24	18	Cancun
25	19	Seul
26	20	Beijing
27	20	Shangai
28	20	Tel Aviv
29	21	Sidney
30	21	Melbourne
31	22	El Cairo
32	23	Tokio
33	24	Roma
34	24	Milan
35	25	Atenas
\.


--
-- Data for Name: costo; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.costo (id_ruta, id_modelo, monto) FROM stdin;
22	1	214000
149	2	1990000
268	1	143000
100	3	321000
168	2	1330000
79	4	1850000
93	5	900000
71	6	5280000
122	7	460000
143	8	157000
89	9	162000
137	5	3370000
171	10	1090000
213	11	840000
53	2	1660000
258	3	142000
243	12	1310000
184	12	990000
186	1	143000
179	13	320000
130	14	2510000
242	13	320000
78	15	169000
66	2	660000
162	2	660000
235	16	2290000
274	7	860000
68	4	410000
126	17	662000
60	18	940000
14	2	4980000
162	12	880000
125	13	267000
72	6	2640000
23	19	1240000
115	8	126000
62	20	302000
46	1	72000
161	19	2070000
194	11	3370000
80	2	1490000
94	8	42000
69	3	160000
208	21	2010000
87	5	1350000
261	1	107000
166	2	660000
163	10	440000
105	20	403000
82	22	1670000
45	6	700000
84	21	890000
181	19	1240000
53	9	65000
51	4	2460000
138	1	72000
90	2	2990000
143	23	77000
92	24	222000
152	4	1640000
29	21	1340000
202	25	209000
95	14	1250000
64	13	320000
88	20	454000
134	7	580000
88	7	350000
69	17	331000
107	9	325000
133	22	1110000
160	10	1970000
42	4	1640000
214	13	240000
209	1	143000
118	26	1640000
240	3	214000
80	26	1640000
156	21	2680000
128	25	157000
238	19	1240000
173	16	1910000
211	12	1640000
17	16	3050000
269	1	536000
196	2	3980000
245	22	1670000
199	3	142000
90	22	830000
114	1	107000
103	20	101000
271	7	1440000
111	11	840000
134	15	113000
75	19	2070000
137	3	641000
108	21	1340000
131	8	188000
106	13	400000
123	18	940000
234	24	222000
191	11	1690000
210	4	3690000
246	8	188000
121	9	130000
113	16	3820000
32	20	202000
208	20	378000
71	27	2220000
153	2	660000
153	22	830000
132	14	3480000
172	10	1090000
122	15	226000
170	18	1880000
264	1	286000
249	16	2290000
141	22	1670000
43	3	142000
151	9	162000
104	28	740000
237	25	418000
207	22	830000
100	13	481000
263	1	107000
122	6	700000
188	25	174000
74	13	400000
123	17	276000
142	5	1690000
148	26	1460000
201	27	2220000
239	17	166000
102	13	320000
67	20	454000
86	15	226000
270	1	143000
66	4	620000
\.


--
-- Data for Name: licencia; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.licencia (id, id_piloto) FROM stdin;
31	38
35	24
45	8
12	15
17	59
50	31
36	25
28	17
47	25
11	10
37	0
48	59
15	8
41	34
25	37
0	54
22	21
49	23
7	7
46	15
2	34
51	21
40	38
19	41
29	9
26	29
44	29
53	3
32	3
42	3
43	3
52	29
\.


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.modelo (id, codigo, id_nombre, peso) FROM stdin;
1	747-400	1	178.75
2	737-400	2	33.2
3	747-300	1	178.1
4	CRJ700	3	20.509
5	CRJ900	3	22.48
6	A220-100	4	35.221
7	Praetor 600	5	11.503
8	A350-900	6	104.6
9	747-100	1	162.4
10	E175-LR	7	21.886
11	737-200	2	28.12
12	E175-AR	7	21.906
13	A380-700	8	267
14	E190-AR	9	27.853
15	A380 Prestige	8	282
16	737-700	2	38.15
17	A380-800	8	276
18	737-500	2	31.3
19	737-800	2	41.415
20	A380-800F	8	252
21	737-900ER	2	44.675
22	E190-LR	9	27.753
23	Globemaster III	10	127.913
24	747-ER	1	184.6
25	747-200B	1	174
26	737-600	2	36.38
27	A220-300	4	37.081
28	Global 8000	11	24.63
\.


--
-- Data for Name: nombre_modelo; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.nombre_modelo (id, nombre) FROM stdin;
1	Boeing 747
2	Boeing 737
3	Bombardier CRJ
4	Airbus A220
5	Embraer Praetor
6	Airbus A350
7	Embraer E175
8	Airbus A380
9	Embraer E190
10	Boeing C-17
11	Bombardier Global
\.


--
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.pais (id, nombre) FROM stdin;
1	Hong Kong
2	Turquia
3	Argentina
4	Paises Bajos
5	Uruguay
6	España
7	Estados Unidos
8	Peru
9	Venezuela
10	Francia
11	Sudafrica
12	India
13	Canada
14	Chile
15	Brasil
16	Bolivia
17	Inglaterra
18	Mexico
19	Corea del Sur
20	China
21	Australia
22	Egipto
23	Japon
24	Italia
25	Grecia
\.


--
-- Data for Name: pasajero; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.pasajero (id, pasaporte, nombre, fecha_nacimiento, nacionalidad) FROM stdin;
1	V03976673	Mark Greene	1998-12-09	chilena
2	I07581924	Kelsey Powell	1989-07-10	francesa
3	F15206543	Kristen Harris	1972-11-25	chilena
4	P34583903	Kelsey Huff	1972-08-08	estadounidense
5	H23592194	Ethan Gilbert	1975-12-30	uruguaya
6	C87025090	Diana Frank	1979-12-07	alemana
7	G15489494	Anthony Francis	1988-02-13	argentina
8	J46610530	Andrew Torres	1981-12-01	alemana
9	U37349664	Diane Ritter	1996-05-05	venezolana
10	J86333952	Leslie Howard	1971-09-22	venezolana
11	R17782317	Zachary Davenport	1971-12-29	venezolana
12	M25657749	Casey Bennett	1984-03-12	estadounidense
13	T33834498	Alejandro Allen	1992-05-20	chilena
14	D76513142	Victoria Brennan	1977-06-19	uruguaya
15	E44895667	Angela Reynolds	1982-08-09	estadounidense
16	N49905893	Emma Scott	1989-07-29	chilena
17	K07643594	Suzanne Goodman	1987-11-16	chilena
18	P11550487	Maria Perez	1996-08-11	francesa
19	J39937043	Danielle Johnson	1981-12-18	mexicana
20	N15841852	John Mcneil	1981-06-15	chilena
21	O01507856	James Hunter	1995-05-14	chilena
22	O41678476	Andrew Malone	1996-06-24	argentina
23	X49704522	James Rojas	1986-05-29	chilena
24	L94336722	Julia Watkins	1995-08-25	uruguaya
25	F70729457	Justin Hudson	1994-02-12	chilena
26	G04408945	Robert Butler	1974-02-02	argentina
27	O04335063	Jonathan Sims	1974-04-13	estadounidense
28	U68917595	Paul Brown	1987-08-24	francesa
29	J46009647	Erica Ochoa	1994-03-11	italiana
30	N07672370	Kevin Wilson	1986-09-11	uruguaya
31	Y23187711	Vicki Ward	1981-08-31	argentina
32	Y05451726	Kathleen Johnson	1973-02-24	chilena
33	N47846939	John Lee	1996-01-25	italiana
34	L87663260	Heather Bolton	1982-09-17	estadounidense
35	I71542181	Alfred Martin Jr.	1989-11-10	chilena
36	R10584802	John Luna	1983-11-04	chilena
37	J47009281	Susan Stewart MD	1997-02-08	estadounidense
38	H44001820	Ann Robertson	1998-04-27	venezolana
39	D39176940	Patrick Choi	1985-06-26	chilena
40	W06120402	Adam Clark	1993-06-10	estadounidense
41	T72132858	Kathy Luna	1990-07-13	chilena
42	Z09262256	Joseph Wilson	1993-07-28	uruguaya
43	C63211080	Brian Mitchell	1983-05-04	chilena
44	L97895867	Sarah Williams	1992-11-06	uruguaya
45	T59160871	Lucas Jones	1992-03-02	uruguaya
46	Y13424296	Katherine Perez	1978-07-29	mexicana
47	V79731274	Corey Elliott	1979-10-04	venezolana
48	Q62966391	Patricia Parker	1994-08-07	mexicana
49	O85238546	Sheri Mcdonald	1984-03-14	argentina
50	N24258653	Kayla Douglas	1970-04-28	uruguaya
51	J34719947	Heather Scott	1973-05-02	estadounidense
52	D84069297	Brittany Jones	1978-04-30	uruguaya
53	X66304032	Victoria Odom	1986-12-04	francesa
54	N68461604	Gary Vasquez	1984-11-21	chilena
55	F89276118	Todd Wilkins	1991-01-30	italiana
56	D64763364	James Johnson	1994-06-09	chilena
57	F09235820	Katrina Frye	1995-10-11	chilena
58	R56995721	David Keller	1975-07-24	venezolana
59	Q76465555	Isaiah Wood	1980-11-05	francesa
60	D46250570	Michael Mcdaniel	1994-11-04	venezolana
61	Z51226931	Matthew Simmons	1978-05-18	chilena
62	I19062847	Christopher Garcia	1986-12-06	chilena
63	D99418548	Alexis Smith	1997-03-21	argentina
64	L56496275	Cheryl Bolton	1972-12-16	uruguaya
65	T18212951	Joel Compton	1991-03-03	argentina
66	N55362278	Laura Marshall	1991-05-19	chilena
67	X84322989	Mr. Russell Abbott	1984-11-16	chilena
68	C59429415	Brian Garcia	1992-04-20	chilena
69	S05106445	Gregory Andrade	1984-12-20	mexicana
70	I71394677	Jessica Macias	1986-04-12	chilena
71	I63697476	Emily Sullivan	1991-07-25	venezolana
72	F23633774	Amanda Ruiz	1977-07-09	francesa
73	P84627985	Meghan Davis	1970-11-15	chilena
74	G69357980	Jerry Park	1980-06-28	argentina
75	Y88079794	Gregory Bradley	1986-04-18	chilena
76	Z87364523	Samantha Martin	1981-03-26	alemana
77	Y38354449	Nicole Petty	1988-02-07	estadounidense
78	J76795477	Mikayla White	1984-09-30	argentina
79	Y33413387	Kimberly Hansen	1989-07-02	argentina
80	J33947155	Amanda Mccarthy	1995-08-25	venezolana
81	F69466449	Jennifer Eaton	1995-08-29	chilena
82	A17367163	Jane Berger	1987-05-29	italiana
83	A40223024	Janice Smith	1993-03-25	argentina
84	X91486662	Heather Smith	1976-11-13	chilena
85	S03830222	Amanda Andrade	1993-11-06	italiana
86	B30315997	Tina Shaw	1996-10-26	estadounidense
87	V39868007	Cassandra Kirby	1997-04-02	chilena
88	G96421276	Alexander Martin	1980-04-24	estadounidense
89	W23173820	Gabrielle Alvarez	1992-11-04	argentina
90	I78807927	Robert Kelly	1975-02-26	chilena
\.


--
-- Data for Name: punto_ruta; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.punto_ruta (id_ruta, indice, nombre, posicion) FROM stdin;
1	1	URIDA	(-43.275278,-72.670556)
1	2	MUBIL	(-38.915556,-72.252222)
1	3	REKET	(-44.098889,-72.380833)
2	1	EL138	(-33.401844,-70.642517)
2	2	ARMOS	(-24.291667,-67.979167)
3	1	ASALA	(-27.675556,-108.439444)
3	2	EDSUK	(-31.416667,-90)
3	3	EL138	(-33.401844,-70.642517)
3	4	MUKSO	(-43.280278,-72.974444)
4	1	MUBIL	(-38.915556,-72.252222)
4	2	TESEX	(-38.931111,-71.433611)
5	1	GE025	(-37.353156,-72.419825)
5	2	URIDA	(-43.275278,-72.670556)
5	3	GUVOL	(-32.375,-70.225)
6	1	SIROV	(-34.584722,-70.622778)
6	2	MUKSO	(-43.280278,-72.974444)
6	3	ARMOS	(-24.291667,-67.979167)
7	1	MUNER	(-52,-71.31)
7	2	SOTKU	(-21.866667,-68.0625)
7	3	REKET	(-44.098889,-72.380833)
7	4	ANGAT	(-23.151944,-68.553056)
7	5	GUVOL	(-32.375,-70.225)
8	1	ASALA	(-27.675556,-108.439444)
8	2	EDSUK	(-31.416667,-90)
8	3	EL138	(-33.401844,-70.642517)
8	4	URIDA	(-43.275278,-72.670556)
8	5	MUBIL	(-38.915556,-72.252222)
8	6	ANGAT	(-23.151944,-68.553056)
9	1	MUBIL	(-38.915556,-72.252222)
9	2	SIROV	(-34.584722,-70.622778)
10	1	VUDAP	(-23.143889,-68.805)
10	2	ARMOS	(-24.291667,-67.979167)
11	1	ASALA	(-27.675556,-108.439444)
11	2	ANGAT	(-23.151944,-68.553056)
14	1	IVDM	(-32.9441666666667,-71.4702777777778)
14	2	EDSUK	(-31.416667,-90)
14	3	EL138	(-33.401844,-70.642517)
14	4	VUDAP	(-23.143889,-68.805)
14	5	ANGAT	(-23.151944,-68.553056)
14	6	GUVOL	(-32.375,-70.225)
16	1	MUNER	(-52,-71.31)
16	2	GE025	(-37.353156,-72.419825)
17	1	MUBIL	(-38.915556,-72.252222)
17	2	SIROV	(-34.584722,-70.622778)
17	3	MUKSO	(-43.280278,-72.974444)
17	4	BAL	(-45.913056,-71.7125)
19	1	MUKSO	(-43.280278,-72.974444)
19	2	VUDAP	(-23.143889,-68.805)
21	1	URIDA	(-43.275278,-72.670556)
21	2	BAL	(-45.913056,-71.7125)
21	3	SASTI	(-42.591944,-73.228333)
22	1	IVDM	(-32.9441666666667,-71.4702777777778)
22	2	GE025	(-37.353156,-72.419825)
22	3	MUBIL	(-38.915556,-72.252222)
23	1	SIROV	(-34.584722,-70.622778)
23	2	VUDAP	(-23.143889,-68.805)
26	1	IVDM	(-32.9441666666667,-71.4702777777778)
26	2	GE025	(-37.353156,-72.419825)
26	3	SASTI	(-42.591944,-73.228333)
27	1	ASALA	(-27.675556,-108.439444)
27	2	MUNER	(-52,-71.31)
29	1	MUNER	(-52,-71.31)
29	2	URIDA	(-43.275278,-72.670556)
29	3	VUDAP	(-23.143889,-68.805)
30	1	EDSUK	(-31.416667,-90)
30	2	TESEX	(-38.931111,-71.433611)
30	3	OPURA	(-45.268611,-71.955)
30	4	ANGAT	(-23.151944,-68.553056)
32	1	EDSUK	(-31.416667,-90)
32	2	MUNER	(-52,-71.31)
32	3	EL138	(-33.401844,-70.642517)
32	4	GUVOL	(-32.375,-70.225)
35	1	MUBIL	(-38.915556,-72.252222)
35	2	SOTKU	(-21.866667,-68.0625)
35	3	BAL	(-45.913056,-71.7125)
35	4	ARMOS	(-24.291667,-67.979167)
36	1	EL138	(-33.401844,-70.642517)
36	2	SIROV	(-34.584722,-70.622778)
36	3	REKET	(-44.098889,-72.380833)
36	4	GUVOL	(-32.375,-70.225)
39	1	VUDAP	(-23.143889,-68.805)
39	2	ANGAT	(-23.151944,-68.553056)
40	1	EDSUK	(-31.416667,-90)
40	2	MUKSO	(-43.280278,-72.974444)
40	3	SOTKU	(-21.866667,-68.0625)
40	4	GUVOL	(-32.375,-70.225)
41	1	ANGAT	(-23.151944,-68.553056)
41	2	SASTI	(-42.591944,-73.228333)
42	1	EL138	(-33.401844,-70.642517)
42	2	GE025	(-37.353156,-72.419825)
42	3	TESEX	(-38.931111,-71.433611)
42	4	REKET	(-44.098889,-72.380833)
43	1	EDSUK	(-31.416667,-90)
43	2	MUNER	(-52,-71.31)
43	3	URIDA	(-43.275278,-72.670556)
43	4	MUKSO	(-43.280278,-72.974444)
45	1	EL138	(-33.401844,-70.642517)
45	2	GUVOL	(-32.375,-70.225)
46	1	EDSUK	(-31.416667,-90)
46	2	MUBIL	(-38.915556,-72.252222)
47	1	MUBIL	(-38.915556,-72.252222)
47	2	ARMOS	(-24.291667,-67.979167)
47	3	SASTI	(-42.591944,-73.228333)
48	1	EDSUK	(-31.416667,-90)
48	2	SIROV	(-34.584722,-70.622778)
49	1	EDSUK	(-31.416667,-90)
49	2	EL138	(-33.401844,-70.642517)
49	3	OPURA	(-45.268611,-71.955)
49	4	MUKSO	(-43.280278,-72.974444)
51	1	MUNER	(-52,-71.31)
51	2	SOTKU	(-21.866667,-68.0625)
51	3	ARMOS	(-24.291667,-67.979167)
51	4	SASTI	(-42.591944,-73.228333)
52	1	IVDM	(-32.9441666666667,-71.4702777777778)
52	2	OPURA	(-45.268611,-71.955)
52	3	REKET	(-44.098889,-72.380833)
53	1	MUNER	(-52,-71.31)
53	2	URIDA	(-43.275278,-72.670556)
60	1	OPURA	(-45.268611,-71.955)
60	2	VUDAP	(-23.143889,-68.805)
62	1	IVDM	(-32.9441666666667,-71.4702777777778)
62	2	EDSUK	(-31.416667,-90)
62	3	MUNER	(-52,-71.31)
62	4	SIROV	(-34.584722,-70.622778)
64	1	GE025	(-37.353156,-72.419825)
64	2	MUBIL	(-38.915556,-72.252222)
64	3	BAL	(-45.913056,-71.7125)
66	1	MUNER	(-52,-71.31)
66	2	MUKSO	(-43.280278,-72.974444)
67	1	MUNER	(-52,-71.31)
67	2	EL138	(-33.401844,-70.642517)
67	3	VUDAP	(-23.143889,-68.805)
68	1	VUDAP	(-23.143889,-68.805)
68	2	BAL	(-45.913056,-71.7125)
69	1	EDSUK	(-31.416667,-90)
69	2	URIDA	(-43.275278,-72.670556)
69	3	ANGAT	(-23.151944,-68.553056)
71	1	MUNER	(-52,-71.31)
71	2	GE025	(-37.353156,-72.419825)
71	3	MUBIL	(-38.915556,-72.252222)
71	4	TESEX	(-38.931111,-71.433611)
71	5	SIROV	(-34.584722,-70.622778)
71	6	ARMOS	(-24.291667,-67.979167)
72	1	URIDA	(-43.275278,-72.670556)
72	2	SOTKU	(-21.866667,-68.0625)
72	3	ANGAT	(-23.151944,-68.553056)
72	4	ARMOS	(-24.291667,-67.979167)
72	5	GUVOL	(-32.375,-70.225)
74	1	SOTKU	(-21.866667,-68.0625)
74	2	REKET	(-44.098889,-72.380833)
74	3	SASTI	(-42.591944,-73.228333)
75	1	ASALA	(-27.675556,-108.439444)
75	2	TESEX	(-38.931111,-71.433611)
78	1	IVDM	(-32.9441666666667,-71.4702777777778)
78	2	EDSUK	(-31.416667,-90)
79	1	ASALA	(-27.675556,-108.439444)
79	2	ARMOS	(-24.291667,-67.979167)
79	3	SASTI	(-42.591944,-73.228333)
80	1	IVDM	(-32.9441666666667,-71.4702777777778)
80	2	OPURA	(-45.268611,-71.955)
80	3	SIROV	(-34.584722,-70.622778)
82	1	IVDM	(-32.9441666666667,-71.4702777777778)
82	2	EL138	(-33.401844,-70.642517)
82	3	SIROV	(-34.584722,-70.622778)
82	4	SASTI	(-42.591944,-73.228333)
84	1	ASALA	(-27.675556,-108.439444)
84	2	MUKSO	(-43.280278,-72.974444)
86	1	IVDM	(-32.9441666666667,-71.4702777777778)
86	2	EL138	(-33.401844,-70.642517)
86	3	GE025	(-37.353156,-72.419825)
86	4	VUDAP	(-23.143889,-68.805)
87	1	VUDAP	(-23.143889,-68.805)
87	2	SOTKU	(-21.866667,-68.0625)
88	1	VUDAP	(-23.143889,-68.805)
88	2	ANGAT	(-23.151944,-68.553056)
88	3	GUVOL	(-32.375,-70.225)
89	1	ASALA	(-27.675556,-108.439444)
89	2	EDSUK	(-31.416667,-90)
89	3	MUNER	(-52,-71.31)
89	4	SIROV	(-34.584722,-70.622778)
89	5	ANGAT	(-23.151944,-68.553056)
90	1	GE025	(-37.353156,-72.419825)
90	2	MUKSO	(-43.280278,-72.974444)
90	3	ANGAT	(-23.151944,-68.553056)
92	1	MUKSO	(-43.280278,-72.974444)
92	2	BAL	(-45.913056,-71.7125)
93	1	IVDM	(-32.9441666666667,-71.4702777777778)
93	2	MUNER	(-52,-71.31)
94	1	MUBIL	(-38.915556,-72.252222)
94	2	REKET	(-44.098889,-72.380833)
95	1	MUNER	(-52,-71.31)
95	2	TESEX	(-38.931111,-71.433611)
95	3	OPURA	(-45.268611,-71.955)
99	1	IVDM	(-32.9441666666667,-71.4702777777778)
99	2	EL138	(-33.401844,-70.642517)
99	3	SIROV	(-34.584722,-70.622778)
100	1	GE025	(-37.353156,-72.419825)
100	2	TESEX	(-38.931111,-71.433611)
100	3	SIROV	(-34.584722,-70.622778)
100	4	MUKSO	(-43.280278,-72.974444)
100	5	ARMOS	(-24.291667,-67.979167)
100	6	SASTI	(-42.591944,-73.228333)
102	1	EL138	(-33.401844,-70.642517)
102	2	GE025	(-37.353156,-72.419825)
102	3	BAL	(-45.913056,-71.7125)
103	1	MUKSO	(-43.280278,-72.974444)
103	2	GUVOL	(-32.375,-70.225)
104	1	EL138	(-33.401844,-70.642517)
104	2	VUDAP	(-23.143889,-68.805)
104	3	REKET	(-44.098889,-72.380833)
105	1	ASALA	(-27.675556,-108.439444)
105	2	GE025	(-37.353156,-72.419825)
105	3	VUDAP	(-23.143889,-68.805)
105	4	SOTKU	(-21.866667,-68.0625)
106	1	SIROV	(-34.584722,-70.622778)
106	2	VUDAP	(-23.143889,-68.805)
106	3	GUVOL	(-32.375,-70.225)
107	1	VUDAP	(-23.143889,-68.805)
107	2	REKET	(-44.098889,-72.380833)
107	3	BAL	(-45.913056,-71.7125)
107	4	ARMOS	(-24.291667,-67.979167)
108	1	URIDA	(-43.275278,-72.670556)
108	2	GUVOL	(-32.375,-70.225)
110	1	EL138	(-33.401844,-70.642517)
110	2	URIDA	(-43.275278,-72.670556)
110	3	MUBIL	(-38.915556,-72.252222)
110	4	GUVOL	(-32.375,-70.225)
111	1	TESEX	(-38.931111,-71.433611)
111	2	SOTKU	(-21.866667,-68.0625)
113	1	ASALA	(-27.675556,-108.439444)
113	2	IVDM	(-32.9441666666667,-71.4702777777778)
113	3	MUBIL	(-38.915556,-72.252222)
113	4	ANGAT	(-23.151944,-68.553056)
113	5	BAL	(-45.913056,-71.7125)
114	1	URIDA	(-43.275278,-72.670556)
114	2	VUDAP	(-23.143889,-68.805)
115	1	MUNER	(-52,-71.31)
115	2	EL138	(-33.401844,-70.642517)
115	3	URIDA	(-43.275278,-72.670556)
115	4	VUDAP	(-23.143889,-68.805)
115	5	ARMOS	(-24.291667,-67.979167)
115	6	SASTI	(-42.591944,-73.228333)
118	1	EL138	(-33.401844,-70.642517)
118	2	SIROV	(-34.584722,-70.622778)
118	3	SASTI	(-42.591944,-73.228333)
119	1	ASALA	(-27.675556,-108.439444)
119	2	IVDM	(-32.9441666666667,-71.4702777777778)
119	3	SIROV	(-34.584722,-70.622778)
119	4	MUKSO	(-43.280278,-72.974444)
119	5	VUDAP	(-23.143889,-68.805)
119	6	ARMOS	(-24.291667,-67.979167)
121	1	SOTKU	(-21.866667,-68.0625)
121	2	REKET	(-44.098889,-72.380833)
122	1	EL138	(-33.401844,-70.642517)
122	2	GE025	(-37.353156,-72.419825)
123	1	ASALA	(-27.675556,-108.439444)
123	2	GE025	(-37.353156,-72.419825)
125	1	BAL	(-45.913056,-71.7125)
125	2	ARMOS	(-24.291667,-67.979167)
126	1	OPURA	(-45.268611,-71.955)
126	2	SIROV	(-34.584722,-70.622778)
126	3	MUKSO	(-43.280278,-72.974444)
126	4	SASTI	(-42.591944,-73.228333)
128	1	EL138	(-33.401844,-70.642517)
128	2	MUBIL	(-38.915556,-72.252222)
128	3	OPURA	(-45.268611,-71.955)
130	1	REKET	(-44.098889,-72.380833)
130	2	ARMOS	(-24.291667,-67.979167)
130	3	GUVOL	(-32.375,-70.225)
131	1	URIDA	(-43.275278,-72.670556)
131	2	OPURA	(-45.268611,-71.955)
131	3	ANGAT	(-23.151944,-68.553056)
132	1	ASALA	(-27.675556,-108.439444)
132	2	VUDAP	(-23.143889,-68.805)
132	3	BAL	(-45.913056,-71.7125)
132	4	ARMOS	(-24.291667,-67.979167)
132	5	SASTI	(-42.591944,-73.228333)
133	1	GE025	(-37.353156,-72.419825)
133	2	TESEX	(-38.931111,-71.433611)
133	3	REKET	(-44.098889,-72.380833)
133	4	ANGAT	(-23.151944,-68.553056)
134	1	ASALA	(-27.675556,-108.439444)
134	2	OPURA	(-45.268611,-71.955)
135	1	IVDM	(-32.9441666666667,-71.4702777777778)
135	2	MUKSO	(-43.280278,-72.974444)
135	3	VUDAP	(-23.143889,-68.805)
137	1	ASALA	(-27.675556,-108.439444)
137	2	IVDM	(-32.9441666666667,-71.4702777777778)
137	3	MUNER	(-52,-71.31)
137	4	GE025	(-37.353156,-72.419825)
137	5	URIDA	(-43.275278,-72.670556)
137	6	VUDAP	(-23.143889,-68.805)
138	1	ASALA	(-27.675556,-108.439444)
138	2	SIROV	(-34.584722,-70.622778)
141	1	ASALA	(-27.675556,-108.439444)
141	2	EL138	(-33.401844,-70.642517)
141	3	ARMOS	(-24.291667,-67.979167)
141	4	GUVOL	(-32.375,-70.225)
142	1	ASALA	(-27.675556,-108.439444)
142	2	GE025	(-37.353156,-72.419825)
142	3	MUKSO	(-43.280278,-72.974444)
143	1	EDSUK	(-31.416667,-90)
143	2	GE025	(-37.353156,-72.419825)
143	3	REKET	(-44.098889,-72.380833)
147	1	EDSUK	(-31.416667,-90)
147	2	BAL	(-45.913056,-71.7125)
147	3	SASTI	(-42.591944,-73.228333)
148	1	SOTKU	(-21.866667,-68.0625)
148	2	BAL	(-45.913056,-71.7125)
149	1	MUNER	(-52,-71.31)
149	2	URIDA	(-43.275278,-72.670556)
149	3	MUKSO	(-43.280278,-72.974444)
151	1	ASALA	(-27.675556,-108.439444)
151	2	URIDA	(-43.275278,-72.670556)
151	3	MUBIL	(-38.915556,-72.252222)
151	4	OPURA	(-45.268611,-71.955)
151	5	ANGAT	(-23.151944,-68.553056)
152	1	IVDM	(-32.9441666666667,-71.4702777777778)
152	2	MUKSO	(-43.280278,-72.974444)
152	3	SASTI	(-42.591944,-73.228333)
152	4	GUVOL	(-32.375,-70.225)
153	1	URIDA	(-43.275278,-72.670556)
153	2	MUKSO	(-43.280278,-72.974444)
156	1	EL138	(-33.401844,-70.642517)
156	2	TESEX	(-38.931111,-71.433611)
156	3	ANGAT	(-23.151944,-68.553056)
157	1	OPURA	(-45.268611,-71.955)
157	2	SIROV	(-34.584722,-70.622778)
157	3	ARMOS	(-24.291667,-67.979167)
159	1	MUNER	(-52,-71.31)
159	2	OPURA	(-45.268611,-71.955)
159	3	MUKSO	(-43.280278,-72.974444)
159	4	SOTKU	(-21.866667,-68.0625)
159	5	GUVOL	(-32.375,-70.225)
160	1	SIROV	(-34.584722,-70.622778)
160	2	SOTKU	(-21.866667,-68.0625)
160	3	SASTI	(-42.591944,-73.228333)
161	1	IVDM	(-32.9441666666667,-71.4702777777778)
161	2	SASTI	(-42.591944,-73.228333)
162	1	ARMOS	(-24.291667,-67.979167)
162	2	SASTI	(-42.591944,-73.228333)
163	1	EDSUK	(-31.416667,-90)
163	2	SOTKU	(-21.866667,-68.0625)
166	1	GE025	(-37.353156,-72.419825)
166	2	SASTI	(-42.591944,-73.228333)
168	1	IVDM	(-32.9441666666667,-71.4702777777778)
168	2	URIDA	(-43.275278,-72.670556)
168	3	MUBIL	(-38.915556,-72.252222)
168	4	GUVOL	(-32.375,-70.225)
170	1	IVDM	(-32.9441666666667,-71.4702777777778)
170	2	GE025	(-37.353156,-72.419825)
170	3	MUBIL	(-38.915556,-72.252222)
170	4	TESEX	(-38.931111,-71.433611)
171	1	EDSUK	(-31.416667,-90)
171	2	URIDA	(-43.275278,-72.670556)
172	1	URIDA	(-43.275278,-72.670556)
172	2	SOTKU	(-21.866667,-68.0625)
173	1	REKET	(-44.098889,-72.380833)
173	2	GUVOL	(-32.375,-70.225)
176	1	OPURA	(-45.268611,-71.955)
176	2	BAL	(-45.913056,-71.7125)
176	3	ARMOS	(-24.291667,-67.979167)
176	4	SASTI	(-42.591944,-73.228333)
176	5	GUVOL	(-32.375,-70.225)
177	1	IVDM	(-32.9441666666667,-71.4702777777778)
177	2	MUNER	(-52,-71.31)
177	3	MUBIL	(-38.915556,-72.252222)
177	4	GUVOL	(-32.375,-70.225)
179	1	EDSUK	(-31.416667,-90)
179	2	TESEX	(-38.931111,-71.433611)
179	3	MUKSO	(-43.280278,-72.974444)
179	4	SASTI	(-42.591944,-73.228333)
181	1	OPURA	(-45.268611,-71.955)
181	2	REKET	(-44.098889,-72.380833)
184	1	URIDA	(-43.275278,-72.670556)
184	2	MUKSO	(-43.280278,-72.974444)
184	3	REKET	(-44.098889,-72.380833)
186	1	REKET	(-44.098889,-72.380833)
186	2	BAL	(-45.913056,-71.7125)
188	1	MUNER	(-52,-71.31)
188	2	MUBIL	(-38.915556,-72.252222)
191	1	TESEX	(-38.931111,-71.433611)
191	2	SIROV	(-34.584722,-70.622778)
191	3	REKET	(-44.098889,-72.380833)
191	4	SASTI	(-42.591944,-73.228333)
194	1	ASALA	(-27.675556,-108.439444)
194	2	URIDA	(-43.275278,-72.670556)
194	3	MUBIL	(-38.915556,-72.252222)
194	4	OPURA	(-45.268611,-71.955)
196	1	ASALA	(-27.675556,-108.439444)
196	2	OPURA	(-45.268611,-71.955)
196	3	SIROV	(-34.584722,-70.622778)
196	4	REKET	(-44.098889,-72.380833)
199	1	MUNER	(-52,-71.31)
199	2	ANGAT	(-23.151944,-68.553056)
199	3	SASTI	(-42.591944,-73.228333)
199	4	GUVOL	(-32.375,-70.225)
201	1	IVDM	(-32.9441666666667,-71.4702777777778)
201	2	EDSUK	(-31.416667,-90)
201	3	URIDA	(-43.275278,-72.670556)
201	4	SASTI	(-42.591944,-73.228333)
202	1	BAL	(-45.913056,-71.7125)
202	2	SASTI	(-42.591944,-73.228333)
204	1	ASALA	(-27.675556,-108.439444)
204	2	SOTKU	(-21.866667,-68.0625)
207	1	URIDA	(-43.275278,-72.670556)
207	2	ARMOS	(-24.291667,-67.979167)
208	1	IVDM	(-32.9441666666667,-71.4702777777778)
208	2	EL138	(-33.401844,-70.642517)
208	3	ARMOS	(-24.291667,-67.979167)
209	1	IVDM	(-32.9441666666667,-71.4702777777778)
209	2	BAL	(-45.913056,-71.7125)
210	1	IVDM	(-32.9441666666667,-71.4702777777778)
210	2	URIDA	(-43.275278,-72.670556)
210	3	VUDAP	(-23.143889,-68.805)
210	4	SOTKU	(-21.866667,-68.0625)
210	5	REKET	(-44.098889,-72.380833)
210	6	ANGAT	(-23.151944,-68.553056)
211	1	URIDA	(-43.275278,-72.670556)
211	2	REKET	(-44.098889,-72.380833)
211	3	SASTI	(-42.591944,-73.228333)
213	1	EDSUK	(-31.416667,-90)
213	2	SASTI	(-42.591944,-73.228333)
214	1	EL138	(-33.401844,-70.642517)
214	2	GE025	(-37.353156,-72.419825)
214	3	ARMOS	(-24.291667,-67.979167)
215	1	MUBIL	(-38.915556,-72.252222)
215	2	MUKSO	(-43.280278,-72.974444)
218	1	MUNER	(-52,-71.31)
218	2	URIDA	(-43.275278,-72.670556)
218	3	TESEX	(-38.931111,-71.433611)
218	4	REKET	(-44.098889,-72.380833)
220	1	EDSUK	(-31.416667,-90)
220	2	OPURA	(-45.268611,-71.955)
220	3	GUVOL	(-32.375,-70.225)
221	1	ASALA	(-27.675556,-108.439444)
221	2	SIROV	(-34.584722,-70.622778)
221	3	SASTI	(-42.591944,-73.228333)
223	1	IVDM	(-32.9441666666667,-71.4702777777778)
223	2	OPURA	(-45.268611,-71.955)
223	3	VUDAP	(-23.143889,-68.805)
223	4	SASTI	(-42.591944,-73.228333)
224	1	URIDA	(-43.275278,-72.670556)
224	2	SIROV	(-34.584722,-70.622778)
224	3	SOTKU	(-21.866667,-68.0625)
225	1	SIROV	(-34.584722,-70.622778)
225	2	ANGAT	(-23.151944,-68.553056)
225	3	SASTI	(-42.591944,-73.228333)
226	1	MUNER	(-52,-71.31)
226	2	URIDA	(-43.275278,-72.670556)
226	3	OPURA	(-45.268611,-71.955)
227	1	OPURA	(-45.268611,-71.955)
227	2	ANGAT	(-23.151944,-68.553056)
228	1	URIDA	(-43.275278,-72.670556)
228	2	MUBIL	(-38.915556,-72.252222)
228	3	ARMOS	(-24.291667,-67.979167)
229	1	IVDM	(-32.9441666666667,-71.4702777777778)
229	2	GE025	(-37.353156,-72.419825)
230	1	ASALA	(-27.675556,-108.439444)
230	2	REKET	(-44.098889,-72.380833)
232	1	MUNER	(-52,-71.31)
232	2	TESEX	(-38.931111,-71.433611)
232	3	REKET	(-44.098889,-72.380833)
232	4	ANGAT	(-23.151944,-68.553056)
233	1	EL138	(-33.401844,-70.642517)
233	2	SOTKU	(-21.866667,-68.0625)
233	3	SASTI	(-42.591944,-73.228333)
234	1	SIROV	(-34.584722,-70.622778)
234	2	MUKSO	(-43.280278,-72.974444)
235	1	GE025	(-37.353156,-72.419825)
235	2	MUKSO	(-43.280278,-72.974444)
237	1	OPURA	(-45.268611,-71.955)
237	2	SOTKU	(-21.866667,-68.0625)
237	3	REKET	(-44.098889,-72.380833)
237	4	BAL	(-45.913056,-71.7125)
238	1	MUNER	(-52,-71.31)
238	2	TESEX	(-38.931111,-71.433611)
238	3	GUVOL	(-32.375,-70.225)
239	1	EDSUK	(-31.416667,-90)
239	2	SOTKU	(-21.866667,-68.0625)
239	3	SASTI	(-42.591944,-73.228333)
240	1	EDSUK	(-31.416667,-90)
240	2	SIROV	(-34.584722,-70.622778)
240	3	SOTKU	(-21.866667,-68.0625)
240	4	ARMOS	(-24.291667,-67.979167)
242	1	MUBIL	(-38.915556,-72.252222)
242	2	REKET	(-44.098889,-72.380833)
242	3	ANGAT	(-23.151944,-68.553056)
242	4	SASTI	(-42.591944,-73.228333)
243	1	EL138	(-33.401844,-70.642517)
243	2	ANGAT	(-23.151944,-68.553056)
243	3	GUVOL	(-32.375,-70.225)
245	1	ASALA	(-27.675556,-108.439444)
245	2	MUBIL	(-38.915556,-72.252222)
245	3	SIROV	(-34.584722,-70.622778)
245	4	ANGAT	(-23.151944,-68.553056)
246	1	EL138	(-33.401844,-70.642517)
246	2	URIDA	(-43.275278,-72.670556)
246	3	OPURA	(-45.268611,-71.955)
249	1	ASALA	(-27.675556,-108.439444)
249	2	REKET	(-44.098889,-72.380833)
249	3	BAL	(-45.913056,-71.7125)
249	4	ARMOS	(-24.291667,-67.979167)
257	1	EL138	(-33.401844,-70.642517)
257	2	SIROV	(-34.584722,-70.622778)
257	3	BAL	(-45.913056,-71.7125)
258	1	EL138	(-33.401844,-70.642517)
258	2	SASTI	(-42.591944,-73.228333)
261	1	MUNER	(-52,-71.31)
261	2	EL138	(-33.401844,-70.642517)
263	1	MUNER	(-52,-71.31)
263	2	REKET	(-44.098889,-72.380833)
264	1	MUNER	(-52,-71.31)
264	2	REKET	(-44.098889,-72.380833)
264	3	ANGAT	(-23.151944,-68.553056)
264	4	ARMOS	(-24.291667,-67.979167)
268	1	SIROV	(-34.584722,-70.622778)
268	2	ANGAT	(-23.151944,-68.553056)
269	1	ASALA	(-27.675556,-108.439444)
269	2	URIDA	(-43.275278,-72.670556)
269	3	TESEX	(-38.931111,-71.433611)
269	4	OPURA	(-45.268611,-71.955)
269	5	MUKSO	(-43.280278,-72.974444)
270	1	EL138	(-33.401844,-70.642517)
270	2	MUBIL	(-38.915556,-72.252222)
270	3	SIROV	(-34.584722,-70.622778)
270	4	ANGAT	(-23.151944,-68.553056)
271	1	ASALA	(-27.675556,-108.439444)
271	2	IVDM	(-32.9441666666667,-71.4702777777778)
271	3	MUNER	(-52,-71.31)
271	4	GE025	(-37.353156,-72.419825)
271	5	BAL	(-45.913056,-71.7125)
274	1	TESEX	(-38.931111,-71.433611)
274	2	VUDAP	(-23.143889,-68.805)
274	3	REKET	(-44.098889,-72.380833)
275	1	ASALA	(-27.675556,-108.439444)
275	2	IVDM	(-32.9441666666667,-71.4702777777778)
275	3	SIROV	(-34.584722,-70.622778)
275	4	ARMOS	(-24.291667,-67.979167)
277	1	REKET	(-44.098889,-72.380833)
277	2	SASTI	(-42.591944,-73.228333)
281	1	MUNER	(-52,-71.31)
281	2	VUDAP	(-23.143889,-68.805)
282	1	MUNER	(-52,-71.31)
282	2	EL138	(-33.401844,-70.642517)
282	3	OPURA	(-45.268611,-71.955)
283	1	ASALA	(-27.675556,-108.439444)
283	2	REKET	(-44.098889,-72.380833)
283	3	BAL	(-45.913056,-71.7125)
284	1	EDSUK	(-31.416667,-90)
284	2	URIDA	(-43.275278,-72.670556)
284	3	TESEX	(-38.931111,-71.433611)
284	4	OPURA	(-45.268611,-71.955)
286	1	EDSUK	(-31.416667,-90)
286	2	GE025	(-37.353156,-72.419825)
286	3	MUBIL	(-38.915556,-72.252222)
286	4	BAL	(-45.913056,-71.7125)
295	1	IVDM	(-32.9441666666667,-71.4702777777778)
295	2	EL138	(-33.401844,-70.642517)
295	3	OPURA	(-45.268611,-71.955)
295	4	MUKSO	(-43.280278,-72.974444)
295	5	VUDAP	(-23.143889,-68.805)
295	6	GUVOL	(-32.375,-70.225)
299	1	EL138	(-33.401844,-70.642517)
299	2	BAL	(-45.913056,-71.7125)
300	1	IVDM	(-32.9441666666667,-71.4702777777778)
300	2	EL138	(-33.401844,-70.642517)
300	3	MUBIL	(-38.915556,-72.252222)
301	1	EL138	(-33.401844,-70.642517)
301	2	VUDAP	(-23.143889,-68.805)
301	3	ANGAT	(-23.151944,-68.553056)
305	1	ASALA	(-27.675556,-108.439444)
305	2	REKET	(-44.098889,-72.380833)
305	3	ANGAT	(-23.151944,-68.553056)
305	4	BAL	(-45.913056,-71.7125)
306	1	ASALA	(-27.675556,-108.439444)
306	2	SASTI	(-42.591944,-73.228333)
306	3	GUVOL	(-32.375,-70.225)
308	1	EL138	(-33.401844,-70.642517)
308	2	GE025	(-37.353156,-72.419825)
308	3	MUBIL	(-38.915556,-72.252222)
308	4	MUKSO	(-43.280278,-72.974444)
309	1	GE025	(-37.353156,-72.419825)
309	2	OPURA	(-45.268611,-71.955)
309	3	SIROV	(-34.584722,-70.622778)
309	4	ARMOS	(-24.291667,-67.979167)
311	1	IVDM	(-32.9441666666667,-71.4702777777778)
311	2	SIROV	(-34.584722,-70.622778)
311	3	ARMOS	(-24.291667,-67.979167)
311	4	GUVOL	(-32.375,-70.225)
312	1	EL138	(-33.401844,-70.642517)
312	2	URIDA	(-43.275278,-72.670556)
312	3	REKET	(-44.098889,-72.380833)
313	1	EDSUK	(-31.416667,-90)
313	2	MUNER	(-52,-71.31)
313	3	SIROV	(-34.584722,-70.622778)
313	4	SASTI	(-42.591944,-73.228333)
314	1	MUNER	(-52,-71.31)
314	2	MUBIL	(-38.915556,-72.252222)
314	3	TESEX	(-38.931111,-71.433611)
315	1	OPURA	(-45.268611,-71.955)
315	2	SOTKU	(-21.866667,-68.0625)
318	1	MUBIL	(-38.915556,-72.252222)
318	2	ANGAT	(-23.151944,-68.553056)
320	1	TESEX	(-38.931111,-71.433611)
320	2	VUDAP	(-23.143889,-68.805)
321	1	OPURA	(-45.268611,-71.955)
321	2	MUKSO	(-43.280278,-72.974444)
321	3	GUVOL	(-32.375,-70.225)
322	1	TESEX	(-38.931111,-71.433611)
322	2	GUVOL	(-32.375,-70.225)
324	1	EL138	(-33.401844,-70.642517)
324	2	URIDA	(-43.275278,-72.670556)
324	3	TESEX	(-38.931111,-71.433611)
324	4	OPURA	(-45.268611,-71.955)
326	1	ASALA	(-27.675556,-108.439444)
326	2	MUNER	(-52,-71.31)
326	3	SOTKU	(-21.866667,-68.0625)
326	4	ANGAT	(-23.151944,-68.553056)
327	1	MUNER	(-52,-71.31)
327	2	GE025	(-37.353156,-72.419825)
327	3	MUKSO	(-43.280278,-72.974444)
331	1	URIDA	(-43.275278,-72.670556)
331	2	OPURA	(-45.268611,-71.955)
\.


--
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.reserva (id, codigo, id_reservante) FROM stdin;
4263	LAT5532-4263	1
1722	LRC9669-1722	30
2621	LAW6318-2621	62
219	LAW6351-0219	64
1037	LAT5532-1037	53
1331	ETA7128-1331	1
2704	UAN2468-2704	67
3978	LUD7177-3978	7
616	ETA6742-0616	34
4160	LRC9669-4160	40
820	COG4299-0820	51
4470	LRC4743-4470	67
2542	BTA8394-2542	62
4209	XLE7933-4209	12
2855	LUD5927-2855	6
372	LRC4743-0372	34
1642	QAF4466-1642	47
1	XLE7933-0001	15
1433	ADC8249-1433	16
2739	LAT5532-2739	11
692	IBE8751-0692	18
1269	COG7539-1269	26
4772	XLE3285-4772	1
3891	EAL8271-3891	10
489	NCY5615-0489	23
1991	UAN2468-1991	52
3775	LAM9554-3775	87
4782	QAF4466-4782	79
2844	AZI6476-2844	27
4365	BTA9626-4365	56
4222	LAW6318-4222	16
2151	QAF6392-2151	42
2220	LAM9554-2220	34
4247	UAN2468-4247	16
2123	IBE2338-2123	8
2288	NCY5615-2288	31
629	EAL7933-0629	71
2262	COG7539-2262	81
3593	AZI6476-3593	80
3180	KAI3589-3180	12
9	LAW6318-0009	52
3739	QAF6392-3739	38
4437	UAN2881-4437	8
807	BTA8394-0807	14
873	KAI7891-0873	32
4669	MPH1782-4669	42
2504	XLE3285-2504	34
1422	EAL8271-1422	34
3366	IBE8751-3366	60
4265	AZI6476-4265	48
231	UAN2881-0231	54
2218	UAN2881-2218	44
2964	UCA4751-2964	75
3845	KAI3589-3845	7
1618	IBE8751-1618	33
2910	LAW6351-2910	47
2540	ADC6283-2540	65
3231	NCY5615-3231	83
2280	ETA7128-2280	50
3588	UAN2468-3588	4
4150	BTA8394-4150	20
4660	EAL8271-4660	47
3536	XLE7933-3536	26
2875	BTA9626-2875	7
1726	LAM9574-1726	8
92	UAN2468-0092	72
4236	LAW1134-4236	41
2226	LRC4743-2226	24
1286	XLE5111-1286	12
2556	LRC9669-2556	76
736	XLE3285-0736	56
1016	UAN2468-1016	57
4396	LAW6351-4396	21
2029	AZI6476-2029	51
1480	LUD7177-1480	87
3396	ADC6283-3396	38
628	NCY1133-0628	78
182	IBE2338-0182	19
4523	KEA7139-4523	64
538	MPH1782-0538	3
2633	COG3144-2633	62
3974	ETA6742-3974	5
3679	BTA9626-3679	78
2276	KEA7139-2276	11
4902	COG4299-4902	3
3712	IBE2338-3712	9
3668	LUD5927-3668	62
2578	LAT2175-2578	75
1082	BTA9626-1082	47
3832	KEA7139-3832	37
1970	LAW1134-1970	76
3421	LRC9669-3421	86
3294	ETA6742-3294	30
531	EAL8271-0531	20
405	XLE5111-0405	76
1007	COG3144-1007	42
444	KAI3589-0444	53
2048	LUD5927-2048	10
159	AZI6476-0159	68
905	LAW6318-0905	55
834	LRC9669-0834	8
2988	UAN2881-2988	30
3772	UAN2881-3772	67
842	LAM9574-0842	17
1515	NCY1133-1515	43
2577	LAM9574-2577	73
4064	XLE3285-4064	53
3394	QAF4466-3394	8
3376	XLE3285-3376	41
4604	ETA7128-4604	6
2543	COG4299-2543	16
3339	EAL7933-3339	33
3972	ADC8249-3972	28
435	ETA7128-0435	27
4697	ADC8249-4697	56
4158	COG4299-4158	18
4831	BTA8394-4831	72
4979	LAT2175-4979	53
1687	BTA8394-1687	33
2515	QAF4466-2515	65
3463	LAT2175-3463	47
1196	LAM9554-1196	23
3405	BTA8394-3405	74
2465	NCY1133-2465	74
1051	AZI6476-1051	76
4241	COG3144-4241	53
4727	LUD7177-4727	42
4186	LAT2175-4186	13
1749	KAI7891-1749	71
894	XLE7933-0894	69
1995	LAT5532-1995	12
2500	IBE8751-2500	45
3825	XLE5111-3825	89
797	ADC6283-0797	49
1080	LUD5927-1080	58
2339	MPH1782-2339	56
2301	EAL8271-2301	89
1623	XLE3285-1623	21
3168	ETA7128-3168	73
414	KEA7139-0414	79
4033	IBE8751-4033	10
1699	COG4299-1699	62
3752	UCA4751-3752	42
4123	QAF4466-4123	19
2936	QAF6392-2936	57
4268	LUD5927-4268	1
3999	NCY1133-3999	5
3298	LUD7177-3298	68
3409	COG4299-3409	67
2054	BTA9626-2054	19
4490	XLE5111-4490	56
4763	EAL7933-4763	39
3333	NCY1133-3333	72
3568	COG3144-3568	70
174	LUD5927-0174	90
1090	IBE2338-1090	7
3564	LAW1134-3564	32
3037	LRC4743-3037	37
4473	COG7539-4473	65
102	LAT5532-0102	88
4464	LAM9554-4464	17
2133	LAW6351-2133	46
3887	NCY5615-3887	1
3951	MPH1782-3951	68
843	LAT2175-0843	74
3817	LRC4743-3817	63
1195	UAN2881-1195	78
3450	LAM9574-3450	83
3819	COG7539-3819	67
3080	XLE5111-3080	85
3728	LAW6351-3728	37
4188	KAI7891-4188	31
221	QAF6392-0221	81
4634	KAI3589-4634	41
1733	LAT2175-1733	29
4922	LRC9669-4922	29
2271	XLE5111-2271	73
3147	KEA7139-3147	19
2616	XLE7933-2616	35
4926	LAM9574-4926	82
4177	LAM9574-4177	42
1927	LAW6318-1927	50
2193	UCA4751-2193	31
3287	MPH1782-3287	81
1251	LRC4743-1251	85
1288	KEA7139-1288	85
4646	NCY5615-4646	62
1113	LAW6351-1113	51
4771	IBE8751-4771	71
1436	ETA6742-1436	39
25	COG3144-0025	51
945	LAW1134-0945	20
623	LUD7177-0623	30
2414	ADC8249-2414	60
21	LAW1134-0021	87
1907	XLE7933-1907	6
4981	KAI7891-4981	49
2440	ETA6742-2440	65
4726	ETA6742-4726	10
4137	ADC6283-4137	7
3836	ETA7128-3836	3
4404	QAF6392-4404	58
4427	UCA4751-4427	25
222	UCA4751-0222	34
1678	ADC6283-1678	33
613	ADC8249-0613	64
3003	LAM9554-3003	6
1542	EAL7933-1542	45
403	COG7539-0403	34
2890	IBE2338-2890	22
255	LAM9554-0255	71
4800	ADC6283-4800	90
4758	NCY1133-4758	19
2625	LAW1134-2625	33
1430	MPH1782-1430	64
4004	EAL7933-4004	35
2281	KAI3589-2281	23
743	QAF4466-0743	68
3293	ADC8249-3293	68
1361	KAI3589-1361	18
3471	KAI7891-3471	23
3237	EAL8271-3237	57
3059	COG7539-3059	80
1975	COG3144-1975	36
2597	KAI7891-2597	20
1165	UCA4751-1165	67
3591	LAT5532-3591	18
2497	EAL7933-2497	58
1405	NCY5615-1405	13
2448	LUD7177-2448	20
4372	IBE2338-4372	44
3543	LAW6318-3543	66
181	BTA9626-0181	55
1155	QAF6392-1155	48
\.


--
-- Data for Name: ruta; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.ruta (id, nombre) FROM stdin;
1	18KY7P
2	IVQT9M
3	1ZBIZ1
4	3FW5YK
5	DTJDOT
6	3F14TA
7	K5GOZD
8	Z9DVWY
9	TB95J3
10	JX93RP
11	AMG0GS
14	PBHR03
16	4CV43U
17	TIK99A
19	CUCU9Q
21	4DLT9Q
22	5FGXT6
23	LC9Z05
26	B49HOM
27	ZDG1DV
29	GSXAVL
30	P1JNML
32	MYWPY3
35	QP3D71
36	PWUA8T
39	Q34PN1
40	ZJEMX8
41	4MRN2Z
42	PZUXC8
43	FESY8M
45	M9SML5
46	1XY0L9
47	KC8Y62
48	T4G2CY
49	XQ6QMN
51	23TZRO
52	QWTLFA
53	08WJ2A
60	YA5VU9
62	LX4Z31
64	NHUYKH
66	4O7SL8
67	VAK51S
68	LFTSZ8
69	TWK2ZE
71	L248II
72	5WQG5X
74	XB19B5
75	8619FY
78	6DD62K
79	AUPP3K
80	RYB3S9
82	Z9K3CD
84	OIMFT2
86	H8ID3I
87	ADUY39
88	U7A5XD
89	KEF2AH
90	NVAUJH
92	0OYDGV
93	3A7NAK
94	J0UAKI
95	67QMBI
99	0FC33O
100	VRNJVM
102	FJX9RD
103	MS97RE
104	XQ4CKY
105	CVHVC0
106	CGIQEZ
107	0MNBOM
108	FHJOHU
110	LHZ8BA
111	GBAZ35
113	GLECPA
114	Q0ZEMU
115	O7MTOF
118	DNU0LJ
119	AE7NNK
121	KVFVS3
122	ZFC7QM
123	75GQI2
125	F71WGY
126	547UP9
128	MKSXGD
130	0F8ACU
131	JDWRK1
132	76XPPH
133	FD7RM3
134	TKEQEZ
135	8CPCJB
137	4WJGOV
138	JOGXIR
141	TDHVBC
142	998DPO
143	RARD48
147	VHJA8G
148	GSFY17
149	H07ABK
151	XBHKZ2
152	T8J2A0
153	7T70C3
156	5WKRUK
157	NTF3K1
159	CBCT9Z
160	33HVQ2
161	9A0HFS
162	O7OQR3
163	0DX8J2
166	M0E2VC
168	CLMP9Z
170	8RJNOB
171	9MTMR5
172	INYWS2
173	1BE5WY
176	E5QY6A
177	QE27HB
179	D39FOL
181	NTSDHY
184	A4JX1P
186	S7EFQ0
188	2PEM5U
191	3PEMHF
194	C6MFJ0
196	68MKO9
199	HB98Y1
201	FCECHM
202	DHNAQQ
204	9UZAXU
207	RQAS4J
208	32VJOV
209	QQ1Y9B
210	Q0XMOZ
211	GK49N2
213	VADNG3
214	NACJ1T
215	DIH3AP
218	TJLV8L
220	0RNPEG
221	ZTPPMK
223	7GVJ3W
224	QBLJD7
225	1YTYZ0
226	UGA3UB
227	QBQ6QT
228	XY8HXC
229	XEX24O
230	9EWF41
232	5AQIX4
233	72V258
234	G4VW9B
235	FZX3OV
237	JHLV8U
238	RAPNV8
239	TNA65C
240	N1OP3K
242	QI906L
243	69PTPZ
245	6IYJIK
246	IDJFQ8
249	YSHISN
257	H1DOFB
258	RRFFPL
261	MXCEKE
263	J05NI3
264	WXDI7Q
268	ERN3ZD
269	CPEQJR
270	XB3LLU
271	5K548W
274	IW42AW
275	S3YYD8
277	Q78AIJ
281	UB4BM2
282	7V3T0U
283	Y0JJ90
284	0NK93O
286	XJCAHW
295	0WGM07
299	NNK13O
300	IY1YAZ
301	3XLBGH
305	RN5PVG
306	EDJULU
308	VN5469
309	MHYOIA
311	LMY0DE
312	70TYMP
313	HDZ23A
314	JXY6NN
315	99K7HE
318	A6DMKI
320	K91QGP
321	7R5YGB
322	UIQV7E
324	8ZGVVP
326	MUYMAK
327	NIVBRI
331	L5H2JJ
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.ticket (id, id_vuelo, id_reserva, id_pasajero, asiento, clase, comida_y_maleta) FROM stdin;
2096	100	4263	1	21	Primera clase	f
4435	130	1722	2	4	Economica	f
6305	96	2621	3	8	Primera clase	f
8161	105	219	4	6	Ejecutiva	f
316	100	1037	5	22	Economica	t
3411	114	1331	1	26	Primera clase	t
4516	99	2704	6	17	Economica	t
3856	121	3978	7	3	Economica	f
7951	120	616	8	4	Ejecutiva	t
7946	130	4160	9	25	Primera clase	t
3309	129	820	10	18	Economica	f
4133	110	4470	3	18	Economica	t
7224	128	2542	11	21	Ejecutiva	f
157	95	4209	12	19	Economica	t
8599	102	2855	13	11	Economica	f
195	110	372	10	20	Economica	t
4873	126	1642	14	6	Ejecutiva	f
8518	95	1	15	6	Economica	f
7289	119	1433	16	3	Ejecutiva	t
9598	100	2739	17	30	Economica	f
8254	124	692	18	30	Ejecutiva	t
5809	111	1269	19	10	Ejecutiva	t
7700	125	4772	20	20	Economica	f
1031	117	3891	21	10	Economica	t
127	100	1037	22	19	Primera clase	t
385	116	489	23	18	Ejecutiva	t
4984	128	2542	24	17	Economica	f
5775	99	1991	25	5	Economica	t
5178	109	3775	10	25	Economica	f
6775	126	4782	26	2	Primera clase	f
2170	101	2844	27	6	Economica	f
9125	103	4365	28	26	Economica	f
5170	96	4222	26	31	Economica	t
3117	106	2151	29	6	Ejecutiva	t
2381	109	2220	7	14	Economica	f
9932	99	4247	16	14	Ejecutiva	f
1715	104	2123	30	15	Primera clase	t
8394	116	2288	31	20	Primera clase	f
719	123	629	32	8	Primera clase	f
7979	111	2262	33	20	Economica	t
8656	109	2220	34	24	Ejecutiva	f
7017	103	4365	35	11	Ejecutiva	f
550	101	3593	10	7	Primera clase	f
5110	115	3180	36	12	Economica	t
2563	96	9	25	3	Ejecutiva	t
2154	106	3739	37	11	Ejecutiva	t
6065	108	4437	8	8	Ejecutiva	t
4968	106	3739	38	23	Economica	f
8734	102	2855	39	7	Economica	f
542	128	807	22	22	Economica	t
6730	133	873	40	6	Economica	t
7235	96	4222	38	5	Ejecutiva	f
3393	117	3891	41	16	Primera clase	f
2581	99	1991	10	12	Economica	f
9662	118	4669	42	28	Ejecutiva	t
6391	100	1037	13	12	Economica	t
815	125	2504	26	22	Ejecutiva	f
5177	99	2704	43	8	Economica	t
6731	117	1422	16	15	Economica	t
2248	124	3366	21	6	Primera clase	t
3175	101	4265	6	23	Economica	t
936	108	231	18	6	Ejecutiva	f
6134	108	2218	44	11	Ejecutiva	t
9087	107	2964	45	14	Economica	t
8358	115	3845	46	27	Economica	t
4807	124	1618	47	29	Ejecutiva	t
6732	105	2910	21	23	Primera clase	t
2589	127	2540	48	15	Primera clase	t
2945	116	3231	49	14	Economica	t
704	114	2280	5	23	Economica	t
5215	99	3588	13	31	Primera clase	f
2391	128	4150	50	31	Economica	t
83	117	4660	47	18	Primera clase	t
2341	95	3536	51	11	Primera clase	f
8601	103	2875	25	5	Ejecutiva	f
5888	131	1726	8	22	Ejecutiva	f
6633	127	2540	52	19	Economica	f
7403	116	2288	53	28	Primera clase	t
472	99	92	54	25	Economica	f
1361	97	4236	43	11	Economica	t
2243	110	2226	24	10	Primera clase	f
2274	112	1286	12	21	Primera clase	t
606	130	2556	55	24	Primera clase	t
9531	125	736	56	3	Economica	t
3810	105	2910	47	28	Primera clase	f
4726	99	1016	57	28	Economica	t
8163	105	4396	43	11	Primera clase	f
4684	101	2029	38	3	Economica	t
6965	116	2288	58	22	Primera clase	t
1895	121	1480	59	26	Primera clase	t
3329	127	3396	60	5	Primera clase	t
7333	105	4396	61	20	Primera clase	t
8037	122	628	41	5	Ejecutiva	t
7840	104	182	19	14	Primera clase	t
2226	113	4523	48	2	Economica	f
4287	118	538	62	23	Economica	t
7666	125	736	52	9	Ejecutiva	f
6555	98	2633	62	21	Economica	f
3138	120	3974	5	21	Primera clase	f
9885	128	2542	62	7	Primera clase	t
114	103	3679	29	29	Economica	t
5345	113	2276	44	27	Economica	t
4198	129	4902	22	28	Economica	f
9995	104	3712	63	27	Primera clase	t
246	105	219	64	7	Economica	f
3235	102	3668	62	29	Primera clase	t
670	132	2578	4	7	Primera clase	t
2928	101	4265	48	26	Economica	f
3083	103	1082	47	28	Ejecutiva	f
8398	113	3832	9	12	Primera clase	t
4463	107	2964	19	9	Ejecutiva	t
2906	97	1970	53	16	Primera clase	t
7155	129	820	51	21	Economica	f
4274	130	3421	52	13	Primera clase	f
4478	120	3294	14	2	Primera clase	f
5536	117	531	65	19	Ejecutiva	f
9747	101	2844	33	17	Ejecutiva	f
7880	112	405	39	14	Ejecutiva	t
2626	99	4247	38	15	Ejecutiva	t
7804	98	1007	24	8	Economica	t
4471	115	444	53	25	Primera clase	f
436	102	2048	15	2	Economica	t
4327	101	159	66	25	Economica	t
5864	96	905	24	26	Ejecutiva	t
8172	130	834	8	9	Economica	f
8314	125	736	6	26	Ejecutiva	t
9508	108	2988	30	17	Ejecutiva	f
2220	108	3772	67	19	Economica	t
384	100	1037	53	18	Primera clase	t
7042	131	842	14	8	Ejecutiva	t
5471	122	1515	68	8	Ejecutiva	f
5029	131	2577	50	5	Economica	f
5275	125	4064	69	14	Economica	f
8630	126	3394	50	13	Ejecutiva	f
9855	125	3376	13	19	Primera clase	f
46	118	538	70	21	Economica	t
8056	114	4604	42	24	Economica	f
224	105	4396	36	32	Ejecutiva	t
2153	96	2621	65	17	Ejecutiva	t
3002	129	2543	16	22	Economica	t
840	125	736	31	28	Economica	f
1959	123	3339	33	26	Economica	f
265	101	159	68	19	Ejecutiva	f
4062	115	3845	70	22	Economica	t
4381	119	3972	53	23	Economica	t
65	114	435	49	25	Economica	f
4213	119	4697	71	8	Economica	t
5661	129	4158	18	16	Economica	f
8076	125	4772	1	18	Economica	f
8783	128	4831	72	4	Economica	t
8835	130	2556	45	11	Economica	t
8180	132	4979	53	25	Ejecutiva	f
9189	128	1687	33	26	Primera clase	f
1146	128	2542	59	20	Economica	f
6214	126	2515	73	1	Primera clase	t
2142	132	3463	47	21	Primera clase	f
7102	109	1196	23	10	Primera clase	t
4105	131	2577	73	7	Economica	f
8459	128	3405	74	5	Primera clase	f
4856	125	2504	46	7	Economica	f
4966	122	2465	12	2	Economica	t
2097	132	2578	75	8	Economica	t
181	126	3394	76	25	Ejecutiva	f
2636	130	4160	40	7	Ejecutiva	t
8266	126	2515	42	12	Ejecutiva	f
4275	101	1051	76	24	Ejecutiva	t
6330	98	4241	47	23	Ejecutiva	f
420	121	4727	53	10	Economica	f
8535	132	4186	12	22	Economica	f
9823	133	1749	71	14	Economica	f
6672	125	736	29	30	Ejecutiva	f
681	95	894	38	8	Ejecutiva	t
8911	100	1995	12	6	Economica	f
5384	120	3294	30	20	Primera clase	t
7720	124	2500	20	15	Economica	f
5779	128	1687	66	25	Economica	f
4052	126	4782	51	14	Ejecutiva	f
7198	112	3825	77	18	Economica	t
3813	118	4669	11	19	Economica	f
3026	127	797	14	29	Economica	f
1500	102	1080	32	26	Economica	f
2008	130	4160	48	19	Ejecutiva	f
7043	118	2339	56	16	Primera clase	f
99	115	3845	7	3	Ejecutiva	f
256	96	905	60	2	Ejecutiva	f
380	117	2301	7	23	Economica	t
190	125	1623	21	31	Economica	t
694	114	3168	4	18	Economica	f
9054	113	414	10	8	Primera clase	t
4769	124	4033	51	22	Primera clase	f
8667	129	1699	78	17	Economica	t
7411	108	231	7	5	Economica	t
7007	107	3752	17	1	Ejecutiva	t
4696	99	2704	65	24	Economica	t
7299	108	4437	3	4	Economica	f
9562	126	4123	19	19	Economica	f
9559	101	2029	51	15	Economica	f
1591	117	3891	35	9	Primera clase	t
569	106	2936	77	22	Economica	t
9081	133	1749	35	29	Ejecutiva	t
6552	102	4268	73	17	Economica	f
4997	125	736	19	2	Economica	t
3901	106	2936	57	21	Economica	f
1910	96	905	16	4	Primera clase	f
3904	122	3999	5	13	Economica	t
2613	113	414	79	10	Economica	f
7618	121	3298	68	12	Economica	f
4056	129	3409	67	3	Economica	t
622	119	1433	52	5	Economica	t
4303	114	4604	6	5	Economica	f
6582	122	1515	43	7	Economica	f
5763	111	2262	68	30	Economica	f
7745	129	2543	35	8	Ejecutiva	t
5169	121	3978	64	28	Ejecutiva	f
5287	103	2054	19	21	Ejecutiva	f
6554	112	4490	56	20	Ejecutiva	f
8512	128	3405	21	24	Primera clase	f
1836	123	4763	57	1	Primera clase	t
6024	132	2578	9	12	Economica	t
8748	111	1269	23	12	Economica	f
7091	117	531	27	2	Ejecutiva	f
5854	122	3333	72	12	Primera clase	f
1600	112	3825	80	25	Primera clase	t
1388	114	1331	24	16	Economica	t
659	97	1970	76	13	Primera clase	t
7659	108	231	24	15	Primera clase	t
965	128	4150	20	16	Economica	t
2284	113	2276	77	30	Economica	t
8840	103	2875	7	22	Economica	t
4672	108	2218	38	16	Economica	f
3500	111	2262	11	31	Economica	f
5857	102	4268	81	18	Ejecutiva	t
8980	98	3568	70	14	Primera clase	f
8903	111	2262	12	14	Economica	t
9752	124	3366	60	31	Ejecutiva	t
9451	102	174	18	21	Ejecutiva	f
972	104	1090	66	21	Ejecutiva	f
3521	130	2556	82	12	Economica	t
529	97	3564	36	29	Primera clase	t
7355	118	4669	71	7	Ejecutiva	f
3142	110	3037	39	21	Primera clase	f
565	111	4473	65	23	Primera clase	f
1598	129	1699	62	29	Economica	f
35	96	905	23	22	Economica	f
9677	125	1623	47	10	Primera clase	f
4469	100	102	21	17	Economica	t
8327	116	3231	83	23	Economica	t
2529	109	4464	58	1	Economica	f
4492	102	2048	14	4	Ejecutiva	f
1152	103	1082	27	20	Primera clase	t
5164	105	2133	72	10	Ejecutiva	f
2752	116	3887	1	25	Economica	t
4135	118	3951	28	15	Primera clase	f
4016	106	2151	5	17	Ejecutiva	t
5094	132	843	15	19	Primera clase	t
5870	100	102	58	2	Economica	t
3524	101	4265	52	12	Ejecutiva	f
645	110	3817	63	23	Primera clase	t
7768	108	1195	2	22	Economica	t
3429	125	736	30	16	Economica	f
9347	95	3536	26	31	Economica	t
4253	131	3450	44	14	Primera clase	f
8320	111	3819	67	19	Economica	f
2397	112	3080	3	4	Ejecutiva	f
3863	105	3728	80	31	Economica	f
2550	121	3298	46	30	Primera clase	t
4567	133	4188	47	18	Ejecutiva	f
2957	126	2515	84	27	Ejecutiva	t
4922	108	1195	45	13	Ejecutiva	t
5200	125	736	71	17	Economica	t
1291	124	1618	73	20	Economica	f
4011	106	221	82	15	Ejecutiva	t
5956	130	1722	30	14	Ejecutiva	t
7160	102	4268	68	19	Economica	t
9078	124	3366	14	3	Ejecutiva	f
198	110	3037	37	14	Primera clase	f
9658	115	4634	41	28	Ejecutiva	f
4219	102	174	22	23	Economica	t
2237	132	1733	85	11	Primera clase	f
2014	128	4831	37	32	Ejecutiva	t
1358	130	4922	79	21	Economica	t
7900	112	2271	73	11	Primera clase	t
1798	113	3147	19	19	Economica	t
34	104	3712	16	20	Economica	f
1834	111	2262	82	13	Economica	f
8241	95	1	1	7	Primera clase	f
8012	104	1090	69	6	Primera clase	f
4061	95	2616	35	23	Primera clase	f
7436	99	3588	60	9	Economica	t
213	105	219	13	12	Primera clase	f
5311	131	4926	62	19	Ejecutiva	f
5977	128	4831	86	12	Primera clase	t
8483	128	4831	58	18	Primera clase	f
6192	131	4177	23	3	Economica	t
9663	96	4222	22	25	Economica	t
2427	96	1927	51	11	Economica	t
6168	112	3080	63	12	Primera clase	t
5705	107	2193	31	8	Ejecutiva	f
977	118	3287	17	12	Primera clase	f
4719	110	1251	85	3	Economica	f
6873	105	219	78	21	Primera clase	t
3507	130	4160	24	20	Primera clase	t
3196	128	807	87	28	Primera clase	t
3430	131	842	27	4	Economica	t
1701	113	1288	7	3	Ejecutiva	t
7842	106	2151	42	16	Ejecutiva	f
9726	122	2465	74	9	Economica	t
1876	116	4646	79	32	Economica	f
1369	115	444	8	29	Economica	t
33	110	3817	43	25	Primera clase	f
4257	98	4241	80	4	Economica	f
9988	126	4782	20	31	Economica	f
8613	105	4396	40	27	Primera clase	t
2955	108	4437	75	3	Ejecutiva	t
753	115	3180	5	13	Ejecutiva	f
2661	103	3679	72	13	Ejecutiva	t
4246	105	1113	15	29	Economica	f
6623	124	4771	25	16	Economica	f
540	130	3421	86	16	Primera clase	f
2691	114	2280	9	7	Economica	t
2921	119	1433	76	21	Economica	f
6924	95	2616	36	24	Ejecutiva	t
7782	110	372	34	12	Ejecutiva	t
4865	120	616	46	3	Economica	f
1856	111	1269	63	5	Primera clase	f
1540	120	1436	13	11	Ejecutiva	t
251	114	435	27	30	Primera clase	t
8449	103	3679	78	23	Economica	t
2779	96	1927	50	30	Economica	f
3910	113	3147	67	9	Primera clase	f
3824	110	4470	62	11	Ejecutiva	f
2415	98	25	29	11	Economica	f
4386	111	1269	30	3	Primera clase	t
2496	98	4241	68	17	Primera clase	f
1610	97	945	66	12	Primera clase	f
839	121	623	30	23	Economica	t
5481	117	4660	45	17	Primera clase	f
2136	111	1269	56	29	Economica	f
8745	133	873	29	11	Economica	f
66	109	4464	17	18	Primera clase	f
2139	108	1195	78	18	Economica	f
4331	119	2414	82	14	Primera clase	f
5869	103	2875	77	18	Primera clase	t
9596	104	2123	51	23	Economica	t
8653	95	1	14	13	Economica	t
1237	97	21	49	22	Economica	t
4695	111	1269	44	17	Economica	f
899	122	3999	39	10	Economica	t
7101	102	174	52	9	Economica	t
7257	104	1090	84	30	Economica	f
9144	97	3564	72	21	Primera clase	t
1143	95	1907	53	15	Primera clase	t
20	98	3568	69	6	Primera clase	t
5051	133	4981	49	2	Economica	f
4488	120	2440	60	13	Ejecutiva	f
4194	120	4726	88	16	Economica	t
9533	111	1269	1	8	Economica	t
7865	127	4137	7	14	Economica	f
1247	96	9	73	18	Economica	f
6687	111	2262	40	21	Economica	f
2920	107	2964	75	3	Economica	f
1803	129	820	34	4	Primera clase	f
9323	126	4123	77	11	Primera clase	f
5420	120	4726	10	28	Economica	f
739	116	489	19	19	Economica	t
1539	123	4763	39	20	Ejecutiva	t
4307	114	3836	3	12	Economica	f
8101	114	3168	70	8	Economica	t
6603	106	4404	3	27	Primera clase	f
146	129	1699	63	25	Economica	f
5238	117	4660	84	11	Primera clase	t
7278	108	231	54	26	Ejecutiva	f
3668	107	4427	15	18	Primera clase	t
119	131	4926	82	16	Economica	f
637	112	3825	89	5	Ejecutiva	t
3771	107	222	29	6	Economica	t
2919	122	1515	90	24	Primera clase	f
9912	125	736	59	6	Ejecutiva	f
4691	127	797	49	3	Primera clase	f
7757	116	4646	62	13	Primera clase	t
4033	97	1970	22	24	Economica	t
3482	100	102	88	7	Ejecutiva	t
7655	103	4365	66	12	Primera clase	f
2862	123	4763	20	32	Ejecutiva	f
2028	127	1678	76	23	Primera clase	t
957	107	222	34	23	Primera clase	t
9396	114	4604	86	6	Ejecutiva	t
2089	110	372	11	22	Economica	f
7515	119	613	64	24	Primera clase	f
3187	130	2556	76	15	Economica	f
6894	98	3568	72	16	Ejecutiva	t
4340	99	92	7	7	Economica	f
3682	96	2621	62	28	Ejecutiva	t
5378	128	3405	31	14	Economica	f
3192	96	1927	21	1	Economica	t
791	98	2633	61	2	Economica	f
6358	105	2910	9	8	Primera clase	f
9949	118	4669	32	9	Economica	f
9692	118	3287	81	24	Economica	f
7015	131	4177	42	23	Economica	f
8568	102	2855	53	22	Economica	f
5333	104	3712	35	5	Primera clase	t
1505	105	3728	55	15	Ejecutiva	t
2714	114	435	45	10	Ejecutiva	t
3380	119	4697	56	25	Primera clase	f
3538	124	4033	37	32	Primera clase	f
1726	102	1080	11	5	Primera clase	t
9947	103	2875	60	25	Economica	t
2072	98	4241	53	24	Economica	f
7161	109	3003	88	6	Primera clase	f
1837	133	873	75	13	Economica	f
8299	108	2988	72	20	Economica	t
8953	123	1542	90	28	Economica	t
6828	114	3168	77	27	Ejecutiva	t
2350	95	4209	24	4	Ejecutiva	t
5862	111	2262	24	18	Economica	t
8547	116	3887	80	11	Economica	t
2354	108	2218	90	14	Primera clase	f
5766	133	873	32	21	Primera clase	f
2339	111	403	34	11	Primera clase	t
9204	126	4123	87	30	Economica	f
630	107	4427	25	10	Primera clase	t
1396	121	4727	84	15	Economica	t
31	114	2280	50	4	Economica	t
8480	131	2577	64	11	Economica	f
5841	100	102	50	16	Economica	f
2724	111	2262	90	16	Primera clase	f
7567	104	2890	22	22	Economica	f
9052	109	255	71	28	Primera clase	t
854	125	4772	49	24	Economica	f
1080	127	4800	9	6	Economica	t
9593	122	4758	15	25	Ejecutiva	f
3331	96	905	89	20	Economica	t
2168	97	2625	33	20	Economica	t
986	118	1430	64	18	Economica	t
117	103	2875	67	14	Economica	t
5363	127	3396	26	2	Economica	f
3611	107	3752	42	25	Ejecutiva	t
7484	129	4902	86	6	Economica	f
2292	111	2262	18	9	Economica	t
9435	123	4004	88	31	Primera clase	t
3214	124	1618	29	28	Economica	f
2578	122	2465	83	17	Economica	f
4764	120	3294	17	5	Primera clase	t
8829	123	4004	22	19	Primera clase	f
6016	96	905	55	19	Ejecutiva	t
8272	131	4926	63	18	Economica	t
3139	112	3080	84	22	Ejecutiva	f
4170	99	1991	52	29	Economica	t
7233	107	2193	9	12	Economica	t
8217	115	2281	23	15	Primera clase	f
9569	102	174	74	10	Ejecutiva	t
3570	104	1090	82	26	Economica	t
2475	111	4473	3	25	Primera clase	t
4475	119	3972	28	7	Ejecutiva	f
348	126	743	64	22	Ejecutiva	t
5853	107	2193	40	4	Ejecutiva	t
2329	118	3287	55	1	Economica	f
4357	114	1331	12	11	Economica	t
6868	95	3536	7	18	Primera clase	f
8281	98	1007	42	12	Economica	f
6212	110	3037	83	17	Economica	f
7738	107	2964	35	26	Primera clase	t
2821	119	3293	4	9	Primera clase	t
7657	111	2262	31	6	Ejecutiva	t
5896	132	3463	30	20	Ejecutiva	t
981	125	736	80	1	Primera clase	f
9031	119	3293	68	17	Primera clase	f
8504	115	1361	18	18	Primera clase	t
8744	112	3080	85	27	Economica	f
4453	102	174	2	8	Primera clase	f
8724	109	3003	76	15	Economica	t
6198	112	405	47	15	Ejecutiva	t
8589	126	4123	38	28	Ejecutiva	t
8715	96	2621	17	23	Economica	t
9669	101	3593	16	10	Economica	f
6463	113	3147	2	25	Economica	t
2060	123	1542	70	22	Economica	t
4702	133	3471	7	27	Ejecutiva	f
3633	102	174	79	12	Primera clase	f
6441	117	3237	57	25	Ejecutiva	t
1649	111	3059	7	4	Ejecutiva	t
4538	128	2542	43	27	Primera clase	t
9822	116	3231	15	24	Economica	f
6912	132	1733	58	2	Economica	t
3441	121	4727	42	19	Primera clase	f
6586	130	4922	29	5	Ejecutiva	f
9806	126	743	68	23	Ejecutiva	t
951	109	255	52	19	Ejecutiva	t
7165	97	3564	48	4	Primera clase	f
8940	131	2577	4	10	Economica	f
5007	126	3394	8	24	Economica	t
5569	105	2133	46	1	Ejecutiva	f
2378	101	159	30	8	Economica	t
9141	113	1288	85	21	Ejecutiva	t
5567	132	2578	41	18	Economica	t
8633	115	2281	38	16	Economica	f
3959	111	3819	39	22	Economica	f
9712	110	1251	17	5	Ejecutiva	f
1282	107	2193	30	24	Economica	t
5073	122	628	77	4	Economica	f
4134	102	2048	10	30	Ejecutiva	f
7756	127	2540	28	28	Economica	f
2582	102	3668	64	13	Ejecutiva	f
6071	124	4033	26	21	Ejecutiva	t
7481	98	1975	36	22	Primera clase	f
2859	119	3972	21	18	Primera clase	f
6724	116	3231	25	29	Ejecutiva	t
5642	115	1361	6	26	Primera clase	f
4784	108	3772	48	7	Primera clase	t
8378	100	2739	80	11	Primera clase	f
1487	131	3450	83	13	Ejecutiva	f
5294	95	1	89	14	Primera clase	f
4390	101	4265	75	29	Primera clase	f
4982	106	4404	46	1	Economica	t
3902	131	3450	87	21	Ejecutiva	t
4205	124	1618	78	13	Economica	f
2140	110	4470	54	26	Economica	t
7491	113	3832	37	22	Economica	f
9095	100	2739	37	28	Economica	t
4021	114	3168	73	21	Economica	t
9027	128	3405	36	15	Ejecutiva	f
308	114	435	30	28	Ejecutiva	f
6139	130	1722	54	6	Economica	t
3508	118	4669	79	13	Economica	t
4207	117	1422	34	4	Primera clase	f
3585	106	4404	58	29	Economica	t
8814	111	1269	26	15	Ejecutiva	f
756	133	2597	20	20	Economica	t
807	97	4236	71	32	Economica	t
2754	109	2220	5	20	Economica	t
2265	123	629	64	29	Economica	t
7872	121	1480	87	18	Economica	t
9088	123	4763	21	21	Ejecutiva	f
2191	108	3772	50	29	Primera clase	t
7761	111	2262	60	24	Economica	t
7412	120	1436	15	23	Economica	f
9085	112	4490	25	28	Economica	f
7950	120	616	39	10	Primera clase	t
7593	105	3728	37	2	Economica	t
2486	101	3593	32	9	Economica	t
9748	114	435	76	17	Economica	f
8830	124	2500	45	19	Economica	t
7297	125	4064	53	12	Primera clase	t
7721	108	1195	64	2	Economica	f
5679	100	1037	89	15	Economica	t
6837	125	736	7	4	Primera clase	t
4541	104	1090	27	11	Economica	f
7111	102	2855	6	6	Economica	t
1261	127	1678	65	27	Primera clase	t
2446	102	4268	1	24	Primera clase	f
5963	107	1165	67	7	Economica	t
3354	105	2910	14	30	Economica	f
4302	100	3591	81	4	Ejecutiva	t
482	124	4771	71	5	Ejecutiva	t
2943	104	182	50	28	Primera clase	t
4943	102	174	75	16	Ejecutiva	t
3065	95	894	31	12	Primera clase	t
7732	120	616	34	9	Primera clase	t
5598	121	4727	60	11	Ejecutiva	f
2407	129	4902	3	5	Primera clase	t
1914	95	2616	13	9	Economica	f
325	112	405	49	3	Ejecutiva	f
1217	110	3037	8	6	Primera clase	f
9749	130	3421	81	18	Economica	f
8276	99	1991	58	30	Ejecutiva	t
7853	102	3668	8	15	Economica	t
3741	112	405	76	8	Economica	f
3945	106	221	20	19	Economica	f
9029	123	2497	11	9	Ejecutiva	t
1678	105	1113	45	4	Primera clase	t
4091	121	4727	2	2	Economica	f
6684	103	2054	64	9	Primera clase	f
1926	99	92	72	20	Economica	f
7884	118	4669	74	2	Primera clase	f
6685	123	2497	58	18	Economica	f
4349	131	1726	35	12	Economica	t
5128	119	3972	57	28	Economica	f
134	126	4782	79	5	Ejecutiva	f
6844	131	4177	76	15	Ejecutiva	f
9634	109	3775	87	9	Economica	f
967	95	3536	46	27	Economica	t
353	129	3409	55	23	Economica	f
4457	99	2704	67	10	Primera clase	f
7163	125	736	24	23	Economica	f
7647	133	3471	23	23	Economica	f
8156	104	1090	7	9	Economica	t
7913	128	3405	83	6	Economica	f
3739	129	1699	80	10	Primera clase	t
7914	111	4473	58	26	Economica	t
4510	95	1907	63	17	Primera clase	f
2710	101	3593	62	18	Primera clase	t
8174	100	1037	63	29	Economica	f
5074	111	1269	88	7	Primera clase	t
1674	97	4236	41	19	Economica	f
193	122	1515	53	1	Economica	f
1443	113	4523	64	31	Ejecutiva	f
9751	121	4727	69	21	Economica	t
5522	100	1995	46	24	Primera clase	t
631	116	4646	22	21	Primera clase	f
2586	97	3564	2	15	Ejecutiva	t
8877	109	3003	6	21	Ejecutiva	f
8476	101	3593	17	20	Economica	f
5539	129	4158	31	27	Ejecutiva	f
872	120	3974	82	15	Economica	f
6144	116	1405	13	26	Ejecutiva	t
7587	131	842	67	9	Ejecutiva	f
3595	118	538	3	20	Economica	f
8501	100	1037	2	13	Ejecutiva	t
853	110	2226	1	16	Economica	f
9203	103	4365	56	1	Economica	t
9252	121	2448	89	7	Economica	t
4238	97	21	87	30	Ejecutiva	f
1978	124	3366	40	10	Economica	t
7651	99	3588	4	11	Primera clase	t
8842	114	1331	87	15	Economica	t
6558	100	4263	6	1	Economica	f
1377	128	1687	27	19	Economica	t
8496	128	1687	16	10	Primera clase	f
2782	116	3887	37	30	Ejecutiva	f
4694	107	4427	86	16	Primera clase	t
6570	112	1286	18	19	Economica	t
6638	103	2875	24	7	Economica	f
1285	97	4236	42	17	Ejecutiva	t
7767	122	628	78	6	Economica	t
6140	104	4372	11	3	Economica	f
7303	97	2625	32	25	Economica	t
5274	121	2448	20	16	Ejecutiva	f
9744	117	531	20	8	Ejecutiva	f
3111	102	1080	63	25	Economica	t
6211	115	3845	27	17	Economica	t
5777	125	4772	28	21	Economica	t
3895	104	3712	9	32	Ejecutiva	f
7212	124	4033	10	1	Economica	f
2431	113	1288	34	23	Economica	t
4991	113	4523	13	1	Ejecutiva	t
493	121	2448	75	1	Ejecutiva	f
1103	96	9	52	14	Primera clase	f
5995	104	2890	75	31	Economica	t
394	97	1970	67	31	Primera clase	t
4806	129	820	57	19	Economica	t
9302	102	174	26	20	Economica	t
2195	115	2281	12	14	Economica	t
442	131	842	17	25	Economica	f
6539	120	2440	48	14	Primera clase	f
3120	110	372	5	15	Economica	t
4012	127	4137	55	4	Ejecutiva	f
1637	95	1907	6	16	Economica	f
881	118	3951	68	26	Economica	t
8996	124	1618	33	25	Economica	f
6113	106	3739	18	14	Primera clase	t
6604	119	613	47	15	Economica	f
3230	125	2504	34	5	Economica	t
7293	106	221	4	5	Ejecutiva	t
9135	118	3287	85	17	Ejecutiva	f
1445	108	2988	82	12	Ejecutiva	t
583	132	1733	29	17	Primera clase	f
1911	133	2597	33	25	Economica	f
8864	107	4427	32	15	Ejecutiva	t
6123	103	2054	38	19	Economica	f
7716	101	2844	86	28	Economica	t
1568	123	629	71	13	Economica	t
5810	120	3974	73	22	Economica	t
5940	98	25	51	10	Economica	t
7256	100	102	87	27	Economica	t
4983	100	3591	61	20	Economica	t
1016	133	4188	31	9	Economica	f
3921	128	4150	14	30	Ejecutiva	f
8029	122	1515	42	26	Economica	t
5525	95	2616	20	10	Ejecutiva	t
2433	116	3887	88	27	Ejecutiva	t
2806	127	3396	38	13	Economica	f
3174	118	2339	7	14	Primera clase	f
2975	99	1016	39	13	Economica	f
2725	118	1430	73	4	Economica	f
8608	119	2414	60	26	Economica	t
5120	101	2029	81	4	Economica	f
9560	102	1080	58	28	Ejecutiva	f
4102	118	3951	69	27	Economica	t
3081	119	3293	43	27	Ejecutiva	t
6020	96	3543	66	24	Ejecutiva	f
1340	104	2123	47	18	Economica	t
9750	107	3752	33	27	Economica	f
5408	100	3591	18	3	Economica	f
6990	132	3463	72	24	Primera clase	f
5552	115	444	78	4	Economica	f
2781	121	3298	49	9	Ejecutiva	t
4209	99	4247	46	21	Economica	t
2938	123	3339	37	30	Economica	f
705	113	3832	81	26	Economica	f
2755	130	1722	43	1	Primera clase	f
5335	125	3376	41	8	Economica	t
1805	103	181	55	4	Ejecutiva	f
9048	130	3421	85	17	Primera clase	t
3100	132	4186	13	14	Economica	f
9315	97	945	20	7	Economica	t
5390	100	2739	11	14	Economica	f
1970	100	3591	74	5	Economica	f
9497	101	2844	65	11	Economica	t
4866	133	2597	25	8	Ejecutiva	f
7726	111	2262	81	28	Economica	t
148	133	1749	77	26	Economica	f
8291	127	4800	90	20	Primera clase	f
7073	116	4646	42	5	Economica	t
1065	126	3394	69	26	Economica	f
4849	128	3405	23	23	Primera clase	f
4193	125	4064	16	15	Economica	t
2163	117	4660	5	20	Economica	t
9807	133	873	41	7	Economica	f
6581	124	3366	23	14	Ejecutiva	f
6515	98	1007	10	13	Economica	t
6357	102	174	90	14	Economica	f
1179	112	2271	55	9	Ejecutiva	f
2006	113	4523	89	28	Economica	f
8752	123	629	4	25	Economica	t
6070	98	1975	46	15	Economica	f
90	97	2625	9	3	Economica	t
4776	100	4263	41	8	Economica	f
6996	124	3366	17	2	Economica	f
1090	105	2133	35	22	Ejecutiva	t
9059	101	1051	41	5	Economica	t
1968	101	4265	34	21	Ejecutiva	f
7107	98	1975	75	20	Economica	f
4165	123	4004	35	27	Economica	t
1548	129	2543	66	26	Primera clase	f
9607	116	3887	17	31	Economica	f
7617	109	2220	18	16	Ejecutiva	t
3107	106	1155	23	20	Primera clase	f
927	106	221	81	13	Primera clase	t
707	130	834	66	10	Economica	t
9352	97	1970	34	18	Ejecutiva	t
7305	131	4926	60	17	Ejecutiva	t
7103	120	2440	65	12	Ejecutiva	t
3360	113	3147	59	24	Ejecutiva	t
4588	121	4727	37	14	Ejecutiva	t
8335	127	3396	17	16	Economica	f
1929	113	2276	11	14	Ejecutiva	t
81	95	4209	65	20	Economica	t
8309	115	4634	59	19	Primera clase	t
2766	128	4150	7	29	Economica	t
8435	102	174	85	27	Economica	t
9739	121	3978	71	17	Ejecutiva	t
4775	127	1678	33	26	Economica	t
7542	121	3298	25	8	Ejecutiva	f
4792	121	4727	17	13	Ejecutiva	f
7215	117	2301	89	24	Economica	f
8737	125	4064	11	13	Ejecutiva	t
5672	103	2054	76	8	Economica	t
4668	114	3836	41	13	Economica	f
9630	104	4372	44	7	Primera clase	f
5030	127	2540	54	30	Primera clase	f
7883	95	894	69	30	Ejecutiva	t
8296	119	2414	72	16	Economica	t
6576	131	1726	22	2	Economica	t
8371	132	2578	27	23	Economica	t
6869	122	1515	84	27	Economica	f
7558	108	3772	85	30	Economica	f
4985	99	1016	21	6	Primera clase	f
9966	129	4158	54	24	Primera clase	f
5129	122	4758	19	20	Economica	f
2382	126	2515	65	21	Economica	t
4249	104	2123	8	12	Economica	f
8880	110	4470	67	27	Ejecutiva	t
4462	106	1155	48	28	Primera clase	t
7472	132	843	74	13	Ejecutiva	f
7594	99	4247	44	27	Primera clase	f
1545	111	3059	80	32	Economica	f
994	126	1642	47	29	Ejecutiva	f
9017	96	3543	36	21	Primera clase	f
6779	98	1007	85	29	Primera clase	f
\.


--
-- Data for Name: trabajador; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.trabajador (id, pasaporte, nombre, fecha_nacimiento) FROM stdin;
4	F08731569	Diane Swanson	1974-02-14
38	O88716397	Gabriel Palmer	1981-08-18
24	B96464671	Eric Phelps	1994-10-01
8	J22810925	Jason Edwards	1975-02-09
2	W08204144	Melissa Jimenez	1998-12-18
35	D89562085	Francisco Rich	1996-02-21
22	R08362516	Rodney Wilson	1973-10-18
15	S26547035	Matthew Walsh	1993-09-20
40	N92528667	Brian Berry	1998-12-22
59	A85793465	Jacob Duran	1988-02-25
31	L01109034	Linda Warren	1975-03-13
25	E10934506	Danny Pratt	1998-10-31
58	B79815379	Samuel Jimenez	1984-01-07
17	I74549867	Laura Ward	1981-01-23
39	Y69764268	Patricia Norris	1974-12-08
18	O16330677	Michael Chavez	1976-08-28
45	U50608611	Jill Haas	1986-04-10
10	A35692355	Alex Deleon	1979-10-03
20	U46471214	James Singleton	1977-08-12
43	G17571521	Rebecca Valenzuela	1971-08-18
0	L89163667	Jessica Harvey	1996-04-08
53	P27318304	Patricia Alvarado	1983-08-01
14	J06543685	Ronnie Macias	1988-02-12
51	B29047250	Kristina Gilmore	1985-12-13
34	C02131672	Ronald Monroe	1984-09-12
37	O98651462	Joe Cabrera	1994-08-13
54	Q49180524	Gene Obrien	1999-07-02
19	Z32250364	Desiree Williams	1993-03-19
21	H50641909	Kimberly Brown	1999-09-02
23	V51246373	Latasha Nelson	1986-05-09
12	L28170812	Ronnie Moore	1997-01-12
7	Q46419538	Curtis Gutierrez	1974-03-14
46	Y81323264	Heather Arnold	1999-01-10
16	C97271665	Tracey Harris	1978-06-05
50	Y37241205	Adam Herrera	1976-12-04
47	T63857772	Michael Compton	1980-01-07
56	W12727804	Isaiah Riley	1986-09-18
32	I87476188	Darrell Henderson	1975-03-14
1	J00360904	Melanie Cummings	1980-09-01
49	O21522167	Kenneth Brady	1981-11-06
42	G18065401	Deborah Martinez	1987-02-03
13	U87751971	Bradley Glenn	1975-10-17
5	E21376006	Miguel Oliver	1992-08-27
52	F00773862	Sara Sims	1999-07-10
41	G16561693	Jeffrey Roberts	1971-12-02
33	P24467352	Samantha Mora	1990-10-27
28	W03439988	Nicholas Simmons	1994-08-03
26	S70038299	Elizabeth Jordan	1974-09-16
9	F40422038	John Ross	1979-03-16
30	X88103341	Daniel Callahan	1987-09-13
27	Z48029074	Steven Hernandez	1997-11-18
11	B62958600	David Tran	1975-08-07
48	W59287703	Alex Walsh	1985-12-12
29	H06267236	Mr. James Baxter	1982-05-03
36	U66847209	Justin Martin	1984-07-08
3	L91489362	Linda Paul	1983-01-12
57	I14085439	Kerry Quinn	1978-01-15
6	T50398906	Jason Moore	1991-01-27
55	U79474626	Rachael Vasquez	1998-10-31
44	O66207589	David Robinson	1983-05-04
\.


--
-- Data for Name: trabajador_aerolinea; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.trabajador_aerolinea (id_trabajador, id_aerolinea) FROM stdin;
4	8
38	18
24	9
8	1
2	14
35	7
22	4
15	5
40	11
59	10
22	18
31	16
25	5
58	16
17	15
59	8
59	9
39	1
25	19
25	1
18	19
45	15
10	7
59	16
20	10
43	3
59	17
8	13
0	19
53	3
14	14
40	6
51	16
59	12
8	15
35	4
34	14
37	12
54	2
25	3
25	8
31	1
59	4
19	14
37	3
15	13
17	5
21	20
23	15
17	6
8	7
18	3
23	13
12	1
8	11
10	15
40	16
7	2
4	4
19	6
22	2
45	12
46	18
59	3
16	6
15	7
31	6
37	11
54	11
8	14
50	12
18	6
23	12
22	10
7	1
22	8
8	6
47	10
0	7
8	20
24	19
56	18
31	20
22	5
32	19
34	17
1	14
49	8
53	8
19	1
42	13
56	8
21	4
19	15
13	8
12	12
56	10
37	9
5	14
58	18
52	8
10	6
21	7
51	8
59	18
32	17
38	5
31	12
41	9
0	16
21	8
24	20
33	3
2	3
8	10
19	20
28	12
59	5
50	3
23	16
32	11
47	4
8	19
56	4
22	13
12	9
26	15
58	3
34	2
5	18
21	1
0	13
46	14
9	3
16	20
7	16
56	7
7	8
25	20
59	2
53	1
35	17
26	12
30	14
1	9
16	5
24	7
56	3
27	16
52	12
30	20
28	11
51	12
17	4
20	9
37	4
9	15
52	6
39	17
34	10
58	13
5	2
7	3
41	6
13	19
50	20
2	12
38	14
49	14
24	6
0	2
41	7
58	1
40	12
47	5
41	14
9	18
37	17
2	7
34	18
2	8
34	4
13	9
49	18
46	8
43	1
14	5
54	8
11	14
11	16
15	11
33	17
48	12
54	9
27	2
1	20
4	12
42	8
29	11
10	10
14	3
9	17
17	11
50	18
5	8
28	14
48	2
15	10
45	5
30	19
39	12
20	13
42	2
11	11
47	6
\.


--
-- Data for Name: trabajador_vuelo; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.trabajador_vuelo (id_vuelo, id_trabajador, rol) FROM stdin;
139	4	Tripulante de Cabina
124	35	Paramedico
77	15	Copiloto
147	25	Copiloto
17	59	Piloto
94	43	Paramedico
143	0	Copiloto
27	53	Paramedico
89	35	Paramedico
65	18	Tripulante de Cabina
130	23	Copiloto
87	12	Tripulante de Cabina
100	54	Piloto
25	18	Tripulante de Cabina
82	23	Copiloto
90	17	Copiloto
3	59	Copiloto
121	14	Tripulante de Cabina
109	47	Paramedico
108	56	Tripulante de Cabina
132	8	Copiloto
76	8	Copiloto
50	1	Tripulante de Cabina
138	49	Paramedico
43	53	Paramedico
51	59	Piloto
111	21	Copiloto
26	12	Tripulante de Cabina
54	52	Paramedico
90	22	Tripulante de Cabina
86	0	Piloto
115	21	Piloto
21	24	Piloto
91	33	Tripulante de Cabina
84	24	Piloto
97	28	Tripulante de Cabina
29	50	Paramedico
83	37	Copiloto
98	47	Paramedico
12	8	Piloto
107	8	Copiloto
111	56	Tripulante de Cabina
113	12	Tripulante de Cabina
6	19	Tripulante de Cabina
19	7	Piloto
53	51	Tripulante de Cabina
107	0	Piloto
33	58	Tripulante de Cabina
56	21	Copiloto
118	26	Tripulante de Cabina
60	0	Piloto
33	50	Paramedico
141	7	Piloto
9	31	Piloto
136	21	Piloto
8	7	Piloto
106	35	Paramedico
97	26	Tripulante de Cabina
147	24	Piloto
76	10	Piloto
128	25	Piloto
28	22	Tripulante de Cabina
55	8	Copiloto
121	30	Paramedico
141	53	Paramedico
70	15	Piloto
127	25	Copiloto
12	16	Tripulante de Cabina
84	30	Paramedico
39	58	Tripulante de Cabina
131	22	Tripulante de Cabina
11	28	Tripulante de Cabina
118	23	Copiloto
100	8	Copiloto
110	22	Tripulante de Cabina
127	31	Piloto
21	30	Paramedico
108	59	Piloto
139	25	Piloto
42	39	Tripulante de Cabina
59	59	Copiloto
33	25	Piloto
53	21	Copiloto
44	58	Tripulante de Cabina
43	21	Piloto
146	0	Piloto
101	5	Tripulante de Cabina
36	22	Tripulante de Cabina
110	8	Piloto
68	7	Piloto
24	22	Tripulante de Cabina
91	2	Tripulante de Cabina
144	13	Tripulante de Cabina
73	59	Copiloto
8	22	Tripulante de Cabina
102	46	Tripulante de Cabina
29	59	Copiloto
30	49	Paramedico
28	7	Copiloto
144	8	Copiloto
44	15	Piloto
124	41	Piloto
137	51	Tripulante de Cabina
32	21	Copiloto
35	40	Paramedico
41	8	Copiloto
105	50	Paramedico
35	59	Copiloto
34	41	Copiloto
125	30	Paramedico
144	25	Piloto
48	2	Tripulante de Cabina
142	18	Tripulante de Cabina
124	2	Tripulante de Cabina
26	2	Tripulante de Cabina
44	23	Copiloto
113	13	Tripulante de Cabina
45	38	Copiloto
139	56	Tripulante de Cabina
65	53	Paramedico
71	7	Copiloto
101	22	Tripulante de Cabina
88	8	Copiloto
144	32	Paramedico
51	51	Tripulante de Cabina
50	49	Paramedico
63	37	Piloto
59	5	Tripulante de Cabina
96	37	Piloto
31	59	Piloto
71	43	Paramedico
112	25	Copiloto
90	14	Tripulante de Cabina
137	54	Copiloto
34	11	Tripulante de Cabina
140	52	Paramedico
21	25	Copiloto
78	35	Paramedico
34	2	Tripulante de Cabina
134	15	Piloto
132	54	Piloto
142	32	Paramedico
108	46	Tripulante de Cabina
135	21	Piloto
9	52	Paramedico
93	2	Tripulante de Cabina
37	19	Tripulante de Cabina
35	48	Tripulante de Cabina
135	31	Copiloto
104	56	Tripulante de Cabina
87	8	Copiloto
14	27	Paramedico
109	34	Copiloto
105	4	Tripulante de Cabina
91	25	Piloto
72	25	Piloto
123	38	Piloto
38	21	Piloto
11	29	Piloto
66	10	Copiloto
103	14	Tripulante de Cabina
56	8	Piloto
44	42	Tripulante de Cabina
103	25	Copiloto
23	51	Tripulante de Cabina
126	9	Piloto
79	17	Piloto
147	32	Paramedico
94	25	Copiloto
139	51	Tripulante de Cabina
114	19	Tripulante de Cabina
15	39	Tripulante de Cabina
88	15	Piloto
107	13	Tripulante de Cabina
6	46	Tripulante de Cabina
4	43	Paramedico
117	59	Copiloto
138	54	Piloto
132	32	Paramedico
108	49	Paramedico
36	21	Copiloto
80	8	Copiloto
13	59	Piloto
6	11	Tripulante de Cabina
111	59	Piloto
130	15	Piloto
43	54	Copiloto
98	59	Piloto
66	20	Paramedico
58	30	Paramedico
126	59	Copiloto
57	27	Paramedico
5	58	Tripulante de Cabina
59	48	Tripulante de Cabina
80	43	Paramedico
26	23	Piloto
133	53	Paramedico
95	50	Paramedico
11	40	Paramedico
57	11	Tripulante de Cabina
131	15	Copiloto
145	18	Tripulante de Cabina
120	8	Piloto
114	17	Piloto
7	24	Copiloto
89	34	Piloto
18	52	Paramedico
108	34	Copiloto
89	56	Tripulante de Cabina
48	59	Piloto
99	59	Copiloto
27	37	Copiloto
20	12	Tripulante de Cabina
20	59	Copiloto
67	32	Paramedico
18	37	Piloto
76	16	Tripulante de Cabina
1	58	Tripulante de Cabina
0	56	Tripulante de Cabina
136	22	Tripulante de Cabina
109	8	Piloto
81	14	Tripulante de Cabina
86	40	Paramedico
45	8	Piloto
132	28	Tripulante de Cabina
123	45	Paramedico
87	19	Tripulante de Cabina
66	56	Tripulante de Cabina
0	8	Piloto
52	59	Copiloto
103	18	Tripulante de Cabina
111	4	Tripulante de Cabina
89	22	Tripulante de Cabina
99	38	Piloto
128	7	Copiloto
136	46	Tripulante de Cabina
90	38	Piloto
101	59	Copiloto
139	21	Copiloto
30	46	Tripulante de Cabina
44	20	Paramedico
45	46	Tripulante de Cabina
114	52	Paramedico
106	34	Copiloto
48	48	Tripulante de Cabina
40	48	Tripulante de Cabina
95	16	Tripulante de Cabina
131	8	Piloto
143	30	Paramedico
5	38	Copiloto
137	25	Piloto
69	52	Paramedico
69	10	Piloto
94	56	Tripulante de Cabina
131	47	Paramedico
45	11	Tripulante de Cabina
48	26	Tripulante de Cabina
68	58	Tripulante de Cabina
83	40	Paramedico
38	53	Paramedico
4	37	Piloto
81	25	Piloto
99	22	Tripulante de Cabina
65	58	Tripulante de Cabina
61	21	Piloto
110	20	Paramedico
9	39	Tripulante de Cabina
54	21	Piloto
84	21	Copiloto
78	10	Piloto
47	56	Tripulante de Cabina
22	23	Piloto
146	24	Copiloto
96	23	Copiloto
25	16	Tripulante de Cabina
129	47	Paramedico
92	26	Tripulante de Cabina
50	19	Tripulante de Cabina
46	2	Tripulante de Cabina
140	59	Copiloto
119	19	Tripulante de Cabina
141	25	Copiloto
104	2	Tripulante de Cabina
138	2	Tripulante de Cabina
85	19	Tripulante de Cabina
133	21	Piloto
148	0	Piloto
142	25	Piloto
121	46	Tripulante de Cabina
3	37	Piloto
116	51	Tripulante de Cabina
121	34	Copiloto
134	17	Copiloto
103	58	Tripulante de Cabina
60	58	Tripulante de Cabina
33	2	Tripulante de Cabina
148	25	Copiloto
77	22	Tripulante de Cabina
59	22	Tripulante de Cabina
62	27	Paramedico
119	25	Copiloto
125	24	Piloto
103	43	Paramedico
9	59	Copiloto
104	24	Piloto
137	52	Paramedico
141	5	Tripulante de Cabina
80	25	Piloto
45	1	Tripulante de Cabina
138	42	Tripulante de Cabina
26	26	Tripulante de Cabina
136	4	Tripulante de Cabina
47	4	Tripulante de Cabina
123	16	Tripulante de Cabina
72	32	Paramedico
107	18	Tripulante de Cabina
121	5	Tripulante de Cabina
7	12	Tripulante de Cabina
8	46	Tripulante de Cabina
98	56	Tripulante de Cabina
15	59	Copiloto
50	34	Copiloto
33	33	Tripulante de Cabina
98	21	Copiloto
129	37	Piloto
55	25	Piloto
42	33	Tripulante de Cabina
72	18	Tripulante de Cabina
49	42	Tripulante de Cabina
81	37	Copiloto
60	20	Paramedico
41	18	Tripulante de Cabina
111	47	Paramedico
50	46	Tripulante de Cabina
145	0	Copiloto
31	9	Copiloto
120	16	Tripulante de Cabina
122	0	Copiloto
75	54	Piloto
39	31	Copiloto
147	13	Tripulante de Cabina
32	35	Paramedico
96	39	Tripulante de Cabina
38	25	Copiloto
120	19	Tripulante de Cabina
67	8	Piloto
112	19	Tripulante de Cabina
40	5	Tripulante de Cabina
3	20	Paramedico
5	9	Piloto
16	39	Tripulante de Cabina
13	52	Paramedico
79	28	Tripulante de Cabina
121	2	Tripulante de Cabina
2	50	Paramedico
22	0	Copiloto
120	52	Paramedico
76	18	Tripulante de Cabina
1	18	Tripulante de Cabina
92	10	Copiloto
37	1	Tripulante de Cabina
40	27	Paramedico
74	59	Piloto
9	2	Tripulante de Cabina
88	40	Paramedico
102	41	Piloto
93	24	Copiloto
106	9	Piloto
136	2	Tripulante de Cabina
137	42	Tripulante de Cabina
70	20	Paramedico
38	5	Tripulante de Cabina
145	25	Piloto
63	20	Paramedico
97	12	Tripulante de Cabina
49	27	Paramedico
95	25	Piloto
96	51	Tripulante de Cabina
34	34	Piloto
116	23	Piloto
52	26	Tripulante de Cabina
86	58	Tripulante de Cabina
37	25	Piloto
23	58	Tripulante de Cabina
38	4	Tripulante de Cabina
129	56	Tripulante de Cabina
39	59	Piloto
16	37	Piloto
101	27	Paramedico
10	52	Paramedico
73	35	Paramedico
58	25	Copiloto
3	12	Tripulante de Cabina
96	12	Tripulante de Cabina
62	23	Piloto
97	40	Paramedico
81	2	Tripulante de Cabina
52	51	Tripulante de Cabina
0	22	Tripulante de Cabina
122	11	Tripulante de Cabina
102	34	Copiloto
29	25	Piloto
97	31	Copiloto
1	59	Copiloto
136	7	Copiloto
92	23	Piloto
124	21	Copiloto
26	51	Tripulante de Cabina
117	14	Tripulante de Cabina
115	53	Paramedico
35	26	Tripulante de Cabina
115	46	Tripulante de Cabina
45	28	Tripulante de Cabina
13	7	Copiloto
33	14	Tripulante de Cabina
10	41	Copiloto
90	47	Paramedico
33	9	Copiloto
46	56	Tripulante de Cabina
138	13	Tripulante de Cabina
77	47	Paramedico
30	5	Tripulante de Cabina
119	12	Tripulante de Cabina
12	52	Paramedico
30	28	Tripulante de Cabina
126	35	Paramedico
112	16	Tripulante de Cabina
116	27	Paramedico
86	59	Copiloto
140	51	Tripulante de Cabina
75	5	Tripulante de Cabina
102	49	Paramedico
117	38	Piloto
78	2	Tripulante de Cabina
122	58	Tripulante de Cabina
77	38	Piloto
126	39	Tripulante de Cabina
65	33	Tripulante de Cabina
125	16	Tripulante de Cabina
74	45	Paramedico
62	0	Copiloto
38	46	Tripulante de Cabina
85	24	Copiloto
70	0	Copiloto
24	23	Copiloto
112	24	Piloto
22	11	Tripulante de Cabina
79	32	Paramedico
93	41	Piloto
52	48	Tripulante de Cabina
61	53	Paramedico
71	31	Piloto
9	28	Tripulante de Cabina
25	24	Copiloto
99	49	Paramedico
47	17	Copiloto
26	52	Paramedico
1	7	Piloto
24	20	Paramedico
52	23	Piloto
129	59	Copiloto
115	56	Tripulante de Cabina
14	23	Piloto
125	25	Copiloto
89	17	Copiloto
127	12	Tripulante de Cabina
23	31	Piloto
10	16	Tripulante de Cabina
57	59	Copiloto
98	4	Tripulante de Cabina
19	42	Tripulante de Cabina
17	27	Paramedico
37	31	Copiloto
74	38	Copiloto
61	12	Tripulante de Cabina
139	49	Paramedico
85	50	Paramedico
85	31	Piloto
113	37	Piloto
39	40	Paramedico
26	31	Copiloto
50	41	Piloto
58	24	Piloto
91	53	Paramedico
17	58	Tripulante de Cabina
66	59	Piloto
133	7	Copiloto
38	51	Tripulante de Cabina
54	7	Copiloto
56	53	Paramedico
9	48	Tripulante de Cabina
32	4	Tripulante de Cabina
132	11	Tripulante de Cabina
93	35	Paramedico
73	22	Tripulante de Cabina
138	25	Copiloto
28	52	Paramedico
38	56	Tripulante de Cabina
59	27	Paramedico
105	31	Piloto
25	40	Paramedico
0	10	Copiloto
63	13	Tripulante de Cabina
46	15	Piloto
65	9	Copiloto
27	9	Piloto
130	42	Tripulante de Cabina
73	34	Piloto
97	23	Piloto
51	42	Tripulante de Cabina
139	13	Tripulante de Cabina
136	5	Tripulante de Cabina
36	35	Paramedico
69	31	Copiloto
31	33	Tripulante de Cabina
143	18	Tripulante de Cabina
6	30	Paramedico
11	54	Copiloto
53	59	Piloto
32	37	Piloto
49	0	Copiloto
1	43	Paramedico
30	34	Copiloto
5	5	Tripulante de Cabina
143	24	Piloto
49	54	Piloto
61	7	Copiloto
2	37	Copiloto
28	21	Piloto
78	0	Copiloto
87	7	Piloto
71	39	Tripulante de Cabina
101	48	Tripulante de Cabina
114	41	Copiloto
38	13	Tripulante de Cabina
72	0	Copiloto
115	51	Tripulante de Cabina
13	5	Tripulante de Cabina
14	31	Copiloto
104	35	Paramedico
1	56	Tripulante de Cabina
52	28	Tripulante de Cabina
68	37	Copiloto
105	37	Copiloto
136	52	Paramedico
48	23	Copiloto
54	51	Tripulante de Cabina
94	37	Piloto
131	56	Tripulante de Cabina
46	0	Copiloto
60	8	Copiloto
47	34	Piloto
65	59	Piloto
134	32	Paramedico
115	54	Copiloto
41	52	Paramedico
112	30	Paramedico
24	15	Piloto
1	33	Tripulante de Cabina
146	13	Tripulante de Cabina
20	13	Tripulante de Cabina
12	10	Copiloto
83	54	Piloto
34	1	Tripulante de Cabina
87	43	Paramedico
138	5	Tripulante de Cabina
8	49	Paramedico
133	46	Tripulante de Cabina
88	28	Tripulante de Cabina
29	58	Tripulante de Cabina
20	41	Piloto
37	50	Paramedico
48	45	Paramedico
47	47	Paramedico
141	2	Tripulante de Cabina
4	59	Copiloto
148	18	Tripulante de Cabina
97	48	Tripulante de Cabina
42	34	Piloto
34	49	Paramedico
8	25	Copiloto
135	19	Tripulante de Cabina
129	4	Tripulante de Cabina
103	7	Piloto
81	53	Paramedico
97	51	Tripulante de Cabina
109	56	Tripulante de Cabina
5	50	Paramedico
113	54	Copiloto
139	22	Tripulante de Cabina
75	27	Paramedico
134	28	Tripulante de Cabina
109	22	Tripulante de Cabina
2	59	Piloto
55	18	Tripulante de Cabina
76	47	Paramedico
52	45	Paramedico
57	51	Tripulante de Cabina
45	2	Tripulante de Cabina
9	4	Tripulante de Cabina
142	8	Copiloto
70	58	Tripulante de Cabina
74	22	Tripulante de Cabina
138	46	Tripulante de Cabina
41	17	Piloto
11	11	Tripulante de Cabina
39	51	Tripulante de Cabina
122	40	Paramedico
137	46	Tripulante de Cabina
87	58	Tripulante de Cabina
96	2	Tripulante de Cabina
92	45	Paramedico
7	37	Piloto
121	38	Piloto
115	42	Tripulante de Cabina
17	31	Copiloto
82	40	Paramedico
118	17	Piloto
16	31	Copiloto
2	4	Tripulante de Cabina
140	21	Piloto
6	34	Piloto
64	8	Copiloto
108	22	Tripulante de Cabina
128	58	Tripulante de Cabina
135	30	Paramedico
36	56	Tripulante de Cabina
23	0	Copiloto
36	17	Piloto
14	51	Tripulante de Cabina
119	8	Piloto
6	8	Copiloto
106	39	Tripulante de Cabina
59	0	Piloto
51	7	Copiloto
80	58	Tripulante de Cabina
2	2	Tripulante de Cabina
22	40	Paramedico
68	50	Paramedico
19	5	Tripulante de Cabina
140	56	Tripulante de Cabina
7	20	Paramedico
82	37	Piloto
136	56	Tripulante de Cabina
104	41	Copiloto
29	14	Tripulante de Cabina
64	14	Tripulante de Cabina
79	37	Copiloto
119	58	Tripulante de Cabina
84	16	Tripulante de Cabina
130	22	Tripulante de Cabina
121	19	Tripulante de Cabina
30	41	Piloto
119	43	Paramedico
116	0	Copiloto
41	16	Tripulante de Cabina
27	56	Tripulante de Cabina
28	46	Tripulante de Cabina
113	20	Paramedico
46	35	Paramedico
45	49	Paramedico
96	26	Tripulante de Cabina
125	19	Tripulante de Cabina
51	52	Paramedico
10	31	Piloto
118	45	Paramedico
25	41	Piloto
80	12	Tripulante de Cabina
22	51	Tripulante de Cabina
68	2	Tripulante de Cabina
48	4	Tripulante de Cabina
35	37	Piloto
21	1	Tripulante de Cabina
138	51	Tripulante de Cabina
6	1	Tripulante de Cabina
60	42	Tripulante de Cabina
145	32	Paramedico
81	18	Tripulante de Cabina
110	23	Copiloto
18	51	Tripulante de Cabina
40	0	Copiloto
40	7	Piloto
43	46	Tripulante de Cabina
64	38	Piloto
148	32	Paramedico
18	31	Copiloto
122	23	Piloto
115	4	Tripulante de Cabina
26	28	Tripulante de Cabina
67	28	Tripulante de Cabina
50	5	Tripulante de Cabina
99	58	Tripulante de Cabina
57	31	Piloto
53	52	Paramedico
134	11	Tripulante de Cabina
9	12	Tripulante de Cabina
20	20	Paramedico
48	51	Tripulante de Cabina
83	11	Tripulante de Cabina
101	54	Piloto
96	40	Paramedico
34	19	Tripulante de Cabina
15	37	Piloto
48	12	Tripulante de Cabina
24	42	Tripulante de Cabina
23	40	Paramedico
31	35	Paramedico
120	17	Copiloto
49	22	Tripulante de Cabina
82	26	Tripulante de Cabina
138	4	Tripulante de Cabina
74	14	Tripulante de Cabina
69	19	Tripulante de Cabina
95	24	Copiloto
72	13	Tripulante de Cabina
67	37	Copiloto
107	30	Paramedico
34	46	Tripulante de Cabina
75	0	Copiloto
146	32	Paramedico
138	22	Tripulante de Cabina
3	13	Tripulante de Cabina
117	45	Paramedico
128	18	Tripulante de Cabina
130	20	Paramedico
15	35	Paramedico
137	22	Tripulante de Cabina
42	32	Paramedico
100	40	Paramedico
139	46	Tripulante de Cabina
64	30	Paramedico
42	9	Copiloto
0	47	Paramedico
97	39	Tripulante de Cabina
137	2	Tripulante de Cabina
69	16	Tripulante de Cabina
29	33	Tripulante de Cabina
38	22	Tripulante de Cabina
63	24	Copiloto
10	19	Tripulante de Cabina
62	11	Tripulante de Cabina
19	0	Copiloto
29	2	Tripulante de Cabina
127	43	Paramedico
19	27	Paramedico
91	14	Tripulante de Cabina
58	19	Tripulante de Cabina
81	56	Tripulante de Cabina
123	59	Copiloto
140	4	Tripulante de Cabina
108	5	Tripulante de Cabina
4	2	Tripulante de Cabina
56	12	Tripulante de Cabina
55	30	Paramedico
16	50	Paramedico
8	13	Tripulante de Cabina
124	56	Tripulante de Cabina
100	11	Tripulante de Cabina
91	37	Copiloto
68	18	Tripulante de Cabina
128	53	Paramedico
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.usuario (id, nombre, clave, tipo) FROM stdin;
\.


--
-- Data for Name: vuelo; Type: TABLE DATA; Schema: public; Owner: grupo27
--

COPY public.vuelo (id, id_aerolinea, id_origen, id_destino, id_avion, id_ruta, codigo, fecha_salida, fecha_llegada, velocidad, altitud, estado) FROM stdin;
124	7	55	7	1	22	IBE8751	2022-04-18 19:43:00+00	2022-04-18 23:35:00+00	244.76	12429.35	publicado
58	20	29	41	2	149	XLE4796	2022-04-08 02:45:00+00	2022-04-08 15:08:00+00	277.94	11155.8	aceptado
127	1	71	33	1	268	ADC6283	2022-04-21 15:10:00+00	2022-04-21 17:05:00+00	223.44	11784.6	publicado
26	12	29	61	3	100	LAW3477	2022-05-23 19:15:00+00	2022-05-23 19:30:00+00	257.37	12475.23	aceptado
69	6	67	59	2	168	ETA8726	2022-06-25 15:34:00+00	2022-06-25 17:59:00+00	252.12	11714.55	aceptado
13	8	1	53	4	79	KAI2862	2022-05-05 11:22:00+00	2022-05-05 15:36:00+00	257.23	10237.24	pendiente
21	20	43	9	5	93	XLE2673	2022-06-08 17:04:00+00	2022-06-08 23:05:00+00	227.16	10964.27	pendiente
8	8	71	61	6	71	KAI2227	2022-06-06 17:38:00+00	2022-06-07 16:03:00+00	230.26	11532.03	pendiente
130	13	47	5	7	122	LRC9669	2022-04-21 00:18:00+00	2022-04-21 11:38:00+00	278.48	12735.41	publicado
147	19	39	61	8	143	UCA2299	2022-05-17 11:50:00+00	2022-05-17 16:40:00+00	222.01	11860.63	aceptado
19	2	17	1	9	89	AZI2817	2022-05-16 22:10:00+00	2022-05-16 23:14:00+00	246.7	12027.48	pendiente
49	2	43	11	5	137	AZI3471	2022-04-19 15:09:00+00	2022-04-19 16:23:00+00	247.73	12987.08	aceptado
145	19	45	61	8	143	UCA2499	2022-05-19 11:20:00+00	2022-05-19 13:40:00+00	222.01	11860.63	aceptado
72	19	39	9	10	171	UCA2714	2022-06-17 01:45:00+00	2022-06-17 15:20:00+00	262.82	10989.54	aceptado
98	4	39	71	11	213	COG3144	2022-04-21 13:35:00+00	2022-04-22 12:11:00+00	275.75	12577.42	publicado
31	17	39	69	2	53	QAF4555	2022-05-27 00:12:00+00	2022-05-27 14:39:00+00	232.27	12733.02	aceptado
121	14	27	65	3	258	LUD7177	2022-04-19 19:49:00+00	2022-04-19 23:28:00+00	274.05	10323.27	publicado
114	6	5	23	12	243	ETA7128	2022-04-02 07:09:00+00	2022-04-02 13:47:00+00	276.91	10655.87	publicado
79	11	29	9	12	184	LAT6995	2022-04-03 10:52:00+00	2022-04-03 16:22:00+00	269.49	12616.26	aceptado
120	6	41	61	1	186	ETA6742	2022-04-15 09:36:00+00	2022-04-15 17:22:00+00	270.08	12393.83	publicado
77	5	29	57	13	179	EAL8614	2022-05-20 05:57:00+00	2022-05-20 11:15:00+00	247.51	11551.22	aceptado
148	19	39	61	8	143	UCA2199	2022-05-16 10:20:00+00	2022-05-16 15:40:00+00	222.01	11860.63	aceptado
45	14	75	33	14	130	LUD5592	2022-05-26 03:44:00+00	2022-05-26 12:31:00+00	226.71	10440.19	aceptado
113	9	17	41	13	242	KEA7139	2022-04-07 10:27:00+00	2022-04-07 21:54:00+00	227.21	11695.3	publicado
12	6	61	63	15	78	ETA2413	2022-06-03 06:46:00+00	2022-06-03 23:35:00+00	268.92	12082.72	pendiente
55	19	39	61	8	143	UCA2899	2022-05-25 10:44:00+00	2022-05-25 13:24:00+00	222.01	11860.63	aceptado
4	3	49	33	2	66	BTA6594	2022-06-24 13:41:00+00	2022-06-24 17:53:00+00	226.47	11489.8	pendiente
107	19	37	61	2	162	UCA4751	2022-04-30 19:06:00+00	2022-05-01 15:20:00+00	243.37	11981.22	publicado
103	3	57	5	16	235	BTA9626	2022-06-16 00:06:00+00	2022-06-16 15:47:00+00	223.67	11504.47	publicado
134	11	9	65	7	274	LAT4657	2022-04-18 02:42:00+00	2022-04-19 12:45:00+00	227.06	10242.34	publicado
6	14	49	43	4	68	LUD6229	2022-05-16 08:17:00+00	2022-05-17 18:38:00+00	260.53	12751.78	pendiente
93	7	77	71	17	126	IBE4998	2022-06-16 03:31:00+00	2022-06-16 05:19:00+00	252.63	10950.12	borrador
0	10	39	13	18	60	LAM8686	2022-05-08 03:27:00+00	2022-05-08 12:52:00+00	233.23	10291.38	pendiente
94	3	15	1	2	14	BTA4673	2022-04-04 15:19:00+00	2022-04-04 16:37:00+00	264.47	12216.99	borrador
66	10	9	3	12	162	LAM4734	2022-05-22 19:37:00+00	2022-05-23 13:31:00+00	234.66	11336.85	aceptado
43	8	19	73	13	125	KAI8523	2022-05-10 02:00:00+00	2022-05-10 06:42:00+00	265.33	11477.83	aceptado
9	12	1	31	6	72	LAW5896	2022-05-07 18:43:00+00	2022-05-08 22:50:00+00	267.26	12823.47	pendiente
102	14	75	37	19	23	LUD5927	2022-05-23 12:27:00+00	2022-05-23 16:54:00+00	252.73	10327.48	publicado
118	15	33	61	8	115	MPH1782	2022-05-04 19:23:00+00	2022-05-04 20:48:00+00	279.83	12940.19	publicado
138	8	41	61	6	71	KAI2257	2022-06-13 12:00:00+00	2022-06-13 21:00:00+00	230.26	11532.03	aceptado
2	12	65	53	20	62	LAW7561	2022-06-25 01:08:00+00	2022-06-25 12:04:00+00	261.03	11987.63	pendiente
126	17	39	45	1	46	QAF4466	2022-04-15 01:23:00+00	2022-04-15 02:07:00+00	255.46	12397.71	publicado
143	19	41	61	8	143	UCA2699	2022-05-22 10:00:00+00	2022-05-22 13:00:00+00	222.01	11860.63	aceptado
65	3	21	9	19	161	BTA6916	2022-05-26 05:52:00+00	2022-05-26 22:45:00+00	254.85	10601.73	aceptado
84	20	27	57	11	194	XLE4241	2022-05-23 03:22:00+00	2022-05-24 23:37:00+00	267.94	10051.46	aceptado
70	13	65	61	2	80	LRC4224	2022-06-07 11:02:00+00	2022-06-07 14:03:00+00	247.54	11515.87	aceptado
22	16	59	57	8	94	NCY9851	2022-04-14 18:12:00+00	2022-04-14 18:14:00+00	227.19	10310.52	pendiente
7	9	1	75	3	69	KEA7963	2022-06-09 11:37:00+00	2022-06-09 20:32:00+00	239.19	12272.95	pendiente
92	15	77	51	21	208	MPH4719	2022-06-19 08:57:00+00	2022-06-19 16:53:00+00	224.21	11110.31	borrador
18	12	75	45	5	87	LAW7592	2022-04-03 17:01:00+00	2022-04-03 17:05:00+00	275.28	12628.82	pendiente
122	16	71	57	1	261	NCY1133	2022-04-13 01:11:00+00	2022-04-13 21:15:00+00	224.56	12338.48	publicado
68	3	3	51	2	166	BTA8963	2022-05-21 04:36:00+00	2022-05-21 14:18:00+00	247.95	11004.49	aceptado
67	11	37	61	10	163	LAT4157	2022-06-17 23:32:00+00	2022-06-18 23:34:00+00	248.16	10841.19	aceptado
30	14	17	47	20	105	LUD2683	2022-05-14 05:54:00+00	2022-05-15 22:21:00+00	225.6	11955.62	aceptado
15	17	65	43	22	82	QAF8375	2022-06-05 06:12:00+00	2022-06-05 21:27:00+00	256.36	12834.27	pendiente
1	3	39	33	6	45	BTA4764	2022-04-07 13:09:00+00	2022-04-07 21:56:00+00	231.19	12686.21	pendiente
16	12	53	15	21	84	LAW4374	2022-06-01 09:01:00+00	2022-06-01 13:11:00+00	263.96	10516.56	pendiente
78	7	3	67	19	181	IBE9967	2022-05-06 06:22:00+00	2022-05-06 06:45:00+00	249.11	12128.87	aceptado
136	8	71	73	6	71	KAI2237	2022-06-08 17:30:00+00	2022-06-08 20:03:00+00	230.26	11532.03	aceptado
38	8	69	39	9	53	KAI6386	2022-04-29 11:26:00+00	2022-04-29 19:26:00+00	265.53	11756.68	aceptado
90	5	59	31	4	51	EAL9637	2022-05-22 12:12:00+00	2022-05-22 22:41:00+00	223.2	11752.33	borrador
50	14	65	7	1	138	LUD1927	2022-05-13 13:39:00+00	2022-05-13 15:50:00+00	245.97	11542.14	aceptado
119	1	61	13	2	90	ADC8249	2022-05-29 01:26:00+00	2022-05-29 22:55:00+00	260.62	11557.23	publicado
144	19	41	61	23	143	UCA2599	2022-05-21 11:30:00+00	2022-05-22 13:30:00+00	222.01	11860.63	aceptado
101	2	41	61	24	92	AZI6476	2022-04-27 08:57:00+00	2022-04-27 21:25:00+00	239.08	12076.34	publicado
61	1	27	11	4	152	ADC9962	2022-04-03 10:57:00+00	2022-04-03 23:52:00+00	247.2	10020.24	aceptado
54	8	23	43	21	29	KAI2257	2022-04-19 11:18:00+00	2022-04-20 02:37:00+00	277.97	11622.19	aceptado
140	8	5	73	6	71	KAI2457	2022-06-18 11:00:00+00	2022-06-18 15:20:00+00	230.26	11532.03	aceptado
89	4	45	13	25	202	COG2223	2022-05-02 14:17:00+00	2022-05-02 23:52:00+00	241.96	11428.57	rechazado
23	16	11	11	14	95	NCY9589	2022-04-16 07:33:00+00	2022-04-16 19:04:00+00	277.23	12372.54	pendiente
3	9	39	61	13	64	KEA5763	2022-06-19 05:56:00+00	2022-06-20 12:08:00+00	229.24	10586.82	pendiente
105	12	17	1	20	88	LAW6351	2022-04-27 20:26:00+00	2022-04-28 17:11:00+00	266.28	12673.53	publicado
133	8	73	53	7	134	KAI7891	2022-04-15 03:19:00+00	2022-04-15 22:46:00+00	266.59	12980.84	publicado
132	11	17	1	7	88	LAT2175	2022-04-20 02:16:00+00	2022-04-20 10:17:00+00	270.23	11972.5	publicado
52	12	15	13	17	69	LAW4331	2022-06-11 14:59:00+00	2022-06-12 08:52:00+00	275.53	10442.21	aceptado
33	3	35	61	9	107	BTA1165	2022-05-25 21:46:00+00	2022-05-25 23:04:00+00	260.82	12667.2	aceptado
48	12	17	73	22	133	LAW9752	2022-06-01 08:38:00+00	2022-06-01 23:06:00+00	236.16	11420.08	aceptado
64	14	39	37	10	160	LUD9372	2022-05-13 09:46:00+00	2022-05-14 16:00:00+00	258.84	12320.04	aceptado
76	6	23	65	4	42	ETA1424	2022-04-08 08:46:00+00	2022-04-09 20:48:00+00	256.46	12395.69	aceptado
99	18	35	33	13	214	UAN2468	2022-06-18 18:52:00+00	2022-06-18 19:32:00+00	275.29	11794.55	publicado
95	20	57	61	1	209	XLE7933	2022-04-09 23:49:00+00	2022-04-10 00:22:00+00	222.53	12525.91	publicado
39	16	39	15	26	118	NCY3933	2022-05-31 01:37:00+00	2022-05-31 19:41:00+00	230.51	11955.86	aceptado
111	4	77	53	3	240	COG7539	2022-06-06 09:04:00+00	2022-06-07 23:17:00+00	254.09	10601.65	publicado
14	16	37	33	26	80	NCY8756	2022-05-05 05:01:00+00	2022-05-05 15:06:00+00	229.72	11153.88	pendiente
63	9	39	65	21	156	KEA5177	2022-04-24 12:07:00+00	2022-04-24 17:14:00+00	224.73	11346.78	aceptado
44	13	25	23	25	128	LRC7787	2022-04-06 04:03:00+00	2022-04-06 10:10:00+00	227.98	11396.23	aceptado
109	10	15	19	19	238	LAM9554	2022-05-07 09:17:00+00	2022-05-07 17:17:00+00	257.59	12068.46	publicado
74	5	27	73	16	173	EAL6494	2022-06-24 08:27:00+00	2022-06-24 10:34:00+00	271.73	12073.36	aceptado
97	12	27	5	12	211	LAW1134	2022-06-24 17:43:00+00	2022-06-25 13:26:00+00	278.39	10485.24	publicado
112	20	41	61	16	17	XLE5111	2022-04-26 01:45:00+00	2022-04-26 15:20:00+00	239.13	12541.55	publicado
137	8	41	61	6	71	KAI2247	2022-06-09 18:00:00+00	2022-06-09 20:00:00+00	230.26	11532.03	aceptado
128	3	61	69	1	269	BTA8394	2022-04-14 12:54:00+00	2022-04-14 19:34:00+00	257.5	10866.78	publicado
85	20	41	77	2	196	XLE1416	2022-06-17 01:00:00+00	2022-06-17 07:51:00+00	247.28	11607.04	rechazado
115	8	67	39	22	245	KAI3589	2022-04-30 07:57:00+00	2022-05-01 06:27:00+00	247.32	12549.47	publicado
87	1	45	77	3	199	ADC9112	2022-05-18 03:14:00+00	2022-05-18 15:29:00+00	228.45	10089.63	rechazado
20	9	67	19	22	90	KEA2947	2022-06-08 10:59:00+00	2022-06-08 22:34:00+00	228.03	12954.25	pendiente
37	20	17	51	1	114	XLE5463	2022-05-23 05:06:00+00	2022-05-23 16:57:00+00	274.62	10086.16	aceptado
28	8	41	45	20	103	KAI7192	2022-04-24 16:15:00+00	2022-04-25 23:14:00+00	258.11	10837.3	aceptado
131	10	57	9	7	271	LAM9574	2022-04-16 01:25:00+00	2022-04-16 21:11:00+00	231.73	11905.39	publicado
35	12	51	15	11	111	LAW9189	2022-05-19 05:39:00+00	2022-05-19 10:33:00+00	269.74	12279.84	aceptado
75	2	73	53	15	134	AZI8574	2022-05-31 13:04:00+00	2022-05-31 15:19:00+00	256.42	12629.87	aceptado
11	11	53	45	19	75	LAT1186	2022-04-01 06:46:00+00	2022-04-01 07:33:00+00	237.47	11864.77	pendiente
142	19	41	61	8	143	UCA2799	2022-05-24 10:40:00+00	2022-05-24 13:20:00+00	222.01	11860.63	aceptado
25	6	7	55	1	22	ETA5917	2022-04-20 07:54:00+00	2022-04-20 20:55:00+00	253.64	10361.91	aceptado
104	7	41	61	3	137	IBE2338	2022-04-23 10:02:00+00	2022-04-23 13:01:00+00	264.68	11348.28	publicado
34	14	63	17	21	108	LUD7112	2022-04-17 06:50:00+00	2022-04-17 17:22:00+00	233.94	11729.15	aceptado
46	7	15	73	8	131	IBE3388	2022-05-09 00:56:00+00	2022-05-09 01:22:00+00	261.41	10575.2	aceptado
32	4	65	65	13	106	COG7359	2022-04-10 13:03:00+00	2022-04-10 22:23:00+00	236.78	12076.25	aceptado
42	17	5	47	18	123	QAF8273	2022-04-22 06:15:00+00	2022-04-22 08:09:00+00	233.15	11828.08	aceptado
100	11	33	17	24	234	LAT5532	2022-06-16 04:02:00+00	2022-06-17 11:47:00+00	253.27	12078.5	publicado
82	12	61	31	11	191	LAW1451	2022-05-08 08:04:00+00	2022-05-08 12:22:00+00	250.34	10487.64	aceptado
96	12	47	55	4	210	LAW6318	2022-05-09 13:50:00+00	2022-05-09 18:06:00+00	252.86	10347.72	publicado
116	16	47	27	8	246	NCY5615	2022-05-09 04:32:00+00	2022-05-09 07:50:00+00	275.62	10264.03	publicado
40	2	75	69	9	121	AZI6817	2022-05-07 07:09:00+00	2022-05-07 07:47:00+00	270.24	12044.16	aceptado
36	4	55	59	16	113	COG6548	2022-05-26 09:21:00+00	2022-05-26 23:45:00+00	253.66	11079.69	aceptado
56	1	5	35	20	32	ADC3293	2022-06-26 15:10:00+00	2022-06-26 20:27:00+00	222.64	11265.44	aceptado
108	18	57	61	20	208	UAN2881	2022-04-10 15:15:00+00	2022-04-11 09:29:00+00	245.78	10505.68	publicado
141	8	1	73	27	71	KAI2657	2022-06-18 12:00:00+00	2022-06-18 15:10:00+00	230.26	11532.03	aceptado
62	16	49	65	2	153	NCY6746	2022-05-31 05:08:00+00	2022-05-31 12:50:00+00	235.46	11360.17	aceptado
83	11	67	33	22	153	LAT5421	2022-06-06 01:17:00+00	2022-06-06 18:31:00+00	227.11	11060.44	aceptado
47	4	45	51	14	132	COG9963	2022-04-15 00:10:00+00	2022-04-15 03:25:00+00	258.58	10712.04	aceptado
73	4	69	9	10	172	COG6236	2022-04-14 11:02:00+00	2022-04-14 22:44:00+00	240.62	11251.35	aceptado
135	20	43	9	15	122	XLE4859	2022-05-04 10:20:00+00	2022-05-04 20:55:00+00	254.08	11883.87	borrador
71	1	27	31	18	170	ADC4365	2022-04-30 12:29:00+00	2022-05-01 11:19:00+00	251.91	12578.93	aceptado
125	20	75	47	1	264	XLE3285	2022-04-16 03:16:00+00	2022-04-16 03:57:00+00	272.97	12186.59	publicado
117	5	57	19	16	249	EAL8271	2022-05-23 13:45:00+00	2022-05-24 04:53:00+00	247.19	10874.02	publicado
51	8	47	73	22	141	KAI8597	2022-04-04 00:11:00+00	2022-04-04 11:05:00+00	250.11	11101.49	aceptado
24	13	47	65	3	43	LRC4781	2022-05-01 12:06:00+00	2022-05-02 05:30:00+00	274.39	10757.69	pendiente
59	2	11	61	9	151	AZI1524	2022-06-16 00:29:00+00	2022-06-16 18:34:00+00	238.99	11094.91	aceptado
29	3	59	43	28	104	BTA5535	2022-04-03 06:25:00+00	2022-04-03 18:20:00+00	267.77	12212.76	aceptado
106	17	29	11	25	237	QAF6392	2022-05-31 16:00:00+00	2022-05-31 18:42:00+00	271.68	12915.15	publicado
91	3	31	67	22	207	BTA1332	2022-05-15 02:40:00+00	2022-05-15 21:12:00+00	248.27	12396.77	borrador
60	13	29	3	13	100	LRC9582	2022-06-25 12:01:00+00	2022-06-25 18:27:00+00	241.48	10427.25	aceptado
123	5	71	47	1	263	EAL7933	2022-04-21 00:37:00+00	2022-04-21 12:29:00+00	254.06	12048.69	publicado
41	6	21	75	6	122	ETA8691	2022-06-07 18:53:00+00	2022-06-07 19:22:00+00	258.44	12444.08	aceptado
81	3	5	77	25	188	BTA2668	2022-06-02 07:14:00+00	2022-06-02 21:20:00+00	272.9	12079.81	aceptado
10	6	35	53	13	74	ETA6487	2022-06-12 00:52:00+00	2022-06-12 12:39:00+00	224.42	10944.23	pendiente
80	1	61	59	17	123	ADC7913	2022-06-08 05:42:00+00	2022-06-08 05:53:00+00	268.03	12946.48	aceptado
146	19	41	61	8	143	UCA2399	2022-05-18 10:50:00+00	2022-05-18 14:40:00+00	222.01	11860.63	aceptado
53	8	11	9	5	142	KAI9172	2022-05-18 04:16:00+00	2022-05-18 05:46:00+00	265.11	11763.25	aceptado
57	16	71	21	26	148	NCY5888	2022-04-06 06:52:00+00	2022-04-06 14:41:00+00	264.77	12288.05	aceptado
88	11	49	23	27	201	LAT6973	2022-06-20 08:48:00+00	2022-06-20 16:50:00+00	267.47	10085.93	rechazado
110	13	71	71	17	239	LRC4743	2022-04-03 03:32:00+00	2022-04-03 21:58:00+00	224.98	11512.43	publicado
27	3	29	1	13	102	BTA6437	2022-06-16 00:51:00+00	2022-06-16 10:35:00+00	265.61	10730.34	aceptado
5	18	49	71	20	67	UAN5954	2022-05-27 14:57:00+00	2022-05-27 17:59:00+00	235.74	12449.56	pendiente
139	8	11	73	6	71	KAI2357	2022-06-14 10:00:00+00	2022-06-14 15:00:00+00	230.26	11532.03	aceptado
17	16	71	55	15	86	NCY3184	2022-04-02 15:26:00+00	2022-04-03 04:04:00+00	240.8	12907.39	pendiente
129	4	23	13	1	270	COG4299	2022-04-19 04:19:00+00	2022-04-20 06:18:00+00	230.01	11660.58	publicado
86	16	71	49	4	66	NCY4311	2022-05-02 03:59:00+00	2022-05-02 17:29:00+00	240.39	10159.21	rechazado
\.


--
-- Name: aerodromo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.aerodromo_id_seq', 1, false);


--
-- Name: aerolinea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.aerolinea_id_seq', 1, false);


--
-- Name: avion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.avion_id_seq', 1, false);


--
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.pais_id_seq', 1, false);


--
-- Name: ruta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.ruta_id_seq', 1, false);


--
-- Name: trabajador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.trabajador_id_seq', 1, false);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);


--
-- Name: vuelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: grupo27
--

SELECT pg_catalog.setval('public.vuelo_id_seq', 1, false);


--
-- Name: avion Codigo; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT "Codigo" UNIQUE (codigo);


--
-- Name: aerodromo aerodromo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerodromo
    ADD CONSTRAINT aerodromo_pkey PRIMARY KEY (id);


--
-- Name: aerolinea aerolinea_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerolinea
    ADD CONSTRAINT aerolinea_pkey PRIMARY KEY (id);


--
-- Name: avion avion_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT avion_pkey PRIMARY KEY (id);


--
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- Name: aerolinea codigo_aerolinea; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerolinea
    ADD CONSTRAINT codigo_aerolinea UNIQUE (codigo);


--
-- Name: modelo codigo_modelo; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT codigo_modelo UNIQUE (codigo);


--
-- Name: reserva codigo_reserva; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT codigo_reserva UNIQUE (codigo);


--
-- Name: costo costo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.costo
    ADD CONSTRAINT costo_pkey PRIMARY KEY (id_ruta, id_modelo);


--
-- Name: aerodromo iata; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerodromo
    ADD CONSTRAINT iata UNIQUE (iata);


--
-- Name: aerodromo icao; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerodromo
    ADD CONSTRAINT icao UNIQUE (icao);


--
-- Name: licencia licencia_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT licencia_pkey PRIMARY KEY (id);


--
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);


--
-- Name: nombre_modelo nombre_modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.nombre_modelo
    ADD CONSTRAINT nombre_modelo_pkey PRIMARY KEY (id);


--
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- Name: pasajero pasajero_pasaporte; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pasaporte UNIQUE (pasaporte);


--
-- Name: pasajero pasajero_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.pasajero
    ADD CONSTRAINT pasajero_pkey PRIMARY KEY (id);


--
-- Name: trabajador pasaporte_tripulacion; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT pasaporte_tripulacion UNIQUE (pasaporte);


--
-- Name: punto_ruta punto_ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.punto_ruta
    ADD CONSTRAINT punto_ruta_pkey PRIMARY KEY (indice, id_ruta);


--
-- Name: reserva reserva_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT reserva_pkey PRIMARY KEY (id);


--
-- Name: ruta ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ruta
    ADD CONSTRAINT ruta_pkey PRIMARY KEY (id);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (id);


--
-- Name: trabajador_aerolinea trabajador_aerolinea_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador_aerolinea
    ADD CONSTRAINT trabajador_aerolinea_pkey PRIMARY KEY (id_trabajador, id_aerolinea);


--
-- Name: trabajador trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id);


--
-- Name: trabajador_vuelo trabajador_vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador_vuelo
    ADD CONSTRAINT trabajador_vuelo_pkey PRIMARY KEY (id_vuelo, id_trabajador);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: vuelo vuelo_pkey; Type: CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT vuelo_pkey PRIMARY KEY (id);


--
-- Name: reserva_idx_id_reservante; Type: INDEX; Schema: public; Owner: grupo27
--

CREATE INDEX reserva_idx_id_reservante ON public.reserva USING btree (id_reservante);


--
-- Name: ticket_idx_id_reserva; Type: INDEX; Schema: public; Owner: grupo27
--

CREATE INDEX ticket_idx_id_reserva ON public.ticket USING btree (id_reserva);


--
-- Name: trabajador_aerolinea aerolinea_trabajador_aerolinea; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador_aerolinea
    ADD CONSTRAINT aerolinea_trabajador_aerolinea FOREIGN KEY (id_aerolinea) REFERENCES public.aerolinea(id);


--
-- Name: vuelo aerolinea_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT aerolinea_vuelo FOREIGN KEY (id_aerolinea) REFERENCES public.aerolinea(id);


--
-- Name: vuelo avion_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT avion_vuelo FOREIGN KEY (id_avion) REFERENCES public.avion(id);


--
-- Name: aerodromo ciudad_aerodromo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.aerodromo
    ADD CONSTRAINT ciudad_aerodromo FOREIGN KEY (id_ciudad) REFERENCES public.ciudad(id);


--
-- Name: vuelo destino_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT destino_vuelo FOREIGN KEY (id_destino) REFERENCES public.aerodromo(id);


--
-- Name: avion modelo_avion; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.avion
    ADD CONSTRAINT modelo_avion FOREIGN KEY (id_modelo) REFERENCES public.modelo(id);


--
-- Name: costo modelo_costo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.costo
    ADD CONSTRAINT modelo_costo FOREIGN KEY (id_modelo) REFERENCES public.modelo(id);


--
-- Name: modelo nombre_modelo_modelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT nombre_modelo_modelo FOREIGN KEY (id_nombre) REFERENCES public.nombre_modelo(id);


--
-- Name: vuelo origen_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT origen_vuelo FOREIGN KEY (id_origen) REFERENCES public.aerodromo(id);


--
-- Name: ciudad pais_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT pais_ciudad FOREIGN KEY (id_pais) REFERENCES public.pais(id);


--
-- Name: reserva pasajero_reserva; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT pasajero_reserva FOREIGN KEY (id_reservante) REFERENCES public.pasajero(id);


--
-- Name: ticket pasajero_ticket; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT pasajero_ticket FOREIGN KEY (id_pasajero) REFERENCES public.pasajero(id);


--
-- Name: ticket reserva_ticket; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT reserva_ticket FOREIGN KEY (id_reserva) REFERENCES public.reserva(id);


--
-- Name: costo ruta_costo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.costo
    ADD CONSTRAINT ruta_costo FOREIGN KEY (id_ruta) REFERENCES public.ruta(id);


--
-- Name: punto_ruta ruta_punto_ruta; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.punto_ruta
    ADD CONSTRAINT ruta_punto_ruta FOREIGN KEY (id_ruta) REFERENCES public.ruta(id);


--
-- Name: vuelo ruta_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.vuelo
    ADD CONSTRAINT ruta_vuelo FOREIGN KEY (id_ruta) REFERENCES public.ruta(id);


--
-- Name: licencia trabajador_licencia; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT trabajador_licencia FOREIGN KEY (id_piloto) REFERENCES public.trabajador(id);


--
-- Name: trabajador_aerolinea trabajador_trabajador_aerolinea; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador_aerolinea
    ADD CONSTRAINT trabajador_trabajador_aerolinea FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id);


--
-- Name: trabajador_vuelo trabajador_trabajador_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador_vuelo
    ADD CONSTRAINT trabajador_trabajador_vuelo FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id);


--
-- Name: ticket vuelo_ticket; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT vuelo_ticket FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id);


--
-- Name: trabajador_vuelo vuelo_tripulante_vuelo; Type: FK CONSTRAINT; Schema: public; Owner: grupo27
--

ALTER TABLE ONLY public.trabajador_vuelo
    ADD CONSTRAINT vuelo_tripulante_vuelo FOREIGN KEY (id_vuelo) REFERENCES public.vuelo(id);


--
-- PostgreSQL database dump complete
--

