USE soft_uni;

-- task 1
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN 
	SELECT first_name, last_name FROM employees WHERE salary > 35000 
    ORDER BY first_name ASC, last_name ASC, employee_id ASC;
END $$

CALL usp_get_employees_salary_above_35000();

-- task 2
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(`number` DOUBLE)
BEGIN 
	SELECT first_name, last_name FROM employees WHERE salary >= `number` 
    ORDER BY first_name ASC, last_name ASC, employee_id ASC;
END $$

CALL usp_get_employees_salary_above(48100);

-- task 3 
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(started VARCHAR(50))
BEGIN 
	SELECT `name` FROM towns WHERE `name` LIKE concat(started, '%')
  	ORDER BY `name` ASC;
END $$

CALL usp_get_towns_starting_with('b');

-- task 4
DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN 
	SELECT e.first_name, e.last_name FROM employees AS e 
	JOIN addresses AS a ON e.address_id = a.address_id
    JOIN towns AS t ON t.town_id = a.town_id WHERE t.`name` = town_name
    ORDER BY e.first_name, e.last_name, e.employee_id;
END $$

CALL usp_get_employees_from_town('Sofia');

-- task 5
DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(salary INT)
RETURNS VARCHAR(50)
BEGIN
	CASE 
		WHEN salary < 30000 THEN RETURN 'Low';
        WHEN salary BETWEEN 30000 AND 50000 THEN RETURN 'Average';
        WHEN salary > 50000 THEN RETURN 'High';
	END CASE;
END $$

SELECT ufn_get_salary_level(40000);


-- task 6
DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(20))
BEGIN
	SELECT e.first_name, e.last_name FROM employees AS e WHERE ufn_get_salary_level(e.salary) = salary_level
    ORDER BY e.first_name DESC, e.last_name DESC;
END $$

CALL usp_get_employees_by_salary_level('High');