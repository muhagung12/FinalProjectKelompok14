-- SP ADD DATA PERMISSIONS
CREATE PROCEDURE AddPermission ( @id int,  @name varchar(100)
)
AS
BEGIN DECLARE @errorMessage nvarchar(500);

    BEGIN TRY INSERT INTO tbl_permissions (id, name) VALUES (@id, @name);
    END TRY
    BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding permission: %s', 16, 1, @errorMessage);
    END CATCH;
END;
EXEC AddPermission @id = 12, @name = 'Read Access';
SELECT * FROM tbl_permissions;