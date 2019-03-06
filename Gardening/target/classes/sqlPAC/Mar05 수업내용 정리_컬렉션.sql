	
----------------------------------------------------------------------------------------------
컬렉션
----------------------------------------------------------------------------------------------

컬렉션의 종류

1. 연관배열 ( JAVA MAP)
   * 키와 값으로 구성
   * 키를 인덱스
   * 키-값이 한 쌍을 이루어 연결되어 있는 배열 구조 => 연관 배열이라고도 함
   * 배열_값타입은 어떤 데이터 타입이든 올 수 있지만, 인덱스 타입은 문자형이나 PLS_INTEGER 타입만 올 수 있다
   * 각 요소 값은 “연관_배열_변수명(인덱스)” 형태로 접근
   * 3가지 타입 중 유일하게 연관 배열만 생성자를 사용할 수 없다
   * 연관 배열은 그 크기에 제한 없다.
   * 각 요소에 값을 입력할 때마다 내부적으로는 숫자형이든 문자형이든 인덱스 값으로 정렬됨
   
   구문 ) TYPE 연관_배열명 IS TABLE OF 연관_배열_값타입 INDEX BY 인덱스타입;
   
   
   CREATE TABLE STUD_SD ( STUDNO NUMBER(3) , STD_INFO VARCHAR2(1000))
   
	DECLARE
    
      
      I PLS_INTEGER := 0;     
      V_TCNT PLS_INTEGER  := 0;
      
        -- 숫자-문자 쌍의 연관 배열 선언
      TYPE STD_COLTYPE IS TABLE OF VARCHAR2(1000) INDEX BY PLS_INTEGER;

      -- 연관 배열 변수 선언
      CAV_STDINFO STD_COLTYPE;
      
      CURSOR STD_CUR IS
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;    
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
    BEGIN    
                
        EXECUTE IMMEDIATE 'TRUNCATE TABLE STUD_SD' ;
        
         OPEN STD_CUR ;
         
         LOOP
         
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            I := I+1 ;        
            
            CAV_STDINFO(V_STD_REC.STUDNO) := V_STD_REC.STD_INFO ;
          
           IF MOD(I,2) = 0 THEN 
                DBMS_OUTPUT.PUT_LINE(I) ;
                DBMS_OUTPUT.PUT_LINE(CAV_STDINFO(V_STD_REC.STUDNO)) ;   
                INSERT INTO  STUD_SD VALUES( V_STD_REC.STUDNO, CAV_STDINFO(V_STD_REC.STUDNO)) ;
                      
           END IF;
           
           COMMIT ;
            
         END LOOP ;      
    END;
	
2. VARRAY
   * Variable-Size Array 는 가변 길이 배열로서 연관 배열과는 달리 그 크기에 제한
   * 선언할 때 크기(요소 개수)를 지정
   * VARRAY도 “변수명(인덱스)” 형태로 해당 요소 값에 접근
   * 연관 배열은 인덱스로 문자형이나 PLS_INTEGER 값을 사용할 수 있지만 VARRAY의 인덱스는 숫자만 가능
   * 사용자가 별도로 인덱스 타입을 지정하는 것이 아니라 자동으로 순번이 매겨지며 최솟값은 1
   **  VARRAY는 생성자를 사용해 초기화하기 전까지는 각 요소에 값을 할당하거나 읽어 올 수 없다
        초기화 없이 값을 할당하거나 참조할 때는 오류가 발생
   * 생성자는 “VARRAY명(값1, 값2, …)” 형태로 사용		
   * 요소 중간중간의 값이 비어 있을 수도 있다(요소 중간의 값이 비어 있다고 해서 그 요소가 존재하지 않는 것은 아니다). 
   
   구문)   TYPE VARRAY명 IS VARRAY(최대 크기) OF 요소값_타입;
      
    
   DECLARE
      -- 5개의 문자형 값(크기는 5)으로 이루어진 VARRAY 선언
      TYPE STD_COLTYPE IS VARRAY(10) OF VARCHAR2(1000);

      -- VARRY 변수 선언
      CVA_REC STD_COLTYPE;

    CURSOR STD_CUR IS
    
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
      VN_CNT NUMBER := 0;
      
    BEGIN
      
         OPEN STD_CUR ;
         
         CVA_REC := STD_COLTYPE('','','','','','','','','','') ;         
		 
        LOOP
      
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            VN_CNT := VN_CNT + 1;
        -- 크기가 5이므로 5회 루프를 돌면서 각 요소 값 출력
        
            IF VN_CNT <= 10 THEN       
              -- VARRY 요소 값 출력
              --  DBMS_OUTPUT.PUT_LINE(VN_CNT);        
                CVA_REC(VN_CNT) := V_STD_REC.STD_INFO ;            
            END IF;
            
      END LOOP;
      
      VN_CNT := 10 ;
      
	  FOR I IN 1.. VN_CNT
	  LOOP 
		DBMS_OUTPUT.PUT_LINE(CVA_REC(I)) ;
	  END LOOP ;
    
    END;
    
   
	
