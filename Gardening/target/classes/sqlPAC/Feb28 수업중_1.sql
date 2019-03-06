CREATE OR REPLACE PROCEDURE P_DIA_CLASS
AS
      CURSOR DIA_CUR IS
      
      SELECT CLASS , -- 커서 사용으로 스칼라 서브쿼리 (레벨달라도) 출력가능
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
        DBMS_OUTPUT.PUT_LINE ('반이름 : ' || VAR_CLASS);

        LOOP         
          FETCH C_CUR INTO VAR_NNAME, VAR_GRADE, VAR_TOT
          EXIT WHEN C_CUR%NOTFOUND;

          DBMS_OUTPUT.PUT_LINE('  학생정보 : ' || VAR_NAME || ' |  ' ||  VAR_GRADE || ' |  ' ||  VAR_TOT );

        END LOOP; 
      END LOOP; 
END;

