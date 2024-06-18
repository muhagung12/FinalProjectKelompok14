CREATE PROCEDURE updateRegion ( @id INT, @regionVARCHAR(25)
)
AS BEGIN
  UPDATE tbl_regions
  SET name = @region
  WHERE id = @id;
END;
