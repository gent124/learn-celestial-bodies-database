--
-- PostgreSQL database dump
--
-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
SET
  statement_timeout = 0;

SET
  lock_timeout = 0;

SET
  idle_in_transaction_session_timeout = 0;

SET
  client_encoding = 'UTF8';

SET
  standard_conforming_strings = on;

SELECT
  pg_catalog.set_config('search_path', '', false);

SET
  check_function_bodies = false;

SET
  xmloption = content;

SET
  client_min_messages = warning;

SET
  row_security = off;

DROP DATABASE universe;

--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\ connect universe
SET
  statement_timeout = 0;

SET
  lock_timeout = 0;

SET
  idle_in_transaction_session_timeout = 0;

SET
  client_encoding = 'UTF8';

SET
  standard_conforming_strings = on;

SELECT
  pg_catalog.set_config('search_path', '', false);

SET
  check_function_bodies = false;

SET
  xmloption = content;

SET
  client_min_messages = warning;

SET
  row_security = off;

SET
  default_tablespace = '';

SET
  default_table_access_method = heap;

--
-- Name: characteristics; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.characteristics (
  characteristics_id integer NOT NULL,
  name character varying(100) NOT NULL,
  characteristics text NOT NULL
);

ALTER TABLE
  public.characteristics OWNER TO freecodecamp;

--
-- Name: characteristics_characteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.characteristics_characteristics_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.characteristics_characteristics_id_seq OWNER TO freecodecamp;

--
-- Name: characteristics_characteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.characteristics_characteristics_id_seq OWNED BY public.characteristics.characteristics_id;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
  galaxy_id integer NOT NULL,
  name character varying(255) NOT NULL,
  type character varying(50) NOT NULL,
  age numeric NOT NULL,
  size integer NOT NULL,
  rotation_time integer NOT NULL
);

ALTER TABLE
  public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
  moon_id integer NOT NULL,
  name character varying(100) NOT NULL,
  rotation_period numeric NOT NULL,
  radius integer NOT NULL,
  surface numeric NOT NULL,
  mass numeric NOT NULL,
  planet_id integer,
  is_volcanic boolean DEFAULT false
);

ALTER TABLE
  public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.planet (
  planet_id integer NOT NULL,
  name character varying NOT NULL,
  temperature integer NOT NULL,
  mass numeric NOT NULL,
  diameter integer NOT NULL,
  revolution numeric NOT NULL,
  rotation integer NOT NULL,
  star_id integer,
  has_atmosphere boolean DEFAULT false
);

ALTER TABLE
  public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
  star_id integer NOT NULL,
  name character varying(100) NOT NULL,
  temperature integer NOT NULL,
  mass integer NOT NULL,
  color character varying(50) NOT NULL,
  luminosity numeric NOT NULL,
  size integer NOT NULL,
  galaxy_id integer
);

ALTER TABLE
  public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
  public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Name: characteristics characteristics_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.characteristics
ALTER COLUMN
  characteristics_id
SET
  DEFAULT nextval(
    'public.characteristics_characteristics_id_seq' :: regclass
  );

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ALTER COLUMN
  galaxy_id
SET
  DEFAULT nextval('public.galaxy_galaxy_id_seq' :: regclass);

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ALTER COLUMN
  moon_id
