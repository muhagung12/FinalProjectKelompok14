CREATE PROCEDURE updateEmployee (
  @emp_id int,
  @emp_firstName varchar(25),
  @emp_lastName varchar(25),
  @emp_gender varchar(10),
  @emp_email varchar(25),
  @emp_phone varchar(20),
  @emp_hireDate date,
  @emp_salary int,
  @emp_managerId int,
  @emp_jobId varchar(10),
  @emp_departmentId int
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);

  -- Validate gender
  IF dbo.func_gender(@emp_gender) = 0
  BEGIN
    SET @errorMsg = 'Invalid gender.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Validate email
  IF dbo.func_email_format(@emp_email) = 0
  BEGIN
    SET @errorMsg = 'Invalid email address.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Validate phone number format
  IF dbo.func_phone_number(@emp_phone) = 0
  BEGIN
    SET @errorMsg = 'Invalid phone number format.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Validate salary
  IF dbo.func_salary(@emp_jobId, @emp_salary) = 0
  BEGIN
    SET @errorMsg = 'Salary is not permitted, please check the salary bound.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Update employee details
  UPDATE tbl_employee
  SET first_name = @emp_firstName,
      last_name = @emp_lastName,
      gender = @emp_gender,
      email = @emp_email,
      phone = @emp_phone,
      hire_date = @emp_hireDate,
      salary = @emp_salary,
      manager = @emp_managerId,
      job = @emp_jobId,
      department = @emp_departmentId
  WHERE id = @emp_id;

  PRINT 'Employee details updated successfully';
END;
