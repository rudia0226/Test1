
-- Feb28




패키지는 샘플 몇개 짜보는정도로.
; 

데이터 타입을 사용자가 정의 해서 사용 ; 레코드 , 컬렉션
컬렉션은 많이 씀


 ;
 
==============================================
컬렉션 

레코드로 만드는 배열 ; 다차원 배열
;


==============================================
명시적커서 ; 아주 STANDARD 한 방법 
 DECLARE      
      VEXAM_REC EXAM_RSLT%ROWTYPE;
      VS_GRADE EXAM_RSLT.GRADE%TYPE := 2;
      
      -- 커서 선언            
      CURSOR CUR_EXAM_DATA IS
      SELECT *
       FROM EXAM_RSLT
      WHERE GRADE = VS_GRADE;
   
  BEGIN
   
      -- 커서 오픈 
      OPEN CUR_EXAM_DATA;

      -- 반복문을 통한 커서 패치작업      
      LOOP
        -- 커서 결과로 나온 로우를 패치함 
        FETCH CUR_EXAM_DATA INTO VEXAM_REC;

        -- 패치된 참조 로우가 더 없으면 LOOP 탈출
        EXIT WHEN CUR_EXAM_DATA%NOTFOUND;

        -- 사원명을 출력
        DBMS_OUTPUT.PUT_LINE( VEXAM_REC.NAME ||' | '||VEXAM_REC.CLASS ||' | '||
                             VEXAM_REC.GRADE ||' | '||
                             TO_CHAR(VEXAM_REC.KOR+VEXAM_REC.ENG+VEXAM_REC.MAT)||' | ');

       END LOOP;
       
       -- 반복문 종료 후 커서 닫기
       CLOSE CUR_EXAM_DATA;      
		
   END;


==============================================
명시적커서 ; 축약문법
커서를 선언
커서를 오픈/클로즈 할 필요가 없음 
결과 리턴받을 ROWTYPE 변수도 필요없음

 
FOR 여기서 선언된 변수 IN 커서이름
;

커서의 타입을 보고 FOR 문 안의 선언된 변수가 그걸 찾아가는 거임 ;


==============================================
커서변수 
;

강한 커서변수
약한 커서변수
시스템에서 제공하는 커서변수

커서변수는 커서라고 하는 것에 있는 값을 가르킬 수 있다.
SQL실행 값이 가르키는 주소를 변수에 담는다.

CURSOR 커서명 IS SELECT ...
==============================================
JAVA에서의 참조형 변수 ; 주소 객체 
주소가 오는건 참조형
실제값이 오는건 기본형

==============================================

약한 커서 타입 ; 보통 이걸 사용  		 TYPE 커서변수이름 IS REF CURSOR;
RETURN을 따로 설정하지 않으면 모든 타입으로 리턴 가능 

==============================================
시스템에서 제공해주는 커서타입 ;  커서이름 SYS_REFCURSOR;

==============================================

커서변수에서 결과 집합 가져오기
FETCH 커서 변수명 INTO 변수1, 변수2, ...;
FETCH 커서 변수명 INTO 레코드명;

SELECT * 
FROM EXAM_RSLT;



실습해보기
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME
AS
       -- 사원명을 받아오기 위한 변수 선언
       V_STR_NAME  EXAM_RSLT.NAME%TYPE;
   
       -- 약한 커서 타입 선언
       TYPE DIA_CURSOR_TYPE IS REF CURSOR;
       -- 커서 변수 선언
       DIA_CURSOR DIA_CURSOR_TYPE;
    BEGIN

      -- 커서 변수를 사용한 커서 정의 및 오픈
      OPEN DIA_CURSOR FOR SELECT NAME 
                         FROM EXAM_RSLT
                        WHERE GRADE = 2;

      -- LOOP문
      LOOP
         -- 커서 변수를 사용해 결과 집합을 vs_emp_name 변수에 할당
         FETCH DIA_CURSOR INTO V_STR_NAME;

        -- 더 이상 패치된 참조 로우가 없으면 LOOP 탈출(커서 변수를 이용한 커서 속성 참조)
        EXIT WHEN DIA_CURSOR%NOTFOUND;

        -- 사원명을 출력
        DBMS_OUTPUT.PUT_LINE('출력 : ' || V_STR_NAME);
      END LOOP;
   END;
    

