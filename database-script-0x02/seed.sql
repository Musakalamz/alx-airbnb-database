-- Airbnb Database Seed Data
-- This script populates the database with sample data

-- Seed User data
INSERT INTO user_account (username, email, password_hash, first_name, last_name, phone_number, profile_picture, is_host)
VALUES
('john_doe', 'john.doe@example.com', '$2a$12$1234567890abcdefghijk', 'John', 'Doe', '+1234567890', 'https://example.com/profiles/john.jpg', TRUE),
('jane_smith', 'jane.smith@example.com', '$2a$12$abcdefghijk1234567890', 'Jane', 'Smith', '+2345678901', 'https://example.com/profiles/jane.jpg', TRUE),
('bob_johnson', 'bob.johnson@example.com', '$2a$12$ghijk1234567890abcdef', 'Bob', 'Johnson', '+3456789012', 'https://example.com/profiles/bob.jpg', FALSE),
('alice_williams', 'alice.williams@example.com', '$2a$12$567890abcdefghijk1234', 'Alice', 'Williams', '+4567890123', 'https://example.com/profiles/alice.jpg', FALSE),
('michael_brown', 'michael.brown@example.com', '$2a$12$90abcdefghijk12345678', 'Michael', 'Brown', '+5678901234', 'https://example.com/profiles/michael.jpg', TRUE),
('sarah_davis', 'sarah.davis@example.com', '$2a$12$efghijk1234567890abcd', 'Sarah', 'Davis', '+6789012345', 'https://example.com/profiles/sarah.jpg', FALSE),
('david_miller', 'david.miller@example.com', '$2a$12$34567890abcdefghijk12', 'David', 'Miller', '+7890123456', 'https://example.com/profiles/david.jpg', TRUE),
('emma_wilson', 'emma.wilson@example.com', '$2a$12$cdefghijk1234567890ab', 'Emma', 'Wilson', '+8901234567', 'https://example.com/profiles/emma.jpg', FALSE),
('james_taylor', 'james.taylor@example.com', '$2a$12$fghijk1234567890abcde', 'James', 'Taylor', '+9012345678', 'https://example.com/profiles/james.jpg', TRUE),
('olivia_anderson', 'olivia.anderson@example.com', '$2a$12$ijk1234567890abcdefgh', 'Olivia', 'Anderson', '+0123456789', 'https://example.com/profiles/olivia.jpg', FALSE);

-- Seed CancellationPolicy data
INSERT INTO cancellation_policy (name, description, refund_percentage, cutoff_days)
VALUES
('Flexible', 'Full refund if cancelled at least 24 hours before check-in', 100, 1),
('Moderate', 'Full refund if cancelled at least 5 days before check-in', 100, 5),
('Strict', 'Full refund if cancelled within 48 hours of booking and at least 14 days before check-in', 100, 14),
('Non-refundable', 'No refunds for cancellations', 0, 0),
('Super Strict', 'Full refund if cancelled at least 30 days before check-in', 100, 30);

-- Seed PropertyType data
INSERT INTO property_type (name, description)
VALUES
('Apartment', 'A residential unit in a building with multiple units'),
('House', 'A standalone residential building'),
('Condo', 'An individually owned unit in a building or community with shared common areas'),
('Villa', 'A luxury standalone house, often with amenities like a pool'),
('Cabin', 'A small house made of wood in a rural area'),
('Cottage', 'A small, cozy house typically in a rural or semi-rural location'),
('Tiny House', 'A very small house, typically less than 400 square feet'),
('Loft', 'An open-concept apartment, typically in a converted industrial building'),
('Guesthouse', 'A separate living space on the same property as a main house'),
('Treehouse', 'A structure built in the trees, often for recreational purposes');

-- Seed RoomType data
INSERT INTO room_type (name, description)
VALUES
('Entire Place', 'Guests have the whole place to themselves'),
('Private Room', 'Guests have their own private room for sleeping'),
('Shared Room', 'Guests share the sleeping space with others');

