WITH tbl1(Start_date) AS (
SELECT S.Start_Date FROM PROJECTS S
LEFT JOIN PROJECTS E ON E.End_Date = S.Start_Date
WHERE E.End_Date IS NULL)
,
tbl2(End_date) AS (
SELECT E.End_Date FROM PROJECTS E
LEFT JOIN PROJECTS S ON S.Start_Date = E.End_Date
WHERE S.Start_Date IS NULL
)
SELECT tbl1.Start_date, min(tbl2.End_date) AS End_date FROM tbl1
JOIN tbl2 on tbl1.Start_date < tbl2.End_date
GROUP BY tbl1.Start_date
ORDER BY DATEDIFF(dd, tbl1.Start_date, min(tbl2.End_date)), tbl1.Start_date