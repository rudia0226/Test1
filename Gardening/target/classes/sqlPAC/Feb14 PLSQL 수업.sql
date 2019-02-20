
-- FEB14 PLSQL

-- 테이블의 데이터를 하나의 ROW로 VO 객체로 해서 List<VO> list 로 해서 사용 
-- PLSQL에서는 "커서" 라고 함

PLSQL은 주로 공통작업/배치작업시 사용 
공통작업할 때 FUNCTION 을 이용해 작업의 수정시 작업시간 최소화 

수업 개요
다루는것 FUNCTION/PROCEDURE(프로시저)
	클래스와 FUNCTION을 합쳐놓은것을 PROCEDURE
	
조금 더 시간있으면 PACKAGE
더 시간있으면 TRIGGER (사용권장은 안함. 잘못사용시 데이터 정확성 떨어짐)
JAR에 대해 설명

=================================================
1. NAMING RULE(네이밍규칙)
	FUNCTION : F_FREEDAYCNT
	PROCEDURE : P_FREEPRO
	
2. FUNCTION : RETURN값 항상 존재 
	PROCEDURE : RETURN 이 명시적이지 않음 (=리턴값이 없어도 있어도 됨) 
			- IN 파라미터
			- OUT 파라미터 ; 여기에 값을 리턴  (C_STR OUT VARCHAR2 ) --> C_STR을 리턴해줌

	프로시저는 RETURN 이란 걸 사용안하고 인자쪽에 OUT으로 리턴
	
3. FUNCTION : DML 문을 사용 안함  -단순히 결과 RETURN처리
	PROCEDURE : DML 문을 사용 (S/U/D/I)  - BATCH처리
	
	프로시저는 하나의 프로그램

4. EXECUTE (실행시)
	- FUNCTION : SELECT F_GETID() FROM TBL 
	- PROCEDURE : EXEC P_DFR(P)   (P ; 프로시저 파라미터)
펑션은 SQL에서 사용 / 프로시저는 하나의 프로그램(하나의 기능)

오라클에서 만든거 ; 빌트인함수
내가만든거 ; 사용자정의 함수

=================================================
FUNCTION 기본구조
=================================================
CREATE OR REPLACE FUNCTION F_GETCNT( V_DY IN VARCHAR2 )  -- FUNCTION 만들때 자기이름 이니셜 붙여서 만들어서 REPLACE될때 
RETURN NUMBER    --(시작하자마자 리턴타입을 명시해야)   -- 리턴값은 하나만 리턴가능

IS 
	...
BEGIN   -- = {
	...
END    -- = }

자바로 써주면 이런거임
int F_GETCNT(VARCHAR2 V_DAY) {

	RETURN   3;
}

=================================================
PROCEDURE 기본구조
=================================================
CREATE OR REPLACE PROCEDURE P_GETCNT( V_DY IN VARCHAR2 )  -- 리턴값 안받겠다 /  P_GETCNT( V_DY IN VARCHAR2 , V_RSLT OUT NUMBER)  -- 리턴값 안받겠다 
IS
BEGIN
	INSERT/UPDATE/DELETE  -- LOGIC에 따라서 순서는 상관없음 
	IF 
		BEGIN  (여는 괄호 { 로 생각)
			BEGIN
			END
		END  (여는 괄호 } 로 생각)
END

=================================================


-- 예제 1 

CREATE OR REPLACE FUNCTION F_DIA_DECO(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2  )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);   -- IS와 BEGIN사이에 변수선언 
BEGIN
	V_RSLT := V_BEF ||  V_STR  || V_AFT ;
	RETURN V_RSLT ;
END ;


;
SELECT NO  -- NO에 [] 나 ** 를 붙여주고싶다 
FROM TA 
;
SELECT F_DIA_DECO(TO_CHAR(NO), 'RUDIA[ ', ' ]ZZANG')  RUDI
FROM TA 
; 


=================================================
-- 예제 2   개수를 주면 앞뒤에 준 문자값으로  표현되게끔 하기 
;
확인해보쟈 ~.~
;
SELECT F_DIA_DECO5(TO_CHAR(NO), '@', '&', 4)  RUD
FROM TA 
--WHERE NO < 2
; 

