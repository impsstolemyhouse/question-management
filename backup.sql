--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: Option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Option" (
    id integer NOT NULL,
    value text NOT NULL,
    "questionId" integer NOT NULL
);


ALTER TABLE public."Option" OWNER TO postgres;

--
-- Name: Option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Option_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Option_id_seq" OWNER TO postgres;

--
-- Name: Option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Option_id_seq" OWNED BY public."Option".id;


--
-- Name: Question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Question" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "correctAnswer" text NOT NULL,
    "imageUrl" text,
    question text NOT NULL,
    solution text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Question" OWNER TO postgres;

--
-- Name: Question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Question_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Question_id_seq" OWNER TO postgres;

--
-- Name: Question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Question_id_seq" OWNED BY public."Question".id;


--
-- Name: Step; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Step" (
    id integer NOT NULL,
    title text NOT NULL,
    result text NOT NULL,
    "imageUrl" text,
    "questionId" integer NOT NULL
);


ALTER TABLE public."Step" OWNER TO postgres;

--
-- Name: Step_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Step_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Step_id_seq" OWNER TO postgres;

--
-- Name: Step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Step_id_seq" OWNED BY public."Step".id;


--
-- Name: Tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tag" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Tag" OWNER TO postgres;

--
-- Name: Tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tag_id_seq" OWNER TO postgres;

--
-- Name: Tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tag_id_seq" OWNED BY public."Tag".id;


--
-- Name: _QuestionTags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_QuestionTags" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_QuestionTags" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: Option id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Option" ALTER COLUMN id SET DEFAULT nextval('public."Option_id_seq"'::regclass);


--
-- Name: Question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Question" ALTER COLUMN id SET DEFAULT nextval('public."Question_id_seq"'::regclass);


--
-- Name: Step id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Step" ALTER COLUMN id SET DEFAULT nextval('public."Step_id_seq"'::regclass);


--
-- Name: Tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tag" ALTER COLUMN id SET DEFAULT nextval('public."Tag_id_seq"'::regclass);


--
-- Data for Name: Option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Option" (id, value, "questionId") FROM stdin;
189	<b><color=green>Jar 1</color></b>	44
190	<b><color=blue>Jar 2</color></b>	44
191	<b><color=orange>Jar 3</color></b>	44
192	<b><color=red>Jar 4</color></b>	44
193	<b><color=purple>Jar 5</color></b>	44
198	1	45
199	2	45
200	3	45
201	4	45
\.


--
-- Data for Name: Question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Question" (id, "createdAt", "correctAnswer", "imageUrl", question, solution, "updatedAt") FROM stdin;
44	2024-12-23 14:39:25.4	<b><color=green>Jar 1</color></b>	/uploads/1734964765338-952598021.png	<b>You have 5 jars of pills. Each pill weighs 10 grams, except for contaminated pills contained in one jar, where each pill weighs 9 grams. Given a scale, how could you tell which jar had the contaminated pills in just one measurement?</b>	<b>Step 1:</b> Take out <i>1</i> pill from jar 1, <i>2</i> pills from jar 2, <i>3</i> pills from jar 3, <i>4</i> pills from jar 4 and <i>5</i> pills from jar 5.\n<b>Step 2:</b> Put all these <i>15 pills</i> on the scale. The correct weight is <b><color=blue>150 (15*10)</color></b>. But one of the jars has contaminated pills. So the weight will definitely be less than <b>150</b>.\n<b>Step 3:</b> If the weight is <color=red>149</color> then jar <b><color=green>1</color></b> has contaminated pills because there is only <i>one contaminated pill</i>. If the weight is <color=red>148</color> then jar <b><color=green>2</color></b>, if the weight is <color=red>147</color> then jar <b><color=green>3</color></b>, if <color=red>146</color> then jar <b><color=green>4</color></b>, if <color=red>145</color> then jar <b><color=green>5</color></b>.	2024-12-23 14:39:25.4
45	2024-12-24 02:14:55.413	2	/uploads/1735006645284-587101109.jpeg	<b>How many <i>wires</i> do we need to measure <color=red>45 minutes</color>?</b>	<color=green><b>You need two wires</b> to measure exactly 45 minutes.</color> The first wire is lit from both ends, and the second wire is lit from one end. When the first wire burns out in 30 minutes, the second wire is lit from the other end to measure the remaining 15 minutes.	2024-12-24 02:17:25.29
\.


