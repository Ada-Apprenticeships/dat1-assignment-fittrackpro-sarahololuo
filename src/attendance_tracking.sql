-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Attendance Tracking Queries

-- 1. Record a member's gym visit
-- TODO: Write a query to record a member's gym visit
-- Insert a new attendance record for member with ID 7 at Downtown Fitness
-- Downtown Fitness (location_id 1) 
-- Check-in time Current date and time 
-- No result set. Affects 1 row in attendance table.

--SOLUTION
-- INSERT INTO attendance 
-- (member_id, location_id, check_in_time)
-- VALUES (7, 1, datetime('now'));

-- 2. Retrieve a member's attendance history
-- TODO: Write a query to retrieve a member's attendance history

-- 3. Find the busiest day of the week based on gym visits
-- TODO: Write a query to find the busiest day of the week based on gym visits

-- 4. Calculate the average daily attendance for each location
-- TODO: Write a query to calculate the average daily attendance for each location