CREATE PROCEDURE deleteJob (@id varchar(10))
AS BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;
 BEGIN TRY DELETE FROM tbl_jobs WHERE id = @id;
 SET @rowsAffected = @@ROWCOUNT;
 IF @rowsAffected = 0
 BEGIN
 RAISERROR ('Job with ID %s not found.', 10, 1, @id);
      END;
  END TRY
  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE(); RAISERROR ('Error deleting job: %s', 16, 1, @errorMessage);
  END CATCH;
END;