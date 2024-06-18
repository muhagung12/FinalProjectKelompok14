CREATE PROCEDURE login (@username VARCHAR(25), @password VARCHAR(255))
AS
BEGIN
    DECLARE @employeeEmail VARCHAR(25);
    DECLARE @accountUsername VARCHAR(25);

    SELECT @employeeEmail = email 
    FROM tbl_employees 
    WHERE email = @username;

    SELECT @accountUsername = username 
    FROM tbl_accounts 
    WHERE username = @username;

    IF @username = @employeeEmail AND @username = @accountUsername
    BEGIN
        PRINT 'Login Success!';
    END
    ELSE
    BEGIN
        PRINT 'Account Not Registered!';
    END;
END;
