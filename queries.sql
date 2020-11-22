
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT id
	 , last_name
	 , first_name
	 , sex
	 , salary
FROM employee e
JOIN salary s ON s.employee = e.id
;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name
	 , last_name
	 , hire_date
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 1986
;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.id AS department_id
	 , d.name AS department_name
	 , e.id AS manager_employee_id
	 , e.last_name
	 , e.first_name
FROM department_manager dm
JOIN department d ON d.id = dm.department
JOIN employee e ON e.id = dm.employee
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.id AS employee_id
	 , e.last_name
	 , e.first_name
	 , d.name AS department_name
FROM department_employee de
JOIN employee e ON e.id = de.employee
JOIN department d ON d.id = de.department
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name
	 , last_name
	 , sex
FROM employee
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.id AS employee_id
	 , e.last_name
	 , e.first_name
	 , d.name AS department_name
FROM department_employee de
JOIN employee e ON e.id = de.employee
JOIN department d ON d.id = de.department
WHERE d.id = 'd007'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.id AS employee_id
	 , e.last_name
	 , e.first_name
	 , d.name AS department_name
FROM department_employee de
JOIN employee e ON e.id = de.employee
JOIN department d ON d.id = de.department
WHERE d.id IN ('d007', 'd005')
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS count_last_name
FROM employee
GROUP BY last_name
ORDER BY 2 DESC
;
