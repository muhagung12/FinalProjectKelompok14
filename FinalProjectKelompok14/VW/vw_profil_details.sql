CREATE VIEW profile_details AS
SELECT 
  e.id AS employee_id, e.first_name, e.last_name, e.gender,
  e.email, e.phone, e.hire_date, e.salary,
  m.first_name AS manager_first_name,  -- Assuming 'first_name' exists in tbl_employees
  m.last_name AS manager_last_name,    -- Assuming 'last_name' exists in tbl_employees
  j.title AS job_title,  d.name AS department_name,l.city,
  l.state_province, c.name AS country_name FROM tbl_employees e
LEFT JOIN tbl_employees m ON e.manager = m.id  -- Include manager details (can be NULL if no manager)
LEFT JOIN tbl_jobs j ON e.job = j.id
LEFT JOIN tbl_departments d ON e.department = d.id
LEFT JOIN tbl_locations l ON d.location = l.id
LEFT JOIN tbl_countries c ON l.country = c.id;