-- Step 1: Create a summary of total bookings per property
WITH property_bookings AS (
  SELECT 
    property_id,
    COUNT(*) AS total_bookings
  FROM bookings
  GROUP BY property_id
)

-- Step 2a: Use ROW_NUMBER to assign unique ranks (no ties)
SELECT 
  property_id,
  total_bookings,
  ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number
FROM property_bookings;


-- Step 2b: Use RANK to allow ties in ranking
SELECT 
  property_id,
  total_bookings,
  RANK() OVER (ORDER BY total_bookings DESC) AS rank
FROM property_bookings;
