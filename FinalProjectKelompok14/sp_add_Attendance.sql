CREATE PROCEDURE
AddAttendance (@id int, @employee int, @email varchar(25), @time datetime)
AS
BEGIN DECLARE @errorMessage nvarchar(500);
  BEGIN TRY INSERT INTO tbl_attendance (id, employee, email, time) VALUES (@id, @employee, @email, @time);
  END TRY
  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error adding attendance: %s', 16, 1, @errorMessage);
  END CATCH;
END;