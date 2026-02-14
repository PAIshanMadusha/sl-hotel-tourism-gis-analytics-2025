--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2026-02-15 01:10:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16388)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5935 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 245 (class 1259 OID 17584)
-- Name: boundary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boundary (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,4326),
    "AREA" double precision,
    "PERIMETER" double precision,
    "OUTERB_" integer,
    "OUTERB_ID" integer,
    "OUTB" integer
);


ALTER TABLE public.boundary OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17583)
-- Name: boundary_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boundary_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boundary_id_seq OWNER TO postgres;

--
-- TOC entry 5936 (class 0 OID 0)
-- Dependencies: 244
-- Name: boundary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boundary_id_seq OWNED BY public.boundary.id;


--
-- TOC entry 227 (class 1259 OID 17492)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,5234),
    "AREA" double precision,
    "PERIMETER" double precision,
    "CITIES_" bigint,
    "CITIES_ID" bigint,
    "CODE" integer,
    "NAME" character varying(30)
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17491)
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_id_seq OWNER TO postgres;

--
-- TOC entry 5937 (class 0 OID 0)
-- Dependencies: 226
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- TOC entry 247 (class 1259 OID 17593)
-- Name: contour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contour (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,5234),
    "FNODE_" bigint,
    "TNODE_" bigint,
    "LPOLY_" bigint,
    "RPOLY_" bigint,
    "LENGTH" double precision,
    "CONTOUR_" bigint,
    "CONTOUR_ID" bigint,
    "VALUE" integer
);


ALTER TABLE public.contour OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17592)
-- Name: contour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contour_id_seq OWNER TO postgres;

--
-- TOC entry 5938 (class 0 OID 0)
-- Dependencies: 246
-- Name: contour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contour_id_seq OWNED BY public.contour.id;


--
-- TOC entry 241 (class 1259 OID 17557)
-- Name: divsec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.divsec (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,5234),
    "AREA" numeric,
    "PERIMETER" numeric,
    "DIVSEC_" bigint,
    "DIVSEC_ID" bigint,
    "PROV" character varying(3),
    "DISTRICT" character varying(12),
    "DSAREA" character varying(30),
    "SDCODE" integer,
    "DS" character varying(50)
);


ALTER TABLE public.divsec OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17556)
-- Name: divsec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.divsec_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.divsec_id_seq OWNER TO postgres;

--
-- TOC entry 5939 (class 0 OID 0)
-- Dependencies: 240
-- Name: divsec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.divsec_id_seq OWNED BY public.divsec.id;


--
-- TOC entry 225 (class 1259 OID 17483)
-- Name: forests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forests (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,5234),
    "AREA" double precision,
    "PERIMETER" double precision,
    "FORESTS_" bigint,
    "FORESTS_ID" bigint,
    "CODE" integer,
    "NAME" character varying(30)
);


ALTER TABLE public.forests OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17482)
-- Name: forests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forests_id_seq OWNER TO postgres;

--
-- TOC entry 5940 (class 0 OID 0)
-- Dependencies: 224
-- Name: forests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forests_id_seq OWNED BY public.forests.id;


--
-- TOC entry 229 (class 1259 OID 17501)
-- Name: lagoons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lagoons (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,5234),
    "AREA" double precision,
    "PERIMETER" double precision,
    "LAGOON_" bigint,
    "LAGOON_ID" bigint,
    "CODE" integer,
    "NAME" character varying(20)
);


ALTER TABLE public.lagoons OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17500)
-- Name: lagoons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lagoons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lagoons_id_seq OWNER TO postgres;

--
-- TOC entry 5941 (class 0 OID 0)
-- Dependencies: 228
-- Name: lagoons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lagoons_id_seq OWNED BY public.lagoons.id;


--
-- TOC entry 235 (class 1259 OID 17528)
-- Name: peaks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peaks (
    id integer NOT NULL,
    geom public.geometry(Point,5234),
    "AREA" double precision,
    "PERIMETER" double precision,
    "PEAKS_" bigint,
    "PEAKS_ID" bigint,
    "NAME" character varying(20),
    "ALTITUDE" integer
);


ALTER TABLE public.peaks OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17527)
-- Name: peaks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peaks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peaks_id_seq OWNER TO postgres;

