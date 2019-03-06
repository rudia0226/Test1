
-- 컬렉션 
-- 레코드 

-- 커서표현식 ; SELECT 절 안에 스칼라 서브쿼리에 다중행이 나와도 CURSOR 붙이면 출력가능 


-- 레코드
다양한 데이터 타입 
하나의 ROW 
한줄밖에 선언이 안됨


-- 컬렉션 
데이터 타입은 하나
여러개의 ROW

 
 
 
 
-- 레코드 

컬럼을 여러개 조합해 선언 한 레코드변수 

'사용자정의 레코드형'
 TYPE 레코드명 IS RECORD (
      필드명1 필드1 타입 [[NOT NULL] := 디폴트값],
      필드명2 필드2 타입 [[NOT NULL] := 디폴트값],
    ...
      );
    레코드변수명 레코드명;

컬럼 찾을 때 
레코드명.필드명



 TYPE 레코드명 IS RECORD (
      필드명1 필드1 타입 [[NOT NULL] := 디폴트값],
      필드명2 필드2 타입 [[NOT NULL] := 디폴트값],
    ...
      );
    레코드변수명 레코드명;



SELECT * FROM STUDENT;



TYPE DIA_STUDENT_REC IS RECORD (
	STUDNO	NUMBER(4),
	NAME		

);


1. 사용자정의 레코드 선언
2. 레코드변수명 선언
3. 레코드변수명.필드명 으로 불러옴 




========= 사용자 정의 레코드 =========
예제 해보기 1
1. 레코드 선언
2. 레코드 변수명 선언
3. BEGIN 부터 시작 
	SELECT 절 





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


D_REC_STU   DIA_STUDENT_REC; -- 커서의 SELECT 결과값을 레코드에 담기 위해 레코드 변수명 선언 

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
        DBMS_OUTPUT.PUT_LINE('[ ' || I || ' ] 번 =======================');
          DBMS_OUTPUT.PUT_LINE('학번 : ' || D_REC_STU.D_STUDNO);
          DBMS_OUTPUT.PUT_LINE('이름 : ' || D_REC_STU.D_NAME);
          DBMS_OUTPUT.PUT_LINE('학년 : ' || D_REC_STU.D_GRADE);
          DBMS_OUTPUT.PUT_LINE('주민 : ' || D_REC_STU.D_JUMIN);
          DBMS_OUTPUT.PUT_LINE('생일 : ' || D_REC_STU.D_BIRTHDAY);
          DBMS_OUTPUT.PUT_LINE('전번 : ' || D_REC_STU.D_TEL);
      END LOOP;
END;







========= 사용자 정의 레코드 =============================
예제 해보기 2

SELECT ID, NAME, GRADE, 
		 ROUND((SYSDATE - BIRTHDAY)/365) AS AG ,
		 (SELECT DNAME FROM DEPARTMENT B WHERE A.DEPTNO1 = B.DEPTNO ) F_MJR ,
		 (SELECT DNAME FROM DEPARTMENT B WHERE A.DEPTNO2 = B.DEPTNO ) S_MJR 
FROM STUDENT A;

1. 사용자정의 레코드 타입===================================

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

=============================================================




점심먹고 이거 다섯개 출력 

1. 사용자정의 레코드
2. 테이블형  레코드 ; %TYPE
3. 조인 , %TYPE (테이블 레코드 / 테이블 컬럼 이라고도 함)
4. 커서형 레코드 (가장 사용하기 쉬움 )
	커서형 레코드는 SELECT해올때의 컬럼이름을 변경하면 안됨
5. 중첩레코드 








테이블형 레코드 ======================================================



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






커서형 레코드 ==================================================


CREATE OR REPLACE PROCEDURE P_DIA_REC_STUINFO2(VAR_ID VARCHAR2)
AS
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
    
    D_REC_STU  DIA_CURSOR%ROWTYPE ; 
    
BEGIN 

    OPEN DIA_CURSOR ;
    
    LOOP
        FETCH DIA_CURSOR INTO D_REC_STU;
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        IF(D_REC_STU.S_MJR IS NULL) THEN
			D_REC_STU.S_MJR := '없음';
		END IF;
        
          DBMS_OUTPUT.PUT_LINE('ID : ' || D_REC_STU.ID);
          DBMS_OUTPUT.PUT_LINE('이름 : ' || D_REC_STU.NAME);
          DBMS_OUTPUT.PUT_LINE('학년 : ' || D_REC_STU.GRADE);
          DBMS_OUTPUT.PUT_LINE('나이 : ' || D_REC_STU.AG);
          DBMS_OUTPUT.PUT_LINE('전공 : ' || D_REC_STU.F_MJR);
          DBMS_OUTPUT.PUT_LINE('부전공 : ' || D_REC_STU.S_MJR);
      END LOOP;
END;




중첩 레코드 =============================================



