SELECT id, 
    (SELECT age FROM Wands_Property WHERE code = w.code) AS age,
    coins_needed, 
    power

FROM Wands w
WHERE w.code IN 
    (SELECT code FROM Wands_Property WHERE is_evil = 0)
AND coins_needed = 
    (SELECT MIN(coins_needed) FROM Wands 
     WHERE code = w.code AND power = w.power)

ORDER BY power DESC, age DESC;