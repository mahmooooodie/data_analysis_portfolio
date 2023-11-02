CREATE TABLE musteriler  (
urun_id int,  
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');  
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');  
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');  
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');  
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
 
SELECT * FROM musteriler

SELECT * FROM musteriler where urun_isim = 'Apple' OR urun_isim ='Orange' OR urun_isim ='Apricot';

SELECT * FROM musteriler WHERE urun_isim IN('Apple','Orange','Apricot');

SELECT * FROM musteriler WHERE urun_id = 30 AND musteri_isim = 'Amy';

SELECT * FROM musteriler WHERE urun_id BETWEEN 30 AND 50;