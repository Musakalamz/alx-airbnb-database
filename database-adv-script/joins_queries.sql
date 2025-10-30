-- Retrieve all properties and their reviews,
-- including properties that have no reviews
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r
ON p.id = r.property_id
ORDER BY p.id, r.id;