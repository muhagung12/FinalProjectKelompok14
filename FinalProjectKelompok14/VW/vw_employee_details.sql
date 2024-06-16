CREATE VIEW employee_details AS
SELECT e.id, e.first_name, e.last_name, e.gender, e.email,
       e.phone, e.hire_date, e.salary,
       m.first_name AS manager_first_name,
       m.last_name AS manager_last_name,
       j.title AS job_title,  
       d.name AS department_name FROM tbl_employees e
LEFT JOIN tbl_employees m ON e.manager = m.id
LEFT JOIN tbl_jobs j ON e.job = j.id  
LEFT JOIN tbl_departments d ON e.department = d.id;
