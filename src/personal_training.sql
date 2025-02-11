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
-- SELECT PTS.session_id, S.first_name || ' ' || S.last_name AS member_name, PTS.session_date, PTS.start_time, PTS.end_time 
-- FROM personal_training_sessions PTS
-- JOIN staff S
-- ON PTS.staff_id = S.staff_id
-- WHERE member_name = 'Ivy Irwin'
-- ORDER BY session_date;
