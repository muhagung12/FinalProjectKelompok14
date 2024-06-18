CREATE PROCEDURE updateRole (
  @role_id int,
  @new_name varchar(50)
)
AS
BEGIN
  DECLARE @rowsAffected int;
  DECLARE @errorMsg nvarchar(500);

  -- Update role name
  UPDATE tbl_roles SET name = @new_name WHERE id = @role_id;

  -- Get the number of rows affected by the update
  SET @rowsAffected = @@ROWCOUNT;

  -- Check if the role with given ID exists
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Role with ID ' + CAST(@role_id AS VARCHAR(10)) + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Role details updated successfully';
END;
