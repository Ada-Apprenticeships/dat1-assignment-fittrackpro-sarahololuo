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
-- NOTE FOR MARKER= Wasn't sure on wether to limit the result set, kept it as is because the result set still identifies the busiest day due to it having the highest count of them all

-- SOLUTION
-- SELECT 
--     strftime('%w', check_in_time) AS day_of_week,
--     COUNT(*) AS visit_count
-- FROM attendance
-- -- 0 = sunday, 1= monday, 2= tuesday, 3 = wednesday, 4 = thursday, 5 = friday, 6 = saturday
-- GROUP BY day_of_week
-- ORDER BY visit_count DESC;

-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location

-- SOLUTION
-- SELECT 
--     locations.name AS location_name,
--     COUNT(attendance.attendance_id) / COUNT(DISTINCT DATE(attendance.check_in_time)) AS avg_daily_attendance
-- FROM locations
-- LEFT JOIN attendance 
-- ON locations.location_id = attendance.location_id
-- GROUP BY locations.name
-- ORDER BY location_name;