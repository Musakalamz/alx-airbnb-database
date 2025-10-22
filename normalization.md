# Database Normalization Process

This document outlines the normalization process applied to the Airbnb database design to achieve Third Normal Form (3NF).

## Initial Database Design Review

Before normalization, I identified several potential issues in the initial database design:

1. **Redundant Data**: Property information could be duplicated across multiple bookings
2. **Transitive Dependencies**: Some attributes depended on non-key attributes
3. **Multi-valued Attributes**: Amenities were stored as a list in the Property table
4. **Complex Attributes**: Address information was not properly atomized

## Normalization Steps

### First Normal Form (1NF)
To achieve 1NF, I ensured:

1. **Atomic Values**: All attributes contain only single values
   - Split the `amenities` attribute from the Property table into a separate Amenity table with a many-to-many relationship
   - Created a Property_Amenity junction table to link properties with their amenities

2. **No Repeating Groups**: Eliminated repeating groups of data
   - Moved property images from a potential array to a separate Property_Image table
   - Created a separate table for availability calendar dates instead of storing them as an array

### Second Normal Form (2NF)
To achieve 2NF, I ensured:

1. **1NF Compliance**: The database already met 1NF requirements
2. **No Partial Dependencies**: All non-key attributes depend on the entire primary key
   - Created a separate Address table to store location information, linked to Property via property_id
   - Separated review ratings into their own table to avoid partial dependencies on the composite key

### Third Normal Form (3NF)
To achieve 3NF, I ensured:

1. **2NF Compliance**: The database already met 2NF requirements
2. **No Transitive Dependencies**: No non-key attribute depends on another non-key attribute
   - Created a separate City table to avoid the dependency of city information on zip_code
   - Created a separate PropertyType table to standardize property types
   - Created a separate CancellationPolicy table to avoid redundancy in policy descriptions

## Final Normalized Schema

After normalization, the database schema includes these refined entities:

1. **User**: Contains user account information
2. **Property**: Core property listing information
3. **Address**: Property location details
4. **PropertyType**: Standardized property type definitions
5. **RoomType**: Standardized room type definitions
6. **Amenity**: List of possible amenities
7. **Property_Amenity**: Junction table linking properties to amenities
8. **Property_Image**: Images associated with properties
9. **Availability**: Calendar of available dates for properties
10. **Booking**: Reservation information
11. **Payment**: Transaction details
12. **Review**: Guest feedback with detailed ratings
13. **Message**: Communication between users
14. **Wishlist**: Collections of saved properties
15. **Wishlist_Item**: Junction table linking wishlists to properties
16. **CancellationPolicy**: Standardized cancellation policies
17. **City**: City information including state/country

## Benefits of Normalization

The normalized database design provides several advantages:

1. **Reduced Redundancy**: Data is stored in a single place, reducing update anomalies
2. **Improved Data Integrity**: Constraints ensure data consistency
3. **Efficient Storage**: Minimized duplicate data storage
4. **Flexible Querying**: Easier to construct complex queries across related tables
5. **Scalability**: Better performance as the database grows

## Conclusion

The database has been successfully normalized to 3NF, ensuring optimal data organization, minimal redundancy, and maximum data integrity while maintaining the functional requirements of the Airbnb-like application.