SET
  DEFAULT nextval('public.moon_moon_id_seq' :: regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ALTER COLUMN
  planet_id
SET
  DEFAULT nextval('public.planet_planet_id_seq' :: regclass);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ALTER COLUMN
  star_id
SET
  DEFAULT nextval('public.star_star_id_seq' :: regclass);

--
-- Data for Name: characteristics; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.characteristics
VALUES
  (
    1,
    'Atmosphere',
    'Hydrogen and Helium, trace amounts of methane and ammonia'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    2,
    'Surface Composition',
    'Rocky with large plains, craters, and mountains'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    3,
    'Magnetic Field',
    'Strong magnetic field, protects from solar winds'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    4,
    'Orbit',
    'Elliptical orbit, closest approach to star at 0.5 AU'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    5,
    'Moons',
    'Has two small moons, Phobos and Deimos'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    6,
    'Surface Temperature',
    'Temperatures vary from -60°C to 20°C depending on location'
  );

INSERT INTO
  public.characteristics
VALUES
  (7, 'Gravity', '0.38 times the gravity of Earth');

INSERT INTO
  public.characteristics
VALUES
  (
    8,
    'Climate',
    'Cold desert, occasional dust storms'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    9,
    'Atmospheric Pressure',
    'Low pressure, not breathable'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    10,
    'Weather',
    'No significant weather, occasional dust storms'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    11,
    'Erosion',
    'Minimal erosion due to lack of atmosphere'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    12,
    'Geological Activity',
    'No active volcanoes, some tectonic activity'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    13,
    'Water Availability',
    'Water in the form of ice, some liquid water under the surface'
  );

INSERT INTO
  public.characteristics
VALUES
  (14, 'Life', 'No known life');

INSERT INTO
  public.characteristics
VALUES
  (
    15,
    'Atmospheric Composition',
    'Mostly CO2, no oxygen'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    16,
    'Surface Liquids',
    'No liquid water, traces of methane lakes on moons'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    17,
    'Day Length',
    'Day lasts 24 hours and 37 minutes'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    18,
    'Tilt',
    'Axial tilt of 23.5°, similar to Earth'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    19,
    'Orbital Period',
    'Revolves around the star in 687 Earth days'
  );

INSERT INTO
  public.characteristics
VALUES
  (
    20,
    'Star Type',
    'Red dwarf star, low luminosity'
  );

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.galaxy
VALUES
  (1, 'Milky Way', 'Spiral', 13.51, 100000, 225);

INSERT INTO
  public.galaxy
VALUES
  (2, 'Andromeda', 'Spiral', 10.00, 110000, 250);

INSERT INTO
  public.galaxy
VALUES
  (3, 'Triangulum', 'Spiral', 2.50, 60000, 100);

INSERT INTO
  public.galaxy
VALUES
  (4, 'Whirlpool', 'Spiral', 6.50, 70000, 200);

INSERT INTO
  public.galaxy
VALUES
  (5, 'Sombrero', 'Elliptical', 12.50, 50000, 300);

INSERT INTO
  public.galaxy
VALUES
  (
    6,
    'Messier 87',
    'Elliptical',
    13.25,
    120000,
    400
  );

INSERT INTO
  public.galaxy
VALUES
  (7, 'Cartwheel', 'Ring', 0.50, 150000, 500);

INSERT INTO
  public.galaxy
VALUES
  (8, 'Antennae', 'Irregular', 6.00, 130000, 350);

INSERT INTO
  public.galaxy
VALUES
  (9, 'Sculptor', 'Dwarf', 5.00, 40000, 150);

INSERT INTO
  public.galaxy
VALUES
  (10, 'Leo I', 'Dwarf', 7.00, 35000, 180);

INSERT INTO
  public.galaxy
VALUES
  (11, 'Leo II', 'Dwarf', 6.00, 32000, 170);

INSERT INTO
  public.galaxy
VALUES
  (
    12,
    'Magellanic Cloud',
    'Irregular',
    2.50,
    50000,
    210
  );

INSERT INTO
  public.galaxy
VALUES
  (13, 'Ursa Minor', 'Dwarf', 10.00, 30000, 190);

INSERT INTO
  public.galaxy
VALUES
  (14, 'Draco', 'Dwarf', 11.00, 31000, 175);

INSERT INTO
  public.galaxy
VALUES
  (15, 'Fornax', 'Dwarf', 8.00, 36000, 160);

INSERT INTO
  public.galaxy
VALUES
  (16, 'IC 1101', 'Elliptical', 12.90, 600000, 700);

INSERT INTO
  public.galaxy
VALUES
  (
    17,
    'NGC 1300',
    'Barred Spiral',
    5.20,
    110000,
    220
  );

INSERT INTO
  public.galaxy
VALUES
  (18, 'NGC 6744', 'Spiral', 6.00, 160000, 240);

INSERT INTO
  public.galaxy
VALUES
  (19, 'NGC 4565', 'Spiral', 8.10, 150000, 230);

INSERT INTO
  public.galaxy
VALUES
  (20, 'NGC 4038', 'Irregular', 4.00, 120000, 270);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.moon
VALUES
  (1, 'Luna', 27.3, 1737, 37.9, 0.0123, 3, false);

INSERT INTO
  public.moon
VALUES
  (
    2,
    'Phobos',
    0.32,
    11,
    0.001,
    0.000000107,
    4,
    false
  );

INSERT INTO
  public.moon
VALUES
  (
    3,
    'Deimos',
    1.26,
    6,
    0.0002,
    0.000000024,
    4,
    false
  );

INSERT INTO
  public.moon
VALUES
  (4, 'Io', 1.77, 1821, 41, 0.015, 5, false);

INSERT INTO
  public.moon
VALUES
  (5, 'Europa', 3.55, 1560, 30, 0.008, 5, false);

INSERT INTO
  public.moon
VALUES
  (6, 'Ganymede', 7.15, 2634, 87, 0.025, 5, false);

INSERT INTO
  public.moon
VALUES
  (7, 'Callisto', 16.69, 2410, 73, 0.018, 5, false);

INSERT INTO
  public.moon
VALUES
  (8, 'Titan', 15.95, 2575, 83, 0.022, 6, false);

INSERT INTO
  public.moon
VALUES
  (9, 'Rhea', 4.52, 764, 14, 0.00003, 6, false);

INSERT INTO
  public.moon
VALUES
  (10, 'Tethys', 1.89, 536, 7.5, 0.00002, 6, false);

INSERT INTO
  public.moon
VALUES
  (
    11,
    'Enceladus',
    1.37,
    252,
    2.5,
    0.00001,
    6,
    false
  );

INSERT INTO
  public.moon
VALUES
  (12, 'Miranda', 1.41, 236, 3, 0.00001, 7, false);

INSERT INTO
  public.moon
VALUES
  (13, 'Ariel', 2.52, 578, 9, 0.00003, 7, false);

INSERT INTO
  public.moon
VALUES
  (14, 'Umbriel', 4.14, 584, 9, 0.00003, 7, false);

INSERT INTO
  public.moon
VALUES
  (15, 'Titania', 8.71, 789, 18, 0.00005, 7, false);

INSERT INTO
  public.moon
VALUES
  (16, 'Oberon', 13.46, 761, 14, 0.00003, 7, false);

INSERT INTO
  public.moon
VALUES
  (17, 'Triton', -5.88, 1353, 23, 0.00004, 8, false);

INSERT INTO
  public.moon
VALUES
  (
    18,
    'Nereid',
    360,
    170,
    0.15,
    0.0000003,
    8,
    false
  );

INSERT INTO
  public.moon
VALUES
  (
    19,
    'Proteus',
    1.12,
    210,
    2.5,
    0.0000004,
    8,
    false
  );

INSERT INTO
  public.moon
VALUES
  (
    20,
    'Larissa',
    0.55,
    96,
    1.1,
    0.0000001,
    8,
    false
  );

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.planet
VALUES
  (1, 'Mercury', 340, 0.055, 4879, 88, 59, 1, false);

INSERT INTO
  public.planet
VALUES
  (
    2,
    'Venus',
    737,
    0.815,
    12104,
    225,
    -243,
    1,
    false
  );

INSERT INTO
  public.planet
VALUES
  (3, 'Earth', 288, 1, 12742, 365.25, 1, 1, false);

INSERT INTO
  public.planet
VALUES
  (4, 'Mars', 210, 0.107, 6779, 687, 1, 1, false);

INSERT INTO
  public.planet
VALUES
  (
    5,
    'Jupiter',
    165,
    318,
    139820,
    4333,
    0,
    1,
    false
  );

INSERT INTO
  public.planet
VALUES
  (6, 'Saturn', 134, 95, 116460, 10759, 0, 1, false);

INSERT INTO
  public.planet
VALUES
  (7, 'Uranus', 76, 14, 50724, 30687, -1, 1, false);

INSERT INTO
  public.planet
VALUES
  (8, 'Neptune', 72, 17, 49244, 60190, 1, 1, false);

INSERT INTO
  public.planet
VALUES
  (9, 'Proxima b', 40, 1.3, 12000, 11, 7, 2, false);

INSERT INTO
  public.planet
VALUES
  (
    10,
    'Gliese 581g',
    35,
    2.2,
    14000,
    37,
    13,
    3,
    false
  );

INSERT INTO
  public.planet
VALUES
  (
    11,
    'Kepler-22b',
    22,
    5.4,
    22000,
    290,
    14,
    4,
    false
  );

INSERT INTO
  public.planet
VALUES
  (
    12,
    'TRAPPIST-1d',
    20,
    0.68,
    11000,
    5.1,
    4,
    5,
    false
  );

INSERT INTO
  public.planet
VALUES
  (
    13,
    'TRAPPIST-1e',
    15,
    0.92,
    12345,
    6.1,
    4,
    5,
    false
  );

INSERT INTO
  public.planet
VALUES
  (
    14,
    'HD 209458 b',
    1700,
    0.69,
    14320,
    3.5,
    2,
    6,
    false
  );

INSERT INTO
  public.planet
VALUES
  (15, 'K2-18b', 283, 2.1, 14400, 33, 9, 7, false);

INSERT INTO
  public.planet
VALUES
  (
    16,
    '55 Cancri e',
    2400,
    8,
    20630,
    18,
    17,
    8,
    false
  );

INSERT INTO
  public.planet
VALUES
  (
    17,
    'WASP-12b',
    2500,
    1.39,
    21000,
    26,
    9,
    9,
    false
  );

INSERT INTO
  public.planet
VALUES
  (18, 'Luyten b', 283, 2, 12000, 18, 17, 10, false);

INSERT INTO
  public.planet
VALUES
  (
    19,
    'Kapteyn b',
    200,
    1.2,
    15000,
    48,
    11,
    11,
    false
  );

INSERT INTO
  public.planet
VALUES
  (
    20,
    'HD 10180 g',
    480,
    1.8,
    12130,
    50,
    15,
    12,
    false
  );

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
  public.star
VALUES
  (1, 'Sun', 5778, 1, 'Yellow', 1, 1, 1);

INSERT INTO
  public.star
VALUES
  (
    2,
    'Proxima Centauri',
    3042,
    0,
    'Red',
    0.0017,
    0,
    2
  );

INSERT INTO
  public.star
VALUES
  (
    3,
    'Betelgeuse',
    3500,
    20,
    'Red',
    100000,
    1000,
    3
  );

INSERT INTO
  public.star
VALUES
  (4, 'Sirius', 9940, 2, 'White', 25, 2, 4);

INSERT INTO
  public.star
VALUES
  (5, 'Vega', 9600, 2, 'Blue', 40, 2, 5);

INSERT INTO
  public.star
VALUES
  (6, 'Rigel', 12100, 18, 'Blue', 85000, 70, 6);

INSERT INTO
  public.star
VALUES
  (
    7,
    'Alpha Centauri A',
    5790,
    1,
    'Yellow',
    1.52,
    1,
    7
  );

INSERT INTO
  public.star
VALUES
  (
    8,
    'Alpha Centauri B',
    5260,
    1,
    'Orange',
    0.5,
    1,
    7
  );

INSERT INTO
  public.star
VALUES
  (9, 'Aldebaran', 3910, 1, 'Orange', 518, 44, 8);

INSERT INTO
  public.star
VALUES
  (10, 'Antares', 3500, 12, 'Red', 100000, 700, 9);

INSERT INTO
  public.star
VALUES
  (11, 'Polaris', 6015, 5, 'Yellow', 2200, 30, 10);

INSERT INTO
  public.star
VALUES
  (
    12,
    'Barnards Star',
    3200,
    0,
    'Red',
    0.0004,
    0,
    11
  );

INSERT INTO
  public.star
VALUES
  (13, 'Arcturus', 4286, 1, 'Orange', 170, 25, 12);

INSERT INTO
  public.star
VALUES
  (14, 'Altair', 7550, 2, 'White', 11, 2, 13);

INSERT INTO
  public.star
VALUES
  (15, 'Deneb', 8500, 19, 'Blue', 200000, 200, 14);

INSERT INTO
  public.star
VALUES
  (16, 'Fomalhaut', 8590, 2, 'White', 16.6, 2, 15);

INSERT INTO
  public.star
VALUES
  (17, 'Spica', 22400, 11, 'Blue', 22000, 8, 16);

INSERT INTO
  public.star
VALUES
  (18, 'Capella', 4940, 3, 'Yellow', 78.7, 10, 17);

INSERT INTO
  public.star
VALUES
  (
    19,
    'Alnilam',
    25000,
    40,
    'Blue',
    375000,
    100,
    18
  );

INSERT INTO
  public.star
VALUES
  (20, 'Achernar', 15200, 7, 'Blue', 3150, 8, 19);

--
-- Name: characteristics_characteristics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval(
    'public.characteristics_characteristics_id_seq',
    20,
    true
  );

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.moon_moon_id_seq', 20, true);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.planet_planet_id_seq', 20, true);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
  pg_catalog.setval('public.star_star_id_seq', 20, true);

--
-- Name: characteristics characteristics_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.characteristics
ADD
  CONSTRAINT characteristics_name_key UNIQUE (name);

--
-- Name: characteristics characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.characteristics
ADD
  CONSTRAINT characteristics_pkey PRIMARY KEY (characteristics_id);

--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_name_key UNIQUE (name);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.galaxy
ADD
  CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_name_key UNIQUE (name);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_name_key UNIQUE (name);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_name_key UNIQUE (name);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: planet unique_planet_in_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT unique_planet_in_star UNIQUE (star_id, name);

--
-- Name: star unique_star_in_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT unique_star_in_galaxy UNIQUE (galaxy_id, name);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.moon
ADD
  CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;

--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.planet
ADD
  CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
  ONLY public.star
ADD
  CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;

--
-- PostgreSQL database dump complete
--