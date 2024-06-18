CREATE FUNCTION func_gender (@gender VARCHAR(10))
RETURNS BIT
AS
BEGIN
    RETURN CASE 
        WHEN @gender IN ('Male', 'Female') THEN 1 
        ELSE 0 
    END
END;
