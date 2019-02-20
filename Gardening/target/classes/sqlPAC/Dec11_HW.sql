create table dia_user.STUDENT as
select * from STUDENT@WISEDB1;

create table dia_user.EXAM_RSLT as
select * from EXAM_RSLT@WISEDB1;

create table dia_user.COPY_T as
select * from COPY_T@WISEDB1;

SELECT * FROM STUDENT;
SELECT * FROM EXAM_RSLT;
SELECT * FROM COPY_T;







----------------------------------------------------------------------------------


-- 2018-12-11  숙제하기
-- 60page
--분석함수를 사용하지 않고 구현한 앞/뒤 데이터 차이 계산
SELECT MAX(DECODE(NO,1,NAME)) NAME
		,  SEQ 
		,  MIN(DECODE(NO,1,KOR)) KOR
		,  MIN(DECODE(NO,1,ENG)) ENG
		,  MIN(DECODE(NO,1,MAT)) MAT
		,  MIN(DECODE(NO,1,KOR)) + MIN(DECODE(NO,1,ENG)) + MIN(DECODE(NO,1,MAT))  TOT
		,  MIN(DECODE(NO,2,KOR)) + MIN(DECODE(NO,2,ENG)) + MIN(DECODE(NO,2,MAT))  SUB_TOT
		, (MIN(DECODE(NO,1,KOR)) + MIN(DECODE(NO,1,ENG)) + MIN(DECODE(NO,1,MAT)))
		 -  (MIN(DECODE(NO,2,KOR)) + MIN(DECODE(NO,2,ENG)) + MIN(DECODE(NO,2,MAT)))  CHA
		
FROM (
SELECT NAME 
		, NO
		, DECODE(NO,1,SEQ, SEQ +1) SEQ
		, CLASS
		, KOR KOR
		, ENG ENG
		, MAT MAT
		, DECODE(NO, 1, KOR) + DECODE(NO, 1, ENG) + DECODE(NO, 1, MAT) N1
		, DECODE(NO, 2, KOR) + DECODE(NO, 2, ENG) + DECODE(NO, 2, MAT) N2
FROM (
SELECT ROWNUM SEQ, A.*
FROM (
	SELECT NAME
			, CLASS
			, KOR
			, ENG
			, MAT
	FROM EXAM_RSLT  A
	ORDER BY KOR+ENG+MAT DESC , NAME 
) A )
, COPY_T B
WHERE NO <= 2
)
GROUP BY SEQ
HAVING MIN(DECODE(NO,1,KOR)) IS NOT NULL
ORDER BY SEQ
;

----------------------------------------------------------------------------------


SELECT ROWNUM SEQ, NAME
			, CLASS
			, KOR
			, ENG
			, MAT
	FROM EXAM_RSLT  A
	ORDER BY KOR+ENG+MAT DESC , NAME ;


-- 인라인뷰에서 정렬 후 ROWNUM SEQ 로 순서부여 
SELECT ROWNUM SEQ, NAME, CLASS, KOR, ENG, MAT 
FROM (
	SELECT NAME
			, CLASS
			, KOR
			, ENG
			, MAT
	FROM EXAM_RSLT  A
	ORDER BY KOR+ENG+MAT DESC , NAME 
);


SELECT * FROM COPY_T;
SELECT * FROM EXAM_RSLT;

----------------------------------------------------------------------------------
-- 분석함수 사용한 앞/뒤 데이터 차이 계산

SELECT NAME
		, DENSE_RANK() OVER(ORDER BY KOR+ENG+MAT DESC) D_RK
		, CLASS
		, KOR
		, ENG
		, MAT
		, KOR+ENG+MAT TOT
		, KOR+ENG+MAT - LAG(KOR+ENG+MAT) OVER (ORDER BY KOR+ENG+MAT DESC) AS LAG_CHA
FROM EXAM_RSLT;



----------------------------------------------------------------------------------

SELECT * FROM TABS;






----------------------------------------------------------------------------------

-- 분석함수의 이해 (WINDOW 활용)

-- CASE1. ROWS BETWEEN 1 PRECEDING AND CURRENT ROW

