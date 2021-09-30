--------------- Assessment test --------------

--Create a new database called "School" this database should have 
--two tables: teachers and students.
--The students table should have columns for student_id, 
--first_name,last_name, homeroom_number, phone,email, and graduation year.

CREATE TABLE teacher(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	department VARCHAR(50) NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE NOT NULL	
)

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number INTEGER NOT NULL,
	phone VARCHAR(50) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE,
	graduation_year INTEGER NOT NULL
)

/*Once you've made the tables, insert a student named Mark Watney (student_id=1) 
who has a phone number of 777-555-1234 and doesn't have an email. 
He graduates in 2035 and has 5 as a homeroom number.

Then insert a teacher names Jonas Salk (teacher_id = 1) 
who as a homeroom number of 5 and is from the Biology department. 
His contact info is: jsalk@school.org and a phone number of 777-555-4321.*/

INSERT INTO student(
	first_name,
	last_name,
	homeroom_number,
	phone,
	graduation_year
)VALUES(
	'Mark',
	'Watney',
	5,
	'777-555-1234',
	2035
)

SELECT *FROM student;


INSERT INTO teacher(
	first_name,
	last_name,
	homeroom_number,
	department,
	phone,
	email
)VALUES(
	'Jonas',
	'SAlk',
	5,
	'Biology',
	'777-555-4321',
	'jsalk@school.org'
)

SELECT *FROM teacher;

