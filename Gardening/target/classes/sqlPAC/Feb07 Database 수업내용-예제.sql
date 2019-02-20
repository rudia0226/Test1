-----------------------------------------------------------------
SUM(DECODE()) GROUP BY 
-----------------------------------------------------------------

SELECT YM
        ,SUM(DECODE(WEEK_ID,'1',SALE_CNT)) COL1
        ,SUM(DECODE(WEEK_ID,'2',SALE_CNT))COL2
        ,SUM(DECODE(WEEK_ID,'3',SALE_CNT))COL3
        ,SUM(DECODE(WEEK_ID,'4',SALE_CNT))COL4
        ,SUM(DECODE(WEEK_ID,'5',SALE_CNT))COL5
        ,SUM(DECODE(WEEK_ID,'6',SALE_CNT))COL6
        ,SUM(DECODE(WEEK_ID,'7',SALE_CNT))COL7
FROM (
SELECT TO_CHAR(SALE_DATE,'YYYYMM') YM
          ,TO_CHAR(SALE_DATE,'D') WEEK_ID
          ,SALE_CNT
FROM (
            SELECT TO_DATE('20180701','YYYYMMDD') + FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
                       ,FLOOR(DBMS_RANDOM.VALUE(1,100)) SALE_CNT   
            FROM DUAL
            CONNECT BY LEVEL <=100 
        )        
        )   
        GROUP BY YM 
        ORDER BY YM
		
-----------------------------------------------------------------
PIVOT
-----------------------------------------------------------------

SELECT * 
FROM (
            SELECT TO_CHAR(SALE_DATE,'YYYYMM') YM
                      ,TO_CHAR(SALE_DATE,'D') WEEK_ID
                      ,SALE_CNT
            FROM (
                        SELECT TO_DATE('20180701','YYYYMMDD') + FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
                                   ,FLOOR(DBMS_RANDOM.VALUE(1,100)) SALE_CNT   
                        FROM DUAL
                        CONNECT BY LEVEL <=100 
                    )        
        )   
PIVOT (
            SUM(SALE_CNT) 
            FOR WEEK_ID IN ( 1,2,3,4,5,6,7)
		)        

-----------------------------------------------------------------
복제를 통한 unpivot
-----------------------------------------------------------------

SELECT YM
          ,NO WEEK_ID
          ,DECODE(NO,1,COL1,2,COL2,3,COL3,4,COL4,5,COL5,6,COL6,7,COL7) VAL
FROM UP_SAMPLE A ,
         (SELECT ROWNUM NO
          FROM DUAL
          CONNECT BY LEVEL <=7) B
order by 1,no    

----------------
SELECT YM
         ,DECODE(WEEK_ID,'COL1','1','COL2','2','COL3','3','COL4','4','COL5','5','COL6','6','COL7','7') WID
         ,SALE_PER_WID
FROM UP_SAMPLE
UNPIVOT
(
    SALE_PER_WID FOR WEEK_ID IN (COL1 ,COL2,COL3,COL4,COL5,COL6,COL7)
)



SELECT *
FROM (
		SELECT  SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),1,6) YM
				   ,SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),-1) FP           
				   ,AREA_CD
				   ,SALE_PER_WID     
		FROM UP_SAMPLE1
     )		
	 

---------------
예제 script




SELECT YM
        ,SUM(DECODE(WEEK_ID,'1',SALE_CNT)) COL1
        ,SUM(DECODE(WEEK_ID,'2',SALE_CNT))COL2
        ,SUM(DECODE(WEEK_ID,'3',SALE_CNT))COL3
        ,SUM(DECODE(WEEK_ID,'4',SALE_CNT))COL4
        ,SUM(DECODE(WEEK_ID,'5',SALE_CNT))COL5
        ,SUM(DECODE(WEEK_ID,'6',SALE_CNT))COL6
        ,SUM(DECODE(WEEK_ID,'7',SALE_CNT))COL7
        ,COUNT(DECODE(WEEK_ID,'1',SALE_CNT)) COL1_N
        ,COUNT(DECODE(WEEK_ID,'2',SALE_CNT)) COL2_N
