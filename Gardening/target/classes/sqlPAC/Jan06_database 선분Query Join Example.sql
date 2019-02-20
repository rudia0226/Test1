
-- 선분조인

SELECT * FROM STD_CALND;
SELECT * FROM CHG_GOODS_M;

SELECT 상품그룹, 기준월
		,  GREATEST(A.시작일자, B.변경시작일자) 시작일자
		,  LEAST(A.종료일자, B.변경종료일자) 종료일자
		,  상품명
FROM STD_CALND A, CHG_GOODS_M B
where 상품명='B00C'
;

SELECT 상품그룹, 기준월
		,  GREATEST(A.시작일자, B.변경시작일자) 시작일자
		,  LEAST(A.종료일자, B.변경종료일자) 종료일자
		, 상품명
FROM STD_CALND A, CHG_GOODS_M B
WHERE B.변경시작일자 <= A.종료일자 
	AND B.변경종료일자 >= A.시작일자
ORDER BY 상품명
;

SELECT 상품그룹, 기준월
		,  GREATEST(A.시작일자, B.변경시작일자) 시작일자
		,  LEAST(A.종료일자, B.변경종료일자) 종료일자, 상품명
FROM STD_CALND A, CHG_GOODS_M B
WHERE B.변경시작일자 <= A.종료일자 
AND B.변경종료일자 >= A.시작일자
and 상품명='B00C'
ORDER BY 상품명
;








