CREATE VIEW location_details AS
SELECT  l.id, l.street_address, l.postal_code, 
  l.city, l.state_province, l.country,  c.name AS country_name  FROM tbl_locations l
LEFT JOIN tbl_countries c ON l.country = c.id;
