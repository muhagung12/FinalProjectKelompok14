CREATE PROCEDURE 
addRole (@name varchar(50)
)
AS
BEGIN DECLARE @errorMessage nvarchar(500);
    BEGIN TRY
    INSERT INTO tbl_roles (name)
    VALUES (@name);
    END TRY
    BEGIN CATCH
    SET @errorMessage = ERROR_MESSAGE();
    RAISERROR ('Error adding role: %s', 16, 1, @errorMessage);
    END CATCH;
END;