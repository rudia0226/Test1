
-----------------------------------------------------------
SELECT * FROM ALL_TAB_COLUMNS;

�ٽ� ����
CASE WHEN ����
1. RNUM �� RNUM/2���� ũ�ٸ� �پ��� �۴ٸ� �ðԲ�
2. RNUM�� Ȧ����� ¦�����

1. CASE WHEN ( RNUM - ROUND((ROWNUM/2),0) ) >= 0 THEN RNUM ELSE ROUND((ROWNUM/2),0) +1 AS RVS_PT 
2. CASE WHEN MOD(ROWNUM,2) = 1 THEN ROUND((ROWNUM/2),0) ELSE (ROUND((ROWNUM/2),0)+1) END AS RVS_PT
 
, CASE WHEN MOD(ROWNUM,2) = 1 THEN ROUND((ROWNUM/2),0) ELSE  ROUND((ROWNUM/2),0) +1  END  AS RVS_PT
		

RVS_PT ; 
MOD(RNUM,2) �϶� �������� 1�ΰ��, RVS_PT=ROUND((RNUM /2),0)
MOD(RNUM,2) �϶� �������� 0�ΰ��,  RVS_PT=RNUM / 2


INP_VAL ; 
20�� ���� ��� �־��� ���ΰ�?

CASE WHEN ������ 3 �̸��� ���� ������ 9�� �����Բ� �Ϸ���..

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




