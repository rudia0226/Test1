CREATE OR REPLACE PROCEDURAL P_DIA_WHAT(VAR_TBL_NAME VARCHAR2,  AREA_CD VARCHAR2 := NULL , CNT  VARCHAR2 := NULL , GR VARCHAR2 := NULL 
																	, SEOUL VARCHAR2 := '1' , KYUNGKI  VARCHAR2 := '1' ,  INCHEON VARCHAR2 := '1' 
																	, PYUNGTEK VARCHAR2 := '1' , ULSAL VARCHAR2 := '1' ,  DAEJOEN VARCHAR2 := '1' 
																	, BUSAN VARCHAR2 := '1' , GWANJU  VARCHAR2 := '1', DIR  VARCHAR2 := NULL )
AS
	VAR_STR VARCHAR2(10000);
	VAR_CNT NUMBER;
	VAR_TEMP VARCHAR2(200);
	VAR_TBL_NAME VARCHAR2 := 'DIA_GGC_TBL';
	
	CURSOR CUR_EXISTS IS
	SELECT TABLE_NAME
	FROM USER_TABLES
	WHERE TABLE_NAME ='DIA_GGC_TBL';
	
BEGIN

	OPEN CUR_EXISTS
	FETCH CUR_EXISTS INTO VAR_TEMP;
	
	IF CUR_EXISTS%FOUND THEN 
		VAR_STR := 'DROP TABLE DIA_GGC_TBL'
		EXECUTE IMMEDIATE VAR_STR;
	END IF 

	VAR_STR := ' CREATE TABLE DIA_GGC_TBL (
														AREA_CD VARCHAR2(1000)
														, NM  VARCHAR2(1000)
														, REGION_AREA  VARCHAR2(1000)
														, COL0  VARCHAR2(1000)
														, COL1  VARCHAR2(1000)
														, COL2  VARCHAR2(1000)
														, COL3  VARCHAR2(1000)
														, COL4  VARCHAR2(1000)
														, COL5  VARCHAR2(1000)
														, COL6  VARCHAR2(1000)
														, COL7  VARCHAR2(1000)
														, COL8  VARCHAR2(1000)
														, COL9  VARCHAR2(1000)
														, TOT NUMBER )' ; 
					
	EXECUTE IMMEDIATE VAR_STR;
	
	VAR_STR := 'INSERT INTO DIA_GGC_TBL (' || 
					'AREA_CD, NM, REGION_AREA, COL0, COL1, COL2, COL3, COL4, COL5, COL6, COL7, COL8, COL9, TOT   )  '
				||
					'SELECT AREA_CD
			       ,  NM
			       , REGION_AREA
			       ,COL0||" ("||TO_CHAR(ROUND(COL0/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL0,GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡å")||
			         DECODE(GR,"00","*"||NVL(RK0,MAX_RK)) COL0
			       ,COL1||" ("||TO_CHAR(ROUND(COL1/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL1, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡å")||
			         DECODE(GR,"00","*"||NVL(RK1,MAX_RK)) COL1                 
			       ,COL2||" ("||TO_CHAR(ROUND(COL2/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL2, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5 ,COL6,COL7,COL8,COL9),"¡å")||
			         DECODE(GR,"00","*"||NVL(RK2,MAX_RK)) COL2
			       ,COL3||" ("||TO_CHAR(ROUND(COL3/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL3, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡å")||
			         DECODE(GR,"00","*"||NVL(RK3,MAX_RK)) COL3
			       ,COL4||" ("||TO_CHAR(ROUND(COL4/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL4, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                     ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡å")||
			         DECODE(GR,"00","*"||NVL(RK4,MAX_RK)) COL4
			       ,COL5||" ("||TO_CHAR(ROUND(COL5/TOT*100,2),"FM990.09")||"% )" ||
			         DECODE(COL5, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡å")||
			         DECODE(GR,"00","*"||NVL(RK5,MAX_RK)) COL5
			       ,COL6||" ("||TO_CHAR(ROUND(COL6/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL6, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡å")||
			         DECODE(GR,"00","*"||NVL(RK6,MAX_RK)) COL6
			       ,COL7||" ("||TO_CHAR(ROUND(COL7/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL7, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡å")||
			         DECODE(GR,"00","*"||NVL(RK7,MAX_RK)) COL7
			       ,COL8||" ("||TO_CHAR(ROUND(COL8/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL8, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡å")||
			         DECODE(GR,"00","*"||NVL(RK8,MAX_RK)) COL8
			       ,COL9||" ("||TO_CHAR(ROUND(COL9/TOT*100,2),"FM990.09")||"% )"||
			         DECODE(COL9, GREATEST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9),"¡ã"
			                    ,LEAST(COL0, COL1,COL2,COL3,COL4,COL5,COL6,COL7,COL8,COL9), "¡å")||
			         DECODE(GR,"00","*"||NVL(RK9,MAX_RK)) COL9                                                                                                                                                                                      
			       ,TOT
				FROM(  
			    SELECT AREA_CD
			          ,DECODE(GROUPING(AREA_CD)||GROUPING(REGION_AREA),"00",MIN(CD_NM)
			                    , "01",MIN(CD_NM)||"ÇÕ°è","ÃÑ°è") NM
			          ,REGION_AREA
			          ,NVL(SUM(DECODE(PROD_ID,"100000",SALE_CNT)),0) COL0
			          ,NVL(SUM(DECODE(PROD_ID,"100001",SALE_CNT)),0) COL1
			          ,NVL(SUM(DECODE(PROD_ID,"100002",SALE_CNT)),0) COL2
			          ,NVL(SUM(DECODE(PROD_ID,"100003",SALE_CNT)),0) COL3
			          ,NVL(SUM(DECODE(PROD_ID,"100004",SALE_CNT)),0) COL4
			          ,NVL(SUM(DECODE(PROD_ID,"100005",SALE_CNT)),0) COL5
			          ,NVL(SUM(DECODE(PROD_ID,"100006",SALE_CNT)),0) COL6
			          ,NVL(SUM(DECODE(PROD_ID,"100007",SALE_CNT)),0) COL7
			          ,NVL(SUM(DECODE(PROD_ID,"100008",SALE_CNT)),0) COL8
			          ,NVL(SUM(DECODE(PROD_ID,"100009",SALE_CNT)),0) COL9
			          ,MIN(DECODE(PROD_ID,"100000",RK)) RK0
			          ,MIN(DECODE(PROD_ID,"100001",RK)) RK1
			          ,MIN(DECODE(PROD_ID,"100002",RK)) RK2
			          ,MIN(DECODE(PROD_ID,"100003",RK)) RK3
			          ,MIN(DECODE(PROD_ID,"100004",RK)) RK4
			          ,MIN(DECODE(PROD_ID,"100005",RK)) RK5
			          ,MIN(DECODE(PROD_ID,"100006",RK)) RK6
			          ,MIN(DECODE(PROD_ID,"100007",RK)) RK7
			          ,MIN(DECODE(PROD_ID,"100008",RK)) RK8
			          ,MIN(DECODE(PROD_ID,"100009",RK)) RK9         
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
		    	AND LENGTH(TB.CD_ID)=2
		    GROUP BY ROLLUP(AREA_CD ,REGION_AREA)
		) WHERE GR = (DECODE(:ARG_GR,"D","00","M","01","T","11",GR))
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
		         , DECODE(:ARG_DIR,"F", 1, -1) * GR  '
         ;
     
     VAR_STR  := REPLACE(VAR_STR , ':ARG_AREA_CD' , AREA_CD);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_CNT' , CNT);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_GR' , GR);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_SEOUL' , SEOUL);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_KYUNGKI' , KYUNGKI);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_INCHEON' , INCHEON);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_PYUNGTEK' , PYUNGTEK);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_ULSAL' , ULSAL);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_DAEJOEN' , DAEJOEN);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_BUSAN' , BUSAN);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_GWANJU' , GWANJU);
	 VAR_STR  := REPLACE(VAR_STR , ':ARG_DIR' , DIR);
     
     EXECUTE IMMEDIATE VAR_STR USING VAR_TBL_NAME;
     
     VAR_STR := 'SELECT COUNT(*) CNT FROM ' || VAR_TBL_NAME ;
     EXECUTE IMMEDIATE VAR_STR INTO VAR_CNT;
     
     DBMS_OUTPUT.PUT_LINE('INSERT TABLE NAME : ' || VAR_TBL_NAME ||  'INSERT CNT :  [' || VAR_CNT || ']');
     
     CLOSE CUR_EXISTS;    
 
END;


	         