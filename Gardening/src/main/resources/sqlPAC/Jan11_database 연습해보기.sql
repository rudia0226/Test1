


SELECT * FROM STUDENT;
SELECT * FROM PROFESSOR;
SELECT * FROM SALE_TBL;
SELECT * FROM CD_TBL;


SELECT A.NAME �л��̸�
			, GRADE || '�г�'   �г�
			, TO_CHAR(BIRTHDAY, 'MM') || '��'  || ' ' ||  TO_CHAR(BIRTHDAY, 'DD') || '��'  || ' ' || TO_CHAR(BIRTHDAY,'YYYY') || '��' ����
			, B.NAME || ' (' || B.POSITION || ')' ��米��
FROM STUDENT A, PROFESSOR B
; 


SELECT * FROM SALE_TBL;


-- UNPIVOT ���
SELECT * 
FROM
(
	SELECT '����' SUBJECT , 100 ����, 20 ö��, 50 ����, 90 ��ö, 80 �μ� FROM DUAL UNION ALL 
	SELECT '����' SUBJECT, 39 ���� , 90 ö��, 100 ����, 90 ��ö, 100 �μ� FROM DUAL 
)
UNPIVOT 
(
	SCORE FOR NAME IN (���� , ö��, ����, ��ö, �μ�)
)
;



























