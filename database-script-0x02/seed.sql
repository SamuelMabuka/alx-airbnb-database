-- Create User table
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(10) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-1', 'Alice', 'Wanjiru', 'alice@example.com', 'hashed_pw1', '0700111222', 'host'),
  ('uuid-2', 'Brian', 'Otieno', 'brian@example.com', 'hashed_pw2', '0700333444', 'guest'),
  ('uuid-3', 'Clara', 'Mutiso', 'clara@example.com', 'hashed_pw3', '0700555666', 'guest');

-- Create Property table
CREATE TABLE properties (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    address VARCHAR(255),
    city VARCHAR(100),
    price_per_night DECIMAL(10, 2) NOT NULL,
    max_guests INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
);

INSERT INTO properties (property_id, host_id, title, description, address, city, price_per_night, max_guests)
VALUES
  ('prop-1', 'uuid-1', 'Cozy Nairobi Apartment', 'Modern 2-bedroom with fast WiFi', '123 Kenyatta Ave', 'Nairobi', 55.00, 4),
  ('prop-2', 'uuid-1', 'Beachside Villa', 'Ocean view with private beach access', 'Diani Beach Rd', 'Mombasa', 150.00, 6);

-- Create Booking table
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    guest_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES users(user_id),
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
);

INSERT INTO bookings (booking_id, guest_id, property_id, start_date, end_date, total_price, status)
VALUES
  ('book-1', 'uuid-2', 'prop-1', '2025-07-15', '2025-07-20', 275.00, 'confirmed'),
  ('book-2', 'uuid-3', 'prop-2', '2025-08-01', '2025-08-07', 900.00, 'confirmed');

-- Create Review table
CREATE TABLE reviews (
    review_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

INSERT INTO reviews (review_id, booking_id, rating, comment)
VALUES
  ('rev-1', 'book-1', 5, 'Amazing stay! Very clean and well located.'),
  ('rev-2', 'book-2', 4, 'Beautiful views, but the WiFi was a bit slow.');

-- Indexes
CREATE INDEX idx_property_city ON properties(city);
CREATE INDEX idx_user_role ON users(role);
CREATE INDEX idx_booking_dates ON bookings(start_date, end_date);
