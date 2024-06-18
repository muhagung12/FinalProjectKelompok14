CREATE PROCEDURE deleteEmployee (
  @emp_id int
)
AS
BEGIN
  DECLARE @rowsAffected int;
  DECLARE @errorMsg nvarchar(500);

  -- Delete employee
  DELETE FROM tbl_employees WHERE id = @emp_id;

  -- Get the number of rows affected by the delete operation
  SET @rowsAffected = @@ROWCOUNT;

  -- Check if an employee with the given ID was deleted
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Employee with ID ' + CAST(@emp_id AS VARCHAR(10)) + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Employee deleted successfully';
END;
