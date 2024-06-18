CREATE PROCEDURE deleteRole (
  @role_id INT
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Attempt to delete the role
  DELETE FROM tbl_roles WHERE id = @role_id;
  SET @rowsAffected = @@ROWCOUNT;

  -- If no rows were affected, the role was not found
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Role with ID ' + CAST(@role_id AS VARCHAR(10)) + ' not found.';
    PRINT @errorMsg;
    RETURN;
  END;

  PRINT 'Role deleted successfully';
END;
