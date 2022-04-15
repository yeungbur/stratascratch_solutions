/*

https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?

Find all posts which were reacted to with a heart

*/

SELECT DISTINCT A.*
FROM facebook_posts AS A
JOIN facebook_reactions AS B
ON A.post_id = B.post_id
WHERE reaction = 'heart'