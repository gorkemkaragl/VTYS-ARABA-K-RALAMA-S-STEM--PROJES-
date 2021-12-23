--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-19 15:55:05

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
-- TOC entry 236 (class 1255 OID 16625)
-- Name: kdvlifiyat(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.kdvlifiyat(fiyat double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
begin
fiyat:=fiyat*0.08+fiyat;
return fiyat;
end;
$$;


ALTER FUNCTION public.kdvlifiyat(fiyat double precision) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 16586)
-- Name: musteriartir(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.musteriartir()
    LANGUAGE plpgsql
    AS $$
begin
raise notice 'Musteri Basariyla Eklendi';
end; $$;


ALTER PROCEDURE public.musteriartir() OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 16590)
-- Name: musteriazalt(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.musteriazalt()
    LANGUAGE plpgsql
    AS $$
begin
raise notice 'Müsteri Basariyla Silindi';
end;$$;


ALTER PROCEDURE public.musteriazalt() OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 16585)
-- Name: musterisayisiartir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.musterisayisiartir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update "MusteriSayisi" set sayi=sayi+1;
return new;
end;
$$;


ALTER FUNCTION public.musterisayisiartir() OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 16589)
-- Name: musterisayisiazalt(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.musterisayisiazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update "MusteriSayisi" set sayi=sayi-1;
return new;
end;
$$;


ALTER FUNCTION public.musterisayisiazalt() OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 16609)
-- Name: personelartir(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.personelartir()
    LANGUAGE plpgsql
    AS $$
begin
raise notice 'personel Basariyla eklendi';
end;$$;


ALTER PROCEDURE public.personelartir() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 16622)
-- Name: personelazalt(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.personelazalt()
    LANGUAGE plpgsql
    AS $$
begin
raise notice 'personel Basariyla Silindi';
end;
$$;


ALTER PROCEDURE public.personelazalt() OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 16635)
-- Name: personelgetir(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personelgetir(personelno integer) RETURNS TABLE(numara integer, adi character varying, soyadi character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT "personelNo", "personelAdi", "personelSoyadi" FROM "Personel"
                 WHERE "personelNo" = personelNo;
END;
$$;


ALTER FUNCTION public.personelgetir(personelno integer) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 16607)
-- Name: personelsayisiartir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personelsayisiartir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update "PersonelSayisi" set sayi=sayi+1;
return new;
end;
$$;


ALTER FUNCTION public.personelsayisiartir() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 16610)
-- Name: personelsayisiazalt(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.personelsayisiazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update "PersonelSayisi" set sayi=sayi-1;
return new;
end;
$$;


ALTER FUNCTION public.personelsayisiazalt() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16416)
-- Name: Araba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Araba" (
    "arabaNo" integer NOT NULL,
    adet integer NOT NULL,
    "bakimNo" integer NOT NULL,
    "markaNo" integer NOT NULL,
    "yolcuSayisiNo" integer NOT NULL,
    "kiraSuresiNo" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Araba" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16471)
-- Name: Bakim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Bakim" (
    "bakimNo" integer NOT NULL,
    "bakimTuruNo" integer NOT NULL,
    "bakimSuresiGunu" integer NOT NULL
);


ALTER TABLE public."Bakim" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16466)
-- Name: BakimTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BakimTuru" (
    "bakimTuruNo" integer NOT NULL,
    "bakimTuruAdi" character varying(15) NOT NULL
);


ALTER TABLE public."BakimTuru" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16537)
-- Name: Cinsiyet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cinsiyet" (
    "cinsiyetNo" integer NOT NULL,
    cinsiyet character varying(5) NOT NULL
);


ALTER TABLE public."Cinsiyet" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16500)
-- Name: Fiyat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Fiyat" (
    "fiyatNo" integer NOT NULL,
    fiyat integer NOT NULL
);


ALTER TABLE public."Fiyat" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16527)
-- Name: Il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Il" (
    "ilNo" integer NOT NULL,
    il character varying(15) NOT NULL,
    "ilceNo" integer NOT NULL
);


