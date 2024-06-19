CREATE PROCEDURE 
updateProfile (@id int, @firstName varchar(25), @lastName varchar(25),
               @gender varchar(10), @email varchar(25), @phone varchar(20), 
               @hireDate date, @salary int, @managerId int, 
               @jobId varchar(10), @departmentId int)
AS
BEGIN
  DECLARE @errorMessage nvarchar(500);

  -- Validate gender
  IF dbo.func_gender(@gender) = 0
  BEGIN 
    PRINT 'Invalid gender provided.';
    RETURN;
  END;

  -- Validate email
  IF dbo.func_email_format(@email) = 0
  BEGIN 
    PRINT 'Invalid email address.';
    RETURN;
  END;

  -- Validate phone number
  IF dbo.func_phone_number(@phone) = 0
  BEGIN 
    PRINT 'Invalid phone number format.';
    RETURN;
  END;

  -- Validate salary
  IF dbo.func_salary(@jobId, @salary) = 0 
  BEGIN 
    PRINT 'Salary is outside the allowed range.';
    RETURN;
  END;

  -- Update employee profile
  UPDATE tbl_employees
  SET firstname = @firstName,
      lastname = @lastName,
      gender = @gender,
      email = @email,
      phone = @phone,
      hire_date = @hireDate,
      salary = @salary,
      manager = @managerId,
      job = @jobId,
      department = @departmentId
  WHERE id = @id;

  PRINT 'Employee profile updated successfully';
END;
