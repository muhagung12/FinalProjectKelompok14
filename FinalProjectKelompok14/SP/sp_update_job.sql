CREATE PROCEDURE 
updateJob (@id varchar(10),  @title varchar(35),  @min_salary int, @max_salary int
)
AS BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @rowsAffected int;

  BEGIN TRY
    IF @max_salary < @min_salary
    BEGIN SET @errorMessage = 'Max salary cannot be less than min salary';
      RAISERROR ('Error: %s', 16, 1, @errorMessage);
    END

    UPDATE tbl_jobs
    SET title = @title,
        min_salary = @min_salary,
        max_salary = @max_salary
    WHERE id = @id;
    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
    BEGIN RAISERROR ('Job with ID %s not found.', 10, 1, @id);
    END
  END TRY

  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
   RAISERROR ('Error updating job: %s', 16, 1, @errorMessage);
  END CATCH;
END;