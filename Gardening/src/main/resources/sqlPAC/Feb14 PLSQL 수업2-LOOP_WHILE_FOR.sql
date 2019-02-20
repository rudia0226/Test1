
-- ����4 ; ������ 

CREATE OR REPLACE FUNCTION F_DIA_GUGU(V_NUM NUMBER )
RETURN VARCHAR2 
IS 
	V_RTT VARCHAR2(100);
	V_GUGU NUMBER :=1 ;
BEGIN 
	LOOP	
		V_RTT :=  V_NUM || '*' || V_GUGU || '='|| V_NUM*V_GUGU   || CHR(13);
		EXIT WHEN V_GUGU > 9;
	END LOOP;
	RETURN V_RTT;
END ;
;

SELECT F_DIA_GUGU(3) 
FROM DUAL
;


DESC F_DECOF;


SELECT F_DECOF(4)
FROM DUAL;

-- �̻�� ��� 

CREATE OR REPLACE FUNCTION F_DECOF(V_LEV IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 1;
BEGIN
    WHILE V_CNT <= 9   --���� ��
    LOOP   
       V_RSLT :=   V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;
       V_CNT := V_CNT+1 ;
    END LOOP;
    RETURN V_RSLT ;
END ;



-- �����  ; ���ν��� ����

CREATE OR REPLACE PROCEDURE P_DECOF(V_LEV IN NUMBER) 
--RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 1;
BEGIN
    WHILE V_CNT <= 9   --���� ��
    LOOP   
       V_RSLT := V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;
       DBMS_OUTPUT.PUT_LINE(V_RSLT) ;
       V_CNT := V_CNT+1 ;
       DBMS_OUTPUT.PUT_LINE(V_CNT) ;
    END LOOP;
    --RETURN V_RSLT ;
END ;






SELECT F_DIA_GUGU01(4) FROM DUAL;



-- ���ν����� �����


CREATE OR REPLACE PROCEDURE P_DIA_GUGU01(V_NUM IN NUMBER := 10) 
--RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_V  NUMBER(10) := 1;
BEGIN
    WHILE V_V <= 9   --���� ��
    LOOP   
       V_RSLT :=   V_RSLT||V_NUM ||' X '||V_V||' = '||V_NUM * V_V||CHR(13) ;
       V_V := V_V+1 ;
       DBMS_OUTPUT.PUT_LINE(V_RSLT);
    END LOOP;
    --RETURN V_RSLT ;
END ;


EXEC P_DIA_GUGU01(2) ;

EXEC P_DIA_GUGU01 ;  -- ����Ʈ���� ������ ���������ϱ� 10���� ����


-- ���
CREATE OR REPLACE FUNCTION F_DIA_GUGU01(V_NUM IN NUMBER := 10) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_V  NUMBER(10) := 1;
BEGIN
    WHILE V_V <= 9   --���� ��
    LOOP   
       V_RSLT :=   V_RSLT||V_NUM ||' X '||V_V||' = '||V_NUM * V_V||CHR(13) ;
       V_V := V_V+1 ;
    END LOOP;
    RETURN V_RSLT ;
END ;



SELECT F_DIA_GUGU01(2) FROM DUAL;

-- ����� ��Į�� �̱⶧���� ROW�� �ϳ��� �����ε�,
-- ��� ���� ������ ���Ͱ��� �� 9���� ��µ�

2 X 1 = 2  -- �������� �κ�
			   -- ���� ������ 
2 X 1 = 2
2 X 2 = 4
2 X 3 = 6
2 X 4 = 8
2 X 5 = 10
2 X 6 = 12
2 X 7 = 14
2 X 8 = 16
2 X 9 = 18










