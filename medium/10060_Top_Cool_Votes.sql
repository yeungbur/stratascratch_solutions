/*

https://platform.stratascratch.com/coding/10060-top-cool-votes

Top Cool Votes


Find the review_text that received the highest number of  'cool' votes.

Output the business name along with the review text with the highest numbef of 'cool' votes.

Table: yelp_reviews

yelp_reviews

business_name varchar
review_id varchar
user_id varchar
stars varchar
review_date datetime
review_text varchar
funny int
useful int
cool int

*/

WITH A AS (
SELECT business_name, review_text, DENSE_RANK() OVER (ORDER BY cool DESC) AS cool_rank
FROM yelp_reviews)

SELECT business_name, review_text
FROM A
WHERE cool_rank = 1;