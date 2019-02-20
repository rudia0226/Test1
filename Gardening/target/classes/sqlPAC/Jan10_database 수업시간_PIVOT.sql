

-- PIVOT »ç¿ë 

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
( -- ¿©±â¿¡ »ç¿ëµÇÁö ¾ÊÀº ÄÃ·³ÀÌ GROUP BY ´ë»óÀÌ µÊ 
 -- ¿©±â¼­´Â SALE_CNT ¿Í WEEK_ID°¡ »ç¿ëµÇ¾úÀ¸¹Ç·Î M_ID ¿Í D_ID ·Î GROUP BY µÈ´Ù.
		SUM(SALE_CNT) S 
	--,   COUNT(*) CNT
	--,   MIN(SALE_CNT) MI
	--,   MAX(SALE_CNT) MX 
	FOR WEEK_ID IN (1,2,3,4,5,6)	
)
ORDER BY M_ID;






-- UNPIVOT »ç¿ë
SELECT * 
FROM
(
	SELECT '°úÇÐ' SUBJECT , 100 ¿µÈñ, 20 Ã¶¼ö, 50 ¹ÎÈñ, 90 µ¿Ã¶, 80 ¹Î¼ö FROM DUAL UNION ALL 
	SELECT '¿µ¾î' SUBJECT, 39 ¿µÈñ , 90 Ã¶¼ö, 100 ¹ÎÈñ, 90 µ¿Ã¶, 100 ¹Î¼ö FROM DUAL 
)
UNPIVOT 
(
	SCORE FOR NAME IN (¿µÈñ , Ã¶¼ö, ¹ÎÈñ, µ¿Ã¶, ¹Î¼ö)
)
;























