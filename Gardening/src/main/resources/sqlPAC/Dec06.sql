-- sys �������� �α��� 

-- ����Ȯ��
SELECT * FROM V$VERSION;

--����� ���� ����

-- 12g �� ��� �̰� ���� ���
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 11g �� ��� 
CREATE USER ex_user
IDENTIFIED BY 1234;

--���Ѻο� *����, ���ҽ����
GRANT CONNECT, RESOURCE TO ex_user;

-- ��� ��� ���� �ο�
GRANT DBA TO ex_user;

-- ���̺� ����°� ���� �ο� (��� ���̺� ���� ����)
GRANT CREATE ANY TABLE TO ex_user;

-- ���� ���� 
drop user ex_user cascade;


-------------------------------------------------------------------

-- ����!
CREATE USER dia_user
IDENTIFIED BY 1234;

--���Ѻο� *����, ���ҽ����
GRANT CONNECT, RESOURCE TO dia_user;

-- ��� ��� ���� �ο�
GRANT DBA TO dia_user;

-- ���̺� ����°� ���� �ο� (��� ���̺� ���� ����)
GRANT CREATE ANY TABLE TO dia_user;




-- DBLINK ���� ���
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




-- join �غ��� ������ ������ ������ �ִ� ���� ���̺� ���� 
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



-- 2018-12-06 ����
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

-- 1. score �� �ִ밪�� ���� ����
-- 2. max ���ھ�
	


SELECT  MAX(SUBJECT) KEEP(DENSE_RANK FIRST ORDER BY SCORE DESC) AS SUBJECT FROM STD_SCORE;





