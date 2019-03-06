plsql 개발

 a. function => select 
 b. procedure => exec procedure_name
 c. package   => procedure(n) + function(n) 


1. FUNCTION 기초
-----------------
FUNCTION 기본구조
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

호출 방법

[PROCEDURE ]

CREATE OR REPLACE PROCEDURE PN_DECO_NP(V_STR IN VARCHAR2 := 'ABC',  V_BEF IN VARCHAR2 := '$' , V_AFT IN VARCHAR2 := '%' )  
IS
    V_RSLT VARCHAR2(100);  
BEGIN
    V_RSLT := V_BEF ||  V_STR  || V_AFT ;
    DBMS_OUTPUT.PUT_LINE(V_RSLT) ;
END ;
/

[가능]
EXEC PN_DIA_DECO(V_STR => 'A',V_AFT => '!' ) 


[FUCTION ]


CREATE OR REPLACE FUNCTION F_DECO_NF(V_STR IN VARCHAR2 := 'ABC',  V_BEF IN VARCHAR2 := '$' , V_AFT IN VARCHAR2 := '%' )  
RETURN VARCHAR2  
IS
    V_RSLT VARCHAR2(
END ;
/

오류

SELECT F_DIA_DECO(V_STR => 'A',V_AFT => '!' )
FROM DUAL


--------------------------------------------------------------------------------

예1)

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
예2) FOR문 + 로직

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
예3) SELECT + IF문 + 로직 +RETURN 후 분할 

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

예4) LOOP문 + 로직 +RETURN 여러개 지만 한줄  

DROP FUNCTION F_DECOD

CREATE OR REPLACE FUNCTION F_DECOD(V_LEV IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 0;
BEGIN
     LOOP            
           V_CNT := V_CNT+1 ;
           EXIT WHEN V_CNT > 9;  -- LOOP문 안에서 비교
           V_RSLT :=   V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;
      END LOOP;
      RETURN V_RSLT ;
END ;



SELECT F_DECOD(3)
FROM DUAL


------------------------------------------------------------------

예5) WHILE  + 로직 


DROP FUNCTION F_DECOF

CREATE OR REPLACE FUNCTION F_DECOF(V_LEV IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 1;
BEGIN
    WHILE V_CNT <= 9   --먼저 비교
	LOOP   
       V_RSLT :=   V_RSLT||V_LEV ||' X '||V_CNT||' = '||V_LEV * V_CNT||CHR(13) ;
	   V_CNT := V_CNT+1 ;
    END LOOP;
    RETURN V_RSLT ;
END ;

SELECT F_DECOD(3)
FROM DUAL

-- DEBUGING => PROCEDURE로 변환후 실행

CREATE OR REPLACE PROCEDURE P_DECOF(V_LEV IN NUMBER) 
--RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 1;
BEGIN
    WHILE V_CNT <= 9   --먼저 비교
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

예6) WHILE  + 로직(특정 번호곱셈 SKIP) + CONTINUE 

DROP FUNCTION F_DECOG

CREATE OR REPLACE FUNCTION F_DECOG(V_LEV IN NUMBER,V_SKIPNO IN NUMBER) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(4000) ;
    V_CNT  NUMBER(10) := 0;
BEGIN
    WHILE V_CNT <= 9   --먼저 비교
    LOOP    
     
	 V_CNT := V_CNT+1 ;       
     CONTINUE WHEN V_CNT = V_SKIPNO ; --조건만족시 WHILE V_CNT <= 9 로 이동해서 다시계속(CONTINUE)수행
                
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

PROCEDURE 예1
%TYPE (V_ID), %ROWTYPE (V_REC) 예제
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

PROCEDURE 예1
예외처리
  -시스템 예외
  -사용자 정의 예외   
----------------------------------
-시스템 예외

DECLARE
  VI_NUMBER NUMBER := 0;
BEGIN
  VI_NUMBER := 10 / 0;  // 여기서 멈춤 
  DBMS_OUTPUT.PUT_LINE('성공!');
