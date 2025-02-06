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
-- SELECT classes.class_id, 
--     classes.name AS class_name, 
--     CONCAT(staff.first_name, ' ', staff.last_name) AS instructor_name
-- FROM classes
-- JOIN class_schedule 
-- ON classes.class_id = class_schedule.class_id
-- JOIN staff 
-- ON class_schedule.staff_id = staff.staff_id;

-- 2. Find available classes for a specific date
-- TODO: Write a query to find available classes for a specific date
-- List classes available on '2025-02-01' 

-- SOLUTION
-- SELECT 
--     classes.class_id,
--     classes.name,
--     class_schedule.start_time,
--     class_schedule.end_time,
--     classes.capacity AS available_spots
-- FROM classes
-- JOIN class_schedule 
-- ON classes.class_id = class_schedule.class_id
-- WHERE DATE(class_schedule.start_time) = '2025-02-01';


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

-- 5. List top 5 most popular classes
-- TODO: Write a query to list top 5 most popular classes

-- 6. Calculate average number of classes per member
-- TODO: Write a query to calculate average number of classes per member