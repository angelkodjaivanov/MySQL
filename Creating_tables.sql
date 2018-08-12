-- task 2
CREATE TABLE minions(
id INT(6),
name VARCHAR(30),
age INT(3),
CONSTRAINT minion PRIMARY KEY(id)
);
CREATE TABLE towns(
id INT(6),
name VARCHAR(30),
CONSTRAINT minion PRIMARY KEY(id)
);

-- task 3
ALTER TABLE minions
ADD town_id INT(6);

ALTER TABLE minions
ADD CONSTRAINT minion
FOREIGN KEY (town_id) REFERENCES towns(id);

-- task 4
INSERT INTO minions(id, name, age, town_id)
VALUES (1, 'Kevin', 22, 1);
INSERT INTO minions(id, name, age, town_id)
VALUES (2, 'Bob', 15, 3);
INSERT INTO minions(id, name, age, town_id)
VALUES (3, 'Steward', NULL, 2);

INSERT INTO towns(id, name)
VALUES (1, 'Sofia');
INSERT INTO towns(id, name)
VALUES (2, 'Plovdiv');
INSERT INTO towns(id, name)
VALUES (3, 'Varna');

-- task 5
DELETE FROM minions;

-- some more tries
TRUNCATE minions;

-- task 6
DROP TABLE minions;
DROP TABLE towns;

-- task 7
CREATE TABLE people(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(200) NOT NULL,
picture BLOB,
height DOUBLE(20, 2),
weight DOUBLE(20, 2),
gender CHAR(1) NOT NULL,
birthdate DATE NOT NULL,
biography TEXT
);

INSERT INTO people(name , picture, height, weight, gender, birthdate, biography)
VALUES ('Ivan', NULL, 180, 90, 'm', DATE '1964-01-01', 'I am the best!');
INSERT INTO people(name , picture, height, weight, gender, birthdate, biography)
VALUES ('Ivan', 'C:\Users\AgiKo\Desktop\Games\panda.png', 180, 90, 'm', DATE '1964-01-01', 'something');
INSERT INTO people(name , picture, height, weight, gender, birthdate, biography)
VALUES ('Angel', NULL, 150, 80, 'm', DATE '1964-01-22', 'something');
INSERT INTO people(name , picture, height, weight, gender, birthdate, biography)
VALUES ('Krista', NULL, 120, 70, 'f', DATE '1964-02-03', 'something');
INSERT INTO people(name , picture, height, weight, gender, birthdate, biography)
VALUES ('Yoan', NULL, 190, 60, 'm', DATE '1964-01-15', 'something');

-- task 8
CREATE TABLE users(
id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
username VARCHAR(30) NOT NULL UNIQUE ,
`password` VARCHAR(26) NOT NULL,
profile_picture MEDIUMBLOB,
last_login_time TIMESTAMP,
is_deleted BIT
);

INSERT INTO users(username, `password`, profile_picture, is_deleted)
VALUES ('Yoan', '12345678', NULL, 0);
INSERT INTO users(username, `password`, profile_picture, is_deleted)
VALUES ('Angel', '12345678', NULL, 0);
INSERT INTO users(username, `password`, profile_picture, is_deleted)
VALUES ('Stuci', '87654321', 'C:\Users\AgiKo\Desktop\Games\panda.png', 1);
INSERT INTO users(username, `password`, profile_picture, is_deleted)
VALUES ('Puci', '12345678', NULL, 0);
INSERT INTO users(username, `password`, profile_picture, is_deleted)
VALUES ('Kuci', '12345678', NULL, 0);

-- task 9
ALTER TABLE users 
MODIFY id INT NOT NULL;
ALTER TABLE users
DROP PRIMARY KEY;
ALTER TABLE users
ADD CONSTRAINT pk_users PRIMARY KEY(id, username);


-- task 10
ALTER TABLE users
MODIFY last_login_time TIMESTAMP;

-- task 11
ALTER TABLE users
DROP PRIMARY KEY;
ALTER TABLE users
MODIFY id INT NOT NULL AUTO_INCREMENT,
ADD CONSTRAINT pk_users PRIMARY KEY(id);
ALTER TABLE users
MODIFY username VARCHAR(50) UNIQUE;


-- task 11 is not completed TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


-- task 12
CREATE DATABASE Movies;

