
SELECT MAX(DECODE(C_DAY, 1, C_DATE)) 일
        , MAX(DECODE(C_DAY, 2, C_DATE)) 월
        , MAX(DECODE(C_DAY, 3, C_DATE)) 화
        , MAX(DECODE(C_DAY, 4, C_DATE)) 수
        , MAX(DECODE(C_DAY, 5, C_DATE)) 목
        , MAX(DECODE(C_DAY, 6, C_DATE)) 금
        , MAX(DECODE(C_DAY, 7, C_DATE)) 토
FROM (SELECT TRUNC(R_DATE + LEVEL -1 , 'D') DDD
               , TO_CHAR(R_DATE + LEVEL -1, 'D') C_DAY
               , LPAD(LEVEL, 2, 0) C_DATE
         FROM (SELECT TO_DATE(:DAY, 'YYYY-MM') R_DATE 
                  FROM DUAL)
         CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(R_DATE), 'DD')
         )
GROUP BY DDD
ORDER BY DDD;


