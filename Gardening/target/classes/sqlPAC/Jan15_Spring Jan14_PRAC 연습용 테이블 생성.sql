
SELECT * FROM TABS;
SELECT * FROM MEMBERINFO;
commit;

-- id�� pk�� ����  
CREATE TABLE MEMBERINFO (
	memberid  VARCHAR2(100) NOT NULL  PRIMARY KEY,
	memberpassword  VARCHAR2(100) NOT NULL,
	membergender  VARCHAR2(50) NOT NULL     -- W;���� M;����
)
;

INSERT INTO MEMBERINFO (memberid, memberpassword, membergender)
VALUES (
	'lidiapark122222@gmail.com' ,
	'12123334' ,
	'M' 
)
;


-- select
SELECT memberid, memberpassword,  membergender
FROM MEMBERINFO 
WHERE memberid = :ID
;


-- selectAll
SELECT memberid, memberpassword,  membergender
FROM MEMBERINFO 
;

-- insert 
INSERT INTO MEMBERINFO 
( memberid, memberpassword,  membergender  ) 
VALUES 
(:A, :B, :C)
;

-- delete
DELETE FROM MEMBERINFO
WHERE memberid = :D
;











