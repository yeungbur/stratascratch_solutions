/*

https://platform.stratascratch.com/coding/10322-finding-user-purchases

Finding User Purchases

Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.

Table: amazon_transactions

amazon_transactions
id int
user_id int
item varchar
created_at datetime
revenue int

*/

WITH A AS (
SELECT user_id, created_at, LAG(created_at, 1) OVER (PARTITION BY user_id ORDER BY created_at ASC) AS previous_at
FROM amazon_transactions),

B AS (
SELECT user_id, DATEDIFF(created_at, previous_at) AS days_between
FROM A)
w
SELECT DISTINCT user_id
FROM B
WHERE days_between <= 7;