
01. PL/SQL제어문 
	특정조건에 맞을 때 처리하는 조건문, 
	반복처리시 사용하는 반복문,
	GOTO나 NULL같은 순차적 제어문이 있다.
	
#01 IF문----------------
	<조건이 1개>
	IF 조건 THEN 
		조건처리;
	END IF;

	<조건이 2개>
	IF 조건 THEN 
		조건처리1;
	ELSE 
		조건처리2;
	END IF;

	<조건이 N개>
	IF 조건1 THEN 
		조건처리1;
	ELSEIF 조건2 THEN 
		조건처리2;
		...
	ELSE 
		조건처리N;
	END IF;
	----------------------
	
IF문 예제

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







