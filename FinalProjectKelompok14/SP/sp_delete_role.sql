CREATE PROCEDURE deleteRole (@Id INT)
AS
BEGIN
    DECLARE @rowsAffected INT;

    DELETE FROM tbl_roles WHERE id = @Id;
    SET @rowsAffected = @@ROWCOUNT;

    IF @rowsAffected = 0
    BEGIN
        PRINT 'Role with the specified ID was not found.';
    END;
END;
