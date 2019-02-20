
-- FEB14 PLSQL

-- ���̺��� �����͸� �ϳ��� ROW�� VO ��ü�� �ؼ� List<VO> list �� �ؼ� ��� 
-- PLSQL������ "Ŀ��" ��� ��

PLSQL�� �ַ� �����۾�/��ġ�۾��� ��� 
�����۾��� �� FUNCTION �� �̿��� �۾��� ������ �۾��ð� �ּ�ȭ 

���� ����
�ٷ�°� FUNCTION/PROCEDURE(���ν���)
	Ŭ������ FUNCTION�� ���ĳ������� PROCEDURE
	
���� �� �ð������� PACKAGE
�� �ð������� TRIGGER (�������� ����. �߸����� ������ ��Ȯ�� ������)
JAR�� ���� ����

=================================================
1. NAMING RULE(���ֱ̹�Ģ)
	FUNCTION : F_FREEDAYCNT
	PROCEDURE : P_FREEPRO
	
2. FUNCTION : RETURN�� �׻� ���� 
	PROCEDURE : RETURN �� ��������� ���� (=���ϰ��� ��� �־ ��) 
			- IN �Ķ����
			- OUT �Ķ���� ; ���⿡ ���� ����  (C_STR OUT VARCHAR2 ) --> C_STR�� ��������

	���ν����� RETURN �̶� �� �����ϰ� �����ʿ� OUT���� ����
	
3. FUNCTION : DML ���� ��� ����  -�ܼ��� ��� RETURNó��
	PROCEDURE : DML ���� ��� (S/U/D/I)  - BATCHó��
	
	���ν����� �ϳ��� ���α׷�

4. EXECUTE (�����)
	- FUNCTION : SELECT F_GETID() FROM TBL 
	- PROCEDURE : EXEC P_DFR(P)   (P ; ���ν��� �Ķ����)
����� SQL���� ��� / ���ν����� �ϳ��� ���α׷�(�ϳ��� ���)

����Ŭ���� ����� ; ��Ʈ���Լ�
��������� ; ��������� �Լ�

=================================================
FUNCTION �⺻����
=================================================
CREATE OR REPLACE FUNCTION F_GETCNT( V_DY IN VARCHAR2 )  -- FUNCTION ���鶧 �ڱ��̸� �̴ϼ� �ٿ��� ���� REPLACE�ɶ� 
RETURN NUMBER    --(�������ڸ��� ����Ÿ���� ����ؾ�)   -- ���ϰ��� �ϳ��� ���ϰ���

IS 
	...
BEGIN   -- = {
	...
END    -- = }

�ڹٷ� ���ָ� �̷�����
int F_GETCNT(VARCHAR2 V_DAY) {

	RETURN   3;
}

=================================================
PROCEDURE �⺻����
=================================================
CREATE OR REPLACE PROCEDURE P_GETCNT( V_DY IN VARCHAR2 )  -- ���ϰ� �ȹްڴ� /  P_GETCNT( V_DY IN VARCHAR2 , V_RSLT OUT NUMBER)  -- ���ϰ� �ȹްڴ� 
IS
BEGIN
	INSERT/UPDATE/DELETE  -- LOGIC�� ���� ������ ������� 
	IF 
		BEGIN  (���� ��ȣ { �� ����)
			BEGIN
			END
		END  (���� ��ȣ } �� ����)
END

=================================================


-- ���� 1 

CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);   -- IS�� BEGIN���̿� �������� 
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;
	RETURN V_RSLT ;
END ;


;
SELECT NO  -- NO�� [] �� ** �� �ٿ��ְ�ʹ� 
FROM TA 
;
SELECT F_DIA_DECO(TO_CHAR(NO), 'RUDIA[ ', ' ]ZZANG')  RUDI
FROM TA 
; 


=================================================
-- ���� 2   ������ �ָ� �յڿ� �� ���ڰ�����  ǥ���ǰԲ� �ϱ� 
;
Ȯ���غ��� ~.~
;
SELECT F_DIA_DECO5(TO_CHAR(NO), '@', '&', 4)  RUD
FROM TA 
--WHERE NO < 2
; 

