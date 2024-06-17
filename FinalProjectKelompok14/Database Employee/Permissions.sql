CREATE ROLE super_admin;
CREATE ROLE admin;
CREATE ROLE manager;
CREATE ROLE employee;

-- Permissions for Super Admin
GRANT INSERT, SELECT, UPDATE, DELETE ON tbl_employees TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_jobs TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_departments TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_regions TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_locations TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_countries TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_roles TO super_admin;
GRANT INSERT, UPDATE, DELETE ON tbl_role_permissions TO super_admin;

-- Permissions for Admin
GRANT INSERT, SELECT, UPDATE, DELETE ON tbl_employees TO admin;
GRANT INSERT, UPDATE, DELETE ON tbl_jobs TO admin;
GRANT INSERT, UPDATE, DELETE ON tbl_departments TO admin;
GRANT INSERT, UPDATE, DELETE ON tbl_locations TO admin;
GRANT INSERT, UPDATE ON tbl_countries TO admin;
GRANT INSERT, UPDATE ON tbl_regions TO admin;
GRANT INSERT, UPDATE ON tbl_roles TO admin;
