-- 컬렉션 

종류
1. 연관배열 ; 키-값 (JAVA의 MAP)  =================================================================
				키를 인덱스로 사용 
				인덱스를 숫자나 문자로 사용 가능 
				접근방법 ; 연관배열변수명(인덱스) 
				생성자를 사용할 수 없음 (생성자 제공안함 = 초기화 안해도됨)
				크기에 제한 없음 
				입력할때마다 내부적으로 인덱스 값으로 정렬됨 
				
	TYPE 연관배열명 IS TABLE OF 연관배열값타입(리턴받을값타입) INDEX BY 인덱스타입; 
	
	
	STUDENT 를 가지고 학번을 주면 정보를 출력 
	
 	
연관배열 예제
EXEC P_DIA_COLLECTION01(9411);
EXEC P_DIA_COLLECTION02('서재수');

=============================

CREATE OR REPLACE PROCEDURE P_DIA_COLLECTION01(V_NUM NUMBER)
IS 
	TYPE STD_TYPE IS TABLE OF VARCHAR2(1000) INDEX BY PLS_INTEGER; 
    VAR_STD  STD_TYPE;
    
    CURSOR DIA_CURSOR IS
    SELECT STUDNO
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	
BEGIN
	OPEN DIA_CURSOR;
	LOOP
		FETCH DIA_CURSOR INTO REC_STUD; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
				VAR_STD(REC_STUD.STUDNO) := REC_STUD.STD_INFO ;
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(  VAR_STD(V_NUM)  );
		
	CLOSE DIA_CURSOR; 
END;

=============================

CREATE OR REPLACE PROCEDURE P_DIA_COLLECTION02(V_NAME VARCHAR2)
IS 
	TYPE STD_TYPE IS TABLE OF VARCHAR2(1000) INDEX BY VARCHAR2(200); 
    VAR_STD  STD_TYPE;
    
    CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	
BEGIN
	OPEN DIA_CURSOR;
	LOOP
		FETCH DIA_CURSOR INTO REC_STUD; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
				VAR_STD(REC_STUD.NAME) := REC_STUD.STD_INFO ;
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(  VAR_STD(V_NAME)  );
		
	CLOSE DIA_CURSOR; 
END;


    

	
2. VARRAY  =================================================================

선언 시 사이즈를 지정 (요소개수 지정)
내부적으로 인덱스를 만들어서 씀 (내가 인덱스를 선언할 수 없음)
인덱스는 PLS_INTEGER 로 설정됨 
사용하려면 초기화해야함
		초기화 하는 방법

TYPE 브이어레이명 IS VARRAY(최대크기) OF 요소값타입; 

VARRAY 변수선언 

타입선언
변수선언
비긴
오픈커서
초기화    '중요' ; 여기가 없으면 오류남 
루프 
	FETCH 커서

CREATE OR REPLACE PROCEDURE P_DIA_VARRAY01
IS 
TYPE T_VARRAY IS VARRAY(10)  OF VARCHAR2(1000);
					-- 사이즈가 10개로 정해짐 
VAR_VRR  T_VARRAY ; 

CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	VN_CNT NUMBER := 0;

BEGIN
	OPEN DIA_CURSOR ; 
	VAR_VRR := T_VARRAY('','','','','','','','','','');  -- 1차원배열 ; 초기화를 해주지 않으면 사용불가 
	
	LOOP 
		FETCH  DIA_CURSOR INTO REC_STUD ; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
		VN_CNT := VN_CNT+1;
		
		IF VN_CNT <= 10 THEN 
			VAR_VRR(VN_CNT) := REC_STUD.STD_INFO;
		END IF; 		
	END LOOP;
	VN_CNT := 10; 
	FOR I IN 1.. VN_CNT 
	LOOP
		DBMS_OUTPUT.PUT_LINE( I || ' : ' ||   VAR_VRR(I)  );
	END LOOP ;
	CLOSE DIA_CURSOR; 
END;





3. 중첩테이블  =======================================================
크기에 제한 없음
숫자로만 인덱스를 사용가능 
사이즈는 정해주지 않아도 됨 

TYPE 중첩테이블명 IS TABLE OF 값타입; 
-- TABLE 로 정의한다는 것은 사이즈를 정해주지않고 들어가는 값만큼 늘어난다.
-- 들어가는 값 타입만 지정 
-- 인덱스는 숫자로 지정되어있음


CREATE OR REPLACE PROCEDURE P_DIA_NTTBL
IS 
TYPE T_VARRAY IS TABLE  OF VARCHAR2(1000);
					
VAR_VRR  T_VARRAY ; 

CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	VN_CNT NUMBER := 0;

BEGIN
	OPEN DIA_CURSOR ; 
	VAR_VRR := T_VARRAY(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);  -- 얘도 초기화 해줘야
	
	LOOP 
		FETCH  DIA_CURSOR INTO REC_STUD ; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
		VN_CNT := VN_CNT+1;
		
		IF VN_CNT <= 10 THEN 
			VAR_VRR(VN_CNT) := REC_STUD.STD_INFO;
		END IF; 		
	END LOOP;
	VN_CNT := 10; 
	FOR I IN 1.. VN_CNT 
	LOOP
		DBMS_OUTPUT.PUT_LINE( I || ' : ' ||   VAR_VRR(I)  );
	END LOOP ;
	CLOSE DIA_CURSOR; 
