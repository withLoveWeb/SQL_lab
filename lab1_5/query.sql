# 2.1
select
  (first_name || ' ' || last_name) as name
from bd_employees
where phone_number ~ '^8-\(\d{3}\)-\d{3}-\d{2}-\d{2}';

# 2.2
select
  e.last_name,
  d.street,
  d.postal_code
from bd_employees e
left join bd_departments d on e.department_id = d.id
where (e.last_name ~ '^[A-Z][a-z]+$');

# 2.3
select
  last_name,
  regexp_replace(email, '^(..)(.*)(@.*)$', '\1_\3') 
from bd_employees;

# 2.4
select 
   

# 2.7
create view region_deps_counts as
select
  region,
  count(*) as dcount
from deps 
group by region;

