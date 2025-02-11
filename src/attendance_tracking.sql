-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
-- TODO: Write a query to record a member's gym visit

--SOLUTION
-- INSERT INTO attendance 
-- (member_id, location_id, check_in_time)
-- VALUES (7, 1, datetime('now'));

-- 2. Retrieve a member's attendance history
-- TODO: Write a query to retrieve a member's attendance history

--SOLUTION
-- SELECT DATE(check_in_time) AS visit_date, TIME(check_in_time) AS check_in_time, TIME(check_out_time) AS check_out_time
-- FROM attendance
-- WHERE member_id = 5;

-- 3. Find the busiest day of the week based on gym visits
-- TODO: Write a query to find the busiest day of the week based on gym visits
-- Identify the busiest day of the week based on gym visits
-- day_of_week | visit_count

-- SOLUTION
-- SELECT 
--     DATE(check_in_time) AS day_of_week,
--     COUNT(*) AS visit_count
-- FROM attendance
-- GROUP BY day_of_week
-- ORDER BY visit_count DESC;

-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location