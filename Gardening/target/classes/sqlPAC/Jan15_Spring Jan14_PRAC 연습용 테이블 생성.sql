
SELECT * FROM TABS;
SELECT * FROM MEMBERINFO;
commit;

-- id를 pk로 설정  
CREATE TABLE MEMBERINFO (
	memberid  VARCHAR2(100) NOT NULL  PRIMARY KEY,
	memberpassword  VARCHAR2(100) NOT NULL,
	membergender  VARCHAR2(50) NOT NULL     -- W;여자 M;남자
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











