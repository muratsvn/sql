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