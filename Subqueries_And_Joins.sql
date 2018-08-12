-- task 1
USE soft_uni;
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees AS e JOIN addresses AS a ON e.address_id = a.address_id
ORDER BY e.address_id LIMIT 5;

-- task 2
SELECT e.first_name, e.last_name,  t.`name`, a.address_text
FROM employees AS e JOIN addresses AS a ON e.address_id = a.address_id 
JOIN towns AS t ON a.town_id = t.town_id ORDER BY first_name, last_name LIMIT 5;

-- task 3
SELECT e.employee_id, e.first_name, e.last_name, d.`name`
FROM employees AS e LEFT JOIN departments AS d ON e.department_id = d.department_id 
WHERE d.`name` = 'Sales' ORDER BY e.employee_id DESC; 

-- task 4
SELECT e.employee_id, e.first_name, e.salary, d.`name`
FROM employees AS e RIGHT JOIN departments AS d ON e.department_id = d.department_id
WHERE salary > 15000 ORDER BY d.department_id DESC LIMIT project_id5;

-- task 5
SELECT e.employee_id, e.first_name FROM employees AS e LEFT JOIN employees_projects AS ep ON ep.employee_id = e.employee_id
WHERE ep.project_id IS NULL ORDER BY e.employee_id DESC LIMIT 3; 

-- task 6
SELECT e.first_name, e.last_name, e.hire_date, d.`name`
FROM employees AS e JOIN departments AS d ON e.department_id = d.department_id
WHERE DATE(e.hire_date) > '1999-01-01' AND d.`name` IN ('Sales', 'Finance') ORDER BY e.hire_date ASC;  

-- task 7
SELECT e.employee_id, e.first_name, p.`name`
FROM employees AS e LEFT JOIN  employees_projects AS ep ON e.employee_id = ep.employee_id
RIGHT JOIN projects AS p ON ep.project_id = p.project_id WHERE DATE (p.start_date) > '2002-08-13' AND end_date IS NULL
ORDER BY e.first_name ASC, p.`name` ASC LIMIT 5;

-- task 8
SELECT e.employee_id, e.first_name, IF(p.start_date >= '2005-01-01', NULL, p.`name`) AS 'pname'
FROM employees AS e LEFT JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
RIGHT JOIN projects AS p ON ep.project_id = p.project_id WHERE e.employee_id = 24 
ORDER BY pname ASC;

-- task 9
SELECT e.employee_id, e.first_name, e.manager_id, emp.first_name
FROM employees AS e JOIN employees AS emp ON e.manager_id = emp.employee_id WHERE e.manager_id IN(3,7)
ORDER BY e.first_name ASC;

-- task 10
SELECT e.employee_id, concat(e.first_name, ' ', e.last_name), concat(emp.first_name, ' ', emp.last_name), d.`name`
FROM employees AS e JOIN employees AS emp ON e.manager_id = emp.employee_id 
JOIN departments AS d ON e.department_id = d.department_id ORDER BY e.employee_id LIMIT 5;

-- task 11
SELECT AVG(salary) FROM employees GROUP BY department_id ORDER BY salary ASC LIMIT 1;

-- task 12
USE geography;
SELECT mc.country_code, m.mountain_range, p.peak_name, p.elevation
FROM peaks AS p JOIN mountains AS m ON p.mountain_id = m.id
JOIN mountains_countries AS mc ON m.id = mc.mountain_id 
WHERE mc.country_code = 'BG' AND p.elevation > 2835 ORDER BY p.elevation DESC;

-- task 13
SELECT mc.country_code, count(m.mountain_range) AS 'counter'
FROM mountains_countries AS mc JOIN mountains AS m ON mc.mountain_id = m.id
GROUP BY mc.country_code HAVING mc.country_code IN('BG', 'RU', 'US') ORDER BY counter DESC;

-- task 14
SELECT c.country_name, r.`river_name`
FROM countries AS c LEFT JOIN countries_rivers AS cr ON c.country_code = cr.country_code
LEFT JOIN rivers AS r ON cr.river_id = r.id WHERE c.continent_code = 'AF' ORDER BY country_name LIMIT 5;

-- task 15

-- task 16
SELECT count(c.country_code)
FROM countries AS c LEFT JOIN mountains_countries AS m ON c.country_code = m.country_code
WHERE m.mountain_id IS NULL;

-- task 17
SELECT c.country_name, p.elevaton, r.length
FROM countries AS c LEFT JOIN coutries_peaks AS cp ON c.country_code = cp.country_code
LEFT JOIN p