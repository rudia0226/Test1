
DESC V_STEP2;

-- 2018-12-18 ; 숙제 56PAGE


SELECT AREA_CD
       ,NM
       ,REGION_AREA
       ,COL0||' ('||TO_CHAR(ROUND(COL0/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL0,GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'▼')||
         DECODE(GR,'00','*'||NVL(RK0,MAX_RK)) COL0
       ,COL1||' ('||TO_CHAR(ROUND(COL1/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL1, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'▼')||
         DECODE(GR,'00','*'||NVL(RK1,MAX_RK)) COL1                 
       ,COL2||' ('||TO_CHAR(ROUND(COL2/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL2, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5 ,COL6,COL7,COL8,COL9),'▼')||
         DECODE(GR,'00','*'||NVL(RK2,MAX_RK)) COL2
       ,COL3||' ('||TO_CHAR(ROUND(COL3/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL3, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼')||
         DECODE(GR,'00','*'||NVL(RK3,MAX_RK)) COL3
       ,COL4||' ('||TO_CHAR(ROUND(COL4/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL4, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                     ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'▼')||
         DECODE(GR,'00','*'||NVL(RK4,MAX_RK)) COL4
       ,COL5||' ('||TO_CHAR(ROUND(COL5/TOT*100,2),'FM990.09')||'% )' ||
         DECODE(COL5, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼')||
         DECODE(GR,'00','*'||NVL(RK5,MAX_RK)) COL5
       ,COL6||' ('||TO_CHAR(ROUND(COL6/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL6, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼')||
         DECODE(GR,'00','*'||NVL(RK6,MAX_RK)) COL6
       ,COL7||' ('||TO_CHAR(ROUND(COL7/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL7, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'▼')||
         DECODE(GR,'00','*'||NVL(RK7,MAX_RK)) COL7
       ,COL8||' ('||TO_CHAR(ROUND(COL8/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL8, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼')||
         DECODE(GR,'00','*'||NVL(RK8,MAX_RK)) COL8
       ,COL9||' ('||TO_CHAR(ROUND(COL9/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL9, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'▲'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '▼')||
         DECODE(GR,'00','*'||NVL(RK9,MAX_RK)) COL9                                                                                                                                                                                      
       ,TOT
FROM(
    SELECT AREA_CD
          ,DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA),'00',MIN(CD_NM)
                    ,'01',MIN(CD_NM)||'합계','총계') NM
          ,REGION_AREA
          ,NVL(SUM(DECODE(PROD_ID,'100000',SALE_CNT)),0) COL0
          ,NVL(SUM(DECODE(PROD_ID,'100001',SALE_CNT)),0) COL1
          ,NVL(SUM(DECODE(PROD_ID,'100002',SALE_CNT)),0) COL2
          ,NVL(SUM(DECODE(PROD_ID,'100003',SALE_CNT)),0) COL3
          ,NVL(SUM(DECODE(PROD_ID,'100004',SALE_CNT)),0) COL4
          ,NVL(SUM(DECODE(PROD_ID,'100005',SALE_CNT)),0) COL5
          ,NVL(SUM(DECODE(PROD_ID,'100006',SALE_CNT)),0) COL6
          ,NVL(SUM(DECODE(PROD_ID,'100007',SALE_CNT)),0) COL7
          ,NVL(SUM(DECODE(PROD_ID,'100008',SALE_CNT)),0) COL8
          ,NVL(SUM(DECODE(PROD_ID,'100009',SALE_CNT)),0) COL9
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
          ,MAX(RK) +1 MAX_RK 
          ,SUM(SALE_CNT) TOT
          ,GROUPING(AREA_CD)||GROUPING(REGION_AREA) GR          
    FROM (
            SELECT AREA_CD
                  ,REGION_AREA
                  ,PROD_ID
                  ,SUM(SALE_CNT) SALE_CNT
                  ,DENSE_RANK() OVER(PARTITION BY AREA_CD,REGION_AREA ORDER BY SUM(SALE_CNT) DESC) RK
            FROM SALE_TBL    
            --WHERE ROWNUM <= 10000
            GROUP BY AREA_CD
                    ,REGION_AREA
                    ,PROD_ID                
         )TA, CD_TBL TB
    WHERE TA.AREA_CD = TB.CD_ID
    GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
)
ORDER BY 
            DECODE(AREA_CD, 10, :ARG_S, 20, :ARG_K, 30, :ARG_I, 40, :ARG_P, 50, :ARG_U, 60 , :ARG_D, 70, :ARG_B, 80, :ARG_G)	
          ,  REGION_AREA
;














--	CASE WHEN AREA_CD = 10 THEN 1 ELSE AREA_CD = 20 THEN 3 ELSE AREA_CD = 30 THEN
          
	CASE WHEN 
			AREA_CD=10 THEN :ARG_S ELSE
			AREA_CD=20 THEN :ARG_K ELSE
			AREA_CD=30 THEN :ARG_I ELSE
			AREA_CD=40 THEN :ARG_P ELSE
			AREA_CD=50 THEN :ARG_U ELSE
			AREA_CD=60 THEN :ARG_D ELSE
			AREA_CD=70 THEN :ARG_B ELSE
			AREA_CD=80 THEN :ARG_G ELSE AREA_CD END

SELECT * FROM CD_TBL;

SELECT CD_NM, CD_ID
FROM
(
 SELECT  DISTINCT AREA_CD
FROM SALE_TBL    ) A , CD_TBL
WHERE CD_TBL.CD_ID = A.AREA_CD
ORDER BY CD_ID
;


	CASE WHEN 
			AREA_CD=10 THEN :ARG_S ELSE
			AREA_CD=20 THEN :ARG_K ELSE
			AREA_CD=30 THEN :ARG_I ELSE
			AREA_CD=40 THEN :ARG_P ELSE
			AREA_CD=50 THEN :ARG_U ELSE
			AREA_CD=60 THEN :ARG_D ELSE
			AREA_CD=70 THEN :ARG_B ELSE
			AREA_CD=80 THEN :ARG_G ELSE AREA_CD END








WHERE 
	
ORDER BY
	 CASE WHEN  = 1  THEN 0 
	 			ELSE  = 2  THEN 1
	 			ELSE   END, AREA_CD, REGION_AREA
	
	
	-- 사용자가 입력 번호를 넣주면 그 번호대로 정렬이 되도록 한다.
	-- 지역이름수만큼 변수 만들고..
	-- 번호 중복안되고 NULL값 없고
	
	 
	:ARG_01  안양
	:ARG_01  아산
	:ARG_01  인천
	:ARG_01  평택
	:ARG_01  강원
	:ARG_01  대전
	:ARG_01  광주
	:ARG_01  부산
	:ARG_01  경기
	:ARG_01  서울

	
	
--AREA_CD = NVL(:ARG_AREA, AREA_CD) -- 지역번호 입력안하면 전체출력
--ROWNUM <= NVL(:ARG_NUM, 100000000) -- 출력건수 입력안하면 디폴트값으로 1000000000입력



