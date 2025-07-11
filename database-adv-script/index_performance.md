## 📏 Measuring Query Performance Before and After Indexing

### Objective  
Evaluate how indexes improve query execution using `EXPLAIN ANALYZE`.

---

### 🔍 Step-by-Step

1. **Run the query without indexes**  
   Use `EXPLAIN ANALYZE` and record the output (execution plan + time).

2. **Create the index** using `CREATE INDEX`.

3. **Re-run the same query**  
   Use `EXPLAIN ANALYZE` again and compare results.

---

### 🧪 Example Query: Join `bookings` and `users`

```sql
EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.booking_date,
  u.name
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.booking_date >= '2025-01-01'
ORDER BY b.booking_date DESC;
