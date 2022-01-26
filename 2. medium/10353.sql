/*

https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries

Workers With The Highest Salaries


Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

Tables: worker, title

worker
worker_id int
first_name varchar
last_name archar
salary int
joining_date datetime
department varchar

title
worker_ref_id int
worker_title varchar
affected_from datetime

*/

WITH A AS (
SELECT MAX(salary)
FROM worker)

SELECT worker_title
FROM title
JOIN worker
ON worker_ref_id = worker_id
WHERE salary = (SELECT * FROM A)
;