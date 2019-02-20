# LOOP문
LOOP 
	처리문;
	EXIT [WHEN 조건];
END LOOP;

-- 예제 1
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



#WHILE문 
WHILE문은 LOOP문과 비슷하지만 WHILE 다음에 조건을 붙여 해당 조건에 만족할 때만 루프를 돌면서 로직을 처리한다. 

WHILE 조건
LOOP 
	처리문
END LOOP;


-- 예제 1 
DECLARE 
	VN_BASE_NUM NUMBER := 3;
	VN_CNT NUMBER := 1;
BEGIN	
WHILE VN_CNT <= 9  -- VN_CNT 가 9보다 작거나 같을 때만 반복 처리
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


# FOR문 
	인덱스는 초기값에서 시작해 최종값까지 루프를 돌며 1씩 증가되는데, 
	인덱스 참조는 가능하지만 변경할 수 없고, 오직 루프 안에서만 가능
	REVERSE 명시하면 순서가 거꾸로 된다. 


FOR 인덱스 IN [REVERSE] 초기값..최종값 
LOOP 
	처리문;
END LOOP;

-- 예제 1 
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


#CONTITNUE문
반복문 내에서 특정 조건에 부합할 떄 처리 로직을 건너뛰고 상단의 루프 조건으로 건너가 루프를 계속 수행할 때 사용
EXIT는 루프를 완전히 빠져 나오는데 반해, 
CONTINUE는 제어 범위가 조건절로 넘어간다. 참고로 CONTINUE문은 오라클 11g 버젼부터 지원하고 있다. 

-- 예제 1
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
3*4= 12 -- i 가 5면 로직을 수행하지 않고 for 조건절로 제어가 옮겨져 처리됐음을 알 수 있다.
3*6= 18
3*7= 21
3*8= 24
3*9= 27



# GOTO문 
PL/SQL코드 상에서 GOTO문을 만나면 GOTO문이 지정하는 라벨로 제어가 넘어간다. 

-- 예제 1 
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



# NULL문 



