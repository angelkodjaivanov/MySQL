USE soft_uni;

-- task 1
SELECT first_name, last_name FROM employees WHERE lower(first_name) LIKE ('sa%') ORDER BY employee_id ASC;

-- task 2
SELECT first_name, last_name FROM employees WHERE last_name LIKE ('%ei%') ORDER BY employee_id ASC;

-- task 3
SELECT first_name FROM employees WHERE department_id IN(3, 10)
	AND YEAR(hire_date) BETWEEN 1995 AND 2005 ORDER BY employee_id ASC;
    
-- task 4
SELECT first_name, last_name FROM employees WHERE NOT job_title LIKE ('%engineer%');

-- task 5
SELECT `name` FROM towns WHERE char_length(`name`) IN (5, 6) ORDER BY `name` ASC;

-- task 6
SELECT town_id, `name` FROM towns WHERE substring(`name`, 1, 1) IN ('b', 'e', 'm', 'k') ORDER BY `name` ASC;

-- task 7
SELECT town_id, `name` FROM towns WHERE NOT substring(`name`, 1, 1) IN ('r', 'b', 'd') ORDER BY `name` ASC;

-- task 8
CREATE VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name FROM employees WHERE YEAR(hire_date) > 2000;

-- task 9
SELECT first_name, last_name FROM employees WHERE char_length(last_name) = 5;

-- task 10
USE geography;
SELECT country_name, iso_code FROM countries WHERE country_name LIKE ('%a%a%a%') ORDER BY iso_code;

-- task 11
SELECT p.peak_name, r.river_name, lower(concat(substring(p.peak_name, 1, char_length(p.peak_name) - 1), river_name)) AS 'mix'
FROM peaks AS p JOIN rivers AS r WHERE substring(p.peak_name, -1) = substring(r.river_name, 1, 1) 
ORDER BY lower(concat(substring(p.peak_name, 1, char_length(p.peak_name) - 1), river_name)) ASC;

-- task 12
USE diablo;
SELECT `name`, date_format(`start`, '%Y-%m-%d') FROM games WHERE YEAR(`start`) IN (2011, 2012) ORDER BY `start` ASC;

-- task 13
SELECT user_name, RIGHT(email, char_length(email) - instr(email, '@')) FROM users 
ORDER BY RIGHT(email, char_length(email) - instr(email, '@')) ASC, user_name ASC;

-- task 14
SELECT user_name , ip_address FROM users WHERE ip_address LIKE('___.1%.%.___') ORDER BY user_name ASC;

-- task 15
SELECT `name`, 
	CASE
	WHEN HOUR(`start`) >= 0 AND HOUR(`start`) < 12 THEN 'Morning'
    WHEN HOUR(`start`) >= 12 AND HOUR(`start`) < 18 THEN 'Afternoon'
    WHEN HOUR(`start`) >= 18 AND HOUR(`start`) < 24 THEN 'Evening'
	END AS 'Part of the Day',
    CASE
	WHEN `duration` <= 3 THEN 'Extra Short'
    WHEN `duration` > 3 AND `duration` <= 6 THEN 'Short'
    WHEN `duration` > 6 AND `duration` <= 10 THEN 'Long'
    ELSE 'Extra Long'
	END AS 'Duartion'
FROM games ORDER BY `name` ASC;

-- task 16
USE orders;
SELECT product_name, order_date,
date_add(order_date, INTERVAL 3 DAY), date_add(order_date, INTERVAL 1 MONTH) FROM orders;