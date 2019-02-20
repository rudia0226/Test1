
SELECT
		NO 번호
, MIN(ST_DT) 시작날짜
, MAX(ET_DT) 종료날짜
, MIN(NM)  이름
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



-- 범위를 같다 아니다로 하니까 달라짐.. 
-- DECODE 대신에 CASE WHEN 사용함. 누적합을 이용해서 번호 달라질때마다 날짜 추출함


SELECT
		NO 번호
, MIN(ST_DT) 시작날짜   
, MAX(ET_DT) 종료날짜
, MIN(NM)  이름
FROM 
( 
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --누적합..
							-- 다를때 1이니까. 겹치는건 한번호로 묶일거임 
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
						, LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ) MA  -- 이전의 ET_DT합 
			FROM ORG_TBL
			ORDER BY NO, ST_DT   
		)  
	)
GROUP BY NO , S_DT -- 누적합계된 숫자로 정렬해줘야. 그래야 MIN값과 MAX값을 통해서 날짜 구할 수 있음
ORDER BY NO;



-----------













-- 범위를 같다 아니다로 하니까 달라짐.. 
-- DECODE 대신에 CASE WHEN 사용함. 누적합을 이용해서 번호 달라질때마다 날짜 추출함


SELECT
		NO 번호
, MIN(ST_DT) 시작날짜   
, MAX(ET_DT) 종료날짜
, MIN(NM)  이름
FROM 
( 
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(SEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --누적합..
							-- 다를때 1이니까. 겹치는건 한번호로 묶일거임 
			, LAG_ET
			, SEQ
			
FROM 
(
		SELECT 	NO  ,  NM
						,  ST_DT
						,  ET_DT
						, LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ) LAG_ET  -- 이전의 ET_DT합 
						, DECODE( SIGN(ST_DT - NVL((LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT)),0) ), 1 , 1,  0 ) SEQ  
			FROM ORG_TBL
			ORDER BY NO, ST_DT   
		)  
	)
GROUP BY NO , S_DT -- 누적합계된 숫자로 정렬해줘야. 그래야 MIN값과 MAX값을 통해서 날짜 구할 수 있음
ORDER BY NO;




-----------

SELECT * FROM ORG_TBL
;




SELECT
		NO 번호
, MIN(ST_DT) 시작날짜   
, MAX(ET_DT) 종료날짜
, MIN(NM)  이름
FROM 
( ;
SELECT  NO, NM, ST_DT, ET_DT
			, SUM(NEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) P_DT   -- 이걸 쓰면 GROUP BY 가 안될듯.
			, SUM(SEQ) OVER(PARTITION BY NO ORDER BY NO, ST_DT) S_DT   --이걸 쓰면 누적합으로 해서 다음 SELECT 에서 GROUP BY 하면 1,2,3 으로 묶이니까 구할수있을거같기도..
							-- 다를때 1이니까. 겹치는건 한번호로 묶일거임 
			, 이전의ET_DT
			
			
FROM 
(   ;
		SELECT 	NO  ,  NM
						,  ST_DT
						,  ET_DT
						
						, DECODE( SIGN(ST_DT - NVL((LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT)),0) ), 1 , 1,  0 ) SEQ  
					
						,  CASE WHEN FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
									<= LAG(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT )
								  THEN 0 ELSE 1 END NEQ  -- 이순신이 2명 안나옴 
								  
						, CASE WHEN 
							FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
									<= FIRST_VALUE(ET_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING )
									THEN 0 ELSE 1 END FEQ  -- 이순신이 2명 안나옴
									
						, CASE WHEN 
								FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
								<= MAX(ET_DT)  OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING )
								THEN 0  ELSE 1  	END MEQ  -- 이순신이 2명 안나옴
														
						
			FROM ORG_TBL   ;
			ORDER BY NO, ST_DT   
		)  ;
	)
GROUP BY NO , S_DT -- 누적합계된 숫자로 정렬해줘야. 그래야 MIN값과 MAX값을 통해서 날짜 구할 수 있음
ORDER BY NO;



SELECT NO, NM, ST_DT, ET_DT

						, CASE WHEN 
								FIRST_VALUE(ST_DT) OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
								> MIN(ET_DT)  OVER(PARTITION BY NO ORDER BY NO, ST_DT ROWS BETWEEN 1 PRECEDING AND UNBOUNDED FOLLOWING )
								THEN 1  ELSE 0  	END PEQ
														

FROM ORG_TBL
;










;










