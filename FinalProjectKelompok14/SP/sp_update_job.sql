CREATE PROCEDURE updateJob (
  @job_id varchar(10),
  @job_title varchar(35),
  @job_min_salary int,
  @job_max_salary int
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);
  DECLARE @rowsAffected int;

  -- Check if max salary is less than min salary
  IF @job_max_salary < @job_min_salary
  BEGIN
    SET @errorMsg = 'Max salary cannot be less than min salary';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Update job details
  UPDATE tbl_jobs
  SET title = @job_title,
      min_salary = @job_min_salary,
      max_salary = @job_max_salary
  WHERE id = @job_id;

  -- Get the number of rows affected by the update
  SET @rowsAffected = @@ROWCOUNT;

  -- Check if the job with given ID exists
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Job with ID ' + @job_id + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Job details updated successfully';
END;
