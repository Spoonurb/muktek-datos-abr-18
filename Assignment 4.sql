Assignment 4

SELECT first_name, last_name, salary, job_id FROM Employees
WHERE salary > (SELECT MAX(SALARY) FROM Employees 
WHERE job_id = 'SH_CLERK')
ORDER BY salary;

SELECT b.first_name,b.last_name  FROM Employees b 
WHERE NOT EXISTS (SELECT 'X' FROM Employees a 
						WHERE a.manager_id = b.employee_id);

SELECT employee_id, first_name, last_name, 
(SELECT department_name FROM Departments d
WHERE e.department_id = d.department_id) department 
FROM Employees e ORDER BY department;

SET @i = 0; 
SELECT i, employee_id 
FROM (SELECT @i := @i + 1 AS i, employee_id FROM Employees)
a WHERE MOD(a.i, 2) = 0;


SELECT DISTINCT salary 
FROM Employees e1 
WHERE 5 = (SELECT COUNT(DISTINCT salary) 
FROM Employees  e2 
WHERE e2.salary >= e1.salary);


SELECT DISTINCT salary 
FROM Employees e1 
WHERE 4 = (SELECT COUNT(DISTINCT salary) 
FROM Employees  e2 
WHERE e2.salary <= e1.salary);


SELECT * FROM (
SELECT * FROM Employees ORDER BY employee_id DESC LIMIT 10) sub 
ORDER BY employee_id ASC;


SELECT * FROM Departments 
WHERE department_id 
NOT IN (select department_id FROM Employees);


SELECT DISTINCT salary 
FROM Employees a 
WHERE 3 >= (SELECT COUNT(DISTINCT salary) 
FROM Employees b 
WHERE b.salary >= a.salary) 
ORDER BY a.salary DESC;


SELECT DISTINCT salary 
FROM Employees a 
WHERE  3 >= (SELECT COUNT(DISTINCT salary) 
FROM Employees b 
WHERE b.salary <= a.salary) 
ORDER BY a.salary DESC;


SELECT department_name AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM Departments 
INNER JOIN Employees 
ON Employees.department_id = Departments.department_id 
GROUP BY Departments.department_id, department_name 
ORDER BY department_name;


SELECT employee_id, job_title, end_date-start_date Days FROM JobHistory 
NATURAL JOIN Jobs 
WHERE department_id=90;


SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM Departments d 
INNER JOIN Employees e 
ON (d.manager_id = e.employee_id);


SELECT d.department_name, e.first_name, l.city 
FROM Departments d 
JOIN Employees e 
ON (d.manager_id = e.employee_id) 
JOIN Locations l USING (location_id);


SELECT job_title, AVG(salary) 
FROM Employees 
NATURAL JOIN Jobs 
GROUP BY job_title;


SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary' 
FROM Employees 
NATURAL JOIN Jobs;


SELECT jh.* FROM JobHistory jh 
JOIN Employees e 
ON (jh.employee_id = e.employee_id) 
WHERE salary > 10000;


SELECT department_name, first_name, last_name, hire_date, salary, 
(DATEDIFF(now(), hire_date))/365 Experience 
FROM Departments d JOIN Employees e 
ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365>15;