3. 중첩 테이블
	*  중첩 테이블은 크기에 제한이 없다는 점은 연관 배열과 같지만, 
	   숫자형 인덱스만 사용할 수 있고 생성자를 사용하며 일반 테이블의 컬럼 타입으로 사용될 수 있다는 점은 VARRAY와 같다.
	   
	* VARRAY와 달리 최대 크기를 선언하지 않으므로 크기에 제한이 없고 동적으로 계속 늘어날 수 있다   
	
	구문) TYPE 중첩_테이블명 IS TABLE OF 값타입 ;
	
	
	 DECLARE
      -- 5개의 문자형 값(크기는 5)으로 이루어진 VARRAY 선언
      TYPE NT_COLTYPE IS TABLE OF VARCHAR2(1000);

      -- VARRY 변수 선언
      CVNT_REC NT_COLTYPE;

    CURSOR STD_CUR IS    
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
      VN_CNT NUMBER := 0;
      
    BEGIN
      
         OPEN STD_CUR ;
         
         CVNT_REC := NT_COLTYPE(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL) ;         
         
        LOOP
      
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            VN_CNT := VN_CNT + 1;
        -- 크기가 5이므로 5회 루프를 돌면서 각 요소 값 출력
        
            IF VN_CNT <= 10 THEN       
              -- VARRY 요소 값 출력
              --  DBMS_OUTPUT.PUT_LINE(VN_CNT);        
                CVNT_REC(VN_CNT) := V_STD_REC.STD_INFO ;            
            END IF;
            
      END LOOP;
      
      VN_CNT := 10 ;
      
      FOR I IN 1.. VN_CNT
      LOOP 
        DBMS_OUTPUT.PUT_LINE(CVNT_REC(I)) ;
      END LOOP ;
    
    END;    
	
------------
컬렉션 메소드
------------

컬렉션의 요소에 접근해 값을 가져오고 수정하고 삭제하는 기능을 하는 일련의 빌트인 프로시저와 함수

DELETE	프로시저	컬렉션
TRIM	프로시저	"VARRAY / 중첩 테이블"
EXTEND	프로시저	"VARRAY / 중첩 테이블"
EXISTS	함수	"VARRAY / 중첩 테이블"
FIRST	함수	컬렉션
LAST	함수	컬렉션
COUNT	함수	컬렉션
LIMIT	함수	컬렉션
PRIOR	함수	컬렉션
NEXT	함수	컬렉션


---------------
1. DELETE 메소드
* 매개변수를 생략하면 요소 전체를 삭제하며, (from, to)형태로 2개의 매개변수를 넘기면 그 범위안에 속한 모든 요소를 삭제
---------------

	DECLARE
      -- 숫자-문자 쌍의 연관 배열 선언
      TYPE av_type IS TABLE OF VARCHAR2(40) INDEX BY VARCHAR2(10);

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

---------------
2. TRIM 메소드
* VARRAY나 중첩 테이블의 맨 끝에서부터 매개변수로 넘긴 개수만큼 해당 요소를 제거
---------------
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
      DBMS_OUTPUT.PUT_LINE(vnt_test(4));    -- 오류 발생, 2개 삭제했으므로 3개만 남아있기 때문

    EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    END;
	
---------------
2-1. EXISTS	
---------------

DECLARE
      -- 중첩 테이블 선언
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- 변수 선언
      vnt_test nt_typ;
    BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- FIRST와 LAST 메소드를 FOR문에서 사용해 컬렉션 값을 출력
      
        --DBMS_OUTPUT.PUT_LINE ();
        IF  vnt_test.EXISTS(2) THEN
                DBMS_OUTPUT.PUT_LINE (vnt_test(2));
        END IF ;                

  END  ;
  
---------------
3. EXTEND

TRIM과는 반대로 VARRAY와 중첩 테이블의 끝에 요소를 추가하는 기능을 수행하며, 다음과 같이 3가지 형태로 사용된다.
 ? EXTEND        → 해당 컬렉션의 맨 끝에 NULL인 요소 하나를 추가한다.
 ? EXTEND (n)    → 해당 컬렉션의 맨 끝에 값이 NULL인 요소를 n개 추가한다.
 ? EXTEND (n, i) → 해당 컬렉션의 i번째에 있는 요소를 맨 끝에 n개 복사해 추가한다.
