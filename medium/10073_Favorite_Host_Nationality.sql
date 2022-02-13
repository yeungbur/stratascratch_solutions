/*

https://platform.stratascratch.com/coding/10073-favorite-host-nationality?python

Favorite Host Nationality
For each guest reviewer, find the nationality of the reviewer’s favorite host based on the guest’s highest review score given to a host.

Output the user ID of the guest along with their favorite host’s nationality.

Both the `from_user` and `to_user` columns are user IDs.

*/

WITH A AS (
SELECT from_user, RANK() OVER (PARTITION BY from_user ORDER BY review_score DESC) AS 'rating', nationality
FROM airbnb_reviews
JOIN airbnb_hosts
ON to_user = host_id
WHERE from_type = 'guest'
)

SELECT DISTINCT from_user, nationality
FROM A
WHERE rating =  1
;