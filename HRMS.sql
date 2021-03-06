 BEGIN;


CREATE TABLE public.activation_code_to_candidates
(
    id integer NOT NULL,
    candidate_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.activation_code_to_employers
(
    id integer NOT NULL,
    employer_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.activation_codes
(
    id integer NOT NULL,
    activation_code character varying(38) NOT NULL,
    is_confirmed boolean NOT NULL,
    confirmed_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.candidates
(
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    identity_number character varying(11) NOT NULL,
    birth_date date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employees
(
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.employer_activation_by_employees
(
    id integer NOT NULL,
    employer_id integer NOT NULL,
    confirmed_employee_id integer,
    is_confirmed boolean NOT NULL,
    confirmed_date date,
    PRIMARY KEY (id)
);

CREATE TABLE public.employers
(
    id integer NOT NULL,
    company_name character varying(255) NOT NULL,
    web_address character varying(50) NOT NULL,
    phone_number character varying(12) NOT NULL,
    is_activated boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_titles
(
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.users
(
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(25) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.activation_code_to_candidates
    ADD FOREIGN KEY (candidate_id)
    REFERENCES public.candidates (id)
    NOT VALID;


ALTER TABLE public.activation_code_to_employers
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.activation_codes
    ADD FOREIGN KEY (id)
    REFERENCES public.activation_code_to_candidates (id)
    NOT VALID;


ALTER TABLE public.activation_codes
    ADD FOREIGN KEY (id)
    REFERENCES public.activation_code_to_employers (id)
    NOT VALID;


ALTER TABLE public.candidates
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employees
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employer_activation_by_employees
    ADD FOREIGN KEY (confirmed_employee_id)
    REFERENCES public.employees (id)
    NOT VALID;


ALTER TABLE public.employer_activation_by_employees
    ADD FOREIGN KEY (employer_id)
    REFERENCES public.employers (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (id)
    REFERENCES public.users (id)
    NOT VALID;

END;