END;


----------------------------------
-시스템 예외

DECLARE
 VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0; // 여기서 오류처리 루틴으로 가서 다시 작업가능
  DBMS_OUTPUT.PUT_LINE('성공!');  
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');
  VI_NUM := 10 / 1;
  DBMS_OUTPUT.PUT_LINE(VI_NUM);
  DBMS_OUTPUT.PUT_LINE('성공!');
END;

----------------------------------
-시스템 예외 메세지 출력

CREATE OR REPLACE PROCEDURE P_WISE_PROC2
AS
  VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0;
  DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');
  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
  DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM
  DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- 매개변수 있는 SQLERRM
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- 런타임오류의 행번호 리턴
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
 END;  
   

EXEC P_WISE_PROC2

----------------------------------
- 시스템 예외 ( 시스템 예외명을 사용 => 미리정의된 예외)

예외처리 시 OTHERS 외에도 시스템 예외명을 사용할 수 있는데,
이를 미리 정의된 예외predefined exception라 한다.
고유의 예외명칭을 사용

예) ORA-01476 => ZERO_DIVIDE (예외명 시스템에서 미리등록) => 예외설명 :0으로 나눌 때

CREATE OR REPLACE PROCEDURE P_WISE_PROC3
AS
  VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0;
  DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN ZERO_DIVIDE THEN
  DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');
  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
  DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM
  DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- 매개변수 있는 SQLERRM
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- 런타임오류의 행번호 리턴
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
          DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');
          DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('오류2');

END ;

----------------------------
사용자 정의 예외   
 개발자가 직접 예외를 정의
 
① 예외 정의: 사용자_정의_예외명 EXCEPTION;
사용자 예외를 사용하려면 일단 변수나 상수처럼 PL/SQL 블록의 선언부에 예외를 정의해야 한다.

② 예외 발생시키기: RAISE 사용자_정의_예외명;
시스템 예외는 해당 예외가 자동으로 검출되지만, 사용자 정의 예외는 직접 예외를 발생시켜야 하는데, “RAISE 예외명;” 형태로 사용한다.

③ 발생된 예외 처리: EXCEPTION WHEN 사용자_정의_예외명 THEN ….
예외를 발생시키면 자동으로 제어권이 EXCEPTION 절로 넘어오므로 시스템 예외와 동일한 방식으로 처리해 주면 된다.


CREATE OR REPLACE PROCEDURE P_WISE_PROC5(VS_NAME EXAM_RSLT.NAME%TYPE)
AS
   ERR_DUPLICATE_NAME EXCEPTION; -- 동일 이름을 경우 예외 선언
   VN_CNT          NUMBER := 0;

BEGIN

    SELECT COUNT(*) INTO VN_CNT
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME ;    
 
     IF VN_CNT > 0 THEN
        RAISE ERR_DUPLICATE_NAME; -- 사용자 정의 예외를 의도적으로 발생시킴
     END IF; 

    EXCEPTION 
    WHEN ERR_DUPLICATE_NAME THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('해당사원명이 이미 존재합니다.');
	  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;

 EXEC P_WISE_PROC5('홍길동')
 
---------------------------------------------------------------------------------
시스템 예외에 이름 부여하기 => 사용자 정의 예외를 가지고 기존의 시스템예외에 이름을 부여하는 방법
PRAGMA EXCEPTION_INIT (사용자_정의_예외명, 시스템_예외_코드:미리정의된 코드임 OR 사용자정의 에러코드);

=> 이미 있는 시스템코드에 에러메세지 명칭을 부여해서 에러처리절의 WHEN 에서 에러명칭으로 에러를 잡기 위한 방법
-----------------------------------------------------------------------------------


