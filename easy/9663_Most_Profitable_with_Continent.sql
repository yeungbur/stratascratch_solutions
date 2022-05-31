/*

https://platform.stratascratch.com/coding/9663-find-the-most-profitable-company-in-the-financial-sector-of-the-entire-world-along-with-its-continent?

Find the most profitable company in the financial sector of the entire world along with its continent

*/

WITH A AS (
SELECT MAX(profits)
FROM forbes_global_2010_2014
)

SELECT company, continent
FROM forbes_global_2010_2014
WHERE profits = (SELECT * FROM A)
;