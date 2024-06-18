CREATE PROCEDURE updateCountry (
  @country_id CHAR(3),
  @new_name VARCHAR(40),
  @new_region INT
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Check if country with given ID exists
  SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @country_id;
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Country with ID ' + CAST(@country_id AS VARCHAR(10)) + ' does not exist.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Check if region with given ID exists
  IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @new_region)
  BEGIN
    SET @errorMsg = 'Region with ID ' + CAST(@new_region AS VARCHAR(10)) + ' does not exist.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Update country details
  UPDATE tbl_countries
  SET name = @new_name,
      region = @new_region
  WHERE id = @country_id;

  PRINT 'Country details updated successfully';
END;
