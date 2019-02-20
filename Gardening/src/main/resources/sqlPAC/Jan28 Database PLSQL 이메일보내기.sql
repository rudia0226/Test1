DECLARE 
	VV_HOST VARCHAR2(30) := 'localhost'; --SMTP ������
	VV_PORT NUMBER := 21;  -- PORT ��ȣ
	VV_DOMAIN VARCHAR2(30) := 'hong.com' -- �����θ�
	VV_FROM VARCHAR2(50) := 'lidia0226@naver.com' -- ������ �ּ�
	VV_TO VARCHAR2(50) := 'lidia0226@naver.com' -- �޴��ּ�

	C UTL_SMTP.CONNECTION;
	VV_HTML VARCHAR2(200); -- HTML �޼����� ���� ���� 
BEGIN 
	C := UTL_SMTP.OPEN_CONNECTION(VV_HOST, VN_PORT);
	
	UTL_SMPT.HELO(C, VV_DOMAIN); -- HELO
	UTL_SMPT.MAIL(C, VV_FROM); -- �����»��
	UTL_SMPT.RCPT(C, VV_TO);  -- �޴»��
	
	UTL_SMPT.OPEN_DATA(C);
	UTL_SMPT.WRITE_DATA(C, 'MIME-Version: 1.0' || UTL_TCP.CRLF); --MIME����
	UTL_SMPT.WRITE_DATA(C, 'Content-Type: text/html; charset="euc-kr"' || UTL_TCP.CRLF);
	
	UTL_SMPT.WRITE_RAW_DATA(C, UTL_RAW.CAST_TO_RAW('From: ' || '"�ڷ���"<lidia0226@naver.com>' || UTL_TCP.CRLF); -- �����»��
	UTL_SMPT.WRITE_RAW_DATA(C, UTL_RAW.CAST_TO_RAW('To: ' || '"�ڷ���"<lidia0226@naver.com>' || UTL_TCP.CRLF); -- �޴»��
	UTL_SMPT.WRITE_RAW_DATA(C, UTL_RAW.CAST_TO_RAW('Subject : HTML �׽�Ʈ ���� ' || UTL_TCP.CRLF); -- ����
	UTL_SMTP.WRITE_DATA(C, UTL_TCP.CRLF); -- ���� ����
	
	-- HTML ������ �ۼ�
      vv_html := '<HEAD>
       <TITLE>HTML �׽�Ʈ</TITLE>
     </HEAD>
     <BDOY>
        <p>�� ������ <b>HTML</b> <i>����</i> ���� </p>
        <p>�ۼ��� <strong>����</strong>�Դϴ�. </p>
     </BODY>
    </HTML>';
	
  -- ���� ����
      UTL_SMTP.WRITE_RAW_DATA(c, UTL_RAW.CAST_TO_RAW(vv_html || UTL_TCP.CRLF)  );

      UTL_SMTP.CLOSE_DATA(c); -- ���� ���� �ۼ� ����
      UTL_SMTP.QUIT(c);  -- ���� ���� ����

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

	
	
	
	
	