--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: aplicar_adicional(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.aplicar_adicional(preco double precision, adicional double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
  	BEGIN
    	RETURN preco * (1 + adicional);
    END
  $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    nome character varying(48) NOT NULL,
    rg character varying(10) NOT NULL,
    telefone character varying(12) NOT NULL
);


--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cliente_id_seq OWNED BY public.cliente.id;


--
-- Name: custo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.custo (
    tempo integer NOT NULL,
    valor_treino double precision NOT NULL,
    fimsemana boolean NOT NULL
);


--
-- Name: demo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.demo (
    id integer NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    hint text DEFAULT ''::text NOT NULL
);


--
-- Name: demo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: demo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;


--
-- Name: exercicio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exercicio (
    id integer NOT NULL,
    fk_id_treino integer NOT NULL,
    fk_id_cliente integer NOT NULL
);


--
-- Name: exercicio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exercicio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exercicio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exercicio_id_seq OWNED BY public.exercicio.id;


--
-- Name: orcamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orcamento (
    id integer NOT NULL,
    fk_id_treino integer NOT NULL,
    fk_id_custo integer NOT NULL,
    valor_total_ double precision,
    fimsemana boolean
);


--
-- Name: orcamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orcamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orcamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orcamento_id_seq OWNED BY public.orcamento.id;


--
-- Name: treino; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.treino (
    id integer NOT NULL,
    treino character varying(48) NOT NULL,
    dia character varying(10) NOT NULL,
    horario character varying(12) NOT NULL,
    professor character varying(12) NOT NULL
);


--
-- Name: treino_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.treino_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: treino_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.treino_id_seq OWNED BY public.treino.id;


--
-- Name: cliente id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id SET DEFAULT nextval('public.cliente_id_seq'::regclass);


--
-- Name: demo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);


--
-- Name: exercicio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercicio ALTER COLUMN id SET DEFAULT nextval('public.exercicio_id_seq'::regclass);


--
-- Name: orcamento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orcamento ALTER COLUMN id SET DEFAULT nextval('public.orcamento_id_seq'::regclass);


--
-- Name: treino id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treino ALTER COLUMN id SET DEFAULT nextval('public.treino_id_seq'::regclass);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: custo custo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.custo
    ADD CONSTRAINT custo_pkey PRIMARY KEY (tempo);


--
-- Name: demo demo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);


--
-- Name: exercicio exercicio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercicio
    ADD CONSTRAINT exercicio_pkey PRIMARY KEY (id);


--
-- Name: orcamento orcamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orcamento
    ADD CONSTRAINT orcamento_pkey PRIMARY KEY (id);


--
-- Name: treino treino_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.treino
    ADD CONSTRAINT treino_pkey PRIMARY KEY (id);


--
-- Name: exercicio fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercicio
    ADD CONSTRAINT fk_cliente FOREIGN KEY (fk_id_cliente) REFERENCES public.cliente(id);


--
-- Name: orcamento fk_id_custo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orcamento
    ADD CONSTRAINT fk_id_custo FOREIGN KEY (fk_id_custo) REFERENCES public.custo(tempo);


--
-- Name: orcamento fk_id_treino; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orcamento
    ADD CONSTRAINT fk_id_treino FOREIGN KEY (fk_id_treino) REFERENCES public.treino(id);


--
-- Name: exercicio fk_treino; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exercicio
    ADD CONSTRAINT fk_treino FOREIGN KEY (fk_id_treino) REFERENCES public.treino(id);


--
-- PostgreSQL database dump complete
--

