CREATE FUNCTION 
IsNumericPhoneNumber(@phoneNumber varchar(20))
RETURNS bit AS
BEGIN DECLARE @isValid bit;
SET @isValid = 1; 
  IF LEN(@phoneNumber) = 0
  BEGIN SET @isValid = 0; RETURN @isValid;
  END;
  IF PATINDEX('%[^0-9]%', @phoneNumber) > 0
  BEGIN  SET @isValid = 0; 
  END;
  RETURN @isValid;
END;
GO