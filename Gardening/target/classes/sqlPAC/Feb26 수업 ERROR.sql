-- Feb26 
PLSQL 에서 ERROR는 BATCH처리 할 때 나오는 에러에 관한 것을 로그로 해서 뭐가 잘못된건지 확인 하기 위함 


P_WISE_PROC8
-- 사용자 정의 에러코드는 해당 범위 안에 만들어줘야 함 -20000 부터 -20999 까지 

CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS
 
 ERR_NAGATIVE_VALUE EXCEPTION; 
 
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -21000); 
 
BEGIN

  IF VN_NUM <= 0 THEN        
     RAISE ERR_NAGATIVE_VALUE;     
  END IF;

    DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN ERR_NAGATIVE_VALUE THEN
      DBMS_OUTPUT.PUT_LINE('등록코드 : '||SQLCODE);
      DBMS_OUTPUT.PUT_LINE('등록메세지 : '||SQLERRM);
END;
========================

이렇게 코드넘버를 범위안에 해주면 제대로 수행됨 
;

CREATE OR REPLACE PROCEDURE P_WISE_PROC8( VN_NUM IN NUMBER)
AS
 
 ERR_NAGATIVE_VALUE EXCEPTION; -- 1번
 PRAGMA EXCEPTION_INIT (ERR_NAGATIVE_VALUE, -20100);  -- 2번
 
BEGIN

  IF VN_NUM <= 0 THEN        
     RAISE ERR_NAGATIVE_VALUE;     -- 3번 
  END IF;

    DBMS_OUTPUT.PUT_LINE(VN_NUM);

    EXCEPTION
     WHEN ERR_NAGATIVE_VALUE THEN -- 3번
      DBMS_OUTPUT.PUT_LINE('등록코드 : '||SQLCODE);
      DBMS_OUTPUT.PUT_LINE('등록메세지 : '||SQLERRM);
END;



에러메세지
-- 에러코드 에러메세지 를 매핑하는 방법 1~3번 

EXEC P_WISE_PROC8(-5)



명칭
명칭 에러코드 
에러코드 에러메세지














