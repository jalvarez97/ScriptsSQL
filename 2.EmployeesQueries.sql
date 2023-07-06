
Select * from employees 
where Salary BETWEEN 5000 AND 10000  
AND first_name Like 'S%'

Select * from employees 
where hire_date BETWEEN '1995-01-01' AND '1995-12-31'

Select * from employees 
where MONTH(hire_date) in (1, 4, 7, 10)

Select * from employees
where hire_date < GETDATE() -9125


-- LISTA DE LOS EMPS QUE TRABAJAN EN UN DEPT MIENTRAS QUE EL DEPARTAMENTO TENGA MAS DE 2 EMP

SELECT *
FROM employees                                                              
WHERE
fkdepartment_id in (SELECT fkdepartment_id
					FROM employees 
					GROUP BY fkdepartment_id 
					HAVING COUNT(*)>2)
ORDER BY fkdepartment_id

SELECT *
FROM employees
WHERE fkdepartment_id IN (SELECT department_id 
						  FROM departments 
						  WHERE fklocation_id IN (SELECT location_id 
											      FROM locations 
											      WHERE city = 'Toronto'))
SELECT *
FROM employees
INNER JOIN departments ON fkdepartment_id = department_id
INNER JOIN locations ON fklocation_id = location_id 
WHERE city = 'Toronto'

SELECT j.first_name nomManager, s.* 
FROM employees s
INNER JOIN employees j ON s.fkmanager_id = j.employee_id

-- emps con su cargo
SELECT emp.employee_id, emp.first_name, emp.last_name, job.job_title
FROM employees emp
INNER JOIN jobs job ON emp.fkjob_id = job.job_id 

-- lista de depts con su ciudad
SELECT dep.department_id, department_name, loc.city
FROM departments dep
INNER JOIN locations loc ON dep.fklocation_id = loc.location_id

-- emps con cargo de manager (de jobs) y que cobren mas de 8000
SELECT emp.employee_id, emp.first_name, emp.last_name , emp.salary, job.job_title
FROM employees emp
INNER JOIN jobs job ON emp.fkjob_id = job.job_id 
WHERE job.job_title LIKE '%manager%' AND emp.salary > 8000 
 
-- emps con cargo de manager o que cobren mas de 8000
SELECT emp.employee_id, emp.first_name, emp.last_name , emp.salary, job.job_title
FROM employees emp 
INNER JOIN jobs job ON emp.fkjob_id = job.job_id 
WHERE emp.salary > 8000 OR job.job_title LIKE '%manager%'
ORDER BY emp.salary





-- Nombre de emps con los hijos (dependents)

SELECT emp.employee_id, emp.first_name, emp.last_name
	 , dep.dependent_id id_child, dep.first_name name_child
	 , dep.last_name last_name_child
FROM employees emp
INNER JOIN dependents dep ON emp.employee_id = dep.fkemployee_id

SELECT * FROM employees















-- Nombre de emps con el pais

SELECT emp.first_name, emp.last_name, coun.country_name
FROM employees emp
INNER JOIN departments dep ON emp.fkdepartment_id = dep.department_id
INNER JOIN locations loc ON dep.fklocation_id = loc.location_id 
INNER JOIN countries coun ON loc.fkcountry_id = coun.country_id

-- Nombre de emps con depts y jobs

SELECT emp.first_name, emp.last_name, dep.department_name, job.job_title
FROM employees emp
INNER JOIN departments dep ON emp.fkdepartment_id = dep.department_id
INNER JOIN jobs job ON emp.fkjob_id = job.job_id

-- Nombre de emps con dept, jobs, city, etc

SELECT emp.first_name, emp.last_name, dep.department_name, job.job_title, loc.city, coun.country_name
FROM employees emp
INNER JOIN departments dep ON emp.fkdepartment_id = dep.department_id
INNER JOIN jobs job ON emp.fkjob_id = job.job_id
INNER JOIN locations loc ON dep.fklocation_id = loc.location_id 
INNER JOIN countries coun ON loc.fkcountry_id = coun.country_id



