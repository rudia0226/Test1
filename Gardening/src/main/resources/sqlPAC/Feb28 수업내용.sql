
-- Feb28




��Ű���� ���� � ¥����������.
; 

������ Ÿ���� ����ڰ� ���� �ؼ� ��� ; ���ڵ� , �÷���
�÷����� ���� ��


 ;
 
==============================================
�÷��� 

���ڵ�� ����� �迭 ; ������ �迭
;


==============================================
�����Ŀ�� ; ���� STANDARD �� ��� 
 DECLARE      
      VEXAM_REC EXAM_RSLT%ROWTYPE;
      VS_GRADE EXAM_RSLT.GRADE%TYPE := 2;
      
      -- Ŀ�� ����            
      CURSOR CUR_EXAM_DATA IS
      SELECT *
       FROM EXAM_RSLT
      WHERE GRADE = VS_GRADE;
   
  BEGIN
   
      -- Ŀ�� ���� 
      OPEN CUR_EXAM_DATA;

      -- �ݺ����� ���� Ŀ�� ��ġ�۾�      
      LOOP
        -- Ŀ�� ����� ���� �ο츦 ��ġ�� 
        FETCH CUR_EXAM_DATA INTO VEXAM_REC;

        -- ��ġ�� ���� �ο찡 �� ������ LOOP Ż��
        EXIT WHEN CUR_EXAM_DATA%NOTFOUND;

        -- ������� ���
        DBMS_OUTPUT.PUT_LINE( VEXAM_REC.NAME ||' | '||VEXAM_REC.CLASS ||' | '||
                             VEXAM_REC.GRADE ||' | '||
                             TO_CHAR(VEXAM_REC.KOR+VEXAM_REC.ENG+VEXAM_REC.MAT)||' | ');

       END LOOP;
       
       -- �ݺ��� ���� �� Ŀ�� �ݱ�
       CLOSE CUR_EXAM_DATA;      
		
   END;


==============================================
�����Ŀ�� ; ��๮��
Ŀ���� ����
Ŀ���� ����/Ŭ���� �� �ʿ䰡 ���� 
��� ���Ϲ��� ROWTYPE ������ �ʿ����

 
FOR ���⼭ ����� ���� IN Ŀ���̸�
;

Ŀ���� Ÿ���� ���� FOR �� ���� ����� ������ �װ� ã�ư��� ���� ;


==============================================
Ŀ������ 
;

���� Ŀ������
���� Ŀ������
�ý��ۿ��� �����ϴ� Ŀ������

Ŀ�������� Ŀ����� �ϴ� �Ϳ� �ִ� ���� ����ų �� �ִ�.
SQL���� ���� ����Ű�� �ּҸ� ������ ��´�.

CURSOR Ŀ���� IS SELECT ...
==============================================
JAVA������ ������ ���� ; �ּ� ��ü 
�ּҰ� ���°� ������
�������� ���°� �⺻��

==============================================

���� Ŀ�� Ÿ�� ; ���� �̰� ���  		 TYPE Ŀ�������̸� IS REF CURSOR;
RETURN�� ���� �������� ������ ��� Ÿ������ ���� ���� 

==============================================
�ý��ۿ��� �������ִ� Ŀ��Ÿ�� ;  Ŀ���̸� SYS_REFCURSOR;

==============================================

Ŀ���������� ��� ���� ��������
FETCH Ŀ�� ������ INTO ����1, ����2, ...;
FETCH Ŀ�� ������ INTO ���ڵ��;

SELECT * 
FROM EXAM_RSLT;



�ǽ��غ���
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME
AS
       -- ������� �޾ƿ��� ���� ���� ����
       V_STR_NAME  EXAM_RSLT.NAME%TYPE;
   
       -- ���� Ŀ�� Ÿ�� ����
       TYPE DIA_CURSOR_TYPE IS REF CURSOR;
       -- Ŀ�� ���� ����
       DIA_CURSOR DIA_CURSOR_TYPE;
    BEGIN

      -- Ŀ�� ������ ����� Ŀ�� ���� �� ����
      OPEN DIA_CURSOR FOR SELECT NAME 
                         FROM EXAM_RSLT
                        WHERE GRADE = 2;

      -- LOOP��
      LOOP
         -- Ŀ�� ������ ����� ��� ������ vs_emp_name ������ �Ҵ�
         FETCH DIA_CURSOR INTO V_STR_NAME;

        -- �� �̻� ��ġ�� ���� �ο찡 ������ LOOP Ż��(Ŀ�� ������ �̿��� Ŀ�� �Ӽ� ����)
        EXIT WHEN DIA_CURSOR%NOTFOUND;

        -- ������� ���
        DBMS_OUTPUT.PUT_LINE('��� : ' || V_STR_NAME);
      END LOOP;
   END;
    