==============================================

축약문법
커서변수 
	약한커서
	빌트인커서 
커서전달 



축약문법
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_1
IS
    BEGIN
      -- FOR문을 통한 커서 패치 작업(커서를 선언할 때 정의 부분을 FOR문에 직접 기술)
      -- OPEN / FETCH / ~ 3개를 FOR문이 대신함 
      FOR V_STR_NAME IN ( SELECT *
                        			 FROM EXAM_RSLT
                       				 WHERE GRADE = 2
                   					 )	
      LOOP
        -- 사원명을 출력, 레코드 타입은 레코드명.컬럼명 형태로 사용
      DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                   V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');
      END LOOP;

    END;
    
    


약한커서
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME
AS  

       V_STR_NAME  EXAM_RSLT%ROWTYPE;
       TYPE DIA_CURSOR_TYPE IS REF CURSOR;  -- 약한커서 
       
       DIA_CURSOR DIA_CURSOR_TYPE;
       
BEGIN
      OPEN DIA_CURSOR FOR SELECT * 
                         FROM EXAM_RSLT
                        WHERE GRADE = 2;
      LOOP
        FETCH DIA_CURSOR INTO V_STR_NAME;
		
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');
      
      END LOOP;

END;
    

빌트인커서
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_2
IS

 V_STR_NAME  EXAM_RSLT%ROWTYPE;
 DIA_CURSOR SYS_REFCURSOR;
 
BEGIN
      OPEN DIA_CURSOR FOR SELECT * 
                         FROM EXAM_RSLT
                        WHERE GRADE = 2;
      LOOP
        FETCH DIA_CURSOR INTO V_STR_NAME;
		
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');
      
      END LOOP;
END;


===========================
★ 커서전달    ;  SYS_REFCURSOR 많이 사용

CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_3
IS
 DIA_CURSOR SYS_REFCURSOR;
 V_STR_NAME EXAM_RSLT%ROWTYPE;
 
 PROCEDURE test_cursor_argu ( P_DIA IN OUT SYS_REFCURSOR)
      IS
        c_temp_curvar SYS_REFCURSOR;
      BEGIN
        -- 커서를 오픈
        OPEN c_temp_curvar FOR
        SELECT *
         FROM EXAM_RSLT
        WHERE GRADE = 2;
      P_DIA := c_temp_curvar;
      END;

    BEGIN
      test_cursor_argu (DIA_CURSOR);   -- 이거만 알고있으면 됨
      -- 프로시저 호출 후 emp_dep_curvar 변수에는 이 프로시저의 c_temp_curvar 결과가 담겨 있음

       -- ? 전달해서 받은 매개변수를 LOOP문을 사용해 결과를 출력
      LOOP
        -- 커서 변수를 사용해 결과 집합을 vs_emp_name 변수에 할당
        FETCH DIA_CURSOR INTO V_STR_NAME;
        -- 더 이상 패치된 참조 로우가 없으면 LOOP 탈출(커서 변수를 이용한 커서 속성 참조)
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        -- 사원명을 출력
         DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');

      END LOOP;

    END;  
 ========================================


커서 표현식 

커서를 이용해서 스칼라 서브쿼리에서도 에러없이 실행하기
SELECT CLASS , 
	 ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
FROM EXAM_RSLT A 
GROUP BY CLASS
;

DESC EXAM_RSLT;


SELECT CLASS , 
	CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	-- 스칼라 서브쿼리로 다중컬럼이 오면 원래는 안되지만 커서를 쓰면 됨
	-- 데이터 레벨이 안맞아도 출력해줌 
	-- 교재 354 페이지 참고 NM_AVGCLASSNM_AVG
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS  ) NM_AVG
FROM EXAM_RSLT A 
GROUP BY CLASS ;

