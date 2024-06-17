CREATE FUNCTION func_email_format(@email varchar(50))
RETURNS bit AS
BEGIN DECLARE @isValid bit;
  SET @isValid = 0; --
  IF (CHARINDEX('@', @email) > 0 AND CHARINDEX('.', @email) >
  CHARINDEX('@', @email)) 
  BEGIN SET @isValid = 1; 
  END;
  RETURN @isValid;
END;
GO
