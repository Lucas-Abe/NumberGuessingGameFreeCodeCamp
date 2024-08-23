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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_of_guesses integer NOT NULL,
    user_id integer NOT NULL,
    secret_number integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_user_id_seq OWNER TO freecodecamp;

--
-- Name: players_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.players_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 7, 541);
INSERT INTO public.games VALUES (2, 12, 7, 586);
INSERT INTO public.games VALUES (3, 242, 10, 241);
INSERT INTO public.games VALUES (4, 923, 10, 922);
INSERT INTO public.games VALUES (5, 202, 11, 201);
INSERT INTO public.games VALUES (6, 838, 11, 837);
INSERT INTO public.games VALUES (7, 533, 10, 530);
INSERT INTO public.games VALUES (8, 917, 10, 915);
INSERT INTO public.games VALUES (9, 96, 10, 95);
INSERT INTO public.games VALUES (10, 5, 12, 992);
INSERT INTO public.games VALUES (11, 5, 7, 829);
INSERT INTO public.games VALUES (12, 316, 18, 315);
INSERT INTO public.games VALUES (13, 326, 18, 325);
INSERT INTO public.games VALUES (14, 499, 19, 498);
INSERT INTO public.games VALUES (15, 306, 19, 305);
INSERT INTO public.games VALUES (16, 944, 18, 941);
INSERT INTO public.games VALUES (17, 54, 18, 52);
INSERT INTO public.games VALUES (18, 764, 18, 763);
INSERT INTO public.games VALUES (19, 780, 20, 779);
INSERT INTO public.games VALUES (20, 380, 20, 379);
INSERT INTO public.games VALUES (21, 954, 21, 953);
INSERT INTO public.games VALUES (22, 328, 21, 327);
INSERT INTO public.games VALUES (23, 275, 20, 272);
INSERT INTO public.games VALUES (24, 641, 20, 639);
INSERT INTO public.games VALUES (25, 227, 20, 226);
INSERT INTO public.games VALUES (26, 872, 22, 871);
INSERT INTO public.games VALUES (27, 276, 22, 275);
INSERT INTO public.games VALUES (28, 831, 23, 830);
INSERT INTO public.games VALUES (29, 797, 23, 796);
INSERT INTO public.games VALUES (30, 341, 22, 338);
INSERT INTO public.games VALUES (31, 967, 22, 965);
INSERT INTO public.games VALUES (32, 879, 22, 878);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('', 1);
INSERT INTO public.players VALUES ('', 2);
INSERT INTO public.players VALUES ('', 3);
INSERT INTO public.players VALUES ('', 4);
INSERT INTO public.players VALUES ('', 5);
INSERT INTO public.players VALUES ('', 6);
INSERT INTO public.players VALUES ('Abe', 7);
INSERT INTO public.players VALUES ('user_1724430972448', 8);
INSERT INTO public.players VALUES ('user_1724430972447', 9);
INSERT INTO public.players VALUES ('user_1724431365583', 10);
INSERT INTO public.players VALUES ('user_1724431365582', 11);
INSERT INTO public.players VALUES ('Lucas', 12);
INSERT INTO public.players VALUES ('L', 13);
INSERT INTO public.players VALUES ('user_1724431694338', 14);
INSERT INTO public.players VALUES ('user_1724431694337', 15);
INSERT INTO public.players VALUES ('aBE', 16);
INSERT INTO public.players VALUES ('Aber', 17);
INSERT INTO public.players VALUES ('user_1724431918036', 18);
INSERT INTO public.players VALUES ('user_1724431918035', 19);
INSERT INTO public.players VALUES ('user_1724432017241', 20);
INSERT INTO public.players VALUES ('user_1724432017240', 21);
INSERT INTO public.players VALUES ('user_1724432203661', 22);
INSERT INTO public.players VALUES ('user_1724432203660', 23);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: players_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_user_id_seq', 23, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

