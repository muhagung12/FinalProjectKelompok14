CREATE PROCEDURE 
addRegion ( @name VARCHAR(25)
)
AS
BEGIN INSERT INTO tbl_regions (name) VALUES (@name);
END;