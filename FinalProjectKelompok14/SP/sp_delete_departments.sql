CREATE PROCEDURE deleteDepartment (@id int)
AS BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY DELETE FROM tbl_departments WHERE id = @id;
  SET @rowsAffected = @@ROWCOUNT;
  IF @rowsAffected = 0
  BEGIN RAISERROR ('Department with ID %d not found.', 10, 1, @id);
    END;
  END TRY
  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE(); RAISERROR ('Error deleting department: %s', 16, 1, @errorMessage);
  END CATCH;
END;