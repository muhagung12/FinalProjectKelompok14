CREATE PROCEDURE AddDepartment (
  @dept_name varchar(30),
  @dept_location int
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);

  -- Insert into the departments table
  INSERT INTO tbl_departments (name, location)
  VALUES (@dept_name, @dept_location);

  PRINT 'Department added successfully';
END;
