---func password
CREATE FUNCTION func_password_policy(@password VARCHAR(255))
RETURNS BIT
AS
BEGIN
    -- password minimal 8 karakter dan memuat angka dan memuat huruf kapital
    RETURN CASE 
        WHEN @password LIKE '%[A-Za-z]%' AND @password LIKE '%[0-9]%' AND LEN(@password) >= 8 THEN 1
        ELSE 0
    END
END;
