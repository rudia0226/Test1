
01. PL/SQL��� 
	Ư�����ǿ� ���� �� ó���ϴ� ���ǹ�, 
	�ݺ�ó���� ����ϴ� �ݺ���,
	GOTO�� NULL���� ������ ����� �ִ�.
	
#01 IF��----------------
	<������ 1��>
	IF ���� THEN 
		����ó��;
	END IF;

	<������ 2��>
	IF ���� THEN 
		����ó��1;
	ELSE 
		����ó��2;
	END IF;

	<������ N��>
	IF ����1 THEN 
		����ó��1;
	ELSEIF ����2 THEN 
		����ó��2;
		...
	ELSE 
		����ó��N;
	END IF;
	----------------------
	
IF�� ����

DECLARE
	VN_SAL NUMBER := 0;
	VN_DEPTNO NUMBER := 0;
BEGIN 
	VN_DEPTNO := ROUND(DBMS_RANDOM.VALUE(10,120), -1); 
	
	SELECT SAL 
	INTO VN_SAL
	FROM EMP 
	WHERE DEPTNO = VN_DEPTNO 
		AND ROWNUM = 1;
	
	DBMS_OUTPUT.PUT_LINE(VN_SAL);

IF
	
ELSEIF
ELSEIF
ELSE
END IF;
END;







