/*

https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?

Find the rate of processed tickets for each type

Table: facebook_complaints

facebook_complaints
complaint_id int
type int
processed bool

*/

WITH A AS (
SELECT type, COUNT(type) AS den, COUNT(CASE WHEN processed = 1 THEN type END) AS num
FROM facebook_complaints
GROUP BY 1
)

SELECT type, num/den AS rate
FROM A;