/*

https://platform.stratascratch.com/coding/9915-highest-cost-orders?

Highest Cost Orders

Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. If customer had more than one order on a certain day, sum the order costs on daily basis. Output their first name, total cost of their items, and the date.
 
For simplicity, you can assume that every first name in the dataset is unique.

Tables: customers, orders

customers
id int
first_name varchar
last_name varchar
city varchar
address varchar
phone_number varchar

orders
id int
cust_id int
order_date datetime
order_details varchar
total_order_cost int

*/

WITH A AS (
SELECT cust_id, order_date, SUM(total_order_cost) as total
FROM orders
WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY 1,2),

B AS (
SELECT MAX(total) as hdt
FROM A)

SELECT first_name, total, A.order_date
FROM A
JOIN customers c ON A.cust_id = c.id
WHERE total = (SELECT * FROM B)
;