-- 71페이지 숙제 다시 풀어보기 

SELECT * FROM ORG_TBL;

SELECT MAX(NO) 번호
		, MIN(ST_DT)  시작날짜
		, MAX(ET_DT)  종료날짜
		, MAX(NM) 이름 
FROM
(
SELECT NO
	, NM
	, ST_DT
	, ET_DT
	, SUM(GR) OVER(ORDER BY NO, ST_DT) GR1 -- 누적합을 사용하기 위해 PARTITION BY NM 사용 안함 
FROM(
SELECT NO, NM, ST_DT, ET_DT 
		, DECODE(ST_DT-LAG(ET_DT) OVER(ORDER BY NO, ST_DT) , 0, 0, 1) GR -- NM과 NO 가 1:1 이니까 NM 대신에 NO 써도됨 
	  --, DECODE(ST_DT, LAG(ET_DT) OVER(ORDER BY NO, ST_DT), 0, 1) -- 황이사님 답 
FROM ORG_TBL
)
)
GROUP BY NO, GR1
ORDER BY NO, MIN(ST_DT)
; 






SELECT * FROM DIA_TBL;

SELECT 
	SYS_CONNECT_BY_PATH(NAME , ' /  ') PATH  
  , NAME 
FROM DIA_TBL
CONNECT BY PRIOR NID = PID 
START WITH PID IS NULL
;




SELECT  NAME 
		, LPAD(' ', (LEVEL-1)*4 ) || 'ㄴ' || NAME  담당부서
FROM DIA_TBL
CONNECT BY PRIOR NID = PID 
START WITH PID IS NULL
;



-- GOOGLE CHART 
SELECT * FROM SALE_TBL;
SELECT * FROM CD_TBL;  -- CODE TABLE 






SELECT
FROM 
(
SELECT AREA_CD 
		, REGION_AREA 
		, PROD_ID
		, SUM(SALE_CNT) SALE_CNT
FROM SALE_TBL 
WHERE ROWNUM <= 100000
GROUP BY  AREA_CD 
		, REGION_AREA 
		, PROD_ID
) 

;



SELECT AREA_CD
      ,DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA),'00',MIN(CD_NM)
                  ,'01',MIN(CD_NM)||'합계','총계') NM
      ,REGION_AREA
      ,NVL(  SUM(DECODE(PROD_ID,'100000',SALE_CNT)) , 0) COL0
      ,NVL(  SUM(DECODE(PROD_ID,'100001',SALE_CNT)) , 0) COL1
      ,NVL(  SUM(DECODE(PROD_ID,'100002',SALE_CNT)) , 0) COL2
      ,NVL(  SUM(DECODE(PROD_ID,'100003',SALE_CNT)) , 0) COL3
      ,NVL(  SUM(DECODE(PROD_ID,'100004',SALE_CNT)) , 0) COL4
      ,NVL(  SUM(DECODE(PROD_ID,'100005',SALE_CNT)) , 0) COL5
      ,NVL(  SUM(DECODE(PROD_ID,'100006',SALE_CNT)) , 0) COL6
      ,NVL(  SUM(DECODE(PROD_ID,'100007',SALE_CNT)) , 0) COL7
      ,NVL(  SUM(DECODE(PROD_ID,'100008',SALE_CNT)) , 0) COL8
      ,NVL(  SUM(DECODE(PROD_ID,'100009',SALE_CNT)) , 0) COL9
      ,SUM(SALE_CNT) TOT
      ,GROUPING(AREA_CD)||GROUPING(REGION_AREA) GR  -- GROUP BY 된 것을 알수 있다. 
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
WHERE TA.AREA_CD = TB.CD_ID  -- TB 테이블의 CD_ID 는 1개이므로 조건절에 의해 조인해도 행의 개수가 늘어나지 않음 
GROUP BY ROLLUP(AREA_CD ,REGION_AREA) -- 00 01 11 로 3개의 LEVEL 존재 
ORDER BY AREA_CD, GR	
;





