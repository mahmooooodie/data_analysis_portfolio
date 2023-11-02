CREATE TABLE musteri_tercihleri
( 
  urun_id CHAR(10),
  musteri_isim VARCHAR(50),
  urun_isim VARCHAR(50)
);

INSERT INTO musteri_tercihleri VALUES (10, 'Mark', 'Orange');
INSERT INTO musteri_tercihleri VALUES (50, 'Mark', 'Pineapple');
INSERT INTO musteri_tercihleri VALUES (60, 'John', 'Avocado');
INSERT INTO musteri_tercihleri VALUES (30, 'Lary', 'Cherries');
INSERT INTO musteri_tercihleri VALUES (20, 'Mark', 'Apple');
INSERT INTO musteri_tercihleri VALUES (10, 'Adem', 'Orange');
INSERT INTO musteri_tercihleri VALUES (40, 'John', 'Apricot');
INSERT INTO musteri_tercihleri VALUES (20, 'Eddie', 'Apple');

SELECT * FROM musteri_tercihleri;
drop table musteri_tercihleri;

-- if there is customer name lary, change all customer names to 'no name'

update musteri_tercihleri
set musteri_isim = 'isim yok'
where exists
(Select musteri_isim from musteri_tercihleri where musteri_isim = 'Lary');

update musteri_tercihleri
set musteri_isim = 'isim yok'
where musteri_isim = 'Lary';

update musteri_tercihleri
set urun_id = '50'
where exists
(Select urun_id from musteri_tercihleri where urun_id = '60');
SELECT * FROM musteri_tercihleri;

CREATE TABLE workers(

	worker_id SMALLINT,
    worker_name VARCHAR(50),
    worker_salary NUMERIC,
	CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
)

INSERT INTO workers VALUES(101, 'Tom Hanks', 12000);
INSERT INTO workers VALUES(102, 'Brad Pitt', 2000);
INSERT INTO workers VALUES(103, 'Aisha Can', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 12000);

SELECT * FROM workers;


update workers
set worker_salary = (Select AVG(worker_salary) from workers)
where worker_salary < (Select AVG(worker_salary) from workers);


update workers
set worker_salary = worker_salary + 1000
where worker_salary < (Select AVG(worker_salary) from workers);

update workers
set worker_salary = (select max(worker_salary)*0.8 from workers)
where worker_name = 'Brad Pitt';

CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)     
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');
 SELECT * FRom people;

update people
set ssn = 148085782
where ssn = 567890123


update people
set name = 'name will be given in future'
where name is null;

update people
set address = 'address will be given in future'
where address is null;

delete from people
where name = 'Mark Star';

delete from people;
drop table people;
delete from people
where ssn > 123456789 and ssn <345678900;


--order by command orders from smallest to largest by default
-- default is ascending ASC
-- DESC is descending 
select * from people
order by ssn desc
offset 3 row
fetch next 1 row only;