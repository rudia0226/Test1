# LOOP��
LOOP 
	ó����;
	EXIT [WHEN ����];
END LOOP;

-- ���� 1
DECLARE 
	VN_BASE_NUM NUMBER := 3;
	VN_CNT NUMBER := 1;
BEGIN 
	LOOP 
		DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM || '*' || VN_CNT || '= ' || VN_BASE_NUM * VN_CNT ); 
		VN_CNT := VN_CNT +1;
		EXIT WHEN VN_CNT > 9;
	END LOOP;
END;

OUTPUT > 3*1= 3
3*2= 6
3*3= 9
3*4= 12
3*5= 15
3*6= 18
3*7= 21
3*8= 24
3*9= 27



#WHILE�� 
WHILE���� LOOP���� ��������� WHILE ������ ������ �ٿ� �ش� ���ǿ� ������ ���� ������ ���鼭 ������ ó���Ѵ�. 

WHILE ����
LOOP 
	ó����
END LOOP;


-- ���� 1 
DECLARE 
	VN_BASE_NUM NUMBER := 3;
	VN_CNT NUMBER := 1;
BEGIN	
WHILE VN_CNT <= 9  -- VN_CNT �� 9���� �۰ų� ���� ���� �ݺ� ó��
LOOP 
	DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM || '*' || VN_CNT || '= ' || VN_BASE_NUM * VN_CNT );
	VN_CNT := VN_CNT +1;
END LOOP;
END;

OUTPUT > 3*1= 3
3*2= 6
3*3= 9
3*4= 12
3*5= 15
3*6= 18
3*7= 21
3*8= 24
3*9= 27


# FOR�� 
	�ε����� �ʱⰪ���� ������ ���������� ������ ���� 1�� �����Ǵµ�, 
	�ε��� ������ ���������� ������ �� ����, ���� ���� �ȿ����� ����
	REVERSE ����ϸ� ������ �Ųٷ� �ȴ�. 


FOR �ε��� IN [REVERSE] �ʱⰪ..������ 
LOOP 
	ó����;
END LOOP;

-- ���� 1 
DECLARE 
	VN_BASE_NUM NUMBER := 3;
BEGIN 
	FOR i IN 1..9 
	LOOP 
		CONTINUE WHEN i=5;
		DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM || '*' || i || '= ' || VN_BASE_NUM * i );
	END LOOP;
END; 

OUTPUT > 3*1= 3
3*2= 6
3*3= 9
3*4= 12
3*6= 18
3*7= 21
3*8= 24
3*9= 27


#CONTITNUE��
�ݺ��� ������ Ư�� ���ǿ� ������ �� ó�� ������ �ǳʶٰ� ����� ���� �������� �ǳʰ� ������ ��� ������ �� ���
EXIT�� ������ ������ ���� �����µ� ����, 
CONTINUE�� ���� ������ �������� �Ѿ��. ����� CONTINUE���� ����Ŭ 11g �������� �����ϰ� �ִ�. 

-- ���� 1
DECLARE 
	VN_BASE_NUM NUMBER := 3;
BEGIN 
	FOR i IN 1..9 
	LOOP 
		CONTINUE WHEN i=5;
		DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM || '*' || i || '= ' || VN_BASE_NUM * i );
	END LOOP;
END;

OUTPUT > 3*1= 3
3*2= 6
3*3= 9
3*4= 12 -- i �� 5�� ������ �������� �ʰ� for �������� ��� �Ű��� ó�������� �� �� �ִ�.
3*6= 18
3*7= 21
3*8= 24
3*9= 27



# GOTO�� 
PL/SQL�ڵ� �󿡼� GOTO���� ������ GOTO���� �����ϴ� �󺧷� ��� �Ѿ��. 

-- ���� 1 
DECLARE 
	VN_BASE_NUM NUMBER := 3;
BEGIN 
	<<third>>
	FOR i IN 1..9 
	LOOP 
		DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM || '*' || i || '= ' || VN_BASE_NUM * i );
	IF i = 3 THEN 
		GOTO fourth;
	END IF;
END LOOP;

<<fourth>> 
VN_BASE_NUM := 4;
FOR i IN 1..9
LOOP 
	DBMS_OUTPUT.PUT_LINE(VN_BASE_NUM || '*' || i || '= ' || VN_BASE_NUM * i );
END LOOP;
END;


OUTPUT > 3*1= 3
3*2= 6
3*3= 9
4*1= 4
4*2= 8
4*3= 12
4*4= 16
4*5= 20
4*6= 24
4*7= 28
4*8= 32
4*9= 36



# NULL�� 



