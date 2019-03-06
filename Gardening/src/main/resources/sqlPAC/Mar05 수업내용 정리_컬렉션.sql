	
----------------------------------------------------------------------------------------------
�÷���
----------------------------------------------------------------------------------------------

�÷����� ����

1. �����迭 ( JAVA MAP)
   * Ű�� ������ ����
   * Ű�� �ε���
   * Ű-���� �� ���� �̷�� ����Ǿ� �ִ� �迭 ���� => ���� �迭�̶�� ��
   * �迭_��Ÿ���� � ������ Ÿ���̵� �� �� ������, �ε��� Ÿ���� �������̳� PLS_INTEGER Ÿ�Ը� �� �� �ִ�
   * �� ��� ���� ������_�迭_������(�ε���)�� ���·� ����
   * 3���� Ÿ�� �� �����ϰ� ���� �迭�� �����ڸ� ����� �� ����
   * ���� �迭�� �� ũ�⿡ ���� ����.
   * �� ��ҿ� ���� �Է��� ������ ���������δ� �������̵� �������̵� �ε��� ������ ���ĵ�
   
   ���� ) TYPE ����_�迭�� IS TABLE OF ����_�迭_��Ÿ�� INDEX BY �ε���Ÿ��;
   
   
   CREATE TABLE STUD_SD ( STUDNO NUMBER(3) , STD_INFO VARCHAR2(1000))
   
	DECLARE
    
      
      I PLS_INTEGER := 0;     
      V_TCNT PLS_INTEGER  := 0;
      
        -- ����-���� ���� ���� �迭 ����
      TYPE STD_COLTYPE IS TABLE OF VARCHAR2(1000) INDEX BY PLS_INTEGER;

      -- ���� �迭 ���� ����
      CAV_STDINFO STD_COLTYPE;
      
      CURSOR STD_CUR IS
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;    
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
    BEGIN    
                
        EXECUTE IMMEDIATE 'TRUNCATE TABLE STUD_SD' ;
        
         OPEN STD_CUR ;
         
         LOOP
         
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            I := I+1 ;        
            
            CAV_STDINFO(V_STD_REC.STUDNO) := V_STD_REC.STD_INFO ;
          
           IF MOD(I,2) = 0 THEN 
                DBMS_OUTPUT.PUT_LINE(I) ;
                DBMS_OUTPUT.PUT_LINE(CAV_STDINFO(V_STD_REC.STUDNO)) ;   
                INSERT INTO  STUD_SD VALUES( V_STD_REC.STUDNO, CAV_STDINFO(V_STD_REC.STUDNO)) ;
                      
           END IF;
           
           COMMIT ;
            
         END LOOP ;      
    END;
	
