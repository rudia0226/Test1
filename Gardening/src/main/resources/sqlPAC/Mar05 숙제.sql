

========= ����� ���� ���ڵ� =========
���� �غ��� 2

SELECT ID, NAME, GRADE, 
		 ROUND((SYSDATE - BIRTHDAY)/365) AS AG ,
		 (SELECT DNAME FROM DEPARTMENT B WHERE A.DEPTNO1 = B.DEPTNO ) F_MJR ,
		 (SELECT DNAME FROM DEPARTMENT B WHERE A.DEPTNO2 = B.DEPTNO ) S_MJR 
FROM STUDENT A;

1. ��������� ���ڵ� Ÿ��===================================

EXEC P_DIA_REC_STUINFO('75true');

CREATE OR REPLACE PROCEDURE P_DIA_REC_STUINFO(VAR_ID VARCHAR2)
AS

TYPE DIA_STUDENT_REC IS RECORD (
                      D_ID    	VARCHAR2(100),
                      D_NAME      VARCHAR2(100),
                      D_GRADE     NUMBER,
                      D_AGE     	NUMBER(10),
                      D_F_MJR      VARCHAR2(100),
                      D_S_MJR  	    VARCHAR2(100)
            );


D_REC_STU   DIA_STUDENT_REC; -- Ŀ���� SELECT ������� ���ڵ忡 ��� ���� ���ڵ� ������ ���� 

    CURSOR DIA_CURSOR IS    
    SELECT ID, NAME, GRADE, 
		 ROUND((SYSDATE - BIRTHDAY)/365) AS AG ,
		 (SELECT DNAME FROM DEPARTMENT B WHERE A.DEPTNO1 = B.DEPTNO ) F_MJR ,
		 (SELECT DNAME FROM DEPARTMENT B WHERE A.DEPTNO2 = B.DEPTNO ) S_MJR 
	FROM STUDENT A
	WHERE ID = VAR_ID;	
    
BEGIN 

    OPEN DIA_CURSOR ;
    
    LOOP
        FETCH DIA_CURSOR INTO D_REC_STU;
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        IF(D_REC_STU.D_S_MJR IS NULL) THEN
			D_REC_STU.D_S_MJR := '����';
		END IF;
        
          DBMS_OUTPUT.PUT_LINE('ID : ' || D_REC_STU.D_ID);
          DBMS_OUTPUT.PUT_LINE('�̸� : ' || D_REC_STU.D_NAME);
          DBMS_OUTPUT.PUT_LINE('�г� : ' || D_REC_STU.D_GRADE);
          DBMS_OUTPUT.PUT_LINE('���� : ' || D_REC_STU.D_AGE);
          DBMS_OUTPUT.PUT_LINE('���� : ' || D_REC_STU.D_F_MJR);
          DBMS_OUTPUT.PUT_LINE('������ : ' || D_REC_STU.D_S_MJR);
      END LOOP;
END;
