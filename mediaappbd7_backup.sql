--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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
-- Name: fn_listarresumen(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_listarresumen() RETURNS TABLE(cantidad integer, fecha text)
    LANGUAGE plpgsql
    AS $$
		DECLARE
			var_r record;
		BEGIN
		FOR var_r IN(
			select (count(*)::int) as cantidad, to_char(c.fecha, 'dd/MM/yyyy') as fecha from consulta c
				group by to_char(c.fecha, 'dd/MM/yyyy') order by to_char(c.fecha, 'dd/MM/yyyy') asc
		)
		LOOP
			cantidad := var_r.cantidad;
			fecha := var_r.fecha;
			RETURN NEXT;
		END LOOP;
	END; $$;


ALTER FUNCTION public.fn_listarresumen() OWNER TO postgres;

--
-- Name: fn_sequence(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_sequence(paciente integer) RETURNS TABLE(ultimo_r integer)
    LANGUAGE plpgsql
    AS $$
		declare var_r record;		
		BEGIN
			IF ( select max(id_signos) as ultimo from signos where id_paciente = paciente ) IS NOT null
			THEN
			 FOR var_r IN ( select max(id_signos) as ultimo from signos where id_paciente = paciente )
			   loop
				  ultimo_r := var_r.ultimo;
				  return next;
			   end loop;
			ELSE
			 FOR var_r IN (SELECT 0 as aultimo)
			     loop
				ultimo_r := 1;
				return next;
			     end loop;
			END IF;
	       
	END; 
	$$;


ALTER FUNCTION public.fn_sequence(paciente integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: archivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archivo (
    id_archivo integer NOT NULL,
    filename character varying(50),
    filetype character varying(15),
    contenido bytea
);


ALTER TABLE public.archivo OWNER TO postgres;

--
-- Name: archivo_id_archivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archivo_id_archivo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivo_id_archivo_seq OWNER TO postgres;

--
-- Name: archivo_id_archivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archivo_id_archivo_seq OWNED BY public.archivo.id_archivo;


--
-- Name: consulta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta (
    id_consulta integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    num_consultorio character varying(3),
    id_especialidad integer NOT NULL,
    id_medico integer NOT NULL,
    id_paciente integer NOT NULL
);


ALTER TABLE public.consulta OWNER TO postgres;

--
-- Name: consulta_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta_examen (
    id_consulta integer NOT NULL,
    id_examen integer NOT NULL
);


ALTER TABLE public.consulta_examen OWNER TO postgres;

--
-- Name: consulta_id_consulta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consulta_id_consulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consulta_id_consulta_seq OWNER TO postgres;

--
-- Name: consulta_id_consulta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consulta_id_consulta_seq OWNED BY public.consulta.id_consulta;


--
-- Name: detalle_consulta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_consulta (
    id_detalle integer NOT NULL,
    diagnostico character varying(70) NOT NULL,
    tratamiento character varying(300) NOT NULL,
    id_consulta integer NOT NULL
);


ALTER TABLE public.detalle_consulta OWNER TO postgres;

--
-- Name: detalle_consulta_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalle_consulta_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalle_consulta_id_detalle_seq OWNER TO postgres;

--
-- Name: detalle_consulta_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalle_consulta_id_detalle_seq OWNED BY public.detalle_consulta.id_detalle;


--
-- Name: especialidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especialidad (
    id_especialidad integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.especialidad OWNER TO postgres;

--
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especialidad_id_especialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especialidad_id_especialidad_seq OWNER TO postgres;

--
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especialidad_id_especialidad_seq OWNED BY public.especialidad.id_especialidad;


--
-- Name: examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.examen (
    id_examen integer NOT NULL,
    descripcion character varying(150),
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.examen OWNER TO postgres;

--
-- Name: examen_id_examen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.examen_id_examen_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.examen_id_examen_seq OWNER TO postgres;

--
-- Name: examen_id_examen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.examen_id_examen_seq OWNED BY public.examen.id_examen;


--
-- Name: medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medico (
    id_medico integer NOT NULL,
    cmp character varying(12) NOT NULL,
    apellidos character varying(70) NOT NULL,
    foto_url character varying(255),
    nombres character varying(70) NOT NULL
);


ALTER TABLE public.medico OWNER TO postgres;

--
-- Name: medico_id_medico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medico_id_medico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medico_id_medico_seq OWNER TO postgres;

--
-- Name: medico_id_medico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medico_id_medico_seq OWNED BY public.medico.id_medico;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id_menu integer NOT NULL,
    icono character varying(50),
    nombre character varying(50),
    url character varying(50)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_rol (
    id_menu integer NOT NULL,
    id_rol integer NOT NULL
);


ALTER TABLE public.menu_rol OWNER TO postgres;

--
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_token (
    token_id character varying(256),
    token bytea,
    authentication_id character varying(256),
    user_name character varying(256),
    client_id character varying(256),
    authentication bytea,
    refresh_token character varying(256)
);


ALTER TABLE public.oauth_access_token OWNER TO postgres;

--
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_token (
    token_id character varying(256),
    token bytea,
    authentication bytea
);


ALTER TABLE public.oauth_refresh_token OWNER TO postgres;

--
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    id_paciente integer NOT NULL,
    apellidos character varying(70) NOT NULL,
    direccion character varying(150),
    dni character varying(8) NOT NULL,
    email character varying(55),
    nombres character varying(70) NOT NULL,
    telefono character varying(9)
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paciente_id_paciente_seq OWNER TO postgres;

--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paciente_id_paciente_seq OWNED BY public.paciente.id_paciente;


--
-- Name: reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reset_token (
    id integer NOT NULL,
    expiracion timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.reset_token OWNER TO postgres;

--
-- Name: reset_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reset_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reset_token_id_seq OWNER TO postgres;

--
-- Name: reset_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reset_token_id_seq OWNED BY public.reset_token.id;


--
-- Name: resettoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resettoken (
    id integer NOT NULL,
    expiracion timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.resettoken OWNER TO postgres;

--
-- Name: resettoken_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resettoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resettoken_id_seq OWNER TO postgres;

--
-- Name: resettoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resettoken_id_seq OWNED BY public.resettoken.id;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol integer NOT NULL,
    descripcion character varying(255),
    nombre character varying(255)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: signos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.signos (
    id_signos integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    pulso character varying(3) NOT NULL,
    ritmo character varying(3) NOT NULL,
    temperatura character varying(2) NOT NULL,
    id_paciente integer NOT NULL
);


ALTER TABLE public.signos OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    estado boolean NOT NULL,
    clave character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_rol (
    id_usuario integer NOT NULL,
    id_rol integer NOT NULL
);


ALTER TABLE public.usuario_rol OWNER TO postgres;

--
-- Name: archivo id_archivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivo ALTER COLUMN id_archivo SET DEFAULT nextval('public.archivo_id_archivo_seq'::regclass);


--
-- Name: consulta id_consulta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta ALTER COLUMN id_consulta SET DEFAULT nextval('public.consulta_id_consulta_seq'::regclass);


--
-- Name: detalle_consulta id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_consulta ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_consulta_id_detalle_seq'::regclass);


--
-- Name: especialidad id_especialidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad ALTER COLUMN id_especialidad SET DEFAULT nextval('public.especialidad_id_especialidad_seq'::regclass);


--
-- Name: examen id_examen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examen ALTER COLUMN id_examen SET DEFAULT nextval('public.examen_id_examen_seq'::regclass);


--
-- Name: medico id_medico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico ALTER COLUMN id_medico SET DEFAULT nextval('public.medico_id_medico_seq'::regclass);


--
-- Name: paciente id_paciente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('public.paciente_id_paciente_seq'::regclass);


--
-- Name: reset_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token ALTER COLUMN id SET DEFAULT nextval('public.reset_token_id_seq'::regclass);


--
-- Name: resettoken id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resettoken ALTER COLUMN id SET DEFAULT nextval('public.resettoken_id_seq'::regclass);


--
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archivo (id_archivo, filename, filetype, contenido) FROM stdin;
1	IMG_0525.JPG	image/jpeg	\N
2	Lavadora Lg.txt	text/plain	\N
\.


--
-- Data for Name: consulta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consulta (id_consulta, fecha, num_consultorio, id_especialidad, id_medico, id_paciente) FROM stdin;
1	2022-07-01 02:04:07	C1	1	3	1
2	2022-07-01 21:26:25	C4	1	3	2
3	2022-07-02 08:48:58	C1	2	9	3
4	2022-07-02 09:00:27	C1	1	3	4
5	2022-07-02 12:26:01	C1	2	7	5
\.


--
-- Data for Name: consulta_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consulta_examen (id_consulta, id_examen) FROM stdin;
1	1
2	2
3	2
4	1
5	1
\.


--
-- Data for Name: detalle_consulta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle_consulta (id_detalle, diagnostico, tratamiento, id_consulta) FROM stdin;
1	Alcoholismo	Anexo	1
2	cirrosis	anexo	2
3	Inflamacion en la prostata	Postaliv	3
4	Tarado	Tratamiento Psicologico	4
5	Ernia	Operar	5
\.


--
-- Data for Name: especialidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especialidad (id_especialidad, descripcion, nombre) FROM stdin;
1	NEUROLOGIA	ENFERMEDADES DEL CEREBRO
2	CARDIOLOGIA	ENFERMEDADES DEL CORAZON
\.


--
-- Data for Name: examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.examen (id_examen, descripcion, nombre) FROM stdin;
1	CON CONTRASTE	RAYOS X 
2	DE 27 ELEMTOS	SANGRE
\.


--
-- Data for Name: medico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medico (id_medico, cmp, apellidos, foto_url, nombres) FROM stdin;
3	123456788	laure	https://www.eluniverso.com/resizer/B1PGGb6MaTVzQstULdDgzl-zxdY=/994x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/AQL7EUBHGRAJJGBWOBMECISNMY.jpg	House
4	1234567	Diaz Mamacita	https://ktarsis.files.wordpress.com/2009/09/ktjennifermorrisonpic.jpg?w=584	Cameron
2	123456789	Gomez Bolaños Chess	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJ144IwL_b5kc5KxH76CMMLwmFD6bXBKzXDg&usqp=CAU	Chapatin
7	192837465	DR	https://www.yotambien.mx/wp-content/uploads/2022/01/Doctor-Octopus-yotambienmx.jpg	Octopus
5	1234767	Ranch	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScaINnsTQrsaszxJqZfCR6YllVMxRwkOqMSQ&usqp=CAU	Quinn
8	198273645	Ratodimy	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTj8q6atBf9nTbitJms0W7cbpik7q9r4TqTQ&usqp=CAU	Franchesca
1	123456789132	Stanger	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAYqq_jrUQ8T_-Bpilgr3TLPIj2-Xn5JcYJA&usqp=CAU	Stranger
9	101010101010	Cano Segura	c:/users/mcs/pictures/mcs.png	Martin
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id_menu, icono, nombre, url) FROM stdin;
1	search	Buscar	/buscar
2	insert_drive_file	Registrar	/consulta
3	insert_drive_file	Registrar E.	/consulta-especial
4	view_carousel	Registrar W.	/consulta-wizard
5	star_rate	Especialiades	/especialidad
6	healing	Médicos	/medico
7	assignment	Examenes	/examen
9	assessment	Reportes	/reporte
8	accessibility	Pacientes	/paciente
\.


--
-- Data for Name: menu_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_rol (id_menu, id_rol) FROM stdin;
1	1
3	1
4	1
5	1
6	1
7	1
9	1
3	2
4	2
5	2
6	2
2	1
8	1
8	2
\.


--
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
3cbe5b04adaa3f78055615afb37055cd	\\xaced0005737200436f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f4175746832416363657373546f6b656e0cb29e361b24face0200064c00156164646974696f6e616c496e666f726d6174696f6e74000f4c6a6176612f7574696c2f4d61703b4c000a65787069726174696f6e7400104c6a6176612f7574696c2f446174653b4c000c72656672657368546f6b656e74003f4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f636f6d6d6f6e2f4f417574683252656672657368546f6b656e3b4c000573636f706574000f4c6a6176612f7574696c2f5365743b4c0009746f6b656e547970657400124c6a6176612f6c616e672f537472696e673b4c000576616c756571007e00057870737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f72646572787200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c770800000010000000017400036a746974002431623337383431382d393039322d343135382d393264362d38376339323034666437323978007372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000182a6af3f7e78737200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c756571007e0005787074019465794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736962576c3062334a6c63323931636d4e6c615751695853776964584e6c636c39755957316c496a6f695932687062476c7563334e7265554235595768766279356a62323075625867694c434a7a593239775a53493657794a795a57466b4969776964334a70644755695853776959585270496a6f694d57497a4e7a67304d5467744f5441354d6930304d5455344c546b795a4459744f44646a4f5449774e475a6b4e7a4935496977695958563061473979615852705a584d694f6c736956564e4655694973496b524351534973496b464554556c4f496c3073496d703061534936496d526d4f47497a5a4456694c544a6c5a6a41744e4467774e7930354e544e6a4c5441315a4449334f575a6d4f44426a4f434973496d4e7361575675644639705a434936496d3170644739745a57527059584277496e302e446653566d7a447949576550327461476952312d7169744930625f684947697731356a6a4b4d547437504d737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c0001637400164c6a6176612f7574696c2f436f6c6c656374696f6e3b7870737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000043f400000000000027400047265616474000577726974657874000662656172657274016f65794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736962576c3062334a6c63323931636d4e6c615751695853776964584e6c636c39755957316c496a6f695932687062476c7563334e7265554235595768766279356a62323075625867694c434a7a593239775a53493657794a795a57466b4969776964334a7064475569585377695a586877496a6f784e6a59774e6a557a4f4463354c434a686458526f62334a7064476c6c6379493657794a56553056534969776952454a42496977695155524e5355346958537769616e5270496a6f694d57497a4e7a67304d5467744f5441354d6930304d5455344c546b795a4459744f44646a4f5449774e475a6b4e7a493549697769593278705a57353058326c6b496a6f6962576c306232316c5a476c686348416966512e475f386568317137363339363159434876584c724f6730317a465434705956685a6d59653457377a346d4d	d69c4d2539ce95def0be008e9e2feb32	chilinssky@yahoo.com.mx	mitomediapp	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000003770400000003737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000002120200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000541444d494e7371007e000d7400034442417371007e000d740004555345527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0018787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00164c000573636f706571007e0018787074000b6d69746f6d656469617070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00167870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000037708000000040000000274000a6772616e745f7479706574000870617373776f7264740008757365726e616d657400176368696c696e73736b79407961686f6f2e636f6d2e6d7878737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e0027770c000000103f40000000000000787371007e001e3f40000000000000770800000010000000007870707371007e0027770c000000103f4000000000000174000e6d69746f7265736f757263656964787371007e0027770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000002120200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000377040000000371007e000f71007e001171007e00137871007e0033737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001e3f400000000000067708000000080000000271007e002071007e002171007e002271007e0023780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000002120200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00184c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e0024737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000212020000787077040000000371007e000f71007e001171007e001378707400176368696c696e73736b79407961686f6f2e636f6d2e6d78	c460f18eade133d895d3921770a1df12
\.


--
-- Data for Name: oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_refresh_token (token_id, token, authentication) FROM stdin;
c460f18eade133d895d3921770a1df12	\\xaced0005737200446f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e636f6d6d6f6e2e44656661756c744f417574683252656672657368546f6b656e73e10e0a6354d45e0200014c000576616c75657400124c6a6176612f6c616e672f537472696e673b787074019465794a68624763694f694a49557a49314e694973496e523563434936496b705856434a392e65794a68645751694f6c736962576c3062334a6c63323931636d4e6c615751695853776964584e6c636c39755957316c496a6f695932687062476c7563334e7265554235595768766279356a62323075625867694c434a7a593239775a53493657794a795a57466b4969776964334a70644755695853776959585270496a6f694d57497a4e7a67304d5467744f5441354d6930304d5455344c546b795a4459744f44646a4f5449774e475a6b4e7a4935496977695958563061473979615852705a584d694f6c736956564e4655694973496b524351534973496b464554556c4f496c3073496d703061534936496d526d4f47497a5a4456694c544a6c5a6a41744e4467774e7930354e544e6a4c5441315a4449334f575a6d4f44426a4f434973496d4e7361575675644639705a434936496d3170644739745a57527059584277496e302e446653566d7a447949576550327461476952312d7169744930625f684947697731356a6a4b4d547437504d	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f417574683241757468656e7469636174696f6ebd400b02166252130200024c000d73746f7265645265717565737474003c4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f4f4175746832526571756573743b4c00127573657241757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c737400124c6a6176612f6c616e672f4f626a6563743b787000737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00047870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000003770400000003737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f7269747900000000000002120200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000541444d494e7371007e000d7400034442417371007e000d740004555345527871007e000c707372003a6f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e4f41757468325265717565737400000000000000010200075a0008617070726f7665644c000b617574686f72697469657371007e00044c000a657874656e73696f6e7374000f4c6a6176612f7574696c2f4d61703b4c000b726564697265637455726971007e000e4c00077265667265736874003b4c6f72672f737072696e676672616d65776f726b2f73656375726974792f6f61757468322f70726f76696465722f546f6b656e526571756573743b4c000b7265736f7572636549647374000f4c6a6176612f7574696c2f5365743b4c000d726573706f6e7365547970657371007e0018787200386f72672e737072696e676672616d65776f726b2e73656375726974792e6f61757468322e70726f76696465722e426173655265717565737436287a3ea37169bd0200034c0008636c69656e74496471007e000e4c001172657175657374506172616d657465727371007e00164c000573636f706571007e0018787074000b6d69746f6d656469617070737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654d6170f1a5a8fe74f507420200014c00016d71007e00167870737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f400000000000037708000000040000000274000a6772616e745f7479706574000870617373776f7264740008757365726e616d657400176368696c696e73736b79407961686f6f2e636f6d2e6d7878737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e0009737200176a6176612e7574696c2e4c696e6b656448617368536574d86cd75a95dd2a1e020000787200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000103f4000000000000274000472656164740005777269746578017371007e0027770c000000103f40000000000000787371007e001e3f40000000000000770800000010000000007870707371007e0027770c000000103f4000000000000174000e6d69746f7265736f757263656964787371007e0027770c000000103f40000000000000787372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e00000000000002120200024c000b63726564656e7469616c7371007e00054c00097072696e636970616c71007e00057871007e0003017371007e00077371007e000b0000000377040000000371007e000f71007e001171007e00137871007e0033737200176a6176612e7574696c2e4c696e6b6564486173684d617034c04e5c106cc0fb0200015a000b6163636573734f726465727871007e001e3f400000000000067708000000080000000271007e002071007e002171007e002271007e0023780070737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657200000000000002120200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657371007e00184c000870617373776f726471007e000e4c0008757365726e616d6571007e000e7870010101017371007e0024737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f720000000000000212020000787077040000000371007e000f71007e001171007e001378707400176368696c696e73736b79407961686f6f2e636f6d2e6d78
\.


--
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paciente (id_paciente, apellidos, direccion, dni, email, nombres, telefono) FROM stdin;
4	RUIZ	\N	72361304	carlos@gmail.com	MARIA	991855514
6	RUIZ	\N	72302301	carlos@gmail.com	CARLOS	991855511
7	RUIZ	\N	72301302	carlos@gmail.com	ANDRES	991855512
8	RUIZ	\N	72301303	carlos@gmail.com	ANA	991855513
9	RUIZ	\N	72301304	carlos@gmail.com	MARIA	991855514
10	RUIZ	\N	72301305	carlos@gmail.com	KAREN	991855512
11	RUIZ	\N	72301306	carlos@gmail.com	LUIS	991855513
12	RUIZ	\N	72301307	carlos@gmail.com	JOSE	991855514
13	RUIZ	\N	72301308	carlos@gmail.com	EDGAR	991855588
14	RUIZ	\N	72301309	carlos@gmail.com	ROBERTO	991855522
5	RUIZ	comnocida	72351305	carlos@gmail.com	KAREN	991855512
16	RUIZ	\N	72301322	carlos@gmail.com	JEREMY	991855557
17	RUIZ	\N	72301312	carlos@gmail.com	PEPE	991855541
18	RUIZ	\N	72301313	carlos@gmail.com	KATHY	991855565
19	RUIZ	\N	72301314	carlos@gmail.com	MANUEL	991855561
20	RUIZ	\N	72301316	carlos@gmail.com	MARCOS	991855562
21	RUIZ	\N	72301391	carlos@gmail.com	KARLA	991855563
22	RUIZ	\N	72301801	carlos@gmail.com	CARLOS	991855564
23	RUIZ	\N	72308301	carlos@gmail.com	EDUARDO	991855565
24	RUIZ	\N	72301901	carlos@gmail.com	LESTER	991855566
25	RUIZ	\N	72301381	carlos@gmail.com	ERIKA	991855567
26	RUIZ	\N	72301311	carlos@gmail.com	TOMAS	991855568
27	RUIZ	\N	72301491	carlos@gmail.com	TOMASA	991855569
28	RUIZ	\N	72301384	carlos@gmail.com	TITO	991855570
29	RUIZ	\N	72301341	carlos@gmail.com	YAHAIRA	991855571
30	RUIZ	\N	72301342	carlos@gmail.com	BRAYAN	991855572
31	RUIZ	\N	72301343	carlos@gmail.com	KEVIN	991855573
32	RUIZ	\N	72301344	carlos@gmail.com	BRITTANY	991855574
33	RUIZ	\N	72301345	carlos@gmail.com	JULIO	991855575
34	RUIZ	\N	72301346	carlos@gmail.com	JULIA	991855576
36	RUIZ	\N	72301348	carlos@gmail.com	PAOLO	991855578
37	RUIZ	\N	72301349	carlos@gmail.com	PAOLA	991855579
38	RUIZ	\N	72301350	carlos@gmail.com	YOSHIMAR	991855580
39	RUIZ	\N	72301351	carlos@gmail.com	LIONEL	991855581
1	RUIZ	conocidaa	72392301	carlos@gmail.com	CARLOS	991855511
2	RUIZ	conocidaa	72381302	carlos@gmail.com	ANDRES	991855512
3	RUIZ	conocida	72371303	carlos@gmail.com	ANA	991855513
35	RUIZ	conocido	72301347	carlos@gmail.com	CESAR	991855577
100	RUIZ	Conocida	72301310	carlos@gmail.com	MIA	991855566
\.


--
-- Data for Name: reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reset_token (id, expiracion, token, id_usuario) FROM stdin;
\.


--
-- Data for Name: resettoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resettoken (id, expiracion, token, id_usuario) FROM stdin;
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol (id_rol, descripcion, nombre) FROM stdin;
1	ADMINISTRADOR	ADMIN
2	USUARIO	USER
3	ADMINISTRADOR DE BD	DBA
\.


--
-- Data for Name: signos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.signos (id_signos, fecha, pulso, ritmo, temperatura, id_paciente) FROM stdin;
2	2022-07-21 18:19:23	110	98	34	2
3	2022-07-21 18:19:23	110	98	34	2
4	2022-07-21 18:19:23	110	98	34	2
5	2022-07-21 18:19:23	110	98	34	2
6	2022-07-21 18:19:23	110	98	34	2
1	2022-07-21 18:19:23	110	98	34	3
2	2022-07-21 18:19:23	110	98	34	3
3	2022-07-21 18:19:23	110	98	34	3
4	2022-07-21 18:19:23	110	98	34	3
5	2022-07-21 18:19:23	110	98	34	3
6	2022-07-21 18:19:23	110	98	34	3
7	2022-07-21 18:19:23	110	98	34	3
3	2022-07-21 18:19:23	110	98	34	4
2	2022-07-21 18:19:23	110	98	34	5
3	2022-07-21 18:19:23	110	98	34	5
1	2022-07-26 00:00:00	110	98	34	5
2	2022-07-27 00:33:26	110	98	34	1
4	2022-07-27 00:00:00	110	98	34	5
1	2022-07-27 00:41:36	111	98	35	1
1	2022-07-25 00:00:00	111	88	33	9
1	2022-07-27 00:46:45	111	99	55	8
1	2022-07-27 07:04:56	110	111	33	7
2	2022-07-25 00:00:00	110	98	34	4
4	2022-07-25 00:00:00	110	98	34	4
1	2022-07-27 00:00:00	66	66	55	4
1	2022-07-19 00:00:00	55	55	55	2
1	2022-07-26 00:00:00	110	99	35	6
2	2022-07-25 00:00:00	100	96	36	6
5	2022-07-26 00:00:00	110	98	34	1
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, estado, clave, nombre) FROM stdin;
1	t	$2a$10$TGz5YTa8wyqhSYNI..lRCemA6VS/UQZ1slponS9FUhGjnm6fE66ha	chilinssky@yahoo.com.mx
2	t	$2a$10$dYs5nUJEnFcY5xpwfabTGu2/fPD2js2EPfvAMbrgTMSw9NSD.MYMS	mecano_mcs@hotmail.com
3	t	$2a$10$LFWOakAFPEI6s6ssjcHP4uXt8Is.azCwzeXA6a0SMMBXd/DbulRCO	chilinsskyc@gmail.com
\.


--
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_rol (id_usuario, id_rol) FROM stdin;
1	1
1	2
1	3
2	3
3	1
3	2
3	3
\.


--
-- Name: archivo_id_archivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archivo_id_archivo_seq', 1, false);


--
-- Name: consulta_id_consulta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consulta_id_consulta_seq', 1, false);


--
-- Name: detalle_consulta_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalle_consulta_id_detalle_seq', 1, false);


--
-- Name: especialidad_id_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especialidad_id_especialidad_seq', 1, false);


--
-- Name: examen_id_examen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.examen_id_examen_seq', 1, false);


--
-- Name: medico_id_medico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medico_id_medico_seq', 1, false);


--
-- Name: paciente_id_paciente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paciente_id_paciente_seq', 6, true);


--
-- Name: reset_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reset_token_id_seq', 1, false);


--
-- Name: resettoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resettoken_id_seq', 1, false);


--
-- Name: archivo archivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivo
    ADD CONSTRAINT archivo_pkey PRIMARY KEY (id_archivo);


--
-- Name: consulta_examen consulta_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_examen
    ADD CONSTRAINT consulta_examen_pkey PRIMARY KEY (id_consulta, id_examen);


--
-- Name: consulta consulta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT consulta_pkey PRIMARY KEY (id_consulta);


--
-- Name: detalle_consulta detalle_consulta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_consulta
    ADD CONSTRAINT detalle_consulta_pkey PRIMARY KEY (id_detalle);


--
-- Name: especialidad especialidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_especialidad);


--
-- Name: examen examen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examen
    ADD CONSTRAINT examen_pkey PRIMARY KEY (id_examen);


--
-- Name: medico medico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medico
    ADD CONSTRAINT medico_pkey PRIMARY KEY (id_medico);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id_menu);


--
-- Name: paciente paciente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT paciente_pkey PRIMARY KEY (id_paciente);


--
-- Name: reset_token reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT reset_token_pkey PRIMARY KEY (id);


--
-- Name: resettoken resettoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resettoken
    ADD CONSTRAINT resettoken_pkey PRIMARY KEY (id);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- Name: signos signos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signos
    ADD CONSTRAINT signos_pkey PRIMARY KEY (id_signos, id_paciente);


--
-- Name: usuario uk_cto7dkti4t38iq8r4cqesbd8k; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uk_cto7dkti4t38iq8r4cqesbd8k UNIQUE (nombre);


--
-- Name: resettoken uk_fscnkb1u6d7p7kv64apg87ltp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resettoken
    ADD CONSTRAINT uk_fscnkb1u6d7p7kv64apg87ltp UNIQUE (token);


--
-- Name: reset_token uk_shiutqgqq3m7hdrlmckbk4am6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT uk_shiutqgqq3m7hdrlmckbk4am6 UNIQUE (token);


--
-- Name: paciente uk_wr6kxhpayd3jdludsytbn8ag; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT uk_wr6kxhpayd3jdludsytbn8ag UNIQUE (dni);


--
-- Name: usuario_rol ukic3tbjpm5dum3n2xdrnns9gwm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT ukic3tbjpm5dum3n2xdrnns9gwm UNIQUE (id_usuario, id_rol);


--
-- Name: menu_rol uktqqcyupiiidyv6ntqhqly806c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT uktqqcyupiiidyv6ntqhqly806c UNIQUE (id_rol, id_menu);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: usuario_rol fk3ftpt75ebughsiy5g03b11akt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fk3ftpt75ebughsiy5g03b11akt FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: menu_rol fk8uyjomykqlidw6whr5a9vx16d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT fk8uyjomykqlidw6whr5a9vx16d FOREIGN KEY (id_menu) REFERENCES public.menu(id_menu);


--
-- Name: resettoken fk9aicjh9948kr54ba8hif6moai; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resettoken
    ADD CONSTRAINT fk9aicjh9948kr54ba8hif6moai FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: detalle_consulta fk_consulta_detalle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_consulta
    ADD CONSTRAINT fk_consulta_detalle FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);


--
-- Name: consulta fk_consulta_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT fk_consulta_especialidad FOREIGN KEY (id_especialidad) REFERENCES public.especialidad(id_especialidad);


--
-- Name: consulta fk_consulta_medico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT fk_consulta_medico FOREIGN KEY (id_medico) REFERENCES public.medico(id_medico);


--
-- Name: consulta fk_consulta_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta
    ADD CONSTRAINT fk_consulta_paciente FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: signos fk_paciente_signos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signos
    ADD CONSTRAINT fk_paciente_signos FOREIGN KEY (id_paciente) REFERENCES public.paciente(id_paciente);


--
-- Name: menu_rol fkjtnyb2364scc8ojb7vwh2jflj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_rol
    ADD CONSTRAINT fkjtnyb2364scc8ojb7vwh2jflj FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- Name: usuario_rol fkkxcv7htfnm9x1wkofnud0ewql; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_rol
    ADD CONSTRAINT fkkxcv7htfnm9x1wkofnud0ewql FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- Name: reset_token fkoc8cqwnb1m8ijoboimhcybrl4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reset_token
    ADD CONSTRAINT fkoc8cqwnb1m8ijoboimhcybrl4 FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


--
-- Name: consulta_examen fkrjj1hrlcgiao8rmnygjc1vynh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_examen
    ADD CONSTRAINT fkrjj1hrlcgiao8rmnygjc1vynh FOREIGN KEY (id_consulta) REFERENCES public.consulta(id_consulta);


--
-- Name: consulta_examen fktjqr6mtxn3pr0dgm842qkg2jn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_examen
    ADD CONSTRAINT fktjqr6mtxn3pr0dgm842qkg2jn FOREIGN KEY (id_examen) REFERENCES public.examen(id_examen);


--
-- PostgreSQL database dump complete
--

