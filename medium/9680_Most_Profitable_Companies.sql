/*

https://platform.stratascratch.com/coding/9680-most-profitable-companies?

Most Profitable Companies

Find the 3 most profitable companies in the entire world.

Output the result along with the corresponding company name.

Sort the result based on profits in descending order.

*/

WITH A AS (
SELECT company, profits, DENSE_RANK() OVER (ORDER BY profits DESC) AS 'ranking'
FROM forbes_global_2010_2014
)

SELECT company, profits
FROM A
WHERE ranking <= 3;