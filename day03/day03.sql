CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler3
--ismi Nesibe Yilmaz ve Mustafa Bak olan kayıtları silelim.

DELETE FROM ogrenciler3 WHERE isim= 'Mustafa Bak' or isim='Nesibe Yilmaz';

-- veli ismi hasan olan kayıtları silelim
DELETE FROM ogrenciler3 WHERE veli_isim='Hasan';

-- TRUNCATE ---
--Bir tablodaki tüm veriler geri alamayacağımız şekilde siler. Şartlı silme yapmaz

TRUNCATE TABLE ogrenciler3

-- ON DELETE CASCADE
DROP TABLE if exists talebeler -- eğer tablo varsa tabloyu siler

CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE not2(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not2 VALUES ('123','kimya',75);
INSERT INTO not2 VALUES ('124', 'fizik',65);
INSERT INTO not2 VALUES ('125', 'tarih',90);
INSERT INTO not2 VALUES ('126', 'Matematik',90);

select * from talebe;
select * from not2;

-- notlar tablosundan talebe_id'si 123 olan datayı silelim

DELETE FROM not2 WHERE talebe_id='123'

-- talebeler tablosundan id'si 126 olan datayı silelim

DELETE FROM talebe WHERE id='126'

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/

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

CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

SELECT * FROM calisanlar2
SELECT * FROM markalar

--Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
SELECT isim,maas,isyeri FROM calisanlar2
WHERE isyeri IN(SELECT marka_isim FROM markalar WHERE calisan_sayisi>15000);

-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz
SELECT isim, maas, sehir FROM calisanlar2
WHERE isyeri IN(SELECT marka_isim FROM markalar WHERE marka_id>101);

-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.

-- 							AGGREGATE METOT KULLANIMI
/*Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/

-- aggregate method
SELECT max(maas) FROM calisanlar2;
SELECT max(maas) AS maksimum_maas FROM calisanlar2;

-- eğer bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdıktan sonra
-- vermek istediğimiz ismi yazarız

-- calisanlar tablosundan en düşük maaşı listeleyelim
SELECT min(maas) AS en_dusuk_maas FROM calisanlar2

-- calisanlar tablosundaki maas'ların toplamını listeleyelim
SELECT sum(maas) FROM calisanlar2

-- calisanlar tablosundaki maas'ların ortalamasını listeleyelim
SELECT avg(maas) FROM calisanlar2
SELECT round(avg(maas)) FROM calisanlar2
SELECT round(avg(maas),2) FROM calisanlar2

-- calisanlar tablosundaki maas'ların sayısını listeleyelim
SELECT count(maas) FROM calisanlar2
SELECT count (*) AS maas_sayısı FROM calisanlar2;

/*
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir
Sutun adı kullanırsak o sutundaki sayıları verir
*/

-- AGGREGATE METHODLARDA SUBQUERY
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz

select * from calisanlar2;
select * from markalar;

SELECT marka_id, marka_isim, (SELECT count(sehir) FROM calisanlar2
							  WHERE marka_isim=isyeri) 
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz

CREATE VIEW summaas
AS
SELECT marka_isim, calisan_sayisi,
	(SELECT sum(maas) FROM calisanlar2 WHERE isyeri=marka_isim)
FROM markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim, calisan_sayisi,
	(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim),
	(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim)
FROM markalar;

-- VIEW Kullanımı
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine
view'e atadığımız ismi SELECT komutuyla çağırırız
*/



CREATE VIEW maxminmaas
AS
SELECT marka_isim, calisan_sayisi,
	(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim),
	(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim)
FROM markalar;


SELECT * FROM maxminmaas;
SELECT * FROM summaas;



-- EXIST CONDITION

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');



--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
select * from mart;
select * from nisan;

SELECT urun_id, musteri_isim FROM mart
WHERE exists (SELECT urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id)

select urun_id,musteri_isim from nisan where exists (select urun_id from mart where mart.urun_id=nisan.urun_id)

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

SELECT urun_isim, musteri_isim FROM nisan
WHERE exists (SELECT urun_isim FROM mart WHERE mart.urun_isim=nisan.urun_isim)

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

-- DML ==> UPDATE

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');

CREATE TABLE urun -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
INSERT INTO urun VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urun VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urun VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urun VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urun VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urun VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urun VALUES(104, 1007,'Phone', 'Aslan Yılmaz');

select * from tedarikciler;
select * from urun;

-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz.
/*
UPDATE tablo_adi
SET sutun_ismi = 'istenen veri' WHERE sutun_ismi = 'istenen veri
*/

UPDATE tedarikciler 
SET firma_ismi='Vestel' WHERE vergi_no=102;

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler
SET firma_ismi='Casper', irtibat_ismi='Ali Veli' WHERE vergi_no=101

----  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
UPDATE urun
SET urun_isim = 'Telefon' WHERE urun_isim='Phone'

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
UPDATE urun
SET urun_id=urun_id+1 WHERE urun_id>1004;

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.

UPDATE urun
SET urun_id = urun_id + ted_vergino

DELETE FROM urun

-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
UPDATE urun
SET urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adam Eve')
WHERE musteri_isim='Ali Bak'

--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.

UPDATE urun                      
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')                     
WHERE urun_isim='Laptop' 
