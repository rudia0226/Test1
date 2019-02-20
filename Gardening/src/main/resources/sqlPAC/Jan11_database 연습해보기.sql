


SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;
SELECT * FROM SALE_TBL;
SELECT * FROM CD_TBL;


SELECT A.NAME ÇÐ»ýÀÌ¸§
			, GRADE || 'ÇÐ³â'   ÇÐ³â
			, TO_CHAR(BIRTHDAY, 'MM') || '¿ù'  || ' ' ||  TO_CHAR(BIRTHDAY, 'DD') || 'ÀÏ'  || ' ' || TO_CHAR(BIRTHDAY,'YYYY') || '³â' »ýÀÏ
			, B.NAME || ' (' || B.POSITION || ')' ´ã´ç±³¼ö
FROM STUDENT A, PROFESSOR B
; 


SELECT * FROM SALE_TBL;


-- UNPIVOT »ç¿ë
SELECT * 
FROM
(
	SELECT '°úÇÐ' SUBJECT , 100 ¿µÈñ, 20 Ã¶¼ö, 50 ¹ÎÈñ, 90 µ¿Ã¶, 80 ¹Î¼ö FROM DUAL UNION ALL 
	SELECT '¿µ¾î' SUBJECT, 39 ¿µÈñ , 90 Ã¶¼ö, 100 ¹ÎÈñ, 90 µ¿Ã¶, 100 ¹Î¼ö FROM DUAL 
)
UNPIVOT 
(
	SCORE FOR NAME IN (¿µÈñ , Ã¶¼ö, ¹ÎÈñ, µ¿Ã¶, ¹Î¼ö)
)
;



























