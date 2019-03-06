
-----------------------------------------------------------------------------------------
 ����� ������ ���ڵ�(%ROWTYPE, RECORD) ,���̺��� ���ڵ�(%TYPE)
-----------------------------------------------------------------------------------------
����

 TYPE ���ڵ�� IS RECORD (
      �ʵ��1 �ʵ�1 Ÿ�� [[NOT NULL] := ����Ʈ��],
      �ʵ��2 �ʵ�2 Ÿ�� [[NOT NULL] := ����Ʈ��],
    ...
      );

���ڵ庯���� ���ڵ��;


��1 : ����� ���� ���ڵ�)
  

DECLARE

     TYPE T_STD_REC IS RECORD (
              VN_STUDNO    NUMBER(4),
              VS_NAME      VARCHAR2(10),    
              VS_ID        VARCHAR2(20) ,   
              VN_GRADE     NUMBER,
              VS_JUMIN     CHAR(13) ,       
              VD_BIRTHDAY  DATE,
              VS_TEL       VARCHAR2(15)--,
            --  HEIGHT    NUMBER(4),
            --  WEIGHT    NUMBER(3),
            --  DEPTNO1   NUMBER(3),
            --  DEPTNO2   NUMBER(3),
            --  PROFNO    NUMBER(4)
      );
      
    V_STD_REC     T_STD_REC ;
    
    VN_GRADE NUMBER := 4 ;
    
    I PLS_INTEGER := 0;
    
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
     CURSOR STD_LIST_CUR IS
     SELECT STUDNO   
        ,NAME     
        ,ID       
        ,GRADE    
        ,JUMIN    
        ,BIRTHDAY 
        ,TEL 
     FROM STUDENT
     WHERE GRADE = vN_GRADE ;
     

    BEGIN

      -- Ŀ������
      OPEN STD_LIST_CUR;

      -- ����� Ŀ���� �޾� ���� ù ��° LOOP
      LOOP
        -- �μ����� ����, ����� ��� ������ Ŀ�� ������ ��ġ
        FETCH STD_LIST_CUR INTO V_STD_REC ; --Ŭ������ �� ,Ŀ���� ���������� ����.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[SEQ : '|| I ||']',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('�й� : ' || V_STD_REC.VN_STUDNO) ;  
        DBMS_OUTPUT.PUT_LINE ('�̸� : ' || V_STD_REC.VS_NAME );
        DBMS_OUTPUT.PUT_LINE ('ID : ' || V_STD_REC.VS_ID  );
        DBMS_OUTPUT.PUT_LINE ('�г� : ' || V_STD_REC.VN_GRADE );
        DBMS_OUTPUT.PUT_LINE ('�ֹ� : ' || V_STD_REC.VS_JUMIN );
        DBMS_OUTPUT.PUT_LINE ('���� : ' || V_STD_REC.VD_BIRTHDAY);
        DBMS_OUTPUT.PUT_LINE ('��ȭ : ' || V_STD_REC.VS_TEL);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- ù ��° LOOP ����

    END;  
	
----
��2 : %ROWTYPE )	
----

DECLARE

    V_STD_REC  STUDENT%ROWTYPE ;   
    
    VN_GRADE NUMBER := 4 ;
    
    I PLS_INTEGER := 0;
    
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
     CURSOR STD_LIST_CUR IS
     SELECT STUDNO   
        ,NAME     
        ,ID       
        ,GRADE    
        ,JUMIN    
        ,BIRTHDAY 
        ,TEL 
     FROM STUDENT
     WHERE GRADE = VN_GRADE ;
     

    BEGIN

      -- Ŀ������
      OPEN STD_LIST_CUR;

      -- ����� Ŀ���� �޾� ���� ù ��° LOOP
      LOOP
        -- �μ����� ����, ����� ��� ������ Ŀ�� ������ ��ġ
        FETCH STD_LIST_CUR INTO V_STD_REC.STUDNO,V_STD_REC.NAME,V_STD_REC.ID,
                                V_STD_REC.GRADE,V_STD_REC.JUMIN,V_STD_REC.BIRTHDAY,
                                V_STD_REC.TEL  ; --Ŭ������ �� ,Ŀ���� ���������� ����.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[SEQ : '|| I ||']',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('�й� : ' || V_STD_REC.STUDNO) ;  
        DBMS_OUTPUT.PUT_LINE ('�̸� : ' || V_STD_REC.NAME );
        DBMS_OUTPUT.PUT_LINE ('ID : ' || V_STD_REC.ID  );
        DBMS_OUTPUT.PUT_LINE ('�г� : ' || V_STD_REC.GRADE );
        DBMS_OUTPUT.PUT_LINE ('�ֹ� : ' || V_STD_REC.JUMIN );
        DBMS_OUTPUT.PUT_LINE ('���� : ' || V_STD_REC.BIRTHDAY);
        DBMS_OUTPUT.PUT_LINE ('��ȭ : ' || V_STD_REC.TEL);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- ù ��° LOOP ����

    END;   

