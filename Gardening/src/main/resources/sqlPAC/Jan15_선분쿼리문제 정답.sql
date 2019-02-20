
DESC V_DIA_HW0003;


SELECT A.EMPNO , NM
            , TRIM(A.POS) POS
            , TRIM(TRA_AREA_CD.AREA_CD)||'( '||TRIM(AREA_NM)||' )' AREA_ND
            ,  TO_CHAR(ST,'YYYYMMDD')||'~'||TO_CHAR(ET,'YYYYMMDD') WDATE
            --,  RAT , PAY_AMT
          --  , NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) EF_D_CNT
           -- , (NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) ) * PAY_AMT * RAT PAY_AMT
            , TO_CHAR(ST, 'd') SUBSTR시작요일번호 --일요일 1 토요일 7
            , TO_CHAR(ET, 'd') 끝요일번호
            , LENGTH(TRANSLATE(RPAD(SUBSTR('1234567',TO_CHAR(ST,'D')),ET-ST+1,'1234567'),' 17',' ')) IL_CNT
FROM
    (        
        SELECT A.EMPNO, POS, AREA_CD 
            , TO_DATE(GREATEST(A.ST_DT, B.ST_DT),'YYYYMMDD')  ST
            , TO_DATE(LEAST(A.ET_DT, B.ET_DT),'YYYYMMDD')  ET
        FROM POS_HIST A, AREA_HIST B 
        WHERE A.EMPNO = B.EMPNO 
            AND B.ST_DT <= A.ET_DT 
            AND B.ET_DT >= A.ST_DT            
    ) A
    , WISE_EMP , TRA_AREA_CD, TRA_AMT_RAT
WHERE WISE_EMP.EMPNO = A.EMPNO 
   AND TRA_AREA_CD.AREA_CD = A.AREA_CD 
  AND TRA_AMT_RAT.POS=A.POS
ORDER BY NM DESC, WDATE
;


