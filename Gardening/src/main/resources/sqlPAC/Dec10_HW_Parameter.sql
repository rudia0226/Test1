
-----------------------------------------------------------
SELECT * FROM ALL_TAB_COLUMNS;

다시 정리
CASE WHEN 에서
1. RNUM 이 RNUM/2보다 크다면 줄어들고 작다면 늘게끔
2. RNUM이 홀수라면 짝수라면

1. CASE WHEN ( RNUM - ROUND((ROWNUM/2),0) ) >= 0 THEN RNUM ELSE ROUND((ROWNUM/2),0) +1 AS RVS_PT 
2. CASE WHEN MOD(ROWNUM,2) = 1 THEN ROUND((ROWNUM/2),0) ELSE (ROUND((ROWNUM/2),0)+1) END AS RVS_PT
 
, CASE WHEN MOD(ROWNUM,2) = 1 THEN ROUND((ROWNUM/2),0) ELSE  ROUND((ROWNUM/2),0) +1  END  AS RVS_PT
		

RVS_PT ; 
MOD(RNUM,2) 일때 나머지가 1인경우, RVS_PT=ROUND((RNUM /2),0)
MOD(RNUM,2) 일때 나머지가 0인경우,  RVS_PT=RNUM / 2


INP_VAL ; 
20의 값을 어떻게 넣어줄 것인가?

CASE WHEN 했을때 3 미만인 수가 나오면 9로 나오게끔 하려면..

;

-----------------------------------------------------------


SELECT * FROM ALL_TAB_COLUMNS;

create view v_dia_hw3 as
SELECT * FROM DUAL
/*
SELECT RNUM SEQ
                        , LPAD('*', RNUM, '*')  T1
                        , LPAD('A', RNUM, 'B') T2
                        , DECODE(SIGN(RNUM-RVS_PT),1,(RVS_PT)+1 - (RNUM-(RVS_PT-1)), RNUM) AS DSEQ
                        , LPAD('*',DECODE(SIGN(RNUM-RVS_PT),1,(RVS_PT)+1 - (RNUM-(RVS_PT-1)), RNUM), '*') DFTST
                        , CASE WHEN RNUM-RVS_PT >= 1 THEN (RVS_PT)+1 -(RNUM-(RVS_PT-1))
                          ELSE RNUM
                          END AS CSEQ
                        , LPAD('*', CASE WHEN RNUM-RVS_PT >= 1 THEN (RVS_PT)+1 -(RNUM-(RVS_PT-1)) ELSE RNUM END, '*') CFTST
                        , 'A' || DECODE(RNUM, 1, NULL, F_GET_ALPA('B', RNUM-1)) T4
                        , :INP_VAL
FROM (SELECT ROWNUM RNUM 
           , CASE WHEN ROWNUM >= ROUND(ROWNUM/2) THEN  :INP_VAL/2 
           		ELSE ROWNUM END AS RVS_PT
             FROM ALL_TAB_COLUMNS
             WHERE ROWNUM < 20  :INP_VAL --20 
             ORDER BY RNUM ASC
         )
*/
-----------------------------------------------------------


SELECT RNUM SEQ
                        , LPAD('*', RNUM, '*')  T1
                        , LPAD('A', RNUM, 'B') T2
                        , DECODE(SIGN(RNUM-RVS_PT),1,(RVS_PT)+1 - (RNUM-(RVS_PT-1)), RNUM) AS DSEQ
                        , LPAD('*',DECODE(SIGN(RNUM-RVS_PT),1,(RVS_PT)+1 - (RNUM-(RVS_PT-1)), RNUM), '*') DFTST
                        , CASE WHEN RNUM-RVS_PT >= 1 THEN (RVS_PT)+1 -(RNUM-(RVS_PT-1))
                          ELSE RNUM
                          END AS CSEQ
                        , LPAD('*', CASE WHEN RNUM-RVS_PT >= 1 THEN (RVS_PT)+1 -(RNUM-(RVS_PT-1)) ELSE RNUM END, '*') CFTST
                        , 'A' || DECODE(RNUM, 1, NULL, F_GET_ALPA('B', RNUM-1)) T4
                        , :INP_VAL
FROM (SELECT ROWNUM RNUM
           , CASE WHEN ROWNUM >= ROUND(ROWNUM/2) THEN :INP_VAL/2 ELSE ROWNUM END AS RVS_PT
             FROM ALL_TAB_COLUMNS
             WHERE ROWNUM <  :INP_VAL --20 
             ORDER BY RNUM ASC
         )
;