ALTER TABLE public."Il" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16522)
-- Name: Ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ilce" (
    "ilceNo" integer NOT NULL,
    ilce character varying(15) NOT NULL
);


ALTER TABLE public."Ilce" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16488)
-- Name: KiraSuresi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KiraSuresi" (
    "kiraSuresiNo" integer NOT NULL,
    "gunSayisi" integer NOT NULL,
    "fiyatNo" integer NOT NULL
);


ALTER TABLE public."KiraSuresi" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16432)
-- Name: Marka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Marka" (
    "markaNo" integer NOT NULL,
    "markaAdi" character varying(15) NOT NULL,
    "turNo" integer NOT NULL,
    "modelNo" integer NOT NULL
);


ALTER TABLE public."Marka" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16427)
-- Name: Model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Model" (
    "modelNo" integer NOT NULL,
    "modelAdi" character varying(15) NOT NULL
);


ALTER TABLE public."Model" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16532)
-- Name: Musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Musteri" (
    "musteriNo" integer NOT NULL,
    ad character varying(15) NOT NULL,
    soyad character varying(15) NOT NULL,
    "cinsiyetNo" integer NOT NULL,
    "ilNo" integer NOT NULL
);


ALTER TABLE public."Musteri" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16582)
-- Name: MusteriSayisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MusteriSayisi" (
    sayi integer NOT NULL
);


ALTER TABLE public."MusteriSayisi" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16560)
-- Name: Personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Personel" (
    "personelNo" integer NOT NULL,
    "yetkiNo" integer NOT NULL,
    "cinsiyetNo" integer NOT NULL,
    "personelAdi" character varying(15) NOT NULL,
    "personelSoyadi" character varying(15) NOT NULL
);


ALTER TABLE public."Personel" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16604)
-- Name: PersonelSayisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PersonelSayisi" (
    sayi integer NOT NULL
);


ALTER TABLE public."PersonelSayisi" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16437)
-- Name: Tur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tur" (
    "turNo" integer NOT NULL,
    "turAdi" character varying(15) NOT NULL
);


ALTER TABLE public."Tur" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16565)
-- Name: Yetki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yetki" (
    "yetkiNo" integer NOT NULL,
    "yetkiAdi" character varying(15) NOT NULL
);


ALTER TABLE public."Yetki" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16411)
-- Name: YolcuSayisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."YolcuSayisi" (
    "yolcuSayisiNo" integer NOT NULL,
    "yolcuSayisi" integer NOT NULL
);


ALTER TABLE public."YolcuSayisi" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16612)
-- Name: arabaview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.arabaview AS
 SELECT "Araba"."arabaNo",
    "YolcuSayisi"."yolcuSayisi",
    "Marka"."markaAdi",
    "Model"."modelAdi",
    "Tur"."turAdi",
    "KiraSuresi"."gunSayisi",
    "Fiyat".fiyat
   FROM ((((((public."Araba"
     JOIN public."YolcuSayisi" ON (("YolcuSayisi"."yolcuSayisiNo" = "Araba"."yolcuSayisiNo")))
     JOIN public."Marka" ON (("Marka"."markaNo" = "Araba"."markaNo")))
     JOIN public."Model" ON (("Model"."modelNo" = "Marka"."modelNo")))
     JOIN public."Tur" ON (("Tur"."turNo" = "Marka"."turNo")))
     JOIN public."KiraSuresi" ON (("KiraSuresi"."kiraSuresiNo" = "Araba"."kiraSuresiNo")))
     JOIN public."Fiyat" ON (("Fiyat"."fiyatNo" = "KiraSuresi"."fiyatNo")));


