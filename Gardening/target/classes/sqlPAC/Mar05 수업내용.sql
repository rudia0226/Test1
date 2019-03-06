
-- �÷��� 
-- ���ڵ� 

-- Ŀ��ǥ���� ; SELECT �� �ȿ� ��Į�� ���������� �������� ���͵� CURSOR ���̸� ��°��� 


-- ���ڵ�
�پ��� ������ Ÿ�� 
�ϳ��� ROW 
���ٹۿ� ������ �ȵ�


-- �÷��� 
������ Ÿ���� �ϳ�
�������� ROW

 
 
 
 
-- ���ڵ� 

�÷��� ������ ������ ���� �� ���ڵ庯�� 

'��������� ���ڵ���'
 TYPE ���ڵ�� IS RECORD (
      �ʵ��1 �ʵ�1 Ÿ�� [[NOT NULL] := ����Ʈ��],
      �ʵ��2 �ʵ�2 Ÿ�� [[NOT NULL] := ����Ʈ��],
    ...
      );
    ���ڵ庯���� ���ڵ��;

�÷� ã�� �� 
���ڵ��.�ʵ��



 TYPE ���ڵ�� IS RECORD (
      �ʵ��1 �ʵ�1 Ÿ�� [[NOT NULL] := ����Ʈ��],
      �ʵ��2 �ʵ�2 Ÿ�� [[NOT NULL] := ����Ʈ��],
    ...
      );
    ���ڵ庯���� ���ڵ��;



SELECT * FROM STUDENT;



TYPE DIA_STUDENT_REC IS RECORD (
	STUDNO	NUMBER(4),
	NAME		

);


1. ��������� ���ڵ� ����
2. ���ڵ庯���� ����
3. ���ڵ庯����.�ʵ�� ���� �ҷ��� 




========= ����� ���� ���ڵ� =========
���� �غ��� 1
1. ���ڵ� ����
2. ���ڵ� ������ ����
3. BEGIN ���� ���� 
	SELECT �� 





CREATE OR REPLACE PROCEDURE P_DIA_REC_STU 
AS

TYPE DIA_STUDENT_REC IS RECORD (
                      D_STUDNO    NUMBER(4),
                      D_NAME      VARCHAR2(10),
                      D_ID        VARCHAR2(20),
                      D_GRADE     NUMBER,
                      D_JUMIN     CHAR(13),
                      D_BIRTHDAY  DATE,
                      D_TEL       VARCHAR2(15)
            );


D_REC_STU   DIA_STUDENT_REC; -- Ŀ���� SELECT ������� ���ڵ忡 ��� ���� ���ڵ� ������ ���� 

D_GRADE NUMBER := 4 ;
I NUMBER(10) := 0 ; 

    CURSOR DIA_CURSOR IS    
    SELECT STUDNO
            , NAME 
            , ID 
            , GRADE 
            , JUMIN
            , BIRTHDAY
            , TEL 
    FROM STUDENT
    WHERE GRADE = D_GRADE ;
    
BEGIN 

    OPEN DIA_CURSOR ;
    
    LOOP
        FETCH DIA_CURSOR INTO D_REC_STU;
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        I := I+1 ; 
        DBMS_OUTPUT.PUT_LINE('[ ' || I || ' ] �� =======================');
          DBMS_OUTPUT.PUT_LINE('�й� : ' || D_REC_STU.D_STUDNO);
          DBMS_OUTPUT.PUT_LINE('�̸� : ' || D_REC_STU.D_NAME);
          DBMS_OUTPUT.PUT_LINE('�г� : ' || D_REC_STU.D_GRADE);
          DBMS_OUTPUT.PUT_LINE('�ֹ� : ' || D_REC_STU.D_JUMIN);
          DBMS_OUTPUT.PUT_LINE('���� : ' || D_REC_STU.D_BIRTHDAY);
          DBMS_OUTPUT.PUT_LINE('���� : ' || D_REC_STU.D_TEL);
      END LOOP;
END;







