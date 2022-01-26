/*

https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?

Customer Revenue In March

Calculate the total revenue from each customer in March 2019. 

Output the revenue along with the customer id and sort the results based on the revenue in descending order.

Table: orders

orders
id int
cust_id int
order_date datetime
order_details varchar
total_order_cost int

*/

SELECT cust_id, SUM(total_order_cost) as total
FROM orders
WHERE MONTH(order_date) = 3
GROUP BY 1
ORDER BY 2 DESC;