/*

https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?

Find matching hosts and guests in a way that they are both of the same gender and nationality

Find matching hosts and guests pairs in a way that they are both of the same gender and nationality.

Output the host id and the guest id of matched pair.

*/

SELECT host_id, guest_id
FROM airbnb_hosts h
INNER JOIN airbnb_guests g
ON h.nationality = g.nationality
AND h.gender = g.gender
;