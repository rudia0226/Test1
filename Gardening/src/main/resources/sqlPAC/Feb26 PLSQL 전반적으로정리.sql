plsql ����

 a. function => select 
 b. procedure => exec procedure_name
 c. package   => procedure(n) + function(n) 


1. FUNCTION ����
-----------------
FUNCTION �⺻����
-----------------

CREATE OR REPLACE FUCTION F_ETCNT( V_DY IN VARCHAR2 )
RETURN NUMBER
AS[IS]

BEGIN   = {

  RETURN 3 ;

END     = }



NUMBER F_GETCNT(VARCHAR2 V_DAY)
{
	RETURN 3 ;
}

----------------------------------------------------------------------------------------------------

ȣ�� ���

[PROCEDURE ]

CREATE OR REPLACE PROCEDURE PN_DECO_NP(V_STR IN VARCHAR2 := 'ABC',  V_BEF IN VARCHAR2 := '$' , V_AFT IN VARCHAR2 := '%' )  
IS
    V_RSLT VARCHAR2(100);  
BEGIN
    V_RSLT := V_BEF ||  V_STR  || V_AFT ;
    DBMS_OUTPUT.PUT_LINE(V_RSLT) ;
END ;
/

[����]
EXEC PN_DIA_DECO(V_STR => 'A',V_AFT => '!' ) 


[FUCTION ]


CREATE OR REPLACE FUNCTION F_DECO_NF(V_STR IN VARCHAR2 := 'ABC',  V_BEF IN VARCHAR2 := '$' , V_AFT IN VARCHAR2 := '%' )  
RETURN VARCHAR2  
IS
    V_RSLT VARCHAR2(
END ;
/

����

SELECT F_DIA_DECO(V_STR => 'A',V_AFT => '!' )
FROM DUAL


--------------------------------------------------------------------------------

��1)

CREATE OR REPLACE FUNCTION F_DECOA(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);  
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;
	RETURN V_RSLT ;
END ;
/

------------------------------------------------------------------
��2) FOR�� + ����

CREATE OR REPLACE FUNCTION F_DECOB(V_STR IN VARCHAR2, V_BEF IN VARCHAR2, V_AFT IN VARCHAR2, V_CNT IN VARCHAR2) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(100);	
BEGIN   
    
    V_RSLT := V_STR ;
    
    FOR I IN 1.. V_CNT
    LOOP 
        V_RSLT :=  V_BEF || V_RSLT || V_AFT ;
    END LOOP ;
    
    RETURN V_RSLT ;
END  ;    


DROP FUNCTION F_DECOB

SELECT F_DECOB(TO_CHAR(NO),'*','#',5)
FROM TA


------------------------------------------------------------------
��3) SELECT + IF�� + ���� +RETURN �� ���� 

DROP FUNCTION F_DECOC

CREATE OR REPLACE FUNCTION F_DECOC(V_NAME IN VARCHAR2) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(100);
    V_TOT  NUMBER(3) := 0 ; BEGIN   

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

SELECT NAME, F_DECOC(NAME)
FROM EXAM_RSLT

SELECT NAME          
          ,SUBSTR(VAL,2) TOT
          ,SUBSTR(VAL,1,1) GRD
FROM (
            SELECT NAME
                     ,F_DECOC(NAME) VAL
            FROM EXAM_RSLT
          )  

		  
------------------------------------------------------------------

��4) LOOP�� + ���� +RETURN ������ ���� ����  

DROP FUNCTION F_DECOD

CREATE OR REPLACE FUNCTION F_DECOD(V_LEV IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 0;
BEGIN
     LOOP            
           V_CNT := V_CNT+1 ;
           EXIT WHEN V_CNT > 9;  -- LOOP�� �ȿ��� ��
           V_RSLT :=   V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;
      END LOOP;
      RETURN V_RSLT ;
END ;



SELECT F_DECOD(3)
FROM DUAL


------------------------------------------------------------------

��5) WHILE  + ���� 


DROP FUNCTION F_DECOF

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

