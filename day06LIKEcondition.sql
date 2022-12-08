-- 								LIKE Condition
/*
	LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
	statement ile calisan wildcards’a(özel sembol) izin verir.. 
	Ve bize pattern matching yapma imkani verir.
	1) % => 0 veya birden fazla karakter belirtir
	%A: Son harfin 'A' olduğu char.
	A%: İlk harfin 'A' olduğu char.
	%A%: İçinde A'ya sahip olan char.
	
	2) ILIKE büyük-küçük harfi önemsemeden sonuç alır
	3) LIKE yerine ~~ sembollerini de kullanabiliriz
	4) ILIKE yerine ~~* sembollerini de kullanabiliriz
*/

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
drop table if exists musteriler
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);

-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler where isim like 'A%' --büyük A ile başlayanları getirdi
select * from müsteriler where isim ilike 'A%' --hem büyük hem de kücük A-a ile başlayanları getirdi


