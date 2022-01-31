/*

https://platform.stratascratch.com/coding/9653-count-the-number-of-user-events-performed-by-macbookpro-users?python=

Count the number of user events performed by MacBookPro users

Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.

*/

-- Solution 1, COUNT OVER PARTITION

SELECT DISTINCT device, event_name, COUNT(*) OVER (PARTITION BY device, event_name)
FROM playbook_events
WHERE device = 'macbook pro'
ORDER BY 3 DESC
;

-- Solution 2

SELECT device, event_name, COUNT(*)
FROM playbook_events
WHERE device = 'macbook pro'
GROUP BY 2
ORDER BY 3 DESC
;