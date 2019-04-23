
--/* Drop Tables */
--
--DROP TABLE board_delete_basket CASCADE CONSTRAINTS;
--DROP TABLE filter_history CASCADE CONSTRAINTS;
--DROP TABLE filter_storage CASCADE CONSTRAINTS;
--DROP TABLE pay_cancel CASCADE CONSTRAINTS;
--DROP TABLE pay CASCADE CONSTRAINTS;
--DROP TABLE place_delete_basket CASCADE CONSTRAINTS;
--DROP TABLE place_report CASCADE CONSTRAINTS;
--DROP TABLE place_route CASCADE CONSTRAINTS;
--DROP TABLE place_storage CASCADE CONSTRAINTS;
--DROP TABLE place_board CASCADE CONSTRAINTS;
--DROP TABLE filter CASCADE CONSTRAINTS;
--DROP TABLE pickpic_connect CASCADE CONSTRAINTS;
--DROP TABLE login_service CASCADE CONSTRAINTS;
--DROP TABLE notice CASCADE CONSTRAINTS;
--DROP TABLE pay_cancel_complete CASCADE CONSTRAINTS;
--DROP TABLE pay_way CASCADE CONSTRAINTS;
--DROP TABLE pickpic_admin CASCADE CONSTRAINTS;
--DROP TABLE QNA_answer CASCADE CONSTRAINTS;
--DROP TABLE QNA CASCADE CONSTRAINTS;
--DROP TABLE route_report CASCADE CONSTRAINTS;
--DROP TABLE route_storage CASCADE CONSTRAINTS;
--DROP TABLE route_board CASCADE CONSTRAINTS;
--DROP TABLE pickpic_user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board_delete_basket
(
	bdb_id nvarchar2(20) NOT NULL,
	bdb_date date DEFAULT SYSDATE,
	rb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (bdb_id)
);


CREATE TABLE filter
(
	filter_id nvarchar2(20) NOT NULL,
	filter_name nvarchar2(10) NOT NULL,
	filter_price number NOT NULL,
	filter_keyword nvarchar2(10),
	filter_post_date date DEFAULT SYSDATE NOT NULL,
	filter_event_yn char(1) NOT NULL CHECK(filter_event_yv IN('Y', 'N')),
	PRIMARY KEY (filter_id)
);


CREATE TABLE filter_history
(
	fh_id nvarchar2(20) NOT NULL,
	fh_content nvarchar2(200),
	fh_before_price number NOT NULL,
	fh_after_price number NOT NULL,
	fh_change_date date DEFAULT SYSDATE NOT NULL,
	fh_cause nvarchar2(30) NOT NULL,
	filter_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (fh_id)
);


CREATE TABLE filter_storage
(
	fs_id nvarchar2(20) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	filter_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (fs_id)
);


CREATE TABLE login_service
(
	ls_id nvarchar2(20) NOT NULL,
	ls_name nvarchar2(10) NOT NULL,
	PRIMARY KEY (ls_id)
);


CREATE TABLE notice
(
	notice_id nvarchar2(20) NOT NULL,
	notice_title nvarchar2(30) NOT NULL,
	notice_content nvarchar2(500),
	notice_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (notice_id)
);


CREATE TABLE pay
(
	pay_id nvarchar2(20) NOT NULL,
	pay_price number NOT NULL,
	pay_date date DEFAULT SYSDATE,
	pay_accept_date date,
	pay_accept_yn char(1) DEFAULT '0' NOT NULL CHECK(pay_accept_yn IN('Y', 'N'),
	ppu_id nvarchar2(20) NOT NULL,
	filter_id nvarchar2(20) NOT NULL,
	pw_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pay_id)
);


CREATE TABLE pay_cancel
(
	payc_id nvarchar2(20) NOT NULL,
	payc_cause nvarchar2(30) NOT NULL,
	payc_report_date date DEFAULT SYSDATE NOT NULL,
	payc_complete_yn char(1) NOT NULL CHECK(cancel_complete_yn IN('Y', 'N')),
	pay_id nvarchar2(20) NOT NULL,
	pcc_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (payc_id)
);


CREATE TABLE pay_cancel_complete
(
	pcc_id nvarchar2(20) NOT NULL,
	pcc_date date NOT NULL,
	pcc_price number NOT NULL,
	pcc_bank_info nvarchar2(20),
	pw_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pcc_id)
);


CREATE TABLE pay_way
(
	pw_id nvarchar2(20) NOT NULL,
	pw_name nvarchar2(20),
	PRIMARY KEY (pw_id)
);


CREATE TABLE pickpic_admin
(
	pa_id nvarchar2(20) NOT NULL,
	pa_class nvarchar2(5),
	ppu_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pa_id)
);


CREATE TABLE pickpic_connect
(
	pc_date date DEFAULT SYSDATE,
	pc_service_id nvarchar2(20) NOT NULL,
	ls_id nvarchar2(20) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL
);