USE Movies;

CREATE TABLE directors(
id INT(6)  PRIMARY KEY,
director_name VARCHAR(30),
notes TEXT 
);

CREATE TABLE genres(
id INT(6)  PRIMARY KEY,
genre_name VARCHAR(30),
notes TEXT
);

CREATE TABLE categories(
id INT(6) PRIMARY KEY,
category_name VARCHAR(30),
notes TEXT
);

CREATE TABLE movies(
id INT(6)  PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
director_id INT(6),
copyright_year DATE,
`length` TIME,
genre_id INT(6),
category_id INT(6),
rating INT(5),
notes TEXT
);

ALTER TABLE movies
ADD CONSTRAINT fk_movies_directors FOREIGN KEY (director_id) REFERENCES directors(id);
ALTER TABLE movies
ADD CONSTRAINT fk_movies_genres FOREIGN KEY (genre_id) REFERENCES genres(id);
ALTER TABLE movies
ADD CONSTRAINT fk_movies_categories FOREIGN KEY (category_id) REFERENCES categories(id);

INSERT INTO directors(id, director_name, notes)
VALUES (1, 'Stoyan', 'I am 16 years old.');
INSERT INTO directors(id, director_name, notes)
VALUES (2, 'Angel', 'I am 16 years old.');
INSERT INTO directors(id, director_name, notes)
VALUES (3, 'Kaloyan', 'I am 16 years old.');
INSERT INTO directors(id, director_name, notes)
VALUES (4, 'Martin', 'I am 16 years old.');
INSERT INTO directors(id, director_name, notes)
VALUES (5, 'Harut', 'I am 16 years old.');

INSERT INTO genres(id, genre_name, notes)
VALUES (1, 'Action', 'I love `action` films');
INSERT INTO genres(id, genre_name, notes)
VALUES (2, 'Romantic', 'I love `romantic` films');
INSERT INTO genres(id, genre_name, notes)
VALUES (3, 'Scary', 'I love `scary` films');
INSERT INTO genres(id, genre_name, notes)
VALUES (4, 'Sci-Fi', 'I love `Sci-Fi` films');
INSERT INTO genres(id, genre_name, notes)
VALUES (5, 'Fantasy', 'I love `fantasy` films');

INSERT INTO categories(id, category_name, notes)
VALUES (1, 'something', 'something');
INSERT INTO categories(id, category_name, notes)
VALUES (2, 'interesing', 'something very interesting');
INSERT INTO categories(id, category_name, notes)
VALUES (3, 'good', 'something good');
INSERT INTO categories(id, category_name, notes)
VALUES (4, 'something', 'something');
INSERT INTO categories(id, category_name, notes)
VALUES (5, 'something', 'something');

INSERT INTO movies(title, director_id, copyright_year, `length`, genre_id, category_id, rating, notes)
VALUES ('Lord of the Rings', 1, DATE '1890-01-01', TIME '01:30:00', 5, 1, 5, 'A very good film.');
INSERT INTO movies(title, director_id, copyright_year, `length`, genre_id, category_id, rating, notes)
VALUES ('God of War', 2, DATE '1890-02-01', TIME '01:30:00', 1, 2, 3, 'A very good film.');
INSERT INTO movies(title, director_id, copyright_year, `length`, genre_id, category_id, rating, notes)
VALUES ('Star Wars', 3, DATE '2018-01-01', TIME '03:30:00', 5, 3, 2, 'A very good film.');
INSERT INTO movies(title, director_id, copyright_year, `length`, genre_id, category_id, rating, notes)
VALUES ('Family Guy', 4, DATE '1890-01-01', TIME '02:00:00', 2, 4, 4, 'A very good film.');
INSERT INTO movies(title, director_id, copyright_year, `length`, genre_id, category_id, rating, notes)
VALUES ('King-Kong', 5, DATE '1890-01-01', TIME '01:00:00', 3, 5, 2, 'A very good film.');

-- Gives me 66 points in judge, so this also must be reworked !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- task 13
CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE categories(
id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
category VARCHAR(50) NOT NULL,
daily_rate INT,
weekly_rate INT,
monthly_rate INT,
weekend_rate INT
);

