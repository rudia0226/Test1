


SELECT * FROM EXAM_RSLT;


-- 51������ 
SELECT 
     DECODE(NO, 1, NAME, 2, CLASS,'TOT')  NM
     , SUM(KOR) KOR
     , SUM(ENG) ENG
     , SUM(MAT) MAT 
     , SUM(KOR+ENG+MAT) TOT 
FROM EXAM_RSLT A, 
(SELECT NO FROM COPY_T WHERE ROWNUM <= 3) B
GROUP BY DECODE(NO, 1, NAME, 2, CLASS,'TOT')
ORDER BY MAX(B.NO)
;



-- 52 ������
--1��
SELECT NAME
    , SUM(KOR) KOR
    , SUM(ENG) ENG
    , SUM(MAT) MAT 
    , SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSLT A 
GROUP BY CLASS, NAME
UNION ALL 
SELECT CLASS
	, SUM(KOR) KOR
    , SUM(ENG) ENG
    , SUM(MAT) MAT 
    , SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSLT A 
GROUP BY CLASS
UNION ALL 
SELECT 'TOT'
	, SUM(KOR) KOR
    , SUM(ENG) ENG
    , SUM(MAT) MAT 
    , SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSLT A 
GROUP BY NULL  -- ����� 1�� ��� 
;



--2��
SELECT DECODE(NO, 1, NAME, 2, CLASS, 'TOT') NAME 
		, SUM(KOR) KOR
		, SUM(ENG) ENG
	    , SUM(MAT) MAT 
	    , SUM(KOR+ENG+MAT) TOT
FROM EXAM_RSLT  A,
( 
SELECT NO FROM COPY_T 
WHERE ROWNUM <= 3
) B
GROUP BY DECODE(NO, 1, CLASS)
			, DECODE(NO, 1, NAME, 2, CLASS, 'TOT')
ORDER BY MIN(NO), KOR 
;			


--3�� ; ROLLUP ����  N ���� �÷��� �̿� -> N+1���� GROUP BY ����� ���� 
SELECT DECODE(GROUPING(CLASS)||GROUPING(NAME), '00' , NAME, '01', CLASS, 'TOT') NAME
        , SUM(KOR) KOR
		, SUM(ENG) ENG
	    , SUM(MAT) MAT 
	    , SUM(KOR+ENG+MAT) TOT
		, GROUPING(CLASS)||GROUPING(NAME) GR
FROM EXAM_RSLT
GROUP BY ROLLUP(CLASS, NAME) 
ORDER BY GR, KOR
;


-- 61������ 
-- LAG() ������ �ο� �� ��ȯ (������ �߿� -> ORDER BY �ʿ�)
-- LEAD() ������ �ο� �� ��ȯ (������ �߿� -> ORDER BY �ʿ�)

SELECT NAME 
	    , CLASS
	    , KOR
	    , ENG
	    , MAT 
	    , KOR+ENG+MAT TOT 
	    , LAG(KOR+ENG+MAT) OVER(ORDER BY KOR+ENG+MAT)
	    , LEAD(KOR+ENG+MAT) OVER(ORDER BY KOR+ENG+MAT)
FROM EXAM_RSLT;



-- 62������ ���� 
SELECT NAME 
     , CLASS
     , KOR  , ENG  , MAT 
     , TOT
     , RANK() OVER(ORDER BY TOT DESC) RK   -- �ߺ����� ������ �ش簳����ŭ �ǳʶٰ� ��ȯ
     , DENSE_RANK() OVER(ORDER BY TOT DESC) D_RK  -- �ߺ����� ������� ���������� ��ȯ
     , SUM(TOT) OVER(ORDER BY TOT DESC) ������  -- ORDER BY TOT �ϸ� TOT�����Ŀ� ���� TOT ������ ���� 
     , SUM(TOT) OVER(PARTITION BY CLASS ORDER BY TOT, CLASS) ���д�����
     , RANK() OVER(PARTITION BY CLASS ORDER BY TOT) ���з�ŷ  -- CLASS  ���� �����ؼ� �����ű� 
     , TOT - LAG(TOT) OVER(ORDER BY TOT DESC) AS ������
     , TOT - LEAD(TOT) OVER(ORDER BY TOT DESC) AS ���İ�
FROM 
(
	SELECT NAME
			, CLASS
			, KOR, ENG, MAT
			, KOR+ENG+MAT TOT 
	FROM EXAM_RSLT
)
;



DESC V_TESTCD;
SELECT LTRIM(MAX(SYS_CONNECT_BY_PATH(NID,'+')),'+')||'='||SUM(NID) STR
FROM (
            SELECT ROWNUM +:ARG_STVAL-1 NID
                     ,ROWNUM +:ARG_STVAL P_NID
            FROM DUAL
            CONNECT BY LEVEL <= :ARG_ETVAL - :ARG_STVAL +1            
           ) 
CONNECT BY PRIOR DECODE(:ARG_DIR,'F',P_NID,NID) = DECODE(:ARG_DIR,'F',NID,P_NID) 
START WITH NID = DECODE(:ARG_DIR,'F',:ARG_STVAL ,:ARG_ETVAL)     
;    



SELECT LTRIM(MAX(SYS_CONNECT_BY_PATH(NID, '+')),'+') 
							|| ' = ' || SUM(NID)   RUDI
--SELECT NID, PID
FROM 
(
SELECT ROWNUM + :SRART-1 NID 
		,ROWNUM + :SRART PID 
FROM DUAL 
CONNECT BY LEVEL <= :END - :SRART + 1
)
CONNECT BY PRIOR NID = PID 
START WITH NID  IS NOT NULL
;



SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;


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