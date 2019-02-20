02. PL/SQL 구성요소

# 변수
다른 프로그래밍 언어에서 사용한느 변수와 개념이 같으며
선언부에서 변수 선언을 하고 실행부에서 사용한다.
-- BEGIN 위에서 선언 BEGIN 밑에서 사용
변수 선언 방식은 다음과 같다.

변수명 데이터타입 := 초기값;

변수 선언과 동시에 초기값 할당 가능
초기값을 할당하지 않으면 ? 데이터 타입에 상관없이 그 변수의 초기값은 NULL이 된다.
물론 선언부에서는 선언만 하고 실행부에서 초기값을 할당하기도 함


# 변수로 선언할 수 있는 데이터 타입
1. SQL데이터 타입
2. PL/SQL데이터 타입 - BOOLEAN, PLS_INTEGER, BINARY_INTEGER

■ BOOLEAN- 어떤 값이 참인지 거짓인지 판별할 때 사용
	값 : TRUE, FALSE, NULL 


■ PLS_INTEGER- 숫자타입
	값 : -2,147,483,648 ~ 2,147,483,647 까지 범위를 가진 숫자타입
	내부적으로 저장공간을 덜 차지

■ BINARY_INTEGER- 숫자타입
	PLS_INTEGER와 동일

■ PLS_INTEGER 의 데이터타입(하위타입)
NATURAL : PLS_INTEGER 중 음수 제외(0포함)
NATURALN : PLS_INTEGER 중 음수 제외인데 NULL 할당불가, 반드시 선언 시 초기화 필요
POSITIVE : PLS_INTEGER 중 양수(0 미포함)
POSITIVEN : PLS_INTEGER 중 양수인데 NULL 할당불가, 반드시 선언 시 초기화 필요
SIGNTYPE : PLS_INTEGER 중 -1, 0, 1 
SIMPLE_INTEGER : PLS_INTEGER 중 NULL이 아닌 모든 값, 반드시 선언 시 초기화 필요



# 상수
상수는 변수와는 달리 한 번 값을 할당하면 변하지 않는다. 상수 선언도 변수 선언과 비슷하다.

상수명 CONSTANT 데이터타입 := 상수값;

상수 선언시,
	반드시 CONSTANT 란 키워드를 붙여 변수와 구분
	선언할때 반드시 초기화를 해야함
	실행부에서 상수를 다른 값으로 변경할 수 없다.
	
상수는 특정 값을 할당해 놓고 실행부에서 사용하고자 할 때 사용된다.




# 연산자
연산자 우선순위 ( 제곱 > 양수,음수 > 곱셈,나눗셈 > 덧셈, 뺄셈, 문자열 연결 > 비교 > 논리 ) 

** 제곱연산자  -- PL/SQL에서만 사용할 수 있다. 
+,- 양수, 음수식별 연산자
*,/ 곱셈 나눗셈
+,-,|| 덧셈, 뺄셈, 문자열 연결 연산자
=,<,>,<=,<>, ~=, !=, ^=, IS NULL, LIKE, BETWEEN, IN 비교연산자
NOT 논리연산자
AND 논리연산자
OR 논리연산자


-- 예제 1
DECLARE 
	A INTEGER := 2**3*3**2;
BEGIN 
	DBMS_OUTPUT.PUT_LINE('A = ' || TO_CHAR(A));
END;

-- OUTPUT > A = 72



# 주석 
전체주석 : /**/
한줄주석 : --

-- 예제 1
DECLARE 
	A INTEGER := 2**2*3**2;
BEGIN 
	/* 실행부
		DBMS_OUTPUT.PUT_LINE을 이용한 변수 값 출력
	*/
	DBMS_OUTPUT.PUT_LINE('A : ' || A);
END;

-- OUTPUT > A : 36



# DML문
SQL문 중 DDL은 PL/SQL상에서 직접 쓸 수 없고(물론 전혀 방법이 없는 것은 아니다) DML문만 사용한다.

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 예제 1 ; 특정 사원의 이름과 부서명을 가져와 출력하는 코드를 작성

DECLARE 
	VS_EMP_NAME VARCHAR2(80); -- 사원명 변수
	VS_DEP_NAME VARCHAR2(80); -- 부서명 변수
BEGIN 
	SELECT A.ENAME , B.DNAME 
	INTO VS_EMP_NAME, VS_DEP_NAME 
	FROM EMP A,
		DEPT B 
	WHERE A.DEPTNO = B.DEPTNO 
	AND A.EMPNO = 7934;

	DBMS_OUTPUT.PUT_LINE(VS_EMP_NAME || ' - ' || VS_DEP_NAME);
