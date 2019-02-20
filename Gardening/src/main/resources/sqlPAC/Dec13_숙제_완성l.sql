
SELECT
		NO ��ȣ
, MIN(ST_DT) ���۳�¥
, MAX(ET_DT) ���ᳯ¥
, MIN(NM)  �̸�
FROM 
( 
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(HH) OVER(PARTITION BY NO ORDER BY NO, ST_DT) SS
FROM 
(

		SELECT 	NO  ,NM
						,  ST_DT
						,  ET_DT
						,  CASE WHEN ST_DT
									<= MAX(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING)
								  THEN 0 ELSE 1 END HH
						, MAX(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING)  MA
			FROM ORG_TBL
			ORDER BY NO, ST_DT  
		) 
	)
GROUP BY NO, SS
ORDER BY NO, SS
;

----------------



-- ������ ���� �ƴϴٷ� �ϴϱ� �޶���.. 
-- DECODE ��ſ� CASE WHEN �����. �������� �̿��ؼ� ��ȣ �޶��������� ��¥ ������


SELECT
		NO ��ȣ
, MIN(ST_DT) ���۳�¥   
, MAX(ET_DT) ���ᳯ¥
, MIN(NM)  �̸�
FROM 
( 
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --������..
							-- �ٸ��� 1�̴ϱ�. ��ġ�°� �ѹ�ȣ�� ���ϰ��� 
			, DT
			, MA
			
FROM 
(
		SELECT 	NO  ,  NM
						,  ST_DT
						,  ET_DT
						,  CASE WHEN ST_DT
									<= LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT )
								  THEN 0 ELSE 1 END DT
						, LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ) MA  -- ������ ET_DT�� 
			FROM ORG_TBL
			ORDER BY NO, ST_DT   
		)  
	)
GROUP BY NO , S_DT -- �����հ�� ���ڷ� ���������. �׷��� MIN���� MAX���� ���ؼ� ��¥ ���� �� ����
ORDER BY NO;



-----------













-- ������ ���� �ƴϴٷ� �ϴϱ� �޶���.. 
-- DECODE ��ſ� CASE WHEN �����. �������� �̿��ؼ� ��ȣ �޶��������� ��¥ ������


SELECT
		NO ��ȣ
, MIN(ST_DT) ���۳�¥   
, MAX(ET_DT) ���ᳯ¥
, MIN(NM)  �̸�
FROM 
( 
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(SEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --������..
							-- �ٸ��� 1�̴ϱ�. ��ġ�°� �ѹ�ȣ�� ���ϰ��� 
			, LAG_ET
			, SEQ
			
FROM 
(
		SELECT 	NO  ,  NM
						,  ST_DT
						,  ET_DT
						, LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ) LAG_ET  -- ������ ET_DT�� 
						, DECODE( SIGN(ST_DT - NVL((LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT)),0) ), 1 , 1,  0 ) SEQ  
			FROM ORG_TBL
			ORDER BY NO, ST_DT   
		)  
	)
GROUP BY NO , S_DT -- �����հ�� ���ڷ� ���������. �׷��� MIN���� MAX���� ���ؼ� ��¥ ���� �� ����
ORDER BY NO;




-----------

SELECT * FROM ORG_TBL
;




SELECT
		NO ��ȣ
, MIN(ST_DT) ���۳�¥   
, MAX(ET_DT) ���ᳯ¥
, MIN(NM)  �̸�
FROM 
( ;
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(NEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) P_DT   -- �̰� ���� GROUP BY �� �ȵɵ�.
			, SUM(SEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --�̰� ���� ���������� �ؼ� ���� SELECT ���� GROUP BY �ϸ� 1,2,3 ���� ���̴ϱ� ���Ҽ������Ű��⵵..
							-- �ٸ��� 1�̴ϱ�. ��ġ�°� �ѹ�ȣ�� ���ϰ��� 
			, ������ET_DT
			
			
FROM 
(   ;
		SELECT 	NO  ,  NM
						,  ST_DT
						,  ET_DT
						
						, DECODE( SIGN(ST_DT - NVL((LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT)),0) ), 1 , 1,  0 ) SEQ  
					
						,  CASE WHEN FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
									<= LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT )
								  THEN 0 ELSE 1 END NEQ  -- �̼����� 2�� �ȳ��� 
								  
						, CASE WHEN 
							FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
									<= FIRST_VALUE(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING )
									THEN 0 ELSE 1 END FEQ  -- �̼����� 2�� �ȳ���
									
						, CASE WHEN 
								FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
								<= MAX(ET_DT)  OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING )
								THEN 0  ELSE 1  	END MEQ  -- �̼����� 2�� �ȳ���
														
						
			FROM ORG_TBL   ;
			ORDER BY NO, ST_DT   
		)  ;
	)
GROUP BY NO , S_DT -- �����հ�� ���ڷ� ���������. �׷��� MIN���� MAX���� ���ؼ� ��¥ ���� �� ����
ORDER BY NO;



SELECT NO, NM, ST_DT, ET_DT

						, CASE WHEN 
								FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
								> MIN(ET_DT)  OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN 1 PRECEDING AND UNBOUNDED FOLLOWING )
								THEN 1  ELSE 0  	END PEQ
														

FROM ORG_TBL
;










;










