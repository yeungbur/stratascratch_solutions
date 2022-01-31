/*

https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?

Number Of Units Per Nationality

Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.

Sort records by the apartments count in descending order.

*/

-- Solution 1, using CTE

WITH A AS (
SELECT host_id, nationality, age
FROM airbnb_hosts
WHERE age < 30
)

SELECT nationality, COUNT(unit_type)
FROM airbnb_units B
INNER JOIN A ON A.host_id = B.host_id
WHERE unit_type = 'Apartment'
ORDER BY 2 DESC;

-- Solution 2

SELECT nationality, COUNT(unit_type)
FROM airbnb_units B
INNER JOIN airbnb_hosts A ON A.host_id = B.host_id
WHERE unit_type = 'Apartment' AND age < 30
ORDER BY 2 DESC;