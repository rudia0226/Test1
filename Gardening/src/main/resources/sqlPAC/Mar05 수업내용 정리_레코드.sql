
-----------------------------------------------------------------------------------------
 사용자 정의형 레코드(%ROWTYPE, RECORD) ,테이블형 레코드(%TYPE)
-----------------------------------------------------------------------------------------
형식

 TYPE 레코드명 IS RECORD (
      필드명1 필드1 타입 [[NOT NULL] := 디폴트값],
      필드명2 필드2 타입 [[NOT NULL] := 디폴트값],
    ...
      );

레코드변수명 레코드명;


예1 : 사용자 정의 레코드)
  

DECLARE

     TYPE T_STD_REC IS RECORD (
              VN_STUDNO    NUMBER(4),
              VS_NAME      VARCHAR2(10),    
              VS_ID        VARCHAR2(20) ,   
              VN_GRADE     NUMBER,
              VS_JUMIN     CHAR(13) ,       
              VD_BIRTHDAY  DATE,
              VS_TEL       VARCHAR2(15)--,
            --  HEIGHT    NUMBER(4),
            --  WEIGHT    NUMBER(3),
            --  DEPTNO1   NUMBER(3),
            --  DEPTNO2   NUMBER(3),
            --  PROFNO    NUMBER(4)
      );
      
    V_STD_REC     T_STD_REC ;
    
    VN_GRADE NUMBER := 4 ;
    
    I PLS_INTEGER := 0;
    
      -- 커서 표현식을 사용한 명시적 커서 선언
     CURSOR STD_LIST_CUR IS
     SELECT STUDNO   
        ,NAME     
        ,ID       
        ,GRADE    
        ,JUMIN    
        ,BIRTHDAY 
        ,TEL 
     FROM STUDENT
     WHERE GRADE = vN_GRADE ;
     

    BEGIN

      -- 커서오픈
      OPEN STD_LIST_CUR;

      -- 명시적 커서를 받아 오는 첫 번째 LOOP
      LOOP
        -- 부서명은 변수, 사원명 결과 집합은 커서 변수에 패치
        FETCH STD_LIST_CUR INTO V_STD_REC ; --클래스명 과 ,커서를 각각변수에 담든다.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[SEQ : '|| I ||']',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('학번 : ' || V_STD_REC.VN_STUDNO) ;  
        DBMS_OUTPUT.PUT_LINE ('이름 : ' || V_STD_REC.VS_NAME );
        DBMS_OUTPUT.PUT_LINE ('ID : ' || V_STD_REC.VS_ID  );
        DBMS_OUTPUT.PUT_LINE ('학년 : ' || V_STD_REC.VN_GRADE );
        DBMS_OUTPUT.PUT_LINE ('주번 : ' || V_STD_REC.VS_JUMIN );
        DBMS_OUTPUT.PUT_LINE ('생일 : ' || V_STD_REC.VD_BIRTHDAY);
        DBMS_OUTPUT.PUT_LINE ('전화 : ' || V_STD_REC.VS_TEL);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- 첫 번째 LOOP 종료

    END;  
	
----
예2 : %ROWTYPE )	
----

DECLARE

    V_STD_REC  STUDENT%ROWTYPE ;   
    
    VN_GRADE NUMBER := 4 ;
    
    I PLS_INTEGER := 0;
    
      -- 커서 표현식을 사용한 명시적 커서 선언
     CURSOR STD_LIST_CUR IS
     SELECT STUDNO   
        ,NAME     
        ,ID       
        ,GRADE    
        ,JUMIN    
        ,BIRTHDAY 
        ,TEL 
     FROM STUDENT
     WHERE GRADE = VN_GRADE ;
     

    BEGIN

      -- 커서오픈
      OPEN STD_LIST_CUR;

      -- 명시적 커서를 받아 오는 첫 번째 LOOP
      LOOP
        -- 부서명은 변수, 사원명 결과 집합은 커서 변수에 패치
        FETCH STD_LIST_CUR INTO V_STD_REC.STUDNO,V_STD_REC.NAME,V_STD_REC.ID,
                                V_STD_REC.GRADE,V_STD_REC.JUMIN,V_STD_REC.BIRTHDAY,
                                V_STD_REC.TEL  ; --클래스명 과 ,커서를 각각변수에 담든다.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[SEQ : '|| I ||']',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('학번 : ' || V_STD_REC.STUDNO) ;  
        DBMS_OUTPUT.PUT_LINE ('이름 : ' || V_STD_REC.NAME );
        DBMS_OUTPUT.PUT_LINE ('ID : ' || V_STD_REC.ID  );
        DBMS_OUTPUT.PUT_LINE ('학년 : ' || V_STD_REC.GRADE );
        DBMS_OUTPUT.PUT_LINE ('주번 : ' || V_STD_REC.JUMIN );
        DBMS_OUTPUT.PUT_LINE ('생일 : ' || V_STD_REC.BIRTHDAY);
        DBMS_OUTPUT.PUT_LINE ('전화 : ' || V_STD_REC.TEL);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- 첫 번째 LOOP 종료

    END;   