ALTER TABLE public.arabaview OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16617)
-- Name: musteriview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.musteriview AS
 SELECT "Musteri"."musteriNo",
    "Musteri".ad,
    "Musteri".soyad,
    "Cinsiyet".cinsiyet,
    "Il".il,
    "Ilce".ilce
   FROM (((public."Musteri"
     JOIN public."Cinsiyet" ON (("Cinsiyet"."cinsiyetNo" = "Musteri"."cinsiyetNo")))
     JOIN public."Il" ON (("Il"."ilNo" = "Musteri"."ilNo")))
     JOIN public."Ilce" ON (("Ilce"."ilceNo" = "Il"."ilceNo")));


ALTER TABLE public.musteriview OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 16416)
-- Dependencies: 210
-- Data for Name: Araba; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Araba" ("arabaNo", adet, "bakimNo", "markaNo", "yolcuSayisiNo", "kiraSuresiNo") VALUES (1, 15, 2, 3, 2, 1);
INSERT INTO public."Araba" ("arabaNo", adet, "bakimNo", "markaNo", "yolcuSayisiNo", "kiraSuresiNo") VALUES (2, 45, 3, 1, 1, 2);
INSERT INTO public."Araba" ("arabaNo", adet, "bakimNo", "markaNo", "yolcuSayisiNo", "kiraSuresiNo") VALUES (3, 5, 1, 4, 3, 3);


--
-- TOC entry 3453 (class 0 OID 16471)
-- Dependencies: 215
-- Data for Name: Bakim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Bakim" ("bakimNo", "bakimTuruNo", "bakimSuresiGunu") VALUES (1, 1, 3);
INSERT INTO public."Bakim" ("bakimNo", "bakimTuruNo", "bakimSuresiGunu") VALUES (2, 2, 5);
INSERT INTO public."Bakim" ("bakimNo", "bakimTuruNo", "bakimSuresiGunu") VALUES (3, 3, 6);


--
-- TOC entry 3452 (class 0 OID 16466)
-- Dependencies: 214
-- Data for Name: BakimTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."BakimTuru" ("bakimTuruNo", "bakimTuruAdi") VALUES (1, 'komple ic-dis');
INSERT INTO public."BakimTuru" ("bakimTuruNo", "bakimTuruAdi") VALUES (2, 'ic bakim');
INSERT INTO public."BakimTuru" ("bakimTuruNo", "bakimTuruAdi") VALUES (3, 'dis bakim');


--
-- TOC entry 3459 (class 0 OID 16537)
-- Dependencies: 221
-- Data for Name: Cinsiyet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cinsiyet" ("cinsiyetNo", cinsiyet) VALUES (1, 'Erkek');
INSERT INTO public."Cinsiyet" ("cinsiyetNo", cinsiyet) VALUES (2, 'Kadin');


--
-- TOC entry 3455 (class 0 OID 16500)
-- Dependencies: 217
-- Data for Name: Fiyat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Fiyat" ("fiyatNo", fiyat) VALUES (1, 100);
INSERT INTO public."Fiyat" ("fiyatNo", fiyat) VALUES (2, 200);


--
-- TOC entry 3457 (class 0 OID 16527)
-- Dependencies: 219
-- Data for Name: Il; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Il" ("ilNo", il, "ilceNo") VALUES (1, 'Sakarya', 1);
INSERT INTO public."Il" ("ilNo", il, "ilceNo") VALUES (2, 'Trabzon', 2);
INSERT INTO public."Il" ("ilNo", il, "ilceNo") VALUES (3, 'Ankara', 3);


--
-- TOC entry 3456 (class 0 OID 16522)
-- Dependencies: 218
-- Data for Name: Ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ilce" ("ilceNo", ilce) VALUES (1, 'akyazi');
INSERT INTO public."Ilce" ("ilceNo", ilce) VALUES (2, 'Besikduzu');
INSERT INTO public."Ilce" ("ilceNo", ilce) VALUES (3, 'Mamak');


