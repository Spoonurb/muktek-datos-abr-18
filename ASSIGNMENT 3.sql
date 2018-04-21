ASSIGNMENT 3

SELECT first_name, last_name, salary FROM Employees 
	WHERE salary NOT BETWEEN 10000 AND 15000;

SELECT first_name, last_name, department_id FROM Employees 
	WHERE department_id=30 OR department_id=100 
	ORDER BY department_id ASC;

SELECT first_name, last_name, salary FROM Employees 
	WHERE (salary NOT BETWEEN 10000 AND 15000) 
	AND (department_id=30 OR department_id=100);

SELECT first_name, last_name, hire_date FROM Employees 
	WHERE YEAR(hire_date)=1987;

SELECT first_name FROM Employees 
	WHERE first_name LIKE '%b%' 
	AND first_name LIKE '%c%';

SELECT last_name, job_id, salary FROM Employees
	WHERE job_id = 'IT_PROG' OR job_id = 'SH_CLERK' 
    AND salary NOT IN (4000,10000,15000);

SELECT last_name FROM Employees 
	WHERE first_name LIKE '%%%%%%';

SELECT last_name FROM Employees 
	WHERE last_name LIKE '__e%';

SELECT DISTINCT JOB_TITLE FROM Jobs
	LEFT OUTER JOIN Employees ON Jobs.JOB_ID = Employees.JOB_ID
    WHERE Jobs.job_id NOT IN (Employees.JOB_ID);

SELECT DISTINCT * FROM Jobs
	LEFT OUTER JOIN Employees ON Jobs.JOB_ID = Employees.JOB_ID
    WHERE Employees.job_id IS NULL;

SELECT first_name, last_name, salary, (Salary *.15) AS PF  FROM Employees;

SELECT * FROM Employees
	WHERE last_name IN ('BLAKE', 'SCOTT', 'KING', 'FORD');