--
-- TOC entry 5942 (class 0 OID 0)
-- Dependencies: 234
-- Name: peaks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peaks_id_seq OWNED BY public.peaks.id;


--
-- TOC entry 233 (class 1259 OID 17519)
-- Name: railway; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.railway (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,5234),
    "FNODE_" bigint,
    "TNODE_" bigint,
    "LPOLY_" bigint,
    "RPOLY_" bigint,
    "LENGTH" double precision,
    "RAILWAY_" bigint,
    "RAILWAY_ID" bigint
);


ALTER TABLE public.railway OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17518)
-- Name: railway_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.railway_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.railway_id_seq OWNER TO postgres;

--
-- TOC entry 5943 (class 0 OID 0)
-- Dependencies: 232
-- Name: railway_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.railway_id_seq OWNED BY public.railway.id;


--
-- TOC entry 231 (class 1259 OID 17510)
-- Name: roads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roads (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,5234),
    "FNODE_" integer,
    "TNODE_" integer,
    "LPOLY_" integer,
    "RPOLY_" integer,
    "LENGTH" double precision,
    "ROADS_" integer,
    "ROADS_ID" integer,
    "CODE" integer,
    "CLASS" character varying(4),
    "Descrip" character varying(50)
);


ALTER TABLE public.roads OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17509)
-- Name: roads_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roads_id_seq OWNER TO postgres;

--
-- TOC entry 5944 (class 0 OID 0)
-- Dependencies: 230
-- Name: roads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roads_id_seq OWNED BY public.roads.id;


--
-- TOC entry 239 (class 1259 OID 17547)
-- Name: streams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.streams (
    id integer NOT NULL,
    geom public.geometry(MultiLineString,5234),
    "FNODE_" bigint,
    "TNODE_" bigint,
    "LPOLY_" bigint,
    "RPOLY_" bigint,
    "LENGTH" double precision,
    "STNET_" bigint,
    "STNET_ID" bigint,
    "ST_NET2_" bigint,
    "ST_NET2_ID" bigint,
    "CODE" integer,
    "NAME" character varying(25)
);


ALTER TABLE public.streams OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17546)
-- Name: streams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.streams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.streams_id_seq OWNER TO postgres;

--
-- TOC entry 5945 (class 0 OID 0)
-- Dependencies: 238
-- Name: streams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.streams_id_seq OWNED BY public.streams.id;


--
-- TOC entry 237 (class 1259 OID 17538)
-- Name: tanks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tanks (
    id integer NOT NULL,
    geom public.geometry(MultiPolygon,5234),
    "AREA" double precision,
    "PERIMETER" double precision,
    "TANK_" bigint,
    "TANK_ID" bigint,
    "CODE" integer,
    "NAME" character varying(25)
);


ALTER TABLE public.tanks OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17537)
-- Name: tanks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tanks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tanks_id_seq OWNER TO postgres;

--
-- TOC entry 5946 (class 0 OID 0)
-- Dependencies: 236
-- Name: tanks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tanks_id_seq OWNED BY public.tanks.id;


--
-- TOC entry 223 (class 1259 OID 17475)
-- Name: tourism_development_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tourism_development_zones (
    id character varying NOT NULL,
    geom public.geometry(PointZ,4326),
    "Name" character varying,
    description character varying,
    "timestamp" timestamp without time zone,
    begin timestamp without time zone,
    "end" timestamp without time zone,
    "altitudeMode" character varying,
    tessellate integer,
    extrude integer,
    visibility integer,
    "drawOrder" integer,
    icon character varying
);


ALTER TABLE public.tourism_development_zones OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 17566)
-- Name: villname; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villname (
    id integer NOT NULL,
    geom public.geometry(Point,5234),
    "AREA" double precision,
    "PERIMETER" double precision,
    "VILLNAME_" bigint,
    "VILLNAME_I" bigint,
    "PLACE_FN_" bigint,
    "PLACE_FN_I" bigint,
    "CODE" integer,
    "TOWN" character varying(25),
    "NAME" character varying(25)
);


ALTER TABLE public.villname OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17565)
-- Name: villname_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villname_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.villname_id_seq OWNER TO postgres;

