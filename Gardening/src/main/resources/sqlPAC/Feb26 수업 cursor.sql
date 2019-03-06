-- Feb26 

DB������ �ִ� �����͸� � �ڷᱸ���� �� ���α׷����� (PLSQL)  ������ �������� 
	Ŀ��
	���ڵ�
	�÷���

Ŀ��	
SQL������ ó�� ����� ��� �ִ� ���� (PRIVATE SQL�̶�� �޸𸮿���)
	SQL �� SELECT �ϸ�, �� ����� PRIVATE SQL�� ��
�� ����� ����Ű�� �����Ͱ� Ŀ���̴�.

������ Ŀ��
	����ڰ� �������� �ʾ����� ���������� �����
	UPDATE, DELETE �Ҷ��� Ŀ�� �����ؾ�.
	��� SQL ó���� �� Ŀ�� �����ؾ�.
	���������δ� 
		���� ; ����OPEN ��ġFETCH �ݱ�CLOSE 3�ܰ�� ����ȴ�
		�ڵ����� �������ִ� ����
		�������� ����ϴ� ����
����� Ŀ�� 
	Ŀ���� ������ ���
	
	
Ŀ���� �Ӽ� 
	%ROWCOUNT		Ŀ���� �Ӽ�
	SQL%ROWCOUNT Ŀ���� ���� ������ �� �׳� �͸����� SQL�̶� ���� �� ����� Ŀ���� �Ӽ��� ��Ÿ�����ϴ� ��
	
TBL ���� 
EXAM_RSLT_P

(������ ���߿� �̻���� �ֽô°� ����) 

�� ������ Ŀ�� �Ӽ� 
SQL%FOUND 				; TRUE/FAULSE �̱� ������ DBMS_OUTPUT.PUT_LINE ���� ����� �� ����
SQL%NOTFOUND		; TRUE/FAULSE �̱� ������ DBMS_OUTPUT.PUT_LINE ���� ����� �� ����
SQL%ROWCOUNT		; ����� ����� ���� ���� ��Ÿ�� 
SQL%ISOPEN 

�� ����� Ŀ�� 
1. Ŀ�� ����
2. Ŀ�� ����
3. ��ġ �ܰ迡�� Ŀ�� ��� (LOOP ����) 
		Ŀ����%NOTFOUND  �� LOOP�� ������ �������� EXIT WHEN �� �־��� 
		EXIT WHEN Ŀ����%NOTFOUND 
		
;
���� ) -- �̻���� �ֽô°� ����  �����Ŀ��  
;

DECLARE
	VEXAM_REC EXAM_RSLT%ROWTYPE;
	VS_GRADE EXAM_RSLT.GRADE%TYPE := 2;
	
	-- Ŀ�� ����, �Ű������� �μ��ڵ带 �޴´�.
	CURSOR CUR_EXAM_DATA IS
	SELECT * 
	FROM EXAM_RSLT
	WHERE GRADE = VS_GRADE;
BEGIN
	-- Ŀ�� ����
	OPEN CUR_EXAM_DATA ;
	
	-- �ݺ����� ���� Ŀ�� ��ġ�۾�
	LOOP
		-- Ŀ�� ����� ���� �ο츦 ��ġ��(������� ������ �Ҵ�)
		FETCH CUR_EXAM_DATA INTO VEXAM_REC;
		-- ��ġ�� ���� �ο찡 �� ������ LOOP Ż��
		EXIT WHEN CUR_EXAM_DATA%NOTFOUND ;
		--������� ���
		DBMS_OUTPUT.PUT_LINE(VEXAM_REC.NAME || ' | '|| VEXAM_REC.CLASS || ' | '|| VEXAM_REC.GRADE || ' | ' || TO_CHAR(VEXAM_REC.KOR + VEXAM_REC.ENG + VEXAM_REC.MAT) || ' | ' );
	END LOOP;
	-- �ݺ��� ���� �� Ŀ�� �ݱ�
	CLOSE CUR_EXAM_DATA ;
END;





-- �̰� �ٽ� ������ ����ȵ�





SELECT * 
FROM EXAM_RSLT;


SELECT * 
FROM CD_TBL;

DESC SALE_TBL;



SELECT MAX(CD_NM) �̸�, SUM(SALE_CNT) �Ǹŷ�
FROM SALE_TBL A , CD_TBL B
WHERE AREA_CD = 20
	AND A.PROD_ID = B.CD_ID
