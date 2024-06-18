CREATE PROCEDURE deleteDepartment (
  @dept_id int
)
AS
BEGIN
  DECLARE @rowsAffected int;
  DECLARE @errorMsg nvarchar(500);

  -- Delete department
  DELETE FROM tbl_departments WHERE id = @dept_id;

  -- Get the number of rows affected by the delete operation
  SET @rowsAffected = @@ROWCOUNT;

  -- Check if a department with the given ID was deleted
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Department with ID ' + CAST(@dept_id AS VARCHAR(10)) + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Department deleted successfully';
END;
