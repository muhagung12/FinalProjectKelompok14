CREATE PROCEDURE addLocation (
  @loc_street_address VARCHAR(40),
  @loc_postal_code VARCHAR(12),
  @loc_city VARCHAR(30),
  @loc_state_province VARCHAR(25),
  @loc_country CHAR(3)
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Check if country exists
  SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @loc_country;

  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Country with ID ' + CAST(@loc_country AS VARCHAR(10)) + ' does not exist in table.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Insert location
  INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country)
  VALUES (@loc_street_address, @loc_postal_code, @loc_city, @loc_state_province, @loc_country);

  PRINT 'Location added successfully';
END;
