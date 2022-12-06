CREATE TABLE musteriler
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
DROP TABLE if exists musteriler
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');
INSERT INTO musteriler VALUES (20, 'John', 'Apple');
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteriler

-- musteriler tablosundan urun ismi orange, apple ve apricot olan tum dataları listeleyiniz
SELECT * FROM musteriler WHERE urun_isim='Orange' OR urun_isim='Apple' OR urun_isim='Apricot'

--musteriler tablosundan urun_id leri '10' ve urun_ismi 'orange' olanı getir
SELECT * FROM musteriler WHERE urun_isim='Orange' AND urun_id=10;

-- IN CONDITION

SELECT * FROM musteriler WHERE urun_isim IN('Orange', 'Apple', 'Apricot'); --or ile yaptığımızın aynısını verir


-- NOT IN CONDITION yazdığımız veriler dışındakileri getirir
SELECT * FROM musteriler WHERE urun_isim NOT IN('Orange', 'Apple', 'Apricot');

-- BETWEEN CONDITION
-- musteriler tablosundan urun_id'si 20 ile 40 arasında olan verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_id>=20 and urun_id<=40;

SELECT * FROM musteriler WHERE urun_id BETWEEN 20 and 40;

SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 and 40;