CREATE ROLE super_admin;
CREATE ROLE admin;
CREATE ROLE manager;
CREATE ROLE employee;

-- Permissions for Super Admin
GRANT INSERT, SELECT, UPDATE, DELETE ON tbl_employees TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_jobs TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_departments TO super_admin;
