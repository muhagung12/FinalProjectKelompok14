CREATE PROCEDURE addRole (
  @role_name varchar(50)
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);

  -- Insert role
  INSERT INTO tbl_roles (name)
  VALUES (@role_name);

  PRINT 'Role added successfully';
END;
