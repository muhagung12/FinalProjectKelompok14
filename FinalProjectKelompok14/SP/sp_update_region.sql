CREATE PROCEDURE updateRegion ( @id INT, @new_name VARCHAR(25)
)
AS BEGIN
  UPDATE tbl_regions
  SET name = @new_name
  WHERE id = @id;
END;
