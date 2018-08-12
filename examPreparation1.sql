-- task 1
CREATE DATABASE report_service;
USE report_service;

CREATE TABLE users(
id BIGINT NOT NULL PRIMARY KEY,
username VARCHAR(30) UNIQUE,
`password` VARCHAR(50) NOT NULL,
`name` VARCHAR (50),
gender bit,
birthdate DATETIME,
age BIGINT,
email VARCHAR(50) NOT NULL
);

CREATE TABLE departments(
id BIGINT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
id BIGINT PRIMARY KEY,
first_name VARCHAR(25),
last_name VARCHAR(25),
gender BIT,
birthdate DATETIME,
age BIGINT,
department_id BIGINT,
CONSTRAINT fk_employees_departments FOREIGN KEY(department_id) REFERENCES departments(id)
);

CREATE TABLE categories(
id BIGINT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
department_id BIGINT,
CONSTRAINT fk_categories_departments FOREIGN KEY(department_id) REFERENCES departments(id) 
);

CREATE TABLE `status`(
id BIGINT PRIMARY KEY,
label VARCHAR(30) NOT NULL
);

CREATE TABLE reports(
id BIGINT PRIMARY KEY,
category_id BIGINT,
status_id BIGINT,
open_date DATETIME,
close_date DATETIME,
description TEXT,
user_id BIGINT,
employee_id BIGINT,
CONSTRAINT fk_reports_categories FOREIGN KEY(category_id) REFERENCES categories(id),
CONSTRAINT fk_reports_status FOREIGN KEY(status_id) REFERENCES `status`(id),
CONSTRAINT fk_reports_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_reports_employees FOREIGN KEY(employee_id) REFERENCES employees(id)
);

-- later tasks
SELECT username, age FROM users ORDER BY age ASC, username DESC;

SELECT description, open_date FROM reports WHERE employee_id IS NULL ORDER BY open_date ASC, description DESC;

SELECT e.first_name, e.last_name, r.description, r.open_date
FROM employees AS e INNER JOIN reports AS r ON e.id = r.employee_id
ORDER BY e.id, r.open_date, r.id;

SELECT  c.`name`, count(c.`name`) AS 'reports' FROM categories AS c LEFT JOIN reports AS r
ON c.id = r.category_id GROUP BY c.`name` ORDER BY reports, c.`name`;