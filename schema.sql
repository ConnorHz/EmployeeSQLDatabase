DROP TABLE IF EXISTS title CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS department_employee;
DROP TABLE IF EXISTS department_manager;

CREATE TABLE title (
	id varchar(5) PRIMARY KEY,
	name varchar(255)
);

CREATE TABLE employee (
	id int PRIMARY KEY,
	title varchar(5),
	birth_date date,
	first_name varchar(255),
	last_name varchar(255),
	sex varchar(2),
	hire_date date,
	FOREIGN KEY (title) REFERENCES title(id)
);

CREATE TABLE salary (
	employee int NOT NULL,
	salary numeric(10,2) NOT NULL,
	PRIMARY KEY(employee, salary),
	FOREIGN KEY (employee) REFERENCES employee(id)
);

CREATE TABLE department (
	id varchar(4) PRIMARY KEY,
	name varchar(255)
);

CREATE TABLE department_employee (
	department varchar(4) NOT NULL,
	employee int NOT NULL,
	PRIMARY KEY(department, employee),
	FOREIGN KEY (department) REFERENCES department(id),
	FOREIGN KEY (employee) REFERENCES employee(id)
);

CREATE TABLE department_manager (
	department varchar(4) NOT NULL,
	employee int NOT NULL,
	PRIMARY KEY(department, employee),
	FOREIGN KEY (department) REFERENCES department(id),
	FOREIGN KEY (employee) REFERENCES employee(id)
);