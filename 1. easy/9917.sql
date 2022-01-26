/*

https://platform.stratascratch.com/coding/9917-average-salaries?

Average Salaries

Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

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

SELECT location, AVG(popularity)
FROM facebook_employees a
JOIN facebook_hack_survey b ON a.id=b.employee_id
GROUP BY location;