시스템 예외에는 ZERO_DIVIDE, INVALID_NUMBER 같이 미리 정의된 예외가 있었다.
하지만 이들처럼 예외명이 부여된 것은 시스템 예외 중 극소수이고 나머지는 예외코드만 존재한다. 
예외 이름이 없는 이런 예외에 이름을 부여하면 코드가 훨씬 읽기 편할 뿐만 아니라, 해당 코드의 로직을 파악하는 것도 아주 쉬워진다. 
그렇다면 예외 이름은 어떻게 부여하는 것일까? 그 방법을 정리하면 다음과 같다.

① 사용자 정의 예외 선언: 사용자_정의_예외명 EXCEPTION;
선언부에서 사용자 정의 예외를 선언한다.
② 사용자 정의 예외명과 시스템 예외 코드 연결: PRAGMA EXCEPTION_INIT (사용자_정의_예외명, 시스템_예외_코드);
8장에서 배웠던 PRAGMA EXCEPTION_INIT를 사용하는데, ①에서 선언한 예외명과 시스템 예외코드를 명시한다.
③ 발생된 예외 처리: EXCEPTION WHEN 사용자_정의_예외명 THEN ….

PRAGMA EXCEPTION_INIT(예외명, 예외번호)
사용자 정의 예외 처리를 할 때 사용되는데, 특정 예외번호를 명시해서 컴파일러에 이 예외를 사용한다는 것을 알리는 역할을 한다.


예외 코드로 0이나 100을 제외한 양수, 그리고 -10000000 이하 값은 사용할 수 없다.

CREATE OR REPLACE PROCEDURE P_WISE_PROC7 (VS_NAME EXAM_RSLT.NAME%TYPE ,VS_STDT IN VARCHAR2 )

AS
      ERR_DUPLICATE_NAME EXCEPTION; -- 동일 이름을 경우 예외 선언
      ERR_INVALID_DATE   EXCEPTION; -- 잘못된 월 사용자 정의 예외 발생
      VN_CNT          NUMBER := 0;
      VD_DATE       DATE := NULL ;
	  
      PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843); -- 예외명과 예외코드 연결
BEGIN

    SELECT COUNT(*) INTO VN_CNT
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME  ;    
 
     IF VN_CNT > 0 THEN
        RAISE ERR_DUPLICATE_NAME; -- 사용자 정의 예외를 의도적으로 발생시킴
     END IF; 

     IF SUBSTR(VS_STDT, 5, 2) NOT BETWEEN '01' AND '12' THEN
        RAISE ERR_INVALID_DATE; -- 잘못된 월 사용자 정의 예외 발생
     END IF;
	
    EXCEPTION 
    WHEN ERR_INVALID_DATE THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('입력한 월이 잘못되었습니다.');
	  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); 
	  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); 
    WHEN ERR_DUPLICATE_NAME THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('해당사원명이 존재합니다.');
	  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


EXEC P_WISE_PROC7('홍길도','20191301')
EXEC P_WISE_PROC7('홍길동','20191301')


----------------
함수를 통한 오류확인


CREATE OR REPLACE PROCEDURE P_WISE_PROC7 (VS_NAME EXAM_RSLT.NAME%TYPE ,VS_STDT IN VARCHAR2 )

AS
      ERR_DUPLICATE_NAME EXCEPTION; -- 동일 이름을 경우 예외 선언
      ERR_INVALID_DATE   EXCEPTION; -- 잘못된 월 사용자 정의 예외 발생
      VN_CNT          NUMBER := 0;
      VD_DATE       DATE := NULL ;
	  
      PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843); -- 예외명과 예외코드 연결
BEGIN

    SELECT COUNT(*) INTO VN_CNT
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME  ;    
 
     IF VN_CNT > 0 THEN
        RAISE ERR_DUPLICATE_NAME; -- 사용자 정의 예외를 의도적으로 발생시킴
     END IF; 
 
	VD_DATE := TO_DATE(VS_STDT,'YYYYMMDD') ;
	DBMS_OUTPUT.PUT_LINE(TO_CHAR(VD_DATE,'YYYYMMDD')) ;
	
	
    EXCEPTION 
    WHEN ERR_INVALID_DATE THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('입력한 월이 잘못되었습니다.');
	  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); 
	  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); 
    WHEN ERR_DUPLICATE_NAME THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('해당사원명이 존재합니다.');
	  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


