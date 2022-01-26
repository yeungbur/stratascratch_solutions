/*

https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date?

Acceptance Rate By Date

What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.

Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

Table: fb_friend_requests

fb_friend_requests
user_id_sender  varchar
user_id_receiver  varchar
date  datetime
action  varchar

*/

WITH A AS (
SELECT date, user_id_sender, user_id_receiver, action
FROM fb_friend_requests
WHERE action = 'sent'),

B AS (
SELECT date, user_id_sender, user_id_receiver, action
FROM fb_friend_requests
WHERE action = 'accepted')

SELECT a.date, COUNT(b.action)/COUNT(a.action)::float
FROM A LEFT JOIN B ON a.user_id_sender = b.user_id_sender AND a.user_id_receiver = b.user_id_receiver
GROUP BY a.date
ORDER BY a.date ASC;
