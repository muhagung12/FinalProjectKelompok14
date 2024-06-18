CREATE VIEW country_details AS
SELECT c.id, c.name, c.region AS region_id, r.name AS region_name
FROM tbl_countries c, tbl_regions r
WHERE c.region = r.id;