--
-- TOC entry 5947 (class 0 OID 0)
-- Dependencies: 242
-- Name: villname_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villname_id_seq OWNED BY public.villname.id;


--
-- TOC entry 5724 (class 2604 OID 17587)
-- Name: boundary id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boundary ALTER COLUMN id SET DEFAULT nextval('public.boundary_id_seq'::regclass);


--
-- TOC entry 5715 (class 2604 OID 17495)
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- TOC entry 5725 (class 2604 OID 17596)
-- Name: contour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contour ALTER COLUMN id SET DEFAULT nextval('public.contour_id_seq'::regclass);


--
-- TOC entry 5722 (class 2604 OID 17560)
-- Name: divsec id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divsec ALTER COLUMN id SET DEFAULT nextval('public.divsec_id_seq'::regclass);


--
-- TOC entry 5714 (class 2604 OID 17486)
-- Name: forests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forests ALTER COLUMN id SET DEFAULT nextval('public.forests_id_seq'::regclass);


--
-- TOC entry 5716 (class 2604 OID 17504)
-- Name: lagoons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lagoons ALTER COLUMN id SET DEFAULT nextval('public.lagoons_id_seq'::regclass);


--
-- TOC entry 5719 (class 2604 OID 17531)
-- Name: peaks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peaks ALTER COLUMN id SET DEFAULT nextval('public.peaks_id_seq'::regclass);


--
-- TOC entry 5718 (class 2604 OID 17522)
-- Name: railway id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway ALTER COLUMN id SET DEFAULT nextval('public.railway_id_seq'::regclass);


--
-- TOC entry 5717 (class 2604 OID 17513)
-- Name: roads id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roads ALTER COLUMN id SET DEFAULT nextval('public.roads_id_seq'::regclass);


--
-- TOC entry 5721 (class 2604 OID 17550)
-- Name: streams id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streams ALTER COLUMN id SET DEFAULT nextval('public.streams_id_seq'::regclass);


--
-- TOC entry 5720 (class 2604 OID 17541)
-- Name: tanks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks ALTER COLUMN id SET DEFAULT nextval('public.tanks_id_seq'::regclass);


--
-- TOC entry 5723 (class 2604 OID 17569)
-- Name: villname id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villname ALTER COLUMN id SET DEFAULT nextval('public.villname_id_seq'::regclass);


--
-- TOC entry 5927 (class 0 OID 17584)
-- Dependencies: 245
-- Data for Name: boundary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boundary (id, geom, "AREA", "PERIMETER", "OUTERB_", "OUTERB_ID", "OUTB") FROM stdin;
\.


--
-- TOC entry 5909 (class 0 OID 17492)
-- Dependencies: 227
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (id, geom, "AREA", "PERIMETER", "CITIES_", "CITIES_ID", "CODE", "NAME") FROM stdin;
\.


--
-- TOC entry 5929 (class 0 OID 17593)
-- Dependencies: 247
-- Data for Name: contour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contour (id, geom, "FNODE_", "TNODE_", "LPOLY_", "RPOLY_", "LENGTH", "CONTOUR_", "CONTOUR_ID", "VALUE") FROM stdin;
\.


--
-- TOC entry 5923 (class 0 OID 17557)
-- Dependencies: 241
-- Data for Name: divsec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.divsec (id, geom, "AREA", "PERIMETER", "DIVSEC_", "DIVSEC_ID", "PROV", "DISTRICT", "DSAREA", "SDCODE", "DS") FROM stdin;
\.


--
-- TOC entry 5907 (class 0 OID 17483)
-- Dependencies: 225
-- Data for Name: forests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forests (id, geom, "AREA", "PERIMETER", "FORESTS_", "FORESTS_ID", "CODE", "NAME") FROM stdin;
\.


--
-- TOC entry 5911 (class 0 OID 17501)
-- Dependencies: 229
-- Data for Name: lagoons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lagoons (id, geom, "AREA", "PERIMETER", "LAGOON_", "LAGOON_ID", "CODE", "NAME") FROM stdin;
\.


--
-- TOC entry 5917 (class 0 OID 17528)
-- Dependencies: 235
-- Data for Name: peaks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peaks (id, geom, "AREA", "PERIMETER", "PEAKS_", "PEAKS_ID", "NAME", "ALTITUDE") FROM stdin;
\.


