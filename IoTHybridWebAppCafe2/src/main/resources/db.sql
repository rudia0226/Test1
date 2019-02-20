create table ihwac2_sns(
	is_no number(5) primary key,			-- �� ��ȣ
	is_owner varchar2(10 char) not null,	-- �۾��� id
	is_txt varchar2(350 char) not null,
	is_date date not null,
	is_color number(1) not null
);
create sequence ihwac2_sns_seq;
------------------------------------------
create table ihwac2_sns_repl(
	isr_no number(7) primary key,			-- ��� ��ȣ
	isr_is_no number(5) not null,			-- �Ҽ� �� ��ȣ
	isr_owner varchar2(10 char) not null,	-- ��� �� ���
	isr_txt varchar2(150 char) not null,	-- ��� ����
	isr_date date not null
);
create sequence ihwac2_sns_repl_seq;
------------------------------------------
create table ihwac2_member(
	im_id varchar2(10 char) primary key,
	im_pw varchar2(10 char) not null,
	im_name varchar2(10 char) not null,
	im_addr1 char(5 char) not null,			-- �����ȣ
	im_addr2 varchar2(100 char) not null,
	im_addr3 varchar2(100 char) not null,
	im_img varchar2(200 char) not null
);
select * from ihwac2_member;
------------------------------------------
create table ihwac2_msg(
	im_no number(7) primary key,
	im_from varchar2(10 char) not null,
	im_to varchar2(10 char) not null,
	im_txt varchar2(350 char) not null,
	im_date date not null
);

create sequence ihwac2_msg_seq;
select * from ihwac2_msg;
------------------------------------------
create table ihwac2_vote(
	iv_title varchar2(100 char) primary key,
	iv_owner varchar2(10 char) not null,
	iv_count number(3) not null
);
select * from ihwac2_vote;
insert into ihwac2_vote values('�׽�Ʈ', 'kwon', 0);
------------------------------------------
create table ihwac2_vote_item(
	ivi_no number(9) primary key,	-- ��ǥ �׸� ��ȣ
	ivi_item varchar2(150 char) not null,
	ivi_count number(3) not null,
	ivi_percent number(5, 4) not null
);

select * from ihwac2_vote_item;
--------------------------------------------------
create table ihwac2_vote_vote(
	ivv_im_id varchar2(10 char) primary key,	-- ��ǥ �� ���id
	ivv_ivi_no number(9) not null			-- ��ǥ�׸� ��ȣ
);

select * from ihwac2_vote_vote;
--------------------------------------------------
drop table ihwac2_dataroom cascade constraint purge;
create table ihwac2_dataroom(
	id_id number(5) primary key,
	id_owner varchar2(10 char) not null,
	id_title varchar2(30 char) not null,
	id_file varchar2(200 char) not null,
	id_date date not null
);
create sequence ihwac2_dataroom_seq;
select * from IHWAC2_DATAROOM;
