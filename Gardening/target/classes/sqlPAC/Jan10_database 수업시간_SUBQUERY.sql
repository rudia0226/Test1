SELECT * FROM PROFESSOR;

-- 서브쿼리를 이용한 교수명과 직급 검색
-- 나한열의 직급을 구해서 그걸 WHERE 문에 넣어 비교 
SELECT NAME, POSITION 
FROM PROFESSOR
WHERE POSITION = (  -- 단일행 서브쿼리 연산자 = 사용
							SELECT POSITION 
							FROM PROFESSOR 
							WHERE NAME = '나한열'
);




-- SUB QUERY  ; 단일행 서브쿼리 ( = , < , > , <= , <>)

SELECT * 
FROM STUDENT
WHERE GRADE = (   -- 김신영과 같은 GRADE 는 3이니까 단일행 연산자로 사용 가능
							SELECT GRADE 
							FROM STUDENT 
							WHERE NAME = '김신영'
);



SELECT * 
FROM STUDENT 
WHERE GRADE = (  -- GRADE 가 4인 STUDENT 는 여러명이니까 단일행연산자로 사용 불가 
					-- 에러 ; ORA-01427: 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
					SELECT GRADE
					FROM STUDENT 
					WHERE GRADE = '4'
);




-- SUB QUERY ; 다중행 서브쿼리 ( IN, ANY, SOME, ALL, EXISTS)

SELECT * FROM DEPARTMENT;
SELECT * FROM STUDENT;


-- IN (= 연산자를 OR 로 연결한 것과 같은 의미)
SELECT NAME, GRADE, DEPTNO1
FROM STUDENT 
WHERE DEPTNO1 IN (
					SELECT DEPTNO
					FROM DEPARTMENT 
					WHERE PART= 100
);


-- ANY (< 나 > 와 같은 범위비교 가능 ) 
SELECT STUDNO, NAME, HEIGHT , GRADE
FROM STUDENT 
WHERE HEIGHT > ANY (  -- 최소값인 168보다 큰 HEIGHT 값을 WHERE 조건문으로 돌림
					SELECT HEIGHT 
					FROM STUDENT 
					WHERE GRADE = 4
);



-- 위에 ANY 와 같은 의미
SELECT STUDNO, NAME, HEIGHT 
FROM STUDENT 
WHERE HEIGHT  > (
					SELECT MIN(HEIGHT) 
					FROM STUDENT 
					WHERE GRADE = 4
)
;

-- 1, 2 중에 최소값인 1 보다 큰 건
SELECT * 
FROM STUDENT 
WHERE GRADE > ANY (
					SELECT TO_CHAR(ROWNUM)
					FROM DUAL 
					CONNECT BY LEVEL < 3
)
;




SELECT * FROM STUDENT ;

-- ALL (> 와 함께 쓰이면 > ANY : 최대값보다 크면 의 의미를 지님)
SELECT STUDNO, NAME, HEIGHT 
FROM STUDENT 
WHERE HEIGHT > ALL ( -- 가장 큰 값인 182 보다 키가 큰 학생을 출력함
					SELECT HEIGHT 
					FROM STUDENT 
					WHERE GRADE = 4
)
;

-- 위에 ALL 과 같은 의미
SELECT NAME, GRADE, HEIGHT 
FROM STUDENT 
WHERE HEIGHT  > (
			SELECT MAX(HEIGHT)
			FROM STUDENT 
			WHERE GRADE = 4
)
;


-- 1, 2중에서 나온 최대값 2보다 큰 값
SELECT *
FROM STUDENT 
WHERE GRADE > ALL (
		SELECT TO_CHAR(ROWNUM) 
		FROM DUAL 
		CONNECT BY LEVEL < 3
)
;


-- EXISTS ; ROW가 한건이라도 있으면 수행된다 
SELECT   PROFNO, NAME, PAY, BONUS  
FROM PROFESSOR 
WHERE EXISTS (
				SELECT POSITION    -- 정교수, 조교수 
				FROM PROFESSOR 
				WHERE BONUS IS NOT NULL
)
;


SELECT POSITION
FROM PROFESSOR 
WHERE BONUS IS NOT NULL;









