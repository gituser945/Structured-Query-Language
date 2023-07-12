/********************* UDEMY SQL COURSE ********************/
/***********************************************************/

/*------------------------ DAY 1 --------------------------*/

/* Query to drop database */
-- comment shortcut mac cmd + forward slash

DROP DATABASE SlimeStore;

/* Query to select current database */

USE pet_shop;

/* Query to check selected database */

SELECT DATABASE();

/* Query to create database */

CREATE DATABASE tes_shop;

/* Query to select current database */

USE tes_shop;

/* Query to create table */

CREATE TABLE tweet (
  username VARCHAR(15),
  tweet_content VARCHAR(140),
  number_of_favorites INT
);

/* Query to see all table in selected database */

SHOW TABLES;

USE tes_shop;

/* Show columns name from table */

SHOW COLUMNS FROM tweet;

/* shorter version */

DESC tweet;

/*----------------------- DAY 2 --------------------------*/

/* Delete table */

DROP TABLE tweet;

CREATE TABLE pastries (name VARCHAR(50), quantities INT);

DESC pastries;

CREATE TABLE cats (name VARCHAR(50), age INT);

INSERT INTO cats(name,age) VALUES ('Pussy',5);

INSERT INTO cats VALUES('Tomy',6);

SELECT * FROM cats;

-- multiple insert with same query

INSERT INTO cats (name,age)
VALUES ('Meatball',10),
       ('Turky',11),
       ('Cat face',6);


-- exercise

