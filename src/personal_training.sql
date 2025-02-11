-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Personal Training Queries

-- 1. List all personal training sessions for a specific trainer
-- TODO: Write a query to list all personal training sessions for a specific trainer
-- List all personal training sessions for specific trainer "Ivy Irwin"

-- SOLUTION
-- SELECT pts.session_id, s.first_name || ' ' || s.last_name AS member_name, pts.session_date, pts.start_time, pts.end_time 
-- FROM personal_training_sessions pts
-- JOIN staff s
-- ON pts.staff_id = s.staff_id
-- WHERE member_name = 'Ivy Irwin'
-- ORDER BY session_date;
