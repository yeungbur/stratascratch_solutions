/*

https://platform.stratascratch.com/coding/9913-order-details?

Order Details

Find order details made by Jill and Eva.

Consider the Jill and Eva as first names of customers.

Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

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
order_dated atetime
order_details varchar
total_order_cost int

*/

SELECT order_date, first_name, order_details, total_order_cost
FROM orders
JOIN customers
ON orders.cust_id = customers.id
WHERE first_name REGEXP 'Jill|Eva'
ORDER BY cust_id;