-- FitTrack Pro Database Schema

-- Initial SQLite setup
.open fittrackpro.sqlite
.mode column

-- Enable foreign key support
PRAGMA foreign_keys = ON;

-- Create your tables here
-- Example:
-- DROP TABLE IF EXISTS table_name;
-- CREATE TABLE table_name (
--     column1 datatype,
--     column2 datatype,
--     ...
-- );

-- DROPS
DROP TABLE members;
DROP TABLE staff;
DROP TABLE equipment;
DROP TABLE locations;

-- TODO: Create the following tables:
-- 1. locations

CREATE TABLE locations (
    location_id INTEGER PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    phone_number TEXT NOT NULL CHECK(LENGTH(phone_number) = 8),
    email TEXT NOT NULL,
    opening_hours TEXT NOT NULL
 );

 -- Sample data for locations
INSERT INTO locations (name, address, phone_number, email, opening_hours)
VALUES 
('Downtown Fitness', '123 Main St, Cityville', '555-1234', 'downtown@fittrackpro.com', '6:00-22:00'),
('Suburb Gym', '456 Oak Rd, Townsburg', '555-5678', 'suburb@fittrackpro.com', '5:00-23:00');

-- 2. members
CREATE TABLE members (
    member_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT NOT NULL CHECK(LENGTH(phone_number) = 8),
    date_of_birth DATE NOT NULL,
    join_date DATE NOT NULL,
    emergency_contact_name TEXT NOT NULL,
    emergency_contact_phone TEXT NOT NULL CHECK(LENGTH(emergency_contact_phone) = 8)
 );

-- Sample data for members
INSERT INTO members (first_name, last_name, email, phone_number, date_of_birth, join_date, emergency_contact_name, emergency_contact_phone)
VALUES 
('Alice', 'Johnson', 'alice.j@email.com', '555-1111', '1990-05-15', '2024-11-10', 'Bob Johnson', '555-1112'),
('Bob', 'Smith', 'bob.s@email.com', '555-2222', '1985-09-22', '2024-12-15', 'Alice Smith', '555-2223'),
('Carol', 'Williams', 'carol.w@email.com', '555-3333', '1992-12-03', '2025-01-20', 'David Williams', '555-3334'),
('David', 'Brown', 'david.b@email.com', '555-4444', '1988-07-30', '2024-11-25', 'Emily Brown', '555-4445'),
('Emily', 'Jones', 'emily.j@email.com', '555-5555', '1995-03-12', '2024-12-30', 'Frank Jones', '555-5556'),
('Frank', 'Miller', 'frank.m@email.com', '555-6666', '1983-11-18', '2025-01-10', 'Grace Miller', '555-6667'),
('Grace', 'Davis', 'grace.d@email.com', '555-7777', '1993-01-25', '2024-11-20', 'Henry Davis', '555-7778'),
('Henry', 'Wilson', 'henry.w@email.com', '555-8888', '1987-08-05', '2024-12-15', 'Ivy Wilson', '555-8889'),
('Ivy', 'Moore', 'ivy.m@email.com', '555-9999', '1991-04-09', '2025-01-01', 'Jack Moore', '555-9990'),
('Jack', 'Taylor', 'jack.t@email.com', '555-0000', '1986-06-28', '2024-11-12', 'Kelly Taylor', '555-0001'),
('Karen', 'Lee', 'karen.l@email.com', '555-1313', '1989-02-14', '2024-12-05', 'Liam Lee', '555-1314'),
('Liam', 'Anderson', 'liam.a@email.com', '555-1515', '1994-07-19', '2025-01-01', 'Mia Anderson', '555-1516'),
('Mia', 'Thomas', 'mia.t@email.com', '555-1717', '1991-11-30', '2025-01-10', 'Noah Thomas', '555-1718'),
('Noah', 'Roberts', 'noah.r@email.com', '555-1919', '1987-04-25', '2025-01-15', 'Olivia Roberts', '555-1920'),
('Olivia', 'Clark', 'olivia.c@email.com', '555-2121', '1993-09-08', '2025-01-20', 'Peter Clark', '555-2122');

