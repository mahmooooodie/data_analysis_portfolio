--ALTER TABLE: this command is used to add, delete, or change a field


ALTER TABLE workers1
ADD worker_address varchar(80);
SELECT * from workers1;

--you can even add default entry into the data fields

ALTER TABLE workers1
ADD employee_address text DEFAULT 'MIAMI,FL,USA' ;

-- How to add multiple fields into a table
 
ALTER TABLE workers1
add salary numeric DEFAULT 0,
add name_of_ceo TEXT;

--dropping columns
ALTER TABLE workers1
Drop column worker_address;
--renaming fields
ALTER TABLE workers1
Rename title to job;

--renaming table
ALTER TABLE workers1
rename to workers;

select * from workers;

ALTER TABLE workers
ALTER COLUMN name_of_ceo set NOT NULL;
ALTER TABLE workers
ADD CONSTRAINT name_of_ceo_unique UNIQUE(name_of_ceo);

-- change field type to char(50)
ALTER TABLE workers
ALTER COLUMN name TYPE VARCHAR(50);