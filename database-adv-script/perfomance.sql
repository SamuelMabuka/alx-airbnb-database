-- ==========================================
-- 📌 performance.sql
-- Objective: Retrieve all bookings with user, property, and payment details
-- Then analyze and refactor for performance
-- ==========================================

-- 🧾 Initial Query (includes required AND clause for filtering)
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
LEFT JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date >= '2025-01-01'
  AND pay.status = 'completed'
ORDER BY b.booking_date DESC;

-- ==========================================
-- 🔍 Observations:
-- - LEFT JOIN may cause inefficiencies if payments always exist
-- - Missing indexes can lead to Seq Scans
-- ==========================================

-- ✅ Refactored Query (more efficient)
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
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date >= '2025-01-01'
  AND pay.status = 'completed'
ORDER BY b.booking_date DESC;

-- ==========================================
-- 🛠 Recommended Indexes
-- ==========================================

CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_date ON bookings(booking_date);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
CREATE INDEX IF NOT EXISTS idx_payments_status ON payments(status);

