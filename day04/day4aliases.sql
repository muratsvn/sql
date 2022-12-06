-- ÖDEV
-- ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select * from calisanlar2
select * from markalar

select marka_id, calisan_sayisi from markalar where marka_isim in(select isyeri from calisanlar2 where sehir='Ankara')

--				ALIASES

CREATE TABLE calisanlar5 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar5 VALUES(123456789,'Ali Can', 'Istanbul');
INSERT INTO calisanlar5 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar5 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar5

-- Eğer iki sutunun verilerin birleştirmek istersek concat sembolu olan || kullanırız
--1.way
select calisan_id as id, calisan_isim ||' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar5

--2.way
select calisan_id as id, concat (calisan_isim, calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar5
--araya boşluk ekledik
select calisan_id as id, concat (calisan_isim, ' ' , calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar5

