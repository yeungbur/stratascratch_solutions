/*

https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?

Users By Avg Session time

Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume an user has only 1 session per day and if there are multiple of the same events in that day, consider only the latest page_load and earliest page_exit. Output the user_id and their average session time.

Table: facebook_web_log

facebook_web_log
user_id int
timestamp datetime
action varchar

*/

WITH S AS (
SELECT user_id, DATE(timestamp) AS date, MAX(timestamp) as max_time, action
FROM facebook_web_log
WHERE action = "page_load"
GROUP BY 1,2
ORDER BY 1,2),

E as (
SELECT user_id, DATE(timestamp) AS date, MIN(timestamp) as min_time, action
FROM facebook_web_log
WHERE action = "page_exit"
GROUP BY 1,2
ORDER BY 1,2),

T as (
SELECT S.user_id, S.date, TIME_TO_SEC(TIMEDIFF(E.min_time,S.max_time)) AS avg_time
FROM S
JOIN E
ON S.user_id = E.user_id AND S.date = E.date
GROUP BY 1,2)

SELECT user_id, AVG(avg_time)
FROM T
GROUP BY 1
;