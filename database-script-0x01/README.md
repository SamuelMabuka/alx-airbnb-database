# Airbnb Database Schema (DDL)

## Objective

This script defines the core database structure for an Airbnb-like application using SQL Data Definition Language (DDL). It includes all necessary `CREATE TABLE` statements with appropriate constraints and indexing to ensure data integrity and query performance.

---

## Files

- `schema.sql` — Contains SQL statements for creating tables, primary/foreign keys, constraints, and indexes.

---

## Tables Defined

1. **users**
   - Stores user details (guests, hosts, admins)
   - Fields: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, etc.
   - Constraints: `UNIQUE`, `NOT NULL`, `CHECK` on role
   - Indexed by role

2. **properties**
   - Stores property listings by hosts
   - Fields: `property_id`, `host_id`, `title`, `description`, `price_per_night`, etc.
   - Foreign key: `host_id` references `users(user_id)`
   - Indexed by city

3. **bookings**
   - Tracks reservations made by guests
   - Fields: `booking_id`, `guest_id`, `property_id`, `start_date`, `end_date`, etc.
   - Foreign keys: `guest_id`, `property_id`
   - Indexed by booking dates

4. **reviews**
   - Guest reviews linked to bookings
   - Fields: `review_id`, `booking_id`, `rating`, `comment`
   - Foreign key: `booking_id`

---

## Constraints & Indexing

- **Primary Keys** ensure entity uniqueness
- **Foreign Keys** maintain referential integrity
- **CHECK constraints** enforce domain rules (e.g., rating range, user roles)
- **Indexes** are added to improve lookup performance on key fields (city, role, dates)

---

## Author

Samuel Mabuka  
July 2025
