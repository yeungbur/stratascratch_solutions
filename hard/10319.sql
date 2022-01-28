/*

https://platform.stratascratch.com/coding/10319-monthly-percentage-difference?

Monthly Percentage Difference


Given a table of purchases by date, calculate the month-over-month percentage change in revenue. The output should include the year-month date (YYYY-MM) and percentage change, rounded to the 2nd decimal point, and sorted from the beginning of the year to the end of the year.

The percentage change column will be populated from the 2nd month forward and can be calculated as ((this month's revenue - last month's revenue) / last month's revenue)*100.

Table: sf_transactions

sf_transactions
id int
created_at datetime
value int
purchase_id int

*/

WITH A AS (
SELECT DATE_FORMAT(created_at, '%Y-%m') AS date, value
FROM sf_transactions),

B AS (
SELECT date, SUM(value) as current
FROM A
GROUP BY date),

C AS (SELECT date, current, LAG(current,1) OVER (ORDER BY date) as previous
FROM B)

SELECT date, ROUND((current-previous)/previous*100,2) as p_change
FROM C
;