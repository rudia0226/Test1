-- Feb26 

트랜젝션 (ALL OR NOTHING)

커밋을 어디서 해줘야 하는지, 커밋해줘야 하는 범위를 정해주는 것이 트랜젝션 
내가 변경한 데이터를 다른사람이 봐도 될 때까지의 범위 

즉, 커밋 단위를 정해주는게 한 트랜젝션


COMMIT; -- 시스템에다 DB를 반영하겠다.
즉, 로그에 먼저 쓰고 DB에 나중에 반영한다.

--WRITE AHEAD ; UNDO FILE 에다가 먼저 씀 (파일로 보관 ) 
--DB 시스템이 죽거나 특정시간으로 되돌리고 싶을 때 저 파일을 백그라운드 포로세서에 올려서 그걸 DB로 다운 


예제 ; 프로시저 
P_CNTTEST

TBL 정보 ; PTEST 


CREATE OR REPLACE PROCEDURE P_CNTTEST
IS

BEGIN
    INSERT INTO PTEST
    SELECT * FROM EXAM_RSLT WHERE ROWNUM =1 ;
    COMMIT; -- 다른사람이 이 변경사항을 봐도 됨 (COMMIT 안하면 다른사람들이 보면 안되는 작업) 
    DBMS_OUTPUT.PUT_LINE('SUCCESS');     
END ;

EXEC P_CNTTEST
;

TRUNCATE TABLE TTEST;
SELECT * FROM PTEST;

COMMIT 하기 전에는 동일 세션에서 다른 사람에겐 이 작업이 안보이고
COMMIT 하고 나면 동일 세션에서 다른 사람들에게도 이 작업의 결과가 보임 


=======================

SAVEPOINT 
-- 저장의 시점을 주어 그 부분으로 ROLLBACK

P_TRANS01

CREATE OR REPLACE PROCEDURE P_TRANS01 
IS
 ERR_GRD_TEST EXCEPTION; 
 PRAGMA EXCEPTION_INIT (ERR_GRD_TEST, -20101); 

BEGIN

    EXECUTE IMMEDIATE 'TRUNCATE TABLE PTEST' ;   -- 문자열을 명령문으로 바꿔서 실행시켜줌 
    
    INSERT INTO PTEST
    SELECT * 
    FROM EXAM_RSLT 
    WHERE GRADE =1 ;
    
    DBMS_OUTPUT.PUT_LINE (' SAVEPOINT GRD_1_SUC => 성공 ') ;
    
    SAVEPOINT GRD_1_SUC ;
    
    INSERT INTO PTEST
    SELECT * 
    FROM EXAM_RSLT 
    WHERE GRADE =2 ;
    
    RAISE_APPLICATION_ERROR (-20101, '1학년만 입력되어야 함');  -- 여기서 오류 발생  (SAVEPOINT까지 돌아가서 그 전에 수행된것만 COMMIT) 
     
    EXCEPTION WHEN ERR_GRD_TEST THEN
    DBMS_OUTPUT.PUT_LINE(SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    ROLLBACK TO GRD_1_SUC ; -- SAVEPOINT 까지만 ROLLBACK

    COMMIT;   -- SAVEPOINT 이전까지는 COMMIT   
            
END ;



여러개의 SAVEPOINT 가 있다면 조건을 주고 그 안에 해당 EXCEPTION을 주어서 해당 SAVEPOINT로 ROLLBACK해주도록 함























