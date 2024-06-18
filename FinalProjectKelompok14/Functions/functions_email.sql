CREATE FUNCTION func_email_format (@email VARCHAR(255))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @email LIKE '%@%.%' THEN 1 
        ELSE 0 
    END
END;
