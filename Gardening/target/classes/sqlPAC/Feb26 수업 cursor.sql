-- Feb26 

DB영역에 있는 데이터를 어떤 자료구조로 내 프로그램영역 (PLSQL)  변수에 담을려면 
	커서
	레코드
	컬렉션

커서	
SQL문장의 처리 결과를 담고 있는 영역 (PRIVATE SQL이라는 메모리영역)
	SQL 을 SELECT 하면, 그 결과가 PRIVATE SQL에 들어감
그 결과를 가르키는 포인터가 커서이다.

묵시적 커서
	사용자가 선언하지 않았지만 내부적으로 선언됨
	UPDATE, DELETE 할때도 커서 존재해야.
	모든 SQL 처리할 때 커서 존재해야.
	내부적으로는 
		공용 ; 열기OPEN 패치FETCH 닫기CLOSE 3단계로 진행된다
		자동으로 적용해주는 문법
		공용으로 써야하는 문법
명시적 커서 
	커서를 선언해 사용
	
	
커서의 속성 
	%ROWCOUNT		커서의 속성
	SQL%ROWCOUNT 커서를 선언 안했을 때 그냥 익명으로 SQL이라 써줌 그 사용할 커서의 속성을 나타내게하는 거
	
TBL 정보 
EXAM_RSLT_P

(예제는 나중에 이사님이 주시는거 보기) 

○ 묵시적 커서 속성 
SQL%FOUND 				; TRUE/FAULSE 이기 때문에 DBMS_OUTPUT.PUT_LINE 으로 출력할 수 없음
SQL%NOTFOUND		; TRUE/FAULSE 이기 때문에 DBMS_OUTPUT.PUT_LINE 으로 출력할 수 없음
SQL%ROWCOUNT		; 결과가 실행된 값의 수를 나타냄 
SQL%ISOPEN 

○ 명시적 커서 
1. 커서 선언
2. 커서 열기
3. 패치 단계에서 커서 사용 (LOOP 돌림) 
		커서명%NOTFOUND  를 LOOP문 빠지는 조건으로 EXIT WHEN 에 넣어줌 
		EXIT WHEN 커서명%NOTFOUND 
		
;
예제 ) -- 이사님이 주시는거 보기  명시적커서  
;

DECLARE
	VEXAM_REC EXAM_RSLT%ROWTYPE;
	VS_GRADE EXAM_RSLT.GRADE%TYPE := 2;
	
	-- 커거 선언, 매개변수로 부서코드를 받는다.
	CURSOR CUR_EXAM_DATA IS
	SELECT * 
	FROM EXAM_RSLT
	WHERE GRADE = VS_GRADE;
BEGIN
	-- 커서 오픈
	OPEN CUR_EXAM_DATA ;
	
	-- 반복문을 통한 커서 패치작업
	LOOP
		-- 커서 결과로 나온 로우를 패치함(사원명을 변수에 할당)
		FETCH CUR_EXAM_DATA INTO VEXAM_REC;
		-- 패치된 참조 로우가 더 없으면 LOOP 탈출
		EXIT WHEN CUR_EXAM_DATA%NOTFOUND ;
		--사원명을 출력
		DBMS_OUTPUT.PUT_LINE(VEXAM_REC.NAME || ' | '|| VEXAM_REC.CLASS || ' | '|| VEXAM_REC.GRADE || ' | ' || TO_CHAR(VEXAM_REC.KOR + VEXAM_REC.ENG + VEXAM_REC.MAT) || ' | ' );
	END LOOP;
	-- 반복문 종료 후 커서 닫기
	CLOSE CUR_EXAM_DATA ;
END;





-- 이거 다시 봐야해 실행안됨





SELECT * 
FROM EXAM_RSLT;


SELECT * 
FROM CD_TBL;

DESC SALE_TBL;



SELECT MAX(CD_NM) 이름, SUM(SALE_CNT) 판매량
FROM SALE_TBL A , CD_TBL B
WHERE AREA_CD = 20
	AND A.PROD_ID = B.CD_ID
