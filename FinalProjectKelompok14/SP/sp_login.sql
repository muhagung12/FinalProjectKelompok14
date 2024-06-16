CREATE PROCEDURE login (@username varchar(25), @password varchar(255))
AS BEGIN DECLARE @errorMessage nvarchar(500);

  BEGIN TRY
  IF @username = (SELECT email FROM tbl_employees where email = @username)
	AND @username = (SELECT username FROM tbl_accounts where username = @username)
	PRINT 'Login Success!'
	ELSE PRINT 'Account Not Registered!'   
  END TRY BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error login: %s', 16, 1, @errorMessage);
  END CATCH;

END;