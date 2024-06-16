USE employee;
GO

CREATE TABLE employees (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  firstname VARCHAR(25) NOT NULL,
  lastname VARCHAR(25) ,
  gender VARCHAR(10) NOT NULL,
  email VARCHAR(25) NOT NULL UNIQUE,
  phone VARCHAR(20),
  hire_date DATE NOT NULL,
  salary INT,
  manager INT,
  FOREIGN KEY (manager) REFERENCES employee(id),
  job VARCHAR(10),
  department INT,
  FOREIGN KEY (job) REFERENCES job(name),
  FOREIGN KEY (department) REFERENCES department(id)
);

CREATE TABLE jobs (
id VARCHAR(10) PRIMARY KEY NOT NULL,
title VARCHAR(35) NOT NULL,
min_salary int DEFAULT 0,
max_salary int DEFAULT 0
);

CREATE TABLE job_histories(
employee int PRIMARY KEY NOT NULL,
start_date DATE PRIMARY KEY NOT NULL,
end_date DATE,
status VARCHAR(10) NOT NULL,
job VARCHAR(10) NOT NULL,
department int NOT NULL,
FOREIGN KEY (department) REFERENCES departments(id),
FOREIGN KEY (job) REFERENCES jobs(id)
);

CREATE TABLE departments (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(30) NOT NULL,
  location INT,
  FOREIGN KEY (location) REFERENCES locations(id)
);

CREATE TABLE locations(
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  street_address VARCHAR(40),
  postal_code VARCHAR(12),
  city VARCHAR(30) NOT NULL,
  state_province VARCHAR(25),
  country CHAR(3),
  FOREIGN KEY (country) REFERENCES countries(id)
);

CREATE TABLE countries(
  id CHAR(3) PRIMARY KEY NOT NULL,
  name VARCHAR(25) NOT NULL,
	region INT NOT NULL,
    FOREIGN KEY (region) REFERENCES regions(id)
);

CREATE TABLE regions(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(25) NOT NULL
);

CREATE TABLE accounts (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    username VARCHAR(25),
	password VARCHAR(255) NOT NULL,
	otp INT NOT NULL,
	is_expired DATETIME NOT NULL,
    is_used BIT DEFAULT 0,
	FOREIGN KEY (id) REFERENCES employees(id)
);

CREATE TABLE account_roles (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	account INT NOT NULL,
    FOREIGN KEY (account) REFERENCES accounts(id),
    role INT NOT NULL,
	FOREIGN KEY (role) REFERENCES roles(id)
);

CREATE TABLE roles(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE role_permissions(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  role INT NOT NULL,
  permission int NOT NULL
  FOREIGN KEY (permission) REFERENCES permission(id)
);

CREATE TABLE permissions(
  id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(100) NOT NULL
);
