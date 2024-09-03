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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1725337714073', 0, 0);
INSERT INTO public.players VALUES ('user_1725337714072', 0, 0);
INSERT INTO public.players VALUES ('user_1725339024211', 0, 0);
INSERT INTO public.players VALUES ('user_1725339024210', 0, 0);
INSERT INTO public.players VALUES ('user_1725339072584', 0, 0);
INSERT INTO public.players VALUES ('user_1725339072583', 0, 0);
INSERT INTO public.players VALUES ('user_1725339986888', 2, 455);
INSERT INTO public.players VALUES ('user_1725340510031', 2, 448);
INSERT INTO public.players VALUES ('user_1725339986889', 4, 486);
INSERT INTO public.players VALUES ('user_1725340121664', 1, 90);
INSERT INTO public.players VALUES ('user_1725340510032', 5, 2);
INSERT INTO public.players VALUES ('user_1725340121665', 3, 169);
INSERT INTO public.players VALUES ('user_1725340872728', 2, 437);
INSERT INTO public.players VALUES ('user_1725340180293', 2, 319);
INSERT INTO public.players VALUES ('user_1725340180294', 4, 92);
INSERT INTO public.players VALUES ('user_1725340872729', 5, 125);
INSERT INTO public.players VALUES ('user_1725340538254', 2, 68);
INSERT INTO public.players VALUES ('user_1725340387814', 2, 176);
INSERT INTO public.players VALUES ('user_1725340538255', 5, 9);
INSERT INTO public.players VALUES ('user_1725340387815', 5, 81);
INSERT INTO public.players VALUES ('user_1725340897246', 2, 276);
INSERT INTO public.players VALUES ('user_1725340439472', 2, 801);
INSERT INTO public.players VALUES ('user_1725340578162', 2, 68);
INSERT INTO public.players VALUES ('user_1725340897247', 5, 12);
INSERT INTO public.players VALUES ('user_1725340439473', 5, 330);
INSERT INTO public.players VALUES ('user_1725340578163', 5, 365);
INSERT INTO public.players VALUES ('Atif', 4, 7);
INSERT INTO public.players VALUES ('user_1725340474812', 2, 455);
INSERT INTO public.players VALUES ('user_1725340474813', 5, 137);
INSERT INTO public.players VALUES ('user_1725340683332', 2, 200);
INSERT INTO public.players VALUES ('user_1725340683333', 5, 440);
INSERT INTO public.players VALUES ('user_1725340695451', 2, 216);
INSERT INTO public.players VALUES ('user_1725340695452', 5, 226);
INSERT INTO public.players VALUES ('user_1725340730240', 2, 246);
INSERT INTO public.players VALUES ('user_1725340730241', 5, 240);


--
-- Name: players player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT player_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

