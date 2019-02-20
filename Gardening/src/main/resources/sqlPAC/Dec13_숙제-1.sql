
-- 숙제 SCOTT 계정으로 하면 됨
SELECT * FROM SALE_TBL;
SELECT * FROM CD_TBL;
SELECT * FROM ORG_TBL;


-- 71PAGE

SELECT * FROM ORG_TBL ORDER BY NO, ST_DT;


SELECT NO , NM 
			, ST_DT
			, ET_DT
FROM ORG_TBL
;





SELECT NO, NM
	, DECODE((REGEXP_SUBSTR(DT, '[[:digit:]]+', 1, 2))
					, LEAD((REGEXP_SUBSTR(DT, '[[:digit:]]+', 1, 1))) OVER(ORDER BY SEQ, NM), NULL, ST_DT) AS NEW_ST_DT
					
	, DECODE((REGEXP_SUBSTR(DT, '[[:digit:]]+', 1, 2))
					, LEAD((REGEXP_SUBSTR(DT, '[[:digit:]]+', 1, 1))) OVER(ORDER BY SEQ,NM), LEAD(ET_DT) OVER(ORDER BY ST_DT,NM) , ET_DT ) AS NEW_ET_DT
	, ST_DT
	, ET_DT
FROM
(
SELECT 	
	 		 NO , NM 
			, RTRIM(ST_DT)  ST_DT
			, RTRIM(ET_DT)  ET_DT
			, RTRIM(ST_DT) || 'TO' || RTRIM(ET_DT)  AS DT 	
FROM ORG_TBL
ORDER BY NO, ST_DT
)
;


-----------------------------------------------------


SELECT SEQ, NO, NM
	, ST_DT
	, ET_DT
	, DECODE(NM,LEAD(NM) OVER(ORDER BY NM)
						, (DECODE((LEAD(ST_DT) OVER(ORDER BY SEQ ,NO))
										, ET_DT , NULL, ST_DT) )
				  , ST_DT) AS NST_DT
	, ET_DT
FROM (
SELECT ROWNUM SEQ , NO, NM
	, ST_DT
	--, ET_DT
	, DECODE(NM,LEAD(NM) OVER(ORDER BY NM),  (DECODE(, ET_DT , NULL, ST_DT) )
FROM
(
SELECT 	
	 		 NO
	 		 ,NM
			, RTRIM(ST_DT)  ST_DT
			, RTRIM(ET_DT)  ET_DT
FROM ORG_TBL
ORDER BY NO, ST_DT
)  

)
;
----------------------------------------------------------------------------


SELECT 
	  NO , NM  
	, ST_DT
	, ET_DT
	, DECODE(LEAD(ST_DT) OVER(ORDER BY NM, ST_DT) , ET_DT, LEAD(ST_DT) OVER(ORDER BY NM, ST_DT), ET_DT) N_ST_DT
FROM
(
SELECT 	NO  ,NM
			, RTRIM(ST_DT)  ST_DT
			, RTRIM(ET_DT)  ET_DT
FROM ORG_TBL
ORDER BY NO, ST_DT
)  
;


-- ET_DT; NULL일때 최디값


SELECT NO
	, ST_DT1, ET_DT1
	, NM
FROM
(
SELECT 
	NO, NM
	, ST_DT
	, ET_DT
	, SEQ
	, DECODE(SEQ, 1, ST_DT
				, NULL ,  MAX(ET_DT) OVER(PARTITION BY NM  ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
				 ) ST_DT1
	, DECODE(SEQ, 1, ET_DT
					, NULL, MAX(ET_DT) OVER(PARTITION BY NM  ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
				  ) ET_DT1
FROM
(
SELECT 
	NO, NM
	, ST_DT
	, ET_DT
	, DECODE(REGEXP_SUBSTR(DT,'[[:digit:]]+',1,1), REGEXP_SUBSTR(DT,'[[:digit:]]+',1,2), NULL , '1') SEQ 
FROM 
(

SELECT 	NO  ,NM
			, RTRIM(ST_DT)  ST_DT
			, RTRIM(ET_DT)  ET_DT
			, RTRIM(ST_DT) || 'TO' || RTRIM(LAG(ET_DT) OVER(PARTITION BY NM ORDER BY NO, ST_DT)) DT
FROM ORG_TBL
ORDER BY NO, ST_DT
)
)
)
WHERE ST_DT1 != ET_DT1
ORDER BY NO, NM, ST_DT1 
;


----------------------------------------------------------------------------


SELECT 	NO  ,NM
			, RTRIM(ST_DT)  ST_DT
			, RTRIM(ET_DT)  ET_DT
			, RTRIM(ST_DT) || 'TO' || RTRIM(LAG(ET_DT) OVER(ORDER BY NO, ST_DT)) DT
FROM ORG_TBL
ORDER BY NO, ST_DT;

----------------------------------------------------------------------------


