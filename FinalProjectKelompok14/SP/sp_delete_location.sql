CREATE PROCEDURE deleteLocation ( @id INT)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMessage NVARCHAR(500);

  BEGIN TRY SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @id;
  IF @rowsAffected = 0
  BEGIN SET @errorMessage = 'Location with ID ' + CAST(@id AS VARCHAR(10)) + ' does not exist.';
  RAISERROR (@errorMessage, 16, 1);  
    END;
  DELETE FROM tbl_locations WHERE id = @id;
  END TRY
  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error deleting location: %s', 16, 1, @errorMessage);
  END CATCH;
END;