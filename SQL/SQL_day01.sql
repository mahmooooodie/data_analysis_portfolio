-- Creating a database function

CREATE database b168;

-- Creating a table

CREATE table ogrenciler(

	ogrenci_no char(7), -- char determines max number of characters
	isim varchar(20),
	soyisim varchar(30), -- varchar is for varying characters
	not_ortalamasi real, -- real is used for float numbers
	kayit_tarihi date
	
);

SELECT * from ogrenciler; -- DQL, the asteriks means select all.

-- you can create tables two ways
-- from scratch
-- and from an existing table

CREATE table ogrenci_not
AS 
SELECT isim, soyisim, not_ortalamasi FROM ogrenciler;

SELECT * from ogrenci_not;

INSERT INTO ogrenciler VALUES('1234567','Tom','Hanks','99.2','2023-08-02');

INSERT INTO ogrenciler VALUES('2345654','Mahmud','Apaydin','100.0', now());

INSERT INTO ogrenciler (isim, soyisim) VALUES('Brad','Pitt');

-- Constraints
-- Unique
-- Not Null

CREATE table ogrenciler2(
	ogrenci_no char(7) UNIQUE, 
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL, 
	not_ortalamasi real,
	kayit_tarihi date
);

SELECT * FROM ogrenciler2;

INSERT INTO ogrenciler2 VALUES('1234567', 'Maho','Talha','90.2', '2020-05-01');
INSERT INTO ogrenciler2 VALUES()


CREATE table ogrenciler4(
	ogrenci_no char(7), 
	isim varchar(20) NOT NULL,
	soyisim varchar(30) NOT NULL, 
	not_ortalamasi real,
	kayit_tarihi date,
	CONSTRAINT ogrenci_numarasi PRIMARY KEY (ogrenci_no)
	);
SELECT * FROM ogrenciler4;

INSERT INTO ogrenciler4 VALUES('1234567','Tom','Hanks','99.2','2023-08-02');

INSERT INTO ogrenciler4 VALUES('2345654','Mahmud','Apaydin','100.0', now());


CREATE table suppliers(
	
	supplier_id char(5) PRIMARY KEY,
	supplier_name varchar(20),
	contact_name varchar(50)
	
);

SELECT * FROM suppliers;

CREATE table products(
	supplier_id char(5),
	product_id char(5),
	FOREIGN KEY (supplier_id) REFERENCES suppliers
	

);

create table workers(
	id varchar(15) Primary key,
	name varchar(50) unique,
	salary smallint not null,
	start_date date

);

insert into workers values ('100001','mahmud apaydin','20000', now());
insert into workers values ('100002','nur apaydin','25000', now());
select * from workers;
create table addresses(
	address_id varchar(30),
	street varchar(30),
	county varchar(30),
	state varchar(30),
	foreign key (address_id) references workers (id) 
);
insert into addresses values ('100001','broad','clifton', 'nj');
insert into addresses values ('100002','totowa','wayne', 'ca');
select * from addresses;

-- check constraint sets a condition
create table workers2(
	id varchar(15) Primary key,
	name varchar(50) unique,
	salary int check (salary>10000) not null,
	start_date date
);
insert into workers2 values ('100001','mahmud apaydin','20000', now());
insert into workers2 values ('100003','Faruk apaydin','30000', now());

SELECT * from workers2;


SELECT name,salary FROM workers2 WHERE salary>23000;

SELECT * FROM workers2 WHERE name = 'mahmud apaydin';


-- DELETE FROM code only deletes the data from the table
DELETE FROM workers2;

--DROP TABLE code completely deletes the table

DROP TABLE workers;

DELETE FROM workers2 WHERE salary=25000;
SELECT * FROM workers2;
