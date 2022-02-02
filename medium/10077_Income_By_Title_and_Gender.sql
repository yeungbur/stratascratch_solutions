/*

https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?

Income By Title and Gender

Find the average total compensation based on employee titles and gender.
Total compensation is calculated by adding both the salary and bonus of each employee.
However, not every employee receives a bonus so disregard employees without bonuses in your calculation. 
Output the employee title, gender (i.e., sex), along with the average total compensation.

*/

WITH bonus_table AS (
SELECT worker_ref_id, SUM(bonus) AS avg_bonus
FROM sf_bonus
GROUP BY 1)

SELECT employee_title, sex, AVG(salary + avg_bonus) AS total_comp
FROM sf_employee
JOIN bonus_table ON sf_employee.id = bonus_table.worker_ref_id
GROUP BY 1,2
;