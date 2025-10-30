-- ===========================================
-- 3. INDEX PERFORMANCE OPTIMIZATION
-- File: database_index.sql
-- Project: ALX Airbnb Database (Advanced Querying)
-- ===========================================

-- Identify high-usage columns in User, Booking, and Property tables
-- and create indexes to improve query performance

-- Create index on User table for frequent lookups by email
CREATE INDEX idx_user_email ON User(email);

-- Create index on Booking table for frequent queries by user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on Property table for frequent queries by location
CREATE INDEX idx_property_location ON Property(location);

-- Measure query performance BEFORE adding indexes
EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.start_date,
    p.property_name
FROM Booking AS b
JOIN User AS u
    ON b.user_id = u.user_id
JOIN Property AS p
    ON b.property_id = p.property_id
WHERE p.location = 'Lagos';

-- Measure query performance AFTER adding indexes
EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.start_date,
    p.property_name
FROM Booking AS b
JOIN User AS u
    ON b.user_id = u.user_id
JOIN Property AS p
    ON b.property_id = p.property_id
WHERE p.location = 'Lagos';