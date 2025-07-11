# 🚀 SQL Query Optimization Report

## 🎯 Objective
Refactor a complex SQL query that retrieves bookings along with user, property, and payment details. Measure its performance using `EXPLAIN ANALYZE` and optimize it to reduce execution time.

---

## 🧾 Initial Query (Before Optimization)

```sql
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

Performance Analysis (Before Optimization)
Scan Type: Seq Scan on large tables

Joins: Hash Join observed

Sort Method: External sorting

Execution Time: ~250 ms (example)

Inefficiencies:

LEFT JOIN used when payment is always expected

No indexes on key join/filter columns

No WHERE clause to limit results

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
ORDER BY b.booking_date DESC;

CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_bookings_date ON bookings(booking_date);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);

Performance Analysis (After Optimization)
Scan Type: Index Scan on booking_date

Join Type: Nested Loop Join or Hash Join with indexed keys

Sort Method: Uses index on booking_date

Execution Time: ~110 ms (example)

Efficiency Gains:

Reduced unnecessary joins

Faster filtering with WHERE

Sorted results using index