==============================================

��๮��
Ŀ������ 
	����Ŀ��
	��Ʈ��Ŀ�� 
Ŀ������ 



��๮��
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_1
IS
    BEGIN
      -- FOR���� ���� Ŀ�� ��ġ �۾�(Ŀ���� ������ �� ���� �κ��� FOR���� ���� ���)
      -- OPEN / FETCH / ~ 3���� FOR���� ����� 
      FOR V_STR_NAME IN ( SELECT *
                        			 FROM EXAM_RSLT
                       				 WHERE GRADE = 2
                   					 )	
      LOOP
        -- ������� ���, ���ڵ� Ÿ���� ���ڵ��.�÷��� ���·� ���
      DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                   V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');
      END LOOP;

    END;
    
    


����Ŀ��
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME
AS  

       V_STR_NAME  EXAM_RSLT%ROWTYPE;
       TYPE DIA_CURSOR_TYPE IS REF CURSOR;  -- ����Ŀ�� 
       
       DIA_CURSOR DIA_CURSOR_TYPE;
       
BEGIN
      OPEN DIA_CURSOR FOR SELECT * 
                         FROM EXAM_RSLT
                        WHERE GRADE = 2;
      LOOP
        FETCH DIA_CURSOR INTO V_STR_NAME;
		
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');
      
      END LOOP;

END;
    

��Ʈ��Ŀ��
CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_2
IS

 V_STR_NAME  EXAM_RSLT%ROWTYPE;
 DIA_CURSOR SYS_REFCURSOR;
 
BEGIN
      OPEN DIA_CURSOR FOR SELECT * 
                         FROM EXAM_RSLT
                        WHERE GRADE = 2;
      LOOP
        FETCH DIA_CURSOR INTO V_STR_NAME;
		
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');
      
      END LOOP;
END;


===========================
�� Ŀ������    ;  SYS_REFCURSOR ���� ���

CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_3
IS
 DIA_CURSOR SYS_REFCURSOR;
 V_STR_NAME EXAM_RSLT%ROWTYPE;
 
 PROCEDURE test_cursor_argu ( P_DIA IN OUT SYS_REFCURSOR)
      IS
        c_temp_curvar SYS_REFCURSOR;
      BEGIN
        -- Ŀ���� ����
        OPEN c_temp_curvar FOR
        SELECT *
         FROM EXAM_RSLT
        WHERE GRADE = 2;
      P_DIA := c_temp_curvar;
      END;

    BEGIN
      test_cursor_argu (DIA_CURSOR);   -- �̰Ÿ� �˰������� ��
      -- ���ν��� ȣ�� �� emp_dep_curvar �������� �� ���ν����� c_temp_curvar ����� ��� ����

       -- ? �����ؼ� ���� �Ű������� LOOP���� ����� ����� ���
      LOOP
        -- Ŀ�� ������ ����� ��� ������ vs_emp_name ������ �Ҵ�
        FETCH DIA_CURSOR INTO V_STR_NAME;
        -- �� �̻� ��ġ�� ���� �ο찡 ������ LOOP Ż��(Ŀ�� ������ �̿��� Ŀ�� �Ӽ� ����)
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        -- ������� ���
         DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');

      END LOOP;

    END;  
 ========================================


Ŀ�� ǥ���� 

Ŀ���� �̿��ؼ� ��Į�� �������������� �������� �����ϱ�
SELECT CLASS , 
	 ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
FROM EXAM_RSLT A 
GROUP BY CLASS
;

DESC EXAM_RSLT;