FROM (
SELECT TO_CHAR(SALE_DATE,'YYYYMM') YM
          ,TO_CHAR(SALE_DATE,'D') WEEK_ID
          ,SALE_CNT
FROM (
            SELECT TO_DATE('20180701','YYYYMMDD') + FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
                       ,FLOOR(DBMS_RANDOM.VALUE(1,100)) SALE_CNT   
            FROM DUAL
            CONNECT BY LEVEL <=100 
        )        
        )   
        GROUP BY YM 
        ORDER BY YM

DROP TABLE
        
CREATE TABLE UP_SAMPLE AS
SELECT * 
FROM ( 
            SELECT TO_CHAR(SALE_DATE,'YYYYMM') YM
                     -- ,TO_CHAR(SALE_DATE,'YYYYMMDD') YMD                                   
                      ,TO_CHAR( CEIL(DBMS_RANDOM.VALUE(0,9))*10) AREA_CD 
                      ,SALE_CNT
            FROM (
                        SELECT TO_DATE('20180701','YYYYMMDD') + FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
                                   ,FLOOR(DBMS_RANDOM.VALUE(1,1000)) SALE_CNT   
                        FROM DUAL
                        CONNECT BY LEVEL <=1000
                    ) 
        )   
PIVOT (
            SUM(SALE_CNT)                       
            FOR AREA_CD IN ( '10'  COL1 ,'20' COL2,'30' COL3,'40' COL4,'50' COL5
                                     ,'60' COL6,'70' COL7,'80' COL8,'90' COL9 )
) -- group by ym

SELECT *
FROM UP_SAMPLE


DROP TABLE UP_SAMPLE1

CREATE TABLE UP_SAMPLE1 AS
SELECT YM
         ,DECODE(WEEK_ID,'COL1','10','COL2','20','COL3','30','COL4','40','COL5','50'
                                 ,'COL6','60','COL7','70','COL8','80','COL9','90') AREA_CD
         ,SALE_PER_WID
FROM UP_SAMPLE
UNPIVOT
(
    SALE_PER_WID FOR WEEK_ID IN (COL1 ,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9)
)

SELECT YM
          ,NO WEEK_ID
          ,DECODE(NO,1,COL1,2,COL2,3,COL3,4,COL4,5,COL5,6,COL6,7,COL7) VAL
FROM UP_SAMPLE A ,
         (SELECT ROWNUM NO
          FROM DUAL
          CONNECT BY LEVEL <=7) B
order by 1,no                    


SELECT AREA_CD
          ,YM
          ,SALE_PER_WID CNT  
FROM UP_SAMPLE1

 ,TO_DATE('20180901','YYYYMMDD') + FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
         ,ROUND(TO_DATE('20180901','YYYYMMDD') + FLOOR(DBMS_RANDOM.VALUE(1,50))) SALE_DATE1
         
 INSERT INTO       UP_SAMPLE1  
SELECT TO_CHAR(YMD,'YYYYMMDD')
          ||'-'||DECODE(TO_CHAR(YMD,'YYYYMMDD'),TO_CHAR(ROUND(YMD),'YYYYMMDD'),1,2)
,AREA_CD       
   ,SALE_CNT
FROM (         
SELECT TO_CHAR( CEIL(DBMS_RANDOM.VALUE(0,9))*10) AREA_CD        
         ,TO_DATE('20180901','YYYYMMDD') + DBMS_RANDOM.VALUE(1,1000)/24 YMD
         ,FLOOR(DBMS_RANDOM.VALUE(1,100)) SALE_CNT            
FROM DUAL
CONNECT BY LEVEL <=1000 )

SELECT *
FROM (
SELECT  SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),1,6) YM
           ,SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),-1) FP           
           ,AREA_CD
           ,SALE_PER_WID     
FROM UP_SAMPLE1

ALTER TABLE UP_SAMPLE1 MODIFY YM VARCHAR2(100)




SELECT *
FROM (
        SELECT  SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),1,6) YM
                   ,TO_CHAR(TO_DATE(SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),1,8),'YYYYMMDD'),'D')||
                   SUBSTR(YM||DECODE(INSTR(YM,'-',1,1),0,'01-1'),-1)   FWEEK_ID           
               ---    ,AREA_CD
                   ,SALE_PER_WID     
        FROM UP_SAMPLE1
     )    
PIVOT 
(   
        SUM(SALE_PER_WID)
        FOR FWEEK_ID IN ('11' COL1_1,'12' COL1_2,'21' COL2_1,'22' COL2_2,'31' COL3_1,'32' COL3_2)    
)	 