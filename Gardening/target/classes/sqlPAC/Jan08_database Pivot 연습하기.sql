
-- PIVOT ���� 

WITH TEMP AS (
	SELECT DEPTNO, SAL , JOB
	FROM EMP
)
SELECT * 
FROM TEMP 
PIVOT (
	SUM(SAL) AS "����" 
	FOR DEPTNO 
	IN (10 AS "���ǵ�", 20 AS "������", 30 AS "������")
);

SELECT DEPTNO, SAL 
FROM EMP
WHERE DEPTNO = 10
;