# 2.1
select
  concat(first_name, ' ', last_name) as "ФИО", 
  salary as "ОКЛАД",
  (salary * 0.87) as "Оклад минус подоходный"
from "employees" 
limit 1;

# 2.2
select
  e.first_name,
  e.last_name,
  j.job_title,
  e.hire_date
FROM employees e
left join jobs j on e.job_id = j.job_id
where (e.hire_date between '1999-01-01' AND '2003-12-31') 
  and (j.job_id in ('AD_PRES', 'AD_VP', 'AD_ASST'))
limit 1;
where (j.job_title in ('AD_PRES', 'AD_VP', 'AD_ASST'))

# 2.3
select
  first_name,
  last_name,
  salary,
  date(hire_date),
  ((extract(year from age(hire_date))*12) + extract(month from age(hire_date)))
from employees
limit 1;

# 2.4
select
  job_id,
  min_salary,
  max_salary,
  ((min_salary + max_salary)/2.0) as avg_salary
from jobs 
limit 1;