2. VARRAY
   * Variable-Size Array �� ���� ���� �迭�μ� ���� �迭���� �޸� �� ũ�⿡ ����
   * ������ �� ũ��(��� ����)�� ����
   * VARRAY�� ��������(�ε���)�� ���·� �ش� ��� ���� ����
   * ���� �迭�� �ε����� �������̳� PLS_INTEGER ���� ����� �� ������ VARRAY�� �ε����� ���ڸ� ����
   * ����ڰ� ������ �ε��� Ÿ���� �����ϴ� ���� �ƴ϶� �ڵ����� ������ �Ű����� �ּڰ��� 1
   **  VARRAY�� �����ڸ� ����� �ʱ�ȭ�ϱ� �������� �� ��ҿ� ���� �Ҵ��ϰų� �о� �� �� ����
        �ʱ�ȭ ���� ���� �Ҵ��ϰų� ������ ���� ������ �߻�
   * �����ڴ� ��VARRAY��(��1, ��2, ��)�� ���·� ���		
   * ��� �߰��߰��� ���� ��� ���� ���� �ִ�(��� �߰��� ���� ��� �ִٰ� �ؼ� �� ��Ұ� �������� �ʴ� ���� �ƴϴ�). 
   
   ����)   TYPE VARRAY�� IS VARRAY(�ִ� ũ��) OF ��Ұ�_Ÿ��;
      
    
   DECLARE
      -- 5���� ������ ��(ũ��� 5)���� �̷���� VARRAY ����
      TYPE STD_COLTYPE IS VARRAY(10) OF VARCHAR2(1000);

      -- VARRY ���� ����
      CVA_REC STD_COLTYPE;

    CURSOR STD_CUR IS
    
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
      VN_CNT NUMBER := 0;
      
    BEGIN
      
         OPEN STD_CUR ;
         
         CVA_REC := STD_COLTYPE('','','','','','','','','','') ;         
		 
        LOOP
      
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            VN_CNT := VN_CNT + 1;
        -- ũ�Ⱑ 5�̹Ƿ� 5ȸ ������ ���鼭 �� ��� �� ���
        
            IF VN_CNT <= 10 THEN       
              -- VARRY ��� �� ���
              --  DBMS_OUTPUT.PUT_LINE(VN_CNT);        
                CVA_REC(VN_CNT) := V_STD_REC.STD_INFO ;            
            END IF;
            
      END LOOP;
      
      VN_CNT := 10 ;
      
	  FOR I IN 1.. VN_CNT
	  LOOP 
		DBMS_OUTPUT.PUT_LINE(CVA_REC(I)) ;
	  END LOOP ;
    
    END;
    
   
	
3. ��ø ���̺�
	*  ��ø ���̺��� ũ�⿡ ������ ���ٴ� ���� ���� �迭�� ������, 
	   ������ �ε����� ����� �� �ְ� �����ڸ� ����ϸ� �Ϲ� ���̺��� �÷� Ÿ������ ���� �� �ִٴ� ���� VARRAY�� ����.
	   
	* VARRAY�� �޸� �ִ� ũ�⸦ �������� �����Ƿ� ũ�⿡ ������ ���� �������� ��� �þ �� �ִ�   
	
	����) TYPE ��ø_���̺�� IS TABLE OF ��Ÿ�� ;
	
	
	 DECLARE
      -- 5���� ������ ��(ũ��� 5)���� �̷���� VARRAY ����
      TYPE NT_COLTYPE IS TABLE OF VARCHAR2(1000);

      -- VARRY ���� ����
      CVNT_REC NT_COLTYPE;

    CURSOR STD_CUR IS    
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
      VN_CNT NUMBER := 0;
      
    BEGIN
      
         OPEN STD_CUR ;
         
         CVNT_REC := NT_COLTYPE(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL) ;         
         
        LOOP
      
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            VN_CNT := VN_CNT + 1;
        -- ũ�Ⱑ 5�̹Ƿ� 5ȸ ������ ���鼭 �� ��� �� ���
        
            IF VN_CNT <= 10 THEN       
              -- VARRY ��� �� ���
              --  DBMS_OUTPUT.PUT_LINE(VN_CNT);        
                CVNT_REC(VN_CNT) := V_STD_REC.STD_INFO ;            
            END IF;
            
      END LOOP;
      
      VN_CNT := 10 ;
      
      FOR I IN 1.. VN_CNT
      LOOP 
        DBMS_OUTPUT.PUT_LINE(CVNT_REC(I)) ;
      END LOOP ;
    
    END;    
	
------------
�÷��� �޼ҵ�
------------

�÷����� ��ҿ� ������ ���� �������� �����ϰ� �����ϴ� ����� �ϴ� �Ϸ��� ��Ʈ�� ���ν����� �Լ�

DELETE	���ν���	�÷���
TRIM	���ν���	"VARRAY / ��ø ���̺�"
EXTEND	���ν���	"VARRAY / ��ø ���̺�"
EXISTS	�Լ�	"VARRAY / ��ø ���̺�"
FIRST	�Լ�	�÷���
LAST	�Լ�	�÷���
COUNT	�Լ�	�÷���
LIMIT	�Լ�	�÷���
PRIOR	�Լ�	�÷���
NEXT	�Լ�	�÷���


