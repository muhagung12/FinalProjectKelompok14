CREATE VIEW employee_details AS
SELECT e.id, e.firstname, e.lastname, e.gender, e.email,
       e.phone, e.hire_date, e.salary,
       m.firstname AS manager_first_name,
       m.lastname AS manager_last_name,
       j.title AS job_title,  
       d.name AS department_name FROM tbl_employees e
LEFT JOIN tbl_employees m ON e.manager = m.id
LEFT JOIN tbl_jobs j ON e.job = j.id  
LEFT JOIN tbl_departments d ON e.department = d.id;