-- Seed City data
INSERT INTO city (name, state, country)
VALUES
('New York', 'NY', 'USA'),
('Los Angeles', 'CA', 'USA'),
('San Francisco', 'CA', 'USA'),
('Miami', 'FL', 'USA'),
('Chicago', 'IL', 'USA'),
('London', NULL, 'UK'),
('Paris', NULL, 'France'),
('Rome', NULL, 'Italy'),
('Barcelona', NULL, 'Spain'),
('Tokyo', NULL, 'Japan');

-- Seed Address data
INSERT INTO address (street_address, city_id, zip_code, latitude, longitude)
VALUES
('123 Main St', 1, '10001', 40.7128, -74.0060),
('456 Ocean Ave', 2, '90001', 34.0522, -118.2437),
('789 Market St', 3, '94103', 37.7749, -122.4194),
('101 Beach Rd', 4, '33139', 25.7617, -80.1918),
('202 Lake Shore Dr', 5, '60601', 41.8781, -87.6298),
('303 Baker St', 6, 'NW1 6XE', 51.5074, -0.1278),
('404 Champs-Élysées', 7, '75008', 48.8566, 2.3522),
('505 Via del Corso', 8, '00187', 41.9028, 12.4964),
('606 La Rambla', 9, '08002', 41.3851, 2.1734),
('707 Shibuya Crossing', 10, '150-0041', 35.6762, 139.6503),
('111 Park Ave', 1, '10002', 40.7142, -74.0064),
('222 Sunset Blvd', 2, '90002', 34.0535, -118.2453),
('333 Golden Gate Ave', 3, '94102', 37.7739, -122.4197),
('444 Palm Dr', 4, '33140', 25.7627, -80.1928),
('555 Michigan Ave', 5, '60602', 41.8791, -87.6308);

-- Seed Property data
INSERT INTO property (host_id, title, description, property_type_id, room_type_id, address_id, price_per_night, cleaning_fee, service_fee, max_guests, bedrooms, beds, bathrooms, house_rules, cancellation_policy_id)
VALUES
(1, 'Cozy Manhattan Apartment', 'Charming apartment in the heart of Manhattan with great views.', 1, 1, 1, 150.00, 50.00, 30.00, 2, 1, 1, 1.0, 'No smoking. No pets.', 1),
(2, 'Luxury Beach House in LA', 'Beautiful beach house with ocean views and private access to the beach.', 2, 1, 2, 350.00, 100.00, 70.00, 6, 3, 4, 2.5, 'No parties. Quiet hours after 10pm.', 2),
(5, 'Modern SF Condo', 'Modern condo in downtown San Francisco with city views.', 3, 1, 3, 200.00, 75.00, 40.00, 4, 2, 2, 2.0, 'No smoking. Pets allowed with deposit.', 1),
(1, 'Beachfront Miami Villa', 'Luxurious villa with private pool and beach access.', 4, 1, 4, 500.00, 150.00, 100.00, 8, 4, 5, 3.5, 'No parties. No smoking indoors.', 3),
(7, 'Downtown Chicago Loft', 'Spacious loft in downtown Chicago with skyline views.', 8, 1, 5, 180.00, 60.00, 36.00, 3, 1, 2, 1.0, 'No pets. No smoking.', 2),
(9, 'Historic London Flat', 'Charming flat in historic London building near attractions.', 1, 1, 6, 220.00, 80.00, 44.00, 4, 2, 2, 1.5, 'No parties. Quiet hours after 11pm.', 1),
(2, 'Parisian Studio near Eiffel Tower', 'Cozy studio with views of the Eiffel Tower.', 1, 1, 7, 190.00, 70.00, 38.00, 2, 0, 1, 1.0, 'No smoking. No pets.', 2),
(5, 'Roman Apartment near Colosseum', 'Authentic Roman apartment walking distance to the Colosseum.', 1, 1, 8, 170.00, 60.00, 34.00, 3, 1, 2, 1.0, 'No parties. Respect neighbors.', 1),
(7, 'Barcelona Penthouse with Terrace', 'Stunning penthouse with private terrace and city views.', 3, 1, 9, 280.00, 90.00, 56.00, 4, 2, 3, 2.0, 'No smoking indoors. No loud music after 10pm.', 3),
(9, 'Tokyo Modern Apartment', 'Sleek, modern apartment in the heart of Tokyo.', 1, 1, 10, 210.00, 75.00, 42.00, 3, 1, 2, 1.0, 'No shoes indoors. No smoking.', 2),
(1, 'Private Room in Manhattan', 'Private room in shared apartment in Manhattan.', 1, 2, 11, 80.00, 30.00, 16.00, 1, 1, 1, 1.0, 'No overnight guests. Quiet hours after 10pm.', 1),
(2, 'Guest Suite in LA Home', 'Private guest suite with separate entrance in Los Angeles home.', 9, 2, 12, 120.00, 40.00, 24.00, 2, 1, 1, 1.0, 'No smoking. No pets.', 1),
(5, 'Room with Golden Gate View', 'Private room with stunning Golden Gate Bridge views.', 1, 2, 13, 100.00, 35.00, 20.00, 2, 1, 1, 1.0, 'No smoking. Quiet hours after 11pm.', 2),
(7, 'Beachside Room in Miami', 'Private room steps from Miami Beach.', 2, 2, 14, 90.00, 30.00, 18.00, 2, 1, 1, 1.0, 'No parties. No smoking indoors.', 1),
(9, 'Downtown Chicago Private Room', 'Comfortable private room in downtown Chicago apartment.', 1, 2, 15, 85.00, 30.00, 17.00, 1, 1, 1, 1.0, 'No pets. Quiet hours after 10pm.', 1);

