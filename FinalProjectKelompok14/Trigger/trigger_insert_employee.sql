CREATE TRIGGER tr_insert_employee ON tbl_employees AFTER INSERT AS
BEGIN
  INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
  SELECT inserted.id,
    GETDATE(),
    DATEADD(minute, 10, GETDATE()),  -- expired within 10 minutes
    'Active',
    inserted.job,
    inserted.department FROM inserted;
END;
