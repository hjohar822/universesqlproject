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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text NOT NULL,
    size_in_ly numeric NOT NULL,
    number_of_stars bigint NOT NULL,
    discovered boolean NOT NULL,
    observatory_id integer
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius numeric NOT NULL,
    distance_from_planet integer NOT NULL,
    has_atmosphere boolean NOT NULL
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
-- Name: observatory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observatory (
    observatory_id integer NOT NULL,
    name character varying(255) NOT NULL,
    location text NOT NULL,
    established_year integer NOT NULL,
    operational boolean NOT NULL
);


ALTER TABLE public.observatory OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observatory_observatory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observatory_observatory_id_seq OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observatory_observatory_id_seq OWNED BY public.observatory.observatory_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    type text NOT NULL,
    orbital_period integer NOT NULL,
    habitable boolean NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    type text NOT NULL,
    mass numeric NOT NULL,
    is_visible boolean NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observatory observatory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory ALTER COLUMN observatory_id SET DEFAULT nextval('public.observatory_observatory_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 105700, 100000000000, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220000, 1000000000000, true, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60000, 40000000, true, 2);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 120000, 500000000000, true, 4);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 14000, 30000000000, true, 3);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Irregular', 7000, 3000000000, true, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737.4, 384400, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.2, 9377, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.2, 23460, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 1561.0, 670900, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 2634.0, 1070400, false);
INSERT INTO public.moon VALUES (6, 'Io', 3, 1821.0, 421700, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.0, 1882700, false);
INSERT INTO public.moon VALUES (8, 'Titan', 10, 2575.0, 1221870, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 10, 252.1, 238041, false);
INSERT INTO public.moon VALUES (10, 'Rhea', 10, 764.3, 527108, false);
INSERT INTO public.moon VALUES (11, 'Triton', 11, 1353.4, 354760, true);
INSERT INTO public.moon VALUES (12, 'Charon', 1, 606.0, 19590, false);
INSERT INTO public.moon VALUES (13, 'Oberon', 1, 761.4, 583520, false);
INSERT INTO public.moon VALUES (14, 'Titania', 1, 788.9, 435910, false);
INSERT INTO public.moon VALUES (15, 'Dione', 10, 561.4, 377400, false);
INSERT INTO public.moon VALUES (16, 'Mimas', 10, 198.2, 185520, false);
INSERT INTO public.moon VALUES (17, 'Iapetus', 10, 734.5, 3560800, false);
INSERT INTO public.moon VALUES (18, 'Ariel', 1, 578.9, 191020, false);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1, 584.7, 266000, false);
INSERT INTO public.moon VALUES (20, 'Miranda', 1, 235.8, 129390, false);


--
-- Data for Name: observatory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observatory VALUES (1, 'Hubble Space Telescope', 'Low Earth Orbit', 1990, true);
INSERT INTO public.observatory VALUES (2, 'Keck Observatory', 'Hawaii, USA', 1993, true);
INSERT INTO public.observatory VALUES (3, 'Arecibo Observatory', 'Puerto Rico', 1963, false);
INSERT INTO public.observatory VALUES (4, 'Mount Wilson Observatory', 'California, USA', 1904, true);
INSERT INTO public.observatory VALUES (5, 'Very Large Telescope', 'Atacama Desert, Chile', 1998, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 365, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 687, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 4333, false);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 3, 'Super-Earth', 290, true);
INSERT INTO public.planet VALUES (5, 'HD 209458 b', 5, 'Hot Jupiter', 3, false);
INSERT INTO public.planet VALUES (6, 'TRAPPIST-1d', 4, 'Terrestrial', 8, true);
INSERT INTO public.planet VALUES (7, 'TRAPPIST-1e', 4, 'Terrestrial', 13, true);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 6, 'Super-Earth', 37, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Terrestrial', 11, true);
INSERT INTO public.planet VALUES (10, 'Neptune', 1, 'Ice Giant', 60190, false);
INSERT INTO public.planet VALUES (11, 'Saturn', 1, 'Gas Giant', 10759, false);
INSERT INTO public.planet VALUES (12, 'Venus', 1, 'Terrestrial', 225, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.0, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 'M2I', 20.0, true);
INSERT INTO public.star VALUES (3, 'Rigel', 2, 'B8I', 21.0, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 'G2V', 1.1, true);
INSERT INTO public.star VALUES (5, 'Sirius', 2, 'A1V', 2.0, true);
INSERT INTO public.star VALUES (6, 'Vega', 3, 'A0V', 2.2, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observatory_observatory_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: observatory observatory_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_name_key UNIQUE (name);


--
-- Name: observatory observatory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_pkey PRIMARY KEY (observatory_id);


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
-- Name: galaxy galaxy_observatory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_observatory_id_fkey FOREIGN KEY (observatory_id) REFERENCES public.observatory(observatory_id);


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

