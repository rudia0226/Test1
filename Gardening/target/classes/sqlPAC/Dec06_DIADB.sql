
CREATE TABLE YJH AS
SELECT ROWNUM NO, 'YJH_TBL' NM
FROM DUAL
CONNECT BY LEVEL <= 10
;

CREATE TABLE KBG AS
SELECT ROWNUM NO, 'YJH_TBL' NM
FROM DUAL
CONNECT BY LEVEL <= 10
;

SELECT * FROM KBG;



-- -----------------------------------------------
CREATE TABLE DIA_EXTBL AS
SELECT ROWNUM COL 
	, 'DIA_TBL' NM
FROM DUAL
CONNECT BY LEVEL <= 5;


SELECT * FROM DIA_EXTBL;



CREATE TABLE DIA_SALE_TBL AS
SELECT LPAD(FLOOR(DBMS_RANDOM.VALUE(1,12)),2,'0') SALE_MM
	, FLOOR(DBMS_RANDOM.VALUE(10,50)) SALE_CNT
	, '박루디아' SALE_USER
FROM DUAL
CONNECT BY LEVEL <= 1000
;


SELECT * FROM DIA_SALE_TBL;


CREATE OR REPLACE VIEW V_DIA_SALE_TBL AS
SELECT LPAD(CEIL(DBMS_RANDOM.VALUE(0,12)),2,'0') SALE_MM
	, CEIL(DBMS_RANDOM.VALUE(10,50)) SALE_CNT
	, '박루디아' SALE_USER
FROM DUAL
CONNECT BY LEVEL <= 1000
;


SELECT * FROM V_DIA_SALE_TBL;


CREATE PRAC3 
FROM 
(SELECT * FROM 
;


SELECT * from exam_rslt;
select * from all_tab_columns;




