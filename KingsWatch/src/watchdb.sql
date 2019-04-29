
create table tab_user(
	u_id varchar2(30) primary key,
	u_pw varchar2(70) not null,
	u_name varchar2(40) not null,
	u_phone varchar2(30),
	u_sex number(1),
	u_age number(3),
	u_postNum varchar2(5),
	u_adMain varchar2(200),
	u_adSub varchar2(200),
	u_adDetail varchar2(200) default ' ',
	u_email varchar2(40) unique,
	u_regDate DATE default sysdate,
	u_point number(7) default 0,
	u_level number(1) default 0
)

drop table tab_user
select * from tab_user

alter table tab_user add (u_addetail varchar2(200)) 
update tab_user set u_addetail = '1028동 607호' , u_adsub = '(진관동, 은평뉴타운구파발)' where u_id = 'bbaeggom'

SELECT COUNT(u_id) FROM tab_user WHERE u_name = '페이커'
select * from tab_user where u_id='test' and u_pw = '$2a$10$8zcfWzUUU8leYBjaW9U2n.wzjnp3BM6.cU9BjC84bR5bpMXBYVeqa'
select * from tab_user where u_id='faker' and u_pw = '$2a$10$Ah215Zz0iuDGkcUhy5zhc.3zjtX16TPfe7DjozGljyS/dQqU5R8N2'

insert into tab_user values ('bbaeggom', '1026', '오승기', '01130339681',1,25,'03300', '서울시 은평구 북한산로2' ,'어울림아파트 1028동 607호', 'dhtmdrl2004@naver.com',null, 0, 1,'(진관동, 은평뉴타운구파발)')
delete from tab_user where u_id = 'bbaeggom'


update tab_user set u_addetail = '1028동 607호' , u_adsub = '(진관동, 은평뉴타운구파발)' where u_id = 'bbaeggom'
insert into tab_user (u_id, u_pw, u_name,u_adDetail)values ('babo123123','babo','바보', ' ')
delete from tab_user where u_id = 'bbaeggom'

insert into tab_user (u_id, u_pw, u_name)values ('brown','dddd','김요우')

x
select * from tab_address
drop table tab_address


create table tab_goods(
	g_id varchar2(30) primary key,
	g_name varchar2(40) not null,
	g_price number(7),
	g_sale number(6),
	g_desc varchar2(1000),
	g_category number(1),
	g_is_selling number(1),
	g_date varchar2(40) default sysdate,
	g_brand varchar2(40)
)
select * from tab_goods
drop table tab_goods  cascade constraints


x
alter table tab_basket add (b_quantity number(5))
drop table tab_basket

insert into TAB_BASKET (u_id,b_id) values ('bbaeggom','3');
delete from tab_basket
select * from tab_basket

create table tab_order(
	o_num number(8) primary key,
	u_id varchar2(30) references tab_user(u_id),
	o_orderdate varchar2(40) default sysdate,
	g_id varchar2(30) references tab_goods(g_id),
	o_quantity number(5)
)
select * from tab_order
drop table tab_order


create table tab_coupon(
	cp_id varchar2(30) primary key,
	cp_name varchar2(30),
	cp_value number(6),
	u_id varchar2(30) references tab_user(u_id),
	cp_valid number(1),
	cp_createdate varchar2(40) default sysdate,
	cp_exp varchar2(40)
)
drop table tab_coupon



create table tab_notice(
	n_bno number primary key,
	n_title varchar2(60),
	n_content varchar2(3000),
	u_id varchar2(30) references tab_user(u_id),
	n_regdate date default sysdate,
	n_updatedate date default sysdate,
	n_topmost number(1),
	n_viewcnt number default 0
)
drop table tab_notice

create table tab_qna(
	q_bno number primary key,
	g_id varchar2(30) references tab_goods(g_id),
	q_title varchar2(60),
	q_content varchar2(3000),
	u_id varchar2(30) references tab_user(u_id),
	q_regdate date default sysdate,
	q_updateDate date default sysdate,
	q_lock number(1),	
	q_topmost number(1),
	q_viewcnt number default 0,
	q_replycnt number default 0
)

drop table tab_qna


create table tab_qna_reply(
q_rno number primary key,
q_bno number references tab_qna(q_bno),
qr_text varchar2(3000),
replyer varchar2(30) references tab_user(u_id),
qr_regdate date default sysdate,
qr_updateDate date default sysdate
)

drop table tab_qna_reply






create table tab_review(
	r_bno number primary key,
	g_id varchar2(30) references tab_goods(g_id),
	r_title varchar2(60),
	r_content varchar2(3000),
	u_id varchar2(30) references tab_user(u_id),
	r_regdate date default sysdate,
	r_updatedate date default sysdate,
	r_rating number(2)
)
drop table tab_review
select * from tab_review


create table tab_pic(
p_num number not null,
p_fullName varchar2(150),
g_id varchar2(30) references tab_goods(g_id),
r_bno number references tab_review(r_bno),
q_bno number references tab_qna(q_bno),
n_bno number references tab_notice(n_bno),
p_regDate date default sysdate
)
drop table tab_pic

select * from tab_pic

commit
