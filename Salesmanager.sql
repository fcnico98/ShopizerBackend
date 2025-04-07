--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20
-- Dumped by pg_dump version 13.20

-- Started on 2025-03-28 05:41:13

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
-- TOC entry 8 (class 2615 OID 27427)
-- Name: salesmanager; Type: SCHEMA; Schema: -; Owner: operator
--

CREATE SCHEMA salesmanager;


ALTER SCHEMA salesmanager OWNER TO operator;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 292 (class 1259 OID 27428)
-- Name: catalog; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.catalog (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    code character varying(100) NOT NULL,
    default_catalog boolean,
    sort_order integer,
    visible boolean,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.catalog OWNER TO operator;

--
-- TOC entry 293 (class 1259 OID 27433)
-- Name: catalog_entry; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.catalog_entry (
    id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    visible boolean,
    catalog_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE salesmanager.catalog_entry OWNER TO operator;

--
-- TOC entry 294 (class 1259 OID 27438)
-- Name: category; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.category (
    category_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    category_image character varying(100),
    category_status boolean,
    code character varying(100) NOT NULL,
    depth integer,
    featured boolean,
    lineage character varying(255),
    sort_order integer,
    visible boolean,
    merchant_id integer NOT NULL,
    parent_id bigint
);


ALTER TABLE salesmanager.category OWNER TO operator;

--
-- TOC entry 295 (class 1259 OID 27446)
-- Name: category_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.category_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    category_highlight character varying(255),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_title character varying(120),
    sef_url character varying(120),
    language_id integer NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE salesmanager.category_description OWNER TO operator;

--
-- TOC entry 296 (class 1259 OID 27454)
-- Name: content; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.content (
    content_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    code character varying(100) NOT NULL,
    content_position character varying(10),
    content_type character varying(10),
    link_to_menu boolean,
    product_group character varying(255),
    sort_order integer,
    visible boolean,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.content OWNER TO operator;

--
-- TOC entry 297 (class 1259 OID 27459)
-- Name: content_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.content_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_title character varying(255),
    sef_url character varying(120),
    language_id integer NOT NULL,
    content_id bigint NOT NULL
);


ALTER TABLE salesmanager.content_description OWNER TO operator;

--
-- TOC entry 298 (class 1259 OID 27467)
-- Name: country; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.country (
    country_id integer NOT NULL,
    country_isocode character varying(255) NOT NULL,
    country_supported boolean,
    geozone_id bigint
);


ALTER TABLE salesmanager.country OWNER TO operator;

--
-- TOC entry 299 (class 1259 OID 27472)
-- Name: country_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.country_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE salesmanager.country_description OWNER TO operator;

--
-- TOC entry 300 (class 1259 OID 27480)
-- Name: currency; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.currency (
    currency_id bigint NOT NULL,
    currency_code character varying(255),
    currency_currency_code character varying(255) NOT NULL,
    currency_name character varying(255),
    currency_supported boolean
);


ALTER TABLE salesmanager.currency OWNER TO operator;

--
-- TOC entry 301 (class 1259 OID 27488)
-- Name: customer; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer (
    customer_id bigint NOT NULL,
    customer_anonymous boolean,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    billing_street_address character varying(256),
    billing_city character varying(100),
    billing_company character varying(100),
    billing_first_name character varying(64) NOT NULL,
    billing_last_name character varying(64) NOT NULL,
    latitude character varying(100),
    longitude character varying(100),
    billing_postcode character varying(20),
    billing_state character varying(100),
    billing_telephone character varying(32),
    customer_company character varying(100),
    reset_credentials_req character varying(256),
    reset_credentials_exp date,
    review_avg numeric(19,2),
    review_count integer,
    customer_dob timestamp without time zone,
    delivery_street_address character varying(256),
    delivery_city character varying(100),
    delivery_company character varying(100),
    delivery_first_name character varying(64),
    delivery_last_name character varying(64),
    delivery_postcode character varying(20),
    delivery_state character varying(100),
    delivery_telephone character varying(32),
    customer_email_address character varying(96) NOT NULL,
    customer_gender character varying(1),
    customer_nick character varying(96),
    customer_password character varying(60),
    provider character varying(255),
    billing_country_id integer NOT NULL,
    billing_zone_id bigint,
    language_id integer NOT NULL,
    delivery_country_id integer,
    delivery_zone_id bigint,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.customer OWNER TO operator;

--
-- TOC entry 302 (class 1259 OID 27496)
-- Name: customer_attribute; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_attribute (
    customer_attribute_id bigint NOT NULL,
    customer_attr_txt_val character varying(255),
    customer_id bigint NOT NULL,
    option_id bigint NOT NULL,
    option_value_id bigint NOT NULL
);


ALTER TABLE salesmanager.customer_attribute OWNER TO operator;

--
-- TOC entry 303 (class 1259 OID 27501)
-- Name: customer_group; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_group (
    customer_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE salesmanager.customer_group OWNER TO operator;

--
-- TOC entry 304 (class 1259 OID 27504)
-- Name: customer_opt_val_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_opt_val_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    customer_opt_val_id bigint
);


ALTER TABLE salesmanager.customer_opt_val_description OWNER TO operator;

--
-- TOC entry 305 (class 1259 OID 27512)
-- Name: customer_optin; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_optin (
    customer_optin_id bigint NOT NULL,
    email character varying(255) NOT NULL,
    first character varying(255),
    last character varying(255),
    optin_date timestamp without time zone,
    value text,
    merchant_id integer NOT NULL,
    optin_id bigint
);


ALTER TABLE salesmanager.customer_optin OWNER TO operator;

--
-- TOC entry 306 (class 1259 OID 27520)
-- Name: customer_option; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_option (
    customer_option_id bigint NOT NULL,
    customer_opt_active boolean,
    customer_opt_code character varying(255),
    customer_option_type character varying(10),
    customer_opt_public boolean,
    sort_order integer,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.customer_option OWNER TO operator;

--
-- TOC entry 307 (class 1259 OID 27525)
-- Name: customer_option_desc; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_option_desc (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    customer_option_comment character varying(4000),
    language_id integer NOT NULL,
    customer_option_id bigint NOT NULL
);


ALTER TABLE salesmanager.customer_option_desc OWNER TO operator;

--
-- TOC entry 308 (class 1259 OID 27533)
-- Name: customer_option_set; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_option_set (
    customer_optionset_id bigint NOT NULL,
    sort_order integer,
    customer_option_id bigint NOT NULL,
    customer_option_value_id bigint NOT NULL
);


ALTER TABLE salesmanager.customer_option_set OWNER TO operator;

--
-- TOC entry 309 (class 1259 OID 27538)
-- Name: customer_option_value; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_option_value (
    customer_option_value_id bigint NOT NULL,
    customer_opt_val_code character varying(255),
    customer_opt_val_image character varying(255),
    sort_order integer,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.customer_option_value OWNER TO operator;

--
-- TOC entry 310 (class 1259 OID 27546)
-- Name: customer_review; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_review (
    customer_review_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    review_date timestamp without time zone,
    reviews_rating double precision,
    reviews_read bigint,
    status integer,
    customers_id bigint,
    reviewed_customer_id bigint
);


ALTER TABLE salesmanager.customer_review OWNER TO operator;

--
-- TOC entry 311 (class 1259 OID 27551)
-- Name: customer_review_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.customer_review_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    customer_review_id bigint
);


ALTER TABLE salesmanager.customer_review_description OWNER TO operator;

--
-- TOC entry 312 (class 1259 OID 27559)
-- Name: file_history; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.file_history (
    file_history_id bigint NOT NULL,
    accounted_date timestamp without time zone,
    date_added timestamp without time zone NOT NULL,
    date_deleted timestamp without time zone,
    download_count integer NOT NULL,
    file_id bigint,
    filesize integer NOT NULL,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.file_history OWNER TO operator;

--
-- TOC entry 313 (class 1259 OID 27564)
-- Name: geozone; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.geozone (
    geozone_id bigint NOT NULL,
    geozone_code character varying(255),
    geozone_name character varying(255)
);


ALTER TABLE salesmanager.geozone OWNER TO operator;

--
-- TOC entry 314 (class 1259 OID 27572)
-- Name: geozone_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.geozone_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    geozone_id bigint
);


ALTER TABLE salesmanager.geozone_description OWNER TO operator;

--
-- TOC entry 315 (class 1259 OID 27580)
-- Name: language; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.language (
    language_id integer NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    code character varying(255) NOT NULL,
    sort_order integer
);


ALTER TABLE salesmanager.language OWNER TO operator;

--
-- TOC entry 316 (class 1259 OID 27585)
-- Name: manufacturer; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.manufacturer (
    manufacturer_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    code character varying(100) NOT NULL,
    manufacturer_image character varying(255),
    sort_order integer,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.manufacturer OWNER TO operator;

--
-- TOC entry 317 (class 1259 OID 27590)
-- Name: manufacturer_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.manufacturer_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    date_last_click timestamp without time zone,
    manufacturers_url character varying(255),
    url_clicked integer,
    language_id integer NOT NULL,
    manufacturer_id bigint NOT NULL
);


ALTER TABLE salesmanager.manufacturer_description OWNER TO operator;

--
-- TOC entry 318 (class 1259 OID 27598)
-- Name: merchant_configuration; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.merchant_configuration (
    merchant_config_id bigint NOT NULL,
    active boolean,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    config_key character varying(255),
    type character varying(255),
    value text,
    merchant_id integer
);


ALTER TABLE salesmanager.merchant_configuration OWNER TO operator;

--
-- TOC entry 319 (class 1259 OID 27606)
-- Name: merchant_language; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.merchant_language (
    stores_merchant_id integer NOT NULL,
    languages_language_id integer NOT NULL
);


ALTER TABLE salesmanager.merchant_language OWNER TO operator;

--
-- TOC entry 320 (class 1259 OID 27609)
-- Name: merchant_log; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.merchant_log (
    merchant_log_id bigint NOT NULL,
    log text,
    module character varying(25),
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.merchant_log OWNER TO operator;

--
-- TOC entry 321 (class 1259 OID 27617)
-- Name: merchant_store; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.merchant_store (
    merchant_id integer NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    store_code character varying(100) NOT NULL,
    continueshoppingurl character varying(150),
    currency_format_national boolean,
    domain_name character varying(80),
    in_business_since date,
    invoice_template character varying(25),
    lineage character varying(255),
    is_retailer boolean,
    seizeunitcode character varying(5),
    store_email character varying(60) NOT NULL,
    store_logo character varying(100),
    store_template character varying(25),
    store_address character varying(255),
    store_city character varying(100),
    store_name character varying(100) NOT NULL,
    store_phone character varying(50),
    store_postal_code character varying(15),
    store_state_prov character varying(100),
    use_cache boolean,
    weightunitcode character varying(5),
    country_id integer NOT NULL,
    currency_id bigint NOT NULL,
    language_id integer NOT NULL,
    parent_id integer,
    zone_id bigint
);


ALTER TABLE salesmanager.merchant_store OWNER TO operator;

--
-- TOC entry 322 (class 1259 OID 27625)
-- Name: module_configuration; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.module_configuration (
    module_conf_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    code character varying(255) NOT NULL,
    details text,
    configuration character varying(4000),
    custom_ind boolean,
    image character varying(255),
    module character varying(255),
    regions character varying(255),
    type character varying(255)
);


ALTER TABLE salesmanager.module_configuration OWNER TO operator;

--
-- TOC entry 323 (class 1259 OID 27633)
-- Name: optin; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.optin (
    optin_id bigint NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255),
    end_date timestamp without time zone,
    type character varying(255) NOT NULL,
    start_date timestamp without time zone,
    merchant_id integer
);


ALTER TABLE salesmanager.optin OWNER TO operator;

--
-- TOC entry 324 (class 1259 OID 27641)
-- Name: order_account; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_account (
    order_account_id bigint NOT NULL,
    order_account_bill_day integer NOT NULL,
    order_account_end_date date,
    order_account_start_date date NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_account OWNER TO operator;

--
-- TOC entry 325 (class 1259 OID 27646)
-- Name: order_account_product; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_account_product (
    order_account_product_id bigint NOT NULL,
    order_account_product_accnt_dt date,
    order_account_product_end_dt date,
    order_account_product_eot timestamp without time zone,
    order_account_product_l_st_dt timestamp without time zone,
    order_account_product_l_trx_st integer NOT NULL,
    order_account_product_pm_fr_ty integer NOT NULL,
    order_account_product_st_dt date NOT NULL,
    order_account_product_status integer NOT NULL,
    order_account_id bigint NOT NULL,
    order_product_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_account_product OWNER TO operator;

--
-- TOC entry 326 (class 1259 OID 27651)
-- Name: order_attribute; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_attribute (
    order_attribute_id bigint NOT NULL,
    identifier character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_attribute OWNER TO operator;

--
-- TOC entry 327 (class 1259 OID 27659)
-- Name: order_product; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_product (
    order_product_id bigint NOT NULL,
    onetime_charge numeric(19,2) NOT NULL,
    product_name character varying(64) NOT NULL,
    product_quantity integer,
    product_sku character varying(255),
    order_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_product OWNER TO operator;

--
-- TOC entry 328 (class 1259 OID 27664)
-- Name: order_product_attribute; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_product_attribute (
    order_product_attribute_id bigint NOT NULL,
    product_attribute_is_free boolean NOT NULL,
    product_attribute_name character varying(255),
    product_attribute_price numeric(15,4) NOT NULL,
    product_attribute_val_name character varying(255),
    product_attribute_weight numeric(15,4),
    product_option_id bigint NOT NULL,
    product_option_value_id bigint NOT NULL,
    order_product_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_product_attribute OWNER TO operator;

--
-- TOC entry 329 (class 1259 OID 27672)
-- Name: order_product_download; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_product_download (
    order_product_download_id bigint NOT NULL,
    download_count integer NOT NULL,
    download_maxdays integer NOT NULL,
    order_product_filename character varying(255) NOT NULL,
    order_product_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_product_download OWNER TO operator;

--
-- TOC entry 330 (class 1259 OID 27677)
-- Name: order_product_price; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_product_price (
    order_product_price_id bigint NOT NULL,
    default_price boolean NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_price_code character varying(64) NOT NULL,
    product_price_name character varying(255),
    product_price_special numeric(19,2),
    prd_price_special_end_dt timestamp without time zone,
    prd_price_special_st_dt timestamp without time zone,
    order_product_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_product_price OWNER TO operator;

--
-- TOC entry 331 (class 1259 OID 27682)
-- Name: order_status_history; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_status_history (
    order_status_history_id bigint NOT NULL,
    comments text,
    customer_notified integer,
    date_added timestamp without time zone NOT NULL,
    status character varying(255),
    order_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_status_history OWNER TO operator;

--
-- TOC entry 332 (class 1259 OID 27690)
-- Name: order_total; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.order_total (
    order_account_id bigint NOT NULL,
    module character varying(60),
    code character varying(255) NOT NULL,
    order_total_type character varying(255),
    order_value_type character varying(255),
    sort_order integer NOT NULL,
    text text,
    title character varying(255),
    value numeric(15,4) NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE salesmanager.order_total OWNER TO operator;

--
-- TOC entry 333 (class 1259 OID 27698)
-- Name: orders; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.orders (
    order_id bigint NOT NULL,
    billing_street_address character varying(256),
    billing_city character varying(100),
    billing_company character varying(100),
    billing_first_name character varying(64) NOT NULL,
    billing_last_name character varying(64) NOT NULL,
    latitude character varying(100),
    longitude character varying(100),
    billing_postcode character varying(20),
    billing_state character varying(100),
    billing_telephone character varying(32),
    channel character varying(255),
    confirmed_address boolean,
    card_type character varying(255),
    cc_cvv character varying(255),
    cc_expires character varying(255),
    cc_number character varying(255),
    cc_owner character varying(255),
    currency_value numeric(19,2),
    customer_agreed boolean,
    customer_email_address character varying(50) NOT NULL,
    customer_id bigint,
    date_purchased date,
    delivery_street_address character varying(256),
    delivery_city character varying(100),
    delivery_company character varying(100),
    delivery_first_name character varying(64),
    delivery_last_name character varying(64),
    delivery_postcode character varying(20),
    delivery_state character varying(100),
    delivery_telephone character varying(32),
    ip_address character varying(255),
    last_modified timestamp without time zone,
    locale character varying(255),
    order_date_finished timestamp without time zone,
    order_type character varying(255),
    payment_module_code character varying(255),
    payment_type character varying(255),
    shipping_module_code character varying(255),
    cart_code character varying(255),
    order_status character varying(255),
    order_total numeric(19,2),
    billing_country_id integer NOT NULL,
    billing_zone_id bigint,
    currency_id bigint,
    delivery_country_id integer,
    delivery_zone_id bigint,
    merchantid integer
);


ALTER TABLE salesmanager.orders OWNER TO operator;

--
-- TOC entry 334 (class 1259 OID 27706)
-- Name: permission; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.permission (
    permission_id integer NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    permission_name character varying(255)
);


ALTER TABLE salesmanager.permission OWNER TO operator;

--
-- TOC entry 335 (class 1259 OID 27711)
-- Name: permission_group; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.permission_group (
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE salesmanager.permission_group OWNER TO operator;

--
-- TOC entry 336 (class 1259 OID 27716)
-- Name: product; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product (
    product_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    available boolean,
    cond integer,
    date_available timestamp without time zone,
    preorder boolean,
    product_height numeric(19,2),
    product_free boolean,
    product_length numeric(19,2),
    quantity_ordered integer,
    review_avg numeric(19,2),
    review_count integer,
    product_ship boolean,
    product_virtual boolean,
    product_weight numeric(19,2),
    product_width numeric(19,2),
    ref_sku character varying(255),
    rental_duration integer,
    rental_period integer,
    rental_status integer,
    sku character varying(255),
    sort_order integer,
    manufacturer_id bigint,
    merchant_id integer NOT NULL,
    customer_id bigint,
    tax_class_id bigint,
    product_type_id bigint
);


ALTER TABLE salesmanager.product OWNER TO operator;

--
-- TOC entry 337 (class 1259 OID 27724)
-- Name: product_attribute; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_attribute (
    product_attribute_id bigint NOT NULL,
    product_attribute_default boolean,
    product_attribute_discounted boolean,
    product_attribute_for_disp boolean,
    product_attribute_required boolean,
    product_attribute_free boolean,
    product_atribute_price numeric(19,2),
    product_attribute_weight numeric(19,2),
    product_attribute_sort_ord integer,
    product_id bigint NOT NULL,
    option_id bigint NOT NULL,
    option_value_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_attribute OWNER TO operator;

--
-- TOC entry 338 (class 1259 OID 27729)
-- Name: product_availability; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_availability (
    product_avail_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    available boolean,
    height numeric(19,2),
    length numeric(19,2),
    weight numeric(19,2),
    width numeric(19,2),
    owner character varying(255),
    date_available date,
    free_shipping boolean,
    quantity integer,
    quantity_ord_max integer,
    quantity_ord_min integer,
    status boolean,
    region character varying(255),
    region_variant character varying(255),
    sku character varying(255),
    merchant_id integer,
    product_id bigint NOT NULL,
    product_variant bigint
);


ALTER TABLE salesmanager.product_availability OWNER TO operator;

--
-- TOC entry 339 (class 1259 OID 27737)
-- Name: product_category; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_category (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_category OWNER TO operator;

--
-- TOC entry 340 (class 1259 OID 27742)
-- Name: product_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    meta_description character varying(255),
    meta_keywords character varying(255),
    meta_title character varying(255),
    download_lnk character varying(255),
    product_highlight character varying(255),
    sef_url character varying(255),
    language_id integer NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_description OWNER TO operator;

--
-- TOC entry 341 (class 1259 OID 27750)
-- Name: product_digital; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_digital (
    product_digital_id bigint NOT NULL,
    file_name character varying(255) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_digital OWNER TO operator;

--
-- TOC entry 342 (class 1259 OID 27755)
-- Name: product_image; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_image (
    product_image_id bigint NOT NULL,
    default_image boolean,
    image_crop boolean,
    image_type integer,
    product_image character varying(255),
    product_image_url character varying(255),
    sort_order integer,
    product_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_image OWNER TO operator;

--
-- TOC entry 343 (class 1259 OID 27763)
-- Name: product_image_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_image_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    alt_tag character varying(100),
    language_id integer NOT NULL,
    product_image_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_image_description OWNER TO operator;

--
-- TOC entry 344 (class 1259 OID 27771)
-- Name: product_opt_set_opt_value; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_opt_set_opt_value (
    productoptionset_product_option_set_id bigint NOT NULL,
    values_product_option_value_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_opt_set_opt_value OWNER TO operator;

--
-- TOC entry 345 (class 1259 OID 27774)
-- Name: product_opt_set_prd_type; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_opt_set_prd_type (
    productoptionset_product_option_set_id bigint NOT NULL,
    producttypes_product_type_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_opt_set_prd_type OWNER TO operator;

--
-- TOC entry 346 (class 1259 OID 27779)
-- Name: product_option; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_option (
    product_option_id bigint NOT NULL,
    product_option_code character varying(255),
    product_option_sort_ord integer,
    product_option_type character varying(10),
    product_option_read boolean,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.product_option OWNER TO operator;

--
-- TOC entry 347 (class 1259 OID 27784)
-- Name: product_option_desc; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_option_desc (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    product_option_comment character varying(4000),
    language_id integer NOT NULL,
    product_option_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_option_desc OWNER TO operator;

--
-- TOC entry 348 (class 1259 OID 27792)
-- Name: product_option_set; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_option_set (
    product_option_set_id bigint NOT NULL,
    product_option_set_code character varying(255),
    product_option_set_disp boolean,
    product_option_id bigint NOT NULL,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.product_option_set OWNER TO operator;

--
-- TOC entry 349 (class 1259 OID 27797)
-- Name: product_option_value; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_option_value (
    product_option_value_id bigint NOT NULL,
    product_option_val_code character varying(255),
    product_opt_for_disp boolean,
    product_opt_val_image character varying(255),
    product_opt_val_sort_ord integer,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.product_option_value OWNER TO operator;

--
-- TOC entry 350 (class 1259 OID 27805)
-- Name: product_option_value_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_option_value_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    product_option_value_id bigint
);


ALTER TABLE salesmanager.product_option_value_description OWNER TO operator;

--
-- TOC entry 351 (class 1259 OID 27813)
-- Name: product_price; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_price (
    product_price_id bigint NOT NULL,
    product_price_code character varying(255) NOT NULL,
    default_price boolean,
    product_identifier_id bigint,
    product_price_amount numeric(19,2),
    product_price_special_amount numeric(19,2),
    product_price_special_end_date date,
    product_price_special_st_date date,
    product_price_type character varying(20),
    product_avail_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_price OWNER TO operator;

--
-- TOC entry 352 (class 1259 OID 27818)
-- Name: product_price_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_price_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    price_appender character varying(255),
    language_id integer NOT NULL,
    product_price_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_price_description OWNER TO operator;

--
-- TOC entry 353 (class 1259 OID 27826)
-- Name: product_relationship; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_relationship (
    product_relationship_id bigint NOT NULL,
    active boolean,
    code character varying(255),
    product_id bigint,
    related_product_id bigint,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.product_relationship OWNER TO operator;

--
-- TOC entry 354 (class 1259 OID 27831)
-- Name: product_review; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_review (
    product_review_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    review_date timestamp without time zone,
    reviews_rating double precision,
    reviews_read bigint,
    status integer,
    customers_id bigint,
    product_id bigint
);


ALTER TABLE salesmanager.product_review OWNER TO operator;

--
-- TOC entry 355 (class 1259 OID 27836)
-- Name: product_review_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_review_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    product_review_id bigint
);


ALTER TABLE salesmanager.product_review_description OWNER TO operator;

--
-- TOC entry 356 (class 1259 OID 27844)
-- Name: product_type; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_type (
    product_type_id bigint NOT NULL,
    prd_type_add_to_cart boolean,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    prd_type_code character varying(255),
    prd_type_visible boolean,
    merchant_id integer
);


ALTER TABLE salesmanager.product_type OWNER TO operator;

--
-- TOC entry 357 (class 1259 OID 27849)
-- Name: product_type_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_type_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    product_type_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_type_description OWNER TO operator;

--
-- TOC entry 358 (class 1259 OID 27857)
-- Name: product_var_image; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_var_image (
    product_var_image_id bigint NOT NULL,
    default_image boolean,
    product_image character varying(255),
    product_variant_group_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_var_image OWNER TO operator;

--
-- TOC entry 359 (class 1259 OID 27862)
-- Name: product_var_image_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_var_image_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    alt_tag character varying(100),
    language_id integer NOT NULL,
    product_id bigint NOT NULL,
    product_var_image_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_var_image_description OWNER TO operator;

--
-- TOC entry 360 (class 1259 OID 27870)
-- Name: product_variant; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_variant (
    product_variant_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    available boolean,
    code character varying(255),
    date_available timestamp without time zone,
    default_selection boolean,
    sku character varying(255),
    sort_order integer,
    product_id bigint NOT NULL,
    product_variant_group_id bigint,
    product_variation_id bigint,
    product_variation_value_id bigint
);


ALTER TABLE salesmanager.product_variant OWNER TO operator;

--
-- TOC entry 361 (class 1259 OID 27878)
-- Name: product_variant_group; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_variant_group (
    product_variant_group_id bigint NOT NULL,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.product_variant_group OWNER TO operator;

--
-- TOC entry 362 (class 1259 OID 27883)
-- Name: product_variation; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.product_variation (
    product_variation_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    code character varying(100) NOT NULL,
    sort_order integer,
    variant_default boolean,
    merchant_id integer NOT NULL,
    product_option_id bigint NOT NULL,
    option_value_id bigint NOT NULL
);


ALTER TABLE salesmanager.product_variation OWNER TO operator;

--
-- TOC entry 363 (class 1259 OID 27888)
-- Name: shiping_origin; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.shiping_origin (
    ship_origin_id bigint NOT NULL,
    active boolean,
    street_address character varying(256),
    city character varying(100),
    postcode character varying(20),
    state character varying(100),
    country_id integer,
    merchant_id integer NOT NULL,
    zone_id bigint
);


ALTER TABLE salesmanager.shiping_origin OWNER TO operator;

--
-- TOC entry 364 (class 1259 OID 27893)
-- Name: shipping_quote; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.shipping_quote (
    shipping_quote_id bigint NOT NULL,
    cart_id bigint,
    customer_id bigint,
    delivery_street_address character varying(256),
    delivery_city character varying(100),
    delivery_company character varying(100),
    delivery_first_name character varying(64),
    delivery_last_name character varying(64),
    delivery_postcode character varying(20),
    delivery_state character varying(100),
    delivery_telephone character varying(32),
    shipping_number_days integer,
    free_shipping boolean,
    quote_handling numeric(19,2),
    ip_address character varying(255),
    module character varying(255) NOT NULL,
    option_code character varying(255),
    option_delivery_date timestamp without time zone,
    option_name character varying(255),
    option_shipping_date timestamp without time zone,
    order_id bigint,
    quote_price numeric(19,2),
    quote_date timestamp without time zone,
    delivery_country_id integer,
    delivery_zone_id bigint
);


ALTER TABLE salesmanager.shipping_quote OWNER TO operator;

--
-- TOC entry 365 (class 1259 OID 27901)
-- Name: shopping_cart; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.shopping_cart (
    shp_cart_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    customer_id bigint,
    ip_address character varying(255),
    order_id bigint,
    promo_added timestamp without time zone,
    promo_code character varying(255),
    shp_cart_code character varying(255) NOT NULL,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.shopping_cart OWNER TO operator;

--
-- TOC entry 366 (class 1259 OID 27909)
-- Name: shopping_cart_attr_item; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.shopping_cart_attr_item (
    shp_cart_attr_item_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    product_attr_id bigint NOT NULL,
    shp_cart_item_id bigint NOT NULL
);


ALTER TABLE salesmanager.shopping_cart_attr_item OWNER TO operator;

--
-- TOC entry 367 (class 1259 OID 27914)
-- Name: shopping_cart_item; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.shopping_cart_item (
    shp_cart_item_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    product_id bigint NOT NULL,
    quantity integer,
    sku character varying(255),
    product_variant bigint,
    shp_cart_id bigint NOT NULL
);


ALTER TABLE salesmanager.shopping_cart_item OWNER TO operator;

--
-- TOC entry 368 (class 1259 OID 27919)
-- Name: sm_group; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.sm_group (
    group_id integer NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    group_name character varying(255),
    group_type character varying(255)
);


ALTER TABLE salesmanager.sm_group OWNER TO operator;

--
-- TOC entry 369 (class 1259 OID 27927)
-- Name: sm_sequencer; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.sm_sequencer (
    seq_name character varying(255) NOT NULL,
    seq_count bigint
);


ALTER TABLE salesmanager.sm_sequencer OWNER TO operator;

--
-- TOC entry 370 (class 1259 OID 27932)
-- Name: sm_transaction; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.sm_transaction (
    transaction_id bigint NOT NULL,
    amount numeric(19,2),
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    details text,
    payment_type character varying(255),
    transaction_date timestamp without time zone,
    transaction_type character varying(255),
    order_id bigint
);


ALTER TABLE salesmanager.sm_transaction OWNER TO operator;

--
-- TOC entry 371 (class 1259 OID 27940)
-- Name: system_configuration; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.system_configuration (
    system_config_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    config_key character varying(255),
    value character varying(255)
);


ALTER TABLE salesmanager.system_configuration OWNER TO operator;

--
-- TOC entry 372 (class 1259 OID 27948)
-- Name: system_notification; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.system_notification (
    system_notif_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    end_date date,
    config_key character varying(255),
    start_date date,
    value character varying(255),
    merchant_id integer,
    user_id bigint
);


ALTER TABLE salesmanager.system_notification OWNER TO operator;

--
-- TOC entry 373 (class 1259 OID 27956)
-- Name: tax_class; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.tax_class (
    tax_class_id bigint NOT NULL,
    tax_class_code character varying(10) NOT NULL,
    tax_class_title character varying(32) NOT NULL,
    merchant_id integer
);


ALTER TABLE salesmanager.tax_class OWNER TO operator;

--
-- TOC entry 374 (class 1259 OID 27961)
-- Name: tax_rate; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.tax_rate (
    tax_rate_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    tax_code character varying(255),
    piggyback boolean,
    store_state_prov character varying(100),
    tax_priority integer,
    tax_rate numeric(7,4) NOT NULL,
    country_id integer NOT NULL,
    merchant_id integer NOT NULL,
    parent_id bigint,
    tax_class_id bigint NOT NULL,
    zone_id bigint
);


ALTER TABLE salesmanager.tax_rate OWNER TO operator;

--
-- TOC entry 375 (class 1259 OID 27966)
-- Name: tax_rate_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.tax_rate_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    tax_rate_id bigint
);


ALTER TABLE salesmanager.tax_rate_description OWNER TO operator;

--
-- TOC entry 376 (class 1259 OID 27974)
-- Name: user_group; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.user_group (
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE salesmanager.user_group OWNER TO operator;

--
-- TOC entry 377 (class 1259 OID 27977)
-- Name: userconnection; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.userconnection (
    providerid character varying(255) NOT NULL,
    provideruserid character varying(255) NOT NULL,
    userid character varying(255) NOT NULL,
    accesstoken character varying(255),
    displayname character varying(255),
    expiretime bigint,
    imageurl character varying(255),
    profileurl character varying(255),
    refreshtoken character varying(255),
    secret character varying(255),
    userrank integer NOT NULL
);


ALTER TABLE salesmanager.userconnection OWNER TO operator;

--
-- TOC entry 378 (class 1259 OID 27985)
-- Name: users; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.users (
    user_id bigint NOT NULL,
    active boolean,
    admin_email character varying(255),
    admin_name character varying(100),
    admin_password character varying(60),
    admin_a1 character varying(255),
    admin_a2 character varying(255),
    admin_a3 character varying(255),
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    reset_credentials_req character varying(256),
    reset_credentials_exp date,
    admin_first_name character varying(255),
    last_access timestamp without time zone,
    admin_last_name character varying(255),
    login_access timestamp without time zone,
    admin_q1 character varying(255),
    admin_q2 character varying(255),
    admin_q3 character varying(255),
    language_id integer,
    merchant_id integer NOT NULL
);


ALTER TABLE salesmanager.users OWNER TO operator;

--
-- TOC entry 379 (class 1259 OID 27993)
-- Name: zone; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.zone (
    zone_id bigint NOT NULL,
    zone_code character varying(255) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE salesmanager.zone OWNER TO operator;

--
-- TOC entry 380 (class 1259 OID 27998)
-- Name: zone_description; Type: TABLE; Schema: salesmanager; Owner: operator
--

CREATE TABLE salesmanager.zone_description (
    description_id bigint NOT NULL,
    date_created timestamp without time zone,
    date_modified timestamp without time zone,
    updt_id character varying(60),
    description text,
    name character varying(120) NOT NULL,
    title character varying(100),
    language_id integer NOT NULL,
    zone_id bigint NOT NULL
);


ALTER TABLE salesmanager.zone_description OWNER TO operator;

--
-- TOC entry 3591 (class 2606 OID 27437)
-- Name: catalog_entry catalog_entry_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog_entry
    ADD CONSTRAINT catalog_entry_pkey PRIMARY KEY (id);


--
-- TOC entry 3587 (class 2606 OID 27432)
-- Name: catalog catalog_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog
    ADD CONSTRAINT catalog_pkey PRIMARY KEY (id);


--
-- TOC entry 3600 (class 2606 OID 27453)
-- Name: category_description category_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category_description
    ADD CONSTRAINT category_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3595 (class 2606 OID 27445)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3609 (class 2606 OID 27466)
-- Name: content_description content_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content_description
    ADD CONSTRAINT content_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3605 (class 2606 OID 27458)
-- Name: content content_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (content_id);


--
-- TOC entry 3617 (class 2606 OID 27479)
-- Name: country_description country_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country_description
    ADD CONSTRAINT country_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3613 (class 2606 OID 27471)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);


--
-- TOC entry 3621 (class 2606 OID 27487)
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currency_id);


--
-- TOC entry 3633 (class 2606 OID 27500)
-- Name: customer_attribute customer_attribute_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_attribute
    ADD CONSTRAINT customer_attribute_pkey PRIMARY KEY (customer_attribute_id);


--
-- TOC entry 3637 (class 2606 OID 27511)
-- Name: customer_opt_val_description customer_opt_val_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_opt_val_description
    ADD CONSTRAINT customer_opt_val_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3641 (class 2606 OID 27519)
-- Name: customer_optin customer_optin_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_optin
    ADD CONSTRAINT customer_optin_pkey PRIMARY KEY (customer_optin_id);


--
-- TOC entry 3650 (class 2606 OID 27532)
-- Name: customer_option_desc customer_option_desc_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_desc
    ADD CONSTRAINT customer_option_desc_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3646 (class 2606 OID 27524)
-- Name: customer_option customer_option_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option
    ADD CONSTRAINT customer_option_pkey PRIMARY KEY (customer_option_id);


--
-- TOC entry 3654 (class 2606 OID 27537)
-- Name: customer_option_set customer_option_set_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_set
    ADD CONSTRAINT customer_option_set_pkey PRIMARY KEY (customer_optionset_id);


--
-- TOC entry 3659 (class 2606 OID 27545)
-- Name: customer_option_value customer_option_value_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_value
    ADD CONSTRAINT customer_option_value_pkey PRIMARY KEY (customer_option_value_id);


--
-- TOC entry 3629 (class 2606 OID 27495)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3667 (class 2606 OID 27558)
-- Name: customer_review_description customer_review_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review_description
    ADD CONSTRAINT customer_review_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3663 (class 2606 OID 27550)
-- Name: customer_review customer_review_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review
    ADD CONSTRAINT customer_review_pkey PRIMARY KEY (customer_review_id);


--
-- TOC entry 3671 (class 2606 OID 27563)
-- Name: file_history file_history_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.file_history
    ADD CONSTRAINT file_history_pkey PRIMARY KEY (file_history_id);


--
-- TOC entry 3677 (class 2606 OID 27579)
-- Name: geozone_description geozone_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.geozone_description
    ADD CONSTRAINT geozone_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3675 (class 2606 OID 27571)
-- Name: geozone geozone_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.geozone
    ADD CONSTRAINT geozone_pkey PRIMARY KEY (geozone_id);


--
-- TOC entry 3682 (class 2606 OID 27584)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- TOC entry 3688 (class 2606 OID 27597)
-- Name: manufacturer_description manufacturer_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer_description
    ADD CONSTRAINT manufacturer_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3684 (class 2606 OID 27589)
-- Name: manufacturer manufacturer_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (manufacturer_id);


--
-- TOC entry 3692 (class 2606 OID 27605)
-- Name: merchant_configuration merchant_configuration_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_configuration
    ADD CONSTRAINT merchant_configuration_pkey PRIMARY KEY (merchant_config_id);


--
-- TOC entry 3696 (class 2606 OID 27616)
-- Name: merchant_log merchant_log_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_log
    ADD CONSTRAINT merchant_log_pkey PRIMARY KEY (merchant_log_id);


--
-- TOC entry 3699 (class 2606 OID 27624)
-- Name: merchant_store merchant_store_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT merchant_store_pkey PRIMARY KEY (merchant_id);


--
-- TOC entry 3704 (class 2606 OID 27632)
-- Name: module_configuration module_configuration_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.module_configuration
    ADD CONSTRAINT module_configuration_pkey PRIMARY KEY (module_conf_id);


--
-- TOC entry 3706 (class 2606 OID 27640)
-- Name: optin optin_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.optin
    ADD CONSTRAINT optin_pkey PRIMARY KEY (optin_id);


--
-- TOC entry 3710 (class 2606 OID 27645)
-- Name: order_account order_account_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_account
    ADD CONSTRAINT order_account_pkey PRIMARY KEY (order_account_id);


--
-- TOC entry 3712 (class 2606 OID 27650)
-- Name: order_account_product order_account_product_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_account_product
    ADD CONSTRAINT order_account_product_pkey PRIMARY KEY (order_account_product_id);


--
-- TOC entry 3714 (class 2606 OID 27658)
-- Name: order_attribute order_attribute_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_attribute
    ADD CONSTRAINT order_attribute_pkey PRIMARY KEY (order_attribute_id);


--
-- TOC entry 3718 (class 2606 OID 27671)
-- Name: order_product_attribute order_product_attribute_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product_attribute
    ADD CONSTRAINT order_product_attribute_pkey PRIMARY KEY (order_product_attribute_id);


--
-- TOC entry 3720 (class 2606 OID 27676)
-- Name: order_product_download order_product_download_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product_download
    ADD CONSTRAINT order_product_download_pkey PRIMARY KEY (order_product_download_id);


--
-- TOC entry 3716 (class 2606 OID 27663)
-- Name: order_product order_product_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (order_product_id);


--
-- TOC entry 3722 (class 2606 OID 27681)
-- Name: order_product_price order_product_price_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product_price
    ADD CONSTRAINT order_product_price_pkey PRIMARY KEY (order_product_price_id);


--
-- TOC entry 3724 (class 2606 OID 27689)
-- Name: order_status_history order_status_history_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_status_history
    ADD CONSTRAINT order_status_history_pkey PRIMARY KEY (order_status_history_id);


--
-- TOC entry 3726 (class 2606 OID 27697)
-- Name: order_total order_total_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_total
    ADD CONSTRAINT order_total_pkey PRIMARY KEY (order_account_id);


--
-- TOC entry 3728 (class 2606 OID 27705)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3734 (class 2606 OID 27715)
-- Name: permission_group permission_group_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.permission_group
    ADD CONSTRAINT permission_group_pkey PRIMARY KEY (group_id, permission_id);


--
-- TOC entry 3730 (class 2606 OID 27710)
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (permission_id);


--
-- TOC entry 3741 (class 2606 OID 27728)
-- Name: product_attribute product_attribute_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_attribute
    ADD CONSTRAINT product_attribute_pkey PRIMARY KEY (product_attribute_id);


--
-- TOC entry 3747 (class 2606 OID 27736)
-- Name: product_availability product_availability_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_availability
    ADD CONSTRAINT product_availability_pkey PRIMARY KEY (product_avail_id);


--
-- TOC entry 3751 (class 2606 OID 27741)
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (product_id, category_id);


--
-- TOC entry 3753 (class 2606 OID 27749)
-- Name: product_description product_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_description
    ADD CONSTRAINT product_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3758 (class 2606 OID 27754)
-- Name: product_digital product_digital_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_digital
    ADD CONSTRAINT product_digital_pkey PRIMARY KEY (product_digital_id);


--
-- TOC entry 3764 (class 2606 OID 27770)
-- Name: product_image_description product_image_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_image_description
    ADD CONSTRAINT product_image_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3762 (class 2606 OID 27762)
-- Name: product_image product_image_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_image
    ADD CONSTRAINT product_image_pkey PRIMARY KEY (product_image_id);


--
-- TOC entry 3768 (class 2606 OID 27778)
-- Name: product_opt_set_prd_type product_opt_set_prd_type_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_opt_set_prd_type
    ADD CONSTRAINT product_opt_set_prd_type_pkey PRIMARY KEY (productoptionset_product_option_set_id, producttypes_product_type_id);


--
-- TOC entry 3775 (class 2606 OID 27791)
-- Name: product_option_desc product_option_desc_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_desc
    ADD CONSTRAINT product_option_desc_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3771 (class 2606 OID 27783)
-- Name: product_option product_option_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option
    ADD CONSTRAINT product_option_pkey PRIMARY KEY (product_option_id);


--
-- TOC entry 3779 (class 2606 OID 27796)
-- Name: product_option_set product_option_set_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_set
    ADD CONSTRAINT product_option_set_pkey PRIMARY KEY (product_option_set_id);


--
-- TOC entry 3788 (class 2606 OID 27812)
-- Name: product_option_value_description product_option_value_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value_description
    ADD CONSTRAINT product_option_value_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3784 (class 2606 OID 27804)
-- Name: product_option_value product_option_value_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value
    ADD CONSTRAINT product_option_value_pkey PRIMARY KEY (product_option_value_id);


--
-- TOC entry 3736 (class 2606 OID 27723)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3794 (class 2606 OID 27825)
-- Name: product_price_description product_price_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_price_description
    ADD CONSTRAINT product_price_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3792 (class 2606 OID 27817)
-- Name: product_price product_price_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_price
    ADD CONSTRAINT product_price_pkey PRIMARY KEY (product_price_id);


--
-- TOC entry 3798 (class 2606 OID 27830)
-- Name: product_relationship product_relationship_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_relationship
    ADD CONSTRAINT product_relationship_pkey PRIMARY KEY (product_relationship_id);


--
-- TOC entry 3804 (class 2606 OID 27843)
-- Name: product_review_description product_review_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review_description
    ADD CONSTRAINT product_review_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3800 (class 2606 OID 27835)
-- Name: product_review product_review_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review
    ADD CONSTRAINT product_review_pkey PRIMARY KEY (product_review_id);


--
-- TOC entry 3810 (class 2606 OID 27856)
-- Name: product_type_description product_type_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_type_description
    ADD CONSTRAINT product_type_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3808 (class 2606 OID 27848)
-- Name: product_type product_type_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_type
    ADD CONSTRAINT product_type_pkey PRIMARY KEY (product_type_id);


--
-- TOC entry 3816 (class 2606 OID 27869)
-- Name: product_var_image_description product_var_image_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image_description
    ADD CONSTRAINT product_var_image_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3814 (class 2606 OID 27861)
-- Name: product_var_image product_var_image_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image
    ADD CONSTRAINT product_var_image_pkey PRIMARY KEY (product_var_image_id);


--
-- TOC entry 3825 (class 2606 OID 27882)
-- Name: product_variant_group product_variant_group_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant_group
    ADD CONSTRAINT product_variant_group_pkey PRIMARY KEY (product_variant_group_id);


--
-- TOC entry 3821 (class 2606 OID 27877)
-- Name: product_variant product_variant_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant
    ADD CONSTRAINT product_variant_pkey PRIMARY KEY (product_variant_id);


--
-- TOC entry 3827 (class 2606 OID 27887)
-- Name: product_variation product_variation_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variation
    ADD CONSTRAINT product_variation_pkey PRIMARY KEY (product_variation_id);


--
-- TOC entry 3831 (class 2606 OID 27892)
-- Name: shiping_origin shiping_origin_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shiping_origin
    ADD CONSTRAINT shiping_origin_pkey PRIMARY KEY (ship_origin_id);


--
-- TOC entry 3833 (class 2606 OID 27900)
-- Name: shipping_quote shipping_quote_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shipping_quote
    ADD CONSTRAINT shipping_quote_pkey PRIMARY KEY (shipping_quote_id);


--
-- TOC entry 3841 (class 2606 OID 27913)
-- Name: shopping_cart_attr_item shopping_cart_attr_item_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart_attr_item
    ADD CONSTRAINT shopping_cart_attr_item_pkey PRIMARY KEY (shp_cart_attr_item_id);


--
-- TOC entry 3843 (class 2606 OID 27918)
-- Name: shopping_cart_item shopping_cart_item_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart_item
    ADD CONSTRAINT shopping_cart_item_pkey PRIMARY KEY (shp_cart_item_id);


--
-- TOC entry 3835 (class 2606 OID 27908)
-- Name: shopping_cart shopping_cart_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart
    ADD CONSTRAINT shopping_cart_pkey PRIMARY KEY (shp_cart_id);


--
-- TOC entry 3846 (class 2606 OID 27926)
-- Name: sm_group sm_group_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.sm_group
    ADD CONSTRAINT sm_group_pkey PRIMARY KEY (group_id);


--
-- TOC entry 3850 (class 2606 OID 27931)
-- Name: sm_sequencer sm_sequencer_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.sm_sequencer
    ADD CONSTRAINT sm_sequencer_pkey PRIMARY KEY (seq_name);


--
-- TOC entry 3852 (class 2606 OID 27939)
-- Name: sm_transaction sm_transaction_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.sm_transaction
    ADD CONSTRAINT sm_transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 3854 (class 2606 OID 27947)
-- Name: system_configuration system_configuration_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.system_configuration
    ADD CONSTRAINT system_configuration_pkey PRIMARY KEY (system_config_id);


--
-- TOC entry 3856 (class 2606 OID 27955)
-- Name: system_notification system_notification_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.system_notification
    ADD CONSTRAINT system_notification_pkey PRIMARY KEY (system_notif_id);


--
-- TOC entry 3861 (class 2606 OID 27960)
-- Name: tax_class tax_class_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_class
    ADD CONSTRAINT tax_class_pkey PRIMARY KEY (tax_class_id);


--
-- TOC entry 3869 (class 2606 OID 27973)
-- Name: tax_rate_description tax_rate_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate_description
    ADD CONSTRAINT tax_rate_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3865 (class 2606 OID 27965)
-- Name: tax_rate tax_rate_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT tax_rate_pkey PRIMARY KEY (tax_rate_id);


--
-- TOC entry 3669 (class 2606 OID 28051)
-- Name: customer_review_description uk1va9q0nhoe3wli25ktpmouvyh; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review_description
    ADD CONSTRAINT uk1va9q0nhoe3wli25ktpmouvyh UNIQUE (customer_review_id, language_id);


--
-- TOC entry 3665 (class 2606 OID 28049)
-- Name: customer_review uk2momthbfrtgico2yyod8w18pk; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review
    ADD CONSTRAINT uk2momthbfrtgico2yyod8w18pk UNIQUE (customers_id, reviewed_customer_id);


--
-- TOC entry 3589 (class 2606 OID 28007)
-- Name: catalog uk32mubpubtaqu30n34bwl7xiis; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog
    ADD CONSTRAINT uk32mubpubtaqu30n34bwl7xiis UNIQUE (merchant_id, code);


--
-- TOC entry 3598 (class 2606 OID 28012)
-- Name: category uk3mq9i6qmgquvoieslx39pej6x; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category
    ADD CONSTRAINT uk3mq9i6qmgquvoieslx39pej6x UNIQUE (merchant_id, code);


--
-- TOC entry 3635 (class 2606 OID 28033)
-- Name: customer_attribute uk46kbpre88yh963gewm3kmdni1; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_attribute
    ADD CONSTRAINT uk46kbpre88yh963gewm3kmdni1 UNIQUE (option_id, customer_id);


--
-- TOC entry 3656 (class 2606 OID 28044)
-- Name: customer_option_set uk4peli2ritnnq2xqpyq188srm6; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_set
    ADD CONSTRAINT uk4peli2ritnnq2xqpyq188srm6 UNIQUE (customer_option_id, customer_option_value_id);


--
-- TOC entry 3593 (class 2606 OID 28009)
-- Name: catalog_entry uk5q8159i414r299kia2w9re90k; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog_entry
    ADD CONSTRAINT uk5q8159i414r299kia2w9re90k UNIQUE (category_id, catalog_id);


--
-- TOC entry 3686 (class 2606 OID 28058)
-- Name: manufacturer uk6brqfdkga7jc78n8dh3v595y3; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer
    ADD CONSTRAINT uk6brqfdkga7jc78n8dh3v595y3 UNIQUE (merchant_id, code);


--
-- TOC entry 3652 (class 2606 OID 28042)
-- Name: customer_option_desc uk6ovl4t1ciag1wubtcebaoo7vi; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_desc
    ADD CONSTRAINT uk6ovl4t1ciag1wubtcebaoo7vi UNIQUE (customer_option_id, language_id);


--
-- TOC entry 3631 (class 2606 OID 28031)
-- Name: customer uk6v48av32rli7qu9m3ksb32art; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT uk6v48av32rli7qu9m3ksb32art UNIQUE (merchant_id, customer_nick);


--
-- TOC entry 3749 (class 2606 OID 28079)
-- Name: product_availability uk75h2ri3r4y4b5n6q8v4dmjgbk; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_availability
    ADD CONSTRAINT uk75h2ri3r4y4b5n6q8v4dmjgbk UNIQUE (merchant_id, product_id, product_variant, region_variant);


--
-- TOC entry 3875 (class 2606 OID 28132)
-- Name: users uk7cwrowcnjlfxpxpdd1op9ymab; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.users
    ADD CONSTRAINT uk7cwrowcnjlfxpxpdd1op9ymab UNIQUE (merchant_id, admin_name);


--
-- TOC entry 3867 (class 2606 OID 28127)
-- Name: tax_rate uk8gh6l9n0xq03b91sglp62oelu; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT uk8gh6l9n0xq03b91sglp62oelu UNIQUE (tax_code, merchant_id);


--
-- TOC entry 3802 (class 2606 OID 28102)
-- Name: product_review uk9ew5idgdbk8a77534hbnhd4yb; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review
    ADD CONSTRAINT uk9ew5idgdbk8a77534hbnhd4yb UNIQUE (customers_id, product_id);


--
-- TOC entry 3623 (class 2606 OID 28025)
-- Name: currency uk_1ubr7n96hjajamtggqp090a4x; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.currency
    ADD CONSTRAINT uk_1ubr7n96hjajamtggqp090a4x UNIQUE (currency_code);


--
-- TOC entry 3701 (class 2606 OID 28065)
-- Name: merchant_store uk_4pvtsnqv4nlao8725n9ldpguf; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT uk_4pvtsnqv4nlao8725n9ldpguf UNIQUE (store_code);


--
-- TOC entry 3880 (class 2606 OID 28134)
-- Name: zone uk_4tq3p5w8k4h4easyf5t3n1jdr; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone
    ADD CONSTRAINT uk_4tq3p5w8k4h4easyf5t3n1jdr UNIQUE (zone_code);


--
-- TOC entry 3625 (class 2606 OID 28029)
-- Name: currency uk_7r1k69cbk5giewqr5c9r4v6f; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.currency
    ADD CONSTRAINT uk_7r1k69cbk5giewqr5c9r4v6f UNIQUE (currency_name);


--
-- TOC entry 3839 (class 2606 OID 28117)
-- Name: shopping_cart uk_8ld8p40fwrjobi7t3n95pna35; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart
    ADD CONSTRAINT uk_8ld8p40fwrjobi7t3n95pna35 UNIQUE (shp_cart_code);


--
-- TOC entry 3615 (class 2606 OID 28021)
-- Name: country uk_dqb99v22pt27v0tgeqo958e6x; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country
    ADD CONSTRAINT uk_dqb99v22pt27v0tgeqo958e6x UNIQUE (country_isocode);


--
-- TOC entry 3627 (class 2606 OID 28027)
-- Name: currency uk_m7ku15ekud52vp67ry73a36te; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.currency
    ADD CONSTRAINT uk_m7ku15ekud52vp67ry73a36te UNIQUE (currency_currency_code);


--
-- TOC entry 3732 (class 2606 OID 28070)
-- Name: permission uk_ss26hgwetkj8ms5y5jn2co4j3; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.permission
    ADD CONSTRAINT uk_ss26hgwetkj8ms5y5jn2co4j3 UNIQUE (permission_name);


--
-- TOC entry 3848 (class 2606 OID 28120)
-- Name: sm_group uk_t83rjsoml3o785oj37lpqpyko; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.sm_group
    ADD CONSTRAINT uk_t83rjsoml3o785oj37lpqpyko UNIQUE (group_name);


--
-- TOC entry 3863 (class 2606 OID 28125)
-- Name: tax_class uka4q5q57a8oeh2ojeo8dhr935k; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_class
    ADD CONSTRAINT uka4q5q57a8oeh2ojeo8dhr935k UNIQUE (merchant_id, tax_class_code);


--
-- TOC entry 3790 (class 2606 OID 28098)
-- Name: product_option_value_description ukasgc60ot1wy0uho96n0j8429p; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value_description
    ADD CONSTRAINT ukasgc60ot1wy0uho96n0j8429p UNIQUE (product_option_value_id, language_id);


--
-- TOC entry 3673 (class 2606 OID 28053)
-- Name: file_history ukav35sb3v4nxq8v1n1rkxufir; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.file_history
    ADD CONSTRAINT ukav35sb3v4nxq8v1n1rkxufir UNIQUE (merchant_id, file_id);


--
-- TOC entry 3812 (class 2606 OID 28106)
-- Name: product_type_description ukbnra4lwqjkju4yh04824sw6be; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_type_description
    ADD CONSTRAINT ukbnra4lwqjkju4yh04824sw6be UNIQUE (product_type_id, language_id);


--
-- TOC entry 3602 (class 2606 OID 28014)
-- Name: category_description ukbuesqq6cyx7e5hy3mf30cfieq; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category_description
    ADD CONSTRAINT ukbuesqq6cyx7e5hy3mf30cfieq UNIQUE (category_id, language_id);


--
-- TOC entry 3643 (class 2606 OID 28037)
-- Name: customer_optin ukc4fnyu0pvxxtrbko10rm1jqyw; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_optin
    ADD CONSTRAINT ukc4fnyu0pvxxtrbko10rm1jqyw UNIQUE (email, optin_id);


--
-- TOC entry 3661 (class 2606 OID 28047)
-- Name: customer_option_value ukcb1fmv71nrx7m1rlx1ff5qvdt; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_value
    ADD CONSTRAINT ukcb1fmv71nrx7m1rlx1ff5qvdt UNIQUE (merchant_id, customer_opt_val_code);


--
-- TOC entry 3796 (class 2606 OID 28100)
-- Name: product_price_description ukfrsw8d41sxxogvxxoyd8nwaxu; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_price_description
    ADD CONSTRAINT ukfrsw8d41sxxogvxxoyd8nwaxu UNIQUE (product_price_id, language_id);


--
-- TOC entry 3639 (class 2606 OID 28035)
-- Name: customer_opt_val_description ukge7f2t1d31r87wnk09h9u1tnv; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_opt_val_description
    ADD CONSTRAINT ukge7f2t1d31r87wnk09h9u1tnv UNIQUE (customer_opt_val_id, language_id);


--
-- TOC entry 3773 (class 2606 OID 28089)
-- Name: product_option ukhfcw5oi9ulljlog1b7ns1r9tu; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option
    ADD CONSTRAINT ukhfcw5oi9ulljlog1b7ns1r9tu UNIQUE (merchant_id, product_option_code);


--
-- TOC entry 3829 (class 2606 OID 28113)
-- Name: product_variation uki8sa74fv4io0sigmgvqxypp0d; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variation
    ADD CONSTRAINT uki8sa74fv4io0sigmgvqxypp0d UNIQUE (merchant_id, product_option_id, option_value_id);


--
-- TOC entry 3818 (class 2606 OID 28108)
-- Name: product_var_image_description ukimi0kpikvll5gf63n36x3yrwt; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image_description
    ADD CONSTRAINT ukimi0kpikvll5gf63n36x3yrwt UNIQUE (product_var_image_id, language_id);


--
-- TOC entry 3786 (class 2606 OID 28096)
-- Name: product_option_value ukixbpi4hxrhljh935c3xfvnvsh; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value
    ADD CONSTRAINT ukixbpi4hxrhljh935c3xfvnvsh UNIQUE (merchant_id, product_option_val_code);


--
-- TOC entry 3694 (class 2606 OID 28062)
-- Name: merchant_configuration ukj0c3h8onw3m6hjcr3yylst9fb; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_configuration
    ADD CONSTRAINT ukj0c3h8onw3m6hjcr3yylst9fb UNIQUE (merchant_id, config_key);


--
-- TOC entry 3760 (class 2606 OID 28084)
-- Name: product_digital ukjuk1qgkh9v5w7ghvb18krwo8v; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_digital
    ADD CONSTRAINT ukjuk1qgkh9v5w7ghvb18krwo8v UNIQUE (product_id, file_name);


--
-- TOC entry 3781 (class 2606 OID 28093)
-- Name: product_option_set ukk1qq8j685uj17bylgnkra1n5f; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_set
    ADD CONSTRAINT ukk1qq8j685uj17bylgnkra1n5f UNIQUE (merchant_id, product_option_set_code);


--
-- TOC entry 3823 (class 2606 OID 28111)
-- Name: product_variant uklhuo20v01wa867oa7bjqagv72; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant
    ADD CONSTRAINT uklhuo20v01wa867oa7bjqagv72 UNIQUE (product_id, sku);


--
-- TOC entry 3690 (class 2606 OID 28060)
-- Name: manufacturer_description uklpv09p83sc887clxe04nroup6; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer_description
    ADD CONSTRAINT uklpv09p83sc887clxe04nroup6 UNIQUE (manufacturer_id, language_id);


--
-- TOC entry 3884 (class 2606 OID 28136)
-- Name: zone_description ukm64laxgrv9fxm6io232ap4su9; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone_description
    ADD CONSTRAINT ukm64laxgrv9fxm6io232ap4su9 UNIQUE (zone_id, language_id);


--
-- TOC entry 3708 (class 2606 OID 28068)
-- Name: optin ukmanlx6siq6ddf14cud40k8gw6; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.optin
    ADD CONSTRAINT ukmanlx6siq6ddf14cud40k8gw6 UNIQUE (merchant_id, code);


--
-- TOC entry 3777 (class 2606 OID 28091)
-- Name: product_option_desc ukmkcm8isyyyqbjd1yyb8mrpkuw; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_desc
    ADD CONSTRAINT ukmkcm8isyyyqbjd1yyb8mrpkuw UNIQUE (product_option_id, language_id);


--
-- TOC entry 3611 (class 2606 OID 28019)
-- Name: content_description ukn0w5r7ctbp88r4rvk7ayklofm; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content_description
    ADD CONSTRAINT ukn0w5r7ctbp88r4rvk7ayklofm UNIQUE (content_id, language_id);


--
-- TOC entry 3766 (class 2606 OID 28086)
-- Name: product_image_description ukn7yhdj6ccydgf201gibb882cd; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_image_description
    ADD CONSTRAINT ukn7yhdj6ccydgf201gibb882cd UNIQUE (product_image_id, language_id);


--
-- TOC entry 3858 (class 2606 OID 28122)
-- Name: system_notification uknpdnlc390vgr2mhepib1mtrmr; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.system_notification
    ADD CONSTRAINT uknpdnlc390vgr2mhepib1mtrmr UNIQUE (merchant_id, config_key);


--
-- TOC entry 3743 (class 2606 OID 28075)
-- Name: product_attribute uko0c6cfxcfejwfa2877gfgpuco; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_attribute
    ADD CONSTRAINT uko0c6cfxcfejwfa2877gfgpuco UNIQUE (option_id, option_value_id, product_id);


--
-- TOC entry 3756 (class 2606 OID 28082)
-- Name: product_description ukq4dnkx5b776ayqas2h4rr2d8q; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_description
    ADD CONSTRAINT ukq4dnkx5b776ayqas2h4rr2d8q UNIQUE (product_id, language_id);


--
-- TOC entry 3806 (class 2606 OID 28104)
-- Name: product_review_description ukqno5wjdtcj8pm3ykkkh7t4rxj; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review_description
    ADD CONSTRAINT ukqno5wjdtcj8pm3ykkkh7t4rxj UNIQUE (product_review_id, language_id);


--
-- TOC entry 3648 (class 2606 OID 28040)
-- Name: customer_option ukrov34a6g4dhhiqukvhp1ggm0u; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option
    ADD CONSTRAINT ukrov34a6g4dhhiqukvhp1ggm0u UNIQUE (merchant_id, customer_opt_code);


--
-- TOC entry 3738 (class 2606 OID 28072)
-- Name: product uks8ofsn9pehdrstjg52j5qabxh; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT uks8ofsn9pehdrstjg52j5qabxh UNIQUE (merchant_id, sku);


--
-- TOC entry 3679 (class 2606 OID 28055)
-- Name: geozone_description uksoq8o99w3c8ys3ntamt5i4mat; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.geozone_description
    ADD CONSTRAINT uksoq8o99w3c8ys3ntamt5i4mat UNIQUE (geozone_id, language_id);


--
-- TOC entry 3607 (class 2606 OID 28017)
-- Name: content ukt1v2ld0mrwviquqourql4uub0; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content
    ADD CONSTRAINT ukt1v2ld0mrwviquqourql4uub0 UNIQUE (merchant_id, code);


--
-- TOC entry 3871 (class 2606 OID 28129)
-- Name: tax_rate_description ukt3xg8pl88yacdxg49nb46effg; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate_description
    ADD CONSTRAINT ukt3xg8pl88yacdxg49nb46effg UNIQUE (tax_rate_id, language_id);


--
-- TOC entry 3619 (class 2606 OID 28023)
-- Name: country_description ukt7nshki1rbp6157ed0v6cx4y4; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country_description
    ADD CONSTRAINT ukt7nshki1rbp6157ed0v6cx4y4 UNIQUE (country_id, language_id);


--
-- TOC entry 3873 (class 2606 OID 27984)
-- Name: userconnection userconnection_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.userconnection
    ADD CONSTRAINT userconnection_pkey PRIMARY KEY (providerid, provideruserid, userid);


--
-- TOC entry 3877 (class 2606 OID 27992)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3886 (class 2606 OID 28005)
-- Name: zone_description zone_description_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone_description
    ADD CONSTRAINT zone_description_pkey PRIMARY KEY (description_id);


--
-- TOC entry 3882 (class 2606 OID 27997)
-- Name: zone zone_pkey; Type: CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone
    ADD CONSTRAINT zone_pkey PRIMARY KEY (zone_id);


--
-- TOC entry 3603 (class 1259 OID 28015)
-- Name: code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX code_idx ON salesmanager.content USING btree (code);


--
-- TOC entry 3680 (class 1259 OID 28056)
-- Name: code_idx2; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX code_idx2 ON salesmanager.language USING btree (code);


--
-- TOC entry 3644 (class 1259 OID 28038)
-- Name: cust_opt_code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX cust_opt_code_idx ON salesmanager.customer_option USING btree (customer_opt_code);


--
-- TOC entry 3657 (class 1259 OID 28045)
-- Name: cust_opt_val_code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX cust_opt_val_code_idx ON salesmanager.customer_option_value USING btree (customer_opt_val_code);


--
-- TOC entry 3739 (class 1259 OID 28073)
-- Name: idx6h8m6ocg2jhu3bfieqa0dupb1; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX idx6h8m6ocg2jhu3bfieqa0dupb1 ON salesmanager.product_attribute USING btree (product_id);


--
-- TOC entry 3819 (class 1259 OID 28109)
-- Name: idx9ngqm1gg8oivkujmhee4wt0ox; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX idx9ngqm1gg8oivkujmhee4wt0ox ON salesmanager.product_variant USING btree (product_id);


--
-- TOC entry 3596 (class 1259 OID 28010)
-- Name: idxlctdd0gcnad49kass3ntxv54n; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX idxlctdd0gcnad49kass3ntxv54n ON salesmanager.category USING btree (lineage);


--
-- TOC entry 3697 (class 1259 OID 28063)
-- Name: idxrkmg1f192v53wcxln88wrwgrx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX idxrkmg1f192v53wcxln88wrwgrx ON salesmanager.merchant_store USING btree (lineage);


--
-- TOC entry 3702 (class 1259 OID 28066)
-- Name: module_configuration_module; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX module_configuration_module ON salesmanager.module_configuration USING btree (module);


--
-- TOC entry 3744 (class 1259 OID 28077)
-- Name: prd_avail_prd_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX prd_avail_prd_idx ON salesmanager.product_availability USING btree (product_id);


--
-- TOC entry 3745 (class 1259 OID 28076)
-- Name: prd_avail_store_prd_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX prd_avail_store_prd_idx ON salesmanager.product_availability USING btree (product_id, merchant_id);


--
-- TOC entry 3769 (class 1259 OID 28087)
-- Name: prd_option_code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX prd_option_code_idx ON salesmanager.product_option USING btree (product_option_code);


--
-- TOC entry 3782 (class 1259 OID 28094)
-- Name: prd_option_val_code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX prd_option_val_code_idx ON salesmanager.product_option_value USING btree (product_option_val_code);


--
-- TOC entry 3754 (class 1259 OID 28080)
-- Name: product_description_sef_url; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX product_description_sef_url ON salesmanager.product_description USING btree (sef_url);


--
-- TOC entry 3836 (class 1259 OID 28114)
-- Name: shp_cart_code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX shp_cart_code_idx ON salesmanager.shopping_cart USING btree (shp_cart_code);


--
-- TOC entry 3837 (class 1259 OID 28115)
-- Name: shp_cart_customer_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX shp_cart_customer_idx ON salesmanager.shopping_cart USING btree (customer_id);


--
-- TOC entry 3844 (class 1259 OID 28118)
-- Name: sm_group_group_type; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX sm_group_group_type ON salesmanager.sm_group USING btree (group_type);


--
-- TOC entry 3859 (class 1259 OID 28123)
-- Name: tax_class_code_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX tax_class_code_idx ON salesmanager.tax_class USING btree (tax_class_code);


--
-- TOC entry 3878 (class 1259 OID 28130)
-- Name: usr_name_idx; Type: INDEX; Schema: salesmanager; Owner: operator
--

CREATE INDEX usr_name_idx ON salesmanager.users USING btree (admin_name);


--
-- TOC entry 3988 (class 2606 OID 28642)
-- Name: product_option_value_description fk19mnby7atlt85exlypxdxhacx; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value_description
    ADD CONSTRAINT fk19mnby7atlt85exlypxdxhacx FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3977 (class 2606 OID 28587)
-- Name: product_image_description fk1dhldo18nj9l2y6qympgucynq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_image_description
    ADD CONSTRAINT fk1dhldo18nj9l2y6qympgucynq FOREIGN KEY (product_image_id) REFERENCES salesmanager.product_image(product_image_id);


--
-- TOC entry 3990 (class 2606 OID 28652)
-- Name: product_price fk1dic7jnnk1qikgvwcrf4dw12r; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_price
    ADD CONSTRAINT fk1dic7jnnk1qikgvwcrf4dw12r FOREIGN KEY (product_avail_id) REFERENCES salesmanager.product_availability(product_avail_id);


--
-- TOC entry 3926 (class 2606 OID 28332)
-- Name: geozone_description fk1t2hp628edebe5d6co2whbla9; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.geozone_description
    ADD CONSTRAINT fk1t2hp628edebe5d6co2whbla9 FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3950 (class 2606 OID 28452)
-- Name: order_total fk1tfvgk5smm80efdcc8uop4he3; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_total
    ADD CONSTRAINT fk1tfvgk5smm80efdcc8uop4he3 FOREIGN KEY (order_id) REFERENCES salesmanager.orders(order_id);


--
-- TOC entry 3918 (class 2606 OID 28292)
-- Name: customer_option_set fk1y5qtsuabhpwft3dyhqrgmtb4; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_set
    ADD CONSTRAINT fk1y5qtsuabhpwft3dyhqrgmtb4 FOREIGN KEY (customer_option_id) REFERENCES salesmanager.customer_option(customer_option_id);


--
-- TOC entry 3929 (class 2606 OID 28347)
-- Name: manufacturer_description fk20t33wr4tp1kt1uyw7s8a3afl; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer_description
    ADD CONSTRAINT fk20t33wr4tp1kt1uyw7s8a3afl FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3909 (class 2606 OID 28252)
-- Name: customer_group fk257h3e27f4ujw08doqtq46hho; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_group
    ADD CONSTRAINT fk257h3e27f4ujw08doqtq46hho FOREIGN KEY (customer_id) REFERENCES salesmanager.customer(customer_id);


--
-- TOC entry 4022 (class 2606 OID 28812)
-- Name: shopping_cart_item fk2gbimdwe9uysd5xadnfl0xq83; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart_item
    ADD CONSTRAINT fk2gbimdwe9uysd5xadnfl0xq83 FOREIGN KEY (shp_cart_id) REFERENCES salesmanager.shopping_cart(shp_cart_id);


--
-- TOC entry 3935 (class 2606 OID 28377)
-- Name: merchant_store fk2gn7vpkd9x832urw7c6jlawnn; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT fk2gn7vpkd9x832urw7c6jlawnn FOREIGN KEY (country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3925 (class 2606 OID 28327)
-- Name: file_history fk2k8h4penkjlbtc23vamwyek2g; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.file_history
    ADD CONSTRAINT fk2k8h4penkjlbtc23vamwyek2g FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3965 (class 2606 OID 28527)
-- Name: product_attribute fk2st60u9twmvvaowwn88mt3lrx; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_attribute
    ADD CONSTRAINT fk2st60u9twmvvaowwn88mt3lrx FOREIGN KEY (option_id) REFERENCES salesmanager.product_option(product_option_id);


--
-- TOC entry 3889 (class 2606 OID 28147)
-- Name: catalog_entry fk374wks7em54d0oghju0earttl; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog_entry
    ADD CONSTRAINT fk374wks7em54d0oghju0earttl FOREIGN KEY (category_id) REFERENCES salesmanager.category(category_id);


--
-- TOC entry 3940 (class 2606 OID 28402)
-- Name: optin fk37xvfo4the20avv7f1e1771fh; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.optin
    ADD CONSTRAINT fk37xvfo4the20avv7f1e1771fh FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4025 (class 2606 OID 28827)
-- Name: system_notification fk3dykr9pm9ln1uektuw18blb6m; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.system_notification
    ADD CONSTRAINT fk3dykr9pm9ln1uektuw18blb6m FOREIGN KEY (user_id) REFERENCES salesmanager.users(user_id);


--
-- TOC entry 3904 (class 2606 OID 28222)
-- Name: customer fk3k21jw28bbx043c2mnhevg9w4; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT fk3k21jw28bbx043c2mnhevg9w4 FOREIGN KEY (delivery_zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3966 (class 2606 OID 28532)
-- Name: product_attribute fk3rleultg9fn2dxruefbb18d5t; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_attribute
    ADD CONSTRAINT fk3rleultg9fn2dxruefbb18d5t FOREIGN KEY (option_value_id) REFERENCES salesmanager.product_option_value(product_option_value_id);


--
-- TOC entry 3978 (class 2606 OID 28597)
-- Name: product_opt_set_opt_value fk3u6iyag8x8w9tkt7sqcoibjq6; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_opt_set_opt_value
    ADD CONSTRAINT fk3u6iyag8x8w9tkt7sqcoibjq6 FOREIGN KEY (productoptionset_product_option_set_id) REFERENCES salesmanager.product_option_set(product_option_set_id);


--
-- TOC entry 3970 (class 2606 OID 28552)
-- Name: product_category fk3xw1sbaa29r534jvedimdd7md; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_category
    ADD CONSTRAINT fk3xw1sbaa29r534jvedimdd7md FOREIGN KEY (category_id) REFERENCES salesmanager.category(category_id);


--
-- TOC entry 3981 (class 2606 OID 28607)
-- Name: product_opt_set_prd_type fk4655h91s0eiinonako9n4h9ha; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_opt_set_prd_type
    ADD CONSTRAINT fk4655h91s0eiinonako9n4h9ha FOREIGN KEY (productoptionset_product_option_set_id) REFERENCES salesmanager.product_option_set(product_option_set_id);


--
-- TOC entry 3974 (class 2606 OID 28572)
-- Name: product_digital fk47fmb5cg68pws7k26txyl1il6; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_digital
    ADD CONSTRAINT fk47fmb5cg68pws7k26txyl1il6 FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3895 (class 2606 OID 28177)
-- Name: content_description fk47yxf681u0rfw2kvarhqb0r3v; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content_description
    ADD CONSTRAINT fk47yxf681u0rfw2kvarhqb0r3v FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3985 (class 2606 OID 28627)
-- Name: product_option_set fk4njy17416fn86muojmtbav1d0; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_set
    ADD CONSTRAINT fk4njy17416fn86muojmtbav1d0 FOREIGN KEY (product_option_id) REFERENCES salesmanager.product_option(product_option_id);


--
-- TOC entry 3944 (class 2606 OID 28422)
-- Name: order_attribute fk4nw5yrtgb4in6leve76bmdnua; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_attribute
    ADD CONSTRAINT fk4nw5yrtgb4in6leve76bmdnua FOREIGN KEY (order_id) REFERENCES salesmanager.orders(order_id);


--
-- TOC entry 3907 (class 2606 OID 28237)
-- Name: customer_attribute fk4xugs9yd9w4o3sw11fisb8tj5; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_attribute
    ADD CONSTRAINT fk4xugs9yd9w4o3sw11fisb8tj5 FOREIGN KEY (option_id) REFERENCES salesmanager.customer_option(customer_option_id);


--
-- TOC entry 4036 (class 2606 OID 28882)
-- Name: users fk4yb3ho4yxvcjniqg09opbm7ja; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.users
    ADD CONSTRAINT fk4yb3ho4yxvcjniqg09opbm7ja FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4013 (class 2606 OID 28767)
-- Name: product_variation fk5jr2rc6t2p27nwdo5eqwa7658; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variation
    ADD CONSTRAINT fk5jr2rc6t2p27nwdo5eqwa7658 FOREIGN KEY (product_option_id) REFERENCES salesmanager.product_option(product_option_id);


--
-- TOC entry 3943 (class 2606 OID 28417)
-- Name: order_account_product fk5kiyyb8ekqi9bfowytww8atcx; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_account_product
    ADD CONSTRAINT fk5kiyyb8ekqi9bfowytww8atcx FOREIGN KEY (order_product_id) REFERENCES salesmanager.order_product(order_product_id);


--
-- TOC entry 3939 (class 2606 OID 28397)
-- Name: merchant_store fk5o24aky9161jyofyxmg0g53vv; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT fk5o24aky9161jyofyxmg0g53vv FOREIGN KEY (zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3900 (class 2606 OID 28202)
-- Name: customer fk5pas8t9mknk4kkin55t4v300l; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT fk5pas8t9mknk4kkin55t4v300l FOREIGN KEY (billing_country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3923 (class 2606 OID 28317)
-- Name: customer_review_description fk5pkgrlk32uqaxkrbve5mws1hj; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review_description
    ADD CONSTRAINT fk5pkgrlk32uqaxkrbve5mws1hj FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3968 (class 2606 OID 28542)
-- Name: product_availability fk5sbh4dx25pmjcqx958hr9ys8h; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_availability
    ADD CONSTRAINT fk5sbh4dx25pmjcqx958hr9ys8h FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3936 (class 2606 OID 28382)
-- Name: merchant_store fk63hlw9wp1k1x3f5tke7t2us7s; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT fk63hlw9wp1k1x3f5tke7t2us7s FOREIGN KEY (currency_id) REFERENCES salesmanager.currency(currency_id);


--
-- TOC entry 4033 (class 2606 OID 28867)
-- Name: tax_rate_description fk65c2lqslk5kx25dpkem2r0vxq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate_description
    ADD CONSTRAINT fk65c2lqslk5kx25dpkem2r0vxq FOREIGN KEY (tax_rate_id) REFERENCES salesmanager.tax_rate(tax_rate_id);


--
-- TOC entry 4039 (class 2606 OID 28897)
-- Name: zone_description fk69ybu7r3bgpcq65c77ji1udh3; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone_description
    ADD CONSTRAINT fk69ybu7r3bgpcq65c77ji1udh3 FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3972 (class 2606 OID 28562)
-- Name: product_description fk6esjdaa6vu2t5vjin788a8og6; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_description
    ADD CONSTRAINT fk6esjdaa6vu2t5vjin788a8og6 FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4017 (class 2606 OID 28787)
-- Name: shiping_origin fk6k73f1n18kr7mqp708aiwq047; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shiping_origin
    ADD CONSTRAINT fk6k73f1n18kr7mqp708aiwq047 FOREIGN KEY (zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3911 (class 2606 OID 28257)
-- Name: customer_opt_val_description fk6rfssi3qfx4pswicxrfb18c1; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_opt_val_description
    ADD CONSTRAINT fk6rfssi3qfx4pswicxrfb18c1 FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4027 (class 2606 OID 28837)
-- Name: tax_rate fk6wm34jcwoembe1qsmle2wtwnv; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT fk6wm34jcwoembe1qsmle2wtwnv FOREIGN KEY (country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 4034 (class 2606 OID 28872)
-- Name: user_group fk75kainrhn4kh8j3sw2xbe7v61; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.user_group
    ADD CONSTRAINT fk75kainrhn4kh8j3sw2xbe7v61 FOREIGN KEY (group_id) REFERENCES salesmanager.sm_group(group_id);


--
-- TOC entry 3957 (class 2606 OID 28487)
-- Name: permission_group fk77ly3khyuu40odly02d351s84; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.permission_group
    ADD CONSTRAINT fk77ly3khyuu40odly02d351s84 FOREIGN KEY (permission_id) REFERENCES salesmanager.permission(permission_id);


--
-- TOC entry 3991 (class 2606 OID 28657)
-- Name: product_price_description fk7bmbrjr8ar5icwdpt8myj6gei; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_price_description
    ADD CONSTRAINT fk7bmbrjr8ar5icwdpt8myj6gei FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4030 (class 2606 OID 28852)
-- Name: tax_rate fk7bpa9pbl1gnj5y3xbgs3wc0eg; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT fk7bpa9pbl1gnj5y3xbgs3wc0eg FOREIGN KEY (tax_class_id) REFERENCES salesmanager.tax_class(tax_class_id);


--
-- TOC entry 3998 (class 2606 OID 28692)
-- Name: product_review_description fk7byc5jsf5bm4lk674ac44e50m; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review_description
    ADD CONSTRAINT fk7byc5jsf5bm4lk674ac44e50m FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4023 (class 2606 OID 28817)
-- Name: sm_transaction fk7j0s1gqh2tue1fyh5nyj5kwkp; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.sm_transaction
    ADD CONSTRAINT fk7j0s1gqh2tue1fyh5nyj5kwkp FOREIGN KEY (order_id) REFERENCES salesmanager.orders(order_id);


--
-- TOC entry 3946 (class 2606 OID 28432)
-- Name: order_product_attribute fk7j86rvwaysbok1nuofrnmhmkx; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product_attribute
    ADD CONSTRAINT fk7j86rvwaysbok1nuofrnmhmkx FOREIGN KEY (order_product_id) REFERENCES salesmanager.order_product(order_product_id);


--
-- TOC entry 3942 (class 2606 OID 28412)
-- Name: order_account_product fk7oxc8ygov7vd2ajt185jhiwts; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_account_product
    ADD CONSTRAINT fk7oxc8ygov7vd2ajt185jhiwts FOREIGN KEY (order_account_id) REFERENCES salesmanager.order_account(order_account_id);


--
-- TOC entry 3922 (class 2606 OID 28312)
-- Name: customer_review fk7pmqdk9od2af7cl6alx82fkek; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review
    ADD CONSTRAINT fk7pmqdk9od2af7cl6alx82fkek FOREIGN KEY (reviewed_customer_id) REFERENCES salesmanager.customer(customer_id);


--
-- TOC entry 3914 (class 2606 OID 28272)
-- Name: customer_optin fk7qym878m07cwvs4foe68lvqjt; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_optin
    ADD CONSTRAINT fk7qym878m07cwvs4foe68lvqjt FOREIGN KEY (optin_id) REFERENCES salesmanager.optin(optin_id);


--
-- TOC entry 3996 (class 2606 OID 28682)
-- Name: product_review fk7tm0jrt0hiugo3ep49t3subou; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review
    ADD CONSTRAINT fk7tm0jrt0hiugo3ep49t3subou FOREIGN KEY (customers_id) REFERENCES salesmanager.customer(customer_id);


--
-- TOC entry 3905 (class 2606 OID 28227)
-- Name: customer fk8122nrpakxu3umk1od4v0xxoa; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT fk8122nrpakxu3umk1od4v0xxoa FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4001 (class 2606 OID 28707)
-- Name: product_type_description fk81q74whco5y9fd51aa330hlc0; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_type_description
    ADD CONSTRAINT fk81q74whco5y9fd51aa330hlc0 FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4026 (class 2606 OID 28832)
-- Name: tax_class fk82i8puujghcv7fc82qwsgjg8w; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_class
    ADD CONSTRAINT fk82i8puujghcv7fc82qwsgjg8w FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4007 (class 2606 OID 28737)
-- Name: product_variant fk88qb5xufd31481gt7epc8scau; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant
    ADD CONSTRAINT fk88qb5xufd31481gt7epc8scau FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3890 (class 2606 OID 28152)
-- Name: category fk8a09asq5fcx0a88i4m8nsixy; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category
    ADD CONSTRAINT fk8a09asq5fcx0a88i4m8nsixy FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3986 (class 2606 OID 28632)
-- Name: product_option_set fk8d5vylmhvmckmframdehgwqau; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_set
    ADD CONSTRAINT fk8d5vylmhvmckmframdehgwqau FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3983 (class 2606 OID 28617)
-- Name: product_option_desc fk8fiwk5o1gbn2r2u8529yaf9xt; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_desc
    ADD CONSTRAINT fk8fiwk5o1gbn2r2u8529yaf9xt FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 4009 (class 2606 OID 28747)
-- Name: product_variant fk8nqskhly5tfk07g0padic9am9; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant
    ADD CONSTRAINT fk8nqskhly5tfk07g0padic9am9 FOREIGN KEY (product_variation_id) REFERENCES salesmanager.product_variation(product_variation_id);


--
-- TOC entry 3979 (class 2606 OID 28592)
-- Name: product_opt_set_opt_value fk9dwatblxwc64a5la3bb7qnwd8; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_opt_set_opt_value
    ADD CONSTRAINT fk9dwatblxwc64a5la3bb7qnwd8 FOREIGN KEY (values_product_option_value_id) REFERENCES salesmanager.product_option_value(product_option_value_id);


--
-- TOC entry 3908 (class 2606 OID 28242)
-- Name: customer_attribute fk9fl7iexvdeeeoch9fh35o5vw4; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_attribute
    ADD CONSTRAINT fk9fl7iexvdeeeoch9fh35o5vw4 FOREIGN KEY (option_value_id) REFERENCES salesmanager.customer_option_value(customer_option_value_id);


--
-- TOC entry 4035 (class 2606 OID 28877)
-- Name: user_group fk9op4wv63nonsby8y9myjhtho; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.user_group
    ADD CONSTRAINT fk9op4wv63nonsby8y9myjhtho FOREIGN KEY (user_id) REFERENCES salesmanager.users(user_id);


--
-- TOC entry 4018 (class 2606 OID 28792)
-- Name: shipping_quote fk9vb7tbjl8ivygdiqw883fewx7; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shipping_quote
    ADD CONSTRAINT fk9vb7tbjl8ivygdiqw883fewx7 FOREIGN KEY (delivery_country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3893 (class 2606 OID 28167)
-- Name: category_description fka58u7d0ydfgref1iaux5efyov; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category_description
    ADD CONSTRAINT fka58u7d0ydfgref1iaux5efyov FOREIGN KEY (category_id) REFERENCES salesmanager.category(category_id);


--
-- TOC entry 4003 (class 2606 OID 28717)
-- Name: product_var_image fka691h70ypyp8liquow7qrg81h; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image
    ADD CONSTRAINT fka691h70ypyp8liquow7qrg81h FOREIGN KEY (product_variant_group_id) REFERENCES salesmanager.product_variant_group(product_variant_group_id);


--
-- TOC entry 3971 (class 2606 OID 28557)
-- Name: product_category fka7245ly271mb0crlhxwhhppsq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_category
    ADD CONSTRAINT fka7245ly271mb0crlhxwhhppsq FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3956 (class 2606 OID 28482)
-- Name: orders fkaodv5ffayq8x50q311o2y8m1; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT fkaodv5ffayq8x50q311o2y8m1 FOREIGN KEY (merchantid) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3921 (class 2606 OID 28307)
-- Name: customer_review fkayt6tbxp7d4g1qyg8crw2n73p; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review
    ADD CONSTRAINT fkayt6tbxp7d4g1qyg8crw2n73p FOREIGN KEY (customers_id) REFERENCES salesmanager.customer(customer_id);


--
-- TOC entry 3962 (class 2606 OID 28512)
-- Name: product fkb8oqtc3j8sqo0t8xdrne7pg69; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT fkb8oqtc3j8sqo0t8xdrne7pg69 FOREIGN KEY (tax_class_id) REFERENCES salesmanager.tax_class(tax_class_id);


--
-- TOC entry 3997 (class 2606 OID 28687)
-- Name: product_review fkbfi8de7kxultg1vevq6jc1hn7; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review
    ADD CONSTRAINT fkbfi8de7kxultg1vevq6jc1hn7 FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3992 (class 2606 OID 28662)
-- Name: product_price_description fkbwxw861ipjsct606j3dagdjsf; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_price_description
    ADD CONSTRAINT fkbwxw861ipjsct606j3dagdjsf FOREIGN KEY (product_price_id) REFERENCES salesmanager.product_price(product_price_id);


--
-- TOC entry 3903 (class 2606 OID 28217)
-- Name: customer fkbxyooiceli2ko29bupdye6jgn; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT fkbxyooiceli2ko29bupdye6jgn FOREIGN KEY (delivery_country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3917 (class 2606 OID 28287)
-- Name: customer_option_desc fkc2yiucjbw0wjha8ww7a01qfeo; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_desc
    ADD CONSTRAINT fkc2yiucjbw0wjha8ww7a01qfeo FOREIGN KEY (customer_option_id) REFERENCES salesmanager.customer_option(customer_option_id);


--
-- TOC entry 3906 (class 2606 OID 28232)
-- Name: customer_attribute fkc3318o13i2bpxkci1bh52we5a; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_attribute
    ADD CONSTRAINT fkc3318o13i2bpxkci1bh52we5a FOREIGN KEY (customer_id) REFERENCES salesmanager.customer(customer_id);


--
-- TOC entry 3915 (class 2606 OID 28277)
-- Name: customer_option fkcmqnh0rn2hukdfowean5tdy8k; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option
    ADD CONSTRAINT fkcmqnh0rn2hukdfowean5tdy8k FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3897 (class 2606 OID 28187)
-- Name: country fkd2q9e14kh1j6tm1gpbct2xwws; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country
    ADD CONSTRAINT fkd2q9e14kh1j6tm1gpbct2xwws FOREIGN KEY (geozone_id) REFERENCES salesmanager.geozone(geozone_id);


--
-- TOC entry 3902 (class 2606 OID 28212)
-- Name: customer fkdgjqmj04qt89gmfloo4ofojcw; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT fkdgjqmj04qt89gmfloo4ofojcw FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3937 (class 2606 OID 28387)
-- Name: merchant_store fkdnemo9tl8tjhkxko83psvkv19; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT fkdnemo9tl8tjhkxko83psvkv19 FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3963 (class 2606 OID 28517)
-- Name: product fkeiirvj8eu40h103fth8es1mt0; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT fkeiirvj8eu40h103fth8es1mt0 FOREIGN KEY (product_type_id) REFERENCES salesmanager.product_type(product_type_id);


--
-- TOC entry 3898 (class 2606 OID 28192)
-- Name: country_description fkersrbjot9p9nfukxfd2l27c7t; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country_description
    ADD CONSTRAINT fkersrbjot9p9nfukxfd2l27c7t FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3945 (class 2606 OID 28427)
-- Name: order_product fkf0sghmn59s14cxrjtrvkvi5yk; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product
    ADD CONSTRAINT fkf0sghmn59s14cxrjtrvkvi5yk FOREIGN KEY (order_id) REFERENCES salesmanager.orders(order_id);


--
-- TOC entry 3931 (class 2606 OID 28357)
-- Name: merchant_configuration fkf9bkgf0ysbp5fo9j69shm0pri; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_configuration
    ADD CONSTRAINT fkf9bkgf0ysbp5fo9j69shm0pri FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3894 (class 2606 OID 28172)
-- Name: content fkfmoi0fkjbtfty3o8fs94t11r1; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content
    ADD CONSTRAINT fkfmoi0fkjbtfty3o8fs94t11r1 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3994 (class 2606 OID 28672)
-- Name: product_relationship fkfskwtawyt85g9h6761fa69ya5; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_relationship
    ADD CONSTRAINT fkfskwtawyt85g9h6761fa69ya5 FOREIGN KEY (related_product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3953 (class 2606 OID 28467)
-- Name: orders fkfusivmw6q3gjxnmp47n9s74qi; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT fkfusivmw6q3gjxnmp47n9s74qi FOREIGN KEY (currency_id) REFERENCES salesmanager.currency(currency_id);


--
-- TOC entry 4028 (class 2606 OID 28842)
-- Name: tax_rate fkfwp6yka2qps9jna473e6c6yc1; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT fkfwp6yka2qps9jna473e6c6yc1 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3975 (class 2606 OID 28577)
-- Name: product_image fkgab836d8rxqg8vv55nm02r65i; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_image
    ADD CONSTRAINT fkgab836d8rxqg8vv55nm02r65i FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3984 (class 2606 OID 28622)
-- Name: product_option_desc fkgjqmfofile4hwv867irsnvuc0; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_desc
    ADD CONSTRAINT fkgjqmfofile4hwv867irsnvuc0 FOREIGN KEY (product_option_id) REFERENCES salesmanager.product_option(product_option_id);


--
-- TOC entry 3938 (class 2606 OID 28392)
-- Name: merchant_store fkgkoele515h76u39b9defibkm9; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_store
    ADD CONSTRAINT fkgkoele515h76u39b9defibkm9 FOREIGN KEY (parent_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3910 (class 2606 OID 28247)
-- Name: customer_group fkgrr5v89l1m9sl2qol62bbctq4; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_group
    ADD CONSTRAINT fkgrr5v89l1m9sl2qol62bbctq4 FOREIGN KEY (group_id) REFERENCES salesmanager.sm_group(group_id);


--
-- TOC entry 3924 (class 2606 OID 28322)
-- Name: customer_review_description fkhf88oagf6t62k28afn8uaijc7; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_review_description
    ADD CONSTRAINT fkhf88oagf6t62k28afn8uaijc7 FOREIGN KEY (customer_review_id) REFERENCES salesmanager.customer_review(customer_review_id);


--
-- TOC entry 3960 (class 2606 OID 28502)
-- Name: product fkhhoq1nd9e0i4m7rt8gkh7d67h; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT fkhhoq1nd9e0i4m7rt8gkh7d67h FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4038 (class 2606 OID 28892)
-- Name: zone fkhn2c1w3e1twhjg7tiwv7vuk67; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone
    ADD CONSTRAINT fkhn2c1w3e1twhjg7tiwv7vuk67 FOREIGN KEY (country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3920 (class 2606 OID 28302)
-- Name: customer_option_value fkho87ssg5rnvwauj3y690a96g6; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_value
    ADD CONSTRAINT fkho87ssg5rnvwauj3y690a96g6 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3928 (class 2606 OID 28342)
-- Name: manufacturer fkhswph4nthrqwffjekccudsrt2; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer
    ADD CONSTRAINT fkhswph4nthrqwffjekccudsrt2 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3912 (class 2606 OID 28262)
-- Name: customer_opt_val_description fkhwrs6fyqk6vh11yvcflu42yef; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_opt_val_description
    ADD CONSTRAINT fkhwrs6fyqk6vh11yvcflu42yef FOREIGN KEY (customer_opt_val_id) REFERENCES salesmanager.customer_option_value(customer_option_value_id);


--
-- TOC entry 3941 (class 2606 OID 28407)
-- Name: order_account fki6l5isodh81m5hy8ua06hx73n; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_account
    ADD CONSTRAINT fki6l5isodh81m5hy8ua06hx73n FOREIGN KEY (order_id) REFERENCES salesmanager.orders(order_id);


--
-- TOC entry 4005 (class 2606 OID 28727)
-- Name: product_var_image_description fkibpkivbdn6wqe92gb40l5hffl; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image_description
    ADD CONSTRAINT fkibpkivbdn6wqe92gb40l5hffl FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3980 (class 2606 OID 28602)
-- Name: product_opt_set_prd_type fkiem30u1enm0p25i7t53jganf4; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_opt_set_prd_type
    ADD CONSTRAINT fkiem30u1enm0p25i7t53jganf4 FOREIGN KEY (producttypes_product_type_id) REFERENCES salesmanager.product_type(product_type_id);


--
-- TOC entry 4019 (class 2606 OID 28797)
-- Name: shipping_quote fkiioesp0vl6x4om1jeajj4uy1t; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shipping_quote
    ADD CONSTRAINT fkiioesp0vl6x4om1jeajj4uy1t FOREIGN KEY (delivery_zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3932 (class 2606 OID 28367)
-- Name: merchant_language fkiisj0tmoujv6n3iqmytvo39kn; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_language
    ADD CONSTRAINT fkiisj0tmoujv6n3iqmytvo39kn FOREIGN KEY (stores_merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4004 (class 2606 OID 28722)
-- Name: product_var_image_description fkinpkcxbxyg8yni5ftcvjlt1sp; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image_description
    ADD CONSTRAINT fkinpkcxbxyg8yni5ftcvjlt1sp FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3951 (class 2606 OID 28457)
-- Name: orders fkipesu5tupnriahutgle6xu9ed; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT fkipesu5tupnriahutgle6xu9ed FOREIGN KEY (billing_country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3952 (class 2606 OID 28462)
-- Name: orders fkit6ti99mv5uvuxqskhurv3y59; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT fkit6ti99mv5uvuxqskhurv3y59 FOREIGN KEY (billing_zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3919 (class 2606 OID 28297)
-- Name: customer_option_set fkj9vnvyh6hhhftjbcsymgiodm9; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_set
    ADD CONSTRAINT fkj9vnvyh6hhhftjbcsymgiodm9 FOREIGN KEY (customer_option_value_id) REFERENCES salesmanager.customer_option_value(customer_option_value_id);


--
-- TOC entry 3933 (class 2606 OID 28362)
-- Name: merchant_language fkjwy0pjijh1qmcoivq50o2jgec; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_language
    ADD CONSTRAINT fkjwy0pjijh1qmcoivq50o2jgec FOREIGN KEY (languages_language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3913 (class 2606 OID 28267)
-- Name: customer_optin fkk5v94dvhsgibaw89hv4m8o5yw; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_optin
    ADD CONSTRAINT fkk5v94dvhsgibaw89hv4m8o5yw FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3896 (class 2606 OID 28182)
-- Name: content_description fkk7fabfxn2flvcofwwpyg5sys; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.content_description
    ADD CONSTRAINT fkk7fabfxn2flvcofwwpyg5sys FOREIGN KEY (content_id) REFERENCES salesmanager.content(content_id);


--
-- TOC entry 3899 (class 2606 OID 28197)
-- Name: country_description fkkd2sy7q97wr2ahvyiiqc4txji; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.country_description
    ADD CONSTRAINT fkkd2sy7q97wr2ahvyiiqc4txji FOREIGN KEY (country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3892 (class 2606 OID 28162)
-- Name: category_description fkl4j5boteutpu1p8f67kydpnmd; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category_description
    ADD CONSTRAINT fkl4j5boteutpu1p8f67kydpnmd FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3976 (class 2606 OID 28582)
-- Name: product_image_description fklhdnpki4sf98wev0pcj2bvnih; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_image_description
    ADD CONSTRAINT fklhdnpki4sf98wev0pcj2bvnih FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3973 (class 2606 OID 28567)
-- Name: product_description fkm46yjcu59q79qrokgglwq2ove; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_description
    ADD CONSTRAINT fkm46yjcu59q79qrokgglwq2ove FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3916 (class 2606 OID 28282)
-- Name: customer_option_desc fkm4iu7v9db17wk2a03xqbqdlfa; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer_option_desc
    ADD CONSTRAINT fkm4iu7v9db17wk2a03xqbqdlfa FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3969 (class 2606 OID 28547)
-- Name: product_availability fkm9cb3uvgql005wcsqi906pjhg; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_availability
    ADD CONSTRAINT fkm9cb3uvgql005wcsqi906pjhg FOREIGN KEY (product_variant) REFERENCES salesmanager.product_variant(product_variant_id);


--
-- TOC entry 4031 (class 2606 OID 28857)
-- Name: tax_rate fkm9snpf6o1nb4j1t80nas8d1ix; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT fkm9snpf6o1nb4j1t80nas8d1ix FOREIGN KEY (zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3949 (class 2606 OID 28447)
-- Name: order_status_history fkmhghgf1xy3o0npsp8xkj6wyvq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_status_history
    ADD CONSTRAINT fkmhghgf1xy3o0npsp8xkj6wyvq FOREIGN KEY (order_id) REFERENCES salesmanager.orders(order_id);


--
-- TOC entry 3999 (class 2606 OID 28697)
-- Name: product_review_description fkmjivhigdcxmytndlpjuhf4o25; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_review_description
    ADD CONSTRAINT fkmjivhigdcxmytndlpjuhf4o25 FOREIGN KEY (product_review_id) REFERENCES salesmanager.product_review(product_review_id);


--
-- TOC entry 3967 (class 2606 OID 28537)
-- Name: product_availability fkmjs1xqdsgji88j5uduj83bntl; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_availability
    ADD CONSTRAINT fkmjs1xqdsgji88j5uduj83bntl FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3964 (class 2606 OID 28522)
-- Name: product_attribute fkml3nvemdjya159a7669qt1gjd; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_attribute
    ADD CONSTRAINT fkml3nvemdjya159a7669qt1gjd FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3891 (class 2606 OID 28157)
-- Name: category fkn3kekntr7pm8g9v8ask698ato; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.category
    ADD CONSTRAINT fkn3kekntr7pm8g9v8ask698ato FOREIGN KEY (parent_id) REFERENCES salesmanager.category(category_id);


--
-- TOC entry 3927 (class 2606 OID 28337)
-- Name: geozone_description fkn82te2yb2st4hk2qlhl8ileb9; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.geozone_description
    ADD CONSTRAINT fkn82te2yb2st4hk2qlhl8ileb9 FOREIGN KEY (geozone_id) REFERENCES salesmanager.geozone(geozone_id);


--
-- TOC entry 3955 (class 2606 OID 28477)
-- Name: orders fkn9uvjl8105fsly4doo8rqnv5b; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT fkn9uvjl8105fsly4doo8rqnv5b FOREIGN KEY (delivery_zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 3987 (class 2606 OID 28637)
-- Name: product_option_value fknd3nw0mamlk8bkxo8ad5m85pq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value
    ADD CONSTRAINT fknd3nw0mamlk8bkxo8ad5m85pq FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3948 (class 2606 OID 28442)
-- Name: order_product_price fknkukiqxrieonyulercgnh857s; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product_price
    ADD CONSTRAINT fknkukiqxrieonyulercgnh857s FOREIGN KEY (order_product_id) REFERENCES salesmanager.order_product(order_product_id);


--
-- TOC entry 3954 (class 2606 OID 28472)
-- Name: orders fknlx97vjyorunxglhy5bird06c; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.orders
    ADD CONSTRAINT fknlx97vjyorunxglhy5bird06c FOREIGN KEY (delivery_country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 3995 (class 2606 OID 28677)
-- Name: product_relationship fknprvswtbgrm6bjfq3cbdl3qsm; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_relationship
    ADD CONSTRAINT fknprvswtbgrm6bjfq3cbdl3qsm FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4006 (class 2606 OID 28732)
-- Name: product_var_image_description fko6dx44u06sx0mlvq15oy2wlnj; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_var_image_description
    ADD CONSTRAINT fko6dx44u06sx0mlvq15oy2wlnj FOREIGN KEY (product_var_image_id) REFERENCES salesmanager.product_var_image(product_var_image_id);


--
-- TOC entry 4016 (class 2606 OID 28782)
-- Name: shiping_origin fkp0dbwsv3sdsp57ex7j5k9b0oq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shiping_origin
    ADD CONSTRAINT fkp0dbwsv3sdsp57ex7j5k9b0oq FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3901 (class 2606 OID 28207)
-- Name: customer fkp0xcpa3i2mgdr0kq43xiibx40; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.customer
    ADD CONSTRAINT fkp0xcpa3i2mgdr0kq43xiibx40 FOREIGN KEY (billing_zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 4021 (class 2606 OID 28807)
-- Name: shopping_cart_attr_item fkp42tpa623hyo9ww69v0ohb3er; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart_attr_item
    ADD CONSTRAINT fkp42tpa623hyo9ww69v0ohb3er FOREIGN KEY (shp_cart_item_id) REFERENCES salesmanager.shopping_cart_item(shp_cart_item_id);


--
-- TOC entry 3982 (class 2606 OID 28612)
-- Name: product_option fkp8cski5t5f5m4et4fw0uilcgu; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option
    ADD CONSTRAINT fkp8cski5t5f5m4et4fw0uilcgu FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4015 (class 2606 OID 28777)
-- Name: shiping_origin fkpqig59usqvs9h0dw4lm8rv7yy; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shiping_origin
    ADD CONSTRAINT fkpqig59usqvs9h0dw4lm8rv7yy FOREIGN KEY (country_id) REFERENCES salesmanager.country(country_id);


--
-- TOC entry 4040 (class 2606 OID 28902)
-- Name: zone_description fkpv4elin6w3b03756obqvk447f; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.zone_description
    ADD CONSTRAINT fkpv4elin6w3b03756obqvk447f FOREIGN KEY (zone_id) REFERENCES salesmanager.zone(zone_id);


--
-- TOC entry 4002 (class 2606 OID 28712)
-- Name: product_type_description fkpwc89ulk7c9asbp2nfy2t4x2j; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_type_description
    ADD CONSTRAINT fkpwc89ulk7c9asbp2nfy2t4x2j FOREIGN KEY (product_type_id) REFERENCES salesmanager.product_type(product_type_id);


--
-- TOC entry 4011 (class 2606 OID 28757)
-- Name: product_variant_group fkqkn1or09hw4s03b8n1kdwhcsr; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant_group
    ADD CONSTRAINT fkqkn1or09hw4s03b8n1kdwhcsr FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4012 (class 2606 OID 28762)
-- Name: product_variation fkqlm3c2178neue84l5kx51ovoq; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variation
    ADD CONSTRAINT fkqlm3c2178neue84l5kx51ovoq FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3888 (class 2606 OID 28142)
-- Name: catalog_entry fkqp2j48hb3vodovb8gn2o4gox; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog_entry
    ADD CONSTRAINT fkqp2j48hb3vodovb8gn2o4gox FOREIGN KEY (catalog_id) REFERENCES salesmanager.catalog(id);


--
-- TOC entry 3961 (class 2606 OID 28507)
-- Name: product fkqtt5f0aht5h7ough5rbkkcb33; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT fkqtt5f0aht5h7ough5rbkkcb33 FOREIGN KEY (customer_id) REFERENCES salesmanager.customer(customer_id);


--
-- TOC entry 3989 (class 2606 OID 28647)
-- Name: product_option_value_description fkqttc6b79yp2s1hyrhg4thag6s; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_option_value_description
    ADD CONSTRAINT fkqttc6b79yp2s1hyrhg4thag6s FOREIGN KEY (product_option_value_id) REFERENCES salesmanager.product_option_value(product_option_value_id);


--
-- TOC entry 4020 (class 2606 OID 28802)
-- Name: shopping_cart fkqvghr5rmjefe3lw9mcolk30a0; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.shopping_cart
    ADD CONSTRAINT fkqvghr5rmjefe3lw9mcolk30a0 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3958 (class 2606 OID 28492)
-- Name: permission_group fkr7ylutdgqp1nrlbhjwit6y17g; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.permission_group
    ADD CONSTRAINT fkr7ylutdgqp1nrlbhjwit6y17g FOREIGN KEY (group_id) REFERENCES salesmanager.sm_group(group_id);


--
-- TOC entry 3959 (class 2606 OID 28497)
-- Name: product fkra5mmrdxn3ci86hod7q1u3vu9; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product
    ADD CONSTRAINT fkra5mmrdxn3ci86hod7q1u3vu9 FOREIGN KEY (manufacturer_id) REFERENCES salesmanager.manufacturer(manufacturer_id);


--
-- TOC entry 3887 (class 2606 OID 28137)
-- Name: catalog fkranq0rweb0r6j31j565ak51g8; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.catalog
    ADD CONSTRAINT fkranq0rweb0r6j31j565ak51g8 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 3930 (class 2606 OID 28352)
-- Name: manufacturer_description fkre4iys57n5cfbgpg3qqgewtrh; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.manufacturer_description
    ADD CONSTRAINT fkre4iys57n5cfbgpg3qqgewtrh FOREIGN KEY (manufacturer_id) REFERENCES salesmanager.manufacturer(manufacturer_id);


--
-- TOC entry 4008 (class 2606 OID 28742)
-- Name: product_variant fks1gvb7qb19cuowmhrhuwo7lcv; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant
    ADD CONSTRAINT fks1gvb7qb19cuowmhrhuwo7lcv FOREIGN KEY (product_variant_group_id) REFERENCES salesmanager.product_variant_group(product_variant_group_id);


--
-- TOC entry 4024 (class 2606 OID 28822)
-- Name: system_notification fks6qk7l06e0s6m9n04momedgt7; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.system_notification
    ADD CONSTRAINT fks6qk7l06e0s6m9n04momedgt7 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4010 (class 2606 OID 28752)
-- Name: product_variant fksa5ijtdrt6dge0op121ox56a0; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variant
    ADD CONSTRAINT fksa5ijtdrt6dge0op121ox56a0 FOREIGN KEY (product_variation_value_id) REFERENCES salesmanager.product_variation(product_variation_id);


--
-- TOC entry 4032 (class 2606 OID 28862)
-- Name: tax_rate_description fksicb2ydx42o04pvlnxw2mlx0w; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate_description
    ADD CONSTRAINT fksicb2ydx42o04pvlnxw2mlx0w FOREIGN KEY (language_id) REFERENCES salesmanager.language(language_id);


--
-- TOC entry 3993 (class 2606 OID 28667)
-- Name: product_relationship fkso3cvinykac5wdwu1tjgfotor; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_relationship
    ADD CONSTRAINT fkso3cvinykac5wdwu1tjgfotor FOREIGN KEY (product_id) REFERENCES salesmanager.product(product_id);


--
-- TOC entry 3947 (class 2606 OID 28437)
-- Name: order_product_download fkstrda0eweharld63j8pxa2o2r; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.order_product_download
    ADD CONSTRAINT fkstrda0eweharld63j8pxa2o2r FOREIGN KEY (order_product_id) REFERENCES salesmanager.order_product(order_product_id);


--
-- TOC entry 4000 (class 2606 OID 28702)
-- Name: product_type fkswkvtaq4om2di6x8cd4m22ofn; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_type
    ADD CONSTRAINT fkswkvtaq4om2di6x8cd4m22ofn FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4029 (class 2606 OID 28847)
-- Name: tax_rate fkt8isen27i3ioa0tw3bl8qlvdh; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.tax_rate
    ADD CONSTRAINT fkt8isen27i3ioa0tw3bl8qlvdh FOREIGN KEY (parent_id) REFERENCES salesmanager.tax_rate(tax_rate_id);


--
-- TOC entry 3934 (class 2606 OID 28372)
-- Name: merchant_log fkto727b9r68qrtn2vvdqdvd4ic; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.merchant_log
    ADD CONSTRAINT fkto727b9r68qrtn2vvdqdvd4ic FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4037 (class 2606 OID 28887)
-- Name: users fktpio656e5t0cja7kx7p79rkh6; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.users
    ADD CONSTRAINT fktpio656e5t0cja7kx7p79rkh6 FOREIGN KEY (merchant_id) REFERENCES salesmanager.merchant_store(merchant_id);


--
-- TOC entry 4014 (class 2606 OID 28772)
-- Name: product_variation fky6gamyvrpds502pdcqq4voyg; Type: FK CONSTRAINT; Schema: salesmanager; Owner: operator
--

ALTER TABLE ONLY salesmanager.product_variation
    ADD CONSTRAINT fky6gamyvrpds502pdcqq4voyg FOREIGN KEY (option_value_id) REFERENCES salesmanager.product_option_value(product_option_value_id);


-- Completed on 2025-03-28 05:41:16

--
-- PostgreSQL database dump complete
--