-- Seed PropertyImage data
INSERT INTO property_image (property_id, image_url, caption, is_primary)
VALUES
(1, 'https://example.com/properties/1/image1.jpg', 'Living room with city view', TRUE),
(1, 'https://example.com/properties/1/image2.jpg', 'Bedroom with queen bed', FALSE),
(1, 'https://example.com/properties/1/image3.jpg', 'Modern bathroom', FALSE),
(2, 'https://example.com/properties/2/image1.jpg', 'Beachfront view', TRUE),
(2, 'https://example.com/properties/2/image2.jpg', 'Spacious living room', FALSE),
(2, 'https://example.com/properties/2/image3.jpg', 'Master bedroom', FALSE),
(2, 'https://example.com/properties/2/image4.jpg', 'Kitchen with island', FALSE),
(3, 'https://example.com/properties/3/image1.jpg', 'Modern living space', TRUE),
(3, 'https://example.com/properties/3/image2.jpg', 'City view from balcony', FALSE),
(4, 'https://example.com/properties/4/image1.jpg', 'Villa exterior with pool', TRUE),
(4, 'https://example.com/properties/4/image2.jpg', 'Luxurious master bedroom', FALSE),
(5, 'https://example.com/properties/5/image1.jpg', 'Loft living area', TRUE),
(6, 'https://example.com/properties/6/image1.jpg', 'Charming London flat', TRUE),
(7, 'https://example.com/properties/7/image1.jpg', 'Studio with Eiffel Tower view', TRUE),
(8, 'https://example.com/properties/8/image1.jpg', 'Roman apartment interior', TRUE),
(9, 'https://example.com/properties/9/image1.jpg', 'Penthouse terrace view', TRUE),
(10, 'https://example.com/properties/10/image1.jpg', 'Modern Tokyo apartment', TRUE),
(11, 'https://example.com/properties/11/image1.jpg', 'Private room in Manhattan', TRUE),
(12, 'https://example.com/properties/12/image1.jpg', 'Guest suite entrance', TRUE),
(13, 'https://example.com/properties/13/image1.jpg', 'Room with bridge view', TRUE),
(14, 'https://example.com/properties/14/image1.jpg', 'Beachside room', TRUE),
(15, 'https://example.com/properties/15/image1.jpg', 'Downtown private room', TRUE);

