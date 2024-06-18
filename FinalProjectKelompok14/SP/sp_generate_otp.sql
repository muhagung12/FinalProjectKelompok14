CREATE PROCEDURE generateOtp (@user_email varchar(25))
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);
  DECLARE @userId int;

  -- Fetch the user ID
  SELECT @userId = id FROM tbl_employees WHERE email = @user_email;

  IF @userId IS NOT NULL
  BEGIN
    DECLARE @otp int; 
    SET @otp = FLOOR(1000000 * RAND()) + 1;

    -- Update OTP and expiration time in tbl_accounts
    UPDATE tbl_accounts
    SET otp = @otp,
        is_used = 0,
        is_expired = DATEADD(minute, 10, GETDATE())
    WHERE id = @userId;

    PRINT 'Generated OTP: ' + CAST(@otp AS varchar(6));
  END
  ELSE
  BEGIN
    SET @errorMsg = 'Account Not Registered!';
    PRINT @errorMsg;
  END
END;
