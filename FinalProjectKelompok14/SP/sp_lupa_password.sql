CREATE PROCEDURE forgotPassword (
    @email VARCHAR(25),
    @newPassword VARCHAR(255),
    @confirmPassword VARCHAR(255),
    @otp INT
)
AS
BEGIN
    DECLARE @userId INT;
    DECLARE @isValidPassword BIT;
    DECLARE @isOtpValid BIT, @isOtpUsed BIT, @isOtpExpired BIT;

    SELECT @userId = id 
    FROM tbl_employees 
    WHERE email = @email;

    IF @userId IS NULL
    BEGIN
        PRINT 'Error: Email not found';
    END
    ELSE
    BEGIN
        SET @isValidPassword = dbo.isValidPassword(@newPassword);

        IF @isValidPassword = 0
        BEGIN
            PRINT 'Error: Invalid new password requirements';
        END
        ELSE
        BEGIN
            SELECT 
                @isOtpValid = CASE WHEN otp = @otp THEN 1 ELSE 0 END,
                @isOtpUsed = is_used,
                @isOtpExpired = CASE WHEN GETDATE() > is_expired THEN 1 ELSE 0 END
            FROM tbl_accounts 
            WHERE id = @userId;

            IF @isOtpValid = 0
            BEGIN
                PRINT 'Error: Invalid OTP';
            END
            ELSE IF @isOtpUsed = 1
            BEGIN
                PRINT 'Error: OTP already used';
            END
            ELSE IF @isOtpExpired = 1
            BEGIN
                PRINT 'Error: OTP expired';
            END
            ELSE
            BEGIN
                UPDATE tbl_accounts 
                SET password = @newPassword, is_used = 1
                WHERE id = @userId;

                PRINT 'Password successfully reset';
            END
        END
    END
END;
