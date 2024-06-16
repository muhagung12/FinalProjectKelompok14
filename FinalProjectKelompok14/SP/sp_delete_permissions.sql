CREATE PROCEDURE deletePermission (@id int)
AS BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY DELETE FROM tbl_permissions WHERE id = @id;
  SET @rowsAffected = @@ROWCOUNT;
  IF @rowsAffected = 0
  BEGIN RAISERROR ('Permission with ID %d not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error deleting permission: %s', 16, 1, @errorMessage);
  END CATCH;
END;