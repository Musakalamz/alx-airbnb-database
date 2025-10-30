-- ===========================================
-- 5. PARTITIONING LARGE TABLES
-- File: partitioning.sql
-- Project: ALX Airbnb Database (Advanced Querying)
-- ===========================================

-- Drop existing table (if needed) to recreate a partitioned version
DROP TABLE IF EXISTS Booking_Partitioned;

-- Create a partitioned Booking table based on start_date
CREATE TABLE Booking_Partitioned (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Test performance on partitioned table
EXPLAIN ANALYZE
SELECT 
    booking_id, user_id, property_id, start_date, end_date
FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';