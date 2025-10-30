-- ===========================================
-- 2. AGGREGATIONS AND WINDOW FUNCTIONS
-- File: aggregations_and_window_functions.sql
-- Project: ALX Airbnb Database (Advanced Querying)
-- ===========================================

-- Find the total number of bookings made by each user
SELECT 
    u.user_id,
    u.name AS user_name,
    COUNT(b.booking_id) AS total_bookings
FROM User AS u
LEFT JOIN Booking AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;

-- Rank properties based on the total number of bookings received
SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Property AS p
LEFT JOIN Booking AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.property_name
ORDER BY property_rank;