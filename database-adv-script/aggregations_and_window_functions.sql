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
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number
FROM property_bookings;
