-- Feb26 

Ʈ������ (ALL OR NOTHING)

Ŀ���� ��� ����� �ϴ���, Ŀ������� �ϴ� ������ �����ִ� ���� Ʈ������ 
���� ������ �����͸� �ٸ������ ���� �� �������� ���� 

��, Ŀ�� ������ �����ִ°� �� Ʈ������


COMMIT; -- �ý��ۿ��� DB�� �ݿ��ϰڴ�.
��, �α׿� ���� ���� DB�� ���߿� �ݿ��Ѵ�.

--WRITE AHEAD ; UNDO FILE ���ٰ� ���� �� (���Ϸ� ���� ) 
--DB �ý����� �װų� Ư���ð����� �ǵ����� ���� �� �� ������ ��׶��� ���μ����� �÷��� �װ� DB�� �ٿ� 


���� ; ���ν��� 
P_CNTTEST

TBL ���� ; PTEST 


CREATE OR REPLACE PROCEDURE P_CNTTEST
IS

BEGIN
    INSERT INTO PTEST
    SELECT * FROM EXAM_RSLT WHERE ROWNUM =1 ;
    COMMIT; -- �ٸ������ �� ��������� ���� �� (COMMIT ���ϸ� �ٸ�������� ���� �ȵǴ� �۾�) 
    DBMS_OUTPUT.PUT_LINE('SUCCESS');     
END ;

EXEC P_CNTTEST
;

TRUNCATE TABLE TTEST;
SELECT * FROM PTEST;

COMMIT �ϱ� ������ ���� ���ǿ��� �ٸ� ������� �� �۾��� �Ⱥ��̰�
COMMIT �ϰ� ���� ���� ���ǿ��� �ٸ� ����鿡�Ե� �� �۾��� ����� ���� 


=======================

SAVEPOINT 
-- ������ ������ �־� �� �κ����� ROLLBACK

P_TRANS01

CREATE OR REPLACE PROCEDURE P_TRANS01 
IS
 ERR_GRD_TEST EXCEPTION; 
 PRAGMA EXCEPTION_INIT (ERR_GRD_TEST, -20101); 

BEGIN

    EXECUTE IMMEDIATE 'TRUNCATE TABLE PTEST' ;   -- ���ڿ��� ��ɹ����� �ٲ㼭 ��������� 
    
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
    
    RAISE_APPLICATION_ERROR (-20101, '1�г⸸ �ԷµǾ�� ��');  -- ���⼭ ���� �߻�  (SAVEPOINT���� ���ư��� �� ���� ����Ȱ͸� COMMIT) 
     
    EXCEPTION WHEN ERR_GRD_TEST THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    ROLLBACK TO GRD_1_SUC ; -- SAVEPOINT ������ ROLLBACK

    COMMIT;   -- SAVEPOINT ���������� COMMIT   
            
END ;



�������� SAVEPOINT �� �ִٸ� ������ �ְ� �� �ȿ� �ش� EXCEPTION�� �־ �ش� SAVEPOINT�� ROLLBACK���ֵ��� ��























