-- 2018-12-11

SELECT * FROM USER_VIEWS;
DESC V_DIA_HW2;

-- SQL 함수 실습


SELECT 
		ABS(-5) COL1
	, 	ABS(5) COL2
	,	FLOOR(10.5) COL3
	, 	CEIL(10.5) COL4
	,	POWER(2,3) COL5
	,	SQRT(16) COL6
	,	ROUND(10.4) COL7
	,	ROUND(10.5) COL8
	,	TRUNC(10.4) COL9
	,	TRUNC(10.5) COL10
	,	TRUNC(11.5,-1) COL11
	,	ADD_MONTHS(TO_DATE('20180101','YYYYMMDD'),3) COL12
	,	CURRENT_DATE COL13
	,	EXTRACT(YEAR FROM SYSDATE) COL14
	,	EXTRACT(MONTH FROM SYSDATE) COL15
	,	EXTRACT(DAY FROM SYSDATE) COL16
	,	EXTRACT(DAY FROM LAST_DAY(TO_DATE('201803','YYYYMM'))) COL17
	,	NEXT_DAY('20181203',2) COL18
	,	NEXT_DAY('20181203','월') COL19
	,	SYSDATE COL20
	,	TRUNC(SYSDATE) COL21
FROM DUAL;
	
	
----------------------------
	
SELECT SYSTIMESTAMP ST
	, TO_CHAR(SYSTIMESTAMP,'YYYY/MM/DD HH24:MI:SS') CST
	, EXTRACT(YEAR FROM SYSDATE) Y
	, EXTRACT(MONTH FROM SYSDATE) MM
	, EXTRACT(DAY FROM SYSDATE) D
	, EXTRACT(HOUR FROM SYSTIMESTAMP) T1
	, EXTRACT(HOUR FROM SYSTIMESTAMP)+9 T2
	, EXTRACT(HOUR FROM SYSTIMESTAMP)+ EXTRACT(TIMEZONE_HOUR FROM SYSTIMESTAMP) T3
	, EXTRACT(MINUTE FROM SYSTIMESTAMP) M
	, EXTRACT(SECOND FROM SYSTIMESTAMP) S
FROM DUAL;


----------------------------

SELECT 
			EXTRACT(YEAR FROM LAST_DAY   -- 년
			(ADD_MONTHS(TO_DATE('20181201'/*:V_YMD*/, 'YYYYMMDD'), ROWNUM-1))) Y
		,	EXTRACT(MONTH FROM LAST_DAY  -- 월
			(ADD_MONTHS(TO_DATE('20181201'/*:V_YMD*/, 'YYYYMMDD'), ROWNUM-1))) M
		,	EXTRACT(DAY FROM LAST_DAY    -- 일
			(ADD_MONTHS(TO_DATE('20181201'/*:V_YMD*/, 'YYYYMMDD'), ROWNUM-1))) D
FROM SALE_TBL
WHERE ROWNUM <= 12;    -- *:V_YEAR_CNT
			

----------------------------

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
	, TO_CHAR(TRUNC(SYSDATE), 'YYYY-MM-DD')
	, TO_CHAR(ROUND(SYSDATE), 'YYYY-MM-DD')
	, TO_CHAR(SYSDATE, 'DAY')
	, TO_CHAR(SYSDATE, 'MON')
	, TO_CHAR(SYSDATE, 'YEAR')
	, SYSDATE
	, SYSDATE + 5/(24*60*60)
	, SYSDATE + 5*60/(24*60*60)
	, SYSDATE + 5*60*60/(24*60*60)
	, SYSDATE + 5
	, ADD_MONTHS(SYSDATE,-3)
	, ADD_MONTHS(SYSDATE,3)
	, SYSDATE - TO_DATE('2015-12-11','YYYY-MM-DD') T3 
	, MONTHS_BETWEEN(SYSDATE, TO_DATE('2018-10-11', 'YYYY-MM-DD'))
	, LAST_DAY(SYSDATE)
	, TO_CHAR(SYSDATE,'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"')
FROM DUAL;


------------------------

SELECT EXTRACT(DAY FROM LAST_DAY(TO_DATE(:ARG_YM, 'YYYYMM')),'DD')
FROM DUAL
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(DO_DATE(:ARG_YM, 'YYYYMM')),'DAY')

