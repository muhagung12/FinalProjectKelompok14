CREATE PROCEDURE generateOtp (@userEmail VARCHAR(25))
AS
BEGIN
    DECLARE @userId INT;
    DECLARE @otp INT;
    DECLARE @expiryDate DATETIME;

    SELECT @userId = id 
    FROM tbl_employees 
    WHERE email = @userEmail;

    IF @userId IS NOT NULL
    BEGIN
        SET @otp = FLOOR(1000000 * RAND()) + 1;

        SET @expiryDate = DATEADD(MINUTE, 10, (SELECT is_expired FROM tbl_accounts WHERE id = @userId));

        UPDATE tbl_accounts
        SET otp = @otp,
            is_used = 0,
            is_expired = @expiryDate
        WHERE id = @userId;

        PRINT 'Generated OTP: ' + CAST(@otp AS VARCHAR(6));
    END
    ELSE
    BEGIN
        PRINT 'Error: Account Not Registered!';
    END;
END;
