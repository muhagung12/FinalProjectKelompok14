/*
	INITIAL DATABASE
	Creating Database, 
	Tables
*/

-- run this separately from the table queries
CREATE DATABASE db_employee;

USE db_employee
GO;

CREATE TABLE tbl_permissions(
	id int PRIMARY KEY,
	name varchar(100) NOT NULL
);

CREATE TABLE tbl_roles(
	id int PRIMARY KEY,
	name VARCHAR(50)
);

CREATE TABLE tbl_role_permissions(
	id int PRIMARY KEY,
	role int NOT NULL,
	permission int NOT NULL,
	FOREIGN KEY (role) REFERENCES tbl_roles(id),
	FOREIGN KEY (permission) REFERENCES tbl_permissions(id)
);

CREATE TABLE tbl_regions(
	id int PRIMARY KEY,
	name VARCHAR(25) NOT NULL
);

CREATE TABLE tbl_countries(
	id char(3) PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	region int NOT NULL,
	FOREIGN KEY (region) REFERENCES tbl_regions(id)
);

CREATE TABLE tbl_locations(
	id int PRIMARY KEY,
	street_address varchar(40),
	postal_code varchar(12),
	city varchar(30) NOT NULL,
	state_province varchar(25),
	country char(3),
	FOREIGN KEY (country) REFERENCES tbl_countries(id)
);

CREATE TABLE tbl_departments(
	id int PRIMARY KEY,
	name varchar(30) NOT NULL,
	location int NOT NULL,
	FOREIGN KEY (location) REFERENCES tbl_locations(id)
)

CREATE TABLE tbl_jobs(
	id varchar(10) PRIMARY KEY,
	title VARCHAR(35) NOT NULL,
	min_salary int,
	max_salary int
);

CREATE TABLE tbl_employees(
	id int PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25),
	gender VARCHAR(10) NOT NULL,
	email VARCHAR(25) NOT NULL UNIQUE,
	phone VARCHAR(20),
	hire_date DATE NOT NULL,
	salary int,
	manager int,
	job varchar(10),
	department int,
	FOREIGN KEY (manager) REFERENCES tbl_employees(id),
	FOREIGN KEY (job) REFERENCES tbl_jobs(id),
	FOREIGN KEY (department) REFERENCES tbl_departments
);

CREATE TABLE tbl_job_histories(
	employee int, -- PK, FK
	start_date DATE, -- PK
	end_date DATE,
	status varchar(10) NOT NULL,
	job varchar(10) NOT NULL,
	department int NOT NULL,
	FOREIGN KEY (job) REFERENCES tbl_jobs(id),
	FOREIGN KEY (department) REFERENCES tbl_departments(id),
	FOREIGN KEY (employee) REFERENCES tbl_employees(id),
	PRIMARY KEY (employee, start_date)
);

CREATE TABLE tbl_accounts(
	id int PRIMARY KEY, -- PK, FK
	username varchar(25),
	password varchar(255) NOT NULL,
	otp int NOT NULL,
	is_expired datetime NOT NULL,
	is_used bit NOT NULL,
	FOREIGN KEY (id) REFERENCES tbl_employees(id)
);

CREATE TABLE tbl_account_roles(
	id int PRIMARY KEY,
	account int NOT NULL,
	role int NOT NULL,
	FOREIGN KEY (account) REFERENCES tbl_accounts(id),
	FOREIGN KEY (role) REFERENCES tbl_roles(id)
);