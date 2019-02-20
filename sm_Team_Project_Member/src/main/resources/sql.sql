
/*�쉶�썝 �젙蹂�*/
create table User_info(
	User_Email	varchar2(40) PRIMARY KEY,
	User_Name	varchar2(20),
	User_Pw 		varchar2(20),
	User_Birth 	varchar2(10),	-- date? varchar2?	
	User_Sex		varchar2(10),
	Goal_Amount  number(10),
	join_Date  date
);

 alter table user_info add join_date date;

 
select * from User_info;

drop table User_info purge;
drop table book_data purge;
drop table board_data purge;

drop table User_info purge;
select * from Ca_info;

select * from BOOK_DATA where user_email ='evergreen@gmail.com';


/*�떎�젣 �엯異쒓툑 �궡�슜�쓣 湲곕줉�븯�뒗 媛�怨꾨�*/
create table Book_data(
	Data_No 		number PRIMARY KEY,
	
	Data_Date 		date,
	Data_Amount 	number,
	Data_Memo 		varchar2(200),
	
	User_Email 		varchar2(40),
	Ca_Key 			number,
	Pay_Id 			number
);
	
select * from BOOK_DATA

/*寃뚯떆�뙋(硫붾え)*/
create table Board_data(
	Board_Id 		number PRIMARY KEY,
	Board_Title 	varchar2(30),
	Board_Content 	varchar2(200),
	
	User_Email 		varchar2(40)
);
select * from Board_data;

drop SEQUENCE Board_data_Seq;
drop SEQUENCE Todo_data_Seq;


CREATE SEQUENCE Board_data_Seq
start WITH 1
INCREMENT BY 1
CACHE 24

drop table todo_data purge;

/*To Do List*/
create table Todo_data(
	Todo_Id 	number PRIMARY KEY,
	Todo_Title 	varchar2(500),
	
	User_Email 	varchar2(40)
);


CREATE SEQUENCE Todo_data_Seq
start WITH 1
INCREMENT BY 1
CACHE 24


drop table Ca_info purge;

/*移댄뀒怨좊━ �젙蹂�*/
create table Ca_info(
	Ca_Key 		number PRIMARY KEY,
	User_Email	varchar2(40),
	
	Ca_Group 	number,
	Ca_Type 	number,
	Ca_Value 	varchar2(30),
	Ca_Icon 	number
	
);
select * from Ca_info;


create table goal_data(
	goal_date 		date,
	goal_amount 	number(10),
	goal_email	 	varchar2(40)
);



/*媛�怨꾨� 蹂� 寃곗젣�닔�떒*/
create table Pay_info(
	Pay_Id 		number PRIMARY KEY,
	User_Email	varchar2(40),
	Pay_Value 	varchar2(20)
);
select * from Pay_info where User_Email = 'evergreen@gamil.com';
insert into Pay_info values(1, 'evergreen@gamil.com', '체크카드');
insert into Pay_info values(2, 'evergreen@gamil.com', '신용카드');
insert into Pay_info values(3, 'evergreen@gamil.com', '현금');
insert into Pay_info values(4, 'evergreen@gamil.com', '통장');
insert into Pay_info values(5, 'evergreen@gamil.com', '기타');


update Book_data set ca_key = NULL where data_date= '2018-10-02';
select * from ca_info where ca_Group = 2 and User_Email='evergreen@gmail.com';
select * from ca_info;

select * from Book_data;

select * from Book_data where ca_key is null;

update 


select * from ca_info where ca_Group = 2 and User_Email='evergreen@gmail.com';

update Book_data set data_Date = #{data_Date}, data_Amount = #{data_Amount},data_Memo = #{data_Memo},
			ca_Key = #{ca_Key},pay_Id = #{pay_Id}
			where data_No = #{data_No} and User_Email=#{User_Email}

select * from ca_info where date= '2017-01-02';

drop table Pay_info purge;
select * from Pay_info;

/*�옄�룞�씠泥�(怨좎젙鍮� �젙蹂�)*/
create table Fix_cost(
	Fc_Key 		number PRIMARY KEY,
	Ca_Key 		number,
	User_Email	varchar2(40),
	
	Fc_Date 	date,
	Fc_Name 	varchar2(20),
	Fc_Amount 	number
	
);


/* CHART �뿉 肉뚮젮以� �뜲�씠�꽣 �엯�젰 */
 INSERT ALL
      INTO book_data VALUES (1, '2017-01-02', 1000, '怨쇱옄', 'berry1234@gmail.com', 1, 1)
      INTO book_data VALUES (2, '2017-01-03', 10000, '�빟援�', 'berry1234@gmail.com', 2, 1)
      INTO book_data VALUES (3, '2017-01-04', 4500, '�깮�떆', 'berry1234@gmail.com', 3, 1)
      INTO book_data VALUES (4, '2017-01-05', 213000, '�썡湲�', 'berry1234@gmail.com', 4, 2)
      INTO book_data VALUES (5, '2017-01-06', 2200, '�븰�썝', 'berry1234@gmail.com', 5, 1)
      INTO book_data VALUES (6, '2017-01-06', 2200, '湲고�', 'berry1234@gmail.com', 6, 2)
    SELECT *
      FROM DUAL;

