

-- PIVOT ��� 

SELECT * 
FROM (
		SELECT TO_CHAR(SALE_DATE, 'MM') M_ID
				  , TO_CHAR(SALE_DATE, 'DD') D_ID
				  , TO_CHAR(SALE_DATE, 'D') WEEK_ID
				  , SALE_CNT
		FROM (
			SELECT (TO_DATE('20190101','YYYYMMDD') + LEVEL-1) SALE_DATE
					, TRUNC(DBMS_RANDOM.VALUE(1,1000))  SALE_CNT
			FROM DUAL
			CONNECT BY LEVEL -1  <= TO_DATE('20191231','YYYYMMDD') - TO_DATE('20190101','YYYYMMDD') 
		)
)
PIVOT 
( -- ���⿡ ������ ���� �÷��� GROUP BY ����� �� 
 -- ���⼭�� SALE_CNT �� WEEK_ID�� ���Ǿ����Ƿ� M_ID �� D_ID �� GROUP BY �ȴ�.
		SUM(SALE_CNT) S 
	--,   COUNT(*) CNT
	--,   MIN(SALE_CNT) MI
	--,   MAX(SALE_CNT) MX 
	FOR WEEK_ID IN (1,2,3,4,5,6)	
)
ORDER BY M_ID;






-- UNPIVOT ���
SELECT * 
FROM
(
	SELECT '����' SUBJECT , 100 ����, 20 ö��, 50 ����, 90 ��ö, 80 �μ� FROM DUAL UNION ALL 
	SELECT '����' SUBJECT, 39 ���� , 90 ö��, 100 ����, 90 ��ö, 100 �μ� FROM DUAL 
)
UNPIVOT 
(
	SCORE FOR NAME IN (���� , ö��, ����, ��ö, �μ�)
)
;























