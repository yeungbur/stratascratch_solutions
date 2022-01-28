/*

https://platform.stratascratch.com/coding/10284-popularity-percentage?

Popularity Percentage

Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.

Output each user along with their popularity percentage. Order records in ascending order by user id.

The 'user1' and 'user2' column are pairs of friends.

Table: facebook_friends

facebook_friends
user1 int
user2 int

*/

WITH A AS (
SELECT user1, user2
FROM facebook_friends
UNION
SELECT user2 AS user1,
user1 AS user2
FROM facebook_friends),

D AS (
SELECT COUNT(DISTINCT user1) AS denominator
FROM A),

N AS (SELECT user1, COUNT(user1) AS numerator
FROM A
GROUP BY user1)

SELECT user1, numerator/denominator*100 AS pop_percent
FROM D, N
ORDER BY 1;