-- Seed Amenity data
INSERT INTO amenity (name, description, icon)
VALUES
('WiFi', 'High-speed wireless internet', 'wifi-icon'),
('Kitchen', 'Space where guests can cook their own meals', 'kitchen-icon'),
('Free Parking', 'Free parking on premises', 'parking-icon'),
('Pool', 'Private or shared swimming pool', 'pool-icon'),
('Hot Tub', 'Private or shared hot tub', 'hot-tub-icon'),
('Air Conditioning', 'Central or unit-based cooling system', 'ac-icon'),
('Heating', 'Central or unit-based heating system', 'heating-icon'),
('Washer', 'Washing machine for clothes', 'washer-icon'),
('Dryer', 'Clothes dryer', 'dryer-icon'),
('TV', 'Television with standard cable', 'tv-icon'),
('Iron', 'Iron for pressing clothes', 'iron-icon'),
('Hairdryer', 'Hairdryer for guest use', 'hairdryer-icon'),
('Workspace', 'Dedicated space for working', 'workspace-icon'),
('Gym', 'Private or shared fitness facility', 'gym-icon'),
('Breakfast', 'Breakfast is provided', 'breakfast-icon');

-- Seed PropertyAmenity data
INSERT INTO property_amenity (property_id, amenity_id)
VALUES
(1, 1), (1, 2), (1, 6), (1, 7), (1, 10), (1, 12),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12),
(3, 1), (3, 2), (3, 6), (3, 7), (3, 10), (3, 13),
(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 14),
(5, 1), (5, 2), (5, 6), (5, 7), (5, 10), (5, 13),
(6, 1), (6, 2), (6, 7), (6, 10), (6, 11), (6, 12),
(7, 1), (7, 2), (7, 6), (7, 7), (7, 10), (7, 12),
(8, 1), (8, 2), (8, 6), (8, 7), (8, 10), (8, 12), (8, 15),
(9, 1), (9, 2), (9, 6), (9, 7), (9, 8), (9, 9), (9, 10), (9, 13),
(10, 1), (10, 2), (10, 6), (10, 7), (10, 10), (10, 12),
(11, 1), (11, 7), (11, 10), (11, 12),
(12, 1), (12, 6), (12, 7), (12, 10), (12, 12),
(13, 1), (13, 7), (13, 10), (13, 12),
(14, 1), (14, 6), (14, 7), (14, 10), (14, 12),
(15, 1), (15, 7), (15, 10), (15, 12);

-- Seed Availability data (for next 30 days)
-- Using a procedure to generate availability data
DELIMITER //
CREATE PROCEDURE generate_availability()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 0;
    DECLARE current_date DATE;
    
    WHILE i <= 15 DO
        SET j = 0;
        WHILE j < 30 DO
            SET current_date = DATE_ADD(CURRENT_DATE, INTERVAL j DAY);
            
            -- Randomly make some dates unavailable
            IF RAND() < 0.8 THEN
                INSERT INTO availability (property_id, date, is_available, special_price)
                VALUES (i, current_date, TRUE, 
                    -- Randomly apply special pricing to some dates
                    CASE WHEN RAND() < 0.3 
                         THEN (SELECT price_per_night * (0.9 + (RAND() * 0.4)) FROM property WHERE property_id = i)
                         ELSE NULL
                    END
                );
            ELSE
                INSERT INTO availability (property_id, date, is_available, special_price)
                VALUES (i, current_date, FALSE, NULL);
            END IF;
            
            SET j = j + 1;
        END WHILE;
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Call the procedure
CALL generate_availability();

-- Drop the procedure
DROP PROCEDURE generate_availability;

