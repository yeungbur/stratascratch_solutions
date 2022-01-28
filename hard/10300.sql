/*

https://platform.stratascratch.com/coding/10300-premium-vs-freemium?


Premium vs Freemium

Find the total number of downloads for paying and non-paying users by date. Include only records where non-paying customers have more downloads than paying customers. The output should be sorted by earliest date first and contain 3 columns date, non-paying downloads, paying downloads.

Tables: ms_user_dimension, ms_acc_dimension, ms_download_facts

ms_user_dimension
user_id int
acc_id int

ms_acc_dimension
acc_id int
paying_customer varchar

ms_download_facts
date datetime
user_id int
downloads int

*/

/* Solution 1 - MySQL */

WITH A AS (
SELECT a.date, a.user_id, a.downloads, b.user_id AS b_user_id, b.acc_id AS b_acc_id, c.acc_id, c.paying_customer
FROM ms_download_facts a
JOIN ms_user_dimension b ON a.user_id = b.user_id
JOIN ms_acc_dimension c ON b.acc_id = c.acc_id
ORDER BY 1),

B AS (
SELECT date,
SUM(CASE WHEN paying_customer = 'no' THEN downloads END) AS dl_np,
SUM(CASE WHEN paying_customer = 'yes' THEN downloads END) AS dl_p
FROM A
GROUP BY date)

SELECT *
FROM B
WHERE dl_np > dl_p
ORDER BY date;

/* Solution 2 - PostgreSQL */

WITH A AS (
SELECT *
FROM ms_download_facts a
JOIN ms_user_dimension b ON a.user_id = b.user_id
JOIN ms_acc_dimension c ON b.acc_id = c.acc_id
ORDER BY 1),

B AS (
SELECT date,
SUM(CASE WHEN paying_customer = 'no' THEN downloads END) AS dl_np,
SUM(CASE WHEN paying_customer = 'yes' THEN downloads END) AS dl_p
FROM A
GROUP BY date)

SELECT *
FROM B
WHERE dl_np > dl_p
ORDER BY date;