--
-- TOC entry 5915 (class 0 OID 17519)
-- Dependencies: 233
-- Data for Name: railway; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.railway (id, geom, "FNODE_", "TNODE_", "LPOLY_", "RPOLY_", "LENGTH", "RAILWAY_", "RAILWAY_ID") FROM stdin;
\.


--
-- TOC entry 5913 (class 0 OID 17510)
-- Dependencies: 231
-- Data for Name: roads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roads (id, geom, "FNODE_", "TNODE_", "LPOLY_", "RPOLY_", "LENGTH", "ROADS_", "ROADS_ID", "CODE", "CLASS", "Descrip") FROM stdin;
\.


--
-- TOC entry 5713 (class 0 OID 16707)
-- Dependencies: 219
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5921 (class 0 OID 17547)
-- Dependencies: 239
-- Data for Name: streams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.streams (id, geom, "FNODE_", "TNODE_", "LPOLY_", "RPOLY_", "LENGTH", "STNET_", "STNET_ID", "ST_NET2_", "ST_NET2_ID", "CODE", "NAME") FROM stdin;
\.


--
-- TOC entry 5919 (class 0 OID 17538)
-- Dependencies: 237
-- Data for Name: tanks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tanks (id, geom, "AREA", "PERIMETER", "TANK_", "TANK_ID", "CODE", "NAME") FROM stdin;
\.


--
-- TOC entry 5905 (class 0 OID 17475)
-- Dependencies: 223
-- Data for Name: tourism_development_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tourism_development_zones (id, geom, "Name", description, "timestamp", begin, "end", "altitudeMode", tessellate, extrude, visibility, "drawOrder", icon) FROM stdin;
0908DDB6C03D91C18763	01010000A0E61000002A424611D20D54404D943C7DE51F18400000000000000000	Southern Coastal Tourism Zone	<div>District: Galle<br></div><div>Zone Type: Coastal Tourism Development Zone<br></div>	\N	\N	\N	\N	-1	0	-1	\N	\N
02FF0A6CFD3D91CDD5BF	01010000A0E610000069536E53BF4D54402440628A932C21400040F7D936F1313F	Eastern Coastal Tourism Zone	<div>District:&nbsp;Trincomalee<br></div><div>Zone Type: Coastal Tourism Development Zone<br></div>	\N	\N	\N	\N	-1	0	-1	\N	\N
0A7F1C8BCA3D91CFCD57	01010000A0E61000000834BACA1FF75340CAF2F1DA9AB51B400000000000000000	Western Tourism Hub	<div>District:&nbsp;Colombo<br></div><div>Zone Type: Coastal/Urban Tourism Development Zone<br></div><div><br></div>	\N	\N	\N	\N	-1	0	-1	\N	\N
0CA2E559F23D91D1FE36	01010000A0E6100000CC97E29045315440B638640BC4D81B400000000000000000	Hill Country Tourism Zone	<div>District: Nuwara Eliya<br></div><div>Zone Type:&nbsp; Hill Tourism Development Zone<br></div><div><br></div>	\N	\N	\N	\N	-1	0	-1	\N	\N
08AEB855C73D91DAD1FE	01010000A0E610000049762DE8D619544076C52F0A559F20400000000000000000	Cultural Triangle Tourism Zone	<div>District: Anuradhapura<br></div><div>Zone Type: Cultural Tourism Development Zone<br></div>	\N	\N	\N	\N	-1	0	-1	\N	\N
0108ED555B3D91DDD9AC	01010000A0E61000000FA03B9AB1005440304D5FD9DD52234000204DEA7569343F	Northern Tourism Zone	<div>District: Jaffna<br></div><div>Zone Type: Heritage Tourism Development Zone<br></div>	\N	\N	\N	\N	-1	0	-1	\N	\N
\.


--
-- TOC entry 5925 (class 0 OID 17566)
-- Dependencies: 243
-- Data for Name: villname; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villname (id, geom, "AREA", "PERIMETER", "VILLNAME_", "VILLNAME_I", "PLACE_FN_", "PLACE_FN_I", "CODE", "TOWN", "NAME") FROM stdin;
\.


