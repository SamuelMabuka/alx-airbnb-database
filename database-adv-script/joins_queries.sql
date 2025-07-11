-- 1. INNER JOIN: Bookings and their Users
SELECT 
  bookings.booking_id,
  bookings.property_id,
  bookings.booking_date,
  users.user_id,
  users.name
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;


-- 2. LEFT JOIN: Properties and their Reviews (include properties without reviews)
SELECT
  properties.title,
  reviews.rating,
  reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;


-- 3. FULL OUTER JOIN: All Users and All Bookings (even unmatched)
SELECT 
  users.user_id,
  users.name,
  bookings.booking_id,
  bookings.property_id,
  bookings.booking_date
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;


-- 4. ORDER BY: Bookings sorted by most recent
SELECT 
  bookings.booking_id,
  bookings.booking_date,
  users.name
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
ORDER BY bookings.booking_date DESC;


-- 5. ORDER BY: Properties listed alphabetically
SELECT
  properties.title,
  reviews.rating
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id
ORDER BY properties.title ASC;


-- 6. ORDER BY: Sort by user name and booking date
SELECT 
  users.name,
  bookings.booking_date
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id
ORDER BY users.name ASC, bookings.booking_date DESC;
