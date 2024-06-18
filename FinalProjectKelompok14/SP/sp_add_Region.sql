CREATE PROCEDURE addRegion (@region VARCHAR(25))
AS
BEGIN INSERT INTO tbl_regions (name) VALUES (@region);
END;
