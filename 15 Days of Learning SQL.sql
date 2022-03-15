WITH temp AS (
SELECT submission_date, hacker_id, COUNT(submission_id) c
    FROM submissions s
    GROUP BY submission_date,hacker_id
),

hacker AS (
SELECT submission_date,hacker_id, c , ROW_NUMBER () OVER (PARTITION BY submission_date ORDER BY c DESC, hacker_id ASC) rank
    FROM temp
),

date AS (
SELECT DISTINCT submission_date, ROW_NUMBER () OVER (ORDER BY submission_date) row# FROM (SELECT DISTINCT submission_date FROM submissions) tbl 
),

rank AS (
SELECT d.submission_date, row#, hacker_id, COUNT(d.submission_date) c FROM date d
LEFT JOIN temp t ON t.submission_date <= d.submission_date 
GROUP BY d.submission_date, row#, hacker_id
HAVING COUNT(t.submission_date) = row#
)
    
SELECT r.submission_date, count(r.hacker_id),b.hacker_id, name from rank r 
LEFT JOIN hacker b ON b.submission_date = r.submission_date and b.rank = 1
LEFT JOIN hackers c on c.hacker_id = b.hacker_id
GROUP BY r.submission_date, b.hacker_id, name 
ORDER BY r.submission_date

