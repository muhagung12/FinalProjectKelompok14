CREATE PROCEDURE AddJob (
  @id varchar(10),
  @title varchar(35),
  @min_salary int,
  @max_salary int
)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);

  BEGIN TRY
    IF @max_salary < @min_salary
    BEGIN SET @errorMessage = 'Max salary cannot be less than min salary';
    RAISERROR ('Error: %s', 16, 1, @errorMessage);
    END

    INSERT INTO tbl_jobs (id, title, min_salary, max_salary)
    VALUES (@id, @title, @min_salary, @max_salary);
  END TRY

  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error adding job: %s', 16, 1, @errorMessage);
  END CATCH;
END;


EXEC sp_helptext 'AddJob';
EXEC AddJob 
    @id = M001', 
    @title = 'Software Developer', 
    @min_salary = 50000, 
    @max_salary = 100000;
SELECT * FROM tbl_jobs WHERE id = 'M001';