--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-03-02 09:30:14 NST

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
-- TOC entry 214 (class 1259 OID 24758)
-- Name: aircraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    type character varying(225) NOT NULL,
    airline_name character varying(225) NOT NULL,
    weight_kg bigint NOT NULL,
    number_of_passenger bigint NOT NULL
);


ALTER TABLE public.aircraft OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24761)
-- Name: aircraft_takeoff_land; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircraft_takeoff_land (
    aircraft_id bigint NOT NULL,
    airport_id bigint NOT NULL
);


ALTER TABLE public.aircraft_takeoff_land OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24764)
-- Name: airport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airport (
    id bigint NOT NULL,
    airport_name character varying(225) NOT NULL,
    area_code bigint NOT NULL,
    postal_code character varying(10) NOT NULL,
    city_id bigint NOT NULL
);


ALTER TABLE public.airport OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24767)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id bigint NOT NULL,
    city_name character varying(225) NOT NULL,
    province character varying(225) NOT NULL,
    population bigint NOT NULL,
    number_of_airports bigint NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24770)
-- Name: passenger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger (
    id bigint NOT NULL,
    first_name character varying(225) NOT NULL,
    last_name character varying(225) NOT NULL,
    age bigint NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(225)
);


ALTER TABLE public.passenger OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24775)
-- Name: passenger_aircraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger_aircraft (
    passenger_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);


ALTER TABLE public.passenger_aircraft OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24778)
-- Name: passenger_airport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger_airport (
    passenger_id bigint NOT NULL,
    airport_id bigint NOT NULL
);


ALTER TABLE public.passenger_airport OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24781)
-- Name: passenger_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passenger_city (
    passenger_id bigint NOT NULL,
    city_id bigint NOT NULL
);


ALTER TABLE public.passenger_city OWNER TO postgres;

--
-- TOC entry 3625 (class 0 OID 24758)
-- Dependencies: 214
-- Data for Name: aircraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aircraft (id, type, airline_name, weight_kg, number_of_passenger) FROM stdin;
2	AirBus A330	air canada	401000	424
3	boeing 777	west jet	168560	224
4	AirBus A340	air canada	368000	400
5	AirBus A550	west jet	168000	190
6	BlackBird 87	air canada	100000	100
7	RedBird 88	air canada	150000	150
8	AirBus AAAA	west jet	568000	600
9	BlackHawk	air canada	50000	30
10	BlackBee A30	west jet	180000	100
1	boeing 47-8	est jet	42770	24
\.


--
-- TOC entry 3626 (class 0 OID 24761)
-- Dependencies: 215
-- Data for Name: aircraft_takeoff_land; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aircraft_takeoff_land (aircraft_id, airport_id) FROM stdin;
1	1
1	2
1	3
2	2
2	3
3	1
3	2
3	3
4	1
6	1
6	2
6	3
6	4
6	5
7	6
7	7
7	8
7	9
8	9
8	8
9	1
9	2
9	3
9	4
10	9
10	8
\.


--
-- TOC entry 3627 (class 0 OID 24764)
-- Dependencies: 216
-- Data for Name: airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airport (id, airport_name, area_code, postal_code, city_id) FROM stdin;
1	Lucky airport	709	A0A1G0	1
2	Wave airport	805	B0X1Z0	2
3	Tempa airport	609	B0X1X0	2
4	Airrie airport	0	A2VXZ0	3
5	SouthPark airport	1	B0X1T2	3
6	Flyer airport	404	Q1S5Y9	4
7	French airport	604	B1S5Y9	4
8	Teryhigh airport	777	R5TSQ0	5
9	Flatland airport	557	E4X0D2	6
10	Mayweather airport	667	R5TSQ6	6
11	Teryhigh airport	777	R5TSQ0	7
12	Grand airport	113	R5R4Q0	8
13	Dread airport	555	C3X50H	9
14	Mercy airport	432	E4F5C0	9
\.


--
-- TOC entry 3628 (class 0 OID 24767)
-- Dependencies: 217
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, city_name, province, population, number_of_airports) FROM stdin;
1	St.John's	Newfoundland	1131948	1
2	Toronto	Ontario	2930000	2
3	Ottawa	Ontario	1423000	2
4	Montreal	Quebec	2000000	2
5	Quebec City	Quebec	520000	1
6	Edmonton	Alberta	1519000	2
7	Calgary	Alberta	1611000	1
8	Grande Prairie	Alberta	67669	1
9	Vancouver	British Columbia	2632000	2
\.


