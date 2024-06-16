CREATE VIEW attendance_details
AS SELECT a.id, CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name', e.email, a.time FROM tbl_attendance a
	INNER JOIN tbl_employees e ON a.employee = e.id;
GO