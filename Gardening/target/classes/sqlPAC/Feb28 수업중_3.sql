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
