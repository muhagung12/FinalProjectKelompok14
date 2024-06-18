CREATE PROCEDURE deletePermission (@Id int)
AS
BEGIN
    DECLARE @rowsAffected int;

    DELETE FROM tbl_permissions WHERE id = @Id;
    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
    BEGIN
        PRINT 'Role with the specified ID was not found.';
    END;
END;

