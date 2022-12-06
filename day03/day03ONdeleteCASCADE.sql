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
parent tablodan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablodan da silinir
*/



