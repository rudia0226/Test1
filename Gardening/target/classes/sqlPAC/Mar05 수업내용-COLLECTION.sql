-- �÷��� 

����
1. �����迭 ; Ű-�� (JAVA�� MAP)  =================================================================
				Ű�� �ε����� ��� 
				�ε����� ���ڳ� ���ڷ� ��� ���� 
				���ٹ�� ; �����迭������(�ε���) 
				�����ڸ� ����� �� ���� (������ �������� = �ʱ�ȭ ���ص���)
				ũ�⿡ ���� ���� 
				�Է��Ҷ����� ���������� �ε��� ������ ���ĵ� 
				
	TYPE �����迭�� IS TABLE OF �����迭��Ÿ��(���Ϲ�����Ÿ��) INDEX BY �ε���Ÿ��; 
	
	
	STUDENT �� ������ �й��� �ָ� ������ ��� 
	
 	
�����迭 ����
EXEC P_DIA_COLLECTION01(9411);
EXEC P_DIA_COLLECTION02('�����');

=============================

CREATE OR REPLACE PROCEDURE P_DIA_COLLECTION01(V_NUM NUMBER)
IS 
	TYPE STD_TYPE IS TABLE OF VARCHAR2(1000) INDEX BY PLS_INTEGER; 
    VAR_STD  STD_TYPE;
    
    CURSOR DIA_CURSOR IS
    SELECT STUDNO
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	
BEGIN
	OPEN DIA_CURSOR;
	LOOP
		FETCH DIA_CURSOR INTO REC_STUD; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
				VAR_STD(REC_STUD.STUDNO) := REC_STUD.STD_INFO ;
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(  VAR_STD(V_NUM)  );
		
	CLOSE DIA_CURSOR; 
END;

=============================

CREATE OR REPLACE PROCEDURE P_DIA_COLLECTION02(V_NAME VARCHAR2)
IS 
	TYPE STD_TYPE IS TABLE OF VARCHAR2(1000) INDEX BY VARCHAR2(200); 
    VAR_STD  STD_TYPE;
    
    CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	
BEGIN
	OPEN DIA_CURSOR;
	LOOP
		FETCH DIA_CURSOR INTO REC_STUD; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
				VAR_STD(REC_STUD.NAME) := REC_STUD.STD_INFO ;
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(  VAR_STD(V_NAME)  );
		
	CLOSE DIA_CURSOR; 
END;


    

	
2. VARRAY  =================================================================

���� �� ����� ���� (��Ұ��� ����)
���������� �ε����� ���� �� (���� �ε����� ������ �� ����)
�ε����� PLS_INTEGER �� ������ 
����Ϸ��� �ʱ�ȭ�ؾ���
		�ʱ�ȭ �ϴ� ���

TYPE ���̾�̸� IS VARRAY(�ִ�ũ��) OF ��Ұ�Ÿ��; 

VARRAY �������� 

Ÿ�Լ���
��������
���
����Ŀ��
�ʱ�ȭ    '�߿�' ; ���Ⱑ ������ ������ 
���� 
	FETCH Ŀ��

CREATE OR REPLACE PROCEDURE P_DIA_VARRAY01
IS 
TYPE T_VARRAY IS VARRAY(10)  OF VARCHAR2(1000);
					-- ����� 10���� ������ 
VAR_VRR  T_VARRAY ; 

CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	VN_CNT NUMBER := 0;

BEGIN
	OPEN DIA_CURSOR ; 
	VAR_VRR := T_VARRAY('','','','','','','','','','');  -- 1�����迭 ; �ʱ�ȭ�� ������ ������ ���Ұ� 
	
	LOOP 
		FETCH  DIA_CURSOR INTO REC_STUD ; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
		VN_CNT := VN_CNT+1;
		
		IF VN_CNT <= 10 THEN 
			VAR_VRR(VN_CNT) := REC_STUD.STD_INFO;
		END IF; 		
	END LOOP;
	VN_CNT := 10; 
	FOR I IN 1.. VN_CNT 
	LOOP
		DBMS_OUTPUT.PUT_LINE( I || ' : ' ||   VAR_VRR(I)  );
	END LOOP ;
	CLOSE DIA_CURSOR; 
END;





