/*

https://platform.stratascratch.com/coding/9891-customer-details?

Finding Updated Records

Customer Details

Find the details of each customer regardless of whether the customer made an order. Output the customer's first name, last name, and the city along with the order details.
You may have duplicate rows in your results due to a customer ordering several of the same items. Sort records based on the customer's first name and the order details in ascending order.

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

SELECT first_name, last_name, city, order_details
FROM customers a
LEFT JOIN orders b ON a.id = b.cust_id
ORDER BY first_name ASC, order_details ASC
;