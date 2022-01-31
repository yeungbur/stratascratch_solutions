/*

https://platform.stratascratch.com/coding/10048-top-businesses-with-most-reviews?

Top Businesses With Most Reviews

Find the top 5 businesses with most reviews. Assume that each row has a unique business_id such that the total reviews for each business is listed on each row.

Output the business name along with the total number of reviews and order your results by the total reviews in descending order.

*/

WITH A AS (
SELECT name, review_count, DENSE_RANK() OVER (ORDER BY review_count DESC) AS 'ranking'
FROM yelp_business
)

SELECT name, review_count
FROM A
WHERE ranking <= 5;