CREATE PROCEDURE deletePermission (
  @permission_id INT
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Attempt to delete the permission
  DELETE FROM tbl_permissions WHERE id = @permission_id;
  SET @rowsAffected = @@ROWCOUNT;

  -- If no rows were affected, the permission was not found
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Permission with ID ' + CAST(@permission_id AS VARCHAR(10)) + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Permission deleted successfully';
END;
