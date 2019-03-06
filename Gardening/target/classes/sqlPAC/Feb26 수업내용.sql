-- Feb26 황이사님

오라클에서의 ERROR 는 정의되어있음 
ORA-1304 
1304 ; nodataFound

예외 코드만 있는 것들 
이 코드 명칭을 주는게 시스템 에러 코드 
311 page

;


PLSQL 로 개발할 수 있는 것 3가지 
1. 프로시저 FUNCTION -> SELECT절에서 실행
2. 펑션 PROCEDURE  -> EXEC PROCEDURE_NAME
3. 패키지 PACKAGE  -> PROCEDURE(n) + FUNCTION(n)   ; 펑션과 프로시저 각각 n개씩 해서 만듬 

예)
영화예매
SELECT 로 된 프로시저  getSeek
DELETE 로 된 프로시저 
UPDATE 로 된 프로시저
INSERT 로 된 프로시저

이것들을 하나의 패키지로  MOVIE로 하면 SELECT 프로시저는 MOVIE.getSeek로 사용 
;

final Class A() {}  -- 상속을 할 수 없는 클래스 (자바)


CREATE OR REPLACE FUNCTION F_FFF (V_DD IN VARCHAR2) -- 여기서 들어오는 인자는 자바의 final 의 개념으로 수정 불가  
RETURN NUMBER
IS
BEGIN
END 
;

★ 프로시저 호출 시 디폴트 파라미터 호출방법
CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2 := '@', V_AFT IN VARCHAR2 := 'RUDIAZZANG'  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);  
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;  -- := 는 가장 마지막에 , 즉 계산 마지막에 변수에 대입 
	RETURN V_RSLT ;
END ;


SELECT F_DIA_DECO('#')
FROM DUAL;


CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2:= '@',  V_BEF IN VARCHAR2 , V_AFT IN VARCHAR2 := 'RUDIAZZANG'  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);  
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;
	RETURN V_RSLT ;
END ;

SELECT F_DIA_DECO('#','_' )  -- 이렇게 쓰면 V_STR에 #이 매핑됨 V_STR을 안쓰고 걍 디폴트로 나타내고 싶으면 뒤쪽으로 ?야함. 
FROM DUAL ;   
-- 두번째 값에 SETTING 해주고 싶다면 들어가는 파람은 앞에거부터 매핑되니까. 안쓰는건 뒤로 빼줘야. 즉, V_STR을 안쓰고 싶으면 뒤로 빼줘야해
CREATE OR REPLACE FUNCTION F_DIA_DECO( V_BEF IN VARCHAR2 , V_AFT IN VARCHAR2 := 'RUDIAZZANG',  V_STR IN VARCHAR2:= '@')  
;
-- 즉 변수를 호출할 때 앞에서부터 



프로시저의 경우는 순서 상관없이 매핑 가능
그냥 순서 상관없이 내가 넣어주고싶은 값만 변수에 매핑하려면?
EXEC PN_DIA_DECO(V_STR => '!' , V_AFT => '@' )  -- 중간값 빼고 매핑 가능  

-- 프로시저는 실행방법에서 순서와 상관없이 변수에 직접 매칭해 매핑가능 / 
-- 펑션은 직접매핑 할 시에 오류뜸  => 표기법 자체를 쓸 수 없음 


펑션은 보통 DML문을 쓰고 프로시저는 DML문을 사용
펑션은 스칼라값  ; 한 컬럼당 한 ROW

==================================================  위에는 펑션과 프로시저의 들어오는 인자에 대한 디폴드값 설정
;




FOR I IN 1.. V_CNT -- 여기서의 I는 지역변수, FOR와 IN사이에 오는 값은 정수값만 오니까 INTEGER로 지역변수 I가 생성됨

java 에서의 for문 
실행순서
1. i = 0 
2. i <= 10  -- 여기서 조건에 안맞으면 for문은 한번도 수행 안될수있음 
3. for문 {} 내용
4. i++

===================================================== FOR문




스칼라값 ; ROW하나씩

ROW가 여러개라면? -> 커서가 필요 (CURSOR)

List<Person> p = new List<Person>();
리스트는 필요한만큼만 담는다 

여러개의 ROW가 있다면? 
홍길동 20
김길동 30
박길동 30

