CREATE PROCEDURE updateEmployee (
	@id int, @firstName varchar(25), @lastName varchar(25), @gender varchar(10),
	@email varchar(25), @phone varchar(20), @hireDate date, @salary int,
	@managerId int, @jobId varchar(10),  @departmentId int
)
AS
BEGIN DECLARE @errorMessage nvarchar(500);
BEGIN TRY IF @gender = '' OR dbo.isValidGender(@gender) = 0
    BEGIN SET @errorMessage = 'Invalid gender provided.';
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
    RETURN;
    END;

    IF dbo.isValidEmail(@email) = 0
    BEGIN SET @errorMessage = 'Invalid email address.';
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
    RETURN;
    END;

    IF dbo.isNumericPhoneNumber(@phone) = 0
    BEGIN SET @errorMessage = 'Invalid phone number format.';
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
    RETURN;
    END;

    IF dbo.isValidSalary(@jobId, @salary) = 0
    BEGIN SET @errorMessage = 'Salary is outside the allowed range.';
    RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
    RETURN;
    END;

    UPDATE tbl_employee SET first_name = @firstName,
		last_name = @lastName, gender = @gender,
		email = @email,phone = @phone, hire_date = @hireDate,
		salary = @salary, manager = @managerId, job = @jobId, department = @departmentId
    WHERE id = @id;
    END TRY

  BEGIN CATCH SET @errorMessage = ERROR_MESSAGE();
  RAISERROR ('Error adding employee: %s', 16, 1, @errorMessage);
  END CATCH;
END;