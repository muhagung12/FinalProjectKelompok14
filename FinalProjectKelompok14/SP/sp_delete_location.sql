CREATE PROCEDURE deleteLocation (
  @loc_id INT
)
AS
BEGIN
  DECLARE @rowsAffected INT;
  DECLARE @errorMsg NVARCHAR(500);

  -- Check if the location with the given ID exists
  SELECT @rowsAffected = COUNT(*) FROM tbl_locations WHERE id = @loc_id;

  -- If the location does not exist, print an error message
  IF @rowsAffected = 0
  BEGIN
    SET @errorMsg = 'Location with ID ' + CAST(@loc_id AS VARCHAR(10)) + ' does not exist.';
    PRINT @errorMsg;
    RETURN;
  END;

  -- Delete the location
  DELETE FROM tbl_locations WHERE id = @loc_id;

  PRINT 'Location deleted successfully';
END;
