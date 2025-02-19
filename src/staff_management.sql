-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Staff Management Queries

-- 1. List all staff members by role
-- TODO: Write a query to list all staff members by role

-- SOLUTION
-- SELECT staff_id, first_name, last_name, position AS role
-- FROM staff
-- ORDER BY role;

-- 2. Find trainers with one or more personal training session in the next 30 days
-- TODO: Write a query to find trainers with one or more personal training session in the next 30 days
-- NOTE FOR MARKER: Not checking for staff with position of 'trainer' as some pts are done by staff with position of 'manager'/'receptionist' etc

-- SOLUTION
-- SELECT S.staff_id AS trainer_id, S.first_name || ' ' || S.last_name AS trainer_name, COUNT(PTS.session_id) AS session_count
-- FROM staff S
-- JOIN personal_training_sessions PTS
-- ON S.staff_id = PTS.staff_id
-- WHERE role = 'Trainer' AND DATE(PTS.session_date) BETWEEN DATE('now') AND DATE('now', '+30 days')
-- GROUP BY trainer_id, trainer_name
-- HAVING session_count >= 1
-- ORDER BY session_count DESC;
