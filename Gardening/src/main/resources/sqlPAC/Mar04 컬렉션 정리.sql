-- COLLECTION 


스칼라 데이터 타입 ; 단일 값 데이터 타입 
컴포지트 데이터 타입 (복합 데이터 타입) 



오라클 PL/SQL은 컴포지트 데이터 타입으로 컬렉션(COLLECTION)과 레코드(RECORD) 두가지를 지원

컬렉션
	배열과 유사한 자료구조
	동일한 데이터 타입이 반복되는 데이터를 저장하는 자료구조
	컬렉션의 각 항목은 '변수명(인덱스)'와 같은 표현식을 사용해 접근 가능

레코드
	구조체 또는 레코드와 같은 자료구조
	서로 다른 데이터 타입의 데이터를 모아 놓은 자료구조



■ 컬렉션
	배열과 유사한 자료구조
	동일한 데이터 타입이 반복되는 데이터를 저장하는 자료구조
	컬렉션의 각 항목은 '변수명(인덱스)'와 같은 표현식을 사용해 접근 가능

1-1. 컬렉션 타입의 종류
	연관 배열(Associative Array) 
	가변 크기 배열(VARRAY)
	중첩 테이블(Nested Table)
	
컬렉션 타입/ 
		비교항목				'연관배열' 		'가변크기배열'		'중첩테이블'
'컬렉션 항목의 개수'			  미지정				  지정				미지정
'인덱스 유형'				문자열 또는 정수		  정수				 정수
'초기화되지않은상태'	Empty(비어있음)		  NULL				 NULL 
'ADT'
'(Abstract Data Type)' 		불가능				   가능				  가능
'정의'


컬렉션 항목 개수 '미지정' 이면 개수에 한계가 없음을 의미 
VARRAY는 선언 시에 항목의 개수 지정(한번 지정된 개수는 변경 불가)

 
비어있는 컬렉션 
ㄴ 존재 O , 항목 X  ; 항목의 개수가 0 인 컬렉션
ㄴ 항목을 추가하려면 EXTEND 메소드를 호출

NULL 컬렉션
ㄴ 집합 자체가 없는 것 
ㄴ EXTEND 호출 불가 (집합존재X)
ㄴ EMPTY 컬렉션이나 항목을 가지는 컬렉션으로 바꿔줘야 사용가능 
	ㄴ 존재하는 컬렉션으로 만들려면 컬렉션 생성자를 사용하여 초기화해주어야. 

ADT(Abstract Data Type) 
ㄴ CREATE TYPE 문을 사용하여 스키마 레벨에서 정의되는 사용자 정의 객체 타입을 말한다.

-- REM VARRAY를 사용한 스키마 레벨 데이터 타입 정의 
CREATE OR REPLACE TYPE languages IS VARRAY(10) OF VARCHAR2(64) 

-- REM Nested Table 을 사용한 스키마 레벨 데이터 타입 정의 
CREATE OR REPLACE TYPE cities IS TABLE OF VARCHAR2(64) 


Associative Array는 스키마 레벨에서의 타입을 정의하는데 사용할 수 없음 ('오류발생함')
;
-- REM Associative Array 를 사용한 스키마 레벨 데이터 타입 정의는 불가능
CREATE OR REPLACE TYPE colors IS TABLE OR VARCHAR2(64) INDEX BY PLS_INTEGER/

-- 에러 코드 PLS-00355: 이 문맥에 pl/sql 테이블 사용이 허용되지 않습니다.


■ 컬렉션 타입과 대응되는 일반 자료구조

PL/SQL컬렉션 타입 
Associative Array 
	-	해시 테이블 (Hash Table , Hash Map) 
	-	비순서 테이블 ( Unordered Table , Unordered Map)
VARRAY 
	-	배열 (Array)
	-	백터 (Vector)
Nested Table 
	-	집합 (Set)
	-	중복 허용 집합(Bag)
	

■ 컬렉션 메소드
COUNT 			함수		컬렉션의 요소의 총 수를 반환
LIMIT				함수		컬렉션이 가질 수 있는 요소의 최대 수를 반환
FIRST				함수		컬렉션의 첫번째 인덱스를 반환
LAST				함수		컬렉션의 마지막 인덱스를 반환
EXTEND			프로시저	VARRAY나 중첩테이블 끝에 요소를 추가
TRIM				프로시저	VARRAY나 중첩테이블 끝에 요소를 삭제
DELETE 			프로시저	컬렉션 요소를 삭제


1-2. 연관배열 (Associative Array)

선언방식
TYPE 연관배열_이름 IS TABLE OF 연관배열_값타입 INDEX BY 인덱스타입;
변수명 타입명;


인덱스데이터타입 ; 연관배열에 저장된 개별 항목을 유일하게 식별하기 위한 인덱스로 사용할 값의 타입
	ㄴ 정수 또는 문자열
	ㄴ 키-값 ; 쌍으로 이루어진 무한 배열
	ㄴ 키는 순서대로 정렬되어 저장
			ㄴ 정수의 경우 숫자의 순서에 따라 저장 
			ㄴ 문자의 경우 NLS_SORT 또는 NLS_COMP 초기화 파라미터에 따르는 정렬순서에 따라서 정렬



연관배열 실습========================================

DECLARE
-- 숫자-문자 쌍의 연관 배열 선언
TYPE av_type IS TABLE OF VARCHAR2(40) INDEX BY PLS_INTEGER;

-- 연관배열 변수 선언
vav_test av_type;

BEGIN 
	-- 연관배열 값 할당 
	vav_test(10) := '10에 대한 값';
	vav_test(20) := '20에 대한 값'; 
	
	-- 연관 배열 값 출력
	DBMS_OUTPUT.PUT_LINE(vav_test(10));
	DBMS_OUTPUT.PUT_LINE(vav_test(20));
END;

=================================================


1-3. VARRAY(가변크기배열)

배열의 크기를 선언 시 지정


  












































