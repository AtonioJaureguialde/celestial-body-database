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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    asteroid_type character varying(30) NOT NULL,
    measure numeric NOT NULL,
    mass integer NOT NULL,
    entry_creation timestamp without time zone DEFAULT now(),
    galaxy_id integer
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
    name character varying(30) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    description text NOT NULL,
    measure numeric NOT NULL,
    entry_creation timestamp without time zone DEFAULT now()
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
    moon_type character varying(40) NOT NULL,
    measure numeric NOT NULL,
    distance_to_planet numeric NOT NULL,
    resources text NOT NULL,
    entry_creation timestamp without time zone DEFAULT now(),
    mass integer NOT NULL,
    planet_id integer NOT NULL
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
    planet_type character varying(40) NOT NULL,
    measure numeric NOT NULL,
    habitable boolean NOT NULL,
    non_habitable boolean NOT NULL,
    entry_creation timestamp without time zone DEFAULT now(),
    age integer NOT NULL,
    star_id integer NOT NULL
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
    star_type character varying(40) NOT NULL,
    measure_e30 numeric NOT NULL,
    white boolean NOT NULL,
    blue boolean NOT NULL,
    red boolean NOT NULL,
    entry_creation timestamp without time zone DEFAULT now(),
    galaxy_id integer NOT NULL
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Cinturón de asteroides', 590, 9, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Cinturón de asteroides', 525, 3, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Cinturón de asteroides', 512, 2, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'Cinturón de asteroides', 431, 1, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 'Cinturón de asteroides', 350, 0, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (6, 'Davida', 'Cinturón de asteroides', 326, 0, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (7, 'Eunomia', 'Cinturón de asteroides', 268, 0, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (8, 'Psyche', 'Cinturón de asteroides', 226.4, 0, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (9, 'Juno', 'Cinturón de asteroides', 233.7, 0, '2023-07-11 14:58:17.119191', 1);
INSERT INTO public.asteroid VALUES (10, 'Herculina', 'Cinturón de asteroides', 225.3, 0, '2023-07-11 14:58:17.119191', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andrómeda', 'Spiral', 'The closest galaxy to the Milky Way', 150000, '2023-07-11 10:50:39.473165');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Barred Spiral', 'Our home Galaxy', 100000, '2023-07-11 10:50:39.473165');
INSERT INTO public.galaxy VALUES (3, 'Whirpool Galaxy', 'Spiral', 'Interacting Galaxy with a Spiral structure', 80000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 'Spiral', 'Our hSmall spiral galaxy in the Local Group', 50000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lenticular', 'Unusual galaxy with a prominent dust lane', 90000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 'Giant elliptical galaxy with an active galactic nucleus', 120000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (7, 'Pinwheel Galaxy', 'Spiral', 'Beautiful grand design spyral galaxy', 75000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (8, 'Messier 82', 'Irregular', 'Starburst galaxy in the constellation Ursa Major', 60000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (9, 'Black Eye Galaxy', 'Spiral', 'Distinctive galaxy with a dark band of obscuring dust', 70000, '2023-07-11 11:05:26.508265');
INSERT INTO public.galaxy VALUES (10, 'Bodes Galaxy', 'Spiral', 'Pair of interacting galaxies in the constellation Ursa Major', 65000, '2023-07-11 11:05:26.508265');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Natural', 0.0073, 384400, 'Water, minerals', '2023-07-12 07:00:29.833088', 7, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural', 0.0000151, 9377, 'Rock, dust', '2023-07-12 07:00:29.833088', 1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Natural', 0.0000039, 23460, 'Rock, dust', '2023-07-12 07:00:29.833088', 1, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Natural', 0.008, 670900, 'Ice, water', '2023-07-12 07:00:29.833088', 5, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Natural', 0.025, 1070400, 'Ice, rock', '2023-07-12 07:00:29.833088', 2, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Natural', 0.018, 1882700, 'Ice, rock', '2023-07-12 07:00:29.833088', 1, 5);
INSERT INTO public.moon VALUES (7, 'Titan', 'Natural', 0.0225, 1221870, 'Organic compounds, hydrocarbons', '2023-07-12 07:00:29.833088', 1, 6);
INSERT INTO public.moon VALUES (8, 'Iapetus', 'Natural', 0.0074, 3560820, 'Ice, rock', '2023-07-12 07:00:29.833088', 2, 6);
INSERT INTO public.moon VALUES (9, 'Charon', 'Natural', 0.0000833, 19591, 'Water ice, rock', '2023-07-12 07:00:29.833088', 2, 9);
INSERT INTO public.moon VALUES (10, 'Triton', 'Natural', 0.0215, 354759, 'Nitrogen, ice, rock', '2023-07-12 07:00:29.833088', 2, 8);
INSERT INTO public.moon VALUES (11, 'Phoebe', 'Natural', 0.0000561, 12952000, 'Water ice, rock', '2023-07-12 07:00:29.833088', 8, 6);
INSERT INTO public.moon VALUES (12, 'Hyperion', 'Natural', 0.0037, 1481100, 'Ice, rock', '2023-07-12 07:00:29.833088', 6, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 'Natural', 0.0000633, 185520, 'Ice, rock', '2023-07-12 07:00:29.833088', 4, 7);
INSERT INTO public.moon VALUES (14, 'Enceladus', 'Natural', 0.000252, 237948, 'Water ice, organic compounds', '2023-07-12 07:00:29.833088', 1, 7);
INSERT INTO public.moon VALUES (15, 'Rhea', 'Natural', 0.0000928, 527108, 'Ice, rock', '2023-07-12 07:00:29.833088', 2, 7);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Natural', 0.0000238, 129390, 'Ice, rock', '2023-07-12 07:00:29.833088', 7, 11);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Natural', 0.0000382, 191020, 'Water ice, rock', '2023-07-12 07:00:29.833088', 1, 11);
INSERT INTO public.moon VALUES (18, 'Umbriel', 'Natural', 0.0000461, 266300, 'Water ice, rock', '2023-07-12 07:00:29.833088', 1, 11);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Natural', 0.0000955, 294619, 'Ice, rock', '2023-07-12 07:00:29.833088', 6, 7);
INSERT INTO public.moon VALUES (20, 'Dione', 'Natural', 0.000123, 377415, 'Ice, rock', '2023-07-12 07:00:29.833088', 1, 7);
INSERT INTO public.moon VALUES (21, 'Proteus', 'Natural', 0.0000659, 117647, 'Ice, rock', '2023-07-12 07:00:29.833088', 4, 10);
INSERT INTO public.moon VALUES (22, 'Oberon', 'Natural', 0.0000476, 582600, 'Water ice, rock', '2023-07-12 07:00:29.833088', 3, 11);
INSERT INTO public.moon VALUES (23, 'Titania', 'Natural', 0.0000554, 435910, 'Water ice, rock', '2023-07-12 07:00:29.833088', 3, 11);
INSERT INTO public.moon VALUES (24, 'Nereid', 'Natural', 0.000137, 5513810, 'Ice, rock', '2023-07-12 07:00:29.833088', 3, 8);
INSERT INTO public.moon VALUES (25, 'Charitum Montes', 'Natural', 0.0000217, 6760, 'Ice, rock', '2023-07-12 07:00:29.833088', 2, 12);
INSERT INTO public.moon VALUES (26, 'Cryovolcano', 'Natural', 0.0000009, 8000, 'Ice, gas', '2023-07-12 07:00:29.833088', 2, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.0553, true, false, '2023-07-12 06:51:57.320656', 5, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.815, false, true, '2023-07-12 06:51:57.320656', 5, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1, true, false, '2023-07-12 06:51:57.320656', 5, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 0.107, false, true, '2023-07-12 06:51:57.320656', 5, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 317.8, false, true, '2023-07-12 06:51:57.320656', 5, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 95.2, false, true, '2023-07-12 06:51:57.320656', 5, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 14.5, false, true, '2023-07-12 06:51:57.320656', 5, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 17.1, false, true, '2023-07-12 06:51:57.320656', 5, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', 0.00218, false, true, '2023-07-12 06:51:57.320656', 5, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Exoplanet', 5, true, false, '2023-07-12 06:51:57.320656', 6, 5);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 'Exoplanet', 0.69, false, true, '2023-07-12 06:51:57.320656', 7, 6);
INSERT INTO public.planet VALUES (12, 'Makemake', 'Dwarf Planet', 0.00067, false, true, '2023-07-12 06:51:57.320656', 5, 4);
INSERT INTO public.planet VALUES (13, 'Europa', 'Moon', 0.008, true, false, '2023-07-12 06:51:57.320656', 5, 3);
INSERT INTO public.planet VALUES (14, 'Titan', 'Moon', 0.0225, false, true, '2023-07-12 06:51:57.320656', 5, 5);
INSERT INTO public.planet VALUES (15, 'Ganymede', 'Moon', 0.025, false, true, '2023-07-12 06:51:57.320656', 5, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main sequence', 202, true, false, false, '2023-07-11 11:20:15.805957', 2);
INSERT INTO public.star VALUES (1, 'Sun', 'G-type main sequence', 1989, true, false, false, '2023-07-11 11:12:39.737867', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 129, false, false, true, '2023-07-11 11:23:36.828169', 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Enana roja', 0.1, true, false, false, '2023-07-11 14:43:41.047589', 2);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Enana amarilla', 0.5, true, false, false, '2023-07-11 14:43:41.047589', 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 'Enana naranja', 0.4, true, false, false, '2023-07-11 14:43:41.047589', 2);
INSERT INTO public.star VALUES (7, 'Barnard''s Star', 'Enana roja', 0.1, true, false, false, '2023-07-11 14:43:41.047589', 1);
INSERT INTO public.star VALUES (8, 'Wolf 359', 'Enana roja', 0.1, true, false, false, '2023-07-11 14:43:41.047589', 2);
INSERT INTO public.star VALUES (9, 'Lalande 21185', 'Enana roja', 0.1, true, false, false, '2023-07-11 14:43:41.047589', 1);
INSERT INTO public.star VALUES (10, 'Sirius B', 'Enana blanca', 0.01, true, false, false, '2023-07-11 14:43:41.047589', 2);
INSERT INTO public.star VALUES (11, 'Ross 154', 'Enana roja', 0.1, true, false, false, '2023-07-11 14:43:41.047589', 1);
INSERT INTO public.star VALUES (12, 'Ross 248', 'Enana roja', 0.1, true, false, false, '2023-07-11 14:43:41.047589', 1);
INSERT INTO public.star VALUES (13, 'Epsilon Eridani', 'Enana naranja', 0.3, true, false, false, '2023-07-11 14:43:41.047589', 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy condicion_unica; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT condicion_unica UNIQUE (name);


--
-- Name: asteroid condicion_unica_1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT condicion_unica_1 UNIQUE (name);


--
-- Name: star condicion_unica_2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT condicion_unica_2 UNIQUE (name);


--
-- Name: planet condicion_unica_3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT condicion_unica_3 UNIQUE (name);


--
-- Name: moon condicion_unica_4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT condicion_unica_4 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

