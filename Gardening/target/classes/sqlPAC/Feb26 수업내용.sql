-- Feb26 Ȳ�̻��

����Ŭ������ ERROR �� ���ǵǾ����� 
ORA-1304 
1304 ; nodataFound

���� �ڵ常 �ִ� �͵� 
�� �ڵ� ��Ī�� �ִ°� �ý��� ���� �ڵ� 
311 page

;


PLSQL �� ������ �� �ִ� �� 3���� 
1. ���ν��� FUNCTION -> SELECT������ ����
2. ��� PROCEDURE  -> EXEC PROCEDURE_NAME
3. ��Ű�� PACKAGE  -> PROCEDURE(n) + FUNCTION(n)   ; ��ǰ� ���ν��� ���� n���� �ؼ� ���� 

��)
��ȭ����
SELECT �� �� ���ν���  getSeek
DELETE �� �� ���ν��� 
UPDATE �� �� ���ν���
INSERT �� �� ���ν���

�̰͵��� �ϳ��� ��Ű����  MOVIE�� �ϸ� SELECT ���ν����� MOVIE.getSeek�� ��� 
;

final Class A() {}  -- ����� �� �� ���� Ŭ���� (�ڹ�)


CREATE OR REPLACE FUNCTION F_FFF (V_DD IN VARCHAR2) -- ���⼭ ������ ���ڴ� �ڹ��� final �� �������� ���� �Ұ�  
RETURN NUMBER
IS
BEGIN
END 
;

�� ���ν��� ȣ�� �� ����Ʈ �Ķ���� ȣ����
CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2 := '@', V_AFT IN VARCHAR2 := 'RUDIAZZANG'  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);  
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;  -- := �� ���� �������� , �� ��� �������� ������ ���� 
	RETURN V_RSLT ;
END ;


SELECT F_DIA_DECO('#')
FROM DUAL;


CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2:= '@',  V_BEF IN VARCHAR2 , V_AFT IN VARCHAR2 := 'RUDIAZZANG'  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);  
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;
	RETURN V_RSLT ;
END ;

SELECT F_DIA_DECO('#','_' )  -- �̷��� ���� V_STR�� #�� ���ε� V_STR�� �Ⱦ��� �� ����Ʈ�� ��Ÿ���� ������ �������� ?����. 
FROM DUAL ;   
-- �ι�° ���� SETTING ���ְ� �ʹٸ� ���� �Ķ��� �տ��ź��� ���εǴϱ�. �Ⱦ��°� �ڷ� �����. ��, V_STR�� �Ⱦ��� ������ �ڷ� �������
CREATE OR REPLACE FUNCTION F_DIA_DECO( V_BEF IN VARCHAR2 , V_AFT IN VARCHAR2 := 'RUDIAZZANG',  V_STR IN VARCHAR2:= '@')  
;
-- �� ������ ȣ���� �� �տ������� 



���ν����� ���� ���� ������� ���� ����
�׳� ���� ������� ���� �־��ְ���� ���� ������ �����Ϸ���?
EXEC PN_DIA_DECO(V_STR => '!' , V_AFT => '@' )  -- �߰��� ���� ���� ����  

-- ���ν����� ���������� ������ ������� ������ ���� ��Ī�� ���ΰ��� / 
-- ����� �������� �� �ÿ� ������  => ǥ��� ��ü�� �� �� ���� 


����� ���� DML���� ���� ���ν����� DML���� ���
����� ��Į��  ; �� �÷��� �� ROW

==================================================  ������ ��ǰ� ���ν����� ������ ���ڿ� ���� �����尪 ����
;




FOR I IN 1.. V_CNT -- ���⼭�� I�� ��������, FOR�� IN���̿� ���� ���� �������� ���ϱ� INTEGER�� �������� I�� ������

java ������ for�� 
�������
1. i = 0 
2. i <= 10  -- ���⼭ ���ǿ� �ȸ����� for���� �ѹ��� ���� �ȵɼ����� 
3. for�� {} ����
4. i++

===================================================== FOR��




��Į�� ; ROW�ϳ���

ROW�� ���������? -> Ŀ���� �ʿ� (CURSOR)

List<Person> p = new List<Person>();
����Ʈ�� �ʿ��Ѹ�ŭ�� ��´� 

�������� ROW�� �ִٸ�? 
ȫ�浿 20
��浿 30
�ڱ浿 30

�̰� ���α׷������� ������ ���� (Person���� �����. VO���� ����) 
'100': ȫ�浿|20|'110'   -> '110':��浿|20|'120'  -> '120'�ڱ浿|30|'' 
'100' �� �ּ� ������ p�� ���� 


