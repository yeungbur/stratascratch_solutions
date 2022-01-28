/*

https://platform.stratascratch.com/coding/9905-highest-target-under-manager?

Highest Target Under Manager

Find the highest target achieved by the employee or employees who works under the manager id 13. Output the first name of the employee and target achieved. The solution should show the highest target achieved under manager_id=13 and which employee(s) achieved it.

Table: salesforce_employees

salesforce_employees
id int
first_name varchar
last_name varchar
age int
sex varchar
employee_title varchar
department varchar
salary int
target int
bonus int
email varchar
city varchar
address varchar
manager_id int

*/

/* Solution 1 - CTE*/

WITH A AS(
SELECT MAX(target) as max_trg
FROM salesforce_employees
WHERE manager_id = 13)

SELECT target, first_name
FROM salesforce_employees, A
WHERE target = A.max_trg AND manager_id = 13;

/* Solution 2 - Inner query */

SELECT target, first_name
FROM salesforce_employees
WHERE target IN (
SELECT MAX(target) FROM salesforce_employees WHERE manager_id = 13)
AND manager_id = 13
;