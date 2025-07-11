WITH property_bookings AS (
  SELECT 
    property_id,
    COUNT(*) AS total_bookings
  FROM bookings
  GROUP BY property_id
)
SELECT 
  property_id,
  total_bookings,
  RANK() OVER (ORDER BY total_bookings DESC) AS rank
FROM property_bookings;
