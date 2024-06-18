CREATE PROCEDURE updatePermission (
  @perm_id int,
  @new_name varchar(100)
)
AS
BEGIN
  DECLARE @rowsAffected int;
  DECLARE @errorMsg nvarchar(500);

  -- Update permission name
  UPDATE tbl_permissions SET name = @new_name WHERE id = @perm_id;

  -- Get the number of rows affected by the update
  SET @rowsAffected = @@ROWCOUNT;

  -- Check if the permission with given ID exists
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Permission with ID ' + CAST(@perm_id AS VARCHAR(10)) + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Permission details updated successfully';
END;
