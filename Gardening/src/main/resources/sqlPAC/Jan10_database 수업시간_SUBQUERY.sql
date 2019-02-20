SELECT * FROM PROFESSOR;

-- ���������� �̿��� ������� ���� �˻�
-- ���ѿ��� ������ ���ؼ� �װ� WHERE ���� �־� �� 
SELECT NAME, POSITION 
FROM PROFESSOR
WHERE POSITION = (  -- ������ �������� ������ = ���
							SELECT POSITION 
							FROM PROFESSOR 
							WHERE NAME = '���ѿ�'
);




-- SUB QUERY  ; ������ �������� ( = , < , > , <= , <>)

SELECT * 
FROM STUDENT
WHERE GRADE = (   -- ��ſ��� ���� GRADE �� 3�̴ϱ� ������ �����ڷ� ��� ����
							SELECT GRADE 
							FROM STUDENT 
							WHERE NAME = '��ſ�'
);



SELECT * 
FROM STUDENT 
WHERE GRADE = (  -- GRADE �� 4�� STUDENT �� �������̴ϱ� �����࿬���ڷ� ��� �Ұ� 
					-- ���� ; ORA-01427: ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
					SELECT GRADE
					FROM STUDENT 
					WHERE GRADE = '4'
);




-- SUB QUERY ; ������ �������� ( IN, ANY, SOME, ALL, EXISTS)

SELECT * FROM DEPARTMENT;
SELECT * FROM STUDENT;


-- IN (= �����ڸ� OR �� ������ �Ͱ� ���� �ǹ�)
SELECT NAME, GRADE, DEPTNO1
FROM STUDENT 
WHERE DEPTNO1 IN (
					SELECT DEPTNO
					FROM DEPARTMENT 
					WHERE PART= 100
);


-- ANY (< �� > �� ���� ������ ���� ) 
SELECT STUDNO, NAME, HEIGHT , GRADE
FROM STUDENT 
WHERE HEIGHT > ANY (  -- �ּҰ��� 168���� ū HEIGHT ���� WHERE ���ǹ����� ����
					SELECT HEIGHT 
					FROM STUDENT 
					WHERE GRADE = 4
);



-- ���� ANY �� ���� �ǹ�
SELECT STUDNO, NAME, HEIGHT 
FROM STUDENT 
WHERE HEIGHT  > (
					SELECT MIN(HEIGHT) 
					FROM STUDENT 
					WHERE GRADE = 4
)
;

-- 1, 2 �߿� �ּҰ��� 1 ���� ū ��
SELECT * 
FROM STUDENT 
WHERE GRADE > ANY (
					SELECT TO_CHAR(ROWNUM)
					FROM DUAL 
					CONNECT BY LEVEL < 3
)
;




SELECT * FROM STUDENT ;

-- ALL (> �� �Բ� ���̸� > ANY : �ִ밪���� ũ�� �� �ǹ̸� ����)
SELECT STUDNO, NAME, HEIGHT 
FROM STUDENT 
WHERE HEIGHT > ALL ( -- ���� ū ���� 182 ���� Ű�� ū �л��� �����
					SELECT HEIGHT 
					FROM STUDENT 
					WHERE GRADE = 4
)
;

-- ���� ALL �� ���� �ǹ�
SELECT NAME, GRADE, HEIGHT 
FROM STUDENT 
WHERE HEIGHT  > (
			SELECT MAX(HEIGHT)
			FROM STUDENT 
			WHERE GRADE = 4
)
;


-- 1, 2�߿��� ���� �ִ밪 2���� ū ��
SELECT *
FROM STUDENT 
WHERE GRADE > ALL (
		SELECT TO_CHAR(ROWNUM) 
		FROM DUAL 
		CONNECT BY LEVEL < 3
)
;


-- EXISTS ; ROW�� �Ѱ��̶� ������ ����ȴ� 
SELECT   PROFNO, NAME, PAY, BONUS  
FROM PROFESSOR 
WHERE EXISTS (
				SELECT POSITION    -- ������, ������ 
				FROM PROFESSOR 
				WHERE BONUS IS NOT NULL
)
;


SELECT POSITION
FROM PROFESSOR 
WHERE BONUS IS NOT NULL;