--
-- Data for Name: Step; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Step" (id, title, result, "imageUrl", "questionId") FROM stdin;
127	<b><color=blue>Step 1: Select pills from each jar</color></b>	Take <i>1</i> pill from jar 1, <i>2</i> pills from jar 2, <i>3</i> pills from jar 3, <i>4</i> pills from jar 4, and <i>5</i> pills from jar 5.	/uploads/1734964765342-27921749.png	44
128	<b><color=blue>Step 2: Weigh the pills</color></b>	Put all the pills on the scale. The weight should be <b>150 grams</b> if all pills are correct. Otherwise, the weight will be less.	\N	44
129	<b><color=blue>Step 3: Interpret the weight</color></b>	Based on the weight difference, identify the jar with contaminated pills.	/uploads/1734964765340-436548113.png	44
134	<b>Step 1: Light the Wires</b>	At <i>0 minutes</i>, light wire 1 from both sides and wire 2 from one side.	/uploads/1735006645284-863310850.jpeg	45
135	<b>Step 2: Wire 1 Burns Out</b>	After <color=blue>30 minutes</color>, wire 1 will be completely burnt out.	/uploads/1735006645285-793514431.jpeg	45
136	<b>Step 3: Light the Other End of Wire 2</b>	At <color=purple>30 minutes</color>, light the other end of wire 2.	/uploads/1735006645285-275515117.jpeg	45
137	<b>Step 4: Wire 2 Burns Out</b>	After <color=orange>15 minutes</color>, wire 2 will be completely burnt out, measuring a total of <color=red>45 minutes</color>.	/uploads/1735006645285-50906480.jpeg	45
\.


--
-- Data for Name: Tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tag" (id, name) FROM stdin;
17	Logic
18	Math
\.


--
-- Data for Name: _QuestionTags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_QuestionTags" ("A", "B") FROM stdin;
45	17
45	18
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
91b35ee6-b745-4fe2-83f8-4ed74f8ec650	0989d8a29e09838d11f44b568392546a8bb55ef4e9763fddc87808b262f435bf	2024-12-23 07:51:51.267377+00	20241223075151_init	\N	\N	2024-12-23 07:51:51.263539+00	1
e55d52ce-bc22-42e3-be93-553cf60ed611	a76cba5300cc741afd470aedb88f050ad712727c61922e61d86126de3c4f7d1b	2024-12-23 08:17:18.582243+00	20241223081718_add_questions_steps_tags	\N	\N	2024-12-23 08:17:18.574949+00	1
2e55d749-47ea-4c8f-9652-5bfe64053810	dab2bbc14469c2177d962592bfe41919c30d25ee99bac5e67d0f9e330a6d5153	2024-12-23 10:42:53.814401+00	20241223104253_add_cascade_delete	\N	\N	2024-12-23 10:42:53.810261+00	1
0ad2fb1f-1006-4bf5-9b1e-22a695df3ff0	692b125af1cbd7122f064700de4e27d9e57696feb20e65d699485900abef23ea	2024-12-23 11:29:32.845294+00	20241223112932_remove_tags_cascade_delete	\N	\N	2024-12-23 11:29:32.841039+00	1
7832cb7f-b036-4522-a88b-483492e46c08	7f7ca2c6c2655b87250f40e4ae6c3973ca59fcd2c92d58d2e33cbd35b4d8f1c5	2024-12-23 11:36:39.390189+00	20241223113639_add_tags_name_unique	\N	\N	2024-12-23 11:36:39.387172+00	1
a5198fe2-79fd-4cc8-a840-1c82359d009a	c9e63815fb78585276e1f31ad53403ae959c804a75f30da6116d06bac84fc084	2024-12-23 11:52:39.064569+00	20241223115239_add_tags_relation_to_question	\N	\N	2024-12-23 11:52:39.059432+00	1
\.


--
-- Name: Option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Option_id_seq"', 201, true);


--
-- Name: Question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Question_id_seq"', 45, true);


--
-- Name: Step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Step_id_seq"', 137, true);


--
-- Name: Tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tag_id_seq"', 18, true);


--
-- Name: Option Option_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Option"
    ADD CONSTRAINT "Option_pkey" PRIMARY KEY (id);


--
-- Name: Question Question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Question"
    ADD CONSTRAINT "Question_pkey" PRIMARY KEY (id);


--
-- Name: Step Step_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Step"
    ADD CONSTRAINT "Step_pkey" PRIMARY KEY (id);


--
-- Name: Tag Tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "Tag_pkey" PRIMARY KEY (id);


--
-- Name: _QuestionTags _QuestionTags_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_QuestionTags"
    ADD CONSTRAINT "_QuestionTags_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Tag_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Tag_name_key" ON public."Tag" USING btree (name);


--
-- Name: _QuestionTags_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_QuestionTags_B_index" ON public."_QuestionTags" USING btree ("B");


--
-- Name: Option Option_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Option"
    ADD CONSTRAINT "Option_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Step Step_questionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Step"
    ADD CONSTRAINT "Step_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES public."Question"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _QuestionTags _QuestionTags_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_QuestionTags"
    ADD CONSTRAINT "_QuestionTags_A_fkey" FOREIGN KEY ("A") REFERENCES public."Question"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _QuestionTags _QuestionTags_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_QuestionTags"
    ADD CONSTRAINT "_QuestionTags_B_fkey" FOREIGN KEY ("B") REFERENCES public."Tag"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

