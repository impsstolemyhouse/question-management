--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Ubuntu 14.15-0ubuntu0.22.04.1)
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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

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
1	3/4	1
2	1/2	1
3	1/4	1
4	1/8	1
5	True	2
6	False	2
7	$100	3
8	$400	3
9	$500	3
10	$600	3
11	60	4
12	66.67	4
13	75	4
14	80	4
15	25000 km	5
16	20000 km	5
17	15000 km	5
18	10000 km	5
19	True	6
20	False	6
21	2, 3, 5 are invalid	7
22	N = 4 is valid	7
23	N > 4 (even) is valid	7
24	N > 5 (odd) is valid	7
25	1 measurement	8
26	2 measurements	8
27	3 measurements	8
28	5 measurements	8
29	1	9
30	2	9
31	3	9
32	4	9
33	3/4	10
34	1/2	10
35	2/3	10
36	1	10
37	20	11
38	22	11
39	25	11
40	18	11
41	16	12
42	11	12
43	22	12
44	7	12
45	Yes, switch	13
46	No, don't switch	13
51	12 minutes	14
52	15 minutes	14
53	17 minutes	14
54	21 minutes	14
\.


--
-- Data for Name: Question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Question" (id, "createdAt", "correctAnswer", "imageUrl", question, solution, "updatedAt") FROM stdin;
1	2024-12-25 13:51:15.969	3/4	\N	<b><color=black>There are 3 ants sitting on three corners of a triangle.</color></b> <i><color=blue>All ants randomly pick a direction and start moving along the edges of the triangle.</color></i> <u><color=purple>What is the probability that any two ants collide?</color></u>	<color=green>The probability of collision depends on the possible movements of the ants:</color> <color=blue>There are 8 total movement combinations for the ants, as each has two choices of direction. Out of these, only 2 cases (all moving clockwise or counterclockwise) do not lead to a collision.</color> <b>Thus, the probability of collision is:</b> <color=red>P(Collision) = (8 - 2)/8 = 3/4.</color>	2024-12-25 13:51:15.969
2	2024-12-25 13:52:48.348	True	\N	<b><color=black>Puzzle:</color></b> <i><color=blue>You have a birthday cake and have to cut it into 8 equal pieces by making 3 cuts only. Can this be done?</color></i>	<color=green>Yes, this can be achieved using a stacking method.</color> <b><color=black>First, cut the cake into quarters using two perpendicular cuts through the center.</color></b> <i>Then stack all 4 pieces and make a horizontal cut through the stack, resulting in 8 equal pieces.</i>	2024-12-25 13:52:48.348
3	2024-12-25 13:53:13.267	$500	\N	A Lady (L) bought an item of $100 from the Shopkeeper (C). She paid him through a $500 note. Realizing that he did not have change, the shopkeeper C got change for that note from another shopkeeper (S) and paid $400 to the Lady.\n\nAfter a few days, S realized that the note is fake, and railed at C and took $500 back from him.\n\nSo in this whole process how much money did C lose in the end?	<color=green><b>Answer: $500</b></color>\n\nShopkeeper C lost $500. The lady took $100 worth of items and $400 in change from C, using a counterfeit $500 note. S lost no money, but C had to repay $500 when S realized the note was fake.	2024-12-25 13:53:13.267
4	2024-12-25 13:54:03.772	66.67	/uploads/1735134843768-725601202.png	<b><i>Two trains</i> are on the same track and are coming toward each other.</b> The speed of the first train is <color=red>50 km/h</color> and the speed of the second train is <color=blue>70 km/h</color>. A bee starts flying between the trains when the distance between the two trains is <color=green>100 km</color>. The bee first flies from the first train to the second train. Once it reaches the second train, it immediately flies back to the first train … and so on until the trains collide. <b>Calculate the total distance travelled by the bee.</b> The speed of the bee is <color=orange>80 km/h</color>.	<color=green><b>We can solve this using the concept of relative velocity.</b></color>\n\nWith respect to Train A, Train B’s velocity is the sum of both their velocities, i.e., <color=blue>(70 + 50) = 120 km/hr</color>. Thus, the time taken by Train B to collide with Train A is:\n\n<code>(100 km) / (120 km/hr) = 5/6 hr = 50 min</code>\n\nNow, since the velocity of the bee is <color=orange>80 km/hr</color>, the distance travelled by the bee in this time interval will be:\n\n<code>80 km/hr * 5/6 hr = 66.67 km (approx)</code>\n\n<b>Key Point:</b>\nThe bee keeps travelling from one train to another, as its speed is greater than both train's speeds. Thus, we only need to find the time it takes for both the trains to collide, and this time is the same as the time the bee is flying. Therefore, the point at which the trains collide is irrelevant.	2024-12-25 13:54:03.772
5	2024-12-25 13:55:20.223	25000 km	/uploads/1735134920216-7790262.png	<b><i>A car has 4 tyres and 1 spare tyre.</i> Each tyre can travel a maximum distance of <color=blue>20000 km</color> before wearing off. What is the maximum distance the car can travel before you are forced to buy a new tyre?</b>\n\nYou are allowed to change tyres (using the spare tyre) an unlimited number of times. What is the maximum distance the car can travel?	<color=green><b>Maximum distance is 25000 km.</b></color>\n\nTo achieve this, you need to divide the lifetime of the spare tyre into 4 equal parts (5000 km) and swap it at each completion of 5000 km.\n\n<b>Step 1:</b> After 5000 km, replace tyre A with spare S. The remaining distances: A (15000), B (15000), C (15000), D (15000), S (20000).\n\n<b>Step 2:</b> After 10000 km, replace tyre B with spare S. The remaining distances: A (15000), B (10000), C (10000), D (10000), S (15000).\n\n<b>Step 3:</b> After 15000 km, replace tyre C with spare S. The remaining distances: A (10000), B (10000), C (5000), D (5000), S (10000).\n\n<b>Step 4:</b> After 20000 km, replace tyre D with spare S. The remaining distances: A (5000), B (5000), C (5000), D (0), S (5000).\n\n<b>Step 5:</b> After 25000 km, all tyres will be worn out completely.	2024-12-25 13:55:20.223
6	2024-12-25 13:55:47.085	False	/uploads/1735134947083-858855421.png	<b><color=black>Problem:</color></b> <i><color=blue>There is an 8 by 8 chessboard in which two diagonally opposite corners have been cut off. Can you use 31 dominos to cover the entire board?</color></i>	<color=green>No, it is not possible.</color> <b><color=black>Each domino covers one black and one white square.</color></b> <i>After removing two opposite corners, the board will have an unequal number of black and white squares, making it impossible to cover with dominos.</i>	2024-12-25 13:55:47.085
7	2024-12-25 13:56:30.35	N = 4 is valid	\N	Find all values of N for which one can dissect a square into N smaller squares, and outline an algorithm for doing such a dissection.	<color=green>The basic point to observe is a square has 4 right-angles.</color> To divide it into smaller squares, each of its right-angles must fall into another square. This ensures that no non-square figures are created. The solution is structured into the following steps:	2024-12-25 13:56:30.35
8	2024-12-25 13:57:00.49	1 measurement	/uploads/1735135020487-984649440.png	You have 5 jars of pills. Each pill weighs 10 grams, except for contaminated pills contained in one jar, where each pill weighs 9 grams. Given a scale, what is the minimum step to find which jar had the contaminated pills in just one measurement?	<color=green><b>Answer: 1 measurement</b></color>\n\nStep 1: Take out 1 pill from jar 1, 2 pills from jar 2, 3 pills from jar 3, 4 pills from jar 4, and 5 pills from jar 5.\nStep 2: Put all these 15 pills on the scale. The correct weight is 150 grams (15*10). But since one jar contains contaminated pills, the weight will be less than 150 grams.\nStep 3: If the weight is 149 grams, jar 1 has the contaminated pills; if it’s 148 grams, jar 2 has them, and so on. The difference from 150 grams will tell you which jar is contaminated.	2024-12-25 13:57:00.49
9	2024-12-25 13:57:43.54	2	/uploads/1735135063537-166569289.jpeg	<b>How many <i>wires</i> do we need to measure <color=red>45 minutes</color>?</b>	<color=green><b>You need two wires</b> to measure exactly 45 minutes.</color> The first wire is lit from both ends, and the second wire is lit from one end. When the first wire burns out in 30 minutes, the second wire is lit from the other end to measure the remaining 15 minutes.	2024-12-25 13:57:43.54
10	2024-12-25 13:57:57.755	3/4	\N	<b><i>There are two empty bowls in a room.</i> You have 50 white balls and 50 black balls.</b>\n\nAfter you place the balls in the bowls, a random ball will be picked from a random bowl.\n\nDistribute the balls (all of them) into the bowls to <color=green>maximize the chance</color> of picking a white ball. What is the maximum probability of picking a white ball?	<color=green><b>Maximum probability is approximately 3/4 (0.747).</b></color>\n\nTo maximize the chance of picking a white ball, you should:\n\n<b>Step 1:</b> Place <color=blue>49 white balls</color> and <color=blue>50 black balls</color> in the first bowl.\n\n<b>Step 2:</b> Place <color=blue>1 white ball</color> and <color=blue>49 black balls</color> in the second bowl.\n\n<b>Step 3:</b> The probability becomes: \n\n<color=blue>1/2 * (49/99) + 1/2 * 1 = 0.747</color>	2024-12-25 13:57:57.755
11	2024-12-25 13:58:07.085	22	\N	<b><i>You have 15 $ with you.</i> You go to a shop and the shopkeeper tells you the price is <color=blue>1 $ per chocolate</color>. He also tells you that you can get a chocolate in return for <color=blue>3 wrappers</color>.</b>\n\nHow many maximum chocolates can you eat?	<color=green><b>Maximum chocolates you can eat is 22.</b></color>\n\n<b>Step 1:</b> Buy and eat <color=blue>15 chocolates</color> with your 15 $.\n\n<b>Step 2:</b> Return the 15 wrappers and get <color=blue>5 more chocolates</color>.\n\n<b>Step 3:</b> Return 3 wrappers and get <color=blue>1 chocolate</color>. Keep the remaining 2 wrappers.\n\n<b>Step 4:</b> Now you have 3 wrappers. Return these 3 and get <color=blue>1 more chocolate</color>.\n\n<b>Total chocolates:</b> 15 (initial) + 5 (from wrappers) + 1 (from 3 wrappers) + 1 (from 3 wrappers) = 22.	2024-12-25 13:58:07.085
12	2024-12-25 14:00:09.623	22	/uploads/1735135209618-407124580.jpg	<b>Given a <i>Circle</i> and <color=red>Six Straight Lines</color>.</b> What is the maximum number of pieces that one can cut the circle using these six straight lines?	<color=green><b>Using six lines</b>, the circle can be divided into a maximum of <u>22 pieces</u>.</color> This can be determined by adding lines one at a time, with each new line increasing the number of pieces, following a predictable pattern.	2024-12-25 14:00:09.623
13	2024-12-25 14:00:38.951	Yes, switch	/uploads/1735135238949-283660880.png	<b><i>Suppose you're on a game show</i>, and you're given the choice of three doors:</b>\nBehind one door is a <color=green>car</color>; behind the others, <color=red>goats</color>. You pick a door, say <b>No. 1</b>, and the host, who knows what's behind the doors, opens another door, say <b>No. 3</b>, which has a <color=red>goat</color>. He then says to you, <i>“Do you want to pick door No. 2?”</i>\nIs it to your advantage to switch your choice?	<color=green><b>Yes, it is to your advantage to switch.</b></color>\n\nBy switching, you have a <color=blue>2/3</color> chance of winning the car because the host will always reveal a goat, leaving the remaining door with the car. If you don’t switch, the probability is only <color=blue>1/3</color>.	2024-12-25 14:00:38.951
14	2024-12-25 14:01:18.557	15 minutes	/uploads/1735135348075-851915772.png	<b><i>There are 4 persons</i> (A, B, C, and D) who want to cross a bridge at night.</b>\n\nA takes <color=blue>1 minute</color> to cross, B takes <color=blue>2 minutes</color>, C takes <color=blue>5 minutes</color>, and D takes <color=blue>8 minutes</color>.\nThere is only one torch and the bridge cannot be crossed without it. No more than two persons can be on the bridge at the same time, and they must move at the slower person’s pace.\nWhat is the <color=red>minimum time</color> in which they can all cross the bridge?	<color=green><b>The minimum time is 15 minutes.</b></color>\n\nHere’s how they can do it:\n\n<b>Step 1:</b> A and B cross together. A comes back. Time taken: <color=blue>3 minutes</color>.\n\n<b>Step 2:</b> C and D cross together. B comes back. Time taken: <color=blue>10 minutes</color>.\n\n<b>Step 3:</b> A and B cross together. Time taken: <color=blue>2 minutes</color>.\n\n<b>Total time:</b> <color=red>3 + 10 + 2 = 15 minutes</color>.	2024-12-25 14:02:28.08
\.


