/*

https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?

Top 5 States With 5 Star Businesses

Find the top 5 states with the most 5 star businesses. Output the state name along with the number of 5-star businesses and order records by the number of 5-star businesses in descending order. In case there are ties in the number of businesses, return all the unique states. If two states have the same result, sort them in alphabetical order.

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

WITH A AS (
SELECT business_id, state, stars
FROM yelp_business
WHERE stars = 5),

B AS (
SELECT state, COUNT(*) as cnt
FROM A
GROUP BY state),

C AS (SELECT state, cnt, RANK() OVER(ORDER BY cnt DESC) rnk
FROM B)

SELECT state, cnt
FROM C
WHERE rnk <= 5
;