PLSQL �� FOR���� ����� �� �����Ƿ� JAVA�� ���� 
�� ���������� �����Ѽ� ���� �����������
JDBC���� rs.next() �� ���⼭�� Ŀ�� 



�׷���, �� ROW�� ���´ٸ�?
�̷��� FOR�� �ʿ���� DIERECT�� PERSON�� ������� �� �־�.

2�� �̻��̸� Ŀ���� ����� �� 
�Ƚ��ָ� TOO MANY ROWS ��� ������ �� 




===


FUNCTION�����
CREATE OR REPLACE FUNCTION F_DIA_DECOC(V_NAME IN VARCHAR2) 
RETURN VARCHAR2
IS
	V_RSLT VARCHAR2(100);
	V_TOT NUMBER(3) := 0; -- �ʱ�ȭ
BEGIN
	SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
	FROM EXAM_RSLT
	WHERE NAME = V_NAME;
	
	IF V_TOT >= 91 THEN 
		V_RSLT := 'A';
	ELSIF V_TOT >= 81 THEN 
		V_RSLT := 'B';
	ELSIF V_TOT >= 71 THEN 
		V_RSLT := 'C';	
	ELSIF V_TOT >= 61 THEN 
		V_RSLT := 'D';
	ELSE 
		V_RSLT := 'E';
	END IF;
	RETURN V_RSLT || V_TOT;
END ;



-- ����� ����� �ϴ� ����� ���ν����� ���� ���ϰ��� �� �� ���� 
CREATE OR REPLACE PROCEDURE P_DIA_DECOC(V_NAME IN VARCHAR2) 
IS
	V_RSLT VARCHAR2(100);
	V_TOT NUMBER(3) := 0; -- �ʱ�ȭ
BEGIN
	SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
	FROM EXAM_RSLT
	WHERE NAME = V_NAME;
	
	IF V_TOT >= 91 THEN 
		V_RSLT := 'A'; -- 
	ELSIF V_TOT >= 81 THEN 
		V_RSLT := 'B';
	ELSIF V_TOT >= 71 THEN 
		V_RSLT := 'C';	
	ELSIF V_TOT >= 61 THEN 
		V_RSLT := 'D';
	ELSE 
		V_RSLT := 'E';
	END IF;
	DBMS_OUTPUT.PUT_LINE(V_NAME || '���� ������ ' || V_RSLT|| '�Դϴ�.  ['  || V_TOT || '] ����');
END ;



EXEC P_DIA_DECOC('ȫ�浿')


=============================

LOOP �� ������ �ѹ��� ����
���������� ���� ��������� ������� �� 

WHILE ���� ������ ���� ���ϱ� ������ ���� ���ؼ� �ѹ��� �� �� �� ���� 
WHILE���� CONTINUE�� �ش� ���� �����ϰ� �ٽ� WHILE�������� ���°�

üũ������ ������ ���� WHILE
�߰��� ���� LOOP END �� 

;


F_FD ��� -- Ư������ ������ �ϼ� ���� ;
;

SELECT LENGTH(F_FD('20190301', '20190316', '17') ) DAYSS
FROM DUAL ;

������ ���Ϲ��� ? 4000���� ������ �Ѿ �� �����ϱ� FUNCTION�ʿ��� ���̸� ���ϰ� �ʹٸ� �ѱ� �� LENGTH�� �Ѱ���� �� 
==============================



DATATYPE ���� 

%TYPE 
%ROWTYPE

--Ŀ���� �������� �ʴ� ��� 
CREATE OR REPLACE PROCEDURE P_WISE_PROC1(V_ID  IN EXAM_RSTL.NAME%TYPE )  -- �� ���̺��� �÷��� Ÿ���� �����ְڴ�./ 
AS
    V_REC  EXAM_RSLT%ROWTYPE ;  -- EXAM_RSLT �� �� ROW�� �̸��� V_REC�̶� �ϰ� ���̺��%ROWTYPE���� Ÿ���� �������ش�. / 
BEGIN
    SELECT * INTO V_REC 
    FROM EXAM_RSLT
    WHERE NAME = V_ID ;
    -- ������� ����Ҷ��� ROW�� �ش� �÷��̸��� ����. 
    DBMS_OUTPUT.PUT_LINE(V_REC.NAME||' | '||
                     V_REC.CLASS||'  | '||V_REC.GRADE||'  | '||
                     TO_CHAR(V_REC.KOR+V_REC.ENG+V_REC.MAT)) ;
