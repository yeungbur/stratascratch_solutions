/*

https://platform.stratascratch.com/coding/9991-top-ranked-songs?

Top Ranked Songs
Find songs that have ranked in the top position.

Output the track name and the number of times it ranked at the top. Sort your records by the number of times the song was in the top position in descending order.

*/

WITH A AS (
SELECT date, position, trackname
FROM spotify_worldwide_daily_song_ranking
WHERE POSITION = 1
ORDER BY 1
)

SELECT trackname, COUNT(position)
FROM A
GROUP BY 1
ORDER BY 2 DESC;