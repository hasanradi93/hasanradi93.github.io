--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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

--
-- Name: touch_updated_at(); Type: FUNCTION; Schema: public; Owner: school_admin
--

CREATE FUNCTION public.touch_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at := now();
    IF TG_OP = 'UPDATE' AND NEW.email IS DISTINCT FROM OLD.email THEN
        RAISE NOTICE 'email changed for %', OLD.id;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.touch_updated_at() OWNER TO school_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: classrooms; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.classrooms (
    id integer NOT NULL,
    building character varying(40) NOT NULL,
    room_number character varying(10) NOT NULL,
    capacity smallint DEFAULT 30 NOT NULL
);


ALTER TABLE public.classrooms OWNER TO school_admin;

--
-- Name: classrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.classrooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classrooms_id_seq OWNER TO school_admin;

--
-- Name: classrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school_admin
--

ALTER SEQUENCE public.classrooms_id_seq OWNED BY public.classrooms.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    code character varying(12) NOT NULL,
    title character varying(150) NOT NULL,
    credits numeric(3,1) DEFAULT 3.0 NOT NULL,
    prerequisite_id integer
);


ALTER TABLE public.courses OWNER TO school_admin;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO school_admin;

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.enrollments (
    student_id integer NOT NULL,
    section_id integer NOT NULL,
    enrolled_at timestamp with time zone DEFAULT now() NOT NULL,
    grade character(2),
    status character varying(12) DEFAULT 'active'::character varying NOT NULL
);


ALTER TABLE public.enrollments OWNER TO school_admin;

--
-- Name: sections; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.sections (
    id integer NOT NULL,
    course_id integer NOT NULL,
    term_id integer NOT NULL,
    teacher_id integer NOT NULL,
    classroom_id integer,
    weekdays smallint[],
    starts_at time without time zone NOT NULL
);


ALTER TABLE public.sections OWNER TO school_admin;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sections_id_seq OWNER TO school_admin;

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(60) NOT NULL,
    last_name character varying(60) NOT NULL,
    email character varying(190) NOT NULL,
    born_on date,
    enrolled_year smallint DEFAULT 2024 NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.students OWNER TO school_admin;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO school_admin;

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    full_name character varying(120) NOT NULL,
    email character varying(190) NOT NULL,
    hired_on date NOT NULL,
    department character varying(80)
);


ALTER TABLE public.teachers OWNER TO school_admin;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.teachers_id_seq OWNER TO school_admin;

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: terms; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.terms (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    starts_on date NOT NULL,
    ends_on date NOT NULL
);


ALTER TABLE public.terms OWNER TO school_admin;

--
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.terms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.terms_id_seq OWNER TO school_admin;

ALTER SEQUENCE public.terms_id_seq OWNED BY public.terms.id;


--
-- Name: classrooms id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.classrooms ALTER COLUMN id SET DEFAULT nextval('public.classrooms_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- Name: classrooms classrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.classrooms
    ADD CONSTRAINT classrooms_pkey PRIMARY KEY (id);


--
-- Name: courses courses_code_key; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_code_key UNIQUE (code);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (student_id, section_id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: terms terms_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT terms_pkey PRIMARY KEY (id);


--
-- Name: idx_sections_course; Type: INDEX; Schema: public; Owner: school_admin
--

CREATE INDEX idx_sections_course ON public.sections USING btree (course_id);


--
-- Name: students trg_students_touch; Type: TRIGGER; Schema: public; Owner: school_admin
--

CREATE TRIGGER trg_students_touch BEFORE UPDATE ON public.students FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();


--
-- Name: courses courses_prerequisite_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_prerequisite_id_fkey FOREIGN KEY (prerequisite_id) REFERENCES public.courses(id) ON DELETE SET NULL;


--
-- Name: enrollments enrollments_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(id) ON DELETE CASCADE;


--
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- Name: sections sections_classroom_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_classroom_id_fkey FOREIGN KEY (classroom_id) REFERENCES public.classrooms(id);


--
-- Name: sections sections_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: sections sections_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


--
-- Name: sections sections_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_term_id_fkey FOREIGN KEY (term_id) REFERENCES public.terms(id);


--
-- Name: TABLE courses; Type: COMMENT; Schema: public; Owner: school_admin
--

COMMENT ON TABLE public.courses IS 'Catalogue of courses; a course can require another course first';


--
-- Name: COLUMN enrollments.grade; Type: COMMENT; Schema: public; Owner: school_admin
--

COMMENT ON COLUMN public.enrollments.grade IS 'Final letter grade, empty until the term closes';


--
-- PostgreSQL database dump complete
--