SELECT F_DECOD(3)
FROM DUAL

-- DEBUGING => PROCEDURE�� ��ȯ�� ����

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

EXEC P_DECOF(5)
------------------------------------------------------------------

��6) WHILE  + ����(Ư�� ��ȣ���� SKIP) + CONTINUE 

DROP FUNCTION F_DECOG

CREATE OR REPLACE FUNCTION F_DECOG(V_LEV IN NUMBER,V_SKIPNO IN NUMBER) 
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


SELECT F_DECOG(3,5)
FROM DUAL

 
------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION F_FD(V_STDT IN VARCHAR2,V_ETDT IN VARCHAR2,V_PTN VARCHAR2) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
BEGIN

    V_RSLT := TRANSLATE(
            RPAD(
                    SUBSTR('1234567',TO_CHAR(TO_DATE(V_STDT,'YYYYMMDD'),'D') ),
                    TO_DATE(V_ETDT,'YYYYMMDD') - TO_DATE(V_STDT,'YYYYMMDD') +1
                    ,'1234567'
                    ),' '||V_PTN,' ') ;
                    
    RETURN V_RSLT ;
END ;



SELECT F_FD('20190208','20190217','23')
FROM DUAL



--------------------------------------------------------
--------------------------------------------------------

PROCEDURE ��1
%TYPE (V_ID), %ROWTYPE (V_REC) ����
----------------------------------


CREATE OR REPLACE PROCEDURE P_WISE_PROC1(V_ID  IN EXAM_RSTL.NAME%TYPE ) 
AS
    V_REC  EXAM_RSLT%ROWTYPE ;
    
BEGIN

    SELECT * INTO V_REC 
    FROM EXAM_RSLT
    WHERE NAME = V_ID ;
    
    DBMS_OUTPUT.PUT_LINE(V_REC.NAME||' | '||
                     V_REC.CLASS||'  | '||V_REC.GRADE||'  | '||
                     TO_CHAR(V_REC.KOR+V_REC.ENG+V_REC.MAT)) ;
    
END ;


----------------------------------

DECLARE  = CREATE OR REPLACE PROCEDURE P_WISE_PROC1(V_ID  IN EXAM_RSTL.NAME%TYPE ) AS

PROCEDURE ��1
����ó��
  -�ý��� ����
  -����� ���� ����   
----------------------------------
-�ý��� ����

DECLARE
  VI_NUMBER NUMBER := 0;
BEGIN
  VI_NUMBER := 10 / 0;  // ���⼭ ���� 
  DBMS_OUTPUT.PUT_LINE('����!');
END;


----------------------------------
-�ý��� ����

DECLARE
 VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0; // ���⼭ ����ó�� ��ƾ���� ���� �ٽ� �۾�����
  DBMS_OUTPUT.PUT_LINE('����!');  
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');
  VI_NUM := 10 / 1;
  DBMS_OUTPUT.PUT_LINE(VI_NUM);
  DBMS_OUTPUT.PUT_LINE('����!');
END;

----------------------------------
-�ý��� ���� �޼��� ���

CREATE OR REPLACE PROCEDURE P_WISE_PROC2
AS
  VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0;
  DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');
  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
  DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM
  DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- �Ű����� �ִ� SQLERRM
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- ��Ÿ�ӿ����� ���ȣ ����
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
 END;  
   

EXEC P_WISE_PROC2

----------------------------------
- �ý��� ���� ( �ý��� ���ܸ��� ��� => �̸����ǵ� ����)

����ó�� �� OTHERS �ܿ��� �ý��� ���ܸ��� ����� �� �ִµ�,
�̸� �̸� ���ǵ� ����predefined exception�� �Ѵ�.
������ ���ܸ�Ī�� ���

��) ORA-01476 => ZERO_DIVIDE (���ܸ� �ý��ۿ��� �̸����) => ���ܼ��� :0���� ���� ��

