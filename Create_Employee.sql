CREATE DATABASE employee;
GO

USE employee;
GO

CREATE TABLE employee (
  id_employee INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
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