-----------------------	
예3 : 사용자 정의 레코드)
----------------------- 

DECLARE
   
  TYPE T_STD_REC IS RECORD (              
              VS_ID        STUDENT.ID%TYPE ,  
              VS_NAME      STUDENT.NAME%TYPE, 
              VN_AGE       NUMBER(3) := 0 ,
              VN_GRADE     STUDENT.GRADE%TYPE,
              VS_FDNAME    DEPARTMENT.DNAME%TYPE ,
              VS_SDNAME    DEPARTMENT.DNAME%TYPE 
  );
      
    V_STD_REC     T_STD_REC ;
    
    VS_ID VARCHAR2(100) := 'guyume' ;
    
    I PLS_INTEGER := 0;
    
      -- 커서 표현식을 사용한 명시적 커서 선언
     CURSOR STD_LIST_CUR IS
     SELECT ID
           ,NAME
           ,CEIL((SYSDATE -BIRTHDAY)/365) AG          
           ,GRADE
           ,B.DNAME F_MJR          
           ,C.DNAME S_MJR
    FROM STUDENT A,
         DEPARTMENT  B ,
         DEPARTMENT  C         
    WHERE A.DEPTNO1 = B.DEPTNO(+)
      AND A.DEPTNO2 = C.DEPTNO(+) 
      AND A.ID = VS_ID;
     
    BEGIN

      -- 커서오픈
      OPEN STD_LIST_CUR;

      -- 명시적 커서를 받아 오는 첫 번째 LOOP
      LOOP
        -- 부서명은 변수, 사원명 결과 집합은 커서 변수에 패치
        FETCH STD_LIST_CUR INTO V_STD_REC ; --클래스명 과 ,커서를 각각변수에 담든다.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[ '|| V_STD_REC.VS_ID ||'정보]',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('ID : ' || V_STD_REC.VS_ID) ;  
        DBMS_OUTPUT.PUT_LINE ('이름 : ' || V_STD_REC.VS_NAME );
        DBMS_OUTPUT.PUT_LINE ('나이 : ' ||  V_STD_REC.VN_AGE  );
        DBMS_OUTPUT.PUT_LINE ('학년 : ' || V_STD_REC.VN_GRADE );
        DBMS_OUTPUT.PUT_LINE ('주전공 : ' || V_STD_REC.VS_FDNAME );
        DBMS_OUTPUT.PUT_LINE ('부전공 : ' || V_STD_REC.VS_SDNAME);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- 첫 번째 LOOP 종료

    END;  


-----------------------------------------------------------------------------------------
 커서형 레코드
-----------------------------------------------------------------------------------------