-- 다시 정리
1. 가로축
2. 세로축
3. 날짜 : ROWNUM
;

-- 정규식
	
SELECT 
	  :ARG_YM
	, DECODE(ASCII(SUBSTR(:ARG_VA,1,1)),

FROM DUAL
WHERE  ASCII(SUBSTR(:ARG_VA,1,1))  BETWEEN 80 AND 89
AND ASCII(SUBSTR(:ARG_VA,2,1)) LIKE 
;

첫번째 자리 : 0~9
두번째 자리 : 0,2,5

;

SELECT REGEXP_SUBSTR(:ARG_STR,'[0-9](0|2|5)'), '실패')
FROM DUAL;

-- 

SELECT 
	TRANSLATE(VAR_TRANS, '0123456789' || VAR_TRANS, '0123456789' ) TST_1,
	TRANSLATE(VAR_TRANS, ' 0123456789' ,' ') TST_2
FROM  (
	 SELECT '안9녕8하7세6요5 4H3 2입1니0다' AS VAR_TRANS FROM DUAL)
	;

	


SELECT 
		NVL(REGEXP_SUBSTR(SUBSTR(:IN_STR,1,2),'[0-9]{2}'), '오류') COL1
	,   NVL(REGEXP_SUBSTR(SUBSTR(:IN_STR,3,2),'0[1-9]|1[0-2]'), '오류') COL2
	,   NVL(REGEXP_SUBSTR(SUBSTR(:IN_STR,5,2),'0[1-9]|[1-2][0-9]|3[0-1]'), '오류') COL3
	,   NVL(REGEXP_SUBSTR(SUBSTR(:IN_STR,7,1),'[1-4]'), '오류') COL4
	,	SUBSTR(11-MOD(SUM(SUBSTR(:IN_STR,RNUM,1) * SUBSTR(STD_VAL,RNUM,1)),11),-1,1) AS PAT
	,	LENGTH(:IN_STR) AS LEN 
--	,SUBSTR(:IN_STR,RNUM,1) , SUBSTR(STD_VAL,RNUM,1)
	,	:IN_STR  JUMIN

FROM (
	SELECT ROWNUM RNUM
			, '234567892345' STD_VAL
	FROM DUAL
	CONNECT BY LEVEL <= 12
)
;


SELECT 
		REGEXP_SUBSTR('KOR08-021-0090-0012ENG00-010-000-0011abcef','([[:digit:]]+\-)+([[:digit:]]+)',1,1) COL1
	,	REGEXP_SUBSTR('KOR08-021-0090-0012ENG00-010-000-0011abcef','([[:digit:]]+\-)+([[:digit:]]+)',1,2) COL2
	,	REGEXP_COUNT('KOR08-021-0090-0012ENG00-010-000-0011abcef','[[:digit:]]') COL3
	,	REGEXP_INSTR('KOR08-021-0090-0012ENG00-010-000-0011abcef','([[:digit:]]+\-)+[[:digit:]]+',1,1) COL4
	,	REGEXP_INSTR('KOR08-021-0090-0012ENG00-010-000-0011abcef','([[:digit:]]+\-)+[[:digit:]]+',1,2) COL5
	,	LENGTH('KOR08-021-0090-0012ENG')
	,	REGEXP_SUBSTR('123','[0-9]+') COL
	,	REGEXP_SUBSTR('ABC평창DE올림픽','[가-힝]+',1,1)||'-'|| REGEXP_SUBSTR('ABC평창DE올림픽','[가-힝]+',1,2) AS STR
	
FROM DUAL
;


SELECT VAR_STR ORG
	,	SUBSTR(VAR_STR, 1, INSTR(VAR_STR, ',' , 1 , 1)-1) COL1
	, 	SUBSTR(VAR_STR, INSTR(VAR_STR,',',1,1)+1, INSTR(VAR_STR,',',1,2) - INSTR(VAR_STR,',',1,1)-1) COL2
	, 	SUBSTR(VAR_STR, INSTR(VAR_STR,',',1,2)+1, INSTR(VAR_STR,',',1,3) - INSTR(VAR_STR,',',1,2)-1) COL3
	, 	SUBSTR(VAR_STR, INSTR(VAR_STR,',',1,3)+1, INSTR(VAR_STR,',',1,4) - INSTR(VAR_STR,',',1,3)-1) COL4
	, 	SUBSTR(VAR_STR, INSTR(VAR_STR,',',1,4)+1, INSTR(VAR_STR,',',1,5) - INSTR(VAR_STR,',',1,4)-1) COL5
