--CREATE FUNCTIONS
CREATE FUNCTION func_email_format (@email VARCHAR(255))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @email LIKE '%@%.%' THEN 1 
        ELSE 0 
    END
END;

CREATE FUNCTION func_password_policy (@password VARCHAR(255))
RETURNS BIT
AS
BEGIN
    -- password minimal 8 karakter dan memuat angka
    RETURN CASE 
        WHEN @password LIKE '%[A-Za-z]%' AND @password LIKE '%[0-9]%' AND LEN(@password) >= 8 THEN 1
        ELSE 0
    END
END;

CREATE FUNCTION func_gender (@gender VARCHAR(10))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @gender IN ('Male', 'Female') THEN 1 
        ELSE 0 
    END
END;

CREATE FUNCTION func_phone_number (@phone VARCHAR(25))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @phone LIKE '[0-9]%' AND LEN(@phone) >= 10 THEN 1
        ELSE 0
    END
END;

CREATE FUNCTION func_password_match (@password VARCHAR(255), @confirmpassword VARCHAR(255))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @password = @confirmpassword THEN 1 
        ELSE 0 
    END
END;

CREATE FUNCTION func_salary (@jobid VARCHAR(10), @salary INT)
RETURNS BIT
AS
BEGIN
    DECLARE @minsalary INT, @maxsalary INT
    SELECT @minsalary = min_salary, @maxsalary = max_salary FROM tbl_jobs WHERE id = @jobid

    RETURN CASE 
        WHEN @salary BETWEEN @minsalary AND @maxsalary THEN 1 
        ELSE 0 
    END
END;

