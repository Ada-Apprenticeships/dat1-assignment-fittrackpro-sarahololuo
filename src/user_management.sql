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

-- NOTES FOR MARKER: to allow for there to be a single clear most registered
-- INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
-- VALUES 
-- (1, 1, 'Registered'),
-- (2, 1, 'Registered');

-- SOLUTION
-- SELECT M.member_id, M.first_name, M.last_name, COUNT(*) AS registration_count
-- FROM members M
-- JOIN class_attendance CA
-- ON M.member_id = CA.member_id
-- WHERE CA.attendance_status = 'Registered'
-- GROUP BY M.member_id, M.first_name, M.last_name
-- ORDER BY registration_count DESC
-- LIMIT 1;


-- 5. Find member with the least class registrations
-- TODO: Write a query to find the member with the least class registrations
--  NOTE TO MARKER: Multiple members have the same least number of registrations, limiting to one due to requirement to get the 'least' suggesting only one member


-- SOLUTION
-- SELECT M.member_id, M.first_name, M.last_name, COUNT(*) AS registration_count
-- FROM members M
-- JOIN class_attendance CA
-- ON M.member_id = CA.member_id
-- WHERE CA.attendance_status = 'Registered'
-- GROUP BY M.member_id, M.first_name, M.last_name
-- ORDER BY registration_count ASC
-- LIMIT 1;


-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class
-- NOTE FOR MARKER: interpreted as members featuring 'attended' only, not registered 

-- SOLUTION
-- SELECT (COUNT(DISTINCT CA.member_id)* 100.0 / COUNT(DISTINCT M.member_id)) AS attendance_percentage
-- FROM members M
-- LEFT JOIN class_attendance CA 
-- ON M.member_id = CA.member_id 
-- AND CA.attendance_status = 'Attended';