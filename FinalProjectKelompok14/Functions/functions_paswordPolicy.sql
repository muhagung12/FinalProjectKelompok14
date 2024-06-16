CREATE FUNCTION 
isValidPassword(@password varchar(50))
RETURNS bit AS
BEGIN DECLARE @isValid bit;
  SET @isValid = 0; 

  IF LEN(@password) < 8
  BEGIN RETURN @isValid; 
  END;

  DECLARE @hasUppercase bit;
  SET @hasUppercase = 0; DECLARE @char int = 1; 
  WHILE @char <= LEN(@password)  
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 65 AND ASCII(SUBSTRING(@password, @char, 1)) <= 90
    BEGIN SET @hasUppercase = 1; BREAK;
    END; SET @char = @char + 1; 
  END;
IF @hasUppercase = 0
  BEGIN RETURN @isValid; 
  END;

  DECLARE @hasLowercase bit;
  SET @hasLowercase = 0;
  SET @char = 1; 

  WHILE @char <= LEN(@password)
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 97 AND ASCII(SUBSTRING(@password, @char, 1)) <= 122
    BEGIN SET @hasLowercase = 1;
      BREAK;
    END;
    SET @char = @char + 1;
  END;

  IF @hasLowercase = 0
  BEGIN RETURN @isValid;
  END;

  SET @isValid = 1;
  RETURN @isValid;
END;
GO