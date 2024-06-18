CREATE PROCEDURE forgotPassword (
  @user_email varchar(25),
  @newPassword varchar(255),
  @confirmPassword varchar(255),
  @otp int
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);
  DECLARE @userId int;

  -- Fetch the user ID
  SELECT @userId = id FROM tbl_employees WHERE email = @user_email;

  IF @userId IS NULL
  BEGIN
    SET @errorMsg = 'Email not found';
    PRINT @errorMsg;
  END
  ELSE
  BEGIN
    DECLARE @func_password_policy bit;
    SET @func_password_policy = dbo.func_password_policy(@newPassword);

    IF @func_password_policy = 0
    BEGIN
      SET @errorMsg = 'Invalid new password requirements';
      PRINT @errorMsg;
    END
    ELSE
    BEGIN
      DECLARE @isOtpValid bit, @isOtpUsed bit, @isOtpExpired bit;

      SELECT @isOtpValid = CASE WHEN otp = @otp THEN 1 ELSE 0 END,
             @isOtpUsed = is_used,
             @isOtpExpired = CASE WHEN GETDATE() > is_expired THEN 1 ELSE 0 END
      FROM tbl_accounts WHERE id = @userId;

      IF @isOtpValid = 0
      BEGIN
        SET @errorMsg = 'Invalid OTP';
        PRINT @errorMsg;
      END
      ELSE IF @isOtpUsed = 1
      BEGIN
        SET @errorMsg = 'OTP already used';
        PRINT @errorMsg;
      END
      ELSE IF @isOtpExpired = 1
      BEGIN
        SET @errorMsg = 'OTP expired';
        PRINT @errorMsg;
      END
      ELSE
      BEGIN
        UPDATE tbl_accounts SET password = @newPassword, is_used = 1 WHERE id = @userId;
        PRINT 'Password reset successful';
      END
    END
  END
END;