select * from book_DATA where user_email = 'evergreen@gmail.com';

select * from book_data;

select * from Ca_info;

drop table Ca_info purge;

  INSERT ALL
      INTO Ca_info(Ca_Key,User_Email,Ca_Group,Ca_Type,Ca_Value) VALUES (1, 'berry1234@gmail.com', 2, 100,'媛꾩떇')
      INTO Ca_info(Ca_Key,User_Email,Ca_Group,Ca_Type,Ca_Value) VALUES (2, 'berry1234@gmail.com', 2, 200,'�쓽猷�')
      INTO Ca_info(Ca_Key,User_Email,Ca_Group,Ca_Type,Ca_Value) VALUES (3, 'berry1234@gmail.com', 2, 300,'援먰넻')
      INTO Ca_info(Ca_Key,User_Email,Ca_Group,Ca_Type,Ca_Value) VALUES (4, 'berry1234@gmail.com', 1, 400,'�썡湲�')
      INTO Ca_info(Ca_Key,User_Email,Ca_Group,Ca_Type,Ca_Value) VALUES (5, 'berry1234@gmail.com', 2, 500,'援먯쑁')
      INTO Ca_info(Ca_Key,User_Email,Ca_Group,Ca_Type,Ca_Value) VALUES (6, 'berry1234@gmail.com', 1, 600,'湲고�')
    SELECT *
      FROM DUAL;

select * from CA_INFO;
      

INSERT INTO goal_data 
		VALUES (sysdate, 300000, 'berry1234@gmail.com')


SELECT * FROM User_info
		WHERE User_Email ='berry1234@gmail.com'
		
		
update table CA_INFO set  User_Email = 'evergreen@gmail.com';
update book_data set data_date = add_months(data_date, 21);
select * from book_data;

select data_date from book_data;
 

update table CA_INFO drop column User_Email;

alter table Ca_info drop (User_Email);
alter table Ca_info add(User_Email varchar2(30));
update Ca_info set User_Email='evergreen@gmail.com';

select * from Ca_info;

select * from book_data;
update book_data set User_Email='evergreen@gmail.com';


select * 
				from ca_info c  
				inner join book_data b  on c.ca_key = b.ca_key
				inner join pay_info p on b.pay_id = p.pay_id
				where b.user_email= 'evergreen@gamail.com'
				order by Data_Date desc
			
				
SELECT b.Data_Date, c.Ca_Group, c.Ca_Value, b.Data_Amount, b.Data_Memo 
		FROM Book_data b, Ca_info c
		WHERE b.Ca_Key = c.Ca_Key and b.Data_Date ='2018-10-13' and b.User_Email='test@test.com';


SELECT b.Data_Date, c.Ca_Group, c.Ca_Value, b.Data_Amount, b.Data_Memo 
		FROM Book_data b, Ca_info c
		WHERE b.Ca_Key = c.Ca_Key and b.Data_Date ='2018-10-03' and b.User_Email='evergreen@gmail.com';

		
create sequence Ca_info_seq;


select * from Ca_info where user_email = 'evergreen@gmail.com';
select * from BOOK_DATA;


delete  from CA_INFO where user_email = 'evergreen@gmail.com';
commit

insert 
	into Ca_info  Values (1,'evergreen@gmail.com', 1, 100, 'EVE', 1);
			

insert All 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+1, #{User_Email}, 1, 100, '�슜�룉', 1) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+2, #{User_Email}, 1, 100, '湲됱뿬', 2) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+3, #{User_Email}, 1, 100, '�씠�옄�닔�씡', 3) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+4, #{User_Email}, 1, 101, '鍮꾩젙湲곗슜�룉', 4) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+5, #{User_Email}, 1, 101, '�긽�뿬湲�', 5) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+6, #{User_Email}, 1, 102, '蹂댄뿕湲�', 6) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+7, #{User_Email}, 1, 102, '湲고�', 7) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+8, #{User_Email}, 2, 200, '�넻�떊鍮�', 8) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+9, #{User_Email}, 2, 200, '二쇨굅鍮�', 9) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+10, #{User_Email}, 2, 200, '援먯쑁鍮�', 10) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+11, #{User_Email}, 2, 201, '�떇鍮�', 11) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+12, #{User_Email}, 2, 201, '媛꾩떇鍮�', 12) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+13, #{User_Email}, 2, 201, '紐⑥엫�쉶鍮�', 13) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+14, #{User_Email}, 2, 202, '寃쎌“�궗鍮�', 14) 
	into Ca_info  Values ((select max(Ca_Key) from Ca_info)+15, #{User_Email}, 2, 202, '湲고�', 15) 
SELECT * FROM DUAL



CREATE SEQUENCE Book_data_Seq
start WITH 1
INCREMENT BY 1
drop table BOOK_DATA purge;
select * from book_data;
drop SEQUENCE  Book_data_Seq
alert SEQUENCE Book_data_Seq 

select Book_data_Seq.currval from dual
commit

SELECT * FROM Book_data_Seq
insert into book_data values(Book_data_Seq.nextval,sysdate,9999,'asdasd','test@test.com',1,2); 















		