--
-- TOC entry 5948 (class 0 OID 0)
-- Dependencies: 244
-- Name: boundary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boundary_id_seq', 1, false);


--
-- TOC entry 5949 (class 0 OID 0)
-- Dependencies: 226
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_id_seq', 1, false);


--
-- TOC entry 5950 (class 0 OID 0)
-- Dependencies: 246
-- Name: contour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contour_id_seq', 1, false);


--
-- TOC entry 5951 (class 0 OID 0)
-- Dependencies: 240
-- Name: divsec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.divsec_id_seq', 1, false);


--
-- TOC entry 5952 (class 0 OID 0)
-- Dependencies: 224
-- Name: forests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forests_id_seq', 1, false);


--
-- TOC entry 5953 (class 0 OID 0)
-- Dependencies: 228
-- Name: lagoons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lagoons_id_seq', 1, false);


--
-- TOC entry 5954 (class 0 OID 0)
-- Dependencies: 234
-- Name: peaks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peaks_id_seq', 1, false);


--
-- TOC entry 5955 (class 0 OID 0)
-- Dependencies: 232
-- Name: railway_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.railway_id_seq', 1, false);


--
-- TOC entry 5956 (class 0 OID 0)
-- Dependencies: 230
-- Name: roads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roads_id_seq', 1, false);


--
-- TOC entry 5957 (class 0 OID 0)
-- Dependencies: 238
-- Name: streams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.streams_id_seq', 1, false);


--
-- TOC entry 5958 (class 0 OID 0)
-- Dependencies: 236
-- Name: tanks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tanks_id_seq', 1, false);


--
-- TOC entry 5959 (class 0 OID 0)
-- Dependencies: 242
-- Name: villname_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villname_id_seq', 1, false);


--
-- TOC entry 5730 (class 2606 OID 17481)
-- Name: tourism_development_zones SL_Tourism_Development_Zones_2025_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tourism_development_zones
    ADD CONSTRAINT "SL_Tourism_Development_Zones_2025_pkey" PRIMARY KEY (id);


--
-- TOC entry 5752 (class 2606 OID 17589)
-- Name: boundary boundary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boundary
    ADD CONSTRAINT boundary_pkey PRIMARY KEY (id);


--
-- TOC entry 5734 (class 2606 OID 17497)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 5754 (class 2606 OID 17598)
-- Name: contour contour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contour
    ADD CONSTRAINT contour_pkey PRIMARY KEY (id);


--
-- TOC entry 5748 (class 2606 OID 17562)
-- Name: divsec divsec_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.divsec
    ADD CONSTRAINT divsec_pkey PRIMARY KEY (id);


--
-- TOC entry 5732 (class 2606 OID 17488)
-- Name: forests forests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forests
    ADD CONSTRAINT forests_pkey PRIMARY KEY (id);


--
-- TOC entry 5736 (class 2606 OID 17506)
-- Name: lagoons lagoons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lagoons
    ADD CONSTRAINT lagoons_pkey PRIMARY KEY (id);


--
-- TOC entry 5742 (class 2606 OID 17533)
-- Name: peaks peaks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peaks
    ADD CONSTRAINT peaks_pkey PRIMARY KEY (id);


--
-- TOC entry 5740 (class 2606 OID 17524)
-- Name: railway railway_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.railway
    ADD CONSTRAINT railway_pkey PRIMARY KEY (id);


--
-- TOC entry 5738 (class 2606 OID 17515)
-- Name: roads roads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roads
    ADD CONSTRAINT roads_pkey PRIMARY KEY (id);


--
-- TOC entry 5746 (class 2606 OID 17552)
-- Name: streams streams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.streams
    ADD CONSTRAINT streams_pkey PRIMARY KEY (id);


--
-- TOC entry 5744 (class 2606 OID 17543)
-- Name: tanks tanks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tanks
    ADD CONSTRAINT tanks_pkey PRIMARY KEY (id);


--
-- TOC entry 5750 (class 2606 OID 17571)
-- Name: villname villname_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villname
    ADD CONSTRAINT villname_pkey PRIMARY KEY (id);


-- Completed on 2026-02-15 01:10:31

--
-- PostgreSQL database dump complete
--

