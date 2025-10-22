# Database Seed Data for Airbnb-like Application

This directory contains the SQL script to populate the database with sample data for an Airbnb-like application.

## Seed Data Overview

The seed script populates the following tables with realistic sample data:

1. **user_account**: 10 users with various profiles (hosts and guests)
2. **cancellation_policy**: 5 different cancellation policies
3. **property_type**: 10 different property types
4. **room_type**: 3 room types (entire place, private room, shared room)
5. **city**: 10 cities across different countries
6. **address**: 15 addresses in various cities
7. **property**: 15 properties with different characteristics
8. **property_image**: Multiple images for each property
9. **amenity**: 15 common amenities
10. **property_amenity**: Amenities assigned to properties
11. **availability**: 30 days of availability data for each property
12. **booking**: 15 bookings with different statuses
13. **payment**: Payment information for each booking
14. **review**: Reviews for completed stays
15. **message**: Communication between hosts and guests
16. **wishlist**: User-created collections of properties
17. **wishlist_item**: Properties saved to wishlists

## Data Relationships

The seed data maintains proper relationships between tables:

- Properties are linked to their hosts
- Bookings are linked to properties and guests
- Reviews are linked to bookings, properties, and reviewers
- Messages are linked to senders, receivers, properties, and bookings
- Wishlists are linked to users and properties

## Usage

To populate the database with sample data:

1. First ensure you have created the database schema using the schema.sql script
2. Connect to your MySQL/MariaDB server
3. Use the database: `USE airbnb;`
4. Run the seed.sql script: `SOURCE seed.sql;`

## Notes

- The script includes a procedure to generate availability data for the next 30 days
- Booking dates are relative to the current date
- Some bookings are in the past (completed), some in the future (confirmed/pending)
- Reviews are only created for completed bookings
- Payment statuses match booking statuses