이걸 프로그램에서는 구조를 생성 (Person에서 만든다. VO에서 만듬) 
'100': 홍길동|20|'110'   -> '110':김길동|20|'120'  -> '120'박길동|30|'' 
'100' 의 주소 정보를 p가 지님 


PLSQL 은 FOR문을 사용할 수 있으므로 JAVA랑 유사 
즉 저런식으로 가르켜서 값을 매핑해줘야해
JDBC에서 rs.next() 가 여기서의 커서 



그런데, 한 ROW만 나온다면?
이럴땐 FOR문 필요없이 DIERECT로 PERSON에 집어넣을 수 있어.

2건 이상이면 커서를 써줘야 함 
안써주면 TOO MANY ROWS 라는 오류가 뜸 




===


FUNCTION만들기
CREATE OR REPLACE FUNCTION F_DIA_DECOC(V_NAME IN VARCHAR2) 
RETURN VARCHAR2
IS
	V_RSLT VARCHAR2(100);
	V_TOT NUMBER(3) := 0; -- 초기화
BEGIN
	SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
	FROM EXAM_RSLT
	WHERE NAME = V_NAME;
	
	IF V_TOT >= 91 THEN 
		V_RSLT := 'A';
	ELSIF V_TOT >= 81 THEN 
		V_RSLT := 'B';
	ELSIF V_TOT >= 71 THEN 
		V_RSLT := 'C';	
	ELSIF V_TOT >= 61 THEN 
		V_RSLT := 'D';
	ELSE 
		V_RSLT := 'E';
	END IF;
	RETURN V_RSLT || V_TOT;
END ;



-- 펑션을 디버깅 하는 방법은 프로시저로 만들어서 리턴값을 찍어볼 수 있음 
CREATE OR REPLACE PROCEDURE P_DIA_DECOC(V_NAME IN VARCHAR2) 
IS
	V_RSLT VARCHAR2(100);
	V_TOT NUMBER(3) := 0; -- 초기화
BEGIN
	SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
	FROM EXAM_RSLT
	WHERE NAME = V_NAME;
	
	IF V_TOT >= 91 THEN 
		V_RSLT := 'A'; -- 
	ELSIF V_TOT >= 81 THEN 
		V_RSLT := 'B';
	ELSIF V_TOT >= 71 THEN 
		V_RSLT := 'C';	
	ELSIF V_TOT >= 61 THEN 
		V_RSLT := 'D';
	ELSE 
		V_RSLT := 'E';
	END IF;
	DBMS_OUTPUT.PUT_LINE(V_NAME || '님의 학점은 ' || V_RSLT|| '입니다.  ['  || V_TOT || '] 점수');
END ;



EXEC P_DIA_DECOC('홍길동')


=============================

LOOP 는 무조건 한번은 돈다
빠져나가는 것을 명시적으로 적어줘야 함 

WHILE 문은 조건을 위에 쓰니까 조건을 먼저 비교해서 한번도 안 돌 수 있음 
WHILE에서 CONTINUE는 해당 조건 제외하고 다시 WHILE조건절로 가는것

체크로직을 맨위에 쓰면 WHILE
중간에 쓰면 LOOP END 문 

;


F_FD 펑션 -- 특정요일 제외한 일수 구함 ;
;

SELECT LENGTH(F_FD('20190301', '20190316', '17') ) DAYSS
FROM DUAL ;

원래는 리턴받을 ? 4000글자 까지만 넘어갈 수 있으니까 FUNCTION쪽에서 길이를 구하고 싶다면 넘길 때 LENGTH로 넘겨줘야 해 
==============================



DATATYPE 설정 

%TYPE 
%ROWTYPE

--커서를 선언하지 않는 경우 
CREATE OR REPLACE PROCEDURE P_WISE_PROC1(V_ID  IN EXAM_RSTL.NAME%TYPE )  -- 이 테이블의 컬럼과 타입을 맞춰주겠다./ 
AS
    V_REC  EXAM_RSLT%ROWTYPE ;  -- EXAM_RSLT 의 한 ROW의 이름을 V_REC이라 하고 테이블명%ROWTYPE으로 타입을 설정해준다. / 
