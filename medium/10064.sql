/*

https://platform.stratascratch.com/coding/10064-highest-energy-consumption?

Highest Energy Consumption

Find the date with the highest total energy consumption from the Meta/Facebook data centers. Output the date along with the total energy consumption across all data centers.

Tables: fb_eu_energy, fb_asia_energy, fb_na_energy

fb_eu_energy
date datetime
consumption int

fb_asia_energy
date datetime
consumption int

fb_na_energy
date datetime
consumption int

*/

WITH A AS (SELECT date, consumption
FROM fb_eu_energy
UNION ALL
SELECT date, consumption
FROM fb_asia_energy
UNION ALL 
SELECT date, consumption
FROM fb_na_energy),

B AS (SELECT date, SUM(consumption) as sumcon
FROM A
GROUP BY date
ORDER BY 2 DESC)

SELECT *
FROM B
WHERE sumcon = (SELECT MAX(sumcon) FROM B)
;