CREATE FUNCTION isValidEmail(@email varchar(255))
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 0; --
  
  IF (CHARINDEX('@', @email) > 0 AND CHARINDEX('.', @email) > CHARINDEX('@', @email)) 
  BEGIN
    SET @isValid = 1; 
  END;

  RETURN @isValid;
END;
GO