CREATE FUNCTION func_phone_number (@phone VARCHAR(25))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @phone LIKE '[0-9]%' AND LEN(@phone) >= 10 THEN 1
        ELSE 0
    END
END;