-----------------------	
��3 : ����� ���� ���ڵ�)
----------------------- 

DECLARE
   
  TYPE T_STD_REC IS RECORD (              
              VS_ID        STUDENT.ID%TYPE ,  
              VS_NAME      STUDENT.NAME%TYPE, 
              VN_AGE       NUMBER(3) := 0 ,
              VN_GRADE     STUDENT.GRADE%TYPE,
              VS_FDNAME    DEPARTMENT.DNAME%TYPE ,
              VS_SDNAME    DEPARTMENT.DNAME%TYPE 
  );
      
    V_STD_REC     T_STD_REC ;
    
    VS_ID VARCHAR2(100) := 'guyume' ;
    
    I PLS_INTEGER := 0;
    
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
     CURSOR STD_LIST_CUR IS
     SELECT ID
           ,NAME
           ,CEIL((SYSDATE -BIRTHDAY)/365) AG          
           ,GRADE
           ,B.DNAME F_MJR          
           ,C.DNAME S_MJR
    FROM STUDENT A,
         DEPARTMENT  B ,
         DEPARTMENT  C         
    WHERE A.DEPTNO1 = B.DEPTNO(+)
      AND A.DEPTNO2 = C.DEPTNO(+) 
      AND A.ID = VS_ID;
     
    BEGIN

      -- Ŀ������
      OPEN STD_LIST_CUR;

      -- ����� Ŀ���� �޾� ���� ù ��° LOOP
      LOOP
        -- �μ����� ����, ����� ��� ������ Ŀ�� ������ ��ġ
        FETCH STD_LIST_CUR INTO V_STD_REC ; --Ŭ������ �� ,Ŀ���� ���������� ����.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[ '|| V_STD_REC.VS_ID ||'����]',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('ID : ' || V_STD_REC.VS_ID) ;  
        DBMS_OUTPUT.PUT_LINE ('�̸� : ' || V_STD_REC.VS_NAME );
        DBMS_OUTPUT.PUT_LINE ('���� : ' ||  V_STD_REC.VN_AGE  );
        DBMS_OUTPUT.PUT_LINE ('�г� : ' || V_STD_REC.VN_GRADE );
        DBMS_OUTPUT.PUT_LINE ('������ : ' || V_STD_REC.VS_FDNAME );
        DBMS_OUTPUT.PUT_LINE ('������ : ' || V_STD_REC.VS_SDNAME);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- ù ��° LOOP ����

    END;  


-----------------------------------------------------------------------------------------
 Ŀ���� ���ڵ�
-----------------------------------------------------------------------------------------

DECLARE
    
    VS_ID VARCHAR2(100) := 'guyume' ;
    
    I PLS_INTEGER := 0;
    
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
     CURSOR STD_LIST_CUR IS
     SELECT ID
           ,NAME
           ,CEIL((SYSDATE -BIRTHDAY)/365) AG          
           ,GRADE
           ,B.DNAME F_MJR          
           ,C.DNAME S_MJR
    FROM STUDENT A,
         DEPARTMENT  B ,
         DEPARTMENT  C         
    WHERE A.DEPTNO1 = B.DEPTNO(+)
      AND A.DEPTNO2 = C.DEPTNO(+) 
      AND A.ID = VS_ID;
      
    V_STD_REC STD_LIST_CUR%ROWTYPE ; --  Ŀ���� ���ڵ�
    
     
    BEGIN

      -- Ŀ������
      OPEN STD_LIST_CUR;

      -- ����� Ŀ���� �޾� ���� ù ��° LOOP
      LOOP
        -- �μ����� ����, ����� ��� ������ Ŀ�� ������ ��ġ
        FETCH STD_LIST_CUR INTO V_STD_REC ; --Ŭ������ �� ,Ŀ���� ���������� ����.
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[ ' || V_STD_REC.ID ||'����]',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('* ID : '   || V_STD_REC.ID) ;  
        DBMS_OUTPUT.PUT_LINE ('* �̸� : '  || V_STD_REC.NAME );
        DBMS_OUTPUT.PUT_LINE ('* ���� : '  ||  V_STD_REC.AG  );
        DBMS_OUTPUT.PUT_LINE ('* �г� : '  || V_STD_REC.GRADE );
        DBMS_OUTPUT.PUT_LINE ('* ������ : ' || V_STD_REC.F_MJR );
        DBMS_OUTPUT.PUT_LINE ('* ������ : ' || V_STD_REC.S_MJR);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- ù ��° LOOP ����

    END;  