--
-- Data for Name: Step; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Step" (id, title, result, "imageUrl", "questionId") FROM stdin;
1	<b><color=black>Step 1:</color></b> Total possibilities	Each ant has 2 choices: move along one of the two edges from its corner. Hence, there are 2<sup>3</sup> = 8 total possibilities.	\N	1
2	<b><color=black>Step 2:</color></b> Non-collision cases	The two non-collision cases are:\n1) All ants move in a <u>counterclockwise</u> direction.\n2) All ants move in a <u>clockwise</u> direction.	/uploads/1735134675964-739369069.png	1
3	<b><color=black>Step 3:</color></b> Calculate probability	<color=red>Out of 8 possibilities, 6 involve collisions.</color> Thus, P(Collision) = 6/8 = 3/4, and P(Non-collision) = 2/8 = 1/4.	/uploads/1735134675965-890103184.png	1
4	<b><color=black>Step 1:</color></b> Cut into quarters	<i>Make two perpendicular cuts through the center of the cake, dividing it into 4 equal quarters.</i>	/uploads/1735134768341-511313780.png	2
5	<b><color=black>Step 2:</color></b> Stack the pieces	<i>Arrange the 4 quarters into a stack.</i>	/uploads/1735134768342-703543643.png	2
6	<b><color=black>Step 3:</color></b> Final cut	<i>Make a horizontal cut through the stack to divide it into 8 equal pieces.</i>	/uploads/1735134768343-3109361.png	2
7	<b>Step 1:</b> Fake Note Transaction	Lady buys $100 item with fake $500 note.	\N	3
8	<b>Step 2:</b> Shopkeeper C Pays Change	Shopkeeper C gives $400 change.	\N	3
9	<b>Step 3:</b> Shopkeeper S Realizes the Fake Note	Shopkeeper S demands $500 back from C.	\N	3
10	<b>Conclusion:</b> Loss for C	C loses $500 in total: $100 for the item and $400 in change.	\N	3
11	<b>Step 1: Calculate Relative Velocity</b>	The relative velocity of Train B with respect to Train A is <color=blue>120 km/hr</color>.	/uploads/1735134843769-206824846.png	4
12	<b>Step 2: Calculate Time to Collide</b>	The time taken for the trains to collide is <code>100 km / 120 km/hr = 5/6 hr = 50 min</code>.	\N	4
13	<b>Step 3: Calculate Distance Traveled by Bee</b>	The distance travelled by the bee in <color=purple>50 minutes</color> is <code>80 km/hr * 5/6 hr = 66.67 km</code>.	/uploads/1735134843769-255768156.png	4
14	<b>Key Point</b>	The bee keeps flying back and forth between the trains until they collide, and the total time for the bee’s flight is the same as the time for the trains to collide.	\N	4
15	<b>Step 1: 5000 km</b>	Replace A with S. Remaining distances: A (15000), B (15000), C (15000), D (15000), S (20000).	/uploads/1735134920218-393844860.png	5
16	<b>Step 2: 10000 km</b>	Replace B with S. Remaining distances: A (15000), B (10000), C (10000), D (10000), S (15000).	/uploads/1735134920218-132658990.png	5
17	<b>Step 3: 15000 km</b>	Replace C with S. Remaining distances: A (10000), B (10000), C (5000), D (5000), S (10000).	/uploads/1735134920219-812421387.png	5
18	<b>Step 4: 20000 km</b>	Replace D with S. Remaining distances: A (5000), B (5000), C (5000), D (0), S (5000).	/uploads/1735134920221-830084590.png	5
19	<b>Step 5: 25000 km</b>	All tyres are now worn out completely.	/uploads/1735134920221-478511021.png	5
20	<b><color=black>Step 1:</color></b> Calculate total squares	<i>The board originally has 64 squares. After removing two corners, 62 squares remain.</i>	\N	6
21	<b><color=black>Step 2:</color></b> Analyze square colors	<i>Removing two diagonally opposite corners leaves an unequal number of black and white squares.</i>	\N	6
22	<b><color=black>Step 3:</color></b> Domino placement logic	<i>Each domino must cover one black and one white square, which is not possible with unequal numbers of black and white squares.</i>	\N	6
23	<b><color=black>Step 1:</color></b> When N = 2, 3, or 5	No such division is possible, as it violates the square property and results in non-shaped figures.	/uploads/1735134990347-584173942.png	7
24	<b><color=black>Step 2:</color></b> When N = 4	Divide the square <i>horizontally</i> and <i>vertically</i> through its center. The result is 4 smaller, equal squares.	/uploads/1735134990348-461159732.png	7
25	<b><color=black>Step 3:</color></b> When N is even and greater than 4	Consider N = 2k. Form 2k - 1 equal squares along adjacent sides of the square, with each smaller square's side length being 1/k of the original. For example, when N = 6, form 5 smaller squares along the top and right edges, and leave one square with side length 2/k, resulting in a total of 6 squares.	/uploads/1735134990348-180137372.png	7
26	<b><color=black>Step 4:</color></b> When N is odd and greater than 5	Break N as N = 2k + 1 or N = 2(k - 1) + 3. First, form 2(k - 1) squares using the method for even N, and then divide one of these squares into 4 smaller squares to increase the total by 3. For example, when N = 9, first form 6 squares, then divide one square into 4 smaller squares, achieving 9 squares.	/uploads/1735134990348-976330594.png	7
27	<b>Step 1:</b> Take Pills from Jars	Take 1 pill from jar 1, 2 pills from jar 2, 3 pills from jar 3, 4 pills from jar 4, and 5 pills from jar 5.	\N	8
28	<b>Step 2:</b> Weigh the Pills	Weigh all 15 pills together. The total should be 150 grams if all are normal.	\N	8
29	<b>Step 3:</b> Calculate the Contaminated Jar	If the weight is less than 150 grams, the difference tells you which jar is contaminated.	/uploads/1735135020488-687253078.png	8
30	<b>Step 1: Light the Wires</b>	At <i>0 minutes</i>, light wire 1 from both sides and wire 2 from one side.	/uploads/1735135063538-898994373.jpeg	9
31	<b>Step 2: Wire 1 Burns Out</b>	After <color=blue>30 minutes</color>, wire 1 will be completely burnt out.	/uploads/1735135063538-289438549.jpeg	9
32	<b>Step 3: Light the Other End of Wire 2</b>	At <color=purple>30 minutes</color>, light the other end of wire 2.	/uploads/1735135063538-739520558.jpeg	9
33	<b>Step 4: Wire 2 Burns Out</b>	After <color=orange>15 minutes</color>, wire 2 will be completely burnt out, measuring a total of <color=red>45 minutes</color>.	/uploads/1735135063538-986177927.jpeg	9
34	<b>Step 1: Distribute the Balls</b>	Place <color=blue>49 white balls</color> and <color=blue>50 black balls</color> in the first bowl, and <color=blue>1 white ball</color> and <color=blue>49 black balls</color> in the second bowl.	\N	10
35	<b>Step 2: Probability Calculation</b>	The probability of selecting a white ball becomes: \n\n<color=blue>1/2 * (49/99) + 1/2 * 1 = 0.747</color>	\N	10
36	<b>Conclusion</b>	The maximum probability of picking a white ball is approximately <color=green>3/4</color>.	\N	10
37	<b>Step 1: Buy and Eat Initial Chocolates</b>	Buy and eat <color=blue>15 chocolates</color> with your 15 $.	\N	11
38	<b>Step 2: Get More Chocolates from Wrappers</b>	Return the 15 wrappers and get <color=blue>5 more chocolates</color>.	\N	11
39	<b>Step 3: Use Wrappers Again</b>	Return 3 wrappers and get <color=blue>1 chocolate</color>, keep 2 wrappers.	\N	11
40	<b>Step 4: Final Wrappers</b>	Now you have 3 wrappers. Return these and get <color=blue>1 more chocolate</color>.	\N	11
41	<b>Conclusion</b>	Total chocolates = 15 + 5 + 1 + 1 = <color=green>22 chocolates</color>.	\N	11
42	<b>Step 1: One Line</b>	<i>Using one line, the circle is divided into two parts.</i>	/uploads/1735135209618-165500341.jpg	12
43	<b>Step 2: Two Lines</b>	<color=blue>With two lines, the circle is divided into four parts.</color>	/uploads/1735135209619-8909136.jpg	12
44	<b>Step 3: Three Lines</b>	With three lines, the circle is divided into <color=orange>seven unequal parts</color>.	/uploads/1735135209619-831630705.jpg	12
45	<b>Step 4: Four Lines</b>	Using four lines, the circle is divided into <u><color=black>eleven parts</color></u>.	/uploads/1735135209620-438818056.jpg	12
46	<b>Step 5: Five Lines</b>	With five lines, the circle can be divided into <i><b><color=cyan>sixteen parts</color></b></i>.	/uploads/1735135209620-618928460.jpg	12
47	<b>Step 6: Six Lines</b>	Finally, with six lines, the circle can be divided into <b><color=red>22 parts</color></b>.	/uploads/1735135209621-232867340.jpg	12
48	<b>Step 1: Initial Selection</b>	You pick a door, say <b>No. 1</b>.	\N	13
49	<b>Step 2: Host Opens a Door</b>	The host opens another door, revealing a goat.	\N	13
50	<b>Step 3: Probability Comparison</b>	Switching gives a <color=blue>2/3</color> chance, while staying gives a <color=blue>1/3</color> chance.	\N	13
51	<b>Conclusion</b>	Switching is the better option.	\N	13
56	<b>Step 1: A and B cross</b>	A and B cross together, and A comes back. Time: <color=blue>3 minutes</color>.	/uploads/1735135348075-382427407.png	14
57	<b>Step 2: C and D cross</b>	C and D cross together, and B comes back. Time: <color=blue>10 minutes</color>.	/uploads/1735135348076-929345648.png	14
58	<b>Step 3: A and B cross again</b>	A and B cross together. Time: <color=blue>2 minutes</color>.	/uploads/1735135348076-588065637.png	14
59	<b>Conclusion</b>	All are across the bridge in <color=red>15 minutes</color>.	\N	14
\.


