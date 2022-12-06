-- IS NULL CONDITION

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

-- name sutunuda null olan değerleri listeleyelim
select name from insanlar where name is null;

-- Name sutununda null olan değerleri listeleyelim
select name from insanlar where name is not null;

-- insanlar tablosunda null değer almış verileri no name olarak değiştiriniz
update insanlar
set name='No Name'
where name is null



