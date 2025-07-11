SELECT 
  bookings.booking_id,
  bookings.property_id,
  bookings.booking_date,
  users.user_id,
  users.name
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;

SELECT
  properties.title,
  reviews.rating,
  reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;


SELECT 
  users.user_id,
  users.name,
  bookings.booking_id,
  bookings.property_id,
  bookings.booking_date
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;