-- 툴마다 다른데 토드에서는 값이 보임




========================================

커서표현식 예제 
;
CREATE OR REPLACE PROCEDURE P_DIA_CLASS
IS 
      -- 커서 표현식을 사용한 명시적 커서 선언
      CURSOR mytest_cursor IS
      SELECT CLASS , 
		CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
	  FROM EXAM_RSLT A 
	  GROUP BY CLASS ;


      -- 부서명을 받아오기 위한 변수
      vs_department_name EXAM_RSLT.CLASS%TYPE;

      --커서 표현식 결과를 받기 위한 커서 타입 변수
      c_emp_name SYS_REFCURSOR;

      -- 사원명을 받는 변수
      vs_emp_name EXAM_RSLT.NAME%TYPE;

    BEGIN

      -- 커서오픈
      OPEN mytest_cursor;

      -- 명시적 커서를 받아 오는 첫 번째 LOOP
      LOOP
        -- 부서명은 변수, 사원명 결과 집합은 커서 변수에 패치
        FETCH mytest_cursor INTO vs_department_name, c_emp_name;
        EXIT WHEN mytest_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('반이름 : ' || vs_department_name);

        -- 사원명(커서 표현식)을 출력하기 위한 두 번째 LOOP
        LOOP
          -- 사원명 패치
          FETCH c_emp_name INTO vs_emp_name;
          EXIT WHEN c_emp_name%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('   학생들명 : ' || vs_emp_name);

        END LOOP; -- 두 번째 LOOP 종료

      END LOOP; -- 첫 번째 LOOP 종료

    END;

========================================


CREATE OR REPLACE PROCEDURE P_DIA_CLASS
IS 
      -- 커서 표현식을 사용한 명시적 커서 선언
      CURSOR DIA_CUR IS
      SELECT CLASS , 
		CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
	  FROM EXAM_RSLT A 
	  GROUP BY CLASS ;
      VAR_CLASS EXAM_RSLT.CLASS%TYPE;
      C_CUR SYS_REFCURSOR;
      VAR_NAME EXAM_RSLT.NAME%TYPE;

    BEGIN
      OPEN DIA_CUR;

      LOOP        
        FETCH DIA_CUR INTO VAR_CLASS, C_CUR;
        EXIT WHEN DIA_CUR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('반이름 : ' || VAR_CLASS);

        LOOP         
          FETCH C_CUR INTO VAR_NAME;
          EXIT WHEN C_CUR%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('   학생들명 : ' || VAR_NAME);

        END LOOP; 
      END LOOP; 

    END;

======================================

CREATE OR REPLACE PROCEDURE P_DIA_CLASS
AS
      CURSOR DIA_CUR IS
      
      SELECT CLASS , -- 커서 사용으로 스칼라 서브쿼리 (레벨달라도) 출력가능
		CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
	  FROM EXAM_RSLT A 
	  GROUP BY CLASS ;
      
      VAR_CLASS EXAM_RSLT.CLASS%TYPE;
      
      C_CUR SYS_REFCURSOR;
      
      VAR_NAME EXAM_RSLT.NAME%ROWTYPE;
      VAR_GRADE EXAM_RSLT.GRADE%TYPE;
      VAR_TOT  NUMBER(5,1);

BEGIN
      OPEN DIA_CUR;

      LOOP        
        FETCH DIA_CUR INTO VAR_CLASS, C_CUR;
        EXIT WHEN DIA_CUR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('반이름 : ' || VAR_CLASS);

        LOOP         
          FETCH C_CUR INTO VAR_NNAME, VAR_GRADE, VAR_TOT
          EXIT WHEN C_CUR%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('  학생정보 : ' || VAR_NAME || ' |  ' ||  VAR_GRADE || ' |  ' ||  VAR_TOT );

        END LOOP; 
      END LOOP; 
END;



