
-- Jan28 프로시저 만들기, function 만들기 연습하기 
1. PL/SQL 기본구조 
-- 블록
-- ; PL/SQL 소스  프로그램의 기본단위를 Block(블록)이라고 함
-- 블록 구성 : 선언부, 실행부, 예외처리부 
-- 블록 구분 : 
		--    이름있는 블록 : 함수, 프로시저, 패키지 
		--    이름없는 블록 : 익명 블록 
		
이름부
IS(AS) 
선언부
BEGIN 
실행부
EXCEPTION 
예외처리부
END; 

-- 설명
이름부 
	블록의 명칭이 오는데 , 생략할 때는 익명 블록이 된다.
선언부
	DECLARE 로 시작되며, 실행부와 예외 처리부에서 사용할 각종 변수, 상수, 커서 등을 선언한다.
	중요한점은 변수 선언이나 실행부와 예외 처리부에서 사용하는 각종 문장의 끝에 반드시 세미콜론(;) 을 찍어야 한다는 것이다.
	세미콜론이 없으면 오류가 발생한다. 사용할 변수나 상수가 없다면 선언부를 생략할 수 있다.
실행부 
	실제 로직을 처리하는 부분이다. 이 부분에는 각종 문장(일반 SQL문, 조건문, 반복문 등)이 올 수 있고, 이러한 문장을 사용해 비지니스 로직을 구현하는 것이다.
	하지만 SQL 문장 중 DDL문은 사용할 수 없고 DML문만 사용할 수 있으며 모든 문장의 끝에는 세미콜론을 붙여야한다. 
-- DDL (; 데이터 정의어 Data Definition Language) - CREATE, ALTER, DROP, RENAME , TRUNCATE
-- DML (; 데이터 조작어 Data Manipulation Language) - SELECT, INSERT, UPDATE, DELETE 
예외처리부
	EXCEPTION 절로 시작되는 부분으로 실행부에서 로직을 처리하다가 오류가 발생하면 처리할 내용을 기술하는 부분으로
	예외처리부는 생략이 가능하다.
	PL/SQL에서 말하는 오류는 크게 두가지로 나눌수있다.
	1. PL/SQL 코드 컴파일 과정에서 발생하는 오류
	2. 런타임, 즉 실행과정에서 발생하는 오류 
	예외(exception)란 바로 런타임 오류를 말하는 것으로 예외 처리부에서 런타임 오류가 발생했을 때 처리할 부분을 기술한다.
	
	예를 들어 매개변수로 다른 임의의 수를 나누는 로직이 있는데 만약 이 매개변수에 0이 들어오면 오류가 발생할 것이다.
	이때 "0으로 나눌 수 없습니다" 라는 메세지를 보여주는 처리를 예외처리부에 기술해 주는 것이다. 
	
	
	
-- 익명 블록(Anunymous Block) 
-- 예제1
DECLARE 
	VI_NUM NUMBER;
BEGIN 
	VI_NUM := 100;  -- 변수 VI_NUM 에 100을 할당한다.
	DBMS_OUTPUT.PUT_LINE(VI_NUM);
END;

-- 예제2
SET SERVEROUTPUT ON
SET TIMING ON  -- PL/SQL 블록을 실행했을때 총 소요시간 
DECLARE 
	VI_NUM NUMBER;
BEGIN 
	VI_NUM := 100;
	DBMS_OUTPUT.PUT_LINE(VI_NUM);
END; 





