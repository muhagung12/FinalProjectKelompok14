CREATE PROCEDURE updateDepartment (
  @dept_id int,
  @dept_name varchar(30),
  @dept_location int
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);
  DECLARE @rowsAffected int;

  -- Check if department with given ID exists
  SELECT @rowsAffected = COUNT(*) FROM tbl_departments WHERE id = @dept_id;
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Department with ID ' + CAST(@dept_id AS VARCHAR(10)) + ' does not exist, please recheck your input.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Check if location with given ID exists
  IF @dept_location IS NOT NULL
  BEGIN
    SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @dept_location;
    IF @rowsAffected = 0
    BEGIN
      SET @errorMsg = 'Location with ID ' + CAST(@dept_location AS VARCHAR(10)) + ' does not exist, please recheck your input';
      PRINT @errorMsg;
      RETURN;
    END;
  END;

  -- Update department details
  UPDATE tbl_departments SET name = @dept_name, location = @dept_location WHERE id = @dept_id;

  PRINT 'Department details updated successfully';
END;
