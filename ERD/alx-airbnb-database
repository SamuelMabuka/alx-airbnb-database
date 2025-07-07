# Database Normalization to 3NF

## Objective

Ensure that the Airbnb database schema follows the principles of Third Normal Form (3NF) to eliminate redundancy and maintain data integrity.

---

## Step-by-Step Normalization Process

### 1. First Normal Form (1NF)

- All attributes have atomic values.
- No repeating groups.
- Each table has a defined primary key.

### 2. Second Normal Form (2NF)

- In 1NF.
- No partial dependencies (non-key attributes depend on the full primary key).

### 3. Third Normal Form (3NF)

- In 2NF.
- No transitive dependencies (non-key attributes depend only on the primary key).

---

## Example Fixes

- Moved `city_name` into a `City` table instead of repeating it in `Property`.
- Created `PropertyAmenities` as a join table to avoid repeating multiple amenities in one field.
- Separated `Payment` info from `Booking` into its own table to remove transitive dependency.

---

## Result

All tables now conform to 3NF. The schema is clean, efficient, and normalized.

---

## Author

Samuel Mabuka  
July 2025
