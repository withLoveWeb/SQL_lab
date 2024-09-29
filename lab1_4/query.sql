#2.1
create table deps (
  id integer primary key,
  name varchar(64) not null,
  region varchar(64) not null
);

#2.2
create sequence deps_id_seq
  increment by -2
  start 31
  maxvalue 32
  cache 1 
  no cycle;

#2.3
insert into deps (id, name, region)
values (nextval('deps_id_seq'), 'Direction', 'Mars');

#2.4
insert into deps (id, name, region)
select nextval('deps_id_seq'), d.department_name, r.region_name
from departments d
left join locations l on d.location_id = l.location_id
left join countries c on l.country_id = c.country_id
left join regions r on c.region_id = r.region_id;

#2.5
update deps 
set region = 'Europe'
where region = 'Mars';

#2.6
delete from deps
where id > 15;

#5.8
WITH RECURSIVE tmp(id, path, man_id) AS (
  SELECT employee_id, first_name::text, manager_id 
  FROM employees 
  WHERE employee_id = 100
UNION ALL 
  SELECT e.employee_id , tmp.path ||'->'|| e.first_name, e.manager_id
  FROM tmp 
  JOIN employees e ON tmp.id = e.manager_id
)
SELECT * FROM tmp;

#2.8
WITH RECURSIVE tmp(id, path, man_id) AS (
  SELECT employee_id, first_name::text, manager_id 
  FROM employees 
  WHERE employee_id = 100
UNION ALL 
  SELECT e.employee_id, e.first_name ||'->'|| tmp.path, e.manager_id
  FROM tmp 
  JOIN employees e ON tmp.id = e.manager_id
)
SELECT * FROM tmp;
