CREATE VIEW department_details AS
SELECT d.id, d.name
FROM tbl_departments d, tbl_locations l
WHERE d.location = l.id;
