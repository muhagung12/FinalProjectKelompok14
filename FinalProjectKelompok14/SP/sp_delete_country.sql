CREATE PROCEDURE deleteCountry (
  @country_id CHAR(3)
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Check if the country with the given ID exists
  SELECT @rowsAffected = COUNT(*) FROM tbl_countries WHERE id = @country_id;

  -- If the country does not exist, print an error message
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Country with ID ' + @country_id + ' does not exist.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Delete the country
  DELETE FROM tbl_countries WHERE id = @country_id;

  PRINT 'Country deleted successfully';
END;
