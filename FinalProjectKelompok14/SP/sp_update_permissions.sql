CREATE PROCEDURE updatePermission (@id int, @name varchar(100)
)
AS BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY
  UPDATE tbl_permissions 
  SET name = @name
  WHERE id = @id;
  SET @rowsAffected = @@ROWCOUNT;
  IF @rowsAffected = 0
  BEGIN RAISERROR ('Permission with ID %d not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error updating permission: %s', 16, 1, @errorMessage);
  END CATCH;
END;