--
-- TOC entry 3454 (class 0 OID 16488)
-- Dependencies: 216
-- Data for Name: KiraSuresi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KiraSuresi" ("kiraSuresiNo", "gunSayisi", "fiyatNo") VALUES (1, 1, 1);
INSERT INTO public."KiraSuresi" ("kiraSuresiNo", "gunSayisi", "fiyatNo") VALUES (2, 7, 2);
INSERT INTO public."KiraSuresi" ("kiraSuresiNo", "gunSayisi", "fiyatNo") VALUES (3, 30, 1);
INSERT INTO public."KiraSuresi" ("kiraSuresiNo", "gunSayisi", "fiyatNo") VALUES (4, 15, 2);


--
-- TOC entry 3450 (class 0 OID 16432)
-- Dependencies: 212
-- Data for Name: Marka; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Marka" ("markaNo", "markaAdi", "turNo", "modelNo") VALUES (1, 'Mercedes', 1, 2);
INSERT INTO public."Marka" ("markaNo", "markaAdi", "turNo", "modelNo") VALUES (2, 'Mercedes', 3, 1);
INSERT INTO public."Marka" ("markaNo", "markaAdi", "turNo", "modelNo") VALUES (3, 'BMW', 2, 6);
INSERT INTO public."Marka" ("markaNo", "markaAdi", "turNo", "modelNo") VALUES (4, 'Volvo', 5, 5);
INSERT INTO public."Marka" ("markaNo", "markaAdi", "turNo", "modelNo") VALUES (5, 'Ferrari', 4, 4);


--
-- TOC entry 3449 (class 0 OID 16427)
-- Dependencies: 211
-- Data for Name: Model; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (1, 'x500-7500');
INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (2, 'm700');
INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (3, 'superb');
INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (4, 'calibre');
INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (5, 'mons61');
INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (6, 'trash');
INSERT INTO public."Model" ("modelNo", "modelAdi") VALUES (7, 'klia');


--
-- TOC entry 3458 (class 0 OID 16532)
-- Dependencies: 220
-- Data for Name: Musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Musteri" ("musteriNo", ad, soyad, "cinsiyetNo", "ilNo") VALUES (3, 'Gulsen', 'Mutlu', 2, 2);
INSERT INTO public."Musteri" ("musteriNo", ad, soyad, "cinsiyetNo", "ilNo") VALUES (5, 'Gulsen', 'Mutlu', 2, 2);
INSERT INTO public."Musteri" ("musteriNo", ad, soyad, "cinsiyetNo", "ilNo") VALUES (15, 'adfd', 'sdfd', 1, 1);
INSERT INTO public."Musteri" ("musteriNo", ad, soyad, "cinsiyetNo", "ilNo") VALUES (2, 'görkem', 'karagöl', 1, 3);
INSERT INTO public."Musteri" ("musteriNo", ad, soyad, "cinsiyetNo", "ilNo") VALUES (14, 'dsfdsf', 'dffg', 2, 1);


--
-- TOC entry 3462 (class 0 OID 16582)
-- Dependencies: 224
-- Data for Name: MusteriSayisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."MusteriSayisi" (sayi) VALUES (5);


--
-- TOC entry 3460 (class 0 OID 16560)
-- Dependencies: 222
-- Data for Name: Personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Personel" ("personelNo", "yetkiNo", "cinsiyetNo", "personelAdi", "personelSoyadi") VALUES (1, 3, 1, 'Emir', 'Guven');
INSERT INTO public."Personel" ("personelNo", "yetkiNo", "cinsiyetNo", "personelAdi", "personelSoyadi") VALUES (3, 1, 2, 'Burcu', 'Mutlu');
INSERT INTO public."Personel" ("personelNo", "yetkiNo", "cinsiyetNo", "personelAdi", "personelSoyadi") VALUES (4, 4, 1, 'Selim', 'Ali');
INSERT INTO public."Personel" ("personelNo", "yetkiNo", "cinsiyetNo", "personelAdi", "personelSoyadi") VALUES (2, 2, 2, 'Gulsen', 'Sevinc');


--
-- TOC entry 3463 (class 0 OID 16604)
-- Dependencies: 225
-- Data for Name: PersonelSayisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."PersonelSayisi" (sayi) VALUES (4);