DECLARE
    
    VS_ID VARCHAR2(100) := 'guyume' ;
    
    I PLS_INTEGER := 0;
    
      -- 커서 표현식을 사용한 명시적 커서 선언
     CURSOR STD_LIST_CUR IS
     SELECT ID
           ,NAME
           ,CEIL((SYSDATE -BIRTHDAY)/365) AG          
           ,GRADE
           ,B.DNAME F_MJR          
           ,C.DNAME S_MJR
    FROM STUDENT A,
         DEPARTMENT  B ,
         DEPARTMENT  C         
    WHERE A.DEPTNO1 = B.DEPTNO(+)
      AND A.DEPTNO2 = C.DEPTNO(+) 
      AND A.ID = VS_ID;
      
    V_STD_REC STD_LIST_CUR%ROWTYPE ; --  커서형 레코드
    
     
    BEGIN

      -- 커서오픈
      OPEN STD_LIST_CUR;

      -- 명시적 커서를 받아 오는 첫 번째 LOOP
      LOOP
        -- 부서명은 변수, 사원명 결과 집합은 커서 변수에 패치
        FETCH STD_LIST_CUR INTO V_STD_REC ; --클래스명 과 ,커서를 각각변수에 담든다.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[ ' || V_STD_REC.ID ||'정보]',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('* ID : '   || V_STD_REC.ID) ;  
        DBMS_OUTPUT.PUT_LINE ('* 이름 : '  || V_STD_REC.NAME );
        DBMS_OUTPUT.PUT_LINE ('* 나이 : '  ||  V_STD_REC.AG  );
        DBMS_OUTPUT.PUT_LINE ('* 학년 : '  || V_STD_REC.GRADE );
        DBMS_OUTPUT.PUT_LINE ('* 주전공 : ' || V_STD_REC.F_MJR );
        DBMS_OUTPUT.PUT_LINE ('* 부전공 : ' || V_STD_REC.S_MJR);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- 첫 번째 LOOP 종료

    END;  

-----------------------------------------------------------------------------------------
중첩 레코드
-----------------------------------------------------------------------------------------

DECLARE


	 TYPE T_DEPT_REC IS RECORD (              
		VS_FDNAME    DEPARTMENT.DNAME%TYPE ,
		VS_SDNAME    DEPARTMENT.DNAME%TYPE           
	  );
	  
				  
	 TYPE T_STD_REC IS RECORD (              
				  VS_ID        STUDENT.ID%TYPE ,  
				  VS_NAME      STUDENT.NAME%TYPE, 
				  VN_AGE       NUMBER(3) := 0 ,
				  VN_GRADE     STUDENT.GRADE%TYPE,  
				  VS_DETP_REC  T_DEPT_REC   -- 중첩레코드
	  );
  
    VS_ID VARCHAR2(100) := 'guyume' ;
    
    I PLS_INTEGER := 0;
    
      -- 커서 표현식을 사용한 명시적 커서 선언
     CURSOR STD_LIST_CUR IS
     SELECT ID
           ,NAME
           ,CEIL((SYSDATE -BIRTHDAY)/365) AG          
           ,GRADE
           ,B.DNAME F_MJR          
           ,C.DNAME S_MJR
    FROM STUDENT A,
         DEPARTMENT  B ,
         DEPARTMENT  C         
    WHERE A.DEPTNO1 = B.DEPTNO(+)
      AND A.DEPTNO2 = C.DEPTNO(+) 
      AND A.ID = VS_ID;
      
    V_STD_REC T_STD_REC; --  레코드변수 선언
    
     
    BEGIN

      -- 커서오픈
      OPEN STD_LIST_CUR;

      -- 명시적 커서를 받아 오는 첫 번째 LOOP
      LOOP
        -- 부서명은 변수, 사원명 결과 집합은 커서 변수에 패치
        FETCH STD_LIST_CUR INTO V_STD_REC.VS_ID,V_STD_REC.VS_NAME, 
								V_STD_REC.VN_AGE,V_STD_REC.VN_GRADE,
								V_STD_REC.VS_DETP_REC.VS_FDNAME,
								V_STD_REC.VS_DETP_REC.VS_SDNAME	; --클래스명 과 ,커서를 각각변수에 담든다.
								
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[ ' || V_STD_REC.VS_ID ||'정보]',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('* ID : '   || V_STD_REC.VS_ID) ;  
        DBMS_OUTPUT.PUT_LINE ('* 이름 : '  || V_STD_REC.VS_NAME );
        DBMS_OUTPUT.PUT_LINE ('* 나이 : '  ||  V_STD_REC.VN_AGE  );
        DBMS_OUTPUT.PUT_LINE ('* 학년 : '  || V_STD_REC.VN_GRADE );
        DBMS_OUTPUT.PUT_LINE ('* 주전공 : ' || V_STD_REC.VS_DETP_REC.VS_FDNAME );
        DBMS_OUTPUT.PUT_LINE ('* 부전공 : ' || V_STD_REC.VS_DETP_REC.VS_SDNAME);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- 첫 번째 LOOP 종료

    END; 