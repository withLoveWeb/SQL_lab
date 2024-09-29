
-- 5 ВАРИАНТ
CREATE TABLE staff (
id INT PRIMARY KEY,
name VARCHAR(64) NOT NULL,
department VARCHAR(64) NOT NULL
);

CREATE SEQUENCE staff_id_seq
START WITH 12
MAXVALUE 12
INCREMENT BY -8
CYCLE
CACHE 100;

INSERT INTO staff (id, name, department)
VALUES (nextval('staff_id_seq'), 'Ivan Makarenko', 'Director');

INSERT INTO staff(id, name, department)
SELECT nextval('staff_id_seq'),
CONCAT(SUBSTRING(employees.last_name, 1, 1), SUBSTRING(employees.first_name, 1, 1)),
departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

UPDATE staff
SET department = 'Innovations department'
WHERE id IN (12, 4);

DELETE FROM staff 
-----------
WITH RECURSIVE tmp(id,path,man_id) AS
(SELECT employee_id,first_name::text,manager_id FROM employees WHERE employee_id = 100
UNION ALL SELECT employees.employee_id , tmp.path ||'->'||employees.first_name,employees.manager_id
FROM tmp JOIN employees ON tmp.id = employees.manager_id)
SELECT * FROM tmp;