CREATE OR REPLACE PROCEDURE P_WISE_PROC3
AS
  VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0;
  DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN ZERO_DIVIDE THEN
  DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');
  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
  DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM
  DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- �Ű����� �ִ� SQLERRM
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- ��Ÿ�ӿ����� ���ȣ ����
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
 END;  
   

-----------------------

CREATE OR REPLACE PROCEDURE P_WISE_PROC4(VN_GRADE IN NUMBER)
AS
    V_REC EXAM_RSLT%ROWTYPE ;
BEGIN   
    SELECT * INTO V_REC
    FROM EXAM_RSLT 
    WHERE GRADE = VN_GRADE;
    
    EXCEPTION WHEN TOO_MANY_ROWS THEN
          DBMS_OUTPUT.PUT_LINE('������ �߻��߽��ϴ�');
          DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('����2');

END ;

----------------------------
����� ���� ����   
 �����ڰ� ���� ���ܸ� ����
 
�� ���� ����: �����_����_���ܸ� EXCEPTION;
����� ���ܸ� ����Ϸ��� �ϴ� ������ ���ó�� PL/SQL ����� ����ο� ���ܸ� �����ؾ� �Ѵ�.

�� ���� �߻���Ű��: RAISE �����_����_���ܸ�;
�ý��� ���ܴ� �ش� ���ܰ� �ڵ����� ���������, ����� ���� ���ܴ� ���� ���ܸ� �߻����Ѿ� �ϴµ�, ��RAISE ���ܸ�;�� ���·� ����Ѵ�.

�� �߻��� ���� ó��: EXCEPTION WHEN �����_����_���ܸ� THEN ��.
���ܸ� �߻���Ű�� �ڵ����� ������� EXCEPTION ���� �Ѿ���Ƿ� �ý��� ���ܿ� ������ ������� ó���� �ָ� �ȴ�.


CREATE OR REPLACE PROCEDURE P_WISE_PROC5(VS_NAME EXAM_RSLT.NAME%TYPE)
AS
   ERR_DUPLICATE_NAME EXCEPTION; -- ���� �̸��� ��� ���� ����
   VN_CNT          NUMBER := 0;

BEGIN

    SELECT COUNT(*) INTO VN_CNT
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME ;    
 
     IF VN_CNT > 0 THEN
        RAISE ERR_DUPLICATE_NAME; -- ����� ���� ���ܸ� �ǵ������� �߻���Ŵ
     END IF; 

    EXCEPTION 
    WHEN ERR_DUPLICATE_NAME THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�ش������� �̹� �����մϴ�.');
	  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- �Ű����� ���� SQLERRM
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;

 EXEC P_WISE_PROC5('ȫ�浿')
 
---------------------------------------------------------------------------------
�ý��� ���ܿ� �̸� �ο��ϱ� => ����� ���� ���ܸ� ������ ������ �ý��ۿ��ܿ� �̸��� �ο��ϴ� ���
PRAGMA EXCEPTION_INIT (�����_����_���ܸ�, �ý���_����_�ڵ�:�̸����ǵ� �ڵ��� OR ��������� �����ڵ�);

=> �̹� �ִ� �ý����ڵ忡 �����޼��� ��Ī�� �ο��ؼ� ����ó������ WHEN ���� ������Ī���� ������ ��� ���� ���
-----------------------------------------------------------------------------------


�ý��� ���ܿ��� ZERO_DIVIDE, INVALID_NUMBER ���� �̸� ���ǵ� ���ܰ� �־���.
������ �̵�ó�� ���ܸ��� �ο��� ���� �ý��� ���� �� �ؼҼ��̰� �������� �����ڵ常 �����Ѵ�. 
���� �̸��� ���� �̷� ���ܿ� �̸��� �ο��ϸ� �ڵ尡 �ξ� �б� ���� �Ӹ� �ƴ϶�, �ش� �ڵ��� ������ �ľ��ϴ� �͵� ���� ��������. 
�׷��ٸ� ���� �̸��� ��� �ο��ϴ� ���ϱ�? �� ����� �����ϸ� ������ ����.

