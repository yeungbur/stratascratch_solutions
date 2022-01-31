/*

https://platform.stratascratch.com/coding/9942-largest-olympics?

Largest Olympics

Find the Olympics with the highest number of athletes.
The Olympics game is a combination of the year and the season, and is found in the 'games' column.
Output the Olympics along with the corresponding number of athletes.

*/

WITH A AS (
SELECT games, COUNT(DISTINCT id) AS cnt, DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT id) DESC) AS ranking
FROM olympics_athletes_events
GROUP BY 1
)

SELECT games, cnt
FROM A
WHERE ranking = 1
;