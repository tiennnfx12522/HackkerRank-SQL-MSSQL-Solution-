WITH View_Stats2 AS (
SELECT challenge_id, SUM(total_views) total_views, SUM(total_unique_views) total_unique_views FROM View_Stats
GROUP BY challenge_id),
Submission_Stats2 AS (
SELECT challenge_id, SUM(total_submissions) total_submissions, SUM(total_accepted_submissions) total_accepted_submissions FROM Submission_Stats
GROUP BY challenge_id
)
SELECT c1.contest_id, c1.hacker_id, c1.name, SUM(s.total_submissions) t1, SUM(s.total_accepted_submissions) t2, SUM(v.total_views) t3, SUM(v.total_unique_views) t4 FROM Contests c1
JOIN Colleges c2 ON c2.contest_id = c1.contest_id
JOIN Challenges c3 ON c3.college_id = c2.college_id
LEFT JOIN View_Stats2 v ON v.challenge_id = c3.challenge_id
LEFT JOIN Submission_Stats2 s ON s.challenge_id = c3.challenge_id
GROUP BY c1.contest_id, c1.hacker_id, c1.name
HAVING
SUM(total_submissions)!=0 or 
SUM(total_accepted_submissions)!=0 or
SUM(total_views)!=0 or
SUM(total_unique_views)!=0
ORDER BY c1.contest_id