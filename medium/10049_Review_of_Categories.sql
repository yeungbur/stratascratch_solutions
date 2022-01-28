/*

https://platform.stratascratch.com/coding/10049-reviews-of-categories?

Reviews of Categories


Find the top business categories based on the total number of reviews. Output the category along with the total number of reviews. Order by total reviews in descending order.

Table: yelp_business

yelp_business
business_id varchar
name varchar
neighborhood varchar
address varchar
city varchar
state varchar
postal_code varchar
latitude float
longitude float
stars float
review_count int
is_open int
categories varchar

*/

/* Solution 1 - PostgreSQL */

WITH A AS (
SELECT UNNEST(STRING_TO_ARRAY(categories,';')) AS category, review_count
FROM yelp_business)

SELECT category, SUM(review_count)
FROM A
GROUP BY 1
ORDER BY 2 DESC;

/* Solution 2 - MySQL */

