-- Feb26 
PLSQL ���� ERROR�� BATCHó�� �� �� ������ ������ ���� ���� �α׷� �ؼ� ���� �߸��Ȱ��� Ȯ�� �ϱ� ���� 


P_WISE_PROC8
-- ����� ���� �����ڵ�� �ش� ���� �ȿ� �������� �� -20000 ���� -20999 ���� 

CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS
 
 ERR_NAGATIVE_VALUE EXCEPTION; 
 
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -21000); 
 
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
========================

�̷��� �ڵ�ѹ��� �����ȿ� ���ָ� ����� ����� 
;

CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS
 
 ERR_NAGATIVE_VALUE EXCEPTION; -- 1��
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100);  -- 2��
 
BEGIN

  IF VN_NUM <= 0 THEN        
     RAISE ERR_NAGATIVE_VALUE;     -- 3�� 
  END IF;

    DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN ERR_NAGATIVE_VALUE THEN -- 3��
      DBMS_OUTPUT.PUT_LINE('����ڵ� : '||SQLCODE);
      DBMS_OUTPUT.PUT_LINE('��ϸ޼��� : '||SQLERRM);
END;



�����޼���
-- �����ڵ� �����޼��� �� �����ϴ� ��� 1~3�� 

EXEC P_WISE_PROC8(-5)



��Ī
��Ī �����ڵ� 
�����ڵ� �����޼���














