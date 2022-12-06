-- 							AGGREGATE METOT KULLANIMI
/*Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı */

-- aggregate method
SELECT max(maas) FROM calisanlar2;
SELECT max(maas) AS maksimum_maas FROM calisanlar2;
-- eğer bir sutuna gecici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek istediğimiz ismi yazarız


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
Eğer count(*) kullanırsak tablodaki tüm satırların sayısını verir. Sutun adı kullanırsak o sutundaki sayıları verir
*/

-- AGGREGATE METHODLARDA SUBQUERY

select * from calisanlar2;
select * from markalar;

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz
select marka_id, marka_isim, (select count(sehir) from calisanlar2 where marka_isim=isyeri) from markalar


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi, (select sum(maas) from calisanlar2 where marka_isim=isyeri) from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi, (select max(maas) from calisanlar2 where marka_isim=isyeri),
								   (select min(maas) from calisanlar2 where marka_isim=isyeri) from markalar

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


