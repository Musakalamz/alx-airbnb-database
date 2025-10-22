# Airbnb Database - Entity Relationship Requirements

## Entities

### 1. User
- **user_id** (Primary Key): Unique identifier for each user
- **username**: User's chosen username
- **email**: User's email address
- **password_hash**: Hashed password for security
- **first_name**: User's first name
- **last_name**: User's last name
- **phone_number**: Contact number
- **profile_picture**: URL to profile image
- **is_host**: Boolean indicating if user can host properties
- **created_at**: Timestamp of account creation
- **updated_at**: Timestamp of last account update

### 2. Property
- **property_id** (Primary Key): Unique identifier for each property
- **host_id** (Foreign Key): References User.user_id
- **title**: Property listing title
- **description**: Detailed property description
- **property_type**: Type of property (apartment, house, etc.)
- **room_type**: Type of room (entire place, private room, shared room)
- **address**: Property address
- **city**: City location
- **state**: State/province location
- **country**: Country location
- **zip_code**: Postal/zip code
- **latitude**: Geographic coordinate
- **longitude**: Geographic coordinate
- **price_per_night**: Base price per night
- **cleaning_fee**: Additional cleaning fee
- **service_fee**: Service fee
- **max_guests**: Maximum number of guests allowed
- **bedrooms**: Number of bedrooms
- **beds**: Number of beds
- **bathrooms**: Number of bathrooms
- **amenities**: List of available amenities
- **house_rules**: Rules for the property
- **cancellation_policy**: Cancellation policy details
- **availability_calendar**: Calendar showing available dates
- **created_at**: Timestamp of listing creation
- **updated_at**: Timestamp of last listing update

### 3. Property_Image
- **image_id** (Primary Key): Unique identifier for each image
- **property_id** (Foreign Key): References Property.property_id
- **image_url**: URL to the property image
- **caption**: Optional image description
- **is_primary**: Boolean indicating if this is the main property image
- **created_at**: Timestamp of image upload

### 4. Review
- **review_id** (Primary Key): Unique identifier for each review
- **booking_id** (Foreign Key): References Booking.booking_id
- **reviewer_id** (Foreign Key): References User.user_id
- **property_id** (Foreign Key): References Property.property_id
- **rating**: Numerical rating (e.g., 1-5)
- **comment**: Review text
- **cleanliness_rating**: Rating for cleanliness
- **communication_rating**: Rating for host communication
- **check_in_rating**: Rating for check-in experience
- **accuracy_rating**: Rating for listing accuracy
- **location_rating**: Rating for location
- **value_rating**: Rating for value
- **created_at**: Timestamp of review submission
- **updated_at**: Timestamp of last review update

### 5. Booking
- **booking_id** (Primary Key): Unique identifier for each booking
- **property_id** (Foreign Key): References Property.property_id
- **guest_id** (Foreign Key): References User.user_id
- **check_in_date**: Start date of stay
- **check_out_date**: End date of stay
- **number_of_guests**: Number of guests for this booking
- **total_price**: Total price including all fees
- **booking_status**: Status (pending, confirmed, cancelled, completed)
- **created_at**: Timestamp of booking creation
- **updated_at**: Timestamp of last booking update

### 6. Payment
- **payment_id** (Primary Key): Unique identifier for each payment
- **booking_id** (Foreign Key): References Booking.booking_id
- **amount**: Payment amount
- **currency**: Currency code (USD, EUR, etc.)
- **payment_status**: Status (pending, completed, failed, refunded)
- **payment_method**: Method used (credit card, PayPal, etc.)
- **transaction_id**: External payment processor transaction ID
- **created_at**: Timestamp of payment processing

### 7. Message
- **message_id** (Primary Key): Unique identifier for each message
- **sender_id** (Foreign Key): References User.user_id
- **receiver_id** (Foreign Key): References User.user_id
- **property_id** (Foreign Key): References Property.property_id (optional)
- **booking_id** (Foreign Key): References Booking.booking_id (optional)
- **content**: Message text
- **is_read**: Boolean indicating if message has been read
- **created_at**: Timestamp of message sending

### 8. Wishlist
- **wishlist_id** (Primary Key): Unique identifier for each wishlist
- **user_id** (Foreign Key): References User.user_id
- **name**: Name of the wishlist
- **created_at**: Timestamp of wishlist creation
- **updated_at**: Timestamp of last wishlist update

### 9. Wishlist_Item
- **wishlist_item_id** (Primary Key): Unique identifier for each wishlist item
- **wishlist_id** (Foreign Key): References Wishlist.wishlist_id
- **property_id** (Foreign Key): References Property.property_id
- **added_at**: Timestamp when property was added to wishlist

## Relationships

1. **User to Property**: One-to-Many (A user can host multiple properties)
2. **Property to Property_Image**: One-to-Many (A property can have multiple images)
3. **User to Booking (as guest)**: One-to-Many (A user can make multiple bookings)
4. **Property to Booking**: One-to-Many (A property can have multiple bookings)
5. **Booking to Payment**: One-to-One (Each booking has one payment)
6. **Booking to Review**: One-to-One (Each booking can have one review)
7. **User to Review**: One-to-Many (A user can write multiple reviews)
8. **Property to Review**: One-to-Many (A property can receive multiple reviews)
9. **User to Message (as sender)**: One-to-Many (A user can send multiple messages)
10. **User to Message (as receiver)**: One-to-Many (A user can receive multiple messages)
11. **User to Wishlist**: One-to-Many (A user can have multiple wishlists)
12. **Wishlist to Wishlist_Item**: One-to-Many (A wishlist can contain multiple properties)
13. **Property to Wishlist_Item**: One-to-Many (A property can be in multiple wishlists)

## Notes for ER Diagram
- Primary keys should be represented with PK notation
- Foreign keys should be represented with FK notation
- Relationships should show cardinality (1:1, 1:N, N:M)
- Attributes should be listed for each entity
- Optional relationships should be indicated