--
-- TOC entry 3451 (class 0 OID 16437)
-- Dependencies: 213
-- Data for Name: Tur; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tur" ("turNo", "turAdi") VALUES (1, 'spor');
INSERT INTO public."Tur" ("turNo", "turAdi") VALUES (2, 'arazi');
INSERT INTO public."Tur" ("turNo", "turAdi") VALUES (3, 'suv');
INSERT INTO public."Tur" ("turNo", "turAdi") VALUES (4, 'yarış');
INSERT INTO public."Tur" ("turNo", "turAdi") VALUES (5, 'kamyonet');


--
-- TOC entry 3461 (class 0 OID 16565)
-- Dependencies: 223
-- Data for Name: Yetki; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Yetki" ("yetkiNo", "yetkiAdi") VALUES (1, 'Mudur');
INSERT INTO public."Yetki" ("yetkiNo", "yetkiAdi") VALUES (2, 'Temizlikci');
INSERT INTO public."Yetki" ("yetkiNo", "yetkiAdi") VALUES (3, 'Guvenlik');
INSERT INTO public."Yetki" ("yetkiNo", "yetkiAdi") VALUES (4, 'Muhasebeci');


--
-- TOC entry 3447 (class 0 OID 16411)
-- Dependencies: 209
-- Data for Name: YolcuSayisi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."YolcuSayisi" ("yolcuSayisiNo", "yolcuSayisi") VALUES (1, 2);
INSERT INTO public."YolcuSayisi" ("yolcuSayisiNo", "yolcuSayisi") VALUES (2, 4);
INSERT INTO public."YolcuSayisi" ("yolcuSayisiNo", "yolcuSayisi") VALUES (3, 6);


--
-- TOC entry 3249 (class 2606 OID 16420)
-- Name: Araba Araba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Araba"
    ADD CONSTRAINT "Araba_pkey" PRIMARY KEY ("arabaNo");


--
-- TOC entry 3263 (class 2606 OID 16470)
-- Name: BakimTuru BakimTuru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BakimTuru"
    ADD CONSTRAINT "BakimTuru_pkey" PRIMARY KEY ("bakimTuruNo");


--
-- TOC entry 3265 (class 2606 OID 16475)
-- Name: Bakim Bakim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bakim"
    ADD CONSTRAINT "Bakim_pkey" PRIMARY KEY ("bakimNo");


--
-- TOC entry 3282 (class 2606 OID 16541)
-- Name: Cinsiyet Cinsiyet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cinsiyet"
    ADD CONSTRAINT "Cinsiyet_pkey" PRIMARY KEY ("cinsiyetNo");


--
-- TOC entry 3271 (class 2606 OID 16504)
-- Name: Fiyat Fiyat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Fiyat"
    ADD CONSTRAINT "Fiyat_pkey" PRIMARY KEY ("fiyatNo");


--
-- TOC entry 3275 (class 2606 OID 16531)
-- Name: Il Il_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Il"
    ADD CONSTRAINT "Il_pkey" PRIMARY KEY ("ilNo");


--
-- TOC entry 3273 (class 2606 OID 16526)
-- Name: Ilce Ilce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilce"
    ADD CONSTRAINT "Ilce_pkey" PRIMARY KEY ("ilceNo");


--
-- TOC entry 3268 (class 2606 OID 16492)
-- Name: KiraSuresi KiraSuresi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KiraSuresi"
    ADD CONSTRAINT "KiraSuresi_pkey" PRIMARY KEY ("kiraSuresiNo");


--
-- TOC entry 3257 (class 2606 OID 16436)
-- Name: Marka Marka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marka"
    ADD CONSTRAINT "Marka_pkey" PRIMARY KEY ("markaNo");


--
-- TOC entry 3255 (class 2606 OID 16431)
-- Name: Model Model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Model"
    ADD CONSTRAINT "Model_pkey" PRIMARY KEY ("modelNo");