END ;




-- �͸� ���ν���
DECLARE = CREATE OR REPLACE PROCEDURE P_WISE_PROC1(V_ID  IN EXAM_RSTL.NAME%TYPE )  AS


DECLARE ��1 
����ó��
	�ý��ۿ���
	��������ǿ���
=======
DECLARE 
	V1_NUMBER NUMBER := 0;
BEGIN
	V1_NUMBER := 10/0 ; -- 0���� ������ ���� �� 
	DBMS_OUTPUT.PUT_LINE('����');
END;
=======

���̲�
DECLARE
   VI_NUMBER NUMBER := 0;
BEGIN
   VI_NUMBER := 10/0 ;
   DBMS_OUTPUT.PUT_LINE('�����ĳ�');
END;
=======
0���� ������ �̷� ������ �� 
ORA-01476: ������ 0 �Դϴ�
ORA-06512:  4��
Error code: 1476
SQL state: 22012
=======



�� ����ó�� 
-- �ý��ۿ���

DECLARE
BEGIN 
EXCEPTION WHEN OTHERS THEN 


P_WISE_PROC1
P_WISE_PROC2
	SQLCODE �� �������� ; ���Ÿ� ���� ��� ������ ������ 



CREATE OR REPLACE PROCEDURE P_WISE_PROC2
AS
  VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0;
  DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');
  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);   -- SQLCODE �� �ڵ��ȣ�� ��� 
  DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM  ; ���� �޼����� ���
  DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- �Ű����� �ִ� SQLERRM
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- ��Ÿ�ӿ����� ���ȣ ����  ; ���° �࿡�� ������ ������ �˷��� 
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
 END;

�̷������� ���� 
SQL > EXEC P_WISE_PROC2

OUTPUT > ������ �߻��߽��ϴ�
SQL ERROR CODE:-1476    -- SQLCODE
SQL ERROR MESSAGE:ORA-01476: ������ 0 �Դϴ�  -- SQLERRM
ORA-01476: ������ 0 �Դϴ�
ORA-06512: "WISE_USER.P_WISE_PROC2",  5��

ORA-01476: ������ 0 �Դϴ�

----- PL/SQL Call Stack -----      -- ȣ���� ���ÿ� �̷������� ������ ���� 
  object      line  object
  handle    number  name
00007FFD3B55EFA0        15  procedure WISE_USER.P_WISE_PROC2
00007FFD39F3C248         1  anonymous block 

-- �ڵ�						�ѹ�				NAME 

======================================
-- �ý��ۿ���
	���̸� ���ǵ� ���� ; �����ڵ�� ���������� ��Ī�س��� �� (311PAGE)
	

���� P_WISE_PROC4

TOO MANY ROWS ���ܸ��� �� 	
CREATE OR REPLACE PROCEDURE P_WISE_PROC4(VN_GRADE IN NUMBER)
AS
    V_REC EXAM_RSLT%ROWTYPE ;
BEGIN   
    SELECT * INTO V_REC
    FROM EXAM_RSLT 
    WHERE GRADE = VN_GRADE  ;
    
    DBMS_OUTPUT.PUT_LINE(V_REC.NAME);
    
    EXCEPTION WHEN TOO_MANY_ROWS THEN   -- ���ܸ��� ��Ī���� �����༭ �� �����϶��� ���� ����� �� ���� / ��Ī�� ������ ���� ���� �� ���� 
          DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');
          DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('����2');

END ;
	


=================================
-- ��Ī�� �������ֱ� 
����� ���� ����

CREATE OR REPLACE PROCEDURE P_WISE_PROC5(VS_NAME EXAM_RSLT.NAME%TYPE)
AS
   ERR_DUPLICATE_NAME EXCEPTION; -- ���� �̸��� ��� ���� ����   / EXCEPTION Ÿ���� ����  / ���ܸ� �̸� ���� 
   VN_CNT          NUMBER := 0;  -- NUMBER Ÿ���� ���� 

BEGIN
	-- ������Ģ�� ������ ������ �߻���Ű�� ���
    SELECT COUNT(*) INTO VN_CNT -- ����ũ�� �̸��� ��ȸ�ؼ� COUNT�� 
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME ;    
 
     IF VN_CNT > 0 THEN -- �̸��� ������ �� , ������ �߻���Ŵ
        RAISE ERR_DUPLICATE_NAME; -- ����� ���� ���ܸ� �ǵ������� �߻���Ŵ / RAISE ; ���� �߻� 
     END IF; 

    EXCEPTION 
    WHEN ERR_DUPLICATE_NAME THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�ش������� �̹� �����մϴ�.');
        DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM / ���⼭ ����� ���� ���� ���������� ���� 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


