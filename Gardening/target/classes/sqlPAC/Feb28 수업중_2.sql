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
      test_cursor_argu (DIA_CURSOR);
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