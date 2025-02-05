-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Equipment Management Queries

-- 1. Find equipment due for maintenance
-- TODO: Write a query to find equipment due for maintenance
-- List all equipment with next_maintenance_date in the next 30 days
-- NOTES FOR MARKER: used current date when code was written

-- SELECT equipment_id, name, next_maintenance_date
-- FROM equipment
-- WHERE next_maintenance_date BETWEEN DATE('2025-02-05') AND DATE('2025-03-07');

-- 2. Count equipment types in stock
-- TODO: Write a query to count equipment types in stock
-- Count the number of equipment types in stock

-- SELECT type AS equipment_type,
-- COUNT(type) AS count
-- FROM equipment
-- GROUP BY type;

-- 3. Calculate average age of equipment by type (in days)
-- TODO: Write a query to calculate average age of equipment by type (in days)
-- NOTES FOR MARKER: julianday to convert string into numerics as my dates are saved as string
-- NOTES FOR MARKER: used current date when code was written

-- SELECT type AS equipment_type,
-- AVG(JULIANDAY('2025-02-05') - JULIANDAY(purchase_date)) AS avg_age_days
-- FROM equipment 
-- GROUP BY type;