BEGIN
    SELECT * INTO V_REC 
    FROM EXAM_RSLT
    WHERE NAME = V_ID ;
    -- 결과값을 출력할때는 ROW의 해당 컬럼이름을 같이. 
    DBMS_OUTPUT.PUT_LINE(V_REC.NAME||' | '||
                     V_REC.CLASS||'  | '||V_REC.GRADE||'  | '||
                     TO_CHAR(V_REC.KOR+V_REC.ENG+V_REC.MAT)) ;
END ;




-- 익명 프로시저
DECLARE = CREATE OR REPLACE PROCEDURE P_WISE_PROC1(V_ID  IN EXAM_RSTL.NAME%TYPE )  AS


DECLARE 예1 
예외처리
	시스템예외
	사용자정의예외
=======
DECLARE 
	V1_NUMBER NUMBER := 0;
BEGIN
	V1_NUMBER := 10/0 ; -- 0으로 나누면 에러 뜸 
	DBMS_OUTPUT.PUT_LINE('성공');
END;
=======

수미꺼
DECLARE
   VI_NUMBER NUMBER := 0;
BEGIN
   VI_NUMBER := 10/0 ;
   DBMS_OUTPUT.PUT_LINE('성공냐냥');
END;
=======
0으로 나누면 이런 에러가 뜸 
ORA-01476: 제수가 0 입니다
ORA-06512:  4행
Error code: 1476
SQL state: 22012
=======



★ 에러처리 
-- 시스템예외

DECLARE
BEGIN 
EXCEPTION WHEN OTHERS THEN 


P_WISE_PROC1
P_WISE_PROC2
	SQLCODE 는 전역변수 ; 저거를 찍어보면 어디서 오류가 났는지 



CREATE OR REPLACE PROCEDURE P_WISE_PROC2
AS
  VI_NUM NUMBER := 0;
BEGIN
  VI_NUM := 10 / 0;
  DBMS_OUTPUT.PUT_LINE('Success!');

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');
  DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);   -- SQLCODE 는 코드번호를 출력 
  DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM  ; 에러 메세지를 출력
  DBMS_OUTPUT.PUT_LINE(SQLERRM(SQLCODE)); -- 매개변수 있는 SQLERRM
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE); -- 런타임오류의 행번호 리턴  ; 몇번째 행에서 오류가 났는지 알려줌 
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_STACK);
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_CALL_STACK);
 END;

이런식으로 나옴 
SQL > EXEC P_WISE_PROC2

OUTPUT > 오류가 발생했습니다
SQL ERROR CODE:-1476    -- SQLCODE
SQL ERROR MESSAGE:ORA-01476: 제수가 0 입니다  -- SQLERRM
ORA-01476: 제수가 0 입니다
ORA-06512: "WISE_USER.P_WISE_PROC2",  5행

ORA-01476: 제수가 0 입니다

----- PL/SQL Call Stack -----      -- 호출한 스택에 이런식으로 오류가 난다 
  object      line  object
  handle    number  name
00007FFD3B55EFA0        15  procedure WISE_USER.P_WISE_PROC2
00007FFD39F3C248         1  anonymous block 

-- 핸들						넘버				NAME 

======================================
-- 시스템예외
	ㄴ미리 정의된 예외 ; 에러코드와 에러내용을 매칭해놓은 것 (311PAGE)
	

예제 P_WISE_PROC4

TOO MANY ROWS 예외명의 예 	
CREATE OR REPLACE PROCEDURE P_WISE_PROC4(VN_GRADE IN NUMBER)
AS
    V_REC EXAM_RSLT%ROWTYPE ;
BEGIN   
    SELECT * INTO V_REC
    FROM EXAM_RSLT 
    WHERE GRADE = VN_GRADE  ;
    
    DBMS_OUTPUT.PUT_LINE(V_REC.NAME);
    
    EXCEPTION WHEN TOO_MANY_ROWS THEN   -- 예외명을 명칭으로 적어줘서 이 예외일때는 예외 잡아줄 수 있음 / 명칭이 없으면 예외 잡을 수 없음 
          DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다');
          DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('오류2');

END ;
	


=================================
-- 명칭을 정의해주기 
사용자 정의 에러

