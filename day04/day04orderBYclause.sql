--				ORDER BY CLAUSE
/*
	ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
	yapmak icin kullanilir
	ORDER BY komutu sadece SELECT komutu Ile kullanilir*/
	
CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar1

-- insanlar tablosundaki datalır adrese göre sıralayın
select * from insanlar1 order by adres;

select * from insanlar1 order by soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar1 where isim='Mine' order by ssn;

/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar ASC eklenir
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
NOT : Order By komutundan sonra field(sutun) ismi yerine field numarasi da kullanilabilir
*/

-- Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar1 where soyisim='Bulut' order by 2

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar1 order by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar1 order by isim asc, soyisim desc 

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
--eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız
--yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz

select isim,soyisim from insanlar1 order by length (soyisim) desc;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim||soyisim)
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim) + LENGTH (soyisim)
select concat(isim, ' ', soyisim) from insanlar1 order by length (isim) + length (soyisim)
select concat(isim, ' ', soyisim) from insanlar1 order by length (concat(isim,soyisim))

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre tersten sıralayınız
select isim || ' ' || soyisim as isim_soyisim from insanlar1 order by length (isim||soyisim) desc
















