END;

-- OUTPUT > MILLER - ACCOUNTING


-- 설명
테이블에 있는 데이터를 선택해 변수에 할당할 때는 SELECT문에서 INTO절을 사용
이때 선택하는 컬럼에 따라서 변수의 순서, 개수, 데이터 타입을 반드시 맞춰 줘야한다.

변수의 개수가 많아지면 해당 컬럼에 대응되는 변수 타입을 일일이 찾기 번거로우므로
%TYPE 키워드 사용하여 변수에 컬럼타입을 자동으로 가져온다.

변수명 테이블명.컬럼명%TYPE;

-- 예제 2
DECLARE 
	VS_EMP_NAME EMP.ENAME%TYPE;
	VS_DEP_NAME DEPT.DNAME%TYPE;
BEGIN 
	SELECT A.ENAME, B.DNAME
	INTO VS_EMP_NAME , VS_DEP_NAME 
	FROM EMP A , DEPT B
	WHERE A.DEPTNO = B.DEPTNO 
	AND EMPNO = 7934;

	DBMS_OUTPUT.PUT_LINE(VS_EMP_NAME || ' - ' || VS_DEP_NAME);
END;

-- OUTPUT > MILLER - ACCOUNTING

PL/SQL내에서는 SELECT, INSERT, UPDATE, MERGE, DELETE 문도 사용 가능 





# PRAGMA 키워드
PRAGMA ; 컴파일러가 실행되기 전에 처리하는 전처리기 역할
PRAGMA 사용시 컴파일러는 런타임 때와는 다른 결과를 내도록 동작한다.

1. PRAGMA AUTONOMOUS_TRANSACTION
		트랜젝션 처리 담당
		주 트랜젝션이나 다른 트랜젝션에 영향을 받지 않고 
		독립적으로 현재 블록 내부에서 
		데이터베이스에 가해진 변경사항을 COMMIT이나 ROLLBACK하라는 지시를 하는 역할을 한다.

2. PRAGMA EXCEPTION_INIT(예외명, 예외번호)
		사용자 정의 예외 처리를 할 때 사용되는데, 
		특정 예외번호를 명시해서 컴파일러에 이 예외를 사용한다는 것을 알리는 역할을 한다.

3. PRAGMA RESTRICT_REFERECES(서브프로그램명, 옵션)
		오라클 패키지를 사용할 때 선언해 놓으면 패키지에 속한 서브 프로그램(주로 함수에 사용)에서 
		옵션값에 따라 특정 동작을 제한할 때 사용한다. 
		예를 들어, RNDS란 옵션을 주면 해당 서브 프로그램에서 테이블 데이터 쿼리를 제한하고,
		WNDS 옵션을 주면 테이블 데이터를 조작하지 못한다.

4. PRAGMA SERIALLY_RESUABLE
		패키지 메모리 관리를 쉽게 할 목적으로 사용
		패키지에 선언된 변수에 대해 한 번 호출된 후 메모리를 해제시킨다. 
		이 옵션을 설정하면 패키지 변수에 값을 할당하더라도 다음번에 호출할 때는 
		할당한 값에 대한 메모리를 해제시켜 해당 변수는 초기화 값이나 NULL이 된다.



# 라벨 
	PL/SQL프로그램 상에서 특정 부분에 이름을 부여하는 것을 라벨이라 함.
	<<라벨명>> 형태로 사용한다.
	부여한 특정 라벨로 이동이 가능하다.
	
	라벨을 붙이는 이유?
	PL/SQL코드가 길어질 때 특정 블록 단위로 라벨을 붙이면 소스관리가 용이하기 때문
	코드 상에서 특정 조건에 따라 GO TO문으로 이후 로직을 처리하지 않고 특정 라벨로 이동할 수도 있고
	반복문에 라벨을 붙이면 이 역시 조건에 따라 EXIT문으로 해당 반복문 블록을 빠져 나오게 할 수도 있다.
	
	SQL에서는 최대 크기가 4000 byte 
	PL/SQL에서는 VARCHAR2 타입을 32KB까지 사용할 수 있다. 


CREATE TABLE CH08_VARCHAR2 (
		VAR1 VARCHAR2(5000)); 
)


CREATE TABLE CH08_VARCHAR2 (
		VAR1 VARCHAR2(4000)); 
)













