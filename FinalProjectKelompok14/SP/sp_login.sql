CREATE PROCEDURE login (@user_email varchar(25), @user_password varchar(255))
AS BEGIN 
  DECLARE @errorMsg nvarchar(500);

  IF @user_email = (SELECT email FROM tbl_employees WHERE email = @user_email)
     AND @user_email = (SELECT username FROM tbl_accounts WHERE username = @user_email)
  BEGIN
    PRINT 'Login Success!';
  END
  ELSE 
  BEGIN
    PRINT 'Account Not Registered!';
  END

END;
