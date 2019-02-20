-- 선분활용 QUIZ
SELECT * FROM WISE_EMP;
SELECT * FROM POS_HIST;
SELECT * FROM TRA_AMT_RAT;
SELECT * FROM AREA_HIST;
SELECT * FROM TRA_AREA_CD;

SELECT * FROM EMP;

;
-- 분석용 


DESC V_DIA_001;

CREATE VIEW V_DIA_001 AS
SELECT * FROM DUAL 
/*
SELECT A.EMPNO , NM
			, TRIM(A.POS) POS
			, TRIM(TRA_AREA_CD.AREA_CD)||'( '||TRIM(AREA_NM)||' )' AREA_ND
			,  ST||'~'||ET WDATE
			--,  RAT , PAY_AMT
			, NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) EF_D_CNT
			, (NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) ) * PAY_AMT * RAT PAY_AMT
			, TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd') SUBSTR시작요일번호 --일요일 1 토요일 7
			, TO_CHAR(TO_DATE(ET,'YYYYMMDD'), 'd') 끝요일번호
			, SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd'))  SUBSTR_ST   -- '~m^O^m~' 문자열에서 n(시작요일을번호로 바꾼거) 자리수부터 나타냄
			, TO_DATE(ET) - TO_DATE(ST) + 1 날짜수  -- 시작날짜부터 종료날짜까지의 일수 
			, RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~')  RPAD_ST --RPAD  시작날짜로 추출한 '~m^O^m~' 에서 나타낸 문자열 부터   (종료날짜-시작날짜+1) 번호까지 '~m^O^m~' 문자열로 채우기 
			, REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~') REPLACE_WEEKEND -- 주말을 나타내는 '~'를 제거  => 주중 요일수만 나옴
			, LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')) 길이 -- 문자들 개수
			, NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) -- 문자개수 NULL 이면 0으로 
FROM
	(	
		SELECT A.EMPNO, POS, AREA_CD 
			, TRIM(GREATEST(A.ST_DT, B.ST_DT))  ST
			, TRIM(LEAST(A.ET_DT, B.ET_DT))  ET
		FROM POS_HIST A, AREA_HIST B 
		WHERE A.EMPNO = B.EMPNO 
			AND B.ST_DT <= A.ET_DT 
			AND B.ET_DT >= A.ST_DT
	) A
	, WISE_EMP , TRA_AREA_CD, TRA_AMT_RAT
WHERE WISE_EMP.EMPNO = A.EMPNO AND TRA_AREA_CD.AREA_CD = A.AREA_CD AND TRA_AMT_RAT.POS=A.POS
ORDER BY NM DESC, WDATE
*/
;



DESC V_DIA_001;

DESC V_DIA_HW0003;


SELECT A.EMPNO , NM
			, TRIM(A.POS) POS
			, TRIM(TRA_AREA_CD.AREA_CD)||'( '||TRIM(AREA_NM)||' )' AREA_ND
			,  TO_CHAR(ST, 'YYYYMMDD')||'~'||TO_CHAR(ET,'YYYYMMDD') WDATE
			--,  RAT , PAY_AMT
			, TRANSLATE(RPAD(SUBSTR('1234567', TO_cHAR(ST, 'D')), ET-ST-1, '1234567') ' 17', ' ') 
FROM
	(	
	SELECT A.EMPNO, POS, AREA_CD 
			, TO_DATE(GREATEST(A.ST_DT, B.ST_DT), 'YYYYMMDD')  ST
			, TO_DATE(LEAST(A.ET_DT, B.ET_DT), 'YYYYMMDD')   ET
		FROM POS_HIST A, AREA_HIST B 
		WHERE A.EMPNO = B.EMPNO 
			AND B.ST_DT <= A.ET_DT 
			AND B.ET_DT >= A.ST_DT
	) A
	, WISE_EMP , TRA_AREA_CD, TRA_AMT_RAT
WHERE WISE_EMP.EMPNO = A.EMPNO AND TRA_AREA_CD.AREA_CD = A.AREA_CD AND TRA_AMT_RAT.POS=A.POS
ORDER BY NM DESC, WDATE
;


SELECT RPAD('RUDIA', 10, '#')  
, LPAD('RUDIA', 10, '$')
FROM DUAL;






SELECT A.EMPNO , NM
			, TRIM(A.POS) POS
			, TRIM(TRA_AREA_CD.AREA_CD)||'( '||TRIM(AREA_NM)||' )' AREA_ND
			,  ST||'~'||ET WDATE
			--,  RAT , PAY_AMT
			, NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) EF_D_CNT
			, (NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) ) * PAY_AMT * RAT PAY_AMT
FROM
	(	
		SELECT A.EMPNO, POS, AREA_CD 
			, TRIM(GREATEST(A.ST_DT, B.ST_DT))  ST
			, TRIM(LEAST(A.ET_DT, B.ET_DT))  ET
		FROM POS_HIST A, AREA_HIST B 
		WHERE A.EMPNO = B.EMPNO 
			AND B.ST_DT <= A.ET_DT 
			AND B.ET_DT >= A.ST_DT
	) A
	, WISE_EMP , TRA_AREA_CD, TRA_AMT_RAT
