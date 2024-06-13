CREATE DATABASE employee;
GO

USE employee;
GO

CREATE TABLE employee (
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