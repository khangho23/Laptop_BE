--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-08-26 12:18:06

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
-- TOC entry 214 (class 1259 OID 32317)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    logo character varying(255) NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 32322)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id integer NOT NULL,
    productid integer NOT NULL,
    userid integer NOT NULL,
    colorid integer,
    quantity integer NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32325)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    productid integer NOT NULL,
    orderid integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32328)
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.color OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32331)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    buy_date date,
    place text,
    customerid integer NOT NULL,
    status integer DEFAULT 0
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32337)
-- Name: donhang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.donhang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 32338)
-- Name: giohang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cart ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.giohang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 32339)
-- Name: image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.image (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    productid integer
);


ALTER TABLE public.image OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32342)
-- Name: hinhanhsanpham_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.image ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hinhanhsanpham_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 32343)
-- Name: order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_detail (
    id integer NOT NULL,
    orderid integer NOT NULL,
    productid integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.order_detail OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32346)
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 224
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;


--
-- TOC entry 225 (class 1259 OID 32347)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    ram character varying(255) NOT NULL,
    display character varying(255) NOT NULL,
    rom character varying(255) NOT NULL,
    published_date date NOT NULL,
    os character varying(255) NOT NULL,
    price double precision,
    quantity integer NOT NULL,
    logo character varying(255) NOT NULL,
    brandid integer NOT NULL,
    colorid integer NOT NULL,
    puslished_date timestamp(6) without time zone
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32352)
-- Name: thuonghieu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.brand ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.thuonghieu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 32353)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    fullname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    is_admin boolean NOT NULL,
    active boolean DEFAULT false,
    token character varying(10),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 32359)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3211 (class 2604 OID 32360)
-- Name: order_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);


--
-- TOC entry 3381 (class 0 OID 32317)
-- Dependencies: 214
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brand (id, name, logo) OVERRIDING SYSTEM VALUE VALUES (1, 'Asus', 'https://cdn.tgdd.vn/Brand/1/logo-asus-149x40.png');
INSERT INTO public.brand (id, name, logo) OVERRIDING SYSTEM VALUE VALUES (2, 'MSI', 'https://cdn.tgdd.vn/Brand/1/logo-msi-149x40.png');
INSERT INTO public.brand (id, name, logo) OVERRIDING SYSTEM VALUE VALUES (3, 'Lenovo', 'https://cdn.tgdd.vn/Brand/1/logo-lenovo-149x40.png');
INSERT INTO public.brand (id, name, logo) OVERRIDING SYSTEM VALUE VALUES (4, 'HP', 'https://cdn.tgdd.vn/Brand/1/logo-hp-149x40-1.png');
INSERT INTO public.brand (id, name, logo) OVERRIDING SYSTEM VALUE VALUES (5, 'MacBook', 'https://cdn.tgdd.vn/Brand/1/logo-macbook-149x40.png');


--
-- TOC entry 3382 (class 0 OID 32322)
-- Dependencies: 215
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3383 (class 0 OID 32325)
-- Dependencies: 216
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3384 (class 0 OID 32328)
-- Dependencies: 217
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.color (id, name) VALUES (1, 'xanh');
INSERT INTO public.color (id, name) VALUES (2, 'đen');
INSERT INTO public.color (id, name) VALUES (3, 'xám');
INSERT INTO public.color (id, name) VALUES (4, 'trắng');
INSERT INTO public.color (id, name) VALUES (5, 'hồng');
INSERT INTO public.color (id, name) VALUES (6, 'bạc');