CREATE OR REPLACE FUNCTION F_DIA_DECO2(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);   
BEGIN
	V_RSLT := RPAD(V_BEF,V_NUM,V_BEF) ||  V_STR  || LPAD(V_AFT,V_NUM,V_AFT) ;
	RETURN V_RSLT ;
END ;


-- FOR�� �̿� 
CREATE OR REPLACE FUNCTION F_DIA_DECO3(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT1 VARCHAR2(100);   
	V_RSLT2 VARCHAR2(100);   
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		FOR i IN 1..V_NUM
		LOOP 
			V_RSLT1 :=  V_RSLT1 || V_BEF ;
			V_RSLT2 :=  V_RSLT2 || V_AFT;
		END LOOP ;
	END ;
	V_RSLT3 := V_RSLT1 || V_STR || V_RSLT2;
	RETURN V_RSLT3;
END ;


-- �Է��ؼ� ������ ���� CONSTANCE (���) �̴�. (�Է¹��� ���� := ������ �� �� ����)
CREATE OR REPLACE FUNCTION F_DIA_DECO4(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		FOR i IN 1..V_NUM
			LOOP 
				V_RSLT3 := V_RSLT3 ||  V_BEF;
			END LOOP ;
		V_RSLT3 := V_RSLT3 || V_STR;
		FOR i IN 1..V_NUM	
			LOOP
				V_RSLT3 := V_RSLT3 || V_AFT;
			END LOOP;
	END ;
	RETURN V_RSLT3;
END ;


-- FOR�� ���ٿ� ����
CREATE OR REPLACE FUNCTION F_DIA_DECO5(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		V_RSLT3 :=   V_BEF ||  V_STR || V_AFT;
		FOR i IN 1..(V_NUM-1)
			LOOP 
				V_RSLT3 :=    V_BEF ||  V_RSLT3|| V_AFT;
			END LOOP ;
	END ;
	RETURN V_RSLT3;
END ;

--  �̻�� ��� 
CREATE OR REPLACE FUNCTION F_DIA_DECO5(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		V_RSLT3 := V_STR ;
		FOR i IN 1..V_NUM
			LOOP 
				V_RSLT3 :=    V_BEF ||  V_RSLT3|| V_AFT;
			END LOOP ;
	END ;
	RETURN V_RSLT3;
END ;




-- ����3 

SELECT * FROM EXAM_RSLT;

SELECT F_DECOC(NAME) DD
FROM EXAM_RSLT;


CREATE OR REPLACE FUNCTION F_DIA_AVGLVL(V_STR IN VARCHAR2)
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(100);
    V_TOT  NUMBER(3) := 0 ; 
BEGIN 
    SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
    FROM EXAM_RSLT 
    WHERE NAME = V_NAME ;
        
    IF  V_TOT >= 91 THEN 
        V_RSLT := 'A' ;
    ELSIF V_TOT >= 81 THEN 
        V_RSLT := 'B' ;
    ELSIF V_TOT >= 71 THEN 
        V_RSLT := 'C' ;
    ELSIF V_TOT >= 61 THEN 
        V_RSLT := 'D' ;
    ELSE
        V_RSLT := 'F' ;    
    END IF ;

    RETURN V_RSLT||V_TOT ;
    
END ;


-- �̻���� ���� �Լ� 
CREATE OR REPLACE FUNCTION F_DECOC(V_NAME IN VARCHAR2) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(100);
    V_TOT  NUMBER(3) := 0 ; 
BEGIN   

    SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
    FROM EXAM_RSLT 
    WHERE NAME = V_NAME ;
        
    IF  V_TOT >= 91 THEN 
        V_RSLT := 'A' ;
    ELSIF V_TOT >= 81 THEN 
        V_RSLT := 'B' ;
    ELSIF V_TOT >= 71 THEN 
        V_RSLT := 'C' ;
    ELSIF V_TOT >= 61 THEN 
        V_RSLT := 'D' ;
    ELSE
        V_RSLT := 'F' ;    
    END IF ;

    RETURN V_RSLT||V_TOT ;
    
END ;


================================================== ( ���� ����)
;


CRLF ; �ٹٲ� CHR(13) ���� �� 


; 


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






