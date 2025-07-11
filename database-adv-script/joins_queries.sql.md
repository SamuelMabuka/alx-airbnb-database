## 📘 README: Learning SQL Joins with Examples

### 🎯 Objective

Understand and apply different types of SQL joins to combine data across tables, using real-world scenarios like bookings, users, properties, and reviews.

---

## 🔑 What Are Joins?

**Joins** let you combine rows from two or more tables based on a related column — usually a `foreign key`.

---

## 🧙‍♂️ Types of Joins Covered

### 1. 🔗 `INNER JOIN` – Only Matching Records

Returns rows **only** where there is a match in **both** tables.

#### 🔍 Example:

```sql
SELECT
  bookings.booking_id,
  bookings.booking_date,
  users.name
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;
```

🧠 *Use when you want to show only users ****who made bookings***.

---

### 2. 🖙 `LEFT JOIN` – Keep All Left Table Rows

Returns **all rows from the left table**, plus matching rows from the right table (if any). If no match, right-side columns are `NULL`.

#### 🔍 Example:

```sql
SELECT
  properties.title,
  reviews.rating,
  reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;
```

🧠 *Use when you want to show ****all properties****, including those ****without reviews***.

---

### 3. 🔄 `FULL OUTER JOIN` – Keep Everything

Returns **all rows** from both tables. Rows without matches will have `NULL` for missing fields.

#### 🔍 Example:

```sql
SELECT
  users.name,
  bookings.booking_date
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
```

🧠 *Use when you want to show ****all users**** and ****all bookings****, including unmatched ones.*

️⚠️ *Note: Not supported in MySQL. Use **`LEFT JOIN UNION RIGHT JOIN`** as workaround.*

---

## 🛠 Sample Schema Used

```sql
-- Users
user_id | name

-- Bookings
booking_id | user_id | property_id | booking_date

-- Properties
property_id | title

-- Reviews
review_id | property_id | rating | comment
```

---

## 🔁 Practice Ideas

- Show all users and their bookings
- Show all properties without reviews
- Show reviews with and without matching properties (hint: try `RIGHT JOIN`)

---

## 📌 Bonus Tips

- Always use table aliases (`u`, `b`, `p`, `r`) for cleaner code.
- Use `COALESCE(column, 'default')` to replace `NULL`s in join results.
- Add `WHERE` to filter joined results.

---

