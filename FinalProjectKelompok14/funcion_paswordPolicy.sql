CREATE FUNCTION isValidPassword(@password varchar(50))
RETURNS bit AS
BEGIN
  DECLARE @isValid bit;
  SET @isValid = 0; -- Assume invalid initially

  -- Check minimum length
  IF LEN(@password) < 8
  BEGIN
    RETURN @isValid; -- Password too short
  END;

  -- Check for at least one uppercase letter
  DECLARE @hasUppercase bit;
  SET @hasUppercase = 0;
  DECLARE @char int = 1; -- Loop counter variable

  WHILE @char <= LEN(@password)  -- Use WHILE loop
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 65 AND ASCII(SUBSTRING(@password, @char, 1)) <= 90
    BEGIN
      SET @hasUppercase = 1;
      BREAK;
    END;
    SET @char = @char + 1; -- Increment counter
  END;

  IF @hasUppercase = 0
  BEGIN
    RETURN @isValid; -- No uppercase letter
  END;

  -- Check for at least one lowercase letter (similar logic)
  DECLARE @hasLowercase bit;
  SET @hasLowercase = 0;
  SET @char = 1; -- Reset counter

  WHILE @char <= LEN(@password)
  BEGIN
    IF ASCII(SUBSTRING(@password, @char, 1)) >= 97 AND ASCII(SUBSTRING(@password, @char, 1)) <= 122
    BEGIN
      SET @hasLowercase = 1;
      BREAK;
    END;
    SET @char = @char + 1;
  END;

  IF @hasLowercase = 0
  BEGIN
    RETURN @isValid; -- No lowercase letter
  END;

  -- Similar logic for digit and symbol checks using WHILE loops

  -- All criteria met
  SET @isValid = 1;

  -- Added the missing RETURN statement
  RETURN @isValid;
END;
GO