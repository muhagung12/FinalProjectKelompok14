CREATE FUNCTION func_match_password (@password VARCHAR(255), @confirmpassword VARCHAR(255))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @password = @confirmpassword THEN 1 
        ELSE 0 
    END
END;