CREATE TABLE people 
(
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

INSERT INTO people (first_name, last_name, age) 
VALUES ('Tina','Belcher',13);

SELECT * FROM people;

INSERT INTO people (first_name,last_name,age)
VALUES ('Linda','Belcher',45),
       ('Phillip','Frond',38),
       ('Calvin','Fischolder',70);

DESC cats;

INSERT INTO cats (name) VALUES ('Todd');

INSERT INTO cats () VALUES ();

-- Table that doesn't allow null value

CREATE TABLE cats_2 (name VARCHAR(100) NOT NULL, age INT NOT NULL);

DESC cats_2;

SELECT * FROM cats_2;

INSERT INTO cats_2 (name) VALUES ('Todd');

INSERT INTO cats_2 () VALUES ();

-- table with DEFAULT constraints

CREATE TABLE cats_3 
(
    name VARCHAR(100) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);

DESC cats_3;

INSERT INTO cats_3 () VALUES ();

INSERT INTO cats_3 (name, age) VALUES (NULL, NULL);

SELECT * FROM cats_3;

USE pet_shop;

SHOW TABLES;


/*----------------------- DAY 3 --------------------------*/

-- working with primary key

CREATE TABLE unique_cats 
(   
    cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

DESC unique_cats;

INSERT INTO unique_cats (cat_id,name,age) 
VALUES (1,'bingo',2);

INSERT INTO unique_cats (cat_id,name,age) 
VALUES (1,'bongo',2);

SELECT * FROM unique_cats;

DROP TABLE unique_cats;

-- working with auto increment key

CREATE TABLE unique_cats
(
    cat_id INT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

DESC unique_cats;

CREATE TABLE unique_cats
(
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

INSERT INTO unique_cats (name,age)
VALUES ('binx',2);

INSERT INTO unique_cats (name,age)
VALUES ('rom',1);

INSERT INTO unique_cats (name,age)
VALUES ('toddle',3);

INSERT INTO unique_cats (name,age)
VALUES ('bingo',3);

SELECT * FROM unique_cats;

-- Exercise --

CREATE TABLE employees
(
    id INT AUTO_INCREMENT,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT('employed'),
    PRIMARY KEY(id)
);

DESC employees;

INSERT INTO employees (last_name,first_name,age)
VALUES ('Hanks','Tom',47);

SELECT * FROM employees;

USE pet_shop;

/*----------------------- DAY 4 --------------------------*/

-- CRUD 

-- 1. CREATE


CREATE TABLE cats 
(
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);

SHOW TABLES;

DESC cats;

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
SELECT * FROM cats;


-- 2. READ

SELECT age FROM cats;

SELECT name,age FROM cats;


-- WHERE clause 

SELECT * FROM cats WHERE age = 4;

SELECT name,age FROM cats WHERE age = 4;

SELECT * FROM cats WHERE age > 5;

SELECT * FROM cats WHERE name = "EGG";

-- Exercise

-- Q1

SELECT cat_id FROM cats;

-- Q2

SELECT name,breed FROM cats;

-- Q3

SELECT name,age FROM cats WHERE breed = "Tabby";

-- Q4

SELECT cat_id,age FROM cats WHERE cat_id = age;


-- Aliases 

SELECT cat_id as ID,name FROM cats;

SELECT name AS KittyName FROM cats;

-- UPDATE

UPDATE cats SET breed = 'Shorthair'WHERE breed = 'Tabby';

SELECT * FROM cats;

UPDATE cats SET breed = 'Tabby' WHERE breed = 'Shorthair';



/*----------------------- DAY 5 --------------------------*/

-- Exercise

UPDATE cats SET name = 'Jack' WHERE name = 'Jackson';

UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';

UPDATE cats SET age = 12 WHERE breed = 'Maine Coon';

SELECT * FROM cats;

-- DELETE in SQL

DELETE FROM cats WHERE name = 'Egg';

-- to delete all rows at once 

DELETE FROM cats;

-- Excercise

DELETE FROM cats WHERE age = 4;

DELETE FROM cats WHERE age = cat_id;

SELECT * FROM cats;


/*----------------------- DAY 6 --------------------------*/

-- CRUD Challenge


CREATE DATABASE shirt_db;

USE shirt_db;

SHOW TABLES;

CREATE TABLE shirts
(
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(10),
    last_worn INT,
    PRIMARY KEY(shirt_id)
);

DESC shirts;

INSERT INTO shirts (article,color,shirt_size,last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
        ('t-shirt', 'green', 'S', 200),
        ('polo shirt', 'black', 'M', 10),
        ('tank top', 'blue', 'S', 50),
        ('t-shirt', 'pink', 'S', 0),
        ('polo shirt', 'red', 'M', 5),
        ('tank top', 'white', 'S', 200),
        ('tank top', 'blue', 'M', 15);
        
SELECT * FROM shirts;

INSERT INTO shirts (article,color,shirt_size,last_worn)
VALUES ('Purple polo shirt','Purple','M',50);

SELECT article,color FROM shirts;

SELECT article,color,shirt_size,last_worn
FROM shirts
WHERE shirt_size = 'M';

SELECT * FROM shirts WHERE article = 'polo shirt';

UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt';

UPDATE shirts SET last_worn = 0
WHERE last_worn = 15;

SELECT * FROM shirts WHERE color = 'white';

UPDATE shirts SET shirt_size = 'XS',color = 'off white'
WHERE color = 'white';

SELECT * FROM shirts WHERE last_worn = 200;

DELETE FROM shirts WHERE last_worn = 200;

DELETE FROM shirts WHERE article = 'tank top';

DELETE FROM shirts;

DROP DATABASE shirt_db;

CREATE DATABASE shirts_db;

USE shirts_db;

CREATE TABLE shirts
(
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(5),
    last_worn INT,
    PRIMARY KEY(shirt_id)
);

DESC shirts;

INSERT INTO shirts (article,color,shirt_size,last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
        ('t-shirt', 'green', 'S', 200),
        ('polo shirt', 'black', 'M', 10),
        ('tank top', 'blue', 'S', 50),
        ('t-shirt', 'pink', 'S', 0),
        ('polo shirt', 'red', 'M', 5),
        ('tank top', 'white', 'S', 200),
        ('tank top', 'blue', 'M', 15);



/*----------------------- DAY 7 --------------------------*/

-- STRING Functions

-- CONCAT function 

SELECT 4+1;

SELECT CONCAT('H','e','l','l','o');

CREATE DATABASE book_shop;

USE book_shop;

SHOW TABLES;

CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);


INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES  ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
        ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
        ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
        ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
        ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
        ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
        ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
        ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
        ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
        ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
        ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
        ("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
        ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
        ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
        ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
        ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

DESC books;

-- concate with sign at end

SELECT CONCAT(author_fname,'!!!') FROM books;

-- Concat with space

SELECT CONCAT (author_fname,author_lname) FROM books;

-- Concat with spaces

SELECT CONCAT (author_fname,' ',author_lname) AS full_name FROM books;

-- concat with seperator

SELECT CONCAT_WS('!','hello','bro');

SELECT CONCAT_WS(' ',author_fname,author_lname) AS author_name FROM books;

-- SUBSTRING

-- printing from one to 4 character

SELECT SUBSTRING('Hello World',1,4);

-- start with the number till the end 

SELECT SUBSTRING('Hello World',7);

-- negative number to start from last 

SELECT SUBSTRING('Hello World',-3);

SELECT SUBSTRING('Hello World',-3,1);

SELECT title FROM books;

SELECT SUBSTRING(title,1,15) FROM books;

-- shorter version 

SELECT SUBSTR (title,1,5) FROM books;

-- first character of the authors last name from every book

SELECT * FROM books;

SELECT SUBSTR(author_lname,1,1) FROM books;

-- title concatendated with substring

SELECT CONCAT(SUBSTRING(title,1,15),'...') AS short_title FROM books;

SELECT CONCAT_WS('.',SUBSTRING(author_fname,1,1),SUBSTRING(author_lname,1,1)) AS initials FROM books;

-- Replace functions 

SELECT REPLACE ('Hello World','Hell','Hey');

-- Replace all tile space with hyphen 

SELECT title FROM books;

SELECT REPLACE(title,' ','-') FROM books;

-- REVERSE function 

SELECT REVERSE("Hello World");

SELECT REVERSE(author_fname) FROM books;

-- CHAR_LENGTH function 

SELECT LENGTH("Hello World");

SELECT CHAR_LENGTH("Hello World");

SELECT CHAR_LENGTH (title),title FROM books;


/*----------------------- DAY 8 --------------------------*/

-- UPPER

SELECT UPPER("Hello");

SELECT UCASE("hello");

SELECT LOWER ("GDSFDfdfDGVDFGDFDGD");

SELECT LCASE("fFGJDSNGJDSNVDFKNGMDSFPIKMB");

USE book_shop;

SELECT * FROM books;

SELECT title FROM books;

SELECT CONCAT('I LOVE',' ',UCASE(title),'!!!') FROM books;

-- INSERT string 

SELECT INSERT ('Hello Nick',6,0,'There');

-- LEFT character 

SELECT LEFT('fibbonacci',3);

-- RIGHT character

SELECT RIGHT ('omglol',3);

-- REPEAT 

SELECT REPEAT ('mySQL',3);

-- TRIM 

SELECT ('           haha');

SELECT TRIM('      haha  ');

SELECT TRIM(LEADING 'x' FROM 'xmutant');

SELECT TRIM(TRAILING 'x' FROM 'xxxxxxxmutantxxxxxxxx');

SELECT TRIM(BOTH 'x' FROM 'xxxxxxmutantxxxxxxx');

-- Exercise

SELECT REVERSE(UCASE('Why does my cat look at me with such hatred?')) AS reversed;

SELECT REPLACE(title,' ','->') AS title FROM books;

SELECT author_lname AS forward,REVERSE(author_lname) AS backwards FROM books;

SELECT CONCAT(UCASE(author_fname),' ',UCASE(author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title,' was released in ',released_year) AS blurb FROM books;

SELECT title,LENGTH(title) AS 'character count' FROM books;

SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'short title',
       CONCAT(author_lname,',',author_fname) AS author,
       CONCAT(stock_quantity,' in stock') AS quantity FROM books;

/*----------------------- DAY 9 --------------------------*/

USE book_shop;

SELECT * FROM books;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
-- DISTINCT

SELECT author_lname FROM books;

SELECT DISTINCT(author_lname) FROM books;

SELECT DISTINCT author_lname FROM books;

SELECT released_year FROM books;

SELECT DISTINCT released_year FROM books;

SELECT author_fname,author_lname FROM books;

SELECT DISTINCT CONCAT(author_fname,' ',author_lname) AS 'author full name' FROM books;

SELECT DISTINCT author_fname,author_lname FROM books;

SELECT DISTINCT author_fname,author_lname,released_year FROM books;

-- ORDER BY 

SELECT book_id,title,author_fname FROM books
ORDER BY book_id DESC;

SELECT book_id,title,author_fname FROM books
ORDER BY author_fname;

SELECT title,pages FROM books ORDER BY pages;

SELECT title,pages FROM books ORDER BY pages DESC;

-- ORDER BY shorthand

-- order by 1st column which is title here 

SELECT title,pages FROM books ORDER BY 1;

-- order by 2nd column which is pages here 

SELECT title,pages FROM books ORDER BY 2;

-- ORDER BY multiple columns 

SELECT author_lname,released_year,title  FROM books 
ORDER BY author_lname;

SELECT author_lname,released_year,title  FROM books 
ORDER BY author_lname,released_year;

SELECT author_lname,released_year,title  FROM books 
ORDER BY author_lname,released_year,title;

SELECT author_lname,released_year,title  FROM books 
ORDER BY author_lname,released_year DESC;

-- LIMIT 

SELECT author_lname,title FROM books LIMIT 5;

SELECT book_id,title,released_year FROM books
ORDER BY released_year LIMIT 5;

SELECT book_id,title,released_year FROM books
ORDER BY book_id LIMIT 5,10;

-- LIKE operator 

SELECT * FROM books;

SELECT title,author_fname,author_lname 
FROM books 
WHERE author_fname LIKE '%da%';

SELECT title,author_fname,author_lname 
FROM books 
WHERE author_fname LIKE 'da%';

SELECT title,author_fname,author_lname 
FROM books 
WHERE author_fname LIKE '%da';

-- give exact 4 character author names

SELECT * FROM books WHERE author_fname LIKE '____';

SELECT * FROM books WHERE author_fname LIKE 'D___';

SELECT * FROM books WHERE author_fname LIKE 'J___';

SELECT * FROM books WHERE author_fname LIKE '_a__';

SELECT * FROM books WHERE author_fname LIKE '%n';

SELECT * FROM books WHERE title LIKE '%\%%';

SELECT * FROM books WHERE title LIKE '%\_%';

-- Exercise

SELECT title FROM books WHERE title LIKE '%:%';

SELECT title,pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT CONCAT(title,' - ',released_year) AS summary FROM books 
ORDER BY released_year DESC LIMIT 3;

SELECT title,author_lname FROM books
WHERE author_lname LIKE '% %';

SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

SELECT title,author_lname FROM books
ORDER BY author_lname,title;

SELECT CONCAT(UCASE('my favorite author is '),UCASE(author_fname),' ',UCASE(author_lname),'!') AS yell 
FROM books
ORDER BY author_lname;

/*----------------------- DAY 10 --------------------------*/

USE book_shop;

-- count number of rows 

SELECT COUNT(*) FROM books;

SELECT COUNT(author_fname) FROM books;

INSERT INTO books () VALUES ();
INSERT INTO books () VALUES ();

SELECT * FROM books;

SELECT COUNT(*) FROM books;

SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT DISTINCT author_fname FROM books;

SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

SELECT title FROM books WHERE title LIKE '%the%';

-- GROUP BY 

-- check how many rows exists within each group 

SELECT author_lname,COUNT(*) FROM books
GROUP BY author_lname;

SELECT author_lname,COUNT(*) AS book_written FROM books
GROUP BY author_lname
ORDER BY book_written DESC;

-- grouping by year 

SELECT released_year,COUNT(*) AS count_of_books FROM books
GROUP BY released_year
ORDER BY count_of_books DESC;

-- MIN and MAX 

-- find the minimum released year 

SELECT MIN(released_year) FROM books;

SELECT MAX(pages) FROM books;

SELECT MIN(author_lname),MAX(author_lname) FROM books;

SELECT MAX(pages) FROM books;

SELECT title,pages FROM books ORDER BY pages DESC LIMIT 1;

-- sub queries 

SELECT title,pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

/*----------------------- DAY 11 --------------------------*/

SELECT title,pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

INSERT INTO books (title,pages) VALUES ('my life in words',634);

SELECT title,pages FROM books ORDER BY pages DESC LIMIT 1;

SELECT title,released_year FROM books
WHERE released_year = (SELECT MIN(released_year) FROM books);

-- GROUP BY multiple columns

SELECT author_fname,author_lname FROM books ORDER BY author_lname;

SELECT author_lname,COUNT(*) FROM books GROUP BY author_lname,author_fname;

SELECT author_lname,author_fname,COUNT(*) FROM books GROUP BY author_lname,author_fname;

SELECT CONCAT(author_fname,' ',author_lname) AS full_name,COUNT(*)
FROM books GROUP BY full_name;

-- MIN and MAX with GROUP BY 

SELECT CONCAT(author_fname,' ',author_lname) AS full_name,MIN(released_year)
FROM books GROUP BY full_name;

SELECT CONCAT(author_fname,' ',author_lname) AS full_name,MAX(released_year)
FROM books GROUP BY full_name;

SELECT CONCAT(author_fname,' ',author_lname) AS full_name,MIN(released_year),MAX(released_year)
FROM books GROUP BY full_name;

SELECT CONCAT(author_fname,' ',author_lname) AS full_name,
COUNT(*) AS books_written,
MIN(released_year),
MAX(released_year)
FROM books GROUP BY full_name;

SELECT CONCAT(author_fname,' ',author_lname) AS full_name,
COUNT(*) AS books_written,
MIN(released_year) AS first_book,
MAX(released_year) AS latest_book,
MAX(pages) AS longest_books
FROM books GROUP BY full_name;

-- SUM 

SELECT SUM(pages) FROM books;

SELECT author_lname,SUM(pages) FROM books
GROUP BY author_lname;


/*----------------------- DAY 12 --------------------------*/

-- AVG 

USE book_shop;

SELECT AVG(released_year) FROM books;

SELECT AVG(pages) FROM books;

SELECT AVG(stock_quantity) FROM books;

SELECT released_year,AVG(stock_quantity),COUNT(*) FROM books 
GROUP BY released_year;

-- Exercise 

-- total number of books in database

SELECT COUNT(*) AS total_books FROM books;

-- books released every year 

SELECT released_year,COUNT(*) AS total_books FROM books
GROUP BY released_year;

-- total books in stock 

SELECT SUM(stock_quantity) AS total_books_in_stock 
FROM books;

SELECT CONCAT(author_fname,' ',author_lname) AS author,AVG(released_year)
FROM books GROUP BY author;

-- author name who wrote longest books

SELECT CONCAT(author_fname,' ',author_lname) AS author_name,MAX(pages) AS page_count
FROM books
GROUP BY author_name
HAVING author_name IS NOT NULL
ORDER BY page_count DESC
LIMIT 1;

SELECT CONCAT(author_fname,' ',author_lname) AS author_name FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT released_year AS 'year',COUNT(*) AS books,AVG(pages) AS avg_pages
FROM books 
GROUP BY released_year
HAVING released_year IS NOT NULL
ORDER BY released_year;

/*----------------------- DAY 13 --------------------------*/

-- Date format

USE book_shop;

CREATE TABLE people 
(
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

DESCRIBE people;

INSERT INTO people (name,birthdate,birthtime,birthdt) 
VALUES ('Tom','1992-01-21','11:49:00','1992-01-21 11:49:00');

INSERT INTO people (name,birthdate,birthtime,birthdt) 
VALUES ('Dick','1995-12-21','01:00:00','1995-12-21 01:00:00');

INSERT INTO people (name,birthdate,birthtime,birthdt) 
VALUES ('Harry','1989-01-01','12:59:00','1989-01-01 12:59:00');

SELECT * FROM people;

SELECT CURTIME();

SELECT NOW();

SELECT CURDATE();

SELECT CURRENT_TIME();

INSERT INTO people (name,birthdate,birthtime,birthdt) 
VALUES ('Sejal',CURDATE(),CURTIME(),NOW());

SELECT birthdate,DAY(birthdate) FROM people;

SELECT birthdate,DAYOFWEEK(birthdate) FROM people;

SELECT birthdate,DAYOFYEAR(birthdate) FROM people;

SELECT birthdate,DAY(birthdate),DAYOFWEEK(birthdate),DAYOFYEAR(birthdate),
MONTHNAME(birthdate),YEAR(birthdate) FROM people;

-- TIME 

SELECT name,birthtime,HOUR(birthtime) FROM people;

SELECT name,birthtime,MINUTE(birthtime) FROM people;

SELECT name,birthtime,SECOND(birthtime) FROM people;

SELECT name,birthdt,HOUR(birthdt) FROM people;

SELECT name,birthdt,MINUTE(birthdt) FROM people;

SELECT name,birthdt,SECOND(birthdt) FROM people;

SELECT name,birthdt,DATE(birthdt),TIME(birthdt) FROM people;


/*----------------------- DAY 14 --------------------------*/

-- DATE FORMAT 

SELECT CONCAT(MONTHNAME(birthdt),' ',DAY(birthdt),' ',YEAR(birthdt)) FROM people;

SELECT DATE_FORMAT (birthdt,'%a %b %e') FROm people;

-- DATEDIFF

SELECT birthdate,DATEDIFF(CURDATE(),birthdate) AS difference FROM people;

SELECT birthdate,DATE_ADD(birthdate,INTERVAL 1 DAY) FROM People;

SELECT birthdate,DATE_ADD(birthdate,INTERVAL 1 YEAR) FROM People;

-- DATE_SUB

SELECT birthdate,DATE_SUB(birthdate,INTERVAL 1 DAY) FROM People;

SELECT birthdate,DATE_SUB(birthdate,INTERVAL 1 YEAR) FROM People;

CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

SELECT CURTIME();

SELECT CURDATE();

SELECT NOW();

SELECT DAYOFWEEK(CURDATE());

SELECT DAY(CURDATE());

SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');

SELECT DATE_FORMAT(NOW(),'%M %D at %h:%m');

CREATE TABLE tweet (
  tweet VARCHAR(150),
  username VARCHAR(50),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);

INSERT INTO tweet (tweet,username) VALUES ('this is amazng','@nikhiltweetzzz');

SELECT * FROM tweet;

/*----------------------- DAY 15 --------------------------*/

-- Logical operator

USE book_shop;

SELECT title,released_year FROM books WHERE released_year != '2017';

-- NOT LIKE operator 

SELECT title FROM books WHERE title NOT LIKE '% %';

-- Greater than 

SELECT * FROM books WHERE released_year > '2000';

-- Less than 

SELECT * FROM books WHERE released_year < '2000';

-- Logical AND 

SELECT * FROM books WHERE released_year = '1989' AND '1992';

SELECT * FROM books WHERE author_lname = 'eggers' AND released_year > 2010;

-- OR 

SELECT * FROM books WHERE author_lname = 'eggers' AND released_year > 2010;

-- BETWEEN 

SELECT * FROM books WHERE released_year BETWEEN 2004 AND 2015;

-- NOT BETWEEN

SELECT * FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;

-- CAST 

SELECT CAST('09:00:00' AS TIME);

SELECT * FROM people WHERE HOUR(birthtime) BETWEEN 12 AND 16;

-- IN 

SELECT * FROM books WHERE released_year IN ('2005','2010');

-- NOT IN 

SELECT * FROM books WHERE released_year NOT IN ('2005','2010');

SELECT * FROM books WHERE released_year % 2 != 0;

-- CASE Statement 

SELECT title,released_year,
    CASE
        WHEN released_year > 2000 THEN 'Modern'
        ELSE '20th Century'
    END AS genre
FROM books;

SELECT title,stock_quantity,
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS star_ratings
FROM books;

-- IS NULL 

SELECT * FROM books WHERE author_lname IS NULL;

-- IS NOT NULL

SELECT * FROM books WHERE author_lname IS NOT NULL;

-- Excercise

SELECT * FROM books WHERE released_year < 1980;

SELECT * FROM books WHERE author_lname = 'eggers' OR 'chabon';

SELECT * FROM books WHERE released_year < 1980;
 
SELECT * FROM books 
WHERE author_lname = 'Eggers'
OR author_lname = 'Chabon';
 
SELECT * FROM books
WHERE author_lname = 'Lahiri'
AND released_year > 2000;
 
SELECT * FROM books
WHERE pages >= 100 
AND pages <= 200;
 
SELECT * FROM books
WHERE pages BETWEEN 100 and 200;
 
SELECT title, author_lname FROM books
WHERE author_lname LIKE 'C%'
OR author_lname LIKE 'S%';
 
SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');
 
SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;
 
 
SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

-- UNIQUE constraints 

CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);
 
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');
 
-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');


/*----------------------- DAY 16 --------------------------*/

CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);
 
CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
)

CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);
 
CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);
 
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

ALTER TABLE companies DROP COLUMN phone;

RENAME TABLE companies to suppliers;

ALTER TABLE suppliers RENAME TO companies;

ALTER TABLE companies
RENAME COLUMN name TO company_name;

ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

ALTER TABLE suppliers
CHANGE business biz_name VARCHAR(50);

ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);

ALTER TABLE houses DROP CONSTRAINT positive_pprice;


/*----------------------- DAY 17 --------------------------*/

CREATE DATABASE customer_information;

USE customer_information;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);
       
SELECT * FROM customers;

SELECT * FROM orders;

-- INNER JOIN

SELECT customers.first_name,orders.amount
FROM customers
JOIN orders
ON orders.customer_id = customers.id;

-- CROSS JOIN

SELECT * FROM customers,orders;

-- INNER JOIN with GROUP BY 

SELECT customers.first_name,SUM(orders.amount) as amount_spent
FROM customers
JOIN orders
ON orders.customer_id = customers.id
GROUP BY customers.first_name
ORDER BY amount_spent DESC;

-- LEFT JOIN

SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders 
ON orders.customer_id = customers.id;
 
 
SELECT order_date, amount, first_name, last_name
FROM orders 
LEFT JOIN customers 
ON orders.customer_id = customers.id;

-- LEFT JOIN with GROUP BY and IFNULL 

SELECT first_name,last_name, IFNULL(SUM(amount), 0) AS money_spent
FROM customers
LEFT JOIN orders 
ON customers.id = orders.customer_id
GROUP BY first_name , last_name;

-- RIGHT JOIN 

SELECT first_name, last_name, order_date, amount
FROM customers
RIGHT JOIN orders 
ON customers.id = orders.customer_id;

/*----------------------- DAY 18 --------------------------*/

CREATE DATABASE leetcode;

USE leetcode;

Create table If Not Exists Salary (id int, name varchar(100), sex char(1), salary int)
Truncate table Salary
insert into Salary (id, name, sex, salary) values ('1', 'A', 'm', '2500');
insert into Salary (id, name, sex, salary) values ('2', 'B', 'f', '1500');
insert into Salary (id, name, sex, salary) values ('3', 'C', 'm', '5500');
insert into Salary (id, name, sex, salary) values ('4', 'D', 'f', '500');

SELECT * FROM Salary;

UPDATE Salary SET sex =
CASE
    WHEN sex = 'm' THEN 'f'
    ELSE 'm'
END;

Create table If Not Exists SchoolA (student_id int, student_name varchar(20));

Create table If Not Exists SchoolB (student_id int, student_name varchar(20));

Create table If Not Exists SchoolC (student_id int, student_name varchar(20));

Truncate table SchoolA;

insert into SchoolA (student_id, student_name) values ('1', 'Alice');

insert into SchoolA (student_id, student_name) values ('2', 'Bob');

Truncate table SchoolB;

insert into SchoolB (student_id, student_name) values ('3', 'Tom');

Truncate table SchoolC;

insert into SchoolC (student_id, student_name) values ('3', 'Tom');

insert into SchoolC (student_id, student_name) values ('2', 'Jerry');

insert into SchoolC (student_id, student_name) values ('10', 'Alice');


SELECT SchoolA.student_name AS member_A,
SchoolB.student_name AS member_B,
SchoolC.student_name AS member_C
FROM SchoolA
CROSS JOIN SchoolB
CROSS JOIN SchoolC
WHERE SchoolA.student_name != SchoolB.student_name 
AND SchoolB.student_name != SchoolC.student_name
AND SchoolA.student_name != SchoolC.student_name
AND SchoolA.student_id != SchoolC.student_id
AND SchoolA.student_id != SchoolB.student_id
AND SchoolB.student_id != SchoolC.student_id;

CREATE DATABASE movies;

USE movies;

CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);
 
CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);
 
CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2 , 1 ),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id)
        REFERENCES series (id),
    FOREIGN KEY (reviewer_id)
        REFERENCES reviewers (id)
);
 
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
 
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);


-- VIEW

SELECT title,released_year,genre,rating,first_name,last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

CREATE VIEW full_reviews AS 
SELECT title,released_year,genre,rating,first_name,last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT * FROM full_reviews
WHERE genre = 'animation';

SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;


/*----------------------- DAY 19 --------------------------*/

USE movies;

SELECT AVG(rating) FROM full_reviews; 

-- ROLLUP

SELECT title,AVG(rating) FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT title,COUNT(rating) FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT first_name, released_year, genre, AVG(rating)
FROM full_reviews
GROUP BY released_year , genre , first_name WITH ROLLUP;

-- MODES 

SELECT @@GLOBAL.sql_mode;

SELECT @@SESSION.sql_mode;

SELECT 3/0;

SHOW WARNINGS;

-- To Set Them:
SET GLOBAL sql_mode = 'modes';
SET SESSION sql_mode = 'modes';

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);


/*----------------------- DAY 20 --------------------------*/

-- OVER and PARTITION BY

SELECT * FROM employees;

SELECT department,AVG(salary) FROM employees
GROUP BY department;

SELECT department,salary,AVG(salary) OVER (PARTITION BY department) FROM employees;