�� ����� ���� ���� ����: �����_����_���ܸ� EXCEPTION;
����ο��� ����� ���� ���ܸ� �����Ѵ�.
�� ����� ���� ���ܸ�� �ý��� ���� �ڵ� ����: PRAGMA EXCEPTION_INIT (�����_����_���ܸ�, �ý���_����_�ڵ�);
8�忡�� ����� PRAGMA EXCEPTION_INIT�� ����ϴµ�, �翡�� ������ ���ܸ�� �ý��� �����ڵ带 ����Ѵ�.
�� �߻��� ���� ó��: EXCEPTION WHEN �����_����_���ܸ� THEN ��.

PRAGMA EXCEPTION_INIT(���ܸ�, ���ܹ�ȣ)
����� ���� ���� ó���� �� �� ���Ǵµ�, Ư�� ���ܹ�ȣ�� ����ؼ� �����Ϸ��� �� ���ܸ� ����Ѵٴ� ���� �˸��� ������ �Ѵ�.


���� �ڵ�� 0�̳� 100�� ������ ���, �׸��� -10000000 ���� ���� ����� �� ����.

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

     IF SUBSTR(VS_STDT, 5, 2) NOT BETWEEN '01' AND '12' THEN
        RAISE ERR_INVALID_DATE; -- �߸��� �� ����� ���� ���� �߻�
     END IF;
	
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


EXEC P_WISE_PROC7('ȫ�浵','20191301')
EXEC P_WISE_PROC7('ȫ�浿','20191301')


----------------
�Լ��� ���� ����Ȯ��


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
 
	VD_DATE := TO_DATE(VS_STDT,'YYYYMMDD') ;
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


EXEC P_WISE_PROC7('ȫ�浵','20191301')
EXEC P_WISE_PROC7('ȫ�浿','20191301')



------------------------------------------------------------------------------
����ڰ� �����ڵ�� ���ܸ޽����� ����ؼ� ����ϰ� �������
RAISE_APPLICATION_ERROR (�����ڵ�, ���� �޽���); // �Ѵ� ����ڰ� �����ؼ� ����.
                                             �� ���⿡�� ���ܸ��� ���ϼ���� EXCEPTION���� ���ܸ����� ����ó����
                                             �Ҽ��¾���.											 
���� �ڵ�� ���� �޽����� ����ڰ� ���� ������ �� �ִµ�, �����ڵ�� -20000 ~ -20999 �������� ����� �� �ִ�
------------------------------------------------------------------------------
-- ����� ���� �����ڵ� �� ��Ī����
 --PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -21000); 
-------------------------------------------------------------------------------- 
 
CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS
 
 ERR_NAGATIVE_VALUE EXCEPTION; 
 
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100); 
 
BEGIN

  IF VN_NUM <= 0 THEN        
     RAISE ERR_NAGATIVE_VALUE;	 
  END IF;

	DBMS_OUTPUT.PUT_LINE(VN_NUM);

	EXCEPTION
	 WHEN ERR_NAGATIVE_VALUE THEN
	  DBMS_OUTPUT.PUT_LINE('����ڵ� : '||SQLCODE);
	  DBMS_OUTPUT.PUT_LINE('��ϸ޼��� : '||SQLERRM);
END;
        
EXEC P_WISE_PROC8(-5)    

------------------------------------------------------------------------------
-- ����� ���� �����ڵ� + ��Ī���� + �޼��� ���
 --PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -21000);

 --1. ��Ī:  ERR_NAGATIVE_VALUE EXCEPTION; 
 --2. ��Ī + �����ڵ� : PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100); 
 --3. �����ڵ� + �����޼��� : RAISE_APPLICATION_ERROR (-20100, '����� �Է¹��� �� �ִ� ���Դϴ�!'); 
-------------------------------------------------------------------------------- 
 

CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS

 ERR_NAGATIVE_VALUE EXCEPTION; 
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100); 
 
