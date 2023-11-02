CREATE TABLE students3(
	id int,
	name varchar(50),
	parent_name varchar(50),
	grade int

);
INSERT INTO students3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO students3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO students3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO students3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO students3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO students3 VALUES(127, 'Mustafa Bak', 'Ali', 99);

SELECT * FROM students3;

DELETE FROM students3 WHERE name ='Mustafa Bak' OR name = 'Nesibe Yilmaz';

--TRUNCATE code deletes all data as well as a hard delete and you cant get it back
TRUNCATE students3;

DROP TABLE products;

DROP TABLE if exists products; -- does not give an error if the object does not exist which is good, basically skips

CREATE TABLE talebeler1
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler1 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler1 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler1 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler1 VALUES(127, 'Mustafa Bak', 'Can',99);

SELECT * FROM talebeler1;
CREATE TABLE notlar1( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar1_fk FOREIGN KEY (talebe_id) REFERENCES talebeler1(id)
on delete cascade
);

INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

on delete cascade;