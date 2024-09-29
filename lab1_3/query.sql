#2.1
select 
  e.job_id,
  d.location_id
from employees e
left join departments d on e.department_id = d.department_id 
where hire_date > '1999-01-01'
limit 1;

#2.2
select 
  e.first_name,
  e.last_name,
  r.region_name
from employees e
left join departments d on e.department_id = d.department_id 
left join locations l on d.location_id = l.location_id
left join countries c on l.country_id = c.country_id
left join regions r on c.region_id = r.region_id
limit 1;

#2.3
select 
  e.last_name as employeer_name,
  e.hire_date as employeer_date,
  m.last_name as manager_name, 
  m.hire_date as manager_name
from employees e
left join employees m on e.manager_id = m.employee_id
where e.hire_date < m.hire_date
limit 1;

#2.4
select 
  e.last_name,
  e.first_name,
  e.salary
from employees e
where e.salary > (select avg(salary) from employees) 
order by e.salary desc
limit 1;

#2.5
select 
  e.last_name,
  e.job_id
from employees e 
left join departments d on e.department_id = d.department_id
where d.department_name = 'Executive'
limit 1;