CREATE OR REPLACE PROCEDURE P_WISE_PROC5(VS_NAME EXAM_RSLT.NAME%TYPE)
AS
   ERR_DUPLICATE_NAME EXCEPTION; -- 동일 이름을 경우 예외 선언   / EXCEPTION 타입인 변수  / 예외를 미리 정의 
   VN_CNT          NUMBER := 0;  -- NUMBER 타입인 변수 

BEGIN
	-- 업무규칙을 정의해 오류를 발생시키는 경우
    SELECT COUNT(*) INTO VN_CNT -- 유니크한 이름을 조회해서 COUNT함 
    FROM EXAM_RSLT
    WHERE NAME = VS_NAME ;    
 
     IF VN_CNT > 0 THEN -- 이름이 존재할 때 , 에러를 발생시킴
        RAISE ERR_DUPLICATE_NAME; -- 사용자 정의 예외를 의도적으로 발생시킴 / RAISE ; 에러 발생 
     END IF; 

    EXCEPTION 
    WHEN ERR_DUPLICATE_NAME THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('해당사원명이 이미 존재합니다.');
        DBMS_OUTPUT.PUT_LINE('SQL ERROR CODE:' || SQLCODE);
          DBMS_OUTPUT.PUT_LINE('SQL ERROR MESSAGE:' || SQLERRM); -- 매개변수 없는 SQLERRM / 여기서 사용자 정의 오류 에러명으로 나옴 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


===================사용자 정의 에러 ==============================


CREATE OR REPLACE PROCEDURE P_DIA_PROC5(VS_NAME  EXAM_RSLT.NAME%TYPE)
AS 
	ERR_DUPLICATE_NAME EXCEPTION;
	VN_CNT		NUMBER := 0;
BEGIN
	SELECT COUNT(*) INTO VN_CNT 
	FROM EXAM_RSLT
	WHERE NAME = VS_NAME;
	
	IF VN_CNT > 0 THEN 
		RAISE ERR_DUPLICATE_NAME;
	END IF;
	
	EXCEPTION
	WHEN ERR_DUPLICATE_NAME THEN 
		DBMS_OUTPUT.PUT_LINE('해당 사원이 이미 존재합니당');
		DBMS_OUTPUT.PUT_LINE('SQL 에러 코드 : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('SQL 에러 메세지 : ' || SQLERRM);
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
	

	

SQL > EXEC P_DIA_PROC5('홍길동')

OUTPUT > 해당 사원이 이미 존재합니당
SQL 에러 코드 : 1
SQL 에러 메세지 : User-Defined Exception

	
	

	
================


CREATE OR REPLACE PROCEDURE P_DIA_DECOC(V_NAME IN VARCHAR2) 
AS	
	DIA_ERROR_CATCH EXCEPTION;
	V_RSLT VARCHAR2(100);
	V_TOT NUMBER(3) := 0; -- 초기화
BEGIN
	SELECT ROUND((KOR+ENG+MAT)/3) INTO V_TOT
	FROM EXAM_RSLT
	WHERE NAME = V_NAME;
	
	IF V_TOT >= 91 THEN 
		V_RSLT := 'A';
	ELSIF V_TOT >= 81 THEN 
		V_RSLT := 'B';
	ELSIF V_TOT >= 71 THEN 
		V_RSLT := 'C';	
	ELSIF V_TOT >= 61 THEN 
		V_RSLT := 'D';
	ELSE 
		RAISE DIA_ERROR_CATCH;
	END IF;
	
	EXCEPTION
	WHEN DIA_ERROR_CATCH THEN 
		DBMS_OUTPUT.PUT_LINE(V_NAME || '님은 재수강 확정이시네요..');
		DBMS_OUTPUT.PUT_LINE('SQL 에러 코드 : ' || SQLCODE);
		DBMS_OUTPUT.PUT_LINE('SQL 에러 메세지 : ' || SQLERRM);
	WHEN OTHERS THEN 
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
	
END ;



EXEC P_DIA_DECOC('홍길동')
=================================
SQL > EXEC P_DIA_DECOC('홍길동')

OUTPUT > 홍길동님은 재수강 확정이시네요..
SQL 에러 코드 : 1
SQL 에러 메세지 : User-Defined Exception
=================================

JAVA로 치면 Throws Exception같은거 

=================================




시스템 예외 
PRAGMA 를 붙이는 이유는 ? COMPILER에게 호출하는 것이 예외 EXCEPTION_INIT 임을 알려줌


예외 코드 값의 범위 


P_WISE_PROC7

CREATE OR REPLACE PROCEDURE P_WISE_PROC7 (VS_NAME EXAM_RSLT.NAME%TYPE ,VS_STDT IN VARCHAR2 )

AS
      ERR_DUPLICATE_NAME EXCEPTION; -- 동일 이름을 경우 예외 선언
      ERR_INVALID_DATE   EXCEPTION; -- 잘못된 월 사용자 정의 예외 발생
      VN_CNT          NUMBER := 0;
      
      PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843); -- 예외명과 예외코드 연결