-- Seed Booking data
INSERT INTO booking (property_id, guest_id, check_in_date, check_out_date, number_of_guests, total_price, booking_status)
VALUES
(1, 3, DATE_ADD(CURRENT_DATE, INTERVAL 5 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 8 DAY), 2, 600.00, 'confirmed'),
(2, 4, DATE_ADD(CURRENT_DATE, INTERVAL 10 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY), 4, 2100.00, 'confirmed'),
(3, 6, DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 10 DAY), 3, 795.00, 'confirmed'),
(4, 8, DATE_ADD(CURRENT_DATE, INTERVAL 15 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 20 DAY), 6, 3250.00, 'confirmed'),
(5, 10, DATE_ADD(CURRENT_DATE, INTERVAL 3 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 6 DAY), 2, 654.00, 'confirmed'),
(6, 3, DATE_ADD(CURRENT_DATE, INTERVAL -10 DAY), DATE_ADD(CURRENT_DATE, INTERVAL -5 DAY), 3, 1320.00, 'completed'),
(7, 4, DATE_ADD(CURRENT_DATE, INTERVAL -15 DAY), DATE_ADD(CURRENT_DATE, INTERVAL -10 DAY), 2, 1140.00, 'completed'),
(8, 6, DATE_ADD(CURRENT_DATE, INTERVAL -8 DAY), DATE_ADD(CURRENT_DATE, INTERVAL -5 DAY), 2, 612.00, 'completed'),
(9, 8, DATE_ADD(CURRENT_DATE, INTERVAL -20 DAY), DATE_ADD(CURRENT_DATE, INTERVAL -15 DAY), 3, 1680.00, 'completed'),
(10, 10, DATE_ADD(CURRENT_DATE, INTERVAL -12 DAY), DATE_ADD(CURRENT_DATE, INTERVAL -8 DAY), 2, 1008.00, 'completed'),
(11, 3, DATE_ADD(CURRENT_DATE, INTERVAL 20 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 25 DAY), 1, 480.00, 'confirmed'),
(12, 4, DATE_ADD(CURRENT_DATE, INTERVAL 12 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 14 DAY), 2, 328.00, 'confirmed'),
(13, 6, DATE_ADD(CURRENT_DATE, INTERVAL -3 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 2 DAY), 1, 500.00, 'cancelled'),
(14, 8, DATE_ADD(CURRENT_DATE, INTERVAL -5 DAY), DATE_ADD(CURRENT_DATE, INTERVAL -2 DAY), 2, 324.00, 'completed'),
(15, 10, DATE_ADD(CURRENT_DATE, INTERVAL 25 DAY), DATE_ADD(CURRENT_DATE, INTERVAL 28 DAY), 1, 306.00, 'pending');

