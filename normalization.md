# Database Normalization to 3NF

## Objective

Ensure that the Airbnb database schema follows the principles of Third Normal Form (3NF) to eliminate redundancy and maintain data integrity.

---

## Step-by-Step Normalization Process

### 1. First Normal Form (1NF)

- All attributes are atomic (no repeating groups).
- Each table has a primary key.

### 2. Second Normal Form (2NF)

- In 1NF.
- No partial dependencies.

### 3. Third Normal Form (3NF)

- In 2NF.
- No transitive dependencies.

## Example Fixes

- Created separate `City` table for `city_name`
- Moved amenities into `PropertyAmenities` join table
- Extracted payment info into a `Payment` table

---

## Result

Database schema is in 3NF. No redundancy. Clean relationships.

## Author

Samuel Mabuka — July 2025
