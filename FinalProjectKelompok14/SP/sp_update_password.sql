CREATE PROCEDURE updatePassword (
  @userEmail VARCHAR(25), 
  @password VARCHAR(255), 
  @newPassword VARCHAR(255), 
  @confirmPassword VARCHAR(255)
)
AS
BEGIN
  DECLARE @errorMsg NVARCHAR(500);
  DECLARE @userId INT;

  -- Retrieve the user ID based on the provided email
  SELECT @userId = id FROM tbl_accounts WHERE username = @userEmail;

  -- Check if the user ID is found
  IF @userId IS NULL
  BEGIN 
    PRINT 'Username not found';
    RETURN;
  END
  ELSE
  BEGIN
    DECLARE @isValidPassword BIT;
      
    -- Validate the new password
    IF dbo.func_policy_password(@newPassword) = 0
    BEGIN 
      PRINT 'Invalid new password requirements, please recheck';
      RETURN;
    END
    ELSE IF dbo.func_policy_match(@newPassword, @confirmPassword) = 0
    BEGIN 
      PRINT 'New password and confirm password do not match';
      RETURN;
    END
    ELSE
    BEGIN
      -- Update the password
      UPDATE tbl_accounts
      SET password = @newPassword
      WHERE id = @userId;
      PRINT 'Password updated successfully';
    END
  END
END;
