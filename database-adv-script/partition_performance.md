# 📊 Partitioning Report: Bookings Table

## 🎯 Objective
Optimize query performance on the large `bookings` table by partitioning it based on `start_date`.

---

## 🧱 Partitioning Strategy

- Type: `RANGE` Partitioning
- Column: `start_date`
- Partitions created:
  - `bookings_2024` → 2024-01-01 to 2024-12-31
  - `bookings_2025` → 2025-01-01 to 2025-12-31

---

## 🧪 Performance Test

### Query Tested:

```sql
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-06-30';
