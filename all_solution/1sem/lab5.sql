--1
SELECT first_name , last_name , phone_number FROM bd_employees WHERE phone_number ~ '^\d+$';
--2
SELECT last_name, first_name ,bd_departments.street FROM bd_employees JOIN bd_departments ON id=department_id WHERE bd_departments.street ~ '[^(A-z|\s)]';
--3
SELECT last_name, regexp_replace(phone_number, '^\+7', '8') FROM bd_employees;



--4
WITH power AS ( SELECT first_name, last_name ,department_id FROM employees 
WHERE manager_id = (SELECT employee_id FROM employees WHERE first_name = 'Alexander' AND last_name = 'Hunold') )

UPDATE staff SET department = (SELECT department_name FROM departments WHERE department_id = 50) 
FROM power WHERE substring(staff.name,1,1) = substring(power.last_name,1,1) 
AND substring(staff.name,2,1) = substring(power.first_name,1,1) 
AND staff.department = (SELECT departments.department_name FROM departments,power WHERE departments.department_id = power.department_id GROUP BY departments.department_name)
RETURNING *;
-- SELECT id,name,department FROM staff,power 
-- WHERE substring(staff.name,1,1) = substring(power.last_name,1,1) 
-- AND substring(staff.name,2,1) = substring(power.first_name,1,1) 
-- AND staff.department = (SELECT departments.department_name FROM departments,power WHERE departments.department_id = power.department_id GROUP BY departments.department_name);


--5
SELECT last_name , first_name FROM bd_employees WHERE 2*LENGTH(regexp_replace(last_name,'[qwrtpsdfghjklzxcvbnm\-]','','gi')) = LENGTH(regexp_replace(last_name,'[eyuioa\-]','','gi'));
--6
WITH RECURSIVE tmp AS( SELECT phone_number AS ph, CASE 
WHEN substring(phone_number,1,1) ~ '\d' THEN substring(phone_number,1,1) 
ELSE '0' END AS sub,1 AS value,last_name FROM bd_employees 
UNION ALL SELECT ph, CASE 
WHEN substring(ph,value+1,1) ~ '\d' THEN substring(ph,value+1,1) 
ELSE '0' END ,value+1,last_name FROM tmp WHERE value < LENGTH(ph) )

SELECT last_name ,ph,sum(sub::numeric) FROM tmp GROUP BY last_name,ph;