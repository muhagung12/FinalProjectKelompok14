CREATE FUNCTION isPasswordMatch (@password VARCHAR(255), @newPassword VARCHAR(255))
RETURNS BIT
AS
BEGIN
	DECLARE @isValid BIT;
	SET @isValid = 0;
	
	IF (@password = @newPassword)
	SET @isValid = 1;
	
	RETURN @isValid;
END;