--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    image text NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shape character varying(20),
    size_in_lightyears integer,
    distance_in_lightyears numeric(120,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    revolution_period_in_days integer,
    orbit_period_in_days integer,
    ordinal_number integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    inclination_in_degrees numeric(4,2),
    number_of_moons integer,
    revolution_period_in_days integer,
    orbit_period_in_days integer,
    has_ring boolean,
    in_habitable_zone boolean,
    ordinal_number integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    number_of_planets integer,
    star_weight_in_suns numeric(5,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Comet Arend-Roland', 'arend-roland.jpg');
INSERT INTO public.comet VALUES (2, 'Chiron', 'chiron.jpg');
INSERT INTO public.comet VALUES (3, 'Comet Hale-Bopp', 'hale-bopp.jpg');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 0.0);
INSERT INTO public.galaxy VALUES (2, 'Sagittaruis Dwarf', 'Elliptical', 10000, 25000.0);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'Irregular', 5000, 65230.0);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral', 30000, 23160000.0);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Unclear', 25000, 29350000.0);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'Spiral', 26481, 24010000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Moon', 3, 27, 27, 1);
INSERT INTO public.moon VALUES (4, 'Metis', 5, 0, 0, 1);
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, 0, 0, 2);
INSERT INTO public.moon VALUES (6, 'Amalthea', 5, 1, 0, 3);
INSERT INTO public.moon VALUES (7, 'Thebe', 5, 1, 0, 4);
INSERT INTO public.moon VALUES (8, 'Io', 5, 2, 0, 5);
INSERT INTO public.moon VALUES (9, 'Europa', 5, 4, 0, 6);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5, 7, 0, 7);
INSERT INTO public.moon VALUES (11, 'Callisto', 5, 17, 0, 8);
INSERT INTO public.moon VALUES (12, 'Themisto', 5, 130, 0, 9);
INSERT INTO public.moon VALUES (13, 'Leda', 5, 240, 0, 10);
INSERT INTO public.moon VALUES (14, 'Ersa', 5, 249, 0, 11);
INSERT INTO public.moon VALUES (15, 'S/2018 J 2', 5, 249, 0, 12);
INSERT INTO public.moon VALUES (16, 'Himalia', 5, 250, 0, 13);
INSERT INTO public.moon VALUES (17, 'Pandia', 5, 251, 0, 14);
INSERT INTO public.moon VALUES (18, 'Lysithea', 5, 259, 0, 15);
INSERT INTO public.moon VALUES (19, 'Elara', 5, 259, 0, 16);
INSERT INTO public.moon VALUES (20, 'S/2011 J 3', 5, 259, 0, 17);
INSERT INTO public.moon VALUES (21, 'Dia', 5, 278, 0, 18);
INSERT INTO public.moon VALUES (22, 'S/2018 J 4', 5, 427, 0, 19);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 7.00, 0, 176, 88, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 3.39, 0, -116, 224, false, false, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.85, 2, 1, 687, false, false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1.30, 95, 10, 4333, false, false, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2.48, 83, 0, 10759, true, false, 6);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 7.15, 1, 1, 365, false, true, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 0.70, 27, -1, 30688, true, false, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 1.70, 14, 1, 60195, false, false, 8);
INSERT INTO public.planet VALUES (10, 'HD 219134b', 7, 85.00, 0, 0, 3, false, false, 1);
INSERT INTO public.planet VALUES (11, 'HD 219134c', 7, 87.00, 0, 0, 7, false, false, 2);
INSERT INTO public.planet VALUES (12, 'HD 219134d', 7, 0.00, 0, 0, 22, false, false, 3);
INSERT INTO public.planet VALUES (13, 'HD 219134f', 7, 0.00, 0, 0, 47, false, false, 4);
INSERT INTO public.planet VALUES (14, 'HD 219134g', 7, 0.00, 0, 0, 94, false, false, 5);
INSERT INTO public.planet VALUES (15, 'HD 219134h', 7, 0.00, 0, 0, 2100, false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 8, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius A', 1, 0, 1.00);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 0, 16.00);
INSERT INTO public.star VALUES (4, 'Rigel', 1, 0, 21.00);
INSERT INTO public.star VALUES (5, 'Vega', 1, 1, 2.00);
INSERT INTO public.star VALUES (6, 'Antares', 1, 0, 11.00);
INSERT INTO public.star VALUES (7, 'HD 219134', 1, 6, 0.79);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comet comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_parent_planet_ordinal_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_parent_planet_ordinal_number_key UNIQUE (planet_id, ordinal_number);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_parent_star_ordinal_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_parent_star_ordinal_number_key UNIQUE (star_id, ordinal_number);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star parent_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT parent_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon parent_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT parent_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet parent_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT parent_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
