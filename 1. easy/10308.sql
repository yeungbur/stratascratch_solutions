/*

https://platform.stratascratch.com/coding/10308-salaries-differences?

Salaries Differences

Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

Tables: db_employee, db_dept

db_employee
id int
first_name varchar
last_name varchar
salary int
department_id int

db_dept
id int
department varchar

*/

SELECT DIFF(MAX(salary), MIN(salary)), department
FROM db_employee a
INNER JOIN db_dept b ON a.department_id = b.id
WHERE department IN ('marketing', 'engineering')
GROUP BY department;