3. ��ø���̺�  =======================================================
ũ�⿡ ���� ����
���ڷθ� �ε����� ��밡�� 
������� �������� �ʾƵ� �� 

TYPE ��ø���̺�� IS TABLE OF ��Ÿ��; 
-- TABLE �� �����Ѵٴ� ���� ����� ���������ʰ� ���� ����ŭ �þ��.
-- ���� �� Ÿ�Ը� ���� 
-- �ε����� ���ڷ� �����Ǿ�����


CREATE OR REPLACE PROCEDURE P_DIA_NTTBL
IS 
TYPE T_VARRAY IS TABLE  OF VARCHAR2(1000);
					
VAR_VRR  T_VARRAY ; 

CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	VN_CNT NUMBER := 0;

BEGIN
	OPEN DIA_CURSOR ; 
	VAR_VRR := T_VARRAY(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);  -- �굵 �ʱ�ȭ �����
	
	LOOP 
		FETCH  DIA_CURSOR INTO REC_STUD ; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
		VN_CNT := VN_CNT+1;
		
		IF VN_CNT <= 10 THEN 
			VAR_VRR(VN_CNT) := REC_STUD.STD_INFO;
		END IF; 		
	END LOOP;
	VN_CNT := 10; 
	FOR I IN 1.. VN_CNT 
	LOOP
		DBMS_OUTPUT.PUT_LINE( I || ' : ' ||   VAR_VRR(I)  );
	END LOOP ;
	CLOSE DIA_CURSOR; 
END;






ǥ�ع��� ; ���ϴ� ������� �÷��ְų� �ϴ� (������ ��Ҹ� �߰� ) 
VARRAY �� EXPAND ��ü�� �ȵǰ�
��ø���̺��� EXPAND�� �� 


==============================================
ǥ�ع����� ���ؼ� �÷��� �ȿ��� ������ ��� ���� 

�÷��� �޼ҵ�    --ITERATOR �� ���� 

DELETE �޼ҵ� 

    DECLARE
      -- ����-���� ���� ���� �迭 ����
      TYPE av_type IS TABLE OF VARCHAR2(40)
                      INDEX BY VARCHAR2(10);

      -- �����迭 ���� ����
      vav_test av_type;

      vn_cnt number := 0;
    BEGIN
      -- ���� �迭 ���� ����
      vav_test('A') := '10�� ���� ��';
      vav_test('B') := '20�� ���� ��';
      vav_test('C') := '20�� ���� ��';

      vn_cnt := vav_test.COUNT;
      DBMS_OUTPUT.PUT_LINE('���� �� ��� ����: ' || vn_cnt);
      -- DELETE �޼ҵ带 ����� �� ���� ��Ҹ� ����
      vav_test.DELETE('A', 'B');

      -- COUNT �޼ҵ带 ����� ���� �迭�� �ִ� ��� ������ ���� ��
      vn_cnt := vav_test.COUNT;
      DBMS_OUTPUT.PUT_LINE('���� �� ��� ����: ' || vn_cnt);
    END;
    
    ---------------------
    CREATE OR REPLACE PROCEDURE P_DIA_DELETE 
IS 
	TYPE AV_TYPE IS TABLE OF VARCHAR2(40) INDEX BY VARCHAR2(10);
	
	VAV_TEST AV_TYPE ; 
	VN_CNT NUMBER := 0;
	
BEGIN
	VAV_TEST('��') := '�����Ű�' ; 
	VAV_TEST('��') := '��������' ; 
	VAV_TEST('��') := '�ٴ�����' ; 
	
	VN_CNT := VAV_TEST.COUNT;
	DBMS_OUTPUT.PUT_LINE('������ ���� : ' || VN_CNT ) ;
	
	VAV_TEST.DELETE('��', '��') ;
	
	VN_CNT := VAV_TEST.COUNT;
	DBMS_OUTPUT.PUT_LINE('���� �� ���� : ' || VN_CNT ) ;
	
END; 

----------------------------------------------------------

