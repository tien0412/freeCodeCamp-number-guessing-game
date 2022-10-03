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
    user_id integer NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (95, 2, 555);
INSERT INTO public.games VALUES (94, 5, 187);
INSERT INTO public.games VALUES (116, 2, 371);
INSERT INTO public.games VALUES (115, 5, 236);
INSERT INTO public.games VALUES (98, 2, 906);
INSERT INTO public.games VALUES (97, 5, 62);
INSERT INTO public.games VALUES (118, 2, 487);
INSERT INTO public.games VALUES (100, 2, 298);
INSERT INTO public.games VALUES (99, 5, 274);
INSERT INTO public.games VALUES (117, 5, 41);
INSERT INTO public.games VALUES (102, 2, 264);
INSERT INTO public.games VALUES (101, 5, 43);
INSERT INTO public.games VALUES (120, 2, 519);
INSERT INTO public.games VALUES (104, 2, 791);
INSERT INTO public.games VALUES (119, 5, 34);
INSERT INTO public.games VALUES (103, 5, 16);
INSERT INTO public.games VALUES (96, 4, 9);
INSERT INTO public.games VALUES (106, 2, 433);
INSERT INTO public.games VALUES (105, 5, 23);
INSERT INTO public.games VALUES (122, 2, 168);
INSERT INTO public.games VALUES (108, 2, 424);
INSERT INTO public.games VALUES (121, 5, 144);
INSERT INTO public.games VALUES (107, 5, 58);
INSERT INTO public.games VALUES (110, 2, 626);
INSERT INTO public.games VALUES (109, 5, 4);
INSERT INTO public.games VALUES (124, 2, 471);
INSERT INTO public.games VALUES (112, 2, 848);
INSERT INTO public.games VALUES (123, 5, 10);
INSERT INTO public.games VALUES (111, 5, 223);
INSERT INTO public.games VALUES (114, 2, 100);
INSERT INTO public.games VALUES (126, 2, 57);
INSERT INTO public.games VALUES (113, 5, 41);
INSERT INTO public.games VALUES (125, 5, 81);
INSERT INTO public.games VALUES (128, 2, 310);
INSERT INTO public.games VALUES (127, 5, 107);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (94, 'user_1664821449690');
INSERT INTO public.users VALUES (95, 'user_1664821449689');
INSERT INTO public.users VALUES (96, 'Tien');
INSERT INTO public.users VALUES (97, 'user_1664821589517');
INSERT INTO public.users VALUES (98, 'user_1664821589516');
INSERT INTO public.users VALUES (99, 'user_1664821675437');
INSERT INTO public.users VALUES (100, 'user_1664821675436');
INSERT INTO public.users VALUES (101, 'user_1664822067265');
INSERT INTO public.users VALUES (102, 'user_1664822067264');
INSERT INTO public.users VALUES (103, 'user_1664822169000');
INSERT INTO public.users VALUES (104, 'user_1664822168999');
INSERT INTO public.users VALUES (105, 'user_1664822189667');
INSERT INTO public.users VALUES (106, 'user_1664822189666');
INSERT INTO public.users VALUES (107, 'user_1664822205727');
INSERT INTO public.users VALUES (108, 'user_1664822205726');
INSERT INTO public.users VALUES (109, 'user_1664822210083');
INSERT INTO public.users VALUES (110, 'user_1664822210082');
INSERT INTO public.users VALUES (111, 'user_1664822214160');
INSERT INTO public.users VALUES (112, 'user_1664822214159');
INSERT INTO public.users VALUES (113, 'user_1664822222324');
INSERT INTO public.users VALUES (114, 'user_1664822222323');
INSERT INTO public.users VALUES (115, 'user_1664822402842');
INSERT INTO public.users VALUES (116, 'user_1664822402841');
INSERT INTO public.users VALUES (117, 'user_1664822409333');
INSERT INTO public.users VALUES (118, 'user_1664822409332');
INSERT INTO public.users VALUES (119, 'user_1664822415721');
INSERT INTO public.users VALUES (120, 'user_1664822415720');
INSERT INTO public.users VALUES (121, 'user_1664822511017');
INSERT INTO public.users VALUES (122, 'user_1664822511016');
INSERT INTO public.users VALUES (123, 'user_1664822517145');
INSERT INTO public.users VALUES (124, 'user_1664822517144');
INSERT INTO public.users VALUES (125, 'user_1664822522102');
INSERT INTO public.users VALUES (126, 'user_1664822522101');
INSERT INTO public.users VALUES (127, 'user_1664822526961');
INSERT INTO public.users VALUES (128, 'user_1664822526960');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 128, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

