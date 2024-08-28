--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(40) NOT NULL,
    gravity numeric(5,2),
    age integer,
    rating integer,
    reached boolean NOT NULL,
    nullcol text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    gravity numeric(5,2),
    age integer,
    rating integer,
    reached boolean NOT NULL,
    nullcol text
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
    name character varying(40) NOT NULL,
    gravity numeric(5,2),
    age integer,
    rating integer,
    reached boolean NOT NULL,
    planet_id integer,
    nullcol text
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
    name character varying(40) NOT NULL,
    gravity numeric(5,2),
    age integer,
    rating integer,
    reached boolean NOT NULL,
    star_id integer,
    nullcol text
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
    name character varying(40) NOT NULL,
    gravity numeric(5,2),
    age integer,
    rating integer,
    reached boolean NOT NULL,
    galaxy_id integer,
    nullcol text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 20.80, 400, 8, true, NULL);
INSERT INTO public.asteroid VALUES (2, 'Asteroid', 12.80, 900, 10, true, NULL);
INSERT INTO public.asteroid VALUES (3, 'Vesta 4', 9.80, 1000, 12, false, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 15.50, 1299, 5, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 8.50, 1400, 6, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Virgo', 9.50, 800, 7, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Magellanic', 15.50, 1299, 5, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Cygnus', 8.50, 1400, 6, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Maffei', 9.50, 800, 7, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mercury', 20.80, 400, 8, true, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Venus', 12.80, 900, 10, true, 5, NULL);
INSERT INTO public.moon VALUES (3, 'Earth', 9.80, 1000, 12, false, 3, NULL);
INSERT INTO public.moon VALUES (4, 'Lo', 20.80, 400, 8, true, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 12.80, 900, 10, true, 2, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymade', 9.80, 1000, 12, false, 4, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', 20.80, 400, 8, true, 1, NULL);
INSERT INTO public.moon VALUES (8, 'Elara', 12.80, 900, 10, true, 2, NULL);
INSERT INTO public.moon VALUES (9, 'Sinope', 9.80, 1000, 12, false, 2, NULL);
INSERT INTO public.moon VALUES (10, 'Carme', 20.80, 400, 8, true, 1, NULL);
INSERT INTO public.moon VALUES (11, 'Ananke', 12.80, 900, 10, true, 9, NULL);
INSERT INTO public.moon VALUES (12, 'Thebe', 9.80, 1000, 12, false, 8, NULL);
INSERT INTO public.moon VALUES (13, 'Chaldene', 20.80, 400, 8, true, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Kalyke', 12.80, 900, 10, true, 5, NULL);
INSERT INTO public.moon VALUES (15, 'Isonoe', 9.80, 1000, 12, false, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Autonoe', 20.80, 400, 8, true, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Euporie', 12.80, 900, 10, true, 10, NULL);
INSERT INTO public.moon VALUES (18, 'Kale', 9.80, 1000, 12, false, 10, NULL);
INSERT INTO public.moon VALUES (19, 'Mneme', 12.80, 900, 10, true, 12, NULL);
INSERT INTO public.moon VALUES (20, 'Aoede', 9.80, 1000, 12, false, 12, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 20.80, 400, 8, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 12.80, 900, 10, true, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 9.80, 1000, 12, false, 3, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 20.80, 400, 8, true, 2, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 12.80, 900, 10, true, 6, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.80, 1000, 12, false, 6, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 20.80, 400, 8, true, 6, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 12.80, 900, 10, true, 5, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 9.80, 1000, 12, false, 2, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 20.80, 400, 8, true, 2, NULL);
INSERT INTO public.planet VALUES (11, 'Eris', 12.80, 900, 10, true, 3, NULL);
INSERT INTO public.planet VALUES (12, 'Makemake', 9.80, 1000, 12, false, 4, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 9.80, 500, 8, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 12.80, 1200, 10, true, 2, NULL);
INSERT INTO public.star VALUES (3, 'Vega', 12.80, 800, 12, false, 3, NULL);
INSERT INTO public.star VALUES (4, 'Canopus', 9.80, 500, 8, true, 4, NULL);
INSERT INTO public.star VALUES (5, 'Mintaka', 12.80, 1200, 10, true, 5, NULL);
INSERT INTO public.star VALUES (6, 'Rigel', 12.80, 800, 12, false, 3, NULL);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

