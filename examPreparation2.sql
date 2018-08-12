CREATE DATABASE closed_judge_system;
USE closed_judge_system;

CREATE TABLE users(
id INT PRIMARY KEY,
username VARCHAR(30) NOT NULL UNIQUE,
`password` VARCHAR(30) NOT NULL,
email VARCHAR(50)
);

CREATE TABLE categories(
id INT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
parent_id INT,
CONSTRAINT fk_parent_id_categories FOREIGN KEY(parent_id) REFERENCES categories(id)
);

CREATE TABLE contests(
id INT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
category_id INT,
CONSTRAINT fk_contests_categories FOREIGN KEY(category_id) REFERENCES categories(id)
);

CREATE TABLE problems(
id INT PRIMARY KEY,
`name` VARCHAR(100) NOT NULL,
points INT NOT NULL,
tests INT DEFAULT 0,
contest_id INT,
CONSTRAINT fk_problems_contests FOREIGN KEY(contest_id) REFERENCES contests(id)
);
CREATE TABLE submissions(
id INT PRIMARY KEY AUTO_INCREMENT,
passed_tests INT NOT NULL,
problem_id INT,
CONSTRAINT fk_submissions_problems FOREIGN KEY(problem_id) REFERENCES problems(id),
user_id INT,
CONSTRAINT fk_submissions_users FOREIGN KEY(user_id) REFERENCES users(id)
);


CREATE TABLE users_contests(
user_id INT,
contest_id INT,
CONSTRAINT pk_users_contests PRIMARY KEY(user_id, contest_id),
CONSTRAINT fk_user_id_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_contest_id_contests FOREIGN KEY(contest_id) REFERENCES contests(id)
);


-- task 2

INSERT INTO submissions (passed_tests, problem_id, user_id)
SELECT ceil(sqrt(power(CHAR_LENGTH(p.`name`), 3)) - char_length(p.`name`)),
p.id, ceil(p.id * 3 / 2) FROM problems AS p WHERE p.id BETWEEN 1 AND 10;

-- task 3
UPDATE problems AS p
INNER JOIN contests AS c ON p.contest_id = c.id
INNER JOIN categoreis AS cat ON c.category_id = cat.id
INNER JOIN submissions AS s ON s.problem_id = p.id
SET p.tests = 
	CASE p.id % 3
    WHEN 0 THEN length(cat.`name`)
    WHEN 1 THEN (SELECT sum(s.id) FROM submissions AS s
		WHERE s.problem_id = p.id)
    WHEN 2 THEN char_length(c.`name`)
    END 
WHERE p.tests = 0;

-- task 4
DELETE u FROM users AS u kLEFT JOIN users_contests AS uc ON u.id = uc.user_id
LEFT JOIN contests AS c ON uc.contest_id = c.id WHERE c.id IS  NULL;

-- task 5
SELECT id, username, email FROM users ORDER BY id;

-- task 6
SELECT id, `name` FROM categories WHERE parent_id IS NULL;

-- task 7
SELECT  id, `name`, tests FROM problems 
WHERE tests > points AND `name` LIKE ('% %')
ORDER BY id DESC;

-- task 8
SELECT p.id, concat(cat.`name`, ' - ', c.`name`, ' - ', p.`name`)
FROM problems AS p INNER JOIN contests AS c ON p.contest_id = c.id
INNER JOIN categories AS cat ON c.category_id = cat.id ORDER BY p.id ASC;

-- task 9
SELECT cat.id, cat.`name` FROM categories AS cat 
LEFT JOIN categories AS c ON cat.id = c.parent_id
WHERE c.parent_id IS NULL ORDER BY cat.`name`;

-- task 10
SELECT u.id, u.username, u.`password` FROM users AS  u
WHERE u.`password` IN (SELECT us.`password` FROM users AS us GROUP BY us.`password` HAVING(count(us.`password`) > 1))
ORDER BY u.username;

-- task 11
SELECT * FROM 
(SELECT  c.id, c.`name`, count(u.id) AS 'counter'
FROM contests AS c LEFT JOIN users_contests AS uc ON c.id = uc.contest_id
LEFT JOIN users AS u ON uc.user_id = u.id GROUP BY c.id ORDER BY 
counter DESC LIMIT 5) AS q
ORDER BY q.counter, q.id;

                         -- Must be continued with exam preparation from 24.Month.2017 --
                         