CREATE TABLE pickpic_user
(
	ppu_id nvarchar2(20) NOT NULL,
	ppu_password varchar2(15) NOT NULL,
	ppu_name nvarchar2(5) NOT NULL,
	ppu_tetephone varchar2(13),
	ppu_address nvarchar2(40),
	ppu_register_date date DEFAULT SYSDATE,
	ppu_age number,
	ppu_gender nvarchar2(1),
	ppu_profile_path nvarchar2(50),
	PRIMARY KEY (ppu_id)
);


CREATE TABLE place_board
(
	pb_id nvarchar2(20) NOT NULL,
	pb_title nvarchar2(30) NOT NULL,
	pb_content nvarchar2(500),
	pb_post_date date DEFAULT SYSDATE NOT NULL,
	pb_count number,
	pb_pick number,
	pb_nation nvarchar2(20) NOT NULL,
	pb_city nvarchar2(20) NOT NULL,
	pb_area nvarchar2(20) NOT NULL,
	pb_detail_location nvarchar2(20),
	pb_image_path nvarchar2(30) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	filter_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pb_id)
);


CREATE TABLE place_delete_basket
(
	place_delete_basket_id nvarchar2(20) NOT NULL,
	delete_date date DEFAULT SYSDATE,
	pb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (place_delete_basket_id)
);


CREATE TABLE place_report
(
	pr_id nvarchar2(20) NOT NULL,
	pr_date date DEFAULT SYSDATE NOT NULL,
	pr_cause nvarchar2(200) NOT NULL,
	pb_id nvarchar2(20) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pr_id)
);


CREATE TABLE place_route
(
	route_number number NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	pb_id nvarchar2(20) NOT NULL
);


CREATE TABLE place_storage
(
	ps_id nvarchar2(20) NOT NULL,
	pb_id nvarchar2(20) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (ps_id)
);


CREATE TABLE QNA
(
	qna_id nvarchar2(20) NOT NULL,
	qna_title nvarchar2(30) NOT NULL,
	qna_content nvarchar2(500),
	qna_date date DEFAULT SYSDATE NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (qna_id)
);


CREATE TABLE QNA_answer
(
	qnaa_id nvarchar2(20) NOT NULL,
	qnaa_content nvarchar2(500) NOT NULL,
	qnaa_date date DEFAULT SYSDATE NOT NULL,
	qna_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (qnaa_id)
);


CREATE TABLE route_board
(
	rb_id nvarchar2(20) NOT NULL,
	rb_title nvarchar2(30) NOT NULL,
	rb_content nvarchar2(500) NOT NULL,
	rb_post_date date DEFAULT SYSDATE NOT NULL,
	rb_count number,
	rb_pick number,
	rb_start_date date,
	rb_end_date date,
	ppu_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (rb_id)
);


CREATE TABLE route_report
(
	rr_id nvarchar2(20) NOT NULL,
	rr_date date DEFAULT SYSDATE NOT NULL,
	rr_cause nvarchar2(200) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (rr_id)
);


CREATE TABLE route_storage
(
	rs_id nvarchar2(20) NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (rs_id)
);



/* Create Foreign Keys */

ALTER TABLE filter_history
	ADD FOREIGN KEY (filter_id)
	REFERENCES filter (filter_id)
;


ALTER TABLE filter_storage
	ADD FOREIGN KEY (filter_id)
	REFERENCES filter (filter_id)
;


ALTER TABLE pay
	ADD FOREIGN KEY (filter_id)
	REFERENCES filter (filter_id)
;


ALTER TABLE place_board
	ADD FOREIGN KEY (filter_id)
	REFERENCES filter (filter_id)
;


ALTER TABLE pickpic_connect
	ADD FOREIGN KEY (ls_id)
	REFERENCES login_service (ls_id)
;


ALTER TABLE pay_cancel
	ADD FOREIGN KEY (pay_id)
	REFERENCES pay (pay_id)
;


ALTER TABLE pay_cancel
	ADD FOREIGN KEY (pcc_id)
	REFERENCES pay_cancel_complete (pcc_id)
;


ALTER TABLE pay
	ADD FOREIGN KEY (pw_id)
	REFERENCES pay_way (pw_id)
;


ALTER TABLE pay_cancel_complete
	ADD FOREIGN KEY (pw_id)
	REFERENCES pay_way (pw_id)
;


ALTER TABLE filter_storage
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE pay
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE pickpic_admin
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE pickpic_connect
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE place_board
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE place_report
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE place_storage
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE route_board
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE route_report
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE route_storage
	ADD FOREIGN KEY (ppu_id)
	REFERENCES pickpic_user (ppu_id)
;


ALTER TABLE place_delete_basket
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE place_report
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE place_route
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE place_storage
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE QNA_answer
	ADD FOREIGN KEY (qna_id)
	REFERENCES QNA (qna_id)
;


ALTER TABLE board_delete_basket
	ADD FOREIGN KEY (rb_id)
	REFERENCES route_board (rb_id)
;


ALTER TABLE place_route
	ADD FOREIGN KEY (rb_id)
	REFERENCES route_board (rb_id)
;


ALTER TABLE route_report
	ADD FOREIGN KEY (rb_id)
	REFERENCES route_board (rb_id)
;


ALTER TABLE route_storage
	ADD FOREIGN KEY (rb_id)
	REFERENCES route_board (rb_id)
;