END;






표준문법 ; 원하는 사이즈로 늘려주거나 하는 (끝에다 요소를 추가 ) 
VARRAY 는 EXPAND 자체가 안되고
중첩테이블은 EXPAND가 됨 


==============================================
표준문법을 통해서 컬렉션 안에서 데이터 사용 가능 

컬렉션 메소드    --ITERATOR 로 접근 

DELETE 메소드 

    DECLARE
      -- 숫자-문자 쌍의 연관 배열 선언
      TYPE av_type IS TABLE OF VARCHAR2(40)
                      INDEX BY VARCHAR2(10);

      -- 연관배열 변수 선언
      vav_test av_type;

      vn_cnt number := 0;
    BEGIN
      -- 연관 배열 변수 선언
      vav_test('A') := '10에 대한 값';
      vav_test('B') := '20에 대한 값';
      vav_test('C') := '20에 대한 값';

      vn_cnt := vav_test.COUNT;
      DBMS_OUTPUT.PUT_LINE('삭제 전 요소 개수: ' || vn_cnt);
      -- DELETE 메소드를 사용해 두 개의 요소를 삭제
      vav_test.DELETE('A', 'B');

      -- COUNT 메소드를 사용해 연관 배열에 있는 요소 개수를 가져 옴
      vn_cnt := vav_test.COUNT;
      DBMS_OUTPUT.PUT_LINE('삭제 후 요소 개수: ' || vn_cnt);
    END;
    
    ---------------------
    CREATE OR REPLACE PROCEDURE P_DIA_DELETE 
IS 
	TYPE AV_TYPE IS TABLE OF VARCHAR2(40) INDEX BY VARCHAR2(10);
	
	VAV_TEST AV_TYPE ; 
	VN_CNT NUMBER := 0;
	
BEGIN
	VAV_TEST('가') := '가갸거겨' ; 
	VAV_TEST('나') := '눈누난나' ; 
	VAV_TEST('다') := '다댜더댜' ; 
	
	VN_CNT := VAV_TEST.COUNT;
	DBMS_OUTPUT.PUT_LINE('삭제전 개수 : ' || VN_CNT ) ;
	
	VAV_TEST.DELETE('나', '다') ;
	
	VN_CNT := VAV_TEST.COUNT;
	DBMS_OUTPUT.PUT_LINE('삭제 후 개수 : ' || VN_CNT ) ;
	
END; 

----------------------------------------------------------

TRIM 메소드 

  DECLARE
      -- 중첩 테이블 선언
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- 변수 선언
      vnt_test nt_typ;
    BEGIN
      -- 생성자를 사용해 값 할당 (크기는 5)
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- 맨 마지막부터 2개 요소 삭제
      vnt_test.TRIM(2);

      DBMS_OUTPUT.PUT_LINE(vnt_test(1));
      DBMS_OUTPUT.PUT_LINE(vnt_test(2));
      DBMS_OUTPUT.PUT_LINE(vnt_test(3));
      --DBMS_OUTPUT.PUT_LINE(vnt_test(4));    -- 주석 풀면 오류 발생, 2개 삭제했으므로 3개만 남아있기 때문

    EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    END

--------------------------

EXTEND 메소드 

CREATE OR REPLACE PROCEDURE P_DIA_NTTBL01
IS 
TYPE T_VARRAY IS TABLE  OF VARCHAR2(1000);
					
VAR_VRR  T_VARRAY ; 

CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	VN_CNT NUMBER := 0;

BEGIN
	OPEN DIA_CURSOR ; 
	VAR_VRR := T_VARRAY();  -- 비어있는 초기화를 한 후 
	
	LOOP 
		FETCH  DIA_CURSOR INTO REC_STUD ; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
		VAR_VRR.EXTEND; -- 확장 후 입력 
		
		VN_CNT := VN_CNT+1;
		DBMS_OUTPUT.PUT_LINE(VN_CNT);
		VAR_VRR(VN_CNT) := REC_STUD.STD_INFO;
	END LOOP;
	
	FOR I IN 1.. VN_CNT 
	LOOP
		DBMS_OUTPUT.PUT_LINE( I || ' : ' ||   VAR_VRR(I)  );
	END LOOP ;
	CLOSE DIA_CURSOR; 
END;



----------------------

FIRST ; 인덱스번호 첫번째 상수값
LAST ; 인덱스번호 마지막 상수값

-- 인덱스를 가르키는 FIRST 와 LAST 

    DECLARE
      -- 중첩 테이블 선언
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- 변수 선언
      vnt_test nt_typ;
    BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- FIRST와 LAST 메소드를 FOR문에서 사용해 컬렉션 값을 출력
      FOR i IN vnt_test.FIRST..vnt_test.LAST
      LOOP

        DBMS_OUTPUT.PUT_LINE(i || '번째 요소 값: ' || vnt_test(i));
      END LOOP;

    END;