GROUP BY PROD_ID;


SELECT MAX(AREA_CD) COL1, MAX(REGION_AREA) COL2,  MAX(CD_NM) COL3 , SUM(SALE_CNT) COL4
	FROM SALE_TBL A , CD_TBL B
	WHERE AREA_CD = 20
	AND A.PROD_ID = B.CD_ID
	GROUP BY PROD_ID;


ROWTYPE 으로 SALE_TBL 이랑 CD_TBL 만들면 됨 




숙제 
1. SQL문 의 바인딩 변수를 
CREATE OR REPLACE 프로시저로 변수로 받아서 

이 SQL을  VARCHAR2 인 AVC라는 변수에 넣고 
AVC를 EXECUTE IMMEDIATE AVC 로 실행주면 됨  


CDA = 'SELECT ~~~ '; 
CDA := REPLACE(CDA, ':ARG_CNT', ARG_CNT) ;
CDA := REPLACE(CDA, ':ARG_CNT', ARG_CNT) ;


EXECUTE IMMEDIATE CDA;


이렇게 해서 




DIA_SAMPLE




DECLARE 
	V_SL_DATA NUMBER := 0;
	V_CD_DATA VARCHAR2(1000);
	V_AREA_CD SALE_TBL.AREA_CD%TYPE := 20;
	
	-- 커거 선언, 매개변수로 부서코드를 받는다.
	CURSOR CUR_DIA_DATA IS
	SELECT MAX(CD_NM) COL1 , SUM(SALE_CNT) COL2
	FROM SALE_TBL A , CD_TBL B
	WHERE AREA_CD = V_AREA_CD
	AND A.PROD_ID = B.CD_ID
	GROUP BY PROD_ID;
BEGIN
-- 커서 오픈
	OPEN CUR_DIA_DATA;
	-- 반복문을 통한 커서 패치작업
	LOOP
		-- 커서 결과로 나온 로우를 패치함(사원명을 변수에 할당)
		FETCH CUR_DIA_DATA INTO  V_CD_DATA,V_SL_DATA
		-- 패치된 참조 로우가 더 없으면 LOOP 탈출
		EXIT WHEN CUR_DIA_DATA%NOTFOUND ;
		--사원명을 출력
		DBMS_OUTPUT.PUT_LINE( '판매 가구 : ' || V_CD_DATA || ', 판매량(총액) : '  || V_SL_DATA);
	END LOOP;
	-- 반복문 종료 후 커서 닫기
	CLOSE CUR_DIA_DATA ;
END;






DECLARE 
	V_ROW_SALECNT SALE_TBL%ROWTYPE;
	V_AREA_CD SALE_TBL.AREA_CD%TYPE := 20;
	
	-- 커서 선언, 매개변수로 지역번호를 받는다.
	CURSOR CUR_DIA_DATA IS
	SELECT MAX(AREA_CD) COL1, MAX(REGION_AREA) COL2,  MAX(CD_NM) COL3 , SUM(SALE_CNT) COL4
	FROM SALE_TBL A , CD_TBL B
	WHERE AREA_CD = V_AREA_CD
	AND A.PROD_ID = B.CD_ID
	GROUP BY PROD_ID;
	
BEGIN
-- 커서 오픈
	OPEN CUR_DIA_DATA;
	-- 반복문을 통한 커서 패치작업
	LOOP
		-- 커서 결과로 나온 로우를 패치함(사원명을 변수에 할당)
		FETCH CUR_DIA_DATA INTO  V_ROW_SALECNT
		-- 패치된 참조 로우가 더 없으면 LOOP 탈출
		EXIT WHEN CUR_DIA_DATA%NOTFOUND ;
		--사원명을 출력
		DBMS_OUTPUT.PUT_LINE( '판매 가구 : ' || V_ROW_SALECNT.COL3 || ', 판매량(총액) : '  || V_ROW_SALECNT.COL4);
	END LOOP;
	-- 반복문 종료 후 커서 닫기
	CLOSE CUR_DIA_DATA ;
END;








	
	



