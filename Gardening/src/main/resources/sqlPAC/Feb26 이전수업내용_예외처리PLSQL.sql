1. FUNCTION ����
-----------------
FUNCTION �⺻����
-----------------

CREATE OR REPLACE FUCTION F_ETCNT( V_DY IN VARCHAR2 )
RETURN NUMBER
IS

BEGIN   = {

END     = }


NUMBER F_GETCNT(VARCHAR2 V_DAY)
{
	RETURN 3 ;
}

��1)

CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2  )  
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
PRAGMA EXCEPTION_INIT (�����_����_���ܸ�, �ý���_����_�ڵ�:�̸����ǵ� �ڵ���);

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
    WHEN ERR_DUPLICATE_NAME THEN -- ����� ���� ���� ó��
      DBMS_OUTPUT.PUT_LINE('�ش������� �����մϴ�.');
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

   CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
    AS

    BEGIN
      IF VN_NUM <= 0 THEN        
         RAISE_APPLICATION_ERROR (-20000, '����� �Է¹��� �� �ִ� ���Դϴ�!');
      END IF;

     DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN INVALID_NUMBER THEN
      DBMS_OUTPUT.PUT_LINE('��ġ�� �߸� �Ǿ����ϴ�.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLCODE);
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END;
    
        
    EXEC P_WISE_PROC8(-5)    