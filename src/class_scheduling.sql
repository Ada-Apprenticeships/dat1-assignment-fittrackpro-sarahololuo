-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Class Scheduling Queries

-- 1. List all classes with their instructors
-- TODO: Write a query to list all classes with their instructors
-- class_id | class_name | instructor_name

-- SOLUTION
-- SELECT C.class_id, 
--     C.name AS class_name, 
--     staff.first_name || ' ' || staff.last_name AS instructor_name
-- FROM classes C
-- JOIN class_schedule CS
-- ON C.class_id = CS.class_id
-- JOIN staff 
-- ON CS.staff_id = staff.staff_id;

-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
-- List classes available on '2025-02-01' 

-- SOLUTION
-- SELECT 
--     C.class_id,
--     C.name,
--     CS.start_time,
--     CS.end_time,
--     C.capacity AS available_spots
-- FROM classes C
-- JOIN class_schedule CS
-- ON C.class_id = CS.class_id
-- WHERE DATE(CS.start_time) = '2025-02-01';


-- 3. Register a member for a class
-- TODO: Write a query to register a member for a class

-- NOTES FOR MARKER: Retrive schedule id for the spin class
-- SELECT schedule_id
-- FROM class_schedule
-- WHERE class_id = 3 AND DATE(start_time) = '2025-02-01';

-- SOLUTION
-- INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
-- VALUES (7, 11, 'Registered');

-- 4. Cancel a class registration
-- TODO: Write a query to cancel a class registration

-- SOLUTION
-- DELETE FROM class_attendance
-- WHERE schedule_id = 7 AND member_id = 2;


-- 5. List top 5 most popular classes
-- TODO: Write a query to list top 5 most popular classes
-- NOTE FOR MARKER: the README.md file states that the query should list the top 3 most popular classes so I will go with top 3 instead of 5

-- SOLUTION
-- SELECT 
--     C.class_id,
--     C.name AS class_name,
--     COUNT(CA.member_id) AS registration_count
-- FROM classes C
-- JOIN class_schedule CS
-- ON C.class_id = CS.class_id
-- JOIN class_attendance CA
-- ON CS.schedule_id = CA.schedule_id
-- WHERE CA.attendance_status = 'Registered'
-- GROUP BY C.class_id, C.name
-- ORDER BY registration_count DESC
-- LIMIT 3;

-- 6. Calculate average number of classes per member
-- TODO: Write a query to calculate average number of classes per member
-- Calculate the average number of classes per member 
-- NOTE FOR MARKER: Based on interpretation of instructions, I counted all class registrations, counted all distinct members then divided registrtions by members

-- SOLUTION
-- SELECT 
-- COUNT(class_attendance.class_attendance_id) / COUNT(DISTINCT class_attendance.member_id) AS avg_class_per_member
-- FROM class_attendance;