---------------
1. DELETE �޼ҵ�
* �Ű������� �����ϸ� ��� ��ü�� �����ϸ�, (from, to)���·� 2���� �Ű������� �ѱ�� �� �����ȿ� ���� ��� ��Ҹ� ����
---------------

	DECLARE
      -- ����-���� ���� ���� �迭 ����
      TYPE av_type IS TABLE OF VARCHAR2(40) INDEX BY VARCHAR2(10);

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

---------------
2. TRIM �޼ҵ�
* VARRAY�� ��ø ���̺��� �� ���������� �Ű������� �ѱ� ������ŭ �ش� ��Ҹ� ����
---------------
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
      DBMS_OUTPUT.PUT_LINE(vnt_test(4));    -- ���� �߻�, 2�� ���������Ƿ� 3���� �����ֱ� ����

    EXCEPTION WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
      DBMS_OUTPUT.PUT_LINE( DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    END;
	
---------------
2-1. EXISTS	
---------------

DECLARE
      -- ��ø ���̺� ����
      TYPE nt_typ IS TABLE OF VARCHAR2(10);

      -- ���� ����
      vnt_test nt_typ;
    BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');

      -- FIRST�� LAST �޼ҵ带 FOR������ ����� �÷��� ���� ���
      
        --DBMS_OUTPUT.PUT_LINE ();
        IF  vnt_test.EXISTS(2) THEN
                DBMS_OUTPUT.PUT_LINE (vnt_test(2));
        END IF ;                

  END  ;
  
---------------
3. EXTEND

TRIM���� �ݴ�� VARRAY�� ��ø ���̺��� ���� ��Ҹ� �߰��ϴ� ����� �����ϸ�, ������ ���� 3���� ���·� ���ȴ�.
 ? EXTEND        �� �ش� �÷����� �� ���� NULL�� ��� �ϳ��� �߰��Ѵ�.
 ? EXTEND (n)    �� �ش� �÷����� �� ���� ���� NULL�� ��Ҹ� n�� �߰��Ѵ�.
 ? EXTEND (n, i) �� �ش� �÷����� i��°�� �ִ� ��Ҹ� �� ���� n�� ������ �߰��Ѵ�.
---------------

 DECLARE
      -- 5���� ������ ��(ũ��� 5)���� �̷���� VARRAY ����
      TYPE NT_COLTYPE IS TABLE OF VARCHAR2(1000);

      -- VARRY ���� ����
      CVNT_REC NT_COLTYPE;

    CURSOR STD_CUR IS    
      SELECT STUDNO,
            NAME     ||' / '||
            ID       ||' / '||
            GRADE    ||' / '||    
            JUMIN    ||' / '||
            BIRTHDAY ||' / '||    
            TEL      ||' / '||
            HEIGHT   ||' / '||    
            WEIGHT   ||' / '||    
            DEPTNO1  ||' / '||    
            DEPTNO2  ||' / '||    
            PROFNO   STD_INFO
     FROM STUDENT ;
      
      V_STD_REC STD_CUR%ROWTYPE ;
      
      VN_CNT NUMBER := 0;
      
    BEGIN
      
         OPEN STD_CUR ;
         
         CVNT_REC := NT_COLTYPE() ;  -- EMPTY �ʱ�ȭ       
         
        LOOP
      
            FETCH STD_CUR INTO V_STD_REC;
            EXIT WHEN  STD_CUR%NOTFOUND ;
            
            CVNT_REC.EXTEND ; -- Ȯ�� �� �Է�
            
            VN_CNT := VN_CNT + 1;
        
            DBMS_OUTPUT.PUT_LINE(VN_CNT);        
            CVNT_REC(VN_CNT) := V_STD_REC.STD_INFO ; 
            
      END LOOP;     
      
      
      FOR I IN 1.. VN_CNT
      LOOP 
        DBMS_OUTPUT.PUT_LINE(CVNT_REC(I)) ;
      END LOOP ;
    
    END;    
	
EXISTS

---------------
FIRST
LAST
* �Ű����� ���� ���� �÷����� ù ��°�� ������ ����� �ε����� ��ȯ
* ��� �÷��ǰ���
---------------

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

---------------
COUNT
LIMIT
*  COUNT�� �÷����� ��� ������ ��ȯ�ϴ� �޼ҵ��. VARRAY�� ��� �Ϻθ�, 
   �� �߰��� �ִ� ��Ҹ� ������ �� ���� ������ COUNT�� LAST �޼ҵ��� ��ȯ ���� ����

*  LIMIT �޼ҵ�� �ش� �÷����� ���� �� �ִ� ����� �ִ� ���� ��ȯ
* ��� �÷��ǰ���
---------------	

  DECLARE

      TYPE nt_typ IS TABLE OF VARCHAR2(10);      -- ��ø���̺� ����
      TYPE va_type IS VARRAY(5) OF VARCHAR2(10); -- VARRAY ����

      -- ���� ����
      vnt_test nt_typ;
      vva_test va_type;
    BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test := nt_typ('FIRST', 'SECOND', 'THIRD', 'FOURTH'); -- ��ø���̺�
      vva_test := va_type('ù��°', '�ι�°', '����°', '�׹�°'); -- VARRAY

      DBMS_OUTPUT.PUT_LINE('VARRAY COUNT: ' || vva_test.COUNT);
      DBMS_OUTPUT.PUT_LINE('��ø���̺� COUNT: ' || vnt_test.COUNT);

      DBMS_OUTPUT.PUT_LINE('VARRAY LIMIT: ' || vva_test.LIMIT);
      DBMS_OUTPUT.PUT_LINE('��ø���̺� LIMIT: ' || vnt_test.LIMIT);

    END;
--------
	����
---------
DECLARE
      -- ���� �迭 ����
      TYPE nt_typ IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10) ;
      -- ���� ����
      vnt_test nt_typ;
      
      V_CNT PLS_INTEGER := 0 ;
      
    BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test('A') := '1-' ;
      vnt_test('B') := '2--';
      vnt_test('C') := '3---';
      vnt_test('D') := '4----';
      vnt_test('E') := '5-----';
      
      LOOP
        
        V_CNT := V_CNT +1;
        EXIT WHEN V_CNT > vnt_test.COUNT ;
        DBMS_OUTPUT.PUT_LINE(vnt_test(CHR(64+V_CNT))) ;
        
      END LOOP ;
    END;	
	
-------------
PRIOR
NEXT
* ��� �÷��ǰ���
--------------
DECLARE
  TYPE nt_typ IS TABLE OF VARCHAR2(10) INDEX BY VARCHAR2(10) ;
      -- ���� ����
      vnt_test nt_typ;
      
      V_CNT PLS_INTEGER := 0 ;
      
    BEGIN
      -- �����ڸ� ����� �� �Ҵ�
      vnt_test('A') := '1-' ;
      vnt_test('B') := '2--';
      vnt_test('C') := '3---';
      vnt_test('D') := '4----';
      vnt_test('E') := '5-----';

      DBMS_OUTPUT.PUT_LINE('FIRST�� PRIOR : ' || vnt_test.PRIOR(vnt_test.FIRST));
      DBMS_OUTPUT.PUT_LINE('LAST�� NEXT : ' || vnt_test.NEXT(vnt_test.LAST));

      DBMS_OUTPUT.PUT_LINE('�ε���B�� PRIOR :' || vnt_test.PRIOR('B'));
      DBMS_OUTPUT.PUT_LINE('�ε���B�� NEXT :' || vnt_test.NEXT('B'));

    END;

---------------------------
����� ���� ������ Ÿ��	
---------------------------