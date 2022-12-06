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
update tedarikciler set firma_ismi='Casper', irtibat_ismi='Ali Veli' where vergi_no=101

-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urun set urun_isim='Telefon' where urun_isim='Phone'

-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urun set urun_id = urun_id+1  where urun_id>1004

-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urun set urun_id = urun_id+ted_vergino

DELETE FROM urun
delete from tedarikciler
-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

UPDATE urun
SET urun_isim=(SELECT firma_ismi FROM tedarikciler WHERE irtibat_ismi='Adam Eve')
WHERE musteri_isim='Ali Bak'

--Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.

UPDATE urun                      
SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler WHERE firma_ismi='Apple')                     
WHERE urun_isim='Laptop' 
