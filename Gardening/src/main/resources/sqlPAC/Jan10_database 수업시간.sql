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
                   -- ���� ����� ���������� ������ ���� �ȶ߰� ���డ��
                    SELECT  2
                   FROM DUAL
                   CONNECT BY LEVEL <=2  ;   
                   
                   -- ROWNUM �� ���� ������ ���� ���� ���� �Ϳ��� ROW 2�� ���ö� ���� �� (������ ������ �����ڸ� ��������ϱ� ���� �� )
                   SELECT  (ROWNUM-ROWNUM)+2
                   FROM DUAL
                   CONNECT BY LEVEL <=2       ;
                   

SELECT   2
FROM DUAL
CONNECT BY LEVEL <=2  
;               
                   
                   

-- INDEX �� CREATE �ؼ� �ڵ����� ã�ư� �� �ֵ��� 
-- �ε��� ������ ��Ƽ�������� �ڵ����� Ȯ��
-- ���⼭�� INDEX �� AREA_CD ���� ��� ã�� ���� ��� 
CREATE INDEX IDX_SALE_TBL ON SALE_TBL 
(AREA_CD);

 
SELECT COUNT(*) 
FROM SALE_TBL;

-- ����
SELECT * 
FROM CD_TBL A 
WHERE EXISTS (SELECT 'X' -- ROW �� �ֳ� ������ �����°� ; EXISTS  
					FROM SALE_TBL B 
					WHERE A.CD_ID = B.AREA_CD)
AND LENGTH(CD_ID) = 2;








   
