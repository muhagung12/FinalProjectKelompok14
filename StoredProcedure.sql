-- Procedures
-- usp_login
CREATE PROCEDURE usp_login 
@user VARCHAR(25), 
@password VARCHAR(255)
AS
BEGIN
IF EXISTS (SELECT * FROM tbl_accounts WHERE username = @user AND password = @password)
BEGIN 
    PRINT 'Login Success'
END
ELSE 
BEGIN
    PRINT 'Account not found, please check Username or Password'
END
END;

EXEC usp_login @user = 'abcde', @password = 'FiN4LpR0jecT-';






CREATE PROCEDURE usp_register 
@firstname VARCHAR(25), 
@lastname VARCHAR(25), 
@gender VARCHAR(10), 
@email VARCHAR(25),
@phone VARCHAR(25), 
@hiredate DATE, 
@salary INT, 
@managerid INT, 
@jobid VARCHAR(10), 
@departmentid INT,
@password VARCHAR(255),
@confirmpassword VARCHAR(255)
AS
BEGIN
	IF dbo.func_email_format(@email) = 0
    BEGIN
        PRINT 'Invalid Email Format'
    END
    ELSE IF dbo.func_password_policy(@password) = 0
    BEGIN
        PRINT 'Password does not meet policy requirements'
    END
    ELSE IF dbo.func_gender(@gender) = 0
    BEGIN
        PRINT 'Invalid Gender'
    END
    ELSE IF dbo.func_phone_number(@phone) = 0
    BEGIN
        PRINT 'Invalid Phone Number'
    END
    ELSE IF dbo.func_password_match(@password, @confirmpassword) = 0
    BEGIN
        PRINT 'Passwords do not match'
    END
    ELSE IF dbo.func_salary(@jobid, @salary) = 0
    BEGIN
        PRINT 'Salary does not meet the job requirements'
    END
    ELSE
    BEGIN
        INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
        VALUES (@firstname, @lastname, @gender, @email, @phone, @hiredate, @salary, @managerid, @jobid, @departmentid)

        -- Insert into tbl_accounts
        INSERT INTO tbl_accounts (username, password) VALUES (@email, @password)

        -- Get the new account ID
        DECLARE @accountid INT
        SET @accountid = SCOPE_IDENTITY()

        -- Assign employee role
        INSERT INTO tbl_account_roles (account, role) VALUES (@accountid, 'Employee')

        PRINT 'Employee Registered Successfully'
    END
END
GO

