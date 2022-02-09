/*

https://platform.stratascratch.com/coding/10071-hosts-abroad-apartments?id=10071

Hosts' Abroad Apartments

Find the number of hosts that have accommodations in countries of which they are not citizens.

*/

--Solution 1 (CTE)

WITH A AS (
SELECT a.host_id, country, h.nationality
FROM airbnb_apartments a
JOIN airbnb_hosts h
ON a.host_id = h.host_id
WHERE country != nationality
)

SELECT COUNT(DISTINCT host_id)
FROM A;

--Solution 2 (Compact)

SELECT COUNT(DISTINCT a.host_id)
FROM airbnb_apartments a
JOIN airbnb_hosts h
ON a.host_id = h.host_id
WHERE nationality != country
;