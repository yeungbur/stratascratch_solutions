/*

https://platform.stratascratch.com/coding/9897-highest-salary-in-department?

Highest Salary In Department

Find the employee with the highest salary per department.


Output the department name, employee's first name along with the corresponding salary.

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

WITH A AS (
SELECT department, first_name, salary, MAX(salary) OVER (PARTITION BY department) AS dept_max
FROM employee)

SELECT * 
FROM A
WHERE salary = dept_max;