GROUP BY PROD_ID;


SELECT MAX(AREA_CD) COL1, MAX(REGION_AREA) COL2,  MAX(CD_NM) COL3 , SUM(SALE_CNT) COL4
	FROM SALE_TBL A , CD_TBL B
	WHERE AREA_CD = 20
	AND A.PROD_ID = B.CD_ID
	GROUP BY PROD_ID;


ROWTYPE ���� SALE_TBL �̶� CD_TBL ����� �� 




���� 
1. SQL�� �� ���ε� ������ 
CREATE OR REPLACE ���ν����� ������ �޾Ƽ� 

�� SQL��  VARCHAR2 �� AVC��� ������ �ְ� 
AVC�� EXECUTE IMMEDIATE AVC �� �����ָ� ��  


CDA = 'SELECT ~~~ '; 
CDA := REPLACE(CDA, ':ARG_CNT', ARG_CNT) ;
CDA := REPLACE(CDA, ':ARG_CNT', ARG_CNT) ;


EXECUTE IMMEDIATE CDA;


�̷��� �ؼ� 




DIA_SAMPLE




DECLARE 
	V_SL_DATA NUMBER := 0;
	V_CD_DATA VARCHAR2(1000);
	V_AREA_CD SALE_TBL.AREA_CD%TYPE := 20;
	
	-- Ŀ�� ����, �Ű������� �μ��ڵ带 �޴´�.
	CURSOR CUR_DIA_DATA IS
	SELECT MAX(CD_NM) COL1 , SUM(SALE_CNT) COL2
	FROM SALE_TBL A , CD_TBL B
	WHERE AREA_CD = V_AREA_CD
	AND A.PROD_ID = B.CD_ID
	GROUP BY PROD_ID;
BEGIN
-- Ŀ�� ����
	OPEN CUR_DIA_DATA;
	-- �ݺ����� ���� Ŀ�� ��ġ�۾�
	LOOP
		-- Ŀ�� ����� ���� �ο츦 ��ġ��(������� ������ �Ҵ�)
		FETCH CUR_DIA_DATA INTO  V_CD_DATA,V_SL_DATA
		-- ��ġ�� ���� �ο찡 �� ������ LOOP Ż��
		EXIT WHEN CUR_DIA_DATA%NOTFOUND ;
		--������� ���
		DBMS_OUTPUT.PUT_LINE( '�Ǹ� ���� : ' || V_CD_DATA || ', �Ǹŷ�(�Ѿ�) : '  || V_SL_DATA);
	END LOOP;
	-- �ݺ��� ���� �� Ŀ�� �ݱ�
	CLOSE CUR_DIA_DATA ;
END;






DECLARE 
	V_ROW_SALECNT SALE_TBL%ROWTYPE;
	V_AREA_CD SALE_TBL.AREA_CD%TYPE := 20;
	
	-- Ŀ�� ����, �Ű������� ������ȣ�� �޴´�.
	CURSOR CUR_DIA_DATA IS
	SELECT MAX(AREA_CD) COL1, MAX(REGION_AREA) COL2,  MAX(CD_NM) COL3 , SUM(SALE_CNT) COL4
	FROM SALE_TBL A , CD_TBL B
	WHERE AREA_CD = V_AREA_CD
	AND A.PROD_ID = B.CD_ID
	GROUP BY PROD_ID;
	
BEGIN
-- Ŀ�� ����
	OPEN CUR_DIA_DATA;
	-- �ݺ����� ���� Ŀ�� ��ġ�۾�
	LOOP
		-- Ŀ�� ����� ���� �ο츦 ��ġ��(������� ������ �Ҵ�)
		FETCH CUR_DIA_DATA INTO  V_ROW_SALECNT
		-- ��ġ�� ���� �ο찡 �� ������ LOOP Ż��
		EXIT WHEN CUR_DIA_DATA%NOTFOUND ;
		--������� ���
		DBMS_OUTPUT.PUT_LINE( '�Ǹ� ���� : ' || V_ROW_SALECNT.COL3 || ', �Ǹŷ�(�Ѿ�) : '  || V_ROW_SALECNT.COL4);
	END LOOP;
	-- �ݺ��� ���� �� Ŀ�� �ݱ�
	CLOSE CUR_DIA_DATA ;
END;








	
	



