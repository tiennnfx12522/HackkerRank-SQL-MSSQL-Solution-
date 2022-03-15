with countTable1 as (
SELECT hacker_id, COUNT(hacker_id) AS counts FROM CHALLENGES
GROUP BY hacker_id
),

countTable2 as (
SELECT counts FROM countTable1 GROUP BY counts
HAVING COUNT(counts) = 1
)

SELECT HACKERS.hacker_id, HACKERS.name, COUNT(CHALLENGES.hacker_id) FROM HACKERS
JOIN CHALLENGES ON CHALLENGES.hacker_id = HACKERS.hacker_id
GROUP BY HACKERS.name, HACKERS.hacker_id
HAVING 
COUNT(CHALLENGES.hacker_id) = (SELECT MAX(counts) FROM countTable1) OR
COUNT(CHALLENGES.hacker_id) IN (SELECT counts FROM countTable2)
ORDER BY COUNT(CHALLENGES.hacker_id) DESC, hacker_id
;