--
-- TOC entry 3388 (class 0 OID 32339)
-- Dependencies: 221
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (6, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/t/rtytu.jpg', 2);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (11, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/3/_/3_175.png', 3);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (16, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0005_65287_laptop_asus_gaming_tuf_fx5.jpg', 4);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (17, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0004_65287_laptop_asus_gaming_tuf_fx5_1_.jpg', 4);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (18, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0003_65287_laptop_asus_gaming_tuf_fx5_2_.jpg', 4);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (19, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0001_65287_laptop_asus_gaming_tuf_fx5_4_.jpg', 4);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (20, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/_/0/_0002_65287_laptop_asus_gaming_tuf_fx5_3_.jpg', 4);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (21, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-0.jpg', 5);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (22, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-1.jpg', 5);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (23, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-2.jpg', 5);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (24, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-3.jpg', 5);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (25, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-4.jpg', 5);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (1, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/a/m/amacbook-air-500-500-max_1.png', 1);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (2, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-space-gray-select-201810.jpg', 1);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (3, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbookm1.jpg', 1);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (4, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/_/0/_0000_macbook-air-gallery1-20201110_geo_us.jpg', 1);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (5, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/_/0/_0003_macbook-air-gallery4-20201110.jpg', 1);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (7, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/r/t/rtytu_6_.jpg', 2);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (8, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/r/t/rtytu_3_.jpg', 2);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (9, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/r/t/rtytu_5_.jpg', 2);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (10, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/r/t/rtytu_7_.jpg', 2);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (12, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/3/_/3_175.png', 3);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (13, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/7/_/7_97.png', 3);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (14, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/4/_/4_168.png', 3);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (15, 'https://cdn2.cellphones.com.vn/x358,webp,q100/media/catalog/product/5/_/5_154.png', 3);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (26, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_21_.png', 6);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (27, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/s/msi-gf63-thin-10sc-804vn-1_3.jpg', 6);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (28, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/s/msi-gf63-thin-10sc-804vn-5_2.jpg', 6);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (29, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/s/msi-gf63-thin-10sc-804vn-3_2.jpg', 6);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (30, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/s/msi-gf63-thin-10sc-804vn-6_2.jpg', 6);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (31, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_20_.png', 7);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (32, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/e/gearvn-laptop-gaming-msi-crosshair-15-b12uez-460vn-2.jpg', 7);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (33, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/e/gearvn-laptop-gaming-msi-crosshair-15-b12uez-460vn-3.jpg', 7);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (34, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/e/gearvn-laptop-gaming-msi-crosshair-15-b12uez-460vn-4.jpg', 7);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (35, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/g/e/gearvn-laptop-gaming-msi-crosshair-15-b12uez-460vn-4.jpg', 7);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (36, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t181236.684.png', 8);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (37, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173635.793_3.png', 8);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (38, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173651.079_2.png', 8);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (39, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173707.722_2.png', 8);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (40, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173723.970_2.png', 8);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (41, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_17__1_32.png', 9);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (42, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_16__1_37.png', 9);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (43, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_18__34.png', 9);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (44, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_19__28.png', 9);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (45, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_20__1_27.png', 9);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (46, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_d_i_12__1.png', 10);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (47, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-04-26t175433.234_1_1.png', 10);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (48, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-04-26t175446.775_1.png', 10);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (49, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-04-26t175527.564_1.png', 10);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (50, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-04-26t175554.583_1.png', 10);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (51, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_287_2_1.png', 11);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (52, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_260_2_1.png', 11);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (53, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_245_2_1.png', 11);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (54, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_196_2_1.png', 11);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (55, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_223_2_1.png', 11);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (56, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_54_9.png', 12);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (57, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_27_7.png', 12);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (58, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_17_6.png', 12);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (59, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook_air_m2_3_1.jpg', 12);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (60, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_40_7.png', 12);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (61, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/h/e/hero_13__d1tfa5zby7e6_large00.jpg', 13);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (62, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook_pro_13-in_m2_chip_silver_1166.jpg', 13);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (63, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_4_3.png', 13);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (64, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-spacegray-select-202206.jpg', 13);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (65, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-silver-select-202206.jpg', 13);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (66, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-1.jpg', 14);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (67, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-2.jpg', 14);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (68, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-3.jpg', 14);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (69, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-8.jpg', 14);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (70, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-air-15-inch-m2-2023-5.jpg', 14);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (71, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/p/r/pro_8gb.png', 15);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (72, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-silver-gallery3-202011-removebg-preview.png.jpg', 15);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (73, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-spacegray-select-202011.jpg', 15);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (74, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-silver-select-202011.jpg', 15);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (75, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-silver-gallery4-202011-removebg-preview.png.jpg', 15);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (76, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp14-spacegray-select-202301_1.jpg', 16);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (77, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/i/n/in_the_box_14_inch__cla7biqzxe6a_large_3.jpg', 16);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (78, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/k/e/keyboard_14_inch__bjo3gj8bnogi_large_3.jpg', 16);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (79, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/r/o/routers_compare__dg2f68dd3y0y_large_3.jpg', 16);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (80, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/d/i/display_14_inch__f298e9zwj02m_large_3.jpg', 16);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (81, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_74_10_2.png', 17);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (82, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_54_9_2.png', 17);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (83, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_40_7_2.png', 17);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (84, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_33_8_2.png', 17);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (85, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_27_7_2.png', 17);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (86, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook_pro_m22.png', 18);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (87, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/h/e/hero_13__d1tfa5zby7e6_large00_1_1_1.jpg', 18);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (88, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_4_3_1_2_1.png', 18);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (89, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-spacegray-select-202206_1_1_2.jpg', 18);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (90, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-silver-select-202206_1_1_2.jpg', 18);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (91, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-pro-2021-02_5.jpg', 19);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (92, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-pro-2021-06_8.jpg', 19);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (93, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-pro-2021-001_1_1.jpg', 19);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (94, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-pro-2021-005_1_1.jpg', 19);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (95, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/macbook-pro-2021-004_1_1.jpg', 19);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (96, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/mac_pro_16gb.png', 20);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (97, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/h/e/hero_13__d1tfa5zby7e6_large00_1_1.jpg', 20);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (98, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/_/t_i_xu_ng_4_3_1_2.png', 20);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (99, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-spacegray-select-202206_1_1.jpg', 20);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (100, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/b/mbp-silver-select-202206_1_1.jpg', 20);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (101, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_54_9_1.png', 21);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (102, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_40_7_1.png', 21);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (103, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_33_8_1.png', 21);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (104, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_27_7_1.png', 21);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (105, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_74_10_1.png', 21);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (106, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173635.793.png', 22);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (107, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173651.079.png', 22);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (108, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173707.722.png', 22);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (109, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173723.970.png', 22);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (110, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173737.208.png', 22);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (111, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-20t120755.118.png', 23);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (112, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-20t120809.309.png', 23);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (113, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-20t120839.441.png', 23);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (114, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-20t120823.489.png', 23);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (115, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-20t120851.612.png', 23);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (116, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_9__1_92.png', 24);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (117, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_11__2_68.png', 24);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (118, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_10__2_66.png', 24);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (119, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_12__1_59.png', 24);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (120, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_13__3_21.png', 24);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (121, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173635.793_2.png', 25);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (122, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173651.079_1.png', 25);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (123, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173707.722_1.png', 25);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (124, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173723.970_1.png', 25);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (125, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173737.208_1.png', 25);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (126, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_64_37.jpg', 26);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (127, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_22_24.jpg', 26);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (128, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_54_31.jpg', 26);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (129, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_33_29.jpg', 26);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (130, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_39_31.jpg', 26);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (131, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0006_g14-2021-4_compressed.jpg', 27);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (132, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0000_g14-2021-2_compressed.jpg', 27);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (133, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0005_g14-2021-3_compressed.jpg', 27);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (134, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0003_g14-2021-7_compressed.jpg', 27);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (135, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0001_g14-2021-5_compressed.jpg', 27);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (136, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_2__2_57.png', 28);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (137, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_3__1_101.png', 28);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (138, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_7__91.png', 28);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (139, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_3_74.png', 28);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (140, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_4__1_103.png', 28);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (141, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0005_65287_laptop_asus_gaming_tuf_fx5.jpg', 29);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (142, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0004_65287_laptop_asus_gaming_tuf_fx5_1_.jpg', 29);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (143, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0001_65287_laptop_asus_gaming_tuf_fx5_4_.jpg', 29);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (144, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0002_65287_laptop_asus_gaming_tuf_fx5_3_.jpg', 29);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (145, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0000_65287_laptop_asus_gaming_tuf_fx5_5_.jpg', 29);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (146, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005227.065.png', 30);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (147, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005213.228.png', 30);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (148, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-08t001534.826_1.png', 30);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (149, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005150.492.png', 30);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (150, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_-_2023-06-08t001503.144_1.png', 30);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (151, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0003_41155_laptop_asus_tuf_dash_f15_f_4_.jpg', 31);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (152, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0000_41155_laptop_asus_tuf_dash_f15_f_1_.jpg', 31);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (153, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0004_41155_laptop_asus_tuf_dash_f15_f.jpg', 31);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (154, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0001_41155_laptop_asus_tuf_dash_f15_f_2_.jpg', 31);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (155, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0002_41155_laptop_asus_tuf_dash_f15_f_3_.jpg', 31);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (156, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0004_asus-rog-strix-g15-g513rm-hq055w.jpg', 32);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (157, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0001_asus-rog-strix-g15-g513rm-hq055w_2_.jpg', 32);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (158, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0000_asus-rog-strix-g15-g513rm-hq055w_1_.jpg', 32);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (159, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0002_asus-rog-strix-g15-g513rm-hq055w_3_.jpg', 32);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (160, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0003_asus-rog-strix-g15-g513rm-hq055w_4_.jpg', 32);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (161, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_64_73.jpg', 33);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (162, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_33_52.jpg', 33);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (163, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_54_61.jpg', 33);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (164, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_39_55.jpg', 33);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (165, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_22_48.jpg', 33);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (166, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_472.png', 34);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (167, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_472.png', 34);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (168, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_365.png', 34);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (169, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_318.png', 34);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (170, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_271.png', 34);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (171, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-0.jpg', 35);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (172, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-1.jpg', 35);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (173, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-2.jpg', 35);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (174, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-3.jpg', 35);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (175, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-4.jpg', 35);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (176, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_9__1_22.png', 36);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (177, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_12__1_9.png', 36);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (178, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_11__2_9.png', 36);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (179, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_10__2_9.png', 36);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (180, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_13__2_5.png', 36);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (181, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_11__10.png', 37);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (182, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_12__8.png', 37);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (183, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_13__9.png', 37);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (184, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_14__8.png', 37);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (185, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_15__8.png', 37);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (186, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_5__1_2.png', 38);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (187, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_6__6.png', 38);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (188, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_13__5.png', 38);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (189, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_14__4.png', 38);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (190, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_15__5.png', 38);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (191, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_190.png', 39);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (192, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_172_2.png', 39);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (193, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_165_2.png', 39);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (194, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_151_2.png', 39);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (195, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_130_2.png', 39);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (196, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_211_1.png', 40);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (197, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_163.png', 40);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (198, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_170.png', 40);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (199, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_149.png', 40);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (200, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_128.png', 40);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (201, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_288.png', 41);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (202, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_309_5.png', 41);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (203, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_260_3.png', 41);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (204, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_245_3.png', 41);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (205, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_223_3.png', 41);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (206, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_192.png', 42);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (207, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_174.png', 42);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (208, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_167.png', 42);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (209, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_153.png', 42);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (210, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_132.png', 42);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (211, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/1/11_43_4.jpg', 43);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (212, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_3__1_56.png', 43);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (213, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_4__1_56.png', 43);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (214, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_5__1_57.png', 43);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (215, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_8__1_25.png', 43);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (216, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/7/_/7_52_2.png', 44);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (217, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/8/_/8_42_3.png', 44);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (218, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_123_2.png', 44);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (219, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_102_2.png', 44);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (220, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/1/_/1_144_4.png', 44);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (221, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_349.png', 45);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (222, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_318.png', 45);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (223, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_290.png', 45);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (224, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/7/_/7_163.png', 45);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (225, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_225.png', 45);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (226, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_16__1_43.png', 46);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (227, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_10__2_61.png', 46);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (228, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_11__2_63.png', 46);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (229, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_12__1_53.png', 46);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (230, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_15__3_32.png', 46);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (231, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/2/_/2_290.png', 47);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (232, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/3/_/3_263.png', 47);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (233, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/4/_/4_248.png', 47);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (234, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/5/_/5_226.png', 47);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (235, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/_/6_199.png', 47);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (236, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0004_5zsybgo6z2id2-_wvjfcip1csro4cjjjwjm.jpg', 48);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (237, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0004_5zsybgo6z2id2-_wvjfcip1csro4cwjm.jpg', 48);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (238, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0003_lr-jcyobxqytn26bkfae9enbfifu5pyh.jpg', 48);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (239, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0001_screenshot_1__1.jpg', 48);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (240, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/_/0/_0000_screenshot_1_2.jpg', 48);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (241, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_44__3.png', 49);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (242, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_45__1_2.png', 49);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (243, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_3__1_76.png', 49);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (244, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_47__1_2.png', 49);
INSERT INTO public.image (id, url, productid) OVERRIDING SYSTEM VALUE VALUES (245, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_46__1.png', 49);


--
-- TOC entry 3390 (class 0 OID 32343)
-- Dependencies: 223
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (1, 1, 1, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (2, 1, 2, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (5, 2, 1, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (6, 2, 2, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (7, 2, 3, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (8, 3, 1, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (9, 3, 2, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (10, 3, 3, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (11, 3, 4, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (12, 3, 5, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (13, 4, 4, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (14, 4, 5, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (15, 5, 2, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (16, 5, 3, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (17, 5, 5, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (18, 6, 1, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (19, 6, 3, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (20, 7, 4, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (21, 7, 5, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (22, 7, 1, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (3, 16, 4, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (4, 29, 14, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (25, 32, 14, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (26, 33, 2, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (27, 34, 1, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (28, 34, 6, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (29, 34, 49, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (30, 35, 2, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (31, 35, 3, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (32, 36, 3, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (33, 36, 1, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (34, 37, 3, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (35, 37, 1, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (36, 38, 1, 2);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (37, 38, 2, 1);
INSERT INTO public.order_detail (id, orderid, productid, quantity) VALUES (38, 39, 2, 1);


--
-- TOC entry 3385 (class 0 OID 32331)
-- Dependencies: 218
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (3, '2023-08-03', '57 Phan Văn Sửu, Tân Bình, HCM', 1, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (4, '2023-01-04', 'Số 7 Đồng Xoài, Tân Bình, HCM', 2, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (5, '2023-02-05', 'Số 7 Đồng Xoài, Tân Bình, HCM', 2, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (6, '2023-04-06', 'Số 7 Đồng Xoài, Tân Bình, HCM', 2, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (7, '2023-03-07', '57 Hoàng Hoa Thám, Tân Bình, HCM', 3, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (8, '2023-04-08', '57 Hoàng Hoa Thám, Tân Bình, HCM', 3, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (9, '2023-05-09', '57 Hoàng Hoa Thám, Tân Bình, HCM', 3, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (10, '2023-01-10', '66 Phan Văn Sửu, Tân Bình, HCM', 4, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (11, '2023-02-11', '67 Phan Văn Sửu, Tân Bình, HCM', 4, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (12, '2023-02-12', '68 Phan Văn Sửu, Tân Bình, HCM', 4, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (13, '2023-03-13', '60Trương Công Định, Tân Bình, HCM', 5, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (14, '2023-03-14', '60Trương Công Định, Tân Bình, HCM', 5, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (16, '2023-08-06', '', 6, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (29, '2023-08-06', '', 6, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (30, '2023-08-06', '', 6, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (31, '2023-08-06', '', 6, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (32, '2023-08-06', '', 6, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (33, '2023-08-15', '', 12, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (1, '2023-08-15', '57 Phan Văn Sửu, Tân Bình, HCM', 1, 1);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (2, '2023-08-15', '57 Phan Văn Sửu, Tân Bình, HCM', 1, 1);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (35, '2023-08-15', '', 12, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (34, '2023-08-15', '', 12, 1);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (36, '2023-08-15', '', 1, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (37, '2023-08-15', '', 1, 1);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (38, '2023-08-15', '', 12, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (39, '2023-08-18', '', 12, 0);
INSERT INTO public.orders (id, buy_date, place, customerid, status) OVERRIDING SYSTEM VALUE VALUES (40, '2023-08-18', '', 12, 0);


--
-- TOC entry 3392 (class 0 OID 32347)
-- Dependencies: 225
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (2, 'Laptop Asus Vivobook Slate', '16GB', '15.6 inch', '512GB', '2022-01-23', 'window 11', 19990000, 12, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/r/t/rtytu_9_.jpg', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (5, 'Laptop HP Gaming Victus', '8GB', '15.6 inch', '1TB', '2022-01-26', 'window 11', 16790000, 11, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-6.jpg', 4, 5, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (4, 'Laptop ASUS Gaming TUF', '16GB', '15.6 inch', '2TB', '2022-01-25', 'window 11', 16790000, 10, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/5/h/5h03_1.png', 1, 5, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (1, 'Apple MacBook Air M1', '8GB', '13.3 inch', '256GB', '2022-01-21', 'macOS Big Sur', 18990000, 22, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/i/air_m2.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (13, 'Apple Macbook Pro 13 M2 2022', '8GB', '13.3 inch', '256GB', '2022-02-08', 'macOS Big Sur', 28990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/r/pro-m2.jpg', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (14, 'Macbook Air 15 inch M2 2023', '8GB', '15.6 inch', '256GB', '2023-01-20', 'macOS Big Sur', 31490000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_m2_8gb.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (27, 'Laptop ASUS Gaming ROG Zephyrus', '8GB', '14 inch', '512GB', '2022-01-20', 'window 11', 25190000, 16, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/1/11h53.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (12, 'Apple Macbook Air M2 2022', '8GB', '14 inch', '256GB', '2022-02-07', 'macOS Big Sur', 26890000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_air_m22.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (15, 'Apple MacBook Pro 13 Touch Bar M1 2020', '8GB', '13.3 inch', '256GB', '2022-01-20', 'macOS Big Sur', 27590000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/p/r/pro_8gb.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (16, 'MacBook Pro 14 inch M2 Pro 2023', '16GB', '14 inch', '512GB', '2023-01-20', 'macOS Big Sur', 47790000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/2/m2_pro_14.png', 5, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (17, 'Apple Macbook Air M2 2022', '16GB', '13.3 inch', '256GB', '2022-01-20', 'macOS Big Sur', 32290000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/i/air_m2_16gb.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (18, 'Apple MacBook Pro 13 M2 2022', '16GB', '13.3 inch', '256GB', '2022-01-20', 'macOS Big Sur', 35690000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/macbook_pro_m22.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (19, 'Macbook Pro 14 M1 Pro', '16GB', '14 inch', '1TB', '2022-01-22', 'macOS Big Sur', 43990000, 15, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/mac_pro.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (20, 'Apple MacBook Pro 13 M2 2022', '16GB', '13.3 inch', '512GB', '2022-01-20', 'macOS Big Sur', 39990000, 16, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/m/a/mac_pro_16gb.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (21, 'Apple Macbook Air M2 2022', '8GB', '13.3 inch', '512GB', '2022-01-20', 'macOS Big Sur', 31990000, 16, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/a/p/apple_m2.png', 5, 6, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (3, 'Laptop Lenovo Ideapad Gaming 3 ', '8GB', '14 inch', '256GB', '2022-01-24', 'window 11', 23990000, 20, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/h/1h47.png', 3, 3, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (6, 'Laptop gaming MSI GF63 Thin', '8GB', '15.6 inch', '512GB', '2022-01-22', 'window 11', 11990000, 11, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_ng_n_21_.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (7, 'Laptop MSI Crosshair 15', '16GB', '15.6 inch', '1TB', '2022-02-01', 'window 11', 27490000, 10, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_20_.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (8, 'Laptop MSI Modern 14
', '16GB', '14 inch', '512GB', '2022-02-02', 'window 11', 11990000, 13, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_-_2023-06-19t181236.684.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (9, 'Laptop MSI Modern 14', '8GB', '14 inch', '512GB', '2022-02-04', 'window 11', 9990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_17__1_32.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (10, 'Laptop MSI Cyborg 15', '8GB', '15.6 inch', '512GB', '2022-02-05', 'window 11', 17390000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_d_i_12__1.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (11, 'Laptop MSI Gaming Katana', '8GB', '15.6 inch', '512GB', '2022-02-06', 'window 11', 21290000, 13, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/h/thi_t_k_ch_a_c_t_n_1_2.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (22, 'Laptop MSI Modern 15', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 14990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_-_2023-06-19t173614.213.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (23, 'Laptop MSI Gaming Alpha 15', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 19790000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_d_i_23_.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (24, 'Laptop MSI Gaming GF63', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 20190000, 16, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_8__1_77.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (25, 'Laptop MSI Modern 15', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 13490000, 16, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_-_2023-06-19t175544.774.png', 2, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (26, 'Laptop Asus Gaming Rog Strix G15', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 18290000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/4/h/4h43.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (28, 'Laptop Asus VivoBook 15 OLED', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 17590000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_1__1_120.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (29, 'Laptop Asus TUF GAMING', '8GB', '15.6 inch', '512GB', '2022-01-22', 'window 11', 16690000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (30, 'Laptop Asus VivoBook Go 14', '16GB', '14 inch', '512GB', '2022-01-23', 'window 11', 13490000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005130.908.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (31, 'Laptop ASUS TUF DASH Gaming', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 19890000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/0/10h45_2.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (32, 'Laptop ASUS Gaming ROG Strix', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 32890000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/1/11h50.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (33, 'Laptop Asus Zenbook', '8GB', '14 inch', '512GB', '2022-01-20', 'window 11', 18990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2.5_1.png', 1, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (34, 'Laptop HP Pavilion', '8GB', '15.6 inch', '256GB', '2022-01-20', 'window 11', 15290000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/_/2_448.png', 4, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (35, 'Laptop HP Gaming Victus', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 16790000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/l/a/laptop-hp-gaming-victus-15-fa0031dx-6503849-6.jpg', 4, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (36, 'Laptop HP Gaming Victus ', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 19490000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_7__35.png', 4, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (37, 'Laptop HP Gaming Victus', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 20490000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_d_i_3__3.png', 4, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (38, 'Laptop Lenovo Gaming Legion 5', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 24490000, 15, 'https://cdn2.cellphones.com.vn/x/media/catalog/product/t/e/text_d_i_2__5.png', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (39, 'Laptop Lenovo Ideapad 5 Pro', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 19990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/2/h/2h08.png', 3, 4, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (40, 'Laptop Lenovo Ideapad Gaming', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 19490000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/e/g/egtg.jpg', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (41, 'Laptop Lenovo Ideapad Gaming', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 19990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_309_5.png', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (42, 'Laptop Lenovo Ideapad Gaming', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 17990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/h/thi_t_k_ch_a_c_t_n_3.png', 3, 4, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (43, 'Laptop Lenovo Ideapad Gaming', '8GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 17590000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_2__2_8.png', 3, 4, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (44, 'Laptop Lenovo Ideapad Gaming', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 20990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/s/a/sa_2.png', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (45, 'Laptop Lenovo Ideapad 5 Pro', '16GB', '14 inch', '512GB', '2022-01-20', 'window 11', 22490000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_372.png', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (46, 'Laptop Lenovo IdeaPad 3', '8GB', '15.6 inch', '256GB', '2022-01-20', 'window 11', 11790000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_ng_n_22__28.png', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (47, 'Laptop Lenovo Gaming Legion 5', '16GB', '15.6 inch', '512GB', '2022-01-20', 'window 11', 34990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/1/_/1_312_2.png', 3, 2, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (48, 'Laptop Lenovo Yoga Slim 7', '8GB', '14 inch', '512GB', '2022-01-20', 'window 11', 20990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/v/e/vega.jpg', 3, 4, NULL);
INSERT INTO public.product (id, name, ram, display, rom, published_date, os, price, quantity, logo, brandid, colorid, puslished_date) VALUES (49, 'Laptop Lenovo ThinkPad', '8GB', '14 inch', '512GB', '2022-01-20', 'window 11', 18990000, 15, 'https://cdn2.cellphones.com.vn/358x358,webp,q100/media/catalog/product/t/e/text_d_i_6__1.png', 3, 4, NULL);


--
-- TOC entry 3394 (class 0 OID 32353)
-- Dependencies: 227
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (1, '123', 'Nguyễn Thị Thuỷ', 'thuynt@gmail.com', '987654321', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (2, '1999', 'Lê Văn Việt', 'vietlv@gmail.com', '362684321', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (3, '9999', 'Trần Thị Minh', 'minhtt@gmail.com', '937753521', true, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (4, '9910', 'Nguyễn Kim Na', 'nank@gmail.com', '387444121', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (5, '1234', 'Phạm Nhật Vượng', 'vuongpn@gmail.com', '987654144', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (6, '1235', 'Bùi Xuân Huấn', 'huanbx@gmail.com', '987651245', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (7, '1236', 'Ngô Bá Khá', 'khanb@gmail.com', '911654321', true, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (8, '1237', 'Nguyễn Quốc Cường', 'cuongnq@gmail.com', '386654321', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (9, '1238', 'Phạm Nhật Minh', 'minhpn@gmail.com', '987612221', false, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (10, '1239', 'Phạm Minh Tuấn', 'tuanpm@gmail.com', '981527321', true, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (11, '12311', 'Trần Lê Cường', 'cuongtl@gmail.com', '937654521', true, false, NULL, '2023-08-26 12:17:00.674954');
INSERT INTO public.users (id, password, fullname, email, phone, is_admin, active, token, created_at) VALUES (12, '123', 'Bùi Vũ Thiên Ân', 'nhok.kulun56@gmail.com', '937654521', true, false, NULL, '2023-08-26 12:17:00.674954');


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 219
-- Name: donhang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.donhang_id_seq', 40, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 220
-- Name: giohang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.giohang_id_seq', 15, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 222
-- Name: hinhanhsanpham_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hinhanhsanpham_id_seq', 250, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 224
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 38, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 226
-- Name: thuonghieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.thuonghieu_id_seq', 49, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 228
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- TOC entry 3215 (class 2606 OID 32362)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 32364)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 32366)
-- Name: category category_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey1 PRIMARY KEY (orderid, productid);


--
-- TOC entry 3221 (class 2606 OID 32368)
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 32370)
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 32372)
-- Name: orders order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 32374)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 32376)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3230 (class 2606 OID 32377)
-- Name: cart fk_cart_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_color FOREIGN KEY (colorid) REFERENCES public.color(id);


--
-- TOC entry 3235 (class 2606 OID 32382)
-- Name: order_detail fk_cart_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk_cart_order FOREIGN KEY (orderid) REFERENCES public.orders(id);


--
-- TOC entry 3231 (class 2606 OID 32387)
-- Name: cart fk_cart_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3232 (class 2606 OID 32392)
-- Name: cart fk_cart_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_user FOREIGN KEY (userid) REFERENCES public.users(id);


--
-- TOC entry 3236 (class 2606 OID 32397)
-- Name: order_detail fk_category_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fk_category_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3234 (class 2606 OID 32402)
-- Name: image fk_image_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT fk_image_product FOREIGN KEY (productid) REFERENCES public.product(id);


--
-- TOC entry 3233 (class 2606 OID 32407)
-- Name: orders fk_order_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_customer FOREIGN KEY (customerid) REFERENCES public.users(id);


--
-- TOC entry 3237 (class 2606 OID 32412)
-- Name: product fk_product_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_brand FOREIGN KEY (brandid) REFERENCES public.brand(id);


--
-- TOC entry 3238 (class 2606 OID 32417)
-- Name: product fk_product_color; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_color FOREIGN KEY (colorid) REFERENCES public.color(id);


-- Completed on 2023-08-26 12:18:06

--
-- PostgreSQL database dump complete
--