SELECT 
		AREA_CD
		, NM
		, REGION_AREA 
		--, GR
		, COL0 || ' ('  ||   TO_CHAR(ROUND(COL0/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL0, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK0,MAX_RK)) COL0
		, COL1 || ' ('  ||   TO_CHAR(ROUND(COL1/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL1, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK1,MAX_RK))  COL1
		, COL2 || ' ('  ||   TO_CHAR(ROUND(COL2/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL2, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK2,MAX_RK))  COL2
		, COL3 || ' ('  ||   TO_CHAR(ROUND(COL3/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL3, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK3,MAX_RK))  COL3
		, COL4 || ' ('  ||   TO_CHAR(ROUND(COL4/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL4, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK4,MAX_RK))  COL4
		, COL5 || ' ('  ||   TO_CHAR(ROUND(COL5/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL5, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK5,MAX_RK))   COL5
		, COL6 || ' ('  ||   TO_CHAR(ROUND(COL6/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL6, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK6,MAX_RK))   COL6
		, COL7 || ' ('  ||   TO_CHAR(ROUND(COL7/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL7, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK7,MAX_RK))   COL7
		, COL8 || ' ('  ||   TO_CHAR(ROUND(COL8/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL8, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK8,MAX_RK))   COL8
		, COL9 || ' ('  ||   TO_CHAR(ROUND(COL9/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL9, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK9,MAX_RK))   COL9
		, TOT 
FROM 
(
SELECT AREA_CD , REGION_AREA
		 , DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA), '00' , MAX(CD_NM), '01' , MAX(CD_NM)||'합계', '총계') NM
		 , GROUPING(AREA_CD)||GROUPING(REGION_AREA)  GR
		  ,NVL(  SUM(DECODE(PROD_ID,'100000',SALE_CNT)) , 0) COL0
	      ,NVL(  SUM(DECODE(PROD_ID,'100001',SALE_CNT)) , 0) COL1
	      ,NVL(  SUM(DECODE(PROD_ID,'100002',SALE_CNT)) , 0) COL2
	      ,NVL(  SUM(DECODE(PROD_ID,'100003',SALE_CNT)) , 0) COL3
	      ,NVL(  SUM(DECODE(PROD_ID,'100004',SALE_CNT)) , 0) COL4
	      ,NVL(  SUM(DECODE(PROD_ID,'100005',SALE_CNT)) , 0) COL5
	      ,NVL(  SUM(DECODE(PROD_ID,'100006',SALE_CNT)) , 0) COL6
	      ,NVL(  SUM(DECODE(PROD_ID,'100007',SALE_CNT)) , 0) COL7
	      ,NVL(  SUM(DECODE(PROD_ID,'100008',SALE_CNT)) , 0) COL8
	      ,NVL(  SUM(DECODE(PROD_ID,'100009',SALE_CNT)) , 0) COL9
	      ,MIN(DECODE(PROD_ID,'100000',RK)) RK0
          ,MIN(DECODE(PROD_ID,'100001',RK)) RK1
          ,MIN(DECODE(PROD_ID,'100002',RK)) RK2
          ,MIN(DECODE(PROD_ID,'100003',RK)) RK3
          ,MIN(DECODE(PROD_ID,'100004',RK)) RK4
          ,MIN(DECODE(PROD_ID,'100005',RK)) RK5
          ,MIN(DECODE(PROD_ID,'100006',RK)) RK6
          ,MIN(DECODE(PROD_ID,'100007',RK)) RK7
          ,MIN(DECODE(PROD_ID,'100008',RK)) RK8
          ,MIN(DECODE(PROD_ID,'100009',RK)) RK9  
	      ,MAX(RK) + 1 MAX_RK 
	      ,SUM(SALE_CNT) TOT 
FROM 
(
SELECT AREA_CD 
		, REGION_AREA
		, PROD_ID 
		, SUM(SALE_CNT) SALE_CNT 
		, DENSE_RANK() OVER(PARTITION BY AREA_CD,REGION_AREA ORDER BY SUM(SALE_CNT) DESC) RK
FROM SALE_TBL 
GROUP BY AREA_CD 
		, REGION_AREA
		, PROD_ID 
)  TA, CD_TBL TB 
WHERE TA.AREA_CD = TB.CD_ID -- 이런경우 GROUP BY 로 JOIN 하면 총계가 안나올 수 있어. AREA_CD 가 없는 컬럼이라 WHERE 조건에 위배됨 
GROUP BY ROLLUP(AREA_CD, REGION_AREA)
ORDER BY  AREA_CD , GR 
)
;
 
 
 



