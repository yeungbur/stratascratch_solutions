/*

https://platform.stratascratch.com/coding/2059-player-with-longest-streak?

Player with Longest Streak

You are given a table of tennis players and their matches that they could either win (W) or lose (L).

Find the longest streak of wins.

A streak is a set of consecutive won matches of one player.

The streak ends once a player loses their next match.

Output the ID of the player or players and the length of the streak.

*/

WITH A AS (
SELECT player_id,
match_date,
match_result,
ROW_NUMBER() OVER (PARTITION BY player_id ORDER BY match_date) AS row1,
ROW_NUMBER() OVER (PARTITION BY player_id, match_result ORDER BY match_date) AS row2
FROM players_results
ORDER BY 1,2),

B AS (
SELECT player_id,
match_result,
(row1 - row2) AS streak_id,
COUNT(*) AS streak_len,
RANK() OVER (ORDER BY COUNT(*) DESC) AS 'ranking'
FROM A
WHERE match_result = 'W'
GROUP BY 1,2,3
ORDER BY 1,2,3
)

SELECT player_id, streak_len
FROM B
WHERE ranking = 1
;
