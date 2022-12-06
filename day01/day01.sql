-- database (veri tabanı) oluşturma
Create database veli;

-- DDL / DATA DEFINITION LANG.
-- CREATE - TABLO OLUŞTURMA
CREATE TABLE ogrenciler5
(
ogrenci_no char(7), -- uzunluğunu bildiğimiz stringler için CHAR kullanılır
isim varchar(20), -- uzunluğunu bilMEdiğimiz stringiler için VARCHAR kullanılır
soyisim varchar(25),
not_ort real, --ondalıklı sayılar için kullanılır double gibi
kayit_tarih date
);

-- varolan tablodan yeni bir tablo oluşturma
create table ogrenci_notlari
as-- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
select isim,soyisim,not_ort from ogrenciler2;

--dml - data manupulation lang.
--insert (database'e veri ekleme)

insert into ogrenciler2 values ('1234567','Said','ILHAN',85.5,now());
insert into ogrenciler2 values ('1234567','Said','ILHAN',85.5,'2022-12-11');

-- bir tabloya parçalı veri eklemek istersek

insert into ogrenciler2 (isim, soyisim) values ('Ali', 'Veli');

-- dql - data query lang.
-- select

select * from ogrenciler2; --tüm hepsini seçtik

