SELECT h.hacker_id, h.name FROM HACKERS AS h
JOIN SUBMISSIONS AS s ON s.hacker_id = h.hacker_id
JOIN CHALLENGES AS c ON c.challenge_id = s.challenge_id
JOIN DIFFICULTY AS d ON d.difficulty_level = c.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(h.hacker_id) > 1
ORDER BY COUNT(h.hacker_id) DESC, h.hacker_id ASC;