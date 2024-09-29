
SET DateStyle TO German;

SELECT first_name , last_name , job_title FROM Employees e join Jobs j on (j.job_title = 'Programmer');

SELECT first_name, last_name, department_name, country_name from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id join countries cc on l.country_id = cc.country_id where department_name in ('Shipping', 'Finance') and country_name = 'United States of America';

SELECT first_name , last_name , salary , min_salary FROM employees e join jobs j on(j.job_id = e.job_id) WHERE salary<=j.min_salary*1.2;

SELECT e.last_name , e.hire_date , mm.last_name , start_date FROM employees e join job_history jh on jh.employee_id = e.manager_id join employees mm on e.manager_id = mm.employee_id WHERE e.hire_date < start_date;
SELECT ((30*20)/10)+(20*10) AS X ;
SELECT first_name,last_name FROM Employees WHERE NOT Department_id = 50;
SELECT first_name,last_name,
CASE
WHEN job_id = 'SA_REP' THEN 'Торговый представитель'
WHEN job_id = 'SA_MAN' THEN 'Менеджер по продажам'
ELSE 'Другое' END FROM employees;
SELECT max(salary),min(salary),avg(salary) FROM employees;