-- SQL ifadelerinizi buraya yazınız.

-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS ogrenci
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying NOT NULL,
    soyad character varying NOT NULL,
    dtarih date NOT NULL,
    cinsiyet character varying(5) NOT NULL,
    sinif character varying NOT NULL,
    puan bigint NOT NULL
);

CREATE TABLE IF NOT EXISTS islem
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ogrenci_id smallint NOT NULL,
    kitap_id smallint NOT NULL,
    atarih date NOT NULL,
    vtarih date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS yazar
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying NOT NULL,
    soyad character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS kitap
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying NOT NULL,
    sayfasayisi bigint NOT NULL,
    puan numeric NOT NULL,
    yazar_id smallint NOT NULL,
    tur_id smallint,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS tur
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE ogrenci ADD CONSTRAINT unique_id UNIQUE (id);

ALTER TABLE IF EXISTS islem
    ADD FOREIGN KEY (ogrenci_id)
    REFERENCES ogrenci (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS islem
    ADD FOREIGN KEY (kitap_id)
    REFERENCES kitap (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS kitap
    ADD FOREIGN KEY (yazar_id)
    REFERENCES yazar (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS kitap
    ADD FOREIGN KEY (tur_id)
    REFERENCES tur (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;