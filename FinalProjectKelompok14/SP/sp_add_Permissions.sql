CREATE PROCEDURE AddPermission (
  @perm_id int,
  @perm_name varchar(100)
)
AS
BEGIN
  DECLARE @errorMsg nvarchar(500);

  -- Insert permission
  INSERT INTO tbl_permissions (id, name)
  VALUES (@perm_id, @perm_name);

  PRINT 'Permission added successfully';
END;