WHERE WISE_EMP.EMPNO = A.EMPNO AND TRA_AREA_CD.AREA_CD = A.AREA_CD AND TRA_AMT_RAT.POS=A.POS
ORDER BY NM DESC, WDATE
;












SELECT A.EMPNO , NM
			, TRIM(A.POS) POS
			, TRIM(TRA_AREA_CD.AREA_CD)||'( '||TRIM(AREA_NM)||' )' AREA_ND
			,  ST||'~'||ET WDATE
			,  RAT , PAY_AMT
			, TO_DATE(ET)- TO_DATE(ST) +1 전체일		
			, NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0) EF_D_CNT
		--	, WEEKDAYS(TO_DATE(ST), TO_DATE(ET)) 주말제외
		--	, GREATEST(NEXT_DAY(TO_DATE(ST), '월') - TO_DATE(ST) - 3, 0) + ((NEXT_DAY(TO_DATE(ET), '월') - NEXT_DAY(TO_DATE(ST), '월'))/7)*5
    	--			     - GREATEST(NEXT_DAY(TO_DATE(ET), '월') - TO_DATE(ET) - 3, 0) working_days
        --	, (TO_DATE(ET)-TO_DATE(ST)+1) - (ROUND((TO_DATE(ET)-TO_DATE(ST)+1)/7)*2)  DDD
        	, (TO_DATE(ET)- TO_DATE(ST))
        		- (NVL(LENGTH(REPLACE(RPAD(SUBSTR('~m^O^m~', TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd')), TO_DATE(ET) - TO_DATE(ST) + 1, '~m^O^m~'), '~')), 0)) 차이
  
        	, DECODE( MOD(TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd'),7) , 1
        			, DECODE( SIGN((TO_DATE(ET)- TO_DATE(ST) +1) -7) , 1, TRUNC( ( TO_DATE(ET)- TO_DATE(ST) +1) /7)*2, -1, 1) 
        			,  DECODE( SIGN((TO_DATE(ET)- TO_DATE(ST) +1) -7) , 1, TRUNC( ( TO_DATE(ET)- TO_DATE(ST) +1)/7)*2, -1, 1))
        			 DD
        	, TO_CHAR(TO_DATE(ST,'YYYYMMDD'), 'd') 시작요일번호 --일요일 1 토요일 7
			, TO_CHAR(TO_DATE(ET,'YYYYMMDD'), 'd') 끝요일번호
FROM
	(	
		SELECT A.EMPNO, POS, AREA_CD 
			, TRIM(GREATEST(A.ST_DT, B.ST_DT))  ST
			, TRIM(LEAST(A.ET_DT, B.ET_DT))  ET
		FROM POS_HIST A, AREA_HIST B 
		WHERE A.EMPNO = B.EMPNO 
			AND B.ST_DT <= A.ET_DT 
			AND B.ET_DT >= A.ST_DT
	) A
	, WISE_EMP , TRA_AREA_CD, TRA_AMT_RAT
WHERE WISE_EMP.EMPNO = A.EMPNO AND TRA_AREA_CD.AREA_CD = A.AREA_CD AND TRA_AMT_RAT.POS=A.POS
ORDER BY NM DESC, WDATE
;


SELECT 
	TRUNC(11.543)
FROM DUAL;





create or replace function weekdays (dt1 date, dt2 date) return number is
    weekday_count number;
    beg_dt date := least(dt1,dt2);
    end_dt date := greatest(dt1,dt2);
    frags number;
begin
    if trunc(end_dt) = trunc(beg_dt) then
        if to_char(end_dt,'DY') in ('SAT','SUN') then return 0;
        else return end_dt-beg_dt;
        end if;
    else
        if to_char(beg_dt,'DY') in ('SAT','SUN') then frags := 0;
        else frags := (trunc(beg_dt)+1) - beg_dt;
        end if;
        if to_char(end_dt,'DY') in ('SAT','SUN') then null;
        else frags := frags + (end_dt - trunc(end_dt));
        end if;
        select frags+count(*) into weekday_count
          from (select rownum rn from all_tab_columns
                 where rownum <= ((end_dt-beg_dt)+10))
         where trunc(beg_dt)+rn <= trunc(trunc(end_dt)-(1/24/60/60))
           and to_char(trunc(beg_dt)+rn,'DY') not in ('SAT','SUN');
        return weekday_count;
    end if;
end;


ROLLBACK;





SELECT EMPNO
		, NM
		, POS
		, TRIM(ST_DT) || '~' || TRIM(ET_DT)   날짜
		, PAY_AMT
	FROM 
		(
		SELECT *
			FROM
			(
			SELECT P.EMPNO 
				, NM	
				, POS
				, GREATEST(W.ST_DT, P.ST_DT)  ST_DT
				, LEAST(W.ET_DT, P.ST_DT)  ET_DT
				, AREA_CD
			
				FROM 
				(
				SELECT A.EMPNO EMPNO
						, NM
						, POS
						, DEPT 
						, ST_DT
						, ET_DT
				FROM WISE_EMP A , POS_HIST B 
				WHERE A.EMPNO = B.EMPNO
				) P ,
				AREA_HIST W
				WHERE W.ST_DT <= P.ET_DT  AND W.ET_DT >= P.ST_DT
			) E,  TRA_AREA_CD T
		WHERE E.AREA_CD = T.AREA_CD
		ORDER BY ST_DT
		)
;







