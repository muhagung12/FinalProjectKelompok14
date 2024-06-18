CREATE VIEW view_account_roles AS
SELECT ar.id, a.username AS account_username, r.name AS role_name 
FROM tbl_account_roles ar, tbl_accounts a, tbl_roles r
WHERE ar.account = a.id AND ar.role = r.id;
