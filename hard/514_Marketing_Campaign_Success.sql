/*

https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced?

Marketing Campaign Success [Advanced]

You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app purchases due to the success of the marketing campaign.

The marketing campaign doesn't start until one day after the initial in-app purchase so users that make multiple purchases on the same day do not count, nor do we count users that make only the same purchases over time.

Table: marketing_campaign
marketing_campaign
user_id int
created_at datetime
product_id int
quantity int
price int

*/

WITH A AS(
SELECT user_id, product_id, created_at,
DENSE_RANK() OVER (PARTITION BY user_id ORDER BY created_at) AS number_of_orders,
DENSE_RANK() OVER (PARTITION BY user_id, product_id ORDER BY created_at) AS no_duplicates
FROM marketing_campaign
)

SELECT COUNT(DISTINCT user_id)
FROM A
WHERE number_of_orders > 1 AND no_duplicates = 1
;