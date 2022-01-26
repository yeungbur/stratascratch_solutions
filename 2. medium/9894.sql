/*

https://platform.stratascratch.com/coding/9894-employee-and-manager-salaries?

Employee and Manager Salaries


Find employees who are earning more than their managers. Output the employee name along with the corresponding salary.

Table: employee

employee
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

/* Solution 1 */

WITH manager AS (
SELECT first_name, id, salary
FROM employee),

A AS (
SELECT employee.first_name, employee.id, manager_id, employee.salary AS emp_salary, manager.salary AS mng_salary
FROM manager
JOIN employee
ON manager_id = manager.id
HAVING emp_salary > mng_salary)

SELECT first_name, emp_salary
FROM A;

/* Solution 2 */

SELECT a.first_name, a.salary
FROM employee AS a
JOIN employee AS b
ON a.manager_id = b.id
WHERE a.salary > b.salary;