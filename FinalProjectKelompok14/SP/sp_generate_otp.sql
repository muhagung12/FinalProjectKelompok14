CREATE PROCEDURE generateOtp (@email varchar(25))
AS BEGIN
  DECLARE @errorMessage nvarchar(500);
  DECLARE @userId int;

  BEGIN TRY SELECT @userId = id FROM tbl_employees WHERE email = @email;
  IF @userId IS NOT NULL
  BEGIN DECLARE @otp int; 
  SET @otp = FLOOR(1000000 * RAND()) + 1;

   
  UPDATE tbl_accounts
      SET otp = @otp,
          is_used = 0,
          is_expired = DATEADD(minute, 10, (SELECT is_expired FROM tbl_accounts WHERE id= @userId))
      WHERE id = @userId;
      PRINT 'Generated OTP: ' + CAST(@otp AS varchar(6));
    END
    ELSE SET @errorMessage = 'Account Not Registered!';
    RAISERROR ('Error: %s', 16, 1, @errorMessage);
    END TRY

    BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error generating OTP: %s', 16, 1, @errorMessage);
    END CATCH;
END;