
--2018-12-20



DESC V_STEP3;


SELECT AREA_CD
       ,  NM
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
            WHERE AREA_CD = NVL(:ARG_AREA_CD,AREA_CD)
                AND ROWNUM <= NVL(:ARG_CNT,100000000)
            GROUP BY AREA_CD
                    ,REGION_AREA
                    ,PROD_ID                
         )TA, CD_TBL TB
    WHERE TA.AREA_CD = TB.CD_ID
    GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
) WHERE GR = (DECODE(:ARG_GR,'D','00','M','01','T','11',GR))
ORDER BY  
         DECODE(AREA_CD, 10, :ARG_SEOUL
         						  , 20, :ARG_KYUNGKI
         						  , 30, :ARG_INCHEON
         						  , 40, :ARG_PYUNGTEK
         						  , 50, :ARG_ULSAL
         						  , 60 , :ARG_DAEJOEN
         						  , 70, :ARG_BUSAN
         						  , 80, :ARG_GWANJU
         						  , 90, :ARG_JEAJU)
         , AREA_CD          
         , DECODE(:ARG_DIR,'F', 1, -1) * GR ;
         
         
         
SELECT * FROM SALE_TBL;
SELECT * FROM CD_TBL;

;
 
 
 -----------------------
 
 areaCd
 gr
 totalData
 seoul
 kyunggi
 incheon
 pyungtek
 ulsan
 daejoen
 busan
 gwangju
 numOrderInput
 
 

            FROM SALE_TBL    
            WHERE AREA_CD = NVL(#{areaCd},AREA_CD)
                AND ROWNUM <= NVL(#{numOrderInput},100000000)
            GROUP BY AREA_CD
                    ,REGION_AREA
                    ,PROD_ID                
         )TA, CD_TBL TB
    WHERE TA.AREA_CD = TB.CD_ID
    GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
) WHERE GR = (DECODE(#{totalData},'D','00','M','01','T','11',GR))
ORDER BY  
         DECODE(AREA_CD, 10, #{seoul}
         						  , 20, #{kyunggi}
         						  , 30, #{incheon}
         						  , 40, #{pyungtek}
         						  , 50, #{ulsan}
         						  , 60 , #{daejoen}
         						  , 70, #{busan}
         						  , 80, #{gwangju})
         , AREA_CD          
         , DECODE(#{gr},'F', 1, -1) * GR ;
         

 
 --------------------
 
 
 

SELECT  NVL(to_char(AREA_CD),'-')  areaCd

		       ,  NM
		       , NVL(REGION_AREA,'-') regionArea
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
            WHERE AREA_CD = NVL(:ARG_AREA_CD,AREA_CD)
                AND ROWNUM <= NVL(:ARG_CNT,100000000)
            GROUP BY AREA_CD
                    ,REGION_AREA
                    ,PROD_ID                
         )TA, CD_TBL TB
    WHERE TA.AREA_CD = TB.CD_ID
    GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
) WHERE GR = (DECODE(:ARG_GR,'D','00','M','01','T','11',GR))
ORDER BY  
         DECODE(AREA_CD, 10, :ARG_SEOUL
         						  , 20, :ARG_KYUNGKI
         						  , 30, :ARG_INCHEON
         						  , 40, :ARG_PYUNGTEK
         						  , 50, :ARG_ULSAL
         						  , 60 , :ARG_DAEJOEN
         						  , 70, :ARG_BUSAN
         						  , 80, :ARG_GWANJU)
         , AREA_CD          
         , DECODE(:ARG_DIR,'F', 1, -1) * GR 
;

 
 -------------------------
 
 	SELECT NVL(to_char(AREA_CD),'-')  areaCd
		       ,  NM
		       , NVL(REGION_AREA,'-') regionArea
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
	            WHERE AREA_CD = NVL(:ARG_AREA_CD,AREA_CD)
	                AND ROWNUM <=  NVL(:ARG_CNT,100000000)
	            GROUP BY AREA_CD
	                    ,REGION_AREA
	                    ,PROD_ID                
	         )TA, CD_TBL TB
	    WHERE TA.AREA_CD = TB.CD_ID
	    GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
	) WHERE GR = (DECODE(:ARG_GR,'D','00','M','01','T','11',GR))
	ORDER BY  
	         DECODE(AREA_CD, 10, :ARG_SEOUL
	         						  , 20, :ARG_KYUNGKI
	         						  , 30, :ARG_INCHEON
	         						  , 40, :ARG_PYUNGTEK
	         						  , 50, :ARG_ULSAL
	         						  , 60, :ARG_DAEJOEN
	         						  , 70, :ARG_BUSAN
	         						  , 80, :ARG_GWANJU    )
	         , AREA_CD          
	         , DECODE(:ARG_DIR,'F', 1, -1) * GR 
			
 
 ;
 -----------------------
 
 
 
 
 
 
 
