-- sys 계정으로 로그인 

-- 버젼확인
SELECT * FROM V$VERSION;

--사용자 계정 생성

-- 12g 인 경우 이걸 먼저 사용
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 11g 인 경우 
CREATE USER ex_user
IDENTIFIED BY 1234;

--권한부여 *접속, 리소스사용
GRANT CONNECT, RESOURCE TO ex_user;

-- 디비 사용 권한 부여
GRANT DBA TO ex_user;

-- 테이블 만드는거 권한 부여 (어떠한 테이블도 생성 가능)
GRANT CREATE ANY TABLE TO ex_user;

-- 계정 삭제 
drop user ex_user cascade;


-------------------------------------------------------------------

-- 실전!
CREATE USER dia_user
IDENTIFIED BY 1234;

--권한부여 *접속, 리소스사용
GRANT CONNECT, RESOURCE TO dia_user;

-- 디비 사용 권한 부여
GRANT DBA TO dia_user;

-- 테이블 만드는거 권한 부여 (어떠한 테이블도 생성 가능)
GRANT CREATE ANY TABLE TO dia_user;




-- DBLINK 설정 명령
CREATE PUBLIC DATABASE LINK YJHDB_LINK
CONNECT TO yjh_user
IDENTIFIED BY "1234"
USING 'YJHDB'
;

CREATE PUBLIC DATABASE LINK KBGDB_LINK
CONNECT TO kbg_user
IDENTIFIED BY "1234"
USING 'KBGDB'
;

CREATE PUBLIC DATABASE LINK WWSDB_LINK
CONNECT TO wws_user
IDENTIFIED BY "1234"
USING 'wisedb'
;




-- join 해보기 내꺼랑 지현이 계정에 있는 각각 테이블 조인 
SELECT * 
FROM RURU@YJHDB Y
		, RURUDIA@KBGDB K
WHERE Y.NO = K.NO

;


CREATE PUBLIC DATABASE LINK WISEDB1
CONNECT TO wise_user
IDENTIFIED BY "1234"
USING 'wisedb'
;

select * from all_tab_columns@WISEDB1;

CREATE TABLE dia_user.exam_rslt as 
SELECT * from exam_rslt@WISEDB1;


create table all_tab_columns as 
select * from all_tab_columns@WISEDB1;

select * from ALL_TAB_COLUMNS;

create table std_score as 
select * from std_score@WISEDB1;



-- 2018-12-06 숙제
select * from std_score;

WITH B2 AS (SELECT NM 
						, MAX(SCORE) AS SCORE 
				   FROM std_score 
				   GROUP BY NM
                   ORDER BY NM
                  )
SELECT B2.NM, SUBJECT, B2.SCORE
FROM B2, std_score
WHERE B2.SCORE = std_score.SCORE
AND B2.NM = std_score.NM
ORDER BY B2.NM;


create view v_dia_hw1 as 
SELECT NM
		, MAX(SUBJECT) KEEP(DENSE_RANK FIRST ORDER BY SCORE DESC)
		AS SUBJECT
		, MAX(SCORE) AS SCORE
FROM STD_SCORE
GROUP BY NM
ORDER BY NM;

-- 1. score 가 최대값인 것의 과목
-- 2. max 스코어
	


SELECT  MAX(SUBJECT) KEEP(DENSE_RANK FIRST ORDER BY SCORE DESC) AS SUBJECT FROM STD_SCORE;





