
SELECT F_GEN_CHTMLN( NM,GR,'FIRST') NM
       , F_GEN_CHTMLN( REGION_AREA,GR,' ')  REGION_AREA
       ,    F_GEN_CHTMLN( 
               COL0||' ('||TO_CHAR(ROUND(COL0/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL0,GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'¡å')||
         DECODE(GR,'00','*'||NVL(RK0,MAX_RK)) ,GR,' ')  COL0        
       ,F_GEN_CHTMLN( 
               COL1||' ('||TO_CHAR(ROUND(COL1/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL1, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'¡å')||
         DECODE(GR,'00','*'||NVL(RK1,MAX_RK) ) ,GR,' ')  COL1                                   
       ,F_GEN_CHTMLN( 
               COL2||' ('||TO_CHAR(ROUND(COL2/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL2, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5 ,COL6,COL7,COL8,COL9),'¡å')||
         DECODE(GR,'00','*'||NVL(RK2,MAX_RK))  ,GR,' ')   COL2         
       ,F_GEN_CHTMLN( 
               COL3||' ('||TO_CHAR(ROUND(COL3/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL3, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡å')||
         DECODE(GR,'00','*'||NVL(RK3,MAX_RK)),GR,' ')   COL3                  
       ,F_GEN_CHTMLN( 
               COL4||' ('||TO_CHAR(ROUND(COL4/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL4, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                     ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'¡å')||
         DECODE(GR,'00','*'||NVL(RK4,MAX_RK)),GR,' ')  COL4                  
       ,F_GEN_CHTMLN( 
               COL5||' ('||TO_CHAR(ROUND(COL5/TOT*100,2),'FM990.09')||'% )' ||
         DECODE(COL5, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡å')||
         DECODE(GR,'00','*'||NVL(RK5,MAX_RK) ) ,GR,' ')  COL5                  
       ,F_GEN_CHTMLN( 
               COL6||' ('||TO_CHAR(ROUND(COL6/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL6, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡å')||
         DECODE(GR,'00','*'||NVL(RK6,MAX_RK)),GR,' ')  COL6                  
       ,F_GEN_CHTMLN( 
               COL7||' ('||TO_CHAR(ROUND(COL7/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL7, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'¡å')||
         DECODE(GR,'00','*'||NVL(RK7,MAX_RK)),GR,' ')  COL7                 
       ,F_GEN_CHTMLN( 
               COL8||' ('||TO_CHAR(ROUND(COL8/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL8, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡å')||
         DECODE(GR,'00','*'||NVL(RK8,MAX_RK)) ,GR,' ') COL8                 
       ,F_GEN_CHTMLN( 
               COL9||' ('||TO_CHAR(ROUND(COL9/TOT*100,2),'FM990.09')||'% )'||
         DECODE(COL9, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),'¡ã'
                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), '¡å')||
         DECODE(GR,'00','*'||NVL(RK9,MAX_RK)) ,GR,' ') COL9                                                                                                                                                                                                          
       ,F_GEN_CHTMLN(TOT,GR,'LAST') TOT 
FROM(  
    SELECT AREA_CD          
          ,DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA),'00',MIN(CD_NM)
                    ,'01',MIN(CD_NM)||'ÇÕ°è','ÃÑ°è') NM
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
        AND LENGTH(TB.CD_ID)=2
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
         , DECODE(:ARG_DIR,'F', 1, -1) * GR
         
     ;