BEGIN					-- 예외 코드명이 있는데 에러 명칭을 붙여서 그 명칭으로 에러를 잡는다 

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
    WHEN ERR_DUPLICATE_NAME THEN -- 사용자 정의 예외 처리
      DBMS_OUTPUT.PUT_LINE('해당사원명이 존재합니다.');
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);

END;


EXEC P_WISE_PROC7('홍길도' , '20191301')


=====결과 =======
SQL > EXEC P_WISE_PROC7('홍길도' , '20191301')

OUTPUT > 입력한 월이 잘못되었습니다.
SQL ERROR CODE:-1843
SQL ERROR MESSAGE:ORA-01843: 지정한 월이 부적합합니다.


-- 사용자 정의 에러는 코드번호 필요없으니까 걍 변수선언만 해줌
-- PRAGMA EXCEPTION_INIT (ERR_INVALID_DATE, -1843);  기존에 에러코드에 명칭을 정의해 호출해주는 방법 


================= 함수를 통한 오류확인 
-- 미리 정의된 오류이기 때문에 가능 ERR_INVALID_DATE
-- 함수를 실행시켰을때 에러코드가 뜨면 명칭이 없으므로 명칭 잡아준거 EXCEPTION_INIT

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

     /*
     IF SUBSTR(VS_STDT, 5, 2) NOT BETWEEN '01' AND '12' THEN
        RAISE ERR_INVALID_DATE; -- 잘못된 월 사용자 정의 예외 발생
     END IF;
    */
 
    VD_DATE := TO_DATE(VS_STDT,'YYYYMMDD') ;  -- 여기서 오류가 나서 ERR_INVALID_DATE 가 에러명인 쪽으로 에러처리가 됨 
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


여기까지가 시스템에러 ; 
========================================================


내가 오류를 등록해서 쓰고 싶을 때 ,
예외코드는 -20000 ~ -20999 번 까지만 정의해 사용가능 


; 



EXEC P_WISE_PROC8(-10)

-- RAISE_APPLICATION_ERROR  라는 프로시저가 존재 , 이 프로시저는 DBMS_STANDARD 시스템 패키지에 속한 프로시저로 사용자 정의 예외만 발생시킬 수 있음 
-- 예외코드와 원하는 예외 메세지를 직접 매개변수로 넘겨 예외를 발생시키는 것이 특징이다. 


CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
    AS

    BEGIN
      IF VN_NUM <= 0 THEN        
         RAISE_APPLICATION_ERROR (-20000, '양수만 입력받을 수 있단 말입니다!'); -- 예외코드와 예외 메세지를 등록해 사용 가능 
      END IF;

     DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN INVALID_NUMBER THEN  -- INVALID_NUMBER 는 위에 AS 아래에 변수선언 안했어서 절대 안탐
      DBMS_OUTPUT.PUT_LINE('수치가 잘못 되었습니다.');
    WHEN OTHERS THEN			-- RAISE_APPLICATION_ERROR 는 항상 이 OTHERS 에 걸린다. 
      DBMS_OUTPUT.PUT_LINE('등록코드 : ' || SQLCODE);
      DBMS_OUTPUT.PUT_LINE('등록메세지 : ' || SQLERRM);
    END;



SQL > EXEC P_WISE_PROC8(-10)

OUTPUT > 등록코드 : -20000
등록메세 : ORA-20000: 양수만 입력받을 수 있단 말입니다!

======================


























 
















 














