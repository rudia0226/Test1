-- CONTINUE 
SELECT F_DECOG(3,8)
FROM DUAL;

CREATE OR REPLACE FUNCTION F_DIA_DECOG(V_LEV IN NUMBER,V_SKIPNO IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 0;
BEGIN
    WHILE V_CNT <= 9   --���� ��
    LOOP    
     
     V_CNT := V_CNT+1 ;       
     CONTINUE WHEN V_CNT = V_SKIPNO ; --���Ǹ����� WHILE V_CNT <= 9 �� �̵��ؼ� �ٽð��(CONTINUE)����
                
      V_RSLT :=   V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;         
       
    END LOOP;
    RETURN V_RSLT ;
END ;


-- V_LEV �� ���� �Ķ���ͷ� ���� ���� �ܽ�źƮ����(�������) �� �� ����ȵ� 
Ŀ�� 
2�� �̻�Ǵ� �����Ϳ����� �����Ͱ� �������϶� ����Ʈ�� �۾��ϴ°� 

��������� ���
=================================



;

-- ����5 �Է��� ���� ������ �� ���ϱ� 
-- ����� FUNCTION 
CREATE OR REPLACE FUNCTION F_DIA_DAY(FDAY IN VARCHAR2, LDAY IN VARCHAR2, DT IN VARCHAR2) 
RETURN VARCHAR2
IS 
	V_STRL VARCHAR2(100);
	
BEGIN 
	V_STRL :=  TRANSLATE(RPAD(SUBSTR('1234567',TO_CHAR(TO_DATE(FDAY) ,'D')), TO_DATE(LDAY) - TO_DATE(FDAY) +1,'1234567'),' '|| DT,' ') ;
	RETURN V_STRL ;
END; 


;

-- �����Ϻ��� �����ϱ��� '' �ȿ� ���Ϲ�ȣ �־ �ش���ϸ��� ������������ ���ڷ� 
SELECT F_DIA_DAY(:ST, :DT, :ET) �������
	,  :ST ����
	,  :DT ���� 
	, :ET ������
FROM DUAL;

SELECT 
	TO_DATE(:DT) - TO_DATE(:ST) +1  HE
	, TRANSLATE(RPAD(SUBSTR('1234567',TO_CHAR(TO_DATE(:ST) ,'D')), TO_DATE(:DT) - TO_DATE(:ST) + 1,'1234567'),' '|| :ET,' ')  HELLO
FROM DUAL ; 


-- ����� 
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




-- ���� 6 ; ID/PID �ؼ� F�����ϸ� �������� / ������ ������ �������� 

CREATE OR REPLACE FUNCTION F_DIA_SEQ(INID IN NUMBER , PEID IN NUMBER , V_STR IN VARCHAR2) 
RETURN VARCHAR2
IS
	V_RSTL VARCHAR2(200);
BEGIN 
		SELECT LTRIM(MAX(SYS_CONNECT_BY_PATH(NID,'+')),'+')||'='||SUM(NID) STR
		INTO V_RSTL   -- ������ ������ ������ SELECT�� ���� �־��� 
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

-- ������� 
SELECT F_DIA_SEQ(3,8,'F') FUN
FROM DUAL
;