--
-- TOC entry 3278 (class 2606 OID 16536)
-- Name: Musteri Musteri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "Musteri_pkey" PRIMARY KEY ("musteriNo");


--
-- TOC entry 3284 (class 2606 OID 16564)
-- Name: Personel Personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "Personel_pkey" PRIMARY KEY ("personelNo");


--
-- TOC entry 3261 (class 2606 OID 16441)
-- Name: Tur Tur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tur"
    ADD CONSTRAINT "Tur_pkey" PRIMARY KEY ("turNo");


--
-- TOC entry 3288 (class 2606 OID 16569)
-- Name: Yetki Yetki_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yetki"
    ADD CONSTRAINT "Yetki_pkey" PRIMARY KEY ("yetkiNo");


--
-- TOC entry 3247 (class 2606 OID 16415)
-- Name: YolcuSayisi YolcuSayisi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YolcuSayisi"
    ADD CONSTRAINT "YolcuSayisi_pkey" PRIMARY KEY ("yolcuSayisiNo");


--
-- TOC entry 3250 (class 1259 OID 16481)
-- Name: fki_ArabaBakim_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ArabaBakim_fKey" ON public."Araba" USING btree ("bakimNo");


--
-- TOC entry 3251 (class 1259 OID 16499)
-- Name: fki_ArabaKira_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ArabaKira_fKey" ON public."Araba" USING btree ("kiraSuresiNo");


--
-- TOC entry 3252 (class 1259 OID 16459)
-- Name: fki_ArabaMarka_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ArabaMarka_fKey" ON public."Araba" USING btree ("markaNo");


--
-- TOC entry 3253 (class 1259 OID 16426)
-- Name: fki_Araba_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Araba_fKey" ON public."Araba" USING btree ("yolcuSayisiNo");


--
-- TOC entry 3266 (class 1259 OID 16487)
-- Name: fki_BakimBTuru_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_BakimBTuru_fKey" ON public."Bakim" USING btree ("bakimTuruNo");


--
-- TOC entry 3276 (class 1259 OID 16547)
-- Name: fki_IlIlce_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_IlIlce_fKey" ON public."Il" USING btree ("ilceNo");


--
-- TOC entry 3258 (class 1259 OID 16447)
-- Name: fki_MarkaModel_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_MarkaModel_fKey" ON public."Marka" USING btree ("modelNo");


--
-- TOC entry 3259 (class 1259 OID 16453)
-- Name: fki_MarkaTur_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_MarkaTur_fKey" ON public."Marka" USING btree ("turNo");


--
-- TOC entry 3279 (class 1259 OID 16553)
-- Name: fki_MusteriIl_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_MusteriIl_fKey" ON public."Musteri" USING btree ("ilNo");


--
-- TOC entry 3285 (class 1259 OID 16575)
-- Name: fki_PersonelCinsiyet_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PersonelCinsiyet_fKey" ON public."Personel" USING btree ("cinsiyetNo");


--
-- TOC entry 3286 (class 1259 OID 16581)
-- Name: fki_PersonelYetki_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PersonelYetki_fKey" ON public."Personel" USING btree ("yetkiNo");


--
-- TOC entry 3269 (class 1259 OID 16510)
-- Name: fki_kiraSuresiFiyat_fKey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_kiraSuresiFiyat_fKey" ON public."KiraSuresi" USING btree ("fiyatNo");


--
-- TOC entry 3280 (class 1259 OID 16559)
-- Name: fki_m; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_m ON public."Musteri" USING btree ("cinsiyetNo");


--
-- TOC entry 3303 (class 2620 OID 16587)
-- Name: Musteri musteriartirtrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER musteriartirtrig AFTER INSERT ON public."Musteri" FOR EACH ROW EXECUTE FUNCTION public.musterisayisiartir();


--
-- TOC entry 3302 (class 2620 OID 16591)
-- Name: Musteri musteriazalttrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER musteriazalttrig AFTER DELETE ON public."Musteri" FOR EACH ROW EXECUTE FUNCTION public.musterisayisiazalt();