-- Update availability for booked dates
UPDATE availability
SET is_available = FALSE
WHERE (property_id, date) IN (
    SELECT property_id, date_range.date
    FROM booking
    JOIN (
        SELECT a.date
        FROM (
            SELECT ADDDATE('1970-01-01', t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) as date
            FROM
                (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
                (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
                (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
                (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
                (SELECT 0 AS i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4
        ) a
        WHERE a.date BETWEEN 
            (SELECT MIN(check_in_date) FROM booking) AND 
            (SELECT MAX(check_out_date) FROM booking)
    ) date_range
    WHERE date_range.date >= booking.check_in_date AND date_range.date < booking.check_out_date
);

-- Seed Payment data
INSERT INTO payment (booking_id, amount, currency, payment_status, payment_method, transaction_id)
VALUES
(1, 600.00, 'USD', 'completed', 'credit_card', 'txn_1234567890'),
(2, 2100.00, 'USD', 'completed', 'credit_card', 'txn_2345678901'),
(3, 795.00, 'USD', 'completed', 'paypal', 'txn_3456789012'),
(4, 3250.00, 'USD', 'completed', 'credit_card', 'txn_4567890123'),
(5, 654.00, 'USD', 'completed', 'credit_card', 'txn_5678901234'),
(6, 1320.00, 'USD', 'completed', 'paypal', 'txn_6789012345'),
(7, 1140.00, 'USD', 'completed', 'credit_card', 'txn_7890123456'),
(8, 612.00, 'USD', 'completed', 'credit_card', 'txn_8901234567'),
(9, 1680.00, 'USD', 'completed', 'paypal', 'txn_9012345678'),
(10, 1008.00, 'USD', 'completed', 'credit_card', 'txn_0123456789'),
(11, 480.00, 'USD', 'completed', 'credit_card', 'txn_1234509876'),
(12, 328.00, 'USD', 'completed', 'paypal', 'txn_2345098765'),
(13, 500.00, 'USD', 'refunded', 'credit_card', 'txn_3450987654'),
(14, 324.00, 'USD', 'completed', 'credit_card', 'txn_4509876543'),
(15, 306.00, 'USD', 'pending', 'credit_card', 'txn_5098765432');

-- Seed Review data
INSERT INTO review (booking_id, reviewer_id, property_id, rating, comment, cleanliness_rating, communication_rating, check_in_rating, accuracy_rating, location_rating, value_rating)
VALUES
(6, 3, 6, 4.5, 'Great location and very comfortable flat. Would stay again!', 5, 4, 5, 4, 5, 4),
(7, 4, 7, 5.0, 'Amazing view of the Eiffel Tower! The host was very accommodating.', 5, 5, 5, 5, 5, 5),
(8, 6, 8, 4.0, 'Authentic Roman experience. The apartment was a bit smaller than expected but very clean.', 5, 4, 4, 3, 5, 3),
(9, 8, 9, 4.8, 'The terrace view was incredible! Perfect location for exploring Barcelona.', 5, 5, 4, 5, 5, 5),
(10, 10, 10, 4.2, 'Very clean and modern apartment. Great location in Tokyo.', 5, 4, 4, 5, 4, 3),
(14, 8, 14, 3.8, 'Nice room close to the beach. A bit noisy at night.', 4, 4, 4, 4, 3, 4);

-- Seed Message data
INSERT INTO message (sender_id, receiver_id, property_id, booking_id, content, is_read)
VALUES
(3, 1, 1, 1, 'Hi, I have a question about parking near your apartment.', TRUE),
(1, 3, 1, 1, 'Street parking is available, but there\'s also a garage two blocks away that charges $20/day.', TRUE),
(3, 1, 1, 1, 'Great, thanks for the information!', TRUE),
(4, 2, 2, 2, 'Is early check-in possible on Friday?', TRUE),
(2, 4, 2, 2, 'Yes, you can check in anytime after 1pm.', TRUE),
(6, 5, 3, 3, 'Do you provide toiletries?', TRUE),
(5, 6, 3, 3, 'Yes, we provide shampoo, conditioner, body wash, and towels.', TRUE),
(8, 7, 4, 4, 'Is the pool heated?', FALSE),
(10, 9, 5, 5, 'What\'s the WiFi password?', FALSE),
(3, 1, 6, 6, 'Thanks for the great stay!', TRUE),
(1, 3, 6, 6, 'You\'re welcome! Hope to host you again soon.', TRUE),
(4, 2, 7, 7, 'The view was amazing! Thank you.', TRUE),
(6, 5, 8, 8, 'We left the keys on the table as instructed.', TRUE),
(8, 7, 9, 9, 'Do you have recommendations for restaurants nearby?', TRUE),
(7, 8, 9, 9, 'Yes, try Tapas Bar on the corner and Seafood Palace two blocks east.', TRUE);

-- Seed Wishlist data
INSERT INTO wishlist (user_id, name)
VALUES
(3, 'Dream Vacations'),
(3, 'Business Trips'),
(4, 'Summer Getaways'),
(6, 'City Explorations'),
(8, 'Romantic Weekends'),
(10, 'Family Trips');

-- Seed WishlistItem data
INSERT INTO wishlist_item (wishlist_id, property_id)
VALUES
(1, 2),
(1, 4),
(1, 9),
(2, 1),
(2, 3),
(2, 5),
(3, 2),
(3, 4),
(3, 14),
(4, 6),
(4, 8),
(4, 10),
(5, 7),
(5, 9),
(6, 2),
(6, 4),
(6, 15);