===================����� ���� ���� ==============================


CREATE OR REPLACE PROCEDURE P_DIA_PROC5(VS_NAME  EXAM_RSLT.NAME%TYPE)
AS 
	ERR_DUPLICATE_NAME EXCEPTION;
	VN_CNT		NUMBER := 0;
BEGIN
	SELECT COUNT(*) INTO VN_CNT 
	FROM EXAM_RSLT
	WHERE NAME = VS_NAME;
	
	IF VN_CNT > 0 THEN 
		RAISE ERR_DUPLICATE_NAME;
	END IF;
	
	EXCEPTION
	WHEN ERR_DUPLICATE_NAME THEN 
		DBMS_OUTPUT.PUT_LINE('�ش� ����� �̹� �����մϴ�');
		DBMS_OUTPUT.PUT_LINE('SQL ���� �ڵ� : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('SQL ���� �޼��� : ' || SQLERRM);
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
	

	

SQL > EXEC P_DIA_PROC5('ȫ�浿')

OUTPUT > �ش� ����� �̹� �����մϴ�
SQL ���� �ڵ� : 1
SQL ���� �޼��� : User-Defined Exception

	
	

	
================


CREATE OR REPLACE PROCEDURE P_DIA_DECOC(V_NAME IN VARCHAR2) 
AS	
	DIA_ERROR_CATCH EXCEPTION;
	V_RSLT VARCHAR2(100);
	V_TOT NUMBER(3) := 0; -- �ʱ�ȭ
BEGIN
	SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
	FROM EXAM_RSLT
	WHERE NAME = V_NAME;
	
	IF V_TOT >= 91 THEN 
		V_RSLT := 'A';
	ELSIF V_TOT >= 81 THEN 
		V_RSLT := 'B';
	ELSIF V_TOT >= 71 THEN 
		V_RSLT := 'C';	
	ELSIF V_TOT >= 61 THEN 
		V_RSLT := 'D';
	ELSE 
		RAISE DIA_ERROR_CATCH;
	END IF;
	
	EXCEPTION
	WHEN DIA_ERROR_CATCH THEN 
		DBMS_OUTPUT.PUT_LINE(V_NAME || '���� ����� Ȯ���̽ó׿�..');
		DBMS_OUTPUT.PUT_LINE('SQL ���� �ڵ� : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('SQL ���� �޼��� : ' || SQLERRM);
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END ;



EXEC P_DIA_DECOC('ȫ�浿')
=================================
SQL > EXEC P_DIA_DECOC('ȫ�浿')

OUTPUT > ȫ�浿���� ����� Ȯ���̽ó׿�..
SQL ���� �ڵ� : 1
SQL ���� �޼��� : User-Defined Exception
=================================

JAVA�� ġ�� Throws Exception������ 

=================================




�ý��� ���� 
PRAGMA �� ���̴� ������ ? COMPILER���� ȣ���ϴ� ���� ���� EXCEPTION_INIT ���� �˷���


���� �ڵ� ���� ���� 


P_WISE_PROC7

CREATE OR REPLACE PROCEDURE P_WISE_PROC7 (VS_NAME EXAM_RSLT.NAME%TYPE ,VS_STDT IN VARCHAR2 )

AS
      ERR_DUPLICATE_NAME EXCEPTION; -- ���� �̸��� ��� ���� ����
      ERR_INVALID_DATE   EXCEPTION; -- �߸��� �� ����� ���� ���� �߻�
      VN_CNT          NUMBER := 0;
      
      PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843); -- ���ܸ�� �����ڵ� ����
BEGIN					-- ���� �ڵ���� �ִµ� ���� ��Ī�� �ٿ��� �� ��Ī���� ������ ��´� 

    SELECT COUNT(*) INTO VN_CNT
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME  ;    
 
     IF VN_CNT > 0 THEN
        RAISE ERR_DUPLICATE_NAME; -- ����� ���� ���ܸ� �ǵ������� �߻���Ŵ
     END IF; 

     IF SUBSTR(VS_STDT, 5, 2) NOT BETWEEN '01' AND '12' THEN
        RAISE ERR_INVALID_DATE; -- �߸��� �� ����� ���� ���� �߻�
     END IF;
 
    EXCEPTION 
    WHEN ERR_INVALID_DATE THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�Է��� ���� �߸��Ǿ����ϴ�.');
    WHEN ERR_DUPLICATE_NAME THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�ش������� �����մϴ�.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


EXEC P_WISE_PROC7('ȫ�浵' , '20191301')


=====��� =======
SQL > EXEC P_WISE_PROC7('ȫ�浵' , '20191301')

OUTPUT > �Է��� ���� �߸��Ǿ����ϴ�.
SQL ERROR CODE:-1843
SQL ERROR MESSAGE:ORA-01843: ������ ���� �������մϴ�.


-- ����� ���� ������ �ڵ��ȣ �ʿ�����ϱ� �� �������� ����
-- PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843);  ������ �����ڵ忡 ��Ī�� ������ ȣ�����ִ� ��� 


