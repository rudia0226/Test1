
SELECT MAX(DECODE(C_DAY, 1, C_DATE)) ��
        , MAX(DECODE(C_DAY, 2, C_DATE)) ��
        , MAX(DECODE(C_DAY, 3, C_DATE)) ȭ
        , MAX(DECODE(C_DAY, 4, C_DATE)) ��
        , MAX(DECODE(C_DAY, 5, C_DATE)) ��
        , MAX(DECODE(C_DAY, 6, C_DATE)) ��
        , MAX(DECODE(C_DAY, 7, C_DATE)) ��
FROM (SELECT TRUNC(R_DATE + LEVEL -1 , 'D') DDD
               , TO_CHAR(R_DATE + LEVEL -1, 'D') C_DAY
               , LPAD(LEVEL, 2, 0) C_DATE
         FROM (SELECT TO_DATE(:DAY, 'YYYY-MM') R_DATE 
                  FROM DUAL)
         CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(R_DATE), 'DD')
         )
GROUP BY DDD
ORDER BY DDD;