FROM 
	(
	SELECT '홍길동,김길동,박길동,1233,456' VAR_STR FROM DUAL
)
;





--

-- 데이터타입의 변환 함수

SELECT TO_MULTI_BYTE('ABC'), TO_SINGLE_BYTE('ABC') FROM DUAL


;






SELECT 
	DECODE(B.NO,1,NAME ,2,CLASS,'TOT') AS  NM		
	, SUM(KOR) KOR
	, SUM(ENG) ENG
	, SUM(MAT) MAT 
	, SUM(KOR+ENG+MAT) TOT 
FROM 
	EXAM_RSLT  A,
	(SELECT ROWNUM NO FROM DUAL
	CONNECT BY LEVEL <= 3) B
GROUP BY DECODE(B.NO,1,NAME ,2,CLASS,'TOT') 
ORDER BY MIN(B.NO), MIN(CLASS)
;

------------------------------------------------------------------------------------------

-- 1. 각각 GROUP BY 하는 경우 어떤걸로 GROUP BY 하는 지를 알 수있다.

SELECT NAME
	, SUM(KOR) KOR
	, SUM(ENG) ENG
	, SUM(MAT) MAT
	, SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSLT
GROUP BY CLASS, NAME
UNION ALL
SELECT CLASS 
	, SUM(KOR) KOR
	, SUM(ENG) ENG
	, SUM(MAT) MAT
	, SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSTL
GROUP BY CLASS
UNION ALL
SELECT 'TOT' 
	, SUM(KOR) KOR
	, SUM(ENG) ENG
	, SUM(MAT) MAT
	, SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSTL
GROUP BY NULL
;


-- 2. GROUP BY 로 DECODE를 이용해 하면 다음과 같음
SELECT DECODE(NO,1,NAME,2,CLASS,'TOT') NAME
	, SUM(KOR) KOR
	, SUM(ENG) ENG
	, SUM(MAT) MAT
	, SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSLT A,
  ( SELECT NO FROM COPY_T
    WHERE ROWNUM <= 3 ) B
GROUP BY DECODE(NO,1,CLASS)
			, DECODE(NO, 1, NAME, 2, CLASS, 'TOT')
ORDER BY MIN(NO) , KOR
;


-- 3. 분석함수 ROLLUP 이용하여 GROUP화 하기
SELECT DECODE(GROUPING(CLASS)||GROUPING(NAME), '00', NAME, '01', CLASS, 'TOT') NAME
		, SUM(KOR) KOR
		, SUM(ENG) ENG
		, SUM(MAT) MAT
		, SUM(KOR+ENG+MAT) TOT
		, GROUPING(CLASS)||GROUPING(NAME) GR
FROM EXAM_RSLT
GROUP BY ROLLUP(CLASS,NAME)
ORDER BY GR, NAME
;

------------------------------------------------------------------------------

SELECT * FROM STUDENT;

-- ROLLUP 예제
SELECT DEPTNO1, GRADE, SUM(WEIGHT), 
	GROUPING(DEPTNO1) || GROUPING(GRADE) AS TGT, 
	'DEPTNO('||DECODE(GROUPING(DEPTNO1),0,'O','X')||')' ||
	' / GRADE('||DECODE(GROUPING(GRADE),0,'O','X')||')' AS TGT_CMT
FROM STUDENT
GROUP BY ROLLUP(DEPTNO1,GRADE)
--HAVING DEPTNO1 <= 201 OR DEPTNO1 IS NULL
ORDER BY  4, 1;



------------------------------------------------------------------------------

-- QUBE 예제
SELECT DEPTNO1, GRADE, SUM(WEIGHT), 
	GROUPING(DEPTNO1) || GROUPING(GRADE) AS TGT, 
	'DEPTNO('||DECODE(GROUPING(DEPTNO1),0,'O','X')||')' ||
	' / GRADE('||DECODE(GROUPING(GRADE),0,'O','X')||')' AS TGT_CMT
FROM STUDENT
GROUP BY CUBE(DEPTNO1,GRADE)
ORDER BY 4


------------------------------------------------------------------------------




