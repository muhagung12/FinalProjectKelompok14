CREATE PROCEDURE deleteRegion (@id INT)
AS 
BEGIN 
DELETE FROM tbl_regions 
WHERE id = @id
END;