-- 3. staff
CREATE TABLE staff (
    staff_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone_number TEXT NOT NULL CHECK(LENGTH(phone_number) = 8),
    position TEXT NOT NULL,
    hire_date DATE NOT NULL ,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

-- Sample data for staff
INSERT INTO staff (first_name, last_name, email, phone_number, position, hire_date, location_id)
VALUES 
('David', 'Brown', 'david.b@fittrackpro.com', '555-4444', 'Trainer', '2024-11-10', 1),
('Emma', 'Davis', 'emma.d@fittrackpro.com', '555-5555', 'Manager', '2024-11-15', 2),
('Frank', 'Evans', 'frank.e@fittrackpro.com', '555-6666', 'Receptionist', '2024-12-10', 1),
('Grace', 'Green', 'grace.g@fittrackpro.com', '555-7777', 'Trainer', '2024-12-20', 2),
('Henry', 'Harris', 'henry.h@fittrackpro.com', '555-8888', 'Maintenance', '2025-01-05', 1),
('Ivy', 'Irwin', 'ivy.i@fittrackpro.com', '555-9999', 'Trainer', '2025-01-01', 2),
('Jack', 'Johnson', 'jack.j@fittrackpro.com', '555-0000', 'Manager', '2024-11-15', 1),
('Karen', 'King', 'karen.k@fittrackpro.com', '555-1212', 'Trainer', '2024-12-01', 2);

-- 4. equipment
CREATE TABLE equipment (
    equipment_id INTEGER PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    type TEXT NOT NULL, 
    purchase_date DATE NOT NULL,
    last_maintenance_date DATE NOT NULL,
    next_maintenance_date DATE NOT NULL,
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

INSERT INTO equipment (name, type, purchase_date, last_maintenance_date, next_maintenance_date, location_id)
VALUES 
('Treadmill 1', 'Cardio', '2024-11-01', '2024-11-15', '2025-02-15', 1),
('Treadmill 2', 'Cardio', '2024-11-02', '2024-11-20', '2025-02-20', 1),
('Treadmill 3', 'Cardio', '2024-11-03', '2024-11-25', '2025-02-25', 2),
('Treadmill 4', 'Cardio', '2024-11-04', '2024-11-30', '2025-02-28', 2),
('Bench Press 1', 'Strength', '2024-11-05', '2024-12-01', '2025-03-01', 1),
('Bench Press 2', 'Strength', '2024-11-06', '2024-12-05', '2025-03-05', 2),
('Elliptical 1', 'Cardio', '2024-11-07', '2024-12-10', '2025-03-10', 1),
('Elliptical 2', 'Cardio', '2024-11-08', '2024-12-15', '2025-03-15', 2),
('Squat Rack 1', 'Strength', '2024-11-09', '2024-12-20', '2025-03-20', 1),
('Squat Rack 2', 'Strength', '2024-11-10', '2024-12-25', '2025-03-25', 2),
('Rowing Machine 1', 'Cardio', '2024-11-11', '2024-12-30', '2025-03-30', 1),
('Rowing Machine 2', 'Cardio', '2024-11-12', '2025-01-01', '2025-04-01', 2),
('Leg Press 1', 'Strength', '2024-11-13', '2025-01-05', '2025-04-05', 1),
('Leg Press 2', 'Strength', '2024-11-14', '2025-01-10', '2025-04-10', 2),
('Stationary Bike 1', 'Cardio', '2024-11-15', '2025-01-15', '2025-04-15', 1),
('Stationary Bike 2', 'Cardio', '2024-11-16', '2025-01-20', '2025-04-20', 2);

-- 5. classes
-- 6. class_schedule
-- 7. memberships
-- 8. attendance
-- 9. class_attendance
-- 10. payments
-- 11. personal_training_sessions
-- 12. member_health_metrics
-- 13. equipment_maintenance_log

-- After creating the tables, you can import the sample data using:
-- `.read data/sample_data.sql` in a sql file or `npm run import` in the terminal