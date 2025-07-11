-- ==========================================
-- 🎯 Objective: Query all booking details
-- Include: user info, property info, payment info
-- ==========================================

-- Step 1: Initial Complex Query (Unoptimized)
-- Save this as the starting point for analysis

EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.name AS user_name,
  p.property_id,
  p.title AS property_title,
  pay.payment_id,
  pay.amount,
  pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- ==========================================
-- 🔍 Step 2: Performance Observations
-- Use output from EXPLAIN ANALYZE:
-- - Is there a Seq Scan?
-- - Are joins too expensive?
-- - Any missing indexes?
-- ==========================================

-- Paste your EXPLAIN ANALYZE output below:
-- e.g., Total runtime: 250ms
-- Seq Scan on bookings ...
-- Hash Join ...
-- Sort Method ...

-- ==========================================
-- ✅ Step 3: Refactored Optimized Query
-- Improvements may include:
-- - Avoiding unnecessary LEFT JOINs
-- - Filtering earlier (WHERE before JOIN)
-- - Using indexes
-- ==========================================

-- If payment info is optional, keep LEFT JOIN
-- If not, convert to INNER JOIN to improve join efficiency

EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.name AS user_name,
  p.property_id,
  p.title AS property_title,
  pay.payment_id,
  pay.amount,
  pay.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

-- Optionally add WHERE clause to reduce rows early
-- WHERE b.booking_date >= '2025-01-01'

-- ==========================================
-- 📌 Optional: Index Recommendations
-- Run these only once
-- ==========================================

-- CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
-- CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
-- CREATE INDEX IF NOT EXISTS idx_bookings_date ON bookings(booking_date);
-- CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);

