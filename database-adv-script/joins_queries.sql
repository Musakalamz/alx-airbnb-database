-- ===========================================
-- 0. COMPLEX JOINS QUERIES
-- File: joins_queries.sql
-- Project: ALX Airbnb Database (Advanced Querying)
-- ===========================================

-- Retrieve all bookings with their respective users (INNER JOIN)
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.name AS user_name,
    u.email AS user_email
FROM Booking AS b
INNER JOIN User AS u
    ON b.user_id = u.user_id;

-- Retrieve all properties and their reviews (LEFT JOIN)
-- Includes properties with no reviews
SELECT 
    p.property_id,
    p.property_name,
    r.review_id,
    r.rating,
    r.comment
FROM Property AS p
LEFT JOIN Review AS r
    ON p.property_id = r.property_id
ORDER BY p.property_id, r.review_id;

-- Retrieve all users and bookings (FULL OUTER JOIN)
-- Includes users with no bookings and bookings with no linked users
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM User AS u
LEFT JOIN Booking AS b
    ON u.user_id = b.user_id
UNION
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM User AS u
RIGHT JOIN Booking AS b
    ON u.user_id = b.user_id;