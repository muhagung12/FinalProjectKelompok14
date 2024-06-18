CREATE PROCEDURE updateLocation (
  @loc_id INT,
  @loc_street_address VARCHAR(40) = NULL,
  @loc_postal_code VARCHAR(12) = NULL,
  @loc_city VARCHAR(30) = NULL,
  @loc_state_province VARCHAR(25) = NULL,
  @loc_country CHAR(3) = NULL
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Check if location with given ID exists
  SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @loc_id;
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Location with ID ' + CAST(@loc_id AS VARCHAR(10)) + ' does not exist.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Check if country with given ID exists
  IF @loc_country IS NOT NULL  
  BEGIN
    SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @loc_country;
    IF @rowsAffected = 0
    BEGIN
      SET @errorMsg = 'Country with ID ' + CAST(@loc_country AS VARCHAR(10)) + ' does not exist.';
      PRINT @errorMsg;
      RETURN;
    END;
  END;

  -- Update location details
  UPDATE tbl_locations
  SET
    street_address = ISNULL(@loc_street_address, street_address),
    postal_code = ISNULL(@loc_postal_code, postal_code),
    city = ISNULL(@loc_city, city),
    state_province = ISNULL(@loc_state_province, state_province),
    country = ISNULL(@loc_country, country)
  WHERE id = @loc_id;

  PRINT 'Location details updated successfully';
END;
