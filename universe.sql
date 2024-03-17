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
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    is_active boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(4,2)
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
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(50) NOT NULL,
    launch_date date NOT NULL,
    mission_status character varying(20),
    planet_id integer NOT NULL,
    CONSTRAINT mission_mission_status_check CHECK (((mission_status)::text = ANY ((ARRAY['Ongoing'::character varying, 'Completed'::character varying, 'Failed'::character varying])::text[])))
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mission_mission_id_seq OWNED BY public.mission.mission_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_mood_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_mood_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_mood_id_seq OWNER TO freecodecamp;

--
-- Name: moon_mood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_mood_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    description text,
    diameter integer,
    star_id integer
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
    name character varying(50) NOT NULL,
    distance_from_earth numeric(4,2),
    age_in_billions_of_years integer,
    magnitude integer NOT NULL,
    galaxy_id integer
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
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_mission_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_mood_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 13000, 0.10);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 20000, 2.20);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', true, 60000, 5.50);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', true, 10000, 3.00);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', true, 40000, 2.30);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', true, 12000, 1.30);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission VALUES (1, 'Mars Rover Exploration', '2023-07-30', 'Ongoing', 2);
INSERT INTO public.mission VALUES (2, 'Voyager 1', '1977-09-05', 'Completed', 4);
INSERT INTO public.mission VALUES (3, 'New Horizons', '2006-01-19', 'Completed', 9);
INSERT INTO public.mission VALUES (4, 'Cassini-Huygens', '1997-10-15', 'Completed', 5);
INSERT INTO public.mission VALUES (5, 'Juno', '2011-08-05', 'Ongoing', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (16, 'Luna', true, 384400, 1);
INSERT INTO public.moon VALUES (17, 'Phobos', true, 9378, 2);
INSERT INTO public.moon VALUES (18, 'Deimos', true, 23460, 2);
INSERT INTO public.moon VALUES (19, 'Ganymede', true, 1070410, 5);
INSERT INTO public.moon VALUES (20, 'Titan', true, 1221860, 6);
INSERT INTO public.moon VALUES (21, 'Titania', true, 435910, 7);
INSERT INTO public.moon VALUES (22, 'Triton', true, 354760, 8);
INSERT INTO public.moon VALUES (23, 'Charon', true, 19571, 9);
INSERT INTO public.moon VALUES (24, 'Phobos II', true, 9378, 2);
INSERT INTO public.moon VALUES (25, 'Nix', true, 4867, 9);
INSERT INTO public.moon VALUES (26, 'Europa', true, 671034, 5);
INSERT INTO public.moon VALUES (27, 'Io', true, 421700, 5);
INSERT INTO public.moon VALUES (28, 'Callisto', true, 1882700, 5);
INSERT INTO public.moon VALUES (29, 'Ganymede II', true, 1070410, 5);
INSERT INTO public.moon VALUES (30, 'Enceladus', true, 238037, 6);
INSERT INTO public.moon VALUES (31, 'Titan II', true, 1221860, 6);
INSERT INTO public.moon VALUES (32, 'Mimas', true, 185539, 6);
INSERT INTO public.moon VALUES (33, 'Triton II', true, 354760, 8);
INSERT INTO public.moon VALUES (34, 'Nereid', true, 5513828, 8);
INSERT INTO public.moon VALUES (35, 'Charon II', true, 19571, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'The third planet from the Sun and the only astronomical object known to harbor life.', 12742, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'The fourth planet from the Sun and the second-smallest planet in the Solar System, after Mercury.', 6779, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'The second planet from the Sun. It has a thick atmosphere that traps heat.', 12104, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', false, 'The smallest planet in the Solar System and the closest to the Sun.', 4879, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'The fifth planet from the Sun and the largest in the Solar System.', 139822, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'The sixth planet from the Sun and the second-largest in the Solar System.', 116464, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'The seventh planet from the Sun.', 50724, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'The eighth and farthest known planet from the Sun in the Solar System.', 49244, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Once considered the ninth planet from the Sun.', 2370, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', true, 'An exoplanet orbiting the Sun-like star Kepler-452 about 1,402 light-years from Earth.', 21670, 9);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', false, 'A super-Earth exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22.', 24060, 10);
INSERT INTO public.planet VALUES (12, 'HD 40307 g', false, 'A potentially habitable exoplanet orbiting within the habitable zone of the star HD 40307.', 11000, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.80, 4, 27, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.24, 6, 11, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 8.60, 2, 1, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 4.37, 6, 0, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 4.37, 6, 1, 1);
INSERT INTO public.star VALUES (6, 'Barnard Star', 5.96, 9, 10, 1);
INSERT INTO public.star VALUES (7, 'Wolf 359', 7.78, 0, 14, 1);
INSERT INTO public.star VALUES (8, 'Luhman 16', 6.52, 3, 10, 1);
INSERT INTO public.star VALUES (9, 'Rigel', 77.20, 8, 7, 2);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 64.20, 10, 6, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 5, true);


--
-- Name: moon_mood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_mood_id_seq', 35, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


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
-- Name: mission mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

