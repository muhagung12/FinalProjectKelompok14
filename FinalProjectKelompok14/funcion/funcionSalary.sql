CREATE FUNCTION
isValidSalary (@salary INT)
RETURNS BIT
AS BEGIN
	DECLARE @isValid BIT;
	DECLARE @minSalary INT;
	DECLARE @maxSalary INT;
	SET @isValid = 0;
	IF @salary BETWEEN @minSalary AND @maxSalary
	SET @isValid = 1;
	RETURN @isValid;
END;