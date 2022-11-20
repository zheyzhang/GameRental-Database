CREATE TRIGGER update_record AFTER UPDATE
ON gameRental
FOR EACH ROW
WHEN NEW.date_back IS NOT NULL AND OLD.rental_cost IS NULL 
BEGIN
UPDATE gameRental 
SET rental_cost = 3 + 0.05 * (julianday(date_back) - julianday(date_out)) * (
SELECT price
FROM gameRental JOIN GameLicense
USING (license_id)
JOIN GameTitle
USING (title, release_year, platform)
WHERE gamer_id == NEW.gamer_id AND license_id == NEW.license_id)
WHERE gamer_id == NEW.gamer_id 
AND license_id == NEW.license_id;
END;