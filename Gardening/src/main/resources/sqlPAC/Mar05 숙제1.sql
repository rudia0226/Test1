-- 2. %TYPE


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


D_REC_STU   DIA_STUDENT_REC; -- 커서의 SELECT 결과값을 레코드에 담기 위해 레코드 변수명 선언 

    CURSOR DIA_CURSOR IS    
    SELECT ID, NAME, GRADE,    --조인으로 바꿔서 SQL문 
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
			D_REC_STU.D_S_MJR := '없음';
		END IF;
        
          DBMS_OUTPUT.PUT_LINE('ID : ' || D_REC_STU.D_ID);
          DBMS_OUTPUT.PUT_LINE('이름 : ' || D_REC_STU.D_NAME);
          DBMS_OUTPUT.PUT_LINE('학년 : ' || D_REC_STU.D_GRADE);
          DBMS_OUTPUT.PUT_LINE('나이 : ' || D_REC_STU.D_AGE);
          DBMS_OUTPUT.PUT_LINE('전공 : ' || D_REC_STU.D_F_MJR);
          DBMS_OUTPUT.PUT_LINE('부전공 : ' || D_REC_STU.D_S_MJR);
      END LOOP;
END;