TRIM �޼ҵ� 

  DECLARE
      -- ��ø ���̺� ����
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- ���� ����
      vnt_test nt_typ;
    BEGIN
      -- �����ڸ� ����� �� �Ҵ� (ũ��� 5)
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- �� ���������� 2�� ��� ����
      vnt_test.TRIM(2);

      DBMS_OUTPUT.PUT_LINE(vnt_test(1));
      DBMS_OUTPUT.PUT_LINE(vnt_test(2));
      DBMS_OUTPUT.PUT_LINE(vnt_test(3));
      --DBMS_OUTPUT.PUT_LINE(vnt_test(4));    -- �ּ� Ǯ�� ���� �߻�, 2�� ���������Ƿ� 3���� �����ֱ� ����

    EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    END

--------------------------

EXTEND �޼ҵ� 

CREATE OR REPLACE PROCEDURE P_DIA_NTTBL01
IS 
TYPE T_VARRAY IS TABLE  OF VARCHAR2(1000);
					
VAR_VRR  T_VARRAY ; 

CURSOR DIA_CURSOR IS
    SELECT NAME
		, NAME || ' | ' ||  
		 ID || ' | ' || 
		 GRADE || ' | ' || 
		 JUMIN || ' | ' || 
		 BIRTHDAY || ' | ' || 
		 TEL || ' | ' || 
		 DEPTNO1 || ' | ' || 
		 DEPTNO2 || ' | ' || 
		 PROFNO 		STD_INFO
	FROM STUDENT 
	;

  	REC_STUD  DIA_CURSOR%ROWTYPE;
  	VN_CNT NUMBER := 0;

BEGIN
	OPEN DIA_CURSOR ; 
	VAR_VRR := T_VARRAY();  -- ����ִ� �ʱ�ȭ�� �� �� 
	
	LOOP 
		FETCH  DIA_CURSOR INTO REC_STUD ; 
		EXIT WHEN DIA_CURSOR%NOTFOUND;
		VAR_VRR.EXTEND; -- Ȯ�� �� �Է� 
		
		VN_CNT := VN_CNT+1;
		DBMS_OUTPUT.PUT_LINE(VN_CNT);
		VAR_VRR(VN_CNT) := REC_STUD.STD_INFO;
	END LOOP;
	
	FOR I IN 1.. VN_CNT 
	LOOP
		DBMS_OUTPUT.PUT_LINE( I || ' : ' ||   VAR_VRR(I)  );
	END LOOP ;
	CLOSE DIA_CURSOR; 
END;



----------------------

FIRST ; �ε�����ȣ ù��° �����
LAST ; �ε�����ȣ ������ �����

-- �ε����� ����Ű�� FIRST �� LAST 

    DECLARE
      -- ��ø ���̺� ����
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- ���� ����
      vnt_test nt_typ;
    BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- FIRST�� LAST �޼ҵ带 FOR������ ����� �÷��� ���� ���
      FOR i IN vnt_test.FIRST..vnt_test.LAST
      LOOP

        DBMS_OUTPUT.PUT_LINE(i || '��° ��� ��: ' || vnt_test(i));
      END LOOP;

    END;


-------------------------
EXISTS �޼ҵ� 
	�����ϴ��� �Ǵ�
 
 DECLARE
      -- ��ø ���̺� ����
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- ���� ����
      vnt_test nt_typ;
 BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- FIRST�� LAST �޼ҵ带 FOR������ ����� �÷��� ���� ���
      FOR i IN vnt_test.FIRST..vnt_test.LAST
      LOOP
		IF vnt_test.EXISTS(2) THEN 
			DBMS_OUTPUT.PUT_LINE( vnt_test(2));
		END IF;
      END LOOP;
END;


-------------------------

COUNT �޼ҵ�
	�迭�� ��Ұ� � �ֳ� ��
	�÷��ǿ���� �� ���� ��ȯ


VARRAY �� COUNT���� LIMIT���� ����(�߰��� ����ִ°��� ����)
�����迭�̳� ��ø���̺��� LIMIT ���Ұ�(�ִ�ġ �� ��� �߰��Ҽ������ϱ�.)

-------------------------
LIMIT �޼ҵ�
	�÷����� ���� �� �ִ� ����� �ִ� ���� ��ȯ



