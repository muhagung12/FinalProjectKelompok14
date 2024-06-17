CREATE FUNCTION IsValidSalary (@jobid VARCHAR(10), @salary INT)
RETURNS BIT
AS
BEGIN
    DECLARE @minsalary INT, @maxsalary INT
    SELECT @minsalary = min_salary, @maxsalary = max_salary FROM tbl_jobs WHERE id = @jobid

    RETURN CASE 
        WHEN @salary BETWEEN @minsalary AND @maxsalary THEN 1 
        ELSE 0 
    END
END;
