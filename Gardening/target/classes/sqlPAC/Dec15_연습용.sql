
-- ���Խ� �Լ� ����

SELECT VAR_STR NN,
	REGEXP_SUBSTR(VAR_STR || ',' , '[^\,]+', 1, SEQ) COL 
	-- ,�� �������� ù��°���� �߶� SEQ��ȣ���� ������ ©�� ����. 
	-- ,�� �ƴѰ͵��� ��Ÿ���ִ°Ŷ� �� ���������� , �� �ٿ��ֱ� ����
	-- || ',' �� �ٿ���
FROM
(
SELECT VAR_STR, SEQ
FROM
(
SELECT 
	'�ڷ���,��ī��,���,¯¯��,12,FEB,LIKEIT' VAR_STR
	, REGEXP_COUNT('�ڷ���,��ī��,���,¯¯��,12,FEB,LIKEIT', ',') +1 CNT
	-- +1 ���ִ� ������ , �� COUNT�ϴ°Ŷ� �ܾ� ������ ���ϱ����� +1 ����
	,  REGEXP_COUNT('�ڷ���,��ī��,���,¯¯��,12,FEB,LIKEIT', ',')  C
FROM DUAL
) A ,
(
SELECT ROWNUM SEQ
FROM EMP
WHERE ROWNUM <= 5
 ) );
 
 
 -- �м��Լ��� ����(PART 1)
 SELECT * FROM EXAM_RSLT;
 
   
 
 
 
 
 
 
