CREATE PROCEDURE deleteJob (
  @job_id varchar(10)
)
AS
BEGIN
  DECLARE @rowsAffected int;
  DECLARE @errorMsg nvarchar(500);

  -- Delete job
  DELETE FROM tbl_jobs WHERE id = @job_id;

  -- Get the number of rows affected by the delete operation
  SET @rowsAffected = @@ROWCOUNT;

  -- Check if a job with the given ID was deleted
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Job with ID ' + @job_id + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Job deleted successfully';
END;
