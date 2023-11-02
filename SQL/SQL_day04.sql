CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
INSERT INTO markalar VALUES(104, 'Nike', 19000);

select * from calisanlar2
select * from markalar

select isim,maas, sehir from calisanlar2 where isyeri IN
(select marka_isim from markalar where marka_id >101);

SELECT MAX(maas) FROM calisanlar2;

SELECT min(maas) AS min_maas FROM calisanlar2;

CREATE VIEW max_min_maas
AS 
SELECT marka_isim, calisan_sayisi, (SELECT MAX(maas) FROM calisanlar2 WHERE isyeri=marka_isim) AS max_maas,
                                   (SELECT MIN(maas)  FROM calisanlar2 WHERE isyeri=marka_isim) AS min_maas
									FROM markalar;
SELECT * FROM max_min_maas

SELECT isim, maas FROM calisanlar2 WHERE maas = (select min(maas) from calisanlar2);

SELECT SUM(maas) AS sum_of_maas from calisanlar2;

SELECT AVG(maas) AS avg_of_maas from calisanlar2;

SELECT ROUND(AVG(maas),2) AS avg_of_maas from calisanlar2;