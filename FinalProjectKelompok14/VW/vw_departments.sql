CREATE VIEW department_details AS
SELECT d.id, d.name FROM tbl_departments d
INNER JOIN tbl_locations l ON d.location = l.id;