================= �Լ��� ���� ����Ȯ�� 
-- �̸� ���ǵ� �����̱� ������ ���� ERR_INVALID_DATE
-- �Լ��� ����������� �����ڵ尡 �߸� ��Ī�� �����Ƿ� ��Ī ����ذ� EXCEPTION_INIT

CREATE OR REPLACE PROCEDURE P_WISE_PROC7 (VS_NAME EXAM_RSLT.NAME%TYPE ,VS_STDT IN VARCHAR2 )

AS
      ERR_DUPLICATE_NAME EXCEPTION; -- ���� �̸��� ��� ���� ����
      ERR_INVALID_DATE   EXCEPTION; -- �߸��� �� ����� ���� ���� �߻�
      VN_CNT          NUMBER := 0;
      VD_DATE       DATE := NULL ;
      
      PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843); -- ���ܸ�� �����ڵ� ����
BEGIN

    SELECT COUNT(*) INTO VN_CNT
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME  ;    
 
     IF VN_CNT > 0 THEN
        RAISE ERR_DUPLICATE_NAME; -- ����� ���� ���ܸ� �ǵ������� �߻���Ŵ
     END IF; 

     /*
     IF SUBSTR(VS_STDT, 5, 2) NOT BETWEEN '01' AND '12' THEN
        RAISE ERR_INVALID_DATE; -- �߸��� �� ����� ���� ���� �߻�
     END IF;
    */
 
    VD_DATE := TO_DATE(VS_STDT,'YYYYMMDD') ;  -- ���⼭ ������ ���� ERR_INVALID_DATE �� �������� ������ ����ó���� �� 
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(VD_DATE,'YYYYMMDD')) ;

    EXCEPTION 
    WHEN ERR_INVALID_DATE THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�Է��� ���� �߸��Ǿ����ϴ�.');
      DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); 
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); 
    WHEN ERR_DUPLICATE_NAME THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�ش������� �����մϴ�.');
      DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


��������� �ý��ۿ��� ; 
========================================================


���� ������ ����ؼ� ���� ���� �� ,
�����ڵ�� -20000 ~ -20999 �� ������ ������ ��밡�� 


; 



EXEC P_WISE_PROC8(-10)

-- RAISE_APPLICATION_ERROR  ��� ���ν����� ���� , �� ���ν����� DBMS_STANDARD �ý��� ��Ű���� ���� ���ν����� ����� ���� ���ܸ� �߻���ų �� ���� 
-- �����ڵ�� ���ϴ� ���� �޼����� ���� �Ű������� �Ѱ� ���ܸ� �߻���Ű�� ���� Ư¡�̴�. 


CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
    AS

    BEGIN
      IF VN_NUM <= 0 THEN        
         RAISE_APPLICATION_ERROR (-20000, '����� �Է¹��� �� �ִ� ���Դϴ�!'); -- �����ڵ�� ���� �޼����� ����� ��� ���� 
      END IF;

     DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN INVALID_NUMBER THEN  -- INVALID_NUMBER �� ���� AS �Ʒ��� �������� ���߾ ���� ��Ž
      DBMS_OUTPUT.PUT_LINE('��ġ�� �߸� �Ǿ����ϴ�.');
    WHEN OTHERS THEN			-- RAISE_APPLICATION_ERROR �� �׻� �� OTHERS �� �ɸ���. 
      DBMS_OUTPUT.PUT_LINE('����ڵ� : ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('��ϸ޼��� : ' || SQLERRM);
    END;



SQL > EXEC P_WISE_PROC8(-10)

OUTPUT > ����ڵ� : -20000
��ϸ޼� : ORA-20000: ����� �Է¹��� �� �ִ� ���Դϴ�!

======================


























 
















 