--
-- TOC entry 3629 (class 0 OID 24770)
-- Dependencies: 218
-- Data for Name: passenger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passenger (id, first_name, last_name, age, phone_number, email) FROM stdin;
1	kyle	snow	24	709-683-6666	Klyes@keyin.com
2	Tyler	Power	26	709-555-6226	Tylerp@keyin.com
3	Ken	Chafe	30	701-875-6754	kenc@keyin.com
4	Sarah	Mercer	21	796-853-6556	Sarahm@keyin.com
5	Gary	Dover	17	788-223-5436	GaryB@keyin.com
6	Frank	Rave	44	098-893-9999	Ffraanky@keyin.com
7	Sam	Mercer	46	196-663-1221	Sammy@keyin.com
8	Kate	port	26	888-657-2256	katte@keyin.com
9	Max	Driver	21	666-555-6557	Mamxm@keyin.com
10	Arthur	Dawe	21	996-613-6006	Arth@keyin.com
\.


--
-- TOC entry 3630 (class 0 OID 24775)
-- Dependencies: 219
-- Data for Name: passenger_aircraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passenger_aircraft (passenger_id, aircraft_id) FROM stdin;
1	1
1	2
1	3
1	4
2	1
2	4
3	1
4	2
4	3
4	4
5	1
5	2
5	3
5	4
5	7
5	10
6	6
7	8
7	2
7	1
8	9
9	10
9	1
9	3
9	4
10	9
10	5
\.


--
-- TOC entry 3631 (class 0 OID 24778)
-- Dependencies: 220
-- Data for Name: passenger_airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passenger_airport (passenger_id, airport_id) FROM stdin;
1	1
1	2
1	5
1	6
2	1
2	5
3	14
3	13
3	12
3	4
3	9
4	7
4	8
4	10
5	11
5	1
6	13
6	14
6	2
6	3
7	4
7	5
8	11
8	10
8	9
9	1
9	2
10	7
10	8
\.


--
-- TOC entry 3632 (class 0 OID 24781)
-- Dependencies: 221
-- Data for Name: passenger_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passenger_city (passenger_id, city_id) FROM stdin;
1	1
2	1
3	2
4	4
5	1
6	4
7	7
8	5
9	5
10	8
\.


--
-- TOC entry 3467 (class 2606 OID 24785)
-- Name: aircraft aircraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);


--
-- TOC entry 3469 (class 2606 OID 24787)
-- Name: airport airport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airport_pkey PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 24789)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 3473 (class 2606 OID 24791)
-- Name: passenger passenger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);


--
-- TOC entry 3477 (class 2606 OID 24792)
-- Name: passenger_aircraft aircraft_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);


--
-- TOC entry 3474 (class 2606 OID 24797)
-- Name: aircraft_takeoff_land aircraft_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircraft_takeoff_land
    ADD CONSTRAINT aircraft_fk FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id);


--
-- TOC entry 3475 (class 2606 OID 24802)
-- Name: aircraft_takeoff_land airport_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircraft_takeoff_land
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id);


--
-- TOC entry 3479 (class 2606 OID 24807)
-- Name: passenger_airport airport_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT airport_fk FOREIGN KEY (airport_id) REFERENCES public.airport(id);


--
-- TOC entry 3476 (class 2606 OID 24812)
-- Name: airport city_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.city(id) NOT VALID;


--
-- TOC entry 3481 (class 2606 OID 24817)
-- Name: passenger_city city_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_city
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES public.city(id);


--
-- TOC entry 3482 (class 2606 OID 24822)
-- Name: passenger_city passenger_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_city
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);


--
-- TOC entry 3478 (class 2606 OID 24827)
-- Name: passenger_aircraft passenger_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_aircraft
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);


--
-- TOC entry 3480 (class 2606 OID 24832)
-- Name: passenger_airport passenger_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passenger_airport
    ADD CONSTRAINT passenger_fk FOREIGN KEY (passenger_id) REFERENCES public.passenger(id);


-- Completed on 2023-03-02 09:30:15 NST

--
-- PostgreSQL database dump complete
--

