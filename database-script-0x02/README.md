# Airbnb Database Seeding Script

## Objective

This script populates the Airbnb database with realistic sample data for testing and demonstration purposes. It ensures all key tables — such as `users`, `properties`, `bookings`, and `reviews` — are filled with valid records that reflect real-world scenarios.

---

## Files

- `schema.sql`: Defines the structure of the database (tables, constraints, keys).
- `seed.sql`: Contains SQL `INSERT` statements to add sample data into the database.

---

## Sample Data Overview

### 1. Users
- Includes both **hosts** and **guests**
- Fields: `user_id`, `first_name`, `last_name`, `email`, `phone_number`, `role`, etc.

### 2. Properties
- Listings added by hosts
- Fields: `property_id`, `host_id`, `title`, `description`, `address`, `city`, `price_per_night`, etc.

### 3. Bookings
- Reservations made by guests for available properties
- Fields: `booking_id`, `guest_id`, `property_id`, `start_date`, `end_date`, `total_price`, etc.

### 4. Reviews
- Feedback from guests after completed bookings
- Fields: `review_id`, `booking_id`, `rating`, `comment`

---

## How to Use

1. **Ensure your database schema is already created:**

   ```bash
   psql -U your_user -d airbnb -f schema.sql

