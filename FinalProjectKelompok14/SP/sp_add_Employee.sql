CREATE PROCEDURE addEmployee (
  @emp_firstName varchar(25),
  @emp_lastName varchar(25),
  @emp_gender varchar(10),
  @emp_email varchar(25),
  @emp_phone varchar(20),
  @emp_hireDate date,
  @emp_salary int,
  @emp_managerId int,
  @emp_jobId varchar(10),
  @emp_departmentId int,
  @emp_password varchar(50),
  @emp_confirmPassword varchar(50)
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);
  DECLARE @employeeId int;

  IF dbo.func_match_password(@emp_password, @emp_confirmPassword) = 0
  BEGIN
    SET @errorMsg = 'Passwords do not match.';
    PRINT @errorMsg;
    RETURN;
  END;

  IF dbo.func_gender(@emp_gender) = 0
  BEGIN
    SET @errorMsg = 'Invalid gender provided.';
    PRINT @errorMsg;
    RETURN;
  END;

  IF dbo.func_email_format(@emp_email) = 0
  BEGIN
    SET @errorMsg = 'Invalid email address.';
    PRINT @errorMsg;
    RETURN;
  END;

  IF dbo.IsNumericPhoneNumber(@emp_phone) = 0
  BEGIN
    SET @errorMsg = 'Invalid phone number format.';
    PRINT @errorMsg;
    RETURN;
  END;

  IF dbo.func_salary(@emp_salary) = 0  
  BEGIN
    SET @errorMsg = 'Salary is outside the allowed range.';
    PRINT @errorMsg;
    RETURN;
  END;

  INSERT INTO tbl_employees (
    first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department
  )
  VALUES (
    @emp_firstName, @emp_lastName, @emp_gender, @emp_email, @emp_phone, @emp_hireDate, @emp_salary, @emp_managerId, @emp_jobId, @emp_departmentId
  );


  SET @employeeId = SCOPE_IDENTITY();

  INSERT INTO tbl_accounts (
    id, username, password
  )
  VALUES (
    @employeeId, @emp_email, @emp_password
  );

  INSERT INTO tbl_account_roles (
    account, role
  )
  VALUES (
    @employeeId, 4
  );

  PRINT 'Employee added successfully';
END;
