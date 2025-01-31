-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support

-- User Management Queries

-- 1. Retrieve all members
-- TODO: Write a query to retrieve all members

-- SELECT member_id, first_name, last_name, email, join_date
-- FROM members;

-- 2. Update a member's contact information
-- TODO: Write a query to update a member's contact information 
-- Phone number and email

-- UPDATE members
-- SET email = 'emily.jones.updated@email.com', phone_number = '555-9876'
-- WHERE member_id = 5;

-- 3. Count total number of members
-- TODO: Write a query to count the total number of members
-- SELECT COUNT(*)
-- FROM members;

-- 4. Find member with the most class registrations
-- TODO: Write a query to find the member with the most class registrations
-- member_id, first_name, last_name, registration_count
-- class attendance has member_id and attendence status
-- members has first name and last name and member_id
-- GROUP BY to get subtotals?

-- INSERT INTO class_attendance (schedule_id, member_id, attendance_status)
-- VALUES 
-- (1, 1, 'Registered'),
-- (2, 1, 'Registered');


    SELECT M.member_id, M.first_name, M.last_name, class_attendance.attendance_status,
    COUNT(attendance_status) AS registration_count
    FROM members M
    JOIN class_attendance
    ON M.member_id = class_attendance.member_id
    WHERE class_attendance.attendance_status = 'Registered'
    GROUP BY M.member_id;


-- 5. Find member with the least class registrations
-- TODO: Write a query to find the member with the least class registrations

-- 6. Calculate the percentage of members who have attended at least one class
-- TODO: Write a query to calculate the percentage of members who have attended at least one class