CREATE TABLE cars(
id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
plate_number INT NOT NULL,
make VARCHAR(10) NOT NULL,
care_year DATE,
category_id INT(6) NOT NULL,
CONSTRAINT fk_cars_categories FOREIGN KEY(category_id) REFERENCES categories(id),
doors INT(1),
pircture BLOB,
car_condition VARCHAR(20),
available BIT
);

CREATE TABLE employees(
id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30),
title VARCHAR(50),
notes LONGTEXT
);

CREATE TABLE customers(
id INT(6) AUTO_INCREMENT PRIMARY KEY NOT NULL,
driver_license_number INT,
full_name VARCHAR(40),
address VARCHAR(50),
city VARCHAR(30) NOT NULL,
zip_code VARCHAR(50),
notes LONGTEXT
);

CREATE TABLE rental_orders(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
employee_id INT,
customer_id INT,
car_id INT,
car_condition VARCHAR(50), 
tank_level DECIMAL (20,2),
kilometrage_start INT,
kilometrage_end INT,
total_kilometrage INT,
start_date DATETIME,
end_date DATETIME,
total_days INT,
rate_applied VARCHAR(50),
tax_rate INT,
order_status VARCHAR(30),
notes TEXT
);

INSERT INTO categories(category)
VALUES('dasdads'),('dasdads'),('dasdads'),('dasdads'),('dasdads');

INSERT INTO cars(plate_number,make, category_id)
VALUES(4,'dasd', 1),(4,'dasd', 2),(4,'dasd', 3),(4,'dasd', 4),(4,'dasd', 5);

INSERT INTO employees(first_name) 
VALUES('dasdads'),('dasdads'),('dasdads'),('dasdads'),('dasdads');

INSERT INTO customers(city) 
VALUES('dasdads'),('dasdads'),('dasdads'),('dasdads'),('dasdads');

INSERT INTO rental_orders(employee_id,customer_id,car_id) 
VALUES(1,2,1),(2,2,1),(3,2,1),(4,2,1),(5,2,1);


-- task 14 hotel database -> done - the code is in the judge system;

-- task 15 
CREATE DATABASE soft_uni;

USE soft_uni;

create table towns(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(30)
);
create table addresses(
id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
address_text  VARCHAR(50),
town_id INT,
CONSTRAINT fk_addresses_towns FOREIGN KEY (town_id) REFERENCES towns(id) 
);
create table `departments`(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(10)
);
create table employees(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20),
middle_name VARCHAR(20),
last_name VARCHAR(20),
job_title VARCHAR(30),
department_id INT,
hire_date DATE,
salary DOUBLE (10,2),
address_id INT,
CONSTRAINT FK_address_id FOREIGN KEY (address_id) REFERENCES addresses(id),
CONSTRAINT FK_department_id FOREIGN KEY (department_id) REFERENCES  departments (id)  
);


-- task 17
INSERT INTO towns(name)
VALUES ('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas');

INSERT INTO departments(name)
VALUES ('Engineering'),('Sales'),('Marketing'),('Software Development'),('Quality Assurance');

INSERT INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary)
VALUES ('Ivan','Ivanov','Ivanov','.NET Developer',4,'2013-02-01','3500.00'),
('Petar','Petrov','Petrov','Senior Engineer',1,'2004-03-02','4000.00'),
('Maria','Petrova','Ivanova','Intern',5,'2016-08-28','525.25'),
('Georgi','Terziev','Ivanov','CEO',2,'2007-12-09','3000.00'),
('Peter','Pan','Pan','Intern',3,'2016-08-28','599.88');

-- task 18
SELECT*FROM towns;
SELECT*FROM departments;
SELECT*FROM employees;

-- task 19
SELECT * FROM towns AS t ORDER BY t.name;
SELECT * FROM departments AS d ORDER BY d.name;
SELECT * FROM employees ORDER BY salary DESC;

-- task 20
SELECT name FROM towns ORDER BY name;
SELECT name FROM departments ORDER BY name;
SELECT first_name,last_name,job_title,salary FROM employees ORDER BY salary DESC;

-- task 21
UPDATE employees
SET salary=salary*1.1;
SELECT salary FROM employees;

-- task 22
-- using hotels database 
SELECT tax_rate*0.97 FROM payments;

-- task 23
-- using hotels database 
DELETE FROM occupancies;