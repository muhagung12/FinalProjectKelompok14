CREATE PROCEDURE addEmployee (
  @firstName varchar(25),@lastName varchar(25), @gender varchar(10),
  @email varchar(25), @phone varchar(20), @hireDate date,@salary int, @managerId int,
  @jobId varchar(10), @departmentId int,@password varchar(50),@confirmPassword varchar(50)
)
AS
BEGIN DECLARE @errorMessage nvarchar(500);

  BEGIN TRY
  IF @password <> @confirmPassword
    BEGIN SET @errorMessage = 'Passwords do not match.';
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
    RETURN;
    END;
    IF @gender = '' OR dbo.isValidGender(@gender) = 0
    BEGIN
      SET @errorMessage = 'Invalid gender provided.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    IF dbo.isValidEmail(@email) = 0
    BEGIN
      SET @errorMessage = 'Invalid email address.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    IF dbo.IsNumericPhoneNumber(@phone) = 0
    BEGIN
      SET @errorMessage = 'Invalid phone number format.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    IF dbo.isValidSalary(@salary) = 0  
    BEGIN
      SET @errorMessage = 'Salary is outside the allowed range.';
      RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
      RETURN;
    END;

    INSERT INTO tbl_employees(
      first_name, last_name, gender, email, phone,hire_date,salary,manager,job,department
    )
    VALUES (@firstName,@lastName, @gender, @email, @phone, @hireDate, @salary, @managerId,@jobId, @departmentId
    );

    INSERT INTO tbl_accounts (
      id, username,
      password
    )
    VALUES ( @employeeId, @email, @password
    );
    
    INSERT INTO tbl_account_roles ( account,role )
    VALUES (@employeeId, 4 );
  END TRY

  BEGIN CATCH  SET @errorMessage = ERROR_MESSAGE();
	RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
  END CATCH;

END;