--
-- Data for Name: Tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tag" (id, name) FROM stdin;
1	Probability
2	Logic
3	Puzzle
4	Problem Solving
5	Math
6	Fraud
7	Physics
8	Optimization
9	Maths
10	Geometry
11	Game Theory
\.


--
-- Data for Name: _QuestionTags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_QuestionTags" ("A", "B") FROM stdin;
1	1
1	2
2	3
2	2
2	4
3	5
3	6
3	3
4	7
4	5
4	3
5	5
5	8
5	3
6	3
6	2
6	4
7	9
7	10
8	5
8	2
8	3
9	2
9	5
10	1
10	8
10	3
11	5
11	8
11	3
12	9
13	1
13	11
13	3
14	3
14	2
14	5
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
992c584f-baa6-48bb-85e4-c84d5d6de9df	0989d8a29e09838d11f44b568392546a8bb55ef4e9763fddc87808b262f435bf	2024-12-25 21:49:21.122944+08	20241223075151_init	\N	\N	2024-12-25 21:49:21.118969+08	1
31e4cb63-94b1-4c82-bfc5-3fa7d0ccb09d	a76cba5300cc741afd470aedb88f050ad712727c61922e61d86126de3c4f7d1b	2024-12-25 21:49:21.132589+08	20241223081718_add_questions_steps_tags	\N	\N	2024-12-25 21:49:21.123433+08	1
f891e9d5-03d3-4fbd-bbce-99f860522e8f	dab2bbc14469c2177d962592bfe41919c30d25ee99bac5e67d0f9e330a6d5153	2024-12-25 21:49:21.136639+08	20241223104253_add_cascade_delete	\N	\N	2024-12-25 21:49:21.133099+08	1
b83913c5-be18-466e-a9f8-ab690381e34e	692b125af1cbd7122f064700de4e27d9e57696feb20e65d699485900abef23ea	2024-12-25 21:49:21.1411+08	20241223112932_remove_tags_cascade_delete	\N	\N	2024-12-25 21:49:21.137136+08	1
ad6b0c52-14eb-479f-bb41-905de8f43333	7f7ca2c6c2655b87250f40e4ae6c3973ca59fcd2c92d58d2e33cbd35b4d8f1c5	2024-12-25 21:49:21.144511+08	20241223113639_add_tags_name_unique	\N	\N	2024-12-25 21:49:21.141839+08	1
1568183c-2e7a-417c-a675-a97796e326f8	c9e63815fb78585276e1f31ad53403ae959c804a75f30da6116d06bac84fc084	2024-12-25 21:49:21.149987+08	20241223115239_add_tags_relation_to_question	\N	\N	2024-12-25 21:49:21.145236+08	1
\.


--
-- Name: Option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Option_id_seq"', 54, true);


--
-- Name: Question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Question_id_seq"', 14, true);


--
-- Name: Step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Step_id_seq"', 59, true);


--
-- Name: Tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tag_id_seq"', 11, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

