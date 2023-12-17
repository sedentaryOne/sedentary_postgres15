--
-- PostgreSQL database dump
--
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: sedentary 
--
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
SET search_path = public,
    pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;
--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: yieldpoint
--
CREATE TABLE auth_group (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name character varying(80) NOT NULL
);
ALTER TABLE auth_group OWNER TO sedentary;
--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: yieldpoint
--
CREATE TABLE auth_group_permissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
ALTER TABLE auth_group_permissions OWNER TO sedentary;
--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sedentary
--
CREATE TABLE auth_permission (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
ALTER TABLE auth_permission OWNER TO sedentary;
--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: yieldpoint
--
CREATE TABLE auth_user (
    id UUID NOT NULL,
    password character varying(128) NOT NULL,
    password_sald varchar(128),
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    oauth_provider varchar(128),
    oauth_id varchar(128),
    azure_ad_id varchar(128),
    create_date timestamp with time zone NOT NULL,
    create_user UUID,
    modified_date timestamp with time zone,
    modify_user UUID
);
ALTER TABLE auth_user OWNER TO sedentary;
--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: sedentary
--
CREATE TABLE auth_user_groups (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL,
    group_id UUID NOT NULL
);
ALTER TABLE auth_user_groups OWNER TO sedentary;
--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: sedentary
--
CREATE TABLE auth_user_user_permissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
ALTER TABLE auth_user_user_permissions OWNER TO sedentary;
--
-- Name: custom_settings_projectsetting; Type: TABLE; Schema: public; Owner: sedentary
--
CREATE TABLE custom_settings_projectsetting (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title character varying(100) NOT NULL,
    is_required boolean NOT NULL,
    default_value character varying(300) NOT NULL,
    value character varying(300) NOT NULL,
    value_type character varying(1) NOT NULL
);
ALTER TABLE custom_settings_projectsetting OWNER TO sedentary;
--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sedentary
--
CREATE TABLE admin_log (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    CONSTRAINT admin_log_action_flag_check CHECK ((action_flag >= 0))
);
ALTER TABLE admin_log OWNER TO sedentary;
--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sedentary
--
CREATE TABLE session_table (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
ALTER TABLE session_table OWNER TO sedentary;
COPY auth_group_permissions (id, group_id, permission_id)
FROM stdin;
\.COPY auth_user_groups (id, user_id, group_id)
FROM stdin;
\.COPY custom_settings_projectsetting (
    id,
    title,
    is_required,
    default_value,
    value,
    value_type
)
FROM stdin;
2 TIME_ZONE t UTC America / Toronto s \.COPY measurements_measurement (id, title, symbol, unit)
FROM stdin;
1 displacement mm 2 strain Ɛ % 3 temperature ° C 4 energy J 5 peak_particle_velocity m / s 6 peak_particle_acceleration m / s ² 7 seismic_moment N · m 8 source_radius m 9 acceleration mm / day ² 10 velocity mm / day \.REVOKE ALL ON SCHEMA public
FROM PUBLIC;
REVOKE ALL ON SCHEMA public
FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
--
-- PostgreSQL database dump complete
- -