---------------

 DECLARE
      -- 5개의 문자형 값(크기는 5)으로 이루어진 VARRAY 선언
      TYPE NT_COLTYPE IS TABLE OF VARCHAR2(1000);

      -- VARRY 변수 선언
      CVNT_REC NT_COLTYPE;

    CURSOR STD_CUR IS    
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
      VN_CNT NUMBER := 0;
      
    BEGIN
      
         OPEN STD_CUR ;
         
         CVNT_REC := NT_COLTYPE() ;  -- EMPTY 초기화       
         
        LOOP
      
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            CVNT_REC.EXTEND ; -- 확장 후 입력
            
            VN_CNT := VN_CNT + 1;
        
            DBMS_OUTPUT.PUT_LINE(VN_CNT);        
            CVNT_REC(VN_CNT) := V_STD_REC.STD_INFO ; 
            
      END LOOP;     
      
      
      FOR I IN 1.. VN_CNT
      LOOP 
        DBMS_OUTPUT.PUT_LINE(CVNT_REC(I)) ;
      END LOOP ;
    
    END;    
	
EXISTS

---------------
FIRST
LAST
* 매개변수 없이 각각 컬렉션의 첫 번째와 마지막 요소의 인덱스를 반환
* 모든 컬렉션가능
---------------

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

---------------
COUNT
LIMIT
*  COUNT는 컬렉션의 요소 개수를 반환하는 메소드다. VARRAY는 요소 일부를, 
   즉 중간에 있는 요소를 삭제할 수 없기 때문에 COUNT와 LAST 메소드의 반환 값이 같다

*  LIMIT 메소드는 해당 컬렉션이 가질 수 있는 요소의 최대 수를 반환
* 모든 컬렉션가능
---------------	

  DECLARE

      TYPE nt_typ IS TABLE OF VARCHAR2(10);      -- 중첩테이블 선언
      TYPE va_type IS VARRAY(5) OF VARCHAR2(10); -- VARRAY 선언

      -- 변수 선언
      vnt_test nt_typ;
      vva_test va_type;
    BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH'); -- 중첩테이블
      vva_test := va_type('첫번째', '두번째', '세번째', '네번째'); -- VARRAY

      DBMS_OUTPUT.PUT_LINE('VARRAY COUNT: ' || vva_test.COUNT);
      DBMS_OUTPUT.PUT_LINE('중첩테이블 COUNT: ' || vnt_test.COUNT);

      DBMS_OUTPUT.PUT_LINE('VARRAY LIMIT: ' || vva_test.LIMIT);
      DBMS_OUTPUT.PUT_LINE('중첩테이블 LIMIT: ' || vnt_test.LIMIT);

    END;
--------
	참고
---------
DECLARE
      -- 연관 배열 선언
      TYPE nt_typ IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10) ;
      -- 변수 선언
      vnt_test nt_typ;
      
      V_CNT PLS_INTEGER := 0 ;
      
    BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test('A') := '1-' ;
      vnt_test('B') := '2--';
      vnt_test('C') := '3---';
      vnt_test('D') := '4----';
      vnt_test('E') := '5-----';
      
      LOOP
        
        V_CNT := V_CNT +1;
        EXIT WHEN V_CNT > vnt_test.COUNT ;
        DBMS_OUTPUT.PUT_LINE(vnt_test(CHR(64+V_CNT))) ;
        
      END LOOP ;
    END;	
	
-------------
PRIOR
NEXT
* 모든 컬렉션가능
--------------
DECLARE
  TYPE nt_typ IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10) ;
      -- 변수 선언
      vnt_test nt_typ;
      
      V_CNT PLS_INTEGER := 0 ;
      
    BEGIN
      -- 생성자를 사용해 값 할당
      vnt_test('A') := '1-' ;
      vnt_test('B') := '2--';
      vnt_test('C') := '3---';
      vnt_test('D') := '4----';
      vnt_test('E') := '5-----';

      DBMS_OUTPUT.PUT_LINE('FIRST의 PRIOR : ' || vnt_test.PRIOR(vnt_test.FIRST));
      DBMS_OUTPUT.PUT_LINE('LAST의 NEXT : ' || vnt_test.NEXT(vnt_test.LAST));

      DBMS_OUTPUT.PUT_LINE('인덱스B의 PRIOR :' || vnt_test.PRIOR('B'));
      DBMS_OUTPUT.PUT_LINE('인덱스B의 NEXT :' || vnt_test.NEXT('B'));

    END;

---------------------------
사용자 정의 데이터 타입	
---------------------------