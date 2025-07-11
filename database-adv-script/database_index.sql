-- =======================================================
-- 📌 Step 1: Identify High-Usage Columns
-- These columns are used frequently in WHERE, JOIN, ORDER BY
-- Based on previous queries and analysis
-- =======================================================

-- USERS table:
-- - user_id: used in JOINs with bookings

-- BOOKINGS table:
-- - user_id: used in JOINs with users
-- - property_id: used in JOINs with properties
-- - booking_date: used in WHERE and ORDER BY

-- PROPERTIES table:
-- - property_id: used in JOINs with bookings and reviews
-- - title: sometimes used in ORDER BY

-- REVIEWS table:
-- - property_id: used in JOINs and GROUP BY

-- =======================================================
-- 📌 Step 2: CREATE INDEX commands
-- Run these once to improve performance on joins and filters
-- Save this block in your database_index.sql
-- =======================================================

-- USERS
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);

-- BOOKINGS
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_date ON bookings(booking_date);

-- PROPERTIES
CREATE INDEX IF NOT EXISTS idx_properties_property_id ON properties(property_id);
CREATE INDEX IF NOT EXISTS idx_properties_title ON properties(title);

-- REVIEWS
CREATE INDEX IF NOT EXISTS idx_reviews_property_id ON reviews(property_id);

-- =======================================================
-- 📌 Step 3: Test Queries with EXPLAIN ANALYZE (Before & After)
-- Use these to measure execution time and confirm index usage
-- =======================================================

-- Query 1: JOIN bookings and users
EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.booking_date,
  u.name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.booking_date >= '2025-01-01'
ORDER BY b.booking_date DESC;

-- Query 2: COUNT bookings per property
EXPLAIN ANALYZE
SELECT 
  property_id,
  COUNT(*) AS total_bookings
FROM bookings
GROUP BY property_id
ORDER BY total_bookings DESC;

-- Query 3: JOIN properties and reviews
EXPLAIN ANALYZE
SELECT 
  p.title,
  r.rating,
  r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.title ASC;
