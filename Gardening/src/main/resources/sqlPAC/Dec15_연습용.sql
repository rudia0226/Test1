
-- 정규식 함수 응용

SELECT VAR_STR NN,
	REGEXP_SUBSTR(VAR_STR || ',' , '[^\,]+', 1, SEQ) COL 
	-- ,를 기준으로 첫번째부터 잘라서 SEQ번호까지 데이터 짤라서 구함. 
	-- ,가 아닌것들을 나타내주는거라 맨 마지막에도 , 를 붙여주기 위해
	-- || ',' 를 붙여줌
FROM
(
SELECT VAR_STR, SEQ
FROM
(
SELECT 
	'박루디아,피카소,루딩,짱짱맨,12,FEB,LIKEIT' VAR_STR
	, REGEXP_COUNT('박루디아,피카소,루딩,짱짱맨,12,FEB,LIKEIT', ',') +1 CNT
	-- +1 해주는 이유는 , 를 COUNT하는거라 단어 개수를 구하기위해 +1 해줌
	,  REGEXP_COUNT('박루디아,피카소,루딩,짱짱맨,12,FEB,LIKEIT', ',')  C
FROM DUAL
) A ,
(
SELECT ROWNUM SEQ
FROM EMP
WHERE ROWNUM <= 5
 ) );
 
 
 -- 분석함수의 이해(PART 1)
 SELECT * FROM EXAM_RSLT;
 
   
 
 
 
 
 
 
