WITH myTable as (
SELECT hacker_id, challenge_id, MAX(score) as maxScore FROM SUBMISSIONS
GROUP BY hacker_id, challenge_id
),

myTable2 as (
SELECT HACKERS.hacker_id, HACKERS.name, SUM(maxScore) as sumScore FROM HACKERS 
JOIN myTable ON myTable.hacker_id = HACKERS.hacker_id
GROUP BY HACKERS.hacker_id, HACKERS.name
)

SELECT * FROM myTable2
WHERE sumScore != 0
ORDER BY sumScore DESC, hacker_id ASC;