SELECT CLASS , 
	CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	-- ��Į�� ���������� �����÷��� ���� ������ �ȵ����� Ŀ���� ���� ��
	-- ������ ������ �ȸ¾Ƶ� ������� 
	-- ���� 354 ������ ���� NM_AVGCLASSNM_AVG
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS  ) NM_AVG
FROM EXAM_RSLT A 
GROUP BY CLASS ;

-- ������ �ٸ��� ��忡���� ���� ����




========================================

Ŀ��ǥ���� ���� 
;
CREATE OR REPLACE PROCEDURE P_DIA_CLASS
IS 
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
      CURSOR mytest_cursor IS
      SELECT CLASS , 
		CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
	  FROM EXAM_RSLT A 
	  GROUP BY CLASS ;


      -- �μ����� �޾ƿ��� ���� ����
      vs_department_name EXAM_RSLT.CLASS%TYPE;

      --Ŀ�� ǥ���� ����� �ޱ� ���� Ŀ�� Ÿ�� ����
      c_emp_name SYS_REFCURSOR;

      -- ������� �޴� ����
      vs_emp_name EXAM_RSLT.NAME%TYPE;

    BEGIN

      -- Ŀ������
      OPEN mytest_cursor;

      -- ����� Ŀ���� �޾� ���� ù ��° LOOP
      LOOP
        -- �μ����� ����, ����� ��� ������ Ŀ�� ������ ��ġ
        FETCH mytest_cursor INTO vs_department_name, c_emp_name;
        EXIT WHEN mytest_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('���̸� : ' || vs_department_name);

        -- �����(Ŀ�� ǥ����)�� ����ϱ� ���� �� ��° LOOP
        LOOP
          -- ����� ��ġ
          FETCH c_emp_name INTO vs_emp_name;
          EXIT WHEN c_emp_name%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('   �л���� : ' || vs_emp_name);

        END LOOP; -- �� ��° LOOP ����

      END LOOP; -- ù ��° LOOP ����

    END;

========================================


CREATE OR REPLACE PROCEDURE P_DIA_CLASS
IS 
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
      CURSOR DIA_CUR IS
      SELECT CLASS , 
		CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
	  FROM EXAM_RSLT A 
	  GROUP BY CLASS ;
      VAR_CLASS EXAM_RSLT.CLASS%TYPE;
      C_CUR SYS_REFCURSOR;
      VAR_NAME EXAM_RSLT.NAME%TYPE;

    BEGIN
      OPEN DIA_CUR;

      LOOP        
        FETCH DIA_CUR INTO VAR_CLASS, C_CUR;
        EXIT WHEN DIA_CUR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('���̸� : ' || VAR_CLASS);

        LOOP         
          FETCH C_CUR INTO VAR_NAME;
          EXIT WHEN C_CUR%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('   �л���� : ' || VAR_NAME);

        END LOOP; 
      END LOOP; 

    END;

======================================

CREATE OR REPLACE PROCEDURE P_DIA_CLASS
AS
      CURSOR DIA_CUR IS
      
      SELECT CLASS , -- Ŀ�� ������� ��Į�� �������� (�����޶�) ��°���
		CURSOR ( SELECT NAME , GRADE , ROUND((KOR+ENG+MAT)/3 , 1)AVG	
	  FROM EXAM_RSLT B 
	  WHERE A.CLASS = B.CLASS) NM_AVG
	  FROM EXAM_RSLT A 
	  GROUP BY CLASS ;
      
      VAR_CLASS EXAM_RSLT.CLASS%TYPE;
      
      C_CUR SYS_REFCURSOR;
      
      VAR_NAME EXAM_RSLT.NAME%ROWTYPE;
      VAR_GRADE EXAM_RSLT.GRADE%TYPE;
      VAR_TOT  NUMBER(5,1);

BEGIN
      OPEN DIA_CUR;

      LOOP        
        FETCH DIA_CUR INTO VAR_CLASS, C_CUR;
        EXIT WHEN DIA_CUR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE ('���̸� : ' || VAR_CLASS);

        LOOP         
          FETCH C_CUR INTO VAR_NNAME, VAR_GRADE, VAR_TOT
          EXIT WHEN C_CUR%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('  �л����� : ' || VAR_NAME || ' |  ' ||  VAR_GRADE || ' |  ' ||  VAR_TOT );

        END LOOP; 
      END LOOP; 
END;