-- selectBox 에서 수정된 값으로 변환되도록 하기
-- jan10

-- INDEX 를 CREATE 해서 자동으로 찾아갈 수 있도록 
-- 인덱스 생성시 옵티마이저가 자동으로 확인


CREATE INDEX IDX_SALE_TBL ON SALE_TBL 
(AREA_CD);

 
SELECT COUNT(*) 
FROM SALE_TBL;

-- 수업
SELECT * 
FROM CD_TBL A 
WHERE EXISTS (SELECT 'X' -- ROW 가 있나 없나를 따지는것 ; EXISTS  
					FROM SALE_TBL B 
					WHERE A.CD_ID = B.AREA_CD)
AND LENGTH(CD_ID) = 2;


-- SPRING 사용

		SELECT CD_ID CDS, CD_NM NMS
		FROM CD_TBL A 
		WHERE EXISTS (SELECT 'X' 
							FROM SALE_TBL B 
							WHERE A.CD_ID = B.AREA_CD)
		AND LENGTH(CD_ID) = 2
;
		


SELECT * FROM SALE_TBL;
SELECT * FROM CD_TBL;


-- 제주 추가해보기 
INSERT INTO CD_TBL (CD_ID, CD_NM) 
VALUES('90', '제주')
;

COMMIT;

DELETE FROM CD_TBL 
WHERE CD_ID = '90'
;


 
 
-- Jan31 데이터, 중간, 총합의 배경색상 변경 
UPDATE CD_TBL SET CMT = :data WHERE CD_ID = 'D_BK_COLOR' 
UPDATE CD_TBL SET CMT = :mid WHERE CD_ID = 'M_BK_COLOR' 
UPDATE CD_TBL SET CMT = :tot WHERE CD_ID = 'T_BK_COLOR' 
UPDATE CD_TBL SET CMT = :tot WHERE CD_ID = 'TOP_COLOR'
UPDATE CD_TBL SET CMT = :tot WHERE CD_ID = 'LAST_COLOR' 
COMMIT;



SELECT * FROM CD_TBL;
UPDATE CD_TBL SET CMT ='BLUE' WHERE CD_ID = 'LAST_COLOR' 
;

데이터
#FFFAFA

중간총계
#c8c8ff

총계
#B0E6E6

최대값
RED

최소값
BLUE

;

-- CD_TBL 을 이용한 POPUP 구현하기 위해서 변경
SELECT * FROM CD_TBL;

COMMIT ;
UPDATE CD_TBL SET  CD_NM = '최대값 색상'
WHERE CD_ID = 'TOP_COLOR'
;
UPDATE CD_TBL SET  CD_NM = '최소값 색상'
WHERE CD_ID = 'LAST_COLOR'
;
UPDATE CD_TBL SET  CD_NM = '데이터 색상'
WHERE CD_ID = 'D_BK_COLOR'
;
UPDATE CD_TBL SET  CD_NM = '중간총합 색상'
WHERE CD_ID = 'M_BK_COLOR'
;
UPDATE CD_TBL SET  CD_NM = '총계 색상'
WHERE CD_ID = 'T_BK_COLOR'
;

D_BK_COLOR
M_BK_COLOR
TOP_COLOR
LAST_COLOR
T_BK_COLOR