--
-- TOC entry 3305 (class 2620 OID 16608)
-- Name: Personel personelartirtrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER personelartirtrig AFTER INSERT ON public."Personel" FOR EACH ROW EXECUTE FUNCTION public.personelsayisiartir();


--
-- TOC entry 3304 (class 2620 OID 16611)
-- Name: Personel personelazalttrig; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER personelazalttrig AFTER DELETE ON public."Personel" FOR EACH ROW EXECUTE FUNCTION public.personelsayisiazalt();


--
-- TOC entry 3291 (class 2606 OID 16476)
-- Name: Araba ArabaBakim_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Araba"
    ADD CONSTRAINT "ArabaBakim_fKey" FOREIGN KEY ("bakimNo") REFERENCES public."Bakim"("bakimNo") NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 16494)
-- Name: Araba ArabaKira_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Araba"
    ADD CONSTRAINT "ArabaKira_fKey" FOREIGN KEY ("kiraSuresiNo") REFERENCES public."KiraSuresi"("kiraSuresiNo") NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 16454)
-- Name: Araba ArabaMarka_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Araba"
    ADD CONSTRAINT "ArabaMarka_fKey" FOREIGN KEY ("markaNo") REFERENCES public."Marka"("markaNo") NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 16421)
-- Name: Araba ArabaYolcu_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Araba"
    ADD CONSTRAINT "ArabaYolcu_fKey" FOREIGN KEY ("yolcuSayisiNo") REFERENCES public."YolcuSayisi"("yolcuSayisiNo") NOT VALID;


--
-- TOC entry 3295 (class 2606 OID 16482)
-- Name: Bakim BakimBTuru_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Bakim"
    ADD CONSTRAINT "BakimBTuru_fKey" FOREIGN KEY ("bakimTuruNo") REFERENCES public."BakimTuru"("bakimTuruNo") NOT VALID;


--
-- TOC entry 3297 (class 2606 OID 16542)
-- Name: Il IlIlce_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Il"
    ADD CONSTRAINT "IlIlce_fKey" FOREIGN KEY ("ilceNo") REFERENCES public."Ilce"("ilceNo") NOT VALID;


--
-- TOC entry 3296 (class 2606 OID 16505)
-- Name: KiraSuresi KiraSuresiFiyat_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KiraSuresi"
    ADD CONSTRAINT "KiraSuresiFiyat_fKey" FOREIGN KEY ("fiyatNo") REFERENCES public."Fiyat"("fiyatNo") NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 16442)
-- Name: Marka MarkaModel_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marka"
    ADD CONSTRAINT "MarkaModel_fKey" FOREIGN KEY ("modelNo") REFERENCES public."Model"("modelNo") NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 16448)
-- Name: Marka MarkaTur_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marka"
    ADD CONSTRAINT "MarkaTur_fKey" FOREIGN KEY ("turNo") REFERENCES public."Tur"("turNo") NOT VALID;


--
-- TOC entry 3299 (class 2606 OID 16554)
-- Name: Musteri MusteriCinsiyet_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "MusteriCinsiyet_fKey" FOREIGN KEY ("cinsiyetNo") REFERENCES public."Cinsiyet"("cinsiyetNo") NOT VALID;


--
-- TOC entry 3298 (class 2606 OID 16548)
-- Name: Musteri MusteriIl_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "MusteriIl_fKey" FOREIGN KEY ("ilNo") REFERENCES public."Il"("ilNo") NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 16570)
-- Name: Personel PersonelCinsiyet_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "PersonelCinsiyet_fKey" FOREIGN KEY ("cinsiyetNo") REFERENCES public."Cinsiyet"("cinsiyetNo") NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 16576)
-- Name: Personel PersonelYetki_fKey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "PersonelYetki_fKey" FOREIGN KEY ("yetkiNo") REFERENCES public."Yetki"("yetkiNo") NOT VALID;


-- Completed on 2021-12-19 15:55:05

--
-- PostgreSQL database dump complete
--

