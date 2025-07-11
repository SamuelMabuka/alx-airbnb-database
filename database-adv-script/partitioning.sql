-- ==========================================
-- 📁 partitioning.sql
-- Objective: Partition bookings table by start_date
-- ==========================================

-- 🔁 Step 1: Rename existing table
ALTER TABLE bookings RENAME TO bookings_old;

-- 🔧 Step 2: Create partitioned bookings table (by RANGE)
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT,
  property_id INT,
  start_date DATE NOT NULL,
  end_date DATE,
  created_at TIMESTAMP,
  CONSTRAINT bookings_date_check CHECK (start_date IS NOT NULL)
) PARTITION BY RANGE (start_date);

-- 🧱 Step 3: Create partitions by year (adjust as needed)
CREATE TABLE bookings_2024 PARTITION OF bookings
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 🛠 Step 4: Optional - Copy existing data (if needed)
-- INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, created_at)
-- SELECT booking_id, user_id, property_id, start_date, end_date, created_at FROM bookings_old;

-- 🧪 Step 5: Run EXPLAIN ANALYZE to compare performance
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';
