CREATE OR REPLACE PROCEDURE P_DIA_RSLTNAME_3
IS
 DIA_CURSOR SYS_REFCURSOR;
 V_STR_NAME EXAM_RSLT%ROWTYPE;
 
 PROCEDURE test_cursor_argu ( P_DIA IN OUT SYS_REFCURSOR)
      IS
        c_temp_curvar SYS_REFCURSOR;
      BEGIN
        -- 커서를 오픈
        OPEN c_temp_curvar FOR
        SELECT *
         FROM EXAM_RSLT
        WHERE GRADE = 2;
      P_DIA := c_temp_curvar;
      END;

    BEGIN
      test_cursor_argu (DIA_CURSOR);
      -- 프로시저 호출 후 emp_dep_curvar 변수에는 이 프로시저의 c_temp_curvar 결과가 담겨 있음

       -- ? 전달해서 받은 매개변수를 LOOP문을 사용해 결과를 출력
      LOOP
        -- 커서 변수를 사용해 결과 집합을 vs_emp_name 변수에 할당
        FETCH DIA_CURSOR INTO V_STR_NAME;
        -- 더 이상 패치된 참조 로우가 없으면 LOOP 탈출(커서 변수를 이용한 커서 속성 참조)
        EXIT WHEN DIA_CURSOR%NOTFOUND;
        -- 사원명을 출력
         DBMS_OUTPUT.PUT_LINE( V_STR_NAME.NAME ||' | ' || V_STR_NAME.CLASS ||' | '||
                             V_STR_NAME.GRADE ||' | '||  TO_CHAR(V_STR_NAME.KOR+V_STR_NAME.ENG+V_STR_NAME.MAT) ||' | ');

      END LOOP;

    END;  