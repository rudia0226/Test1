-- CONTINUE 
SELECT F_DECOG(3,8)
FROM DUAL;

CREATE OR REPLACE FUNCTION F_DIA_DECOG(V_LEV IN NUMBER,V_SKIPNO IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 0;
BEGIN
    WHILE V_CNT <= 9   --먼저 비교
    LOOP    
     
     V_CNT := V_CNT+1 ;       
     CONTINUE WHEN V_CNT = V_SKIPNO ; --조건만족시 WHILE V_CNT <= 9 로 이동해서 다시계속(CONTINUE)수행
                
      V_RSLT :=   V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;         
       
    END LOOP;
    RETURN V_RSLT ;
END ;


-- V_LEV 와 같이 파라미터로 들어온 것은 콘스탄트변수(상수변수) 라서 값 변경안됨 
커서 
2건 이상되는 데이터에서는 데이터가 여러개일때 리스트로 작업하는거 

여기까지가 펑션
=================================



;

-- 예제5 입력한 요일 제외한 일 구하기 
-- 사용한 FUNCTION 
CREATE OR REPLACE FUNCTION F_DIA_DAY(FDAY IN VARCHAR2, LDAY IN VARCHAR2, DT IN VARCHAR2) 
RETURN VARCHAR2
IS 
	V_STRL VARCHAR2(100);
	
BEGIN 
	V_STRL :=  TRANSLATE(RPAD(SUBSTR('1234567',TO_CHAR(TO_DATE(FDAY) ,'D')), TO_DATE(LDAY) - TO_DATE(FDAY) +1,'1234567'),' '|| DT,' ') ;
	RETURN V_STRL ;
END; 


;

-- 시작일부터 종료일까지 '' 안에 요일번호 넣어서 해당요일만뺀 나머지요일을 숫자로 
SELECT F_DIA_DAY(:ST, :DT, :ET) 펑션적용
	,  :ST 시작
	,  :DT 종료 
	, :ET 제외일
FROM DUAL;

SELECT 
	TO_DATE(:DT) - TO_DATE(:ST) +1  HE
	, TRANSLATE(RPAD(SUBSTR('1234567',TO_CHAR(TO_DATE(:ST) ,'D')), TO_DATE(:DT) - TO_DATE(:ST) + 1,'1234567'),' '|| :ET,' ')  HELLO
FROM DUAL ; 


-- 디버깅 
CREATE OR REPLACE PROCEDURE P_DIA_DAY(FDAY IN VARCHAR2, LDAY IN VARCHAR2, DT IN VARCHAR2) 
--RETURN VARCHAR2
IS 
	V_STRL VARCHAR2(100);
	
BEGIN 
	V_STRL :=  TRANSLATE(RPAD(SUBSTR('1234567',TO_CHAR(TO_DATE(FDAY) ,'D')), TO_DATE(LDAY) - TO_DATE(FDAY) +1,'1234567'),' '|| DT,' ') ;
	DBMS_OUTPUT.PUT_LINE(V_STRL);
	--RETURN V_STRL ;
END; 







DESC V_TESTCD;

;
SELECT LTRIM(MAX(SYS_CONNECT_BY_PATH(NID,'+')),'+')||'='||SUM(NID) STR
FROM (
            SELECT ROWNUM +:ARG_STVAL-1 NID
                     ,ROWNUM +:ARG_STVAL PID
            FROM DUAL
            CONNECT BY LEVEL <= :ARG_ETVAL - :ARG_STVAL +1            
           ) 
CONNECT BY PRIOR DECODE(:ARG_DIR,'F',PID,NID) = DECODE(:ARG_DIR,'F',NID,PID)
START WITH NID = DECODE(:ARG_DIR,'F',:ARG_STVAL ,:ARG_ETVAL)   

;




-- 예제 6 ; ID/PID 해서 F적용하면 내림차순 / 나머지 넣으면 오름차순 

CREATE OR REPLACE FUNCTION F_DIA_SEQ(INID IN NUMBER , PEID IN NUMBER , V_STR IN VARCHAR2) 
RETURN VARCHAR2
IS
	V_RSTL VARCHAR2(200);
BEGIN 
		SELECT LTRIM(MAX(SYS_CONNECT_BY_PATH(NID,'+')),'+')||'='||SUM(NID) STR
		INTO V_RSTL   -- 위에서 선언한 변수에 SELECT한 값을 넣어줌 
		FROM (
		            SELECT ROWNUM + INID -1 NID
		                     ,ROWNUM + INID  P_NID
		            FROM DUAL
		            CONNECT BY LEVEL <= PEID - INID +1            
		           ) 
		CONNECT BY PRIOR DECODE(V_STR,'F',P_NID,NID) = DECODE(V_STR,'F',NID,P_NID)
		START WITH NID = DECODE(V_STR,'F',INID ,PEID)   ;
		RETURN V_RSTL;
END;

-- 펑션적용 
SELECT F_DIA_SEQ(3,8,'F') FUN
FROM DUAL
;









