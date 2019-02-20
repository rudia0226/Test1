
-- 2018-12-20
-- ���������� 
SELECT * FROM HIR_TST;



--75
-- ������ ���� (�θ� > �ڽ�)
SELECT SYS_CONNECT_BY_PATH(DGT, '/') PATH
	, LPAD(' ', (LEVEL-1)*6 ) || '��'||DGT
	, DGT, PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
;



--76
-- ������ ����(�ڽ� -> �θ�)
SELECT SYS_CONNECT_BY_PATH(DGT, '/') PATH
	, LPAD(' ', (LEVEL-1)*6)||  '��'||DGT
	, DGT, PDGT
FROM HIR_TST
CONNECT BY PRIOR PDGT = DGT
START WITH DGT IN(5,6)
;




-- 78 : ���ѷ��� ���涧 ���� �ߴ°� Ȯ���ϱ� ���� ���̺� ����. 
CREATE TABLE DIA_HIR_TST AS SELECT * FROM HIR_TST ORDER BY 1;

SELECT * FROM DIA_HIR_TST;
INSERT INTO DIA_HIR_TST SELECT 10,11 FROM DUAL;

SELECT LPAD(' ', (LEVEL-1)*6)|| '��'||DGT DGT_TREE4 
		, CONNECT_BY_ROOT DGT
		, DGT
		, PDGT
FROM DIA_HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
;

-- ���ѷ��� �߻��� ������ 1�� ��Ÿ���� CYC
SELECT LPAD(' ', (LEVEL-1)*6)|| '��'||DGT DGT_TREE
		, CONNECT_BY_ROOT DGT
		, DGT
		, PDGT
		, CONNECT_BY_ISCYCLE CYC
FROM DIA_HIR_TST
CONNECT BY NOCYCLE PRIOR DGT = PDGT
START WITH DGT = 1
;

-- ���� ������ �̿��� ��>�� �� �����Ǵ� ������ ��>�� �� �ٲ㺼 �� �ִ�.
SELECT SYS_CONNECT_BY_PATH(DGT,'>>>') PATH
   , LPAD(' ', (LEVEL-1) *6) || '��'||DGT S
   , CONNECT_BY_ROOT DGT SYS_ROOT
   , DGT
   , PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
ORDER SIBLINGS BY DGT DESC;
   


--81 ������ ���� ���� : ���۰� ~ ���ᰪ ������ �հ� ���ϱ�
DESC V_TESTCD;
SELECT LTRIM(MAX(SYS_CONNECT_BY_PATH(NID,'+')),'+')||'='||SUM(NID) STR
FROM (
            SELECT ROWNUM +:ARG_STVAL-1 NID
                     ,ROWNUM +:ARG_STVAL P_NID
            FROM DUAL
            CONNECT BY LEVEL <= :ARG_ETVAL - :ARG_STVAL +1            
           ) 
CONNECT BY PRIOR DECODE(:ARG_DIR,'F',P_NID,NID) = DECODE(:ARG_DIR,'F',NID,P_NID)
START WITH NID = DECODE(:ARG_DIR,'F',:ARG_STVAL ,:ARG_ETVAL)         
;



--75
 SYS_CONNECT_BY_PATH(DGT,'>>*') PATH 
	, LPAD(' ',(LEVEL-1)*10) ||  '��'||DGT DGT_TREE4 
	, DGT, PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT  =1;




-- 77
-- �ϴ� �����ϰ� 2�� ����.
SELECT LPAD(' ', (LEVEL-1)*6)|| '��'||DGT DGT_TREE4 
		, CONNECT_BY_ROOT DGT
		, DGT
		, PDGT
FROM HIR_TST
WHERE DGT <> 2
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
;


-- 2�� ����ִ� ���� ���� ����
SELECT LPAD(' ', (LEVEL-1)*6)|| '��'||DGT DGT_TREE
		, CONNECT_BY_ROOT DGT
		, DGT
		, PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT AND DGT <> 2 
START WITH DGT = 1
;


-- 79 
SELECT LPAD(' ', (LEVEL-1)*6)|| '��'||DGT DGT_TREE
		, CONNECT_BY_ROOT DGT
		, DGT
		, PDGT
FROM HIR_TST
CONNECT BY PRIOR DGT = PDGT
START WITH DGT = 1
;


SELECT LPAD(' ', (LEVEL-1)*6)|| '��'||DGT DGT_TREE
		, CONNECT_BY_ROOT DGT
		, DGT
		, PDGT
		, CONNECT_BY_ISCYCLE CYC
FROM HIR_TST
CONNECT BY NOCYCLE PRIOR DGT = PDGT
START WITH DGT = 1
;









