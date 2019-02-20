
SELECT NM, REGION_AREA
	, COL0 || '( ' || TO_CHAR(ROUND((COL0/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL0, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')     청소기
			  							
	, COL1 || '( ' || TO_CHAR(ROUND((COL1/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL1, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      세탁기
			  							
	, COL2 || '( ' || TO_CHAR(ROUND((COL2/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL2, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      건조기
			  							
	, COL3 || '( ' || TO_CHAR(ROUND((COL3/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL3, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      정수기
			  							
	, COL4 || '( ' || TO_CHAR(ROUND((COL4/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL4, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      도어락
			  							
	, COL5 || '( ' || TO_CHAR(ROUND((COL5/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL5, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      전화기
			  							
	, COL6 || '( ' || TO_CHAR(ROUND((COL6/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL6, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      냉장고
			  							
	, COL7 || '( ' || TO_CHAR(ROUND((COL7/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL7, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      김치냉장고
			  							
	, COL8 || '( ' || TO_CHAR(ROUND((COL8/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL8, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      전자레인지
			  							
	, COL9 || '( ' || TO_CHAR(ROUND((COL9/TOT*100),2), 'FM90.0' )  || ' %)'
			  || DECODE(COL9, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),  '▲'
			  							, LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼', '')      가스레인지
	
	, TOT 					
			  							
FROM 
(

SELECT AREA_CD
      ,DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA),'00',MIN(CD_NM)
                  ,'01',MIN(CD_NM)||'합계','총계') NM
      ,REGION_AREA
      ,NVL(  SUM(DECODE(PROD_ID,'100000',SALE_CNT)) , 0) COL0
      ,NVL(  SUM(DECODE(PROD_ID,'100001',SALE_CNT)) , 0)  COL1
      ,NVL(  SUM(DECODE(PROD_ID,'100002',SALE_CNT)) , 0) COL2
      ,NVL(  SUM(DECODE(PROD_ID,'100003',SALE_CNT)) , 0) COL3
      ,NVL(  SUM(DECODE(PROD_ID,'100004',SALE_CNT)) , 0) COL4
      ,NVL(  SUM(DECODE(PROD_ID,'100005',SALE_CNT)) , 0) COL5
      ,NVL(  SUM(DECODE(PROD_ID,'100006',SALE_CNT)) , 0) COL6
      ,NVL(  SUM(DECODE(PROD_ID,'100007',SALE_CNT)) , 0) COL7
      ,NVL(  SUM(DECODE(PROD_ID,'100008',SALE_CNT)) , 0) COL8
      ,NVL(  SUM(DECODE(PROD_ID,'100009',SALE_CNT)) , 0) COL9
      ,SUM(SALE_CNT) TOT
      ,GROUPING(AREA_CD)||GROUPING(REGION_AREA) GR
FROM(
    SELECT AREA_CD
          ,REGION_AREA
          ,PROD_ID
          ,SUM(SALE_CNT) SALE_CNT
    FROM SALE_TBL    
    GROUP BY AREA_CD
            ,REGION_AREA
            ,PROD_ID
)  
TA, CD_TBL TB  
WHERE TA.AREA_CD = TB.CD_ID
GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
ORDER BY 1,2
)   
;




------------------

-- 이순신

SELECT
		NO 번호
, MIN(ST_DT) 시작날짜   
, MAX(ET_DT) 종료날짜
, MIN(NM)  이름
FROM 
( 
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(SEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --누적합..
							-- 다를때 1이니까. 겹치는건 한번호로 묶일거임 1,2,3 
			, LAG_ET
			, SEQ
			
FROM 
(
		SELECT 	NO  ,  NM
						,  ST_DT
						,  ET_DT
						, LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ) LAG_ET  -- 이전의 ET_DT합 
						, DECODE( SIGN(ST_DT - NVL((LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT)),0) ), 1 , 1,  0 ) SEQ  
			FROM ORG_TBL
			ORDER BY NO, ST_DT   
		)  
	)
GROUP BY NO , S_DT -- 누적합계된 숫자로 정렬해줘야. 그래야 MIN값과 MAX값을 통해서 날짜 구할 수 있음
ORDER BY NO;




-- LAG_ET에 맞춰서 ORDER BY 가 됨
SELECT NO, NM, ST_DT, LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ) LAG_ET
FROM ORG_TBL;