BEGIN

  IF VN_NUM <= 0 THEN        
     --RAISE ERR_NAGATIVE_VALUE;     
     RAISE_APPLICATION_ERROR (-20100, '����� �Է¹��� �� �ִ� ���Դϴ�!'); 
  END IF;

    DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN ERR_NAGATIVE_VALUE THEN
      DBMS_OUTPUT.PUT_LINE('����ڵ� : '||SQLCODE);
      DBMS_OUTPUT.PUT_LINE('��ϸ޼��� : '||SQLERRM);
END;


EXEC P_WISE_PROC8(-5)


---------------------------
TRANSACTION => SAVEPOINT
------------------------------

CREATE OR REPLACE PROCEDURE P_TRANS01 
IS
 ERR_GRD_TEST EXCEPTION; 
 PRAGMA EXCEPTION_INIT (ERR_GRD_TEST, -20101); 

BEGIN

    EXECUTE IMMEDIATE 'TRUNCATE TABLE PTEST' ;   
    
    INSERT INTO PTEST
    SELECT * 
    FROM EXAM_RSLT 
    WHERE GRADE =1 ;
    
    DBMS_OUTPUT.PUT_LINE (' SAVEPOINT GRD_1_SUC => ���� ') ;
    
    SAVEPOINT GRD_1_SUC ;
    
    INSERT INTO PTEST
    SELECT * 
    FROM EXAM_RSLT 
    WHERE GRADE =2 ;
    
    RAISE_APPLICATION_ERROR (-20101, '1�г⸸ �ԷµǾ�� ��'); 
     
    EXCEPTION WHEN ERR_GRD_TEST THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    ROLLBACK TO GRD_1_SUC ; -- SAVEPOINT ������ ROLLBACK

    COMMIT;   -- SAVEPOINT ���������� COMMIT   
            
END ;
/


---------------------------
IMPLICIT CURSOR
������Ŀ�� -- Ŀ���Ӽ�
------------------------------


DECLARE
  VN_GRADE  EXAM_RSLT_P.GRADE%TYPE := 2;
BEGIN
  UPDATE EXAM_RSLT_P
     SET CLASS = SUBSTR(CLASS,1,2)||'Ŭ����'
   WHERE GRADE = VN_GRADE;

  IF SQL%NOTFOUND THEN 
    DBMS_OUTPUT.PUT_LINE('����Ǽ� ����');
   END IF ; 
   
  IF SQL%FOUND THEN 
     DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
   END IF ; 
  
  COMMIT;
END;

---------------------------
EXPLICT CURSOR
�����Ŀ�� -- Ŀ���Ӽ�
------------------------------

 DECLARE      
      VEXAM_REC EXAM_RSLT%ROWTYPE;
      VS_GRADE EXAM_RSLT.GRADE%TYPE := 2;
      
      -- Ŀ�� ����            
      CURSOR CUR_EXAM_DATA IS
      SELECT *
       FROM EXAM_RSLT
      WHERE GRADE = VS_GRADE;
   
  BEGIN
   
      -- Ŀ�� ���� 
      OPEN CUR_EXAM_DATA;

      -- �ݺ����� ���� Ŀ�� ��ġ�۾�      
      LOOP
        -- Ŀ�� ����� ���� �ο츦 ��ġ�� 
        FETCH CUR_EXAM_DATA INTO VEXAM_REC;

        -- ��ġ�� ���� �ο찡 �� ������ LOOP Ż��
        EXIT WHEN CUR_EXAM_DATA%NOTFOUND;

        -- ������� ���
        DBMS_OUTPUT.PUT_LINE( VEXAM_REC.NAME ||' | '||VEXAM_REC.CLASS ||' | '||
                             VEXAM_REC.GRADE ||' | '||
                             TO_CHAR(VEXAM_REC.KOR+VEXAM_REC.ENG+VEXAM_REC.MAT)||' | ');

       END LOOP;
       
       -- �ݺ��� ���� �� Ŀ�� �ݱ�
       CLOSE CUR_EXAM_DATA;      
		
   END;




