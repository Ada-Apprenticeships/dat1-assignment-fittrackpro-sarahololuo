-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- User Management Queries

-- 1. Retrieve all members
-- TODO: Write a query to retrieve all members

-- SOLUTION
-- SELECT member_id, first_name, last_name, email, join_date
-- FROM members;

-- 2. Update a member's contact information
-- TODO: Write a query to update a member's contact information 
-- Phone number and email

-- SOLUTION
-- UPDATE members
-- SET email = 'emily.jones.updated@email.com', phone_number = '555-9876'
-- WHERE member_id = 5;

-- 3. Count total number of members
-- TODO: Write a query to count the total number of members

-- SOLUTION
-- SELECT COUNT(*)
-- FROM members;

-- 4. Find member with the most class registrations
-- TODO: Write a query to find the member with the most class registrations

-- SOLUTION
-- SELECT M.first_name, M.last_name
-- FROM members M
-- JOIN class_attendance CA 
-- ON M.member_id = CA.member_id
-- WHERE CA.attendance_status = 'Registered'
-- GROUP BY M.member_id, M.first_name, M.last_name
-- HAVING COUNT(*) = (
--     SELECT MAX(registration_count)
--     FROM (
--         SELECT member_id, COUNT(*) AS registration_count
--         FROM class_attendance
--         WHERE attendance_status = 'Registered'
--         GROUP BY member_id
--     )  AS max_registration_count 
-- );

-- INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
-- VALUES 
-- (1, 1, 'Registered'),
-- (2, 1, 'Registered');

-- PRACTICE
    -- SELECT M.member_id, M.first_name, M.last_name, class_attendance.attendance_status,
    -- COUNT(attendance_status) AS registration_count
    -- FROM members M
    -- JOIN class_attendance
    -- ON M.member_id = class_attendance.member_id
    -- WHERE class_attendance.attendance_status = 'Registered'
    -- GROUP BY M.member_id;

-- Calculate highest registration count (only number) (PRACTICE)
    -- SELECT MAX(registration_count)
    -- FROM (
    --     SELECT member_id, COUNT(*) AS registration_count
    --     FROM class_attendance
    --     WHERE attendance_status = 'Registered'
    --     GROUP BY member_id
    -- )


-- 5. Find member with the least class registrations
-- TODO: Write a query to find the member with the least class registrations

-- SOLUTION
-- SELECT M.first_name, M.last_name
-- FROM members M
-- JOIN class_attendance CA 
-- ON M.member_id = CA.member_id
-- WHERE CA.attendance_status = 'Registered'
-- GROUP BY M.member_id, M.first_name, M.last_name
-- HAVING COUNT(*) = (
--     SELECT MIN(registration_count)
--     FROM (
--         SELECT member_id, COUNT(*) AS registration_count
--         FROM class_attendance
--         WHERE attendance_status = 'Registered'
--         GROUP BY member_id
--     ) AS min_registration_count 
-- );



-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class

-- SOLUTION
-- SELECT (COUNT(DISTINCT CA.member_id)* 100.0 / COUNT(DISTINCT M.member_id)) AS attendance_percentage
-- FROM members M
-- LEFT JOIN class_attendance CA 
-- ON M.member_id = CA.member_id 
-- AND CA.attendance_status = 'Attended';