========= ����� ���� ���ڵ� =============================
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
    SELECT ID, NAME, GRADE,    --�������� �ٲ㼭 SQL�� 
		 ROUND((SYSDATE - BIRTHDAY)/365) AS AG ,
		 B.DNAME  F_MJR ,
		 C.DNAME  S_MJR 
	FROM STUDENT A , DEPARTMENT B, DEPARTMENT C
	WHERE
		A.DEPTNO1 = B.DEPTNO(+) AND 
		A.DEPTNO2 = C.DEPTNO(+) AND 
	 ID = VAR_ID;	
    
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

=============================================================




���ɸ԰� �̰� �ټ��� ��� 

1. ��������� ���ڵ�
2. ���̺���  ���ڵ� ; %TYPE
3. ���� , %TYPE (���̺� ���ڵ� / ���̺� �÷� �̶�� ��)
4. Ŀ���� ���ڵ� (���� ����ϱ� ���� )
	Ŀ���� ���ڵ�� SELECT�ؿö��� �÷��̸��� �����ϸ� �ȵ�
5. ��ø���ڵ� 








���̺��� ���ڵ� ======================================================



CREATE OR REPLACE PROCEDURE P_DIA_REC_STUINFO1(VAR_ID VARCHAR2)
AS

TYPE DIA_STUDENT_REC IS RECORD (
                      D_ID    	STUDENT.ID%TYPE,
                      D_NAME      STUDENT.NAME%TYPE,
                      D_GRADE     STUDENT.GRADE%TYPE,
                      D_AGE     	NUMBER(10),
                      D_F_MJR      DEPARTMENT.DNAME%TYPE,
                      D_S_MJR  	DEPARTMENT.DNAME%TYPE
            );


D_REC_STU   DIA_STUDENT_REC; -- Ŀ���� SELECT ������� ���ڵ忡 ��� ���� ���ڵ� ������ ���� 

    CURSOR DIA_CURSOR IS    
    SELECT ID, NAME, GRADE,    --�������� �ٲ㼭 SQL�� 
		 ROUND((SYSDATE - BIRTHDAY)/365) AS AG ,
		 B.DNAME  F_MJR ,
		 C.DNAME  S_MJR 
	FROM STUDENT A , DEPARTMENT B, DEPARTMENT C
	WHERE
		A.DEPTNO1 = B.DEPTNO(+) AND 
		A.DEPTNO2 = C.DEPTNO(+) AND 
	 ID = VAR_ID;	
    
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






Ŀ���� ���ڵ� ==================================================


CREATE OR REPLACE PROCEDURE P_DIA_REC_STUINFO2(VAR_ID VARCHAR2)
AS
    CURSOR DIA_CURSOR IS    
    SELECT ID, NAME, GRADE,    --�������� �ٲ㼭 SQL�� 
		 ROUND((SYSDATE - BIRTHDAY)/365) AS AG ,
		 B.DNAME  F_MJR ,
		 C.DNAME  S_MJR 
	FROM STUDENT A , DEPARTMENT B, DEPARTMENT C
	WHERE
		A.DEPTNO1 = B.DEPTNO(+) AND 
		A.DEPTNO2 = C.DEPTNO(+) AND 
	 ID = VAR_ID;	
    
    D_REC_STU  DIA_CURSOR%ROWTYPE ; 
    
BEGIN 

    OPEN DIA_CURSOR ;
    
    LOOP
        FETCH DIA_CURSOR INTO D_REC_STU;
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        IF(D_REC_STU.S_MJR IS NULL) THEN
			D_REC_STU.S_MJR := '����';
		END IF;
        
          DBMS_OUTPUT.PUT_LINE('ID : ' || D_REC_STU.ID);
          DBMS_OUTPUT.PUT_LINE('�̸� : ' || D_REC_STU.NAME);
          DBMS_OUTPUT.PUT_LINE('�г� : ' || D_REC_STU.GRADE);
          DBMS_OUTPUT.PUT_LINE('���� : ' || D_REC_STU.AG);
          DBMS_OUTPUT.PUT_LINE('���� : ' || D_REC_STU.F_MJR);
          DBMS_OUTPUT.PUT_LINE('������ : ' || D_REC_STU.S_MJR);
      END LOOP;
END;




��ø ���ڵ� =============================================