SELECT department,salary,
MIN(salary) OVER(),
MAX(salary) OVER(),
AVG(salary) OVER()
FROM employees;

SELECT department,salary,
MIN(salary) OVER(PARTITION BY department) AS minimum_salary,
MAX(salary) OVER(PARTITION BY department) AS maximum_salary,
AVG(salary) OVER(PARTITION BY department) AS average_salary
FROM employees;

-- ORDER BY in OVER 

SELECT department,salary,
SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_salary,
SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

SELECT department,salary,
SUM(salary) OVER(PARTITION BY department ORDER BY salary DESC) AS rolling_salary,
SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;

-- RANK() functions 

SELECT emp_no,department,salary,
RANK() OVER(ORDER BY salary DESC) AS ranking
FROM employees;

SELECT emp_no,department,salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_ranking,
RANK() OVER(ORDER BY salary DESC) AS overall_ranking
FROM employees;

SELECT emp_no,department,salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_ranking,
RANK() OVER(ORDER BY salary DESC) AS overall_ranking
FROM employees ORDER BY department;

SELECT emp_no,department,salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary) AS dept_row_number,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_ranking,
RANK() OVER(ORDER BY salary DESC) AS overall_ranking
FROM employees ORDER BY department;

-- DENSE RANK 

SELECT emp_no,department,salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary) AS dept_row_number,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_ranking,
RANK() OVER(ORDER BY salary DESC) AS overall_ranking
FROM employees ORDER BY department;


SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

-- NTILE 

SELECT emp_no, department, salary,
NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

-- LEAD and LAG 

SELECT emp_no,department,salary,
salary - LAG(salary) OVER(ORDER BY salary DESC) as salary_diff
FROM employees;
 
SELECT emp_no,department,salary,
salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff
FROM employees;