-- ���⼭ ������ �����迭�� NEXT�� �����ϱ�...
DECLARE 
      -- ��ø ���̺� ����
      TYPE nt_typ IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10);
	  V_CNT PLS_INTEGER := 0
      -- ���� ����
      vnt_test nt_typ;
    BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test('1') := '��';
      vnt_test('2') := 'A';
      vnt_test('3') := 'G';
      vnt_test('4') := 'D';
      vnt_test('5') := 'S';
      
      LOOP
      	V_CNT := V_CNT+1;
      	EXIT WHEN V_CNT > vnt_test.COUNT;
      	DBMS_OUTPUT.PUT_LINE(vnt_test(CHR(64+V_CNT)));
      END LOOP;
END;



-------------------------------
PRIOR �޼ҵ�
	����� ����
	
	
NEXT �޼ҵ�
	����� ����

--------------------------



����� ���� Ÿ��
TYPE�� ���� DB�� ����� �� ���� 

VARCHAR2ó�� ������Ÿ���� ���� ����� �� ���� 

? VARRAY : CREATE OR REPLACE TYPE Ÿ�Ը� IS VARRAY(�ִ� ũ��) OF ��Ÿ�� ;
? ��ø ���̺� : CREATE OR REPLACE TYPE Ÿ�Ը� IS TABLE OF ��Ÿ�� ;
? OBJECT : CREATE OR REPLACE TYPE Ÿ�Ը� IS OBJECT (
               ���1 ���1_������Ÿ��,
               ���2 ���2_������Ÿ��,
               ...
               );



-------------------------

������ �÷���
	N X N �� ������ �迭 



-----------------------


�����迭, ��ø���̺� ��� 2���̻� ��� �� �� �ִ°� �ִµ�..
�����迭
	���� �� �� ���°�
	
VARRAY �� ��ø���̺�
	FOR�������� �������ϰ� ������ ���°�




==============================================

�ڹٸ� �ٷ�� ��� 

ȭ���� ���� FILE I/O ��ǥ 

�ڹ� 

Class ��� Ŭ���� 
	�̰� �̿��ؼ� �ʿ��Ҷ� Ŭ������ ����� �� �� ����

���ʸ� 
	Stack<T> st
	Stack<T extends String> st
	Type�� �������� ���̳����ϰ� ��밡��
	Ŭ���� ���ʸ�
	�޼ҵ� ���ʸ�  
	C������ Template�̶�� �� 

���÷���
	���ڿ��� Ŭ������ �ε��ؼ� Ŭ���� �������ִ°� 
	���� ���α׷��� �� ��
	�������� Ŭ������ �ε��� ��ü�������� 



������ ����Ϻ��� �̰� ���� 
������ ���� �ۼ�
���� ���� �ۼ� 

�ڹ� �� �ϱ����� �⺻����
1. ���ʸ�
2. file I/O
3. ���÷���
4. ������ 

���ʸ� ; ����
���� ; ��
���÷��� ; ���� 

���ʸ��� ������� �� �ڽ�Ŭ�������� ��� �ǰ� ��� �ȵǴ��� 


���� I/O
�����ڵ忡 ���� ���� 
�ڹٿ��� �޸𸮿� �ö󰡴� �� �����ڵ�� �ؼ� �ø��µ� ���������� �����Ҷ� euckr 
���� ��ۿ��� �ؼ� euckr���� �����ڵ�� �ѱ����
file�� byte������ �дµ� �갡 ������ ������ ��� ����ϴ��� 
	Byte������ �� int������ �ٲ㼭 üũ�ϴ���?
	������ ���� ��� üũ�ϴ���
	euckr���� �����ڵ�� �ѱ� �� � ��Ŀ������ �ִ���


���÷���
	jdbc����̹� �ε��Ҷ� ���� �� 
	class.forName �� static�޼ҵ� 
	Ŭ���� �ε��ؼ� ����ڰ� �� �� �ְ� �ʱ�ȭ�ϴ°� 
	
������ 
	���μ�����  ������ �������� 
	rock , sincro 
	������ �Ұ����ϴϱ� (�����ٸ��� CPU�� �ϱ⶧����_) ����� ��ٷο� 
	
	singleton ���α׷��� �� ���� ���� ���¸� �����ϸ� �ȵ� (������ �Ǿ ���°� �ٲ�)
	������� �����ڿ��� �� ������ �߻� 
		�����߿� �ٸ��� ���ÿ� ����Ǽ� ���� ���� ����..



 
























