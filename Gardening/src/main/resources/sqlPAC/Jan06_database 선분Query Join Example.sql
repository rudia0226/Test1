
-- ��������

SELECT * FROM STD_CALND;
SELECT * FROM CHG_GOODS_M;

SELECT ��ǰ�׷�, ���ؿ�
		,  GREATEST(A.��������, B.�����������) ��������
		,  LEAST(A.��������, B.������������) ��������
		,  ��ǰ��
FROM STD_CALND A, CHG_GOODS_M B
where ��ǰ��='B00C'
;

SELECT ��ǰ�׷�, ���ؿ�
		,  GREATEST(A.��������, B.�����������) ��������
		,  LEAST(A.��������, B.������������) ��������
		, ��ǰ��
FROM STD_CALND A, CHG_GOODS_M B
WHERE B.����������� <= A.�������� 
	AND B.������������ >= A.��������
ORDER BY ��ǰ��
;

SELECT ��ǰ�׷�, ���ؿ�
		,  GREATEST(A.��������, B.�����������) ��������
		,  LEAST(A.��������, B.������������) ��������, ��ǰ��
FROM STD_CALND A, CHG_GOODS_M B
WHERE B.����������� <= A.�������� 
AND B.������������ >= A.��������
and ��ǰ��='B00C'
ORDER BY ��ǰ��
;








