-- Airbnb Database Schema
-- This script creates the database schema for an Airbnb-like application

-- Drop tables if they exist to allow clean recreation
DROP TABLE IF EXISTS wishlist_item;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS booking;
DROP TABLE IF EXISTS property_amenity;
DROP TABLE IF EXISTS amenity;
DROP TABLE IF EXISTS property_image;
DROP TABLE IF EXISTS availability;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS property_type;
DROP TABLE IF EXISTS room_type;
DROP TABLE IF EXISTS cancellation_policy;
DROP TABLE IF EXISTS user_account;

-- Create User table
-- Stores user account information
CREATE TABLE user_account (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    profile_picture VARCHAR(255),
    is_host BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Indexes for frequent queries
    INDEX idx_user_email (email),
    INDEX idx_user_username (username)
);

-- Create CancellationPolicy table
-- Standardizes cancellation policies
CREATE TABLE cancellation_policy (
    policy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    refund_percentage INT NOT NULL,
    cutoff_days INT NOT NULL
);

-- Create PropertyType table
-- Standardizes property types
CREATE TABLE property_type (
    type_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- Create RoomType table
-- Standardizes room types
CREATE TABLE room_type (
    type_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- Create City table
-- Stores city information to avoid redundancy
CREATE TABLE city (
    city_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    country VARCHAR(100) NOT NULL,
    
    -- Ensure unique cities
    UNIQUE (name, state, country),
    
    -- Index for location searches
    INDEX idx_city_location (name, state, country)
);

-- Create Address table
-- Stores property location details
CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    street_address VARCHAR(255) NOT NULL,
    city_id INT NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    
    -- Foreign key constraints
    FOREIGN KEY (city_id) REFERENCES city(city_id),
    
    -- Index for geolocation queries
    INDEX idx_address_location (latitude, longitude)
);

-- Create Property table
-- Core property listing information
CREATE TABLE property (
    property_id SERIAL PRIMARY KEY,
    host_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    property_type_id INT NOT NULL,
    room_type_id INT NOT NULL,
    address_id INT NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    cleaning_fee DECIMAL(10, 2) DEFAULT 0,
    service_fee DECIMAL(10, 2) DEFAULT 0,
    max_guests INT NOT NULL,
    bedrooms INT NOT NULL,
    beds INT NOT NULL,
    bathrooms DECIMAL(3, 1) NOT NULL,
    house_rules TEXT,
    cancellation_policy_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (host_id) REFERENCES user_account(user_id),
    FOREIGN KEY (property_type_id) REFERENCES property_type(type_id),
    FOREIGN KEY (room_type_id) REFERENCES room_type(type_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (cancellation_policy_id) REFERENCES cancellation_policy(policy_id),
    
    -- Indexes for frequent queries
    INDEX idx_property_host (host_id),
    INDEX idx_property_type (property_type_id),
    INDEX idx_property_room_type (room_type_id),
    INDEX idx_property_price (price_per_night),
    INDEX idx_property_guests (max_guests)
);

-- Create Availability table
-- Calendar of available dates for properties
CREATE TABLE availability (
    availability_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    date DATE NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    special_price DECIMAL(10, 2),
    
    -- Foreign key constraints
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    
    -- Ensure unique dates per property
    UNIQUE (property_id, date),
    
    -- Index for date range queries
    INDEX idx_availability_date (property_id, date)
);

-- Create PropertyImage table
-- Images associated with properties
CREATE TABLE property_image (
    image_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    caption VARCHAR(255),
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    
    -- Index for property images
    INDEX idx_property_images (property_id)
);

-- Create Amenity table
-- List of possible amenities
CREATE TABLE amenity (
    amenity_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    icon VARCHAR(255)
);

-- Create PropertyAmenity junction table
-- Links properties to amenities
CREATE TABLE property_amenity (
    property_id INT NOT NULL,
    amenity_id INT NOT NULL,
    
    -- Primary key on both columns
    PRIMARY KEY (property_id, amenity_id),
    
    -- Foreign key constraints
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (amenity_id) REFERENCES amenity(amenity_id) ON DELETE CASCADE
);

-- Create Booking table
-- Reservation information
CREATE TABLE booking (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    guest_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    number_of_guests INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    booking_status ENUM('pending', 'confirmed', 'cancelled', 'completed') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (guest_id) REFERENCES user_account(user_id),
    
    -- Ensure check_out_date is after check_in_date
    CONSTRAINT valid_date_range CHECK (check_out_date > check_in_date),
    
    -- Indexes for frequent queries
    INDEX idx_booking_property (property_id),
    INDEX idx_booking_guest (guest_id),
    INDEX idx_booking_dates (check_in_date, check_out_date),
    INDEX idx_booking_status (booking_status)
);

-- Create Review table
-- Guest feedback with detailed ratings
CREATE TABLE review (
    review_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    reviewer_id INT NOT NULL,
    property_id INT NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    comment TEXT,
    cleanliness_rating INT NOT NULL,
    communication_rating INT NOT NULL,
    check_in_rating INT NOT NULL,
    accuracy_rating INT NOT NULL,
    location_rating INT NOT NULL,
    value_rating INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (reviewer_id) REFERENCES user_account(user_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    
    -- Ensure one review per booking
    UNIQUE (booking_id),
    
    -- Ensure ratings are between 1 and 5
    CONSTRAINT valid_rating CHECK (rating BETWEEN 1 AND 5),
    CONSTRAINT valid_cleanliness CHECK (cleanliness_rating BETWEEN 1 AND 5),
    CONSTRAINT valid_communication CHECK (communication_rating BETWEEN 1 AND 5),
    CONSTRAINT valid_check_in CHECK (check_in_rating BETWEEN 1 AND 5),
    CONSTRAINT valid_accuracy CHECK (accuracy_rating BETWEEN 1 AND 5),
    CONSTRAINT valid_location CHECK (location_rating BETWEEN 1 AND 5),
    CONSTRAINT valid_value CHECK (value_rating BETWEEN 1 AND 5),
    
    -- Indexes for frequent queries
    INDEX idx_review_property (property_id),
    INDEX idx_review_rating (rating)
);

-- Create Payment table
-- Transaction details
CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD',
    payment_status ENUM('pending', 'completed', 'failed', 'refunded') NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    transaction_id VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    
    -- Ensure one payment per booking
    UNIQUE (booking_id),
    
    -- Indexes for frequent queries
    INDEX idx_payment_status (payment_status)
);

-- Create Message table
-- Communication between users
CREATE TABLE message (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    property_id INT,
    booking_id INT,
    content TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (sender_id) REFERENCES user_account(user_id),
    FOREIGN KEY (receiver_id) REFERENCES user_account(user_id),
    FOREIGN KEY (property_id) REFERENCES property(property_id),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    
    -- Indexes for frequent queries
    INDEX idx_message_sender (sender_id),
    INDEX idx_message_receiver (receiver_id),
    INDEX idx_message_property (property_id),
    INDEX idx_message_booking (booking_id),
    INDEX idx_message_created (created_at)
);

-- Create Wishlist table
-- Collections of saved properties
CREATE TABLE wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (user_id) REFERENCES user_account(user_id),
    
    -- Indexes for frequent queries
    INDEX idx_wishlist_user (user_id)
);

-- Create WishlistItem junction table
-- Links wishlists to properties
CREATE TABLE wishlist_item (
    wishlist_item_id SERIAL PRIMARY KEY,
    wishlist_id INT NOT NULL,
    property_id INT NOT NULL,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign key constraints
    FOREIGN KEY (wishlist_id) REFERENCES wishlist(wishlist_id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES property(property_id) ON DELETE CASCADE,
    
    -- Ensure unique property per wishlist
    UNIQUE (wishlist_id, property_id),
    
    -- Indexes for frequent queries
    INDEX idx_wishlist_item_property (property_id)
);

-- Create triggers to automatically update timestamps
DELIMITER //

-- Update property updated_at timestamp
CREATE TRIGGER update_property_timestamp
BEFORE UPDATE ON property
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//

-- Update user_account updated_at timestamp
CREATE TRIGGER update_user_timestamp
BEFORE UPDATE ON user_account
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//

-- Update booking updated_at timestamp
CREATE TRIGGER update_booking_timestamp
BEFORE UPDATE ON booking
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//

-- Update review updated_at timestamp
CREATE TRIGGER update_review_timestamp
BEFORE UPDATE ON review
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//

-- Update wishlist updated_at timestamp
CREATE TRIGGER update_wishlist_timestamp
BEFORE UPDATE ON wishlist
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//

DELIMITER ;