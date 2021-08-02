
        -- Q:1
select first_name, last_name from employees where salary = (select max(salary) from employees);
       -- Q:2
select first_name, last_name from employees where job_id like '%clerk' and salary = (select max(salary) from employees where job_id like  '%clerk');
	-- Q:3
select first_name, last_name,job_id from employees where job_id like '%ACCOUNT' and salary > (select max(salary) from employees where job_id like '%clerk');
	-- Q:4
select first_name, last_name,job_id from employees wb_id like '%clerk' and salary > (select MIN(salary) from employees where job_id like '%programer');
	-- Q:5
select first_name, last_name ,salary from employees where salary >  all (select salary from employees where first_name = 'peter') or salary > all (select salary from employees where first_name = 'lisa');
	-- Q:6
select first_name,last_name from employees as em where salary > (select AVG(salary) from employees as em3 where em.department_id = em3.department_id);
	-- Q:7
select first_name,last_name from employees as em where salary = (select max(salary) from employees as em3 where em.department_id = em3.department_id);
	-- Q:8
select first_name, last_name from employees where department_id = '20' and department_id = (select department_id from departments where department_name like 'shipping');
	-- Q:9
select first_name , last_name from employees where job_id =any (select job_id as jb from employees group by job_id) and salary > (select max(salary) from employees where jb.job_id = job_id group by job_id);
	-- Q:10
select employee_id,first_name , last_name from employees where department_id = '20' and job_id = any (select job_id from employees where department_id = '20');
	-- Q:11
select first_name , last_name from employees where department_id = any (select department_id from departments where department_name like '%finance');
	-- Q:12
select first_name , last_name from employees where  salary > all (select max(salary) from employees where department_id ='20') and salary > all (select max(salary) from employees where department_id ='30');
	-- Q:13
select first_name, last_name from employees,departments where location_id = (select location_id from locations where city = 'sydney');
	-- Q:14
select first_name , last_name ,job_id from employees where department_id = 10 and job_id = any (select employees.job_id from employees, jobs );
	-- Q:15
select job_id, sum(salary)  from employees where salary > (select max(salary) from employees where job_id like '%MGR')  group by job_id;
	-- Q:16
select  max(salary) from employees group by department_id having max(salary) > 9000;
	-- Q:17
select first_name, last_name from employees where department_id = '10' and salary > any (select salary from employees where department_id <> '10');
	-- Q:18
select first_name, last_name from employees where job_id = all (select job_id from departments where location_id = (select location_id from locations where city = 'Munich'));
	-- Q:19
select first_name, last_name , job_id,department_name from employees ,departments where employees.department_id = departments.department_id;
	-- Q:20
select first_name , last_name from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));
	-- Q:21
select department_name from departments where department_id = any  (select department_id from employees group by department_id having count(department_id) > 2);