EXEC P_WISE_PROC7('홍길도','20191301')
EXEC P_WISE_PROC7('홍길동','20191301')



------------------------------------------------------------------------------
사용자가 에러코드와 예외메시지를 등록해서 사용하고 싶은경우
RAISE_APPLICATION_ERROR (예외코드, 예외 메시지); // 둘다 사용자가 정의해서 쓴다.
                                             단 여기에서 예외명을 붙일수없어서 EXCEPTION에서 예외명으로 오류처리를
                                             할수는없다.											 
예외 코드와 예외 메시지는 사용자가 직접 정의할 수 있는데, 예외코드는 -20000 ~ -20999 번까지만 사용할 수 있다
------------------------------------------------------------------------------
-- 사용자 정의 에러코드 와 명칭매핑
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
	  DBMS_OUTPUT.PUT_LINE('등록코드 : '||SQLCODE);
	  DBMS_OUTPUT.PUT_LINE('등록메세지 : '||SQLERRM);
END;
        
EXEC P_WISE_PROC8(-5)    

------------------------------------------------------------------------------
-- 사용자 정의 에러코드 + 명칭매핑 + 메세지 등록
 --PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -21000);

 --1. 명칭:  ERR_NAGATIVE_VALUE EXCEPTION; 
 --2. 명칭 + 에러코드 : PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100); 
 --3. 에러코드 + 에러메세지 : RAISE_APPLICATION_ERROR (-20100, '양수만 입력받을 수 있단 말입니다!'); 
-------------------------------------------------------------------------------- 
 

CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS

 ERR_NAGATIVE_VALUE EXCEPTION; 
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100); 
 
BEGIN

  IF VN_NUM <= 0 THEN        
     --RAISE ERR_NAGATIVE_VALUE;     
     RAISE_APPLICATION_ERROR (-20100, '양수만 입력받을 수 있단 말입니다!'); 
  END IF;

    DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN ERR_NAGATIVE_VALUE THEN
      DBMS_OUTPUT.PUT_LINE('등록코드 : '||SQLCODE);
      DBMS_OUTPUT.PUT_LINE('등록메세지 : '||SQLERRM);
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
    
    DBMS_OUTPUT.PUT_LINE (' SAVEPOINT GRD_1_SUC => 성공 ') ;
    
    SAVEPOINT GRD_1_SUC ;
    
    INSERT INTO PTEST
    SELECT * 
    FROM EXAM_RSLT 
    WHERE GRADE =2 ;
    
    RAISE_APPLICATION_ERROR (-20101, '1학년만 입력되어야 함'); 
     
    EXCEPTION WHEN ERR_GRD_TEST THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    ROLLBACK TO GRD_1_SUC ; -- SAVEPOINT 까지만 ROLLBACK

    COMMIT;   -- SAVEPOINT 이전까지는 COMMIT   
            
END ;
/


---------------------------
IMPLICIT CURSOR
묵시적커서 -- 커서속성
------------------------------


DECLARE
  VN_GRADE  EXAM_RSLT_P.GRADE%TYPE := 2;
BEGIN
  UPDATE EXAM_RSLT_P
     SET CLASS = SUBSTR(CLASS,1,2)||'클래스'
   WHERE GRADE = VN_GRADE;

  IF SQL%NOTFOUND THEN 
    DBMS_OUTPUT.PUT_LINE('결과건수 없음');
   END IF ; 
   
  IF SQL%FOUND THEN 
     DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
   END IF ; 
  
  COMMIT;
END;

---------------------------
EXPLICT CURSOR
명시적커서 -- 커서속성
------------------------------

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




