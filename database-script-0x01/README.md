# Database Schema for Airbnb-like Application

This directory contains the SQL script to create the database schema for an Airbnb-like application.

## Schema Design

The database schema is designed following the principles of normalization (up to 3NF) and includes the following tables:

1. **user_account**: Stores user information
2. **property_type**: Standardizes property types
3. **room_type**: Standardizes room types
4. **cancellation_policy**: Standardizes cancellation policies
5. **city**: Stores city information
6. **address**: Stores property location details
7. **property**: Core property listing information
8. **availability**: Calendar of available dates for properties
9. **property_image**: Images associated with properties
10. **amenity**: List of possible amenities
11. **property_amenity**: Junction table linking properties to amenities
12. **booking**: Reservation information
13. **review**: Guest feedback with detailed ratings
14. **payment**: Transaction details
15. **message**: Communication between users
16. **wishlist**: Collections of saved properties
17. **wishlist_item**: Junction table linking wishlists to properties

## Key Features

- **Proper Data Types**: Each column uses the appropriate data type for optimal storage and performance
- **Primary Keys**: All tables have properly defined primary keys
- **Foreign Keys**: Relationships between tables are enforced with foreign key constraints
- **Indexes**: Strategic indexes are created for columns frequently used in WHERE clauses and joins
- **Constraints**: Check constraints ensure data integrity (e.g., valid date ranges, rating values)
- **Triggers**: Automatic timestamp updates for relevant tables

## Usage

To create the database schema:

1. Connect to your MySQL/MariaDB server
2. Create a new database: `CREATE DATABASE airbnb;`
3. Use the database: `USE airbnb;`
4. Run the schema.sql script: `SOURCE schema.sql;`

## Notes

- The script includes DROP TABLE statements to allow clean recreation of the schema
- Tables are created in an order that respects foreign key constraints
- ENUM types are used for fields with a fixed set of possible values
- Decimal types are used for monetary values to ensure precision