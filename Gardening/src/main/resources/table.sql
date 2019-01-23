

-- 2018-09-19

-- db 가 먼저
-- db 필드명 보고  요청파라메터 명, javaBean 의 멤버변수명 정하는것


-- 테이블 만들기 (회원)
create  table  garden_member (
	m_id  varchar2(8 char)  primary key,
	m_pw varchar2(8 char) not null,
	m_name  varchar2(8 char) not null,
	m_birth  date not null
);

-- 테이블 확인
select * from garden_member;

-- 2018-09-19


-- 2018-10-02 : table 만들기 : trees 게시판

create  table  garden_menu(
	s_name  varchar2(50 char)  primary key,
	e_name varchar2(50 char)  not null,
	p_img  varchar2(100 char) not null
);

select * from garden_menu;

-- table 겁나 깔끔하게 지우기 (이렇게 안쓰면 .. 휴지통으로 가서 용량차지하게됨)
drop table garden_menu cascade constraint purge;

-- 2018-10-02 : table 만들기 : trees 게시판



-- 2018-10-04 :  데이터가 없을때 게시판에서 검색하면 어떤지 확인하기 위해 지워보자!
select * from garden_menu;
delete from garden_menu;

drop table garden_menu purge;



-- 2018-10-17 : 방명록 게시판 sns.jsp 를 위한 db

-- 댓글쓴사람 테이블
garden_sns

cs_no     : 글번호
cs_owner    : 글쓴이
cs_date   : 날짜
cs_txt   : 내용

create table garden_sns(
	cs_no  number(5) primary key,
	cs_owner  varchar2(8 char) not null,
	cs_date date not null,
	cs_txt varchar2(200 char)
);
	
select * from garden_sns;


-- 시퀀스
create  sequence garden_sns_seq;


-- 댓글테이블
garden_sns_repl

댓글번호
소속된 글번호
쓴사람
(조인)날짜
(조인)내용

create table garden_sns_repl(
	csr_no number(6) primary key,     -- sequence / 댓글 ID
	csr_cs_no number(5) not null,			-- 원본글의 ID
	csr_owner varchar2(8 char) not null,  -- session
	csr_date date not null,							-- sysdate
	csr_txt varchar2(100 char) not null		-- input
);

-- 시퀀스
create  sequence garden_sns_repl_seq;



-- 조인할 테이블
garden_member
이랑
garden_sns

-- table 두개 조인하기
select * 
from garden_sns, garden_member 
where cs_owner = m_id;

			select * from garden_sns_repl, garden_member
			where csr_owner = 'rudia';

select * from garden_sns_repl;

select * from garden_sns;



-- 2018-10-18 : 댓글 뿌리기

-- join : 이거도 아냐..
select * 
from  garden_sns_repl, garden_member
where cs_no = csr_cs_no;


-- subquery : 이거도 아냐..
select *
from garden_sns_repl
where csr_cs_no in (
	select  cs_no
	from garden_sns
)

-- ??
-- 자바빈에 댓글 관련 csr 추가.SNSMsg



