DECLARE 
	VV_HOST VARCHAR2(30) := 'localhost'; --SMTP 서버명
	VV_PORT NUMBER := 21;  -- PORT 번호
	VV_DOMAIN VARCHAR2(30) := 'hong.com' -- 도메인명
	VV_FROM VARCHAR2(50) := 'lidia0226@naver.com' -- 보내는 주소
	VV_TO VARCHAR2(50) := 'lidia0226@naver.com' -- 받는주소

	C UTL_SMTP.CONNECTION;
	VV_HTML VARCHAR2(200); -- HTML 메세지를 담을 변수 
BEGIN 
	C := UTL_SMTP.OPEN_CONNECTION(VV_HOST, VN_PORT);
	
	UTL_SMPT.HELO(C, VV_DOMAIN); -- HELO
	UTL_SMPT.MAIL(C, VV_FROM); -- 보내는사람
	UTL_SMPT.RCPT(C, VV_TO);  -- 받는사람
	
	UTL_SMPT.OPEN_DATA(C);
	UTL_SMPT.WRITE_DATA(C, 'MIME-Version: 1.0' || UTL_TCP.CRLF); --MIME버젼
	UTL_SMPT.WRITE_DATA(C, 'Content-Type: text/html; charset="euc-kr"' || UTL_TCP.CRLF);
	
	UTL_SMPT.WRITE_RAW_DATA(C, UTL_RAW.CAST_TO_RAW('From: ' || '"박루디아"<lidia0226@naver.com>' || UTL_TCP.CRLF); -- 보내는사람
	UTL_SMPT.WRITE_RAW_DATA(C, UTL_RAW.CAST_TO_RAW('To: ' || '"박루디아"<lidia0226@naver.com>' || UTL_TCP.CRLF); -- 받는사람
	UTL_SMPT.WRITE_RAW_DATA(C, UTL_RAW.CAST_TO_RAW('Subject : HTML 테스트 메일 ' || UTL_TCP.CRLF); -- 제목
	UTL_SMTP.WRITE_DATA(C, UTL_TCP.CRLF); -- 한줄 띄우기
	
	-- HTML 본문을 작성
      vv_html := '<HEAD>
       <TITLE>HTML 테스트</TITLE>
     </HEAD>
     <BDOY>
        <p>이 메일은 <b>HTML</b> <i>버전</i> 으로 </p>
        <p>작성된 <strong>메일</strong>입니다. </p>
     </BODY>
    </HTML>';
	
  -- 메일 본문
      UTL_SMTP.WRITE_RAW_DATA(c, UTL_RAW.CAST_TO_RAW(vv_html || UTL_TCP.CRLF)  );

      UTL_SMTP.CLOSE_DATA(c); -- 메일 본문 작성 종료
      UTL_SMTP.QUIT(c);  -- 메일 세션 종료

    EXCEPTION
      WHEN UTL_SMTP.INVALID_OPERATION THEN
           dbms_output.put_line(' Invalid Operation in Mail attempt using UTL_SMTP.');
           dbms_output.put_line(sqlerrm);
           UTL_SMTP.QUIT(c);
      WHEN UTL_SMTP.TRANSIENT_ERROR THEN
           dbms_output.put_line(' Temporary e-mail issue - try again');
           UTL_SMTP.QUIT(c);
      WHEN UTL_SMTP.PERMANENT_ERROR THEN
           dbms_output.put_line(' Permanent Error Encountered.');
           dbms_output.put_line(sqlerrm);
           UTL_SMTP.QUIT(c);
      WHEN OTHERS THEN
         dbms_output.put_line(sqlerrm);
         UTL_SMTP.QUIT(c);
    END;

	
	
	
	
	