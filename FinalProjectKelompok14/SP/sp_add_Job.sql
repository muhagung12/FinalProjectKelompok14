CREATE PROCEDURE AddJob (
  @job_id varchar(10),
  @job_title varchar(35),
  @job_min_salary int,
  @job_max_salary int
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);

  IF @job_max_salary < @job_min_salary
  BEGIN
    SET @errorMsg = 'Max salary cannot be less than min salary';
    PRINT @errorMsg;
    RETURN;
  END;

  INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
  VALUES (@job_id, @job_title, @job_min_salary, @job_max_salary);

  PRINT 'Job added successfully';
END;
