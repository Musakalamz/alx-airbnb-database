-- ===========================================
-- 4. OPTIMIZE COMPLEX QUERIES
-- File: perfomance.sql
-- Project: ALX Airbnb Database (Advanced Querying)
-- ===========================================

-- ===================================================
-- Initial Query (Unoptimized)
-- Retrieve all bookings with user, property, and payment details
-- ===================================================
EXPLAIN
SELECT 
    b.booking_id,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.property_name,
    py.payment_id,
    py.amount,
    py.status,
    b.start_date,
    b.end_date
FROM Booking AS b
JOIN User AS u
    ON b.user_id = u.user_id
JOIN Property AS p
    ON b.property_id = p.property_id
JOIN Payment AS py
    ON b.booking_id = py.booking_id
ORDER BY b.start_date;

-- ===================================================
-- Optimization Strategy
-- ===================================================
-- 1. Add indexes to frequently joined columns
-- 2. Reduce unnecessary columns
-- 3. Use WHERE clause to filter large data
-- 4. Analyze performance using EXPLAIN ANALYZE

CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- ===================================================
-- Optimized Query
-- ===================================================
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    u.name AS user_name,
    p.property_name,
    py.amount,
    py.status,
    b.start_date
FROM Booking AS b
JOIN User AS u
    ON b.user_id = u.user_id
JOIN Property AS p
    ON b.property_id = p.property_id
JOIN Payment AS py
    ON b.booking_id = py.booking_id
WHERE b.start_date >= '2025-01-01'
ORDER BY b.start_date;