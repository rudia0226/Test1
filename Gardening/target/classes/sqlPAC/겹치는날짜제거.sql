
WITH t AS 
( 
;
SELECT 'a' usr, '2011-09-01' sdt, '2011-09-10' edt FROM dual 
UNION ALL SELECT 'a', '2011-09-11', '2011-09-28' FROM dual 
UNION ALL SELECT 'a', '2011-09-26', '2011-10-02' FROM dual 
UNION ALL SELECT 'a', '2011-10-04', '2011-10-12' FROM dual 
UNION ALL SELECT 'a', '2011-10-13', '2011-10-17' FROM dual 
UNION ALL SELECT 'b', '2011-09-10', '2011-09-12' FROM dual ;
) 
SELECT usr 
, MIN(sdt) sdt 
, MAX(edt) edt 
FROM 
( 
SELECT usr, sdt, edt 
, SUM(flag) OVER(PARTITION BY usr ORDER BY sdt, edt) grp 
FROM 
( 
SELECT usr, sdt, edt 
, CASE WHEN TO_CHAR(TO_DATE(sdt, 'yyyy-mm-dd') - 1, 'yyyy-mm-dd') 
<= MAX(edt) OVER(PARTITION BY usr ORDER BY sdt, edt ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) 
THEN 0 ELSE 1 END flag 
FROM t 
) 
) 
GROUP BY usr, grp 
ORDER BY usr, grp 
;