-----------------------------------------------------------------------------------------
��ø ���ڵ�
-----------------------------------------------------------------------------------------

DECLARE


	 TYPE T_DEPT_REC IS RECORD (              
		VS_FDNAME    DEPARTMENT.DNAME%TYPE ,
		VS_SDNAME    DEPARTMENT.DNAME%TYPE           
	  );
	  
				  
	 TYPE T_STD_REC IS RECORD (              
				  VS_ID        STUDENT.ID%TYPE ,  
				  VS_NAME      STUDENT.NAME%TYPE, 
				  VN_AGE       NUMBER(3) := 0 ,
				  VN_GRADE     STUDENT.GRADE%TYPE,  
				  VS_DETP_REC  T_DEPT_REC   -- ��ø���ڵ�
	  );
  
    VS_ID VARCHAR2(100) := 'guyume' ;
    
    I PLS_INTEGER := 0;
    
      -- Ŀ�� ǥ������ ����� ����� Ŀ�� ����
     CURSOR STD_LIST_CUR IS
     SELECT ID
           ,NAME
           ,CEIL((SYSDATE -BIRTHDAY)/365) AG          
           ,GRADE
           ,B.DNAME F_MJR          
           ,C.DNAME S_MJR
    FROM STUDENT A,
         DEPARTMENT  B ,
         DEPARTMENT  C         
    WHERE A.DEPTNO1 = B.DEPTNO(+)
      AND A.DEPTNO2 = C.DEPTNO(+) 
      AND A.ID = VS_ID;
      
    V_STD_REC T_STD_REC; --  ���ڵ庯�� ����
    
     
    BEGIN

      -- Ŀ������
      OPEN STD_LIST_CUR;

      -- ����� Ŀ���� �޾� ���� ù ��° LOOP
      LOOP
        -- �μ����� ����, ����� ��� ������ Ŀ�� ������ ��ġ
        FETCH STD_LIST_CUR INTO V_STD_REC.VS_ID,V_STD_REC.VS_NAME, 
								V_STD_REC.VN_AGE,V_STD_REC.VN_GRADE,
								V_STD_REC.VS_DETP_REC.VS_FDNAME,
								V_STD_REC.VS_DETP_REC.VS_SDNAME	; --Ŭ������ �� ,Ŀ���� ���������� ����.
								
        EXIT WHEN STD_LIST_CUR%NOTFOUND;
        I := I+1 ;
        
        DBMS_OUTPUT.PUT_LINE (RPAD('[ ' || V_STD_REC.VS_ID ||'����]',30,'-'));
        DBMS_OUTPUT.PUT_LINE ('* ID : '   || V_STD_REC.VS_ID) ;  
        DBMS_OUTPUT.PUT_LINE ('* �̸� : '  || V_STD_REC.VS_NAME );
        DBMS_OUTPUT.PUT_LINE ('* ���� : '  ||  V_STD_REC.VN_AGE  );
        DBMS_OUTPUT.PUT_LINE ('* �г� : '  || V_STD_REC.VN_GRADE );
        DBMS_OUTPUT.PUT_LINE ('* ������ : ' || V_STD_REC.VS_DETP_REC.VS_FDNAME );
        DBMS_OUTPUT.PUT_LINE ('* ������ : ' || V_STD_REC.VS_DETP_REC.VS_SDNAME);
        DBMS_OUTPUT.PUT_LINE (CHR(13));   
       
      END LOOP; -- ù ��° LOOP ����

    END; 