SELECT DEPTNO
	   ,	  STUDNO
	   ,	  WEIGHT
	   ,  BIRTHDATE
	   ,  MONTH_TST
	   ,  FIRST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) FSTR_WEIGHT_SUM_NB
	   ,  LAST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) LSTR_WEIGHT_SUM_NB
	   ,  SUM(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS WEIGHT_SUM_NB
FROM STUDENT 
ORDER BY DEPTNO1;


SELECT * FROM STUDENT;


-- CASE2. ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
SELECT  DEPTNO
	, STUDNO
	, WEIGHT
	, BIRTHDATE
	, MONTH_TST
	, FIRST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) FSTR_WEIGHT_SUM_UB
	, LAST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) LSTR_WEIGHT_SUM_UB
	, SUM(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS WEIGHT_SUM_UB
FROM STUDENT
ORDER BY DEPTNO;


-- CASE3. ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
SELECT DEPTNO
	, STUDNO
	, WEIGHT
	, BIRTHDATE
	, MONTH_TST
	, FIRST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FSTR_WEIGHT_SUM_UB
	, LAST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) LSTR_WEIGHT_SUM_UB
	, SUM(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY STUDNO ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS WEIGHT_SUM_UB_FB
FROM STUDENT
ORDER BY DEPTNO;


-- CASE4. RANGE BETWEEN 1 PRECEDING AND 2 FOLLOWING
SELECT DEPTNO
	, STUDNO
	, WEIGHT
	, BIRTHDATE
	, MONTH_TST
	, FIRST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY MONTH_TST RANGE BETWEEN 1 PRECEDING AND 2 FOLLOWING) FSTR_WEIGHT_SUM_UB
	, LAST_VALUE(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY MONTH_TST RANGE BETWEEN 1 PRECEDING AND 2 FOLLOWING) LSTR_WEIGHT_SUM_UB
	, SUM(WEIGHT) OVER(PARTITION BY DEPTNO ORDER BY MONTH_TST RANGE BETWEEN 1 PRECEDING AND 2 FOLLOWING) AS WEIGHT_SUM_UB_FB
FROM STUDENT
ORDER BY DEPTNO
;


-- CASE5. RANGE BETWEEN INTERVAL '2' YEAR PRECEDING AND INTERVAL '3' YEAR FOLLOWING
SELECT DEPTNO
	, STUDNO
	, WEIGHT
	, BITRHDATE
	, MONTH_TST
	, FIRST_VALUE(BIRTHDATE) OVER(PARTITION BY DEPTNO ORDER BY BIRTHDATE RANGE BETWEEN INTERVAL '2' YEAR PRECEDING AND INTERVAL '3' YEAR FOLLOWING) FSTR_WEIGHT_SUM_UB
	, LAST_VALUE(BIRTHDATE) OVER(PARTITION BY DEPTNO ORDER BY BIRTHDATE RANGE BETWEEN INTERVAL '2' YEAR PRECEDING AND INTERVAL '3' YEAR FOLLOWING) LSTR_WEIGHT_SUM_UB
	, SUM(WEIGHT)  OVER(PARTITION BY DEPTNO ORDER BY BIRTHDATE RANGE BETWEEN INTERVAL '2' YEAR PRECEDING AND INTERVAL '3' YEAR FOLLOWING ) WEIGHT_SUM_UB_FB
FROM STUDENT
ORDER BY DEPTNO;




----------------------------------------------------------------------------------



SELECT DEPTNO1
        ,  TO_NUMBER(DEPTNO1||0||SUBSTR(STUDNO,4,1))  AS STUDNO
        , WEIGHT
        , TO_CHAR(BIRTHDAY, 'YYYY-MM-DD')  BIRTHDATE
        , GRADE
        , FIRST_VALUE(WEIGHT) OVER( PARTITION BY DEPTNO1 ORDER BY STUDNO ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) FSTR_WEIGHT_SUM_NB
          , LAST_VALUE(WEIGHT) OVER( PARTITION BY DEPTNO1 ORDER BY STUDNO ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) LSTR_WEIGHT_SUM_NB
          , SUM(WEIGHT) OVER( PARTITION BY DEPTNO1 ORDER BY STUDNO ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS WEIGHT_SUM_NB
FROM STUDENT
ORDER BY DEPTNO1;


SELECT

FROM STUDENT;