CREATE OR REPLACE FUNCTION F_DIA_DECO2(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS
	V_RSLT VARCHAR2(100);   
BEGIN
	V_RSLT := RPAD(V_BEF,V_NUM,V_BEF) ||  V_STR  || LPAD(V_AFT,V_NUM,V_AFT) ;
	RETURN V_RSLT ;
END ;


-- FOR문 이용 
CREATE OR REPLACE FUNCTION F_DIA_DECO3(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT1 VARCHAR2(100);   
	V_RSLT2 VARCHAR2(100);   
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		FOR i IN 1..V_NUM
		LOOP 
			V_RSLT1 :=  V_RSLT1 || V_BEF ;
			V_RSLT2 :=  V_RSLT2 || V_AFT;
		END LOOP ;
	END ;
	V_RSLT3 := V_RSLT1 || V_STR || V_RSLT2;
	RETURN V_RSLT3;
END ;


-- 입력해서 들어오는 값은 CONSTANCE (상수) 이다. (입력받은 값은 := 좌측에 올 수 없어)
CREATE OR REPLACE FUNCTION F_DIA_DECO4(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		FOR i IN 1..V_NUM
			LOOP 
				V_RSLT3 := V_RSLT3 ||  V_BEF;
			END LOOP ;
		V_RSLT3 := V_RSLT3 || V_STR;
		FOR i IN 1..V_NUM	
			LOOP
				V_RSLT3 := V_RSLT3 || V_AFT;
			END LOOP;
	END ;
	RETURN V_RSLT3;
END ;


-- FOR문 한줄에 쓰기
CREATE OR REPLACE FUNCTION F_DIA_DECO5(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		V_RSLT3 :=   V_BEF ||  V_STR || V_AFT;
		FOR i IN 1..(V_NUM-1)
			LOOP 
				V_RSLT3 :=    V_BEF ||  V_RSLT3|| V_AFT;
			END LOOP ;
	END ;
	RETURN V_RSLT3;
END ;

--  이사님 답안 
CREATE OR REPLACE FUNCTION F_DIA_DECO5(V_STR IN VARCHAR2,  V_BEF IN VARCHAR2, V_AFT IN VARCHAR2 , V_NUM NUMBER )  
RETURN VARCHAR2  
IS 
	V_RSLT3 VARCHAR2(100);  
BEGIN
	BEGIN 
		V_RSLT3 := V_STR ;
		FOR i IN 1..V_NUM
			LOOP 
				V_RSLT3 :=    V_BEF ||  V_RSLT3|| V_AFT;
			END LOOP ;
	END ;
	RETURN V_RSLT3;
END ;




-- 예제3 

SELECT * FROM EXAM_RSLT;

SELECT F_DECOC(NAME) DD
FROM EXAM_RSLT;


CREATE OR REPLACE FUNCTION F_DIA_AVGLVL(V_STR IN VARCHAR2)
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(100);
    V_TOT  NUMBER(3) := 0 ; 
BEGIN 
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


-- 이사님이 만든 함수 
CREATE OR REPLACE FUNCTION F_DECOC(V_NAME IN VARCHAR2) 
RETURN VARCHAR2
IS
    V_RSLT VARCHAR2(100);
    V_TOT  NUMBER(3) := 0 ; 
BEGIN   

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


================================================== ( 오전 종료)
;


CRLF ; 줄바꿈 CHR(13) 쓰면 됨 


; 


-- 예제4 ; 구구단 

CREATE OR REPLACE FUNCTION F_DIA_GUGU(V_NUM NUMBER )
RETURN VARCHAR2 
IS 
	V_RTT VARCHAR2(100);
	V_GUGU NUMBER :=1 ;
BEGIN 
	LOOP	
		V_RTT :=  V_NUM || '*' || V_GUGU || '='|| V_NUM*V_GUGU   || CHR(13);
		EXIT WHEN V_GUGU > 9;
	END LOOP;
	RETURN V_RTT;
END ;






