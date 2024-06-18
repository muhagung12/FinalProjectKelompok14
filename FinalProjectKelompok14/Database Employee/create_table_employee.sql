CREATE TABLE tbl_employees (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  firstname VARCHAR(25) NOT NULL,
  lastname VARCHAR(25),
  gender VARCHAR(10) NOT NULL,
  email VARCHAR(25) NOT NULL UNIQUE,
  phone VARCHAR(20),
  hire_date DATE NOT NULL,
  salary INT,
  manager INT,
  job VARCHAR(10),
  department INT
);

CREATE TABLE tbl_jobs (
  id VARCHAR(10) PRIMARY KEY NOT NULL,
  title VARCHAR(35) NOT NULL,
  min_salary INT DEFAULT 0,
  max_salary INT DEFAULT 0
);

CREATE TABLE tbl_departments (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(30) NOT NULL,
  location INT
);

CREATE TABLE tbl_locations (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  street_address VARCHAR(40),
  postal_code VARCHAR(12),
  city VARCHAR(30) NOT NULL,
  state_province VARCHAR(25),
  country CHAR(3)
);

CREATE TABLE tbl_countries (
  id CHAR(3) PRIMARY KEY NOT NULL,
  name VARCHAR(25) NOT NULL,
  region INT NOT NULL
);

CREATE TABLE tbl_regions (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(25) NOT NULL
);

CREATE TABLE tbl_accounts (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  username VARCHAR(25),
  password VARCHAR(255) NOT NULL,
  otp INT NOT NULL,
  is_expired DATETIME NOT NULL,
  is_used BIT DEFAULT 0
);

CREATE TABLE tbl_account_roles (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  account INT NOT NULL,
  role INT NOT NULL
);

CREATE TABLE tbl_roles (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_role_permissions (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  role INT NOT NULL,
  permission INT NOT NULL
);

CREATE TABLE tbl_permissions (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  name VARCHAR(100) NOT NULL
);

ALTER TABLE tbl_employees
ADD FOREIGN KEY (manager) REFERENCES tbl_employees(id);

ALTER TABLE tbl_employees
ADD FOREIGN KEY (job) REFERENCES tbl_jobs(id);

ALTER TABLE tbl_employees
ADD FOREIGN KEY (department) REFERENCES tbl_departments(id);

ALTER TABLE tbl_departments
ADD FOREIGN KEY (location) REFERENCES tbl_locations(id);

ALTER TABLE tbl_countries
ADD FOREIGN KEY (region) REFERENCES tbl_regions(id);

ALTER TABLE tbl_accounts
ADD FOREIGN KEY (id) REFERENCES tbl_employees(id);

ALTER TABLE tbl_account_roles
ADD FOREIGN KEY (account) REFERENCES tbl_accounts(id);

ALTER TABLE tbl_account_roles
ADD FOREIGN KEY (role) REFERENCES tbl_roles(id);

ALTER TABLE tbl_role_permissions
ADD FOREIGN KEY (role) REFERENCES tbl_roles(id);

ALTER TABLE tbl_role_permissions
ADD FOREIGN KEY (permission) REFERENCES tbl_permissions(id);
