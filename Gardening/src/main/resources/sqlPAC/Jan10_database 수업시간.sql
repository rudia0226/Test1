SELECT *
FROM EXAM_RSLT  A,
         (SELECT MOD(ROWNUM,2)+1 CLASS
FROM DUAL
CONNECT BY LEVEL <=4 ) B
WHERE A.GRADE = B.CLASS
;

 
 
 
 
 
 
 SELECT *
FROM EXAM_RSLT  A
WHERE GRADE  =  ( 
                     SELECT  (ROWNUM-ROWNUM)+2
                   FROM DUAL
                   CONNECT BY LEVEL <=2                    
);
                   
 ;
                   -- 단일 상수를 서브쿼리에 넣으면 오류 안뜨고 실행가능
                    SELECT  2
                   FROM DUAL
                   CONNECT BY LEVEL <=2  ;   
                   
                   -- ROWNUM 과 같이 레벨에 따라 값이 들어가는 것에는 ROW 2개 나올때 오류 뜸 (위에서 단일행 연산자를 사용했으니까 오류 뜸 )
                   SELECT  (ROWNUM-ROWNUM)+2
                   FROM DUAL
                   CONNECT BY LEVEL <=2       ;
                   

SELECT   2
FROM DUAL
CONNECT BY LEVEL <=2  
;               
                   
                   

-- INDEX 를 CREATE 해서 자동으로 찾아갈 수 있도록 
-- 인덱스 생성시 옵티마이저가 자동으로 확인
-- 여기서의 INDEX 는 AREA_CD 별로 묶어서 찾기 위해 사용 
CREATE INDEX IDX_SALE_TBL ON SALE_TBL 
(AREA_CD);

 
SELECT COUNT(*) 
FROM SALE_TBL;

-- 수업
SELECT * 
FROM CD_TBL A 
WHERE EXISTS (SELECT 'X' -- ROW 가 있나 없나를 따지는것 ; EXISTS  
					FROM SALE_TBL B 
					WHERE A.CD_ID = B.AREA_CD)
AND LENGTH(CD_ID) = 2;








   
