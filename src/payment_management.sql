-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Payment Management Queries

-- 1. Record a payment for a membership
-- TODO: Write a query to record a payment for a membership

-- SOLUTION
INSERT INTO payments (member_id, amount, payment_date, payment_method, payment_type)
VALUES (11, 50.00, '2025-02-04 13:19:00', 'Credit Card', 'Monthly membership fee');



-- 2. Calculate total revenue from membership fees for each month of the last year
-- TODO: Write a query to calculate total revenue from membership fees for each month of the current year

-- SOLUTION

-- 3. Find all day pass purchases
-- TODO: Write a query to find all day pass purchases

-- SOLUTION