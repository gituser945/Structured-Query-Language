------------ Creating Tables --------------------

CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
)

CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(200) UNIQUE NOT NULL
)

CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id),
	job_id INTEGER REFERENCES job(job_id),
	hire_date TIMESTAMP
)

-------------------------------------------------------

--------------- Inserting values into table -----------

INSERT INTO account(username,password,email,created_on)
VALUES
('Jose','password','jose@gmail.com',CURRENT_TIMESTAMP);

SELECT *FROM account;

INSERT INTO job(job_name)
VALUES
('Astronaut');

INSERT INTO job(job_name)
VALUES
('President');

SELECT *FROM job;

INSERT INTO account_job(user_id,job_id,hire_date)
VALUES
(1,1,CURRENT_TIMESTAMP);

SELECT *FROM account_job;

------ UPDATE keyword ----------

SELECT *FROM account;

UPDATE account SET last_login = CURRENT_TIMESTAMP;

--- Update based on two tables----

SELECT *FROM account;
SELECT *FROM account_job;

UPDATE account_job
SET hire_date = account.created_on
FROM account
WHERE account.user_id = account_job.user_id;

--- use of return keyword ---

UPDATE account 
SET last_login = CURRENT_TIMESTAMP
RETURNING email,last_login,created_on;

----- Delete command in SQL ------

SELECT *FROM job;

INSERT INTO job(job_name)
VALUES
('Test');

DELETE FROM job
WHERE job_name = 'Test'
RETURNING job_id,job_name;

----- ALTER command ------

CREATE TABLE general_info(
	info_id SERIAL PRIMARY KEY,
	title VARCHAR(500) NOT NULL,
	person VARCHAR(50) UNIQUE NOT NULL
)

SELECT *FROM general_info;

-- Change table name --

ALTER TABLE general_info
RENAME TO new_info;

SELECT *FROM new_info;

-- Rename column ---

ALTER TABLE new_info
RENAME COLUMN person TO people;

-- Alter constrainsts --

ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

INSERT INTO new_info(title)
VALUES
('This is test');

--- Drop command -----

ALTER TABLE new_info
DROP COLUMN people;

SELECT *FROM new_info;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

--- CHECK constraints ------

CREATE TABLE employee(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	DOB DATE CHECK(DOB > '1900-01-01'),
	hire_date DATE CHECK(hire_date > DOB),
	salary INTEGER CHECK(salary > 0)
)

INSERT INTO employee(
	first_name,
	last_name,
	DOB,
	hire_date,
	salary
) VALUES(
	'Joey',
	'portillia',
	'1990-01-01',
	'2010-01-01',
	100
);

INSERT INTO employee(
	first_name,
	last_name,
	DOB,
	hire_date,
	salary
) VALUES(
	'Jammy',
	'portillia',
	'1990-01-01',
	'2010-01-01',
	100
);

SELECT *FROM employee;