-------------------------
EXISTS 메소드 
	존재하는지 판단
 
 DECLARE
      -- 중첩 테이블 선언
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- 변수 선언
      vnt_test nt_typ;
 BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- FIRST와 LAST 메소드를 FOR문에서 사용해 컬렉션 값을 출력
      FOR i IN vnt_test.FIRST..vnt_test.LAST
      LOOP
		IF vnt_test.EXISTS(2) THEN 
			DBMS_OUTPUT.PUT_LINE( vnt_test(2));
		END IF;
      END LOOP;
END;


-------------------------

COUNT 메소드
	배열에 요소가 몇개 있나 봄
	컬렉션요소의 총 수를 반환


VARRAY 는 COUNT값과 LIMIT값이 동일(중간에 비어있는값이 없음)
연관배열이나 중첩테이블은 LIMIT 사용불가(최대치 모름 계속 추가할수있으니까.)

-------------------------
LIMIT 메소드
	컬렉션이 가질 수 있는 요소의 최대 수를 반환



-- 여기서 문제는 연관배열은 NEXT를 못쓰니까...
DECLARE 
      -- 중첩 테이블 선언
      TYPE nt_typ IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10);
	  V_CNT PLS_INTEGER := 0
      -- 변수 선언
      vnt_test nt_typ;
    BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test('1') := '가';
      vnt_test('2') := 'A';
      vnt_test('3') := 'G';
      vnt_test('4') := 'D';
      vnt_test('5') := 'S';
      
      LOOP
      	V_CNT := V_CNT+1;
      	EXIT WHEN V_CNT > vnt_test.COUNT;
      	DBMS_OUTPUT.PUT_LINE(vnt_test(CHR(64+V_CNT)));
      END LOOP;
END;



-------------------------------
PRIOR 메소드
	어떤것의 이전
	
	
NEXT 메소드
	어떤것의 다음

--------------------------



사용자 정의 타입
TYPE을 만들어서 DB에 등록할 수 있음 

VARCHAR2처럼 데이터타입을 만들어서 사용할 수 있음 

? VARRAY : CREATE OR REPLACE TYPE 타입명 IS VARRAY(최대 크기) OF 값타입 ;
? 중첩 테이블 : CREATE OR REPLACE TYPE 타입명 IS TABLE OF 값타입 ;
? OBJECT : CREATE OR REPLACE TYPE 타입명 IS OBJECT (
               멤버1 멤버1_데이터타입,
               멤버2 멤버2_데이터타입,
               ...
               );



-------------------------

다차원 컬렉션
	N X N 의 형태의 배열 



-----------------------


연관배열, 중첩테이블 등등 2개이상 섞어서 쓸 수 있는게 있는데..
연관배열
	값을 알 때 쓰는거
	
VARRAY 나 중첩테이블
	FOR문돌려서 시퀀셜하게 볼려고 쓰는거




==============================================

자바를 다루는 기술 

화요일 부터 FILE I/O 발표 

자바 

Class 라는 클래스 
	이걸 이용해서 필요할때 클래스를 만들어 낼 수 있음

제너릭 
	Stack<T> st
	Stack<T extends String> st
	Type을 결정해줘 다이나믹하게 사용가능
	클래스 제너릭
	메소드 제너릭  
	C언어에서는 Template이라고 함 

리플랙션
	문자열로 클래스를 로딩해서 클래스 실행해주는것 
	동적 프로그래밍 할 때
	동적으로 클래스를 로딩해 객체생성가능 



다음주 목요일부터 이거 시작 
예제도 내가 작성
설명도 내가 작성 

자바 를 하기위한 기본문법
1. 제너릭
2. file I/O
3. 리플랙션
4. 쓰레드 

제너릭 ; 유지
파일 ; 나
리플랙션 ; 수미 

제너릭을 상속했을 때 자식클래스에서 어떤건 되고 어떤건 안되는지 


파일 I/O
유니코드에 대한 공부 
자바에서 메모리에 올라가는 건 유니코드로 해서 올리는데 윈도에서는 저장할때 euckr 
누가 어떤작용을 해서 euckr에서 유니코드로 넘기는지
file을 byte단위로 읽는데 얘가 끝나는 조건을 어떻게 써야하는지 
	Byte단위를 왜 int값으로 바꿔서 체크하는지?
	파일의 끝을 어떻게 체크하는지
	euckr에서 유니코드로 넘길 때 어떤 매커니즘이 있는지


리플랙션
	jdbc드라이버 로딩할때 쓰는 거 
	class.forName 은 static메소드 
	클래스 로딩해서 사용자가 쓸 수 있게 초기화하는거 
	
쓰레드 
	프로세스에  쓰레드 여러개가 
	rock , sincro 
	재현이 불가능하니까 (스케줄링을 CPU가 하기때문에_) 디버깅 까다로움 
	
	singleton 프로그램을 할 때는 절대 상태를 저장하면 안됨 (복붙이 되어서 상태가 바뀜)
	쓰레드는 공유자원일 때 문제가 발생 
		실행중에 다른게 동시에 실행되서 값을 덮어 씌움..



 
























