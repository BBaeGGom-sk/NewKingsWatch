
create table tab_user(
	u_id varchar2(30) primary key,
	u_pw varchar2(30) not null,
	u_name varchar2(40) not null,
	u_phone varchar2(30),
	u_address varchar2(200),
	u_email varchar2(40) unique,
	u_point number(7),
	u_level number(1)
)
drop table tab_user
select * from tab_user
insert 

insert into tab_user values ('ggoomter', '0070', '배성원', '01026585834', '성북구 장위동', 'ggoomter@gmail.com', 0, 1)

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
drop table tab_goods

create table tab_basket(
	u_id varchar2(30) references tab_user(u_id),
	b_cart varchar2(30),
	b_wishlist varchar2(40),
	b_cartedtime varchar2(40) default sysdate
)
drop table tab_basket


create table tab_order(
	o_num number(8) primary key,
	u_id varchar2(30) references tab_user(u_id),
	o_orderdate varchar2(40) default sysdate,
	g_id varchar2(30) references tab_goods(g_id),
	o_quantity number(5)
)
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
	n_bno number(6) primary key,
	n_title varchar2(40),
	n_content varchar2(1000),
	u_id varchar2(30) references tab_user(u_id),
	u_regdate varchar2(40) default sysdate,
	n_updatedate varchar2(40),
	n_topmost number(1)
)
drop table tab_notice

create table tab_qna(
	q_bno number(6) primary key,
	g_id varchar2(30) references tab_goods(g_id),
	q_title varchar2(40),
	q_content varchar2(1000),
	u_id varchar2(30) references tab_user(u_id),
	q_regdate varchar2(40) default sysdate,
	q_updatedate varchar2(40),
	q_lock number(1),
	q_topmost number(1)
)
drop table tab_qna


create table tab_review(
	r_bno number(6) primary key,
	n_bno number(6) references tab_notice(n_bno),
	r_title varchar2(40),
	r_content varchar2(1000),
	u_id varchar2(30) references tab_user(u_id),
	r_regdate varchar2(40) default sysdate,
	r_updatedate varchar2(40),
	r_rating number(2)
)
drop table tab_review


create table tab_pic(
p_num number(8) not null,
p_fullName varchar2(150),
g_id varchar2(30) references tab_goods(g_id),
r_bno number(6) references tab_review(r_bno),
p_regDate varchar2(40) default sysdate
)
drop table tab_pic


create table tab_address(
	u_id varchar2(30) references tab_user(u_id),
	a_postnum number(5),
	a_admain varchar2(200),
	a_adsub varchar2(200)
)
drop table tab_address

