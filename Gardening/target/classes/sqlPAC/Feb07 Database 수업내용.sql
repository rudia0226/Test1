
-- PIVOT / UNPIVOT
;
이사님이 만드신 예제
;

-- 요일별로 많이 팔린 정도 구하기 
-- SUM(DECODE()) GROUP BY 

SELECT YM
		 ,SUM(DECODE(WEEK_ID, '1', SALE_CNT))  SUN
		, SUM(DECODE(WEEK_ID, '2', SALE_CNT))  MON
		, SUM(DECODE(WEEK_ID, '3', SALE_CNT))  TUE
		, SUM(DECODE(WEEK_ID, '4', SALE_CNT))  WED
		, SUM(DECODE(WEEK_ID, '5', SALE_CNT))  THU
		, SUM(DECODE(WEEK_ID, '6', SALE_CNT))  FRI
		, SUM(DECODE(WEEK_ID, '7', SALE_CNT))  SAT
FROM
(
SELECT TO_CHAR(SALE_DATE,'YYYYMM') YM
		, TO_CHAR(SALE_DATE,'D') WEEK_ID
		, SALE_CNT 
FROM
( 
SELECT TO_DATE('20180701','YYYYMMDD')+FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
			, FLOOR(DBMS_RANDOM.VALUE(1,100)) SALE_CNT  
FROM DUAL 
CONNECT BY LEVEL <= 100 
)
)
GROUP BY YM
ORDER BY YM
;


-- PIVOT은 SUM(DECODE) 와 GROUP BY 를 사용한것처럼
-- ROW로 되어있던 것을 컬럼으로 바꾸면서 데이터가 확 줄음 ( 분석할 수 있는 레벨로 바꾸는것임)





-- 위에꺼를 이용해 PIVOT 버젼으로 바꿈 
SELECT * 
FROM
(
		SELECT TO_CHAR(SALE_DATE,'YYYYMM') YM
				--, TO_CHAR(SALE_DATE,'YYYYMMDD') YMD
				, TO_CHAR(SALE_DATE,'D') WEEK_ID
				, SALE_CNT 
		FROM
		( 
		SELECT TO_DATE('20180701','YYYYMMDD')+FLOOR(DBMS_RANDOM.VALUE(1,50)) SALE_DATE
					, FLOOR(DBMS_RANDOM.VALUE(1,100)) SALE_CNT  
		FROM DUAL 
		CONNECT BY LEVEL <= 100 
		)
)
PIVOT (  -- PIVOT 에 들어가는것은 집계함수만 가능 
	SUM(SALE_CNT)  -- SUM의 의미
	, COUNT(SALE_CNT) CNT 
	, MAX(SALE_CNT) MM
	, MIN(SUBSTR(YM,1,4)) D
	FOR WEEK_ID IN (1 SUN,2 MON ,3 TUE ,4 WED ,5 THU ,6 FRI ,7 SAT)  -- DECODE의 의미 
)
-- GROUP BY YM, YMD 로 되어있음 
;



-- UNPIVOT
-- 단위가 같다면 합계에서 합계로 바꾸는 거면 언피봇 사용 가능하지만 합계에서 그냥 데이터들로 바꾸기엔 한계가 있어. (SUM된거를 다시 풀어서 놓을순 없음)
--data가 추가될 때 컬럼이 추가되는건 좋은 설계가 아니야. ROW로 추가되게끔 만드는 것이 수정, 업데이트에 용이

SELECT * 
FROM UP_SAMPLE
;

-- 방법1. 수동으로 짜는 방법 ; 복제를 통한 UNPIVOT 
SELECT YM 
		, NO WEEK_ID
		, DECODE(NO,'1',COL1,'2', COL2, '3', COL3, '4', COL4 , '5', COL5 , '6', COL6, '7', COL7  )  VAL
FROM UP_SAMPLE A ,
	( SELECT ROWNUM NO FROM DUAL 
		CONNECT BY LEVEL <= 7) B 
ORDER BY 1, NO
;

-- 방법2. UNPIVOT 함수 사용 
-- UNPIVOT 사용시 주의사항 ; 컬럼을 값으로 나눌때의 컬럼명을 적어줘야.
SELECT YM
	, DECODE(WEEK_ID, 'COL1' , 1 ,  'COL2' , 2, 'COL3' , 3 , 'COL4' , 4, 'COL5' , 5, 'COL6' , 6, 'COL7' , 7) WID
	, SALE_PER_WID 
FROM UP_SAMPLE
UNPIVOT (
	SALE_PER_WID FOR WEEK_ID IN (COL1,COL2,COL3,COL4,COL5,COL6,COL7)  -- COLUMN값을 수정할 수 없으므로 SELECT 상에서 DECODE로 수정
)
;

SELECT * 
FROM UP_SAMPLE1;



-- 새로운 예제 
-- DATA를 추가할 때 

SELECT * FROM UP_SAMPLE;
SELECT * FROM UP_SAMPLE1;


-- 오전/오후로 나눠서 앞으로 생성되는 데이터를 만들어보자

SELECT AREA_CD, YM, SALE_PER_WID CNT 
FROM UP_SAMPLE1
;

SELECT AREA_CD, YM, SALE_PER_WID CNT 
FROM UP_SAMPLE1

SELECT TO_CHAR(CEIL(DBMS_RANDOM.VALUE(0,9))*10) AREA_CD 
			, TO_DATE(
			
;
-- ROUND 함수를 이용하면 기준 DATE의 오전/오후를 나눠볼 수 있다.

-- COLUMN을 안바꾸고 데이터만 수정해서 바꾸려고 할 때 (협의가 필요, 데이터 보정시 사용)

-- 예제는 이사님이 메일로 주시는걸로 확인.






