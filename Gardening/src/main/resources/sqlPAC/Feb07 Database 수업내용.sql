
-- PIVOT / UNPIVOT
;
�̻���� ����� ����
;

-- ���Ϻ��� ���� �ȸ� ���� ���ϱ� 
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


-- PIVOT�� SUM(DECODE) �� GROUP BY �� ����Ѱ�ó��
-- ROW�� �Ǿ��ִ� ���� �÷����� �ٲٸ鼭 �����Ͱ� Ȯ ���� ( �м��� �� �ִ� ������ �ٲٴ°���)





-- �������� �̿��� PIVOT �������� �ٲ� 
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
PIVOT (  -- PIVOT �� ���°��� �����Լ��� ���� 
	SUM(SALE_CNT)  -- SUM�� �ǹ�
	, COUNT(SALE_CNT) CNT 
	, MAX(SALE_CNT) MM
	, MIN(SUBSTR(YM,1,4)) D
	FOR WEEK_ID IN (1 SUN,2 MON ,3 TUE ,4 WED ,5 THU ,6 FRI ,7 SAT)  -- DECODE�� �ǹ� 
)
-- GROUP BY YM, YMD �� �Ǿ����� 
;



-- UNPIVOT
-- ������ ���ٸ� �հ迡�� �հ�� �ٲٴ� �Ÿ� ���Ǻ� ��� ���������� �հ迡�� �׳� �����͵�� �ٲٱ⿣ �Ѱ谡 �־�. (SUM�ȰŸ� �ٽ� Ǯ� ������ ����)
--data�� �߰��� �� �÷��� �߰��Ǵ°� ���� ���谡 �ƴϾ�. ROW�� �߰��ǰԲ� ����� ���� ����, ������Ʈ�� ����

SELECT * 
FROM UP_SAMPLE
;

-- ���1. �������� ¥�� ��� ; ������ ���� UNPIVOT 
SELECT YM 
		, NO WEEK_ID
		, DECODE(NO,'1',COL1,'2', COL2, '3', COL3, '4', COL4 , '5', COL5 , '6', COL6, '7', COL7  )  VAL
FROM UP_SAMPLE A ,
	( SELECT ROWNUM NO FROM DUAL 
		CONNECT BY LEVEL <= 7) B 
ORDER BY 1, NO
;

-- ���2. UNPIVOT �Լ� ��� 
-- UNPIVOT ���� ���ǻ��� ; �÷��� ������ �������� �÷����� �������.
SELECT YM
	, DECODE(WEEK_ID, 'COL1' , 1 ,  'COL2' , 2, 'COL3' , 3 , 'COL4' , 4, 'COL5' , 5, 'COL6' , 6, 'COL7' , 7) WID
	, SALE_PER_WID 
FROM UP_SAMPLE
UNPIVOT (
	SALE_PER_WID FOR WEEK_ID IN (COL1,COL2,COL3,COL4,COL5,COL6,COL7)  -- COLUMN���� ������ �� �����Ƿ� SELECT �󿡼� DECODE�� ����
)
;

SELECT * 
FROM UP_SAMPLE1;



-- ���ο� ���� 
-- DATA�� �߰��� �� 

SELECT * FROM UP_SAMPLE;
SELECT * FROM UP_SAMPLE1;


-- ����/���ķ� ������ ������ �����Ǵ� �����͸� ������

SELECT AREA_CD, YM, SALE_PER_WID CNT 
FROM UP_SAMPLE1
;

SELECT AREA_CD, YM, SALE_PER_WID CNT 
FROM UP_SAMPLE1

SELECT TO_CHAR(CEIL(DBMS_RANDOM.VALUE(0,9))*10) AREA_CD 
			, TO_DATE(
			
;
-- ROUND �Լ��� �̿��ϸ� ���� DATE�� ����/���ĸ� ������ �� �ִ�.

-- COLUMN�� �ȹٲٰ� �����͸� �����ؼ� �ٲٷ��� �� �� (���ǰ� �ʿ�, ������ ������ ���)

-- ������ �̻���� ���Ϸ� �ֽô°ɷ� Ȯ��.






