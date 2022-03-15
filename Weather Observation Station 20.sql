declare @a int;
set @a =(SELECT COUNT(*) FROM STATION);
WITH lat_n_number as
(
SELECT
    LAT_N,
    ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS index_num
FROM STATION
)
SELECT 
    CAST(ROUND(AVG(LAT_N), 4, 1) AS numeric(36,4))
FROM
    lat_n_number
WHERE
    (@a%2=0 and index_num in (@a/2,@a/2+1))
or  (@a%2!=0 and index_num=@a/2+1)