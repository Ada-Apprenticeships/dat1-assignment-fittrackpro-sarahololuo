-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Membership Management Queries

-- 1. List all active memberships
-- TODO: Write a query to list all active memberships
-- List all active memberships

--SOLUTION
-- SELECT M.member_id, M.first_name, M.last_name, Mships.type AS membership_type, Mships.start_date AS join_date
-- FROM members M
-- JOIN memberships Mships
-- ON M.member_id = Mships.member_id
-- WHERE Mships.status = 'Active';


-- 2. Calculate the average duration of gym visits for each membership type
-- TODO: Write a query to calculate the average duration of gym visits for each membership type
-- Calculate the average duration of gym visits for each membership type
-- membership_type | avg_visit_duration_minutes

-- SOLUTION

-- 3. Identify members with expiring memberships this year
-- TODO: Write a query to identify members with expiring memberships this year