SELECT 
	AREA_CD , REGION_AREA, NM 
	,  COL0 || ' ('  ||   TO_CHAR(ROUND(COL0/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL0, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK0,MAX_RK)) COL0
	,  COL1 || ' ('  ||   TO_CHAR(ROUND(COL1/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL1, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK1,MAX_RK)) COL1
	,  COL2 || ' ('  ||   TO_CHAR(ROUND(COL2/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL2, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK2,MAX_RK)) COL2
	,  COL3 || ' ('  ||   TO_CHAR(ROUND(COL3/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL3, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK3,MAX_RK)) COL3
	,  COL4 || ' ('  ||   TO_CHAR(ROUND(COL4/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL4, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK4,MAX_RK)) COL4
	,  COL5 || ' ('  ||   TO_CHAR(ROUND(COL5/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL5, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK5,MAX_RK)) COL5
	,  COL6 || ' ('  ||   TO_CHAR(ROUND(COL6/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL6, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK6,MAX_RK)) COL6
	,  COL7 || ' ('  ||   TO_CHAR(ROUND(COL7/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL7, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK7,MAX_RK)) COL7
	,  COL8 || ' ('  ||   TO_CHAR(ROUND(COL8/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL8, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK8,MAX_RK)) COL8
	,  COL9 || ' ('  ||   TO_CHAR(ROUND(COL9/TOT*100,2), 'FM990.09')|| '%)'  || DECODE(COL9, GREATEST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▲', LEAST(COL0,COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), ' ▼') || DECODE(GR,'00',' *'||NVL(RK9,MAX_RK)) COL9
FROM 
		(
		SELECT AREA_CD , REGION_AREA
				 , DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA), '00' , MAX(CD_NM), '01' , MAX(CD_NM)||'합계', '총계') NM
				 , GROUPING(AREA_CD)||GROUPING(REGION_AREA)  GR
				  ,NVL(  SUM(DECODE(PROD_ID,'100000',SALE_CNT)) , 0) COL0
			      ,NVL(  SUM(DECODE(PROD_ID,'100001',SALE_CNT)) , 0) COL1
			      ,NVL(  SUM(DECODE(PROD_ID,'100002',SALE_CNT)) , 0) COL2
			      ,NVL(  SUM(DECODE(PROD_ID,'100003',SALE_CNT)) , 0) COL3
			      ,NVL(  SUM(DECODE(PROD_ID,'100004',SALE_CNT)) , 0) COL4
			      ,NVL(  SUM(DECODE(PROD_ID,'100005',SALE_CNT)) , 0) COL5
			      ,NVL(  SUM(DECODE(PROD_ID,'100006',SALE_CNT)) , 0) COL6
			      ,NVL(  SUM(DECODE(PROD_ID,'100007',SALE_CNT)) , 0) COL7
			      ,NVL(  SUM(DECODE(PROD_ID,'100008',SALE_CNT)) , 0) COL8
			      ,NVL(  SUM(DECODE(PROD_ID,'100009',SALE_CNT)) , 0) COL9
			      ,MIN(DECODE(PROD_ID,'100000',RK)) RK0
		          ,MIN(DECODE(PROD_ID,'100001',RK)) RK1
		          ,MIN(DECODE(PROD_ID,'100002',RK)) RK2
		          ,MIN(DECODE(PROD_ID,'100003',RK)) RK3
		          ,MIN(DECODE(PROD_ID,'100004',RK)) RK4
		          ,MIN(DECODE(PROD_ID,'100005',RK)) RK5
		          ,MIN(DECODE(PROD_ID,'100006',RK)) RK6
		          ,MIN(DECODE(PROD_ID,'100007',RK)) RK7
		          ,MIN(DECODE(PROD_ID,'100008',RK)) RK8
		          ,MIN(DECODE(PROD_ID,'100009',RK)) RK9  
			      ,MAX(RK) + 1 MAX_RK 
			      ,SUM(SALE_CNT) TOT 
		FROM 
				(
				SELECT AREA_CD 
						, REGION_AREA
				, PROD_ID 
				, SUM(SALE_CNT) SALE_CNT 
				, DENSE_RANK() OVER(PARTITION BY AREA_CD,REGION_AREA ORDER BY SUM(SALE_CNT) DESC) RK -- 중복순위 허용 ; DENSE_RANK()
		FROM SALE_TBL 
		GROUP BY AREA_CD 
				, REGION_AREA
				, PROD_ID 
		)  TA, CD_TBL TB 
WHERE TA.AREA_CD = TB.CD_ID 
GROUP BY ROLLUP(AREA_CD, REGION_AREA)
ORDER BY  AREA_CD , GR 
)
;


 
 
-- GREATEST , LEAST 와 같은 연산을 하기 위해서는 비교 행이 NULL 이 아니어야 한다. 그래서 NVL 함수를 써줘서 NULL인것을 0으로 바꿔줌 

SELECT 
	'A' || NULL  -- CONCATINATION 할때는 NULL과 같이 연산 가능
	, 500 + NULL -- NULL과 연산자 사용 하면 NULL나옴 
FROM DUAL 
;

DESC V_STAT_0122;





