
/* Drop Tables */

DROP TABLE album_down CASCADE CONSTRAINTS;
DROP TABLE auth_security CASCADE CONSTRAINTS;
DROP TABLE filter_history CASCADE CONSTRAINTS;
DROP TABLE filter_stop_sale CASCADE CONSTRAINTS;
DROP TABLE filter_storage CASCADE CONSTRAINTS;
DROP TABLE pay_cancel_complete CASCADE CONSTRAINTS;
DROP TABLE pay_cancel CASCADE CONSTRAINTS;
DROP TABLE pay CASCADE CONSTRAINTS;
DROP TABLE place_recyclebin CASCADE CONSTRAINTS;
DROP TABLE place_report CASCADE CONSTRAINTS;
DROP TABLE place_storage CASCADE CONSTRAINTS;
DROP TABLE route_place CASCADE CONSTRAINTS;
DROP TABLE place_board CASCADE CONSTRAINTS;
DROP TABLE filter CASCADE CONSTRAINTS;
DROP TABLE login_history CASCADE CONSTRAINTS;
DROP TABLE pickpic_connect CASCADE CONSTRAINTS;
DROP TABLE login_service CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE QNA_answer CASCADE CONSTRAINTS;
DROP TABLE QNA CASCADE CONSTRAINTS;
DROP TABLE rotue_recyclebin CASCADE CONSTRAINTS;
DROP TABLE route_report CASCADE CONSTRAINTS;
DROP TABLE route_storage CASCADE CONSTRAINTS;
DROP TABLE route_board CASCADE CONSTRAINTS;
DROP TABLE pickpic_user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE album_down
(
	ad_id nvarchar2(20) NOT NULL,
	ad_down_date date DEFAULT SYSDATE NOT NULL,
	ad_index number NOT NULL,
	pb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (ad_id)
);


CREATE TABLE auth_security
(
	as_id nvarchar2(12) NOT NULL,
	as_enabled_yn char(1) DEFAULT 'N' NOT NULL CHECK(as_enabled_yn IN('Y', 'N')),
	as_class nvarchar2(10) DEFAULT 'GUEST' NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (as_id)
);


CREATE TABLE filter
(
	f_id nvarchar2(20) NOT NULL,
	f_name nvarchar2(10) NOT NULL,
	f_price number NOT NULL,
	f_keyword nvarchar2(10),
	f_post_date date DEFAULT SYSDATE NOT NULL,
	f_event_yn char(1) NOT NULL CHECK(f_event_yn IN('Y', 'N')),
	PRIMARY KEY (f_id)
);


CREATE TABLE filter_history
(
	fh_id nvarchar2(20) NOT NULL,
	fh_content nvarchar2(200),
	fh_before_price number NOT NULL,
	fh_after_price number NOT NULL,
	fh_change_date date DEFAULT SYSDATE NOT NULL,
	fh_cause nvarchar2(30) NOT NULL,
	f_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (fh_id)
);


CREATE TABLE filter_stop_sale
(
	fss_id nvarchar2(20) NOT NULL,
	fss_sale_yn char(1) NOT NULL CHECK(fss_sale_yn IN('Y', 'N')),
	f_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (fss_id)
);


CREATE TABLE filter_storage
(
	fs_id nvarchar2(20) NOT NULL,
	fs_index number NOT NULL,
	f_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (fs_id)
);


CREATE TABLE login_history
(
	lh_id nvarchar2(20) NOT NULL,
	lh_login_date date DEFAULT SYSDATE NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (lh_id)
);


CREATE TABLE login_service
(
	ls_id nvarchar2(20) NOT NULL,
	ls_name nvarchar2(10) NOT NULL,
	PRIMARY KEY (ls_id)
);


CREATE TABLE notice
(
	n_id nvarchar2(20) NOT NULL,
	n_title nvarchar2(30) NOT NULL,
	n_content nvarchar2(500),
	n_post_date date DEFAULT SYSDATE NOT NULL,
	n_index number NOT NULL,
	PRIMARY KEY (n_id)
);


CREATE TABLE pay
(
	p_id nvarchar2(20) NOT NULL,
	p_price number NOT NULL,
	p_date date DEFAULT SYSDATE,
	p_accept_date date,
	p_accept_yn char(1) DEFAULT 'N' NOT NULL CHECK(p_accept_yn IN('Y', 'N')),
	p_index number NOT NULL,
	f_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (p_id)
);


CREATE TABLE pay_cancel
(
	payc_id nvarchar2(20) NOT NULL,
	payc_cause nvarchar2(30) NOT NULL,
	payc_report_date date DEFAULT SYSDATE NOT NULL,
	payc_accept_yn char(1) DEFAULT 'N' NOT NULL CHECK(payc_complete_yn IN('Y', 'N')),
	payc_index number NOT NULL,
	p_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (payc_id)
);


CREATE TABLE pay_cancel_complete
(
	pcc_id nvarchar2(20) NOT NULL,
	pcc_date date DEFAULT SYSDATE NOT NULL,
	pcc_price number NOT NULL,
	pcc_way nvarchar2(20),
	payc_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pcc_id)
);


CREATE TABLE pickpic_connect
(
	pc_connect_date date DEFAULT SYSDATE NOT NULL,
	pc_service_id nvarchar2(20) NOT NULL,
	ls_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL
);


CREATE TABLE pickpic_user
(
	ppu_serial_no nvarchar2(12) NOT NULL,
	ppu_id nvarchar2(20) NOT NULL,
	ppu_password varchar2(15) NOT NULL,
	ppu_name nvarchar2(5) NOT NULL,
	ppu_gender nvarchar2(1),
	ppu_nickname nvarchar2(10) NOT NULL,
	ppu_register_date date DEFAULT SYSDATE,
	ppu_profile_path nvarchar2(50),
	ppu_index number NOT NULL,
	PRIMARY KEY (ppu_serial_no)
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
	pb_index number NOT NULL,
	f_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (pb_id)
);


CREATE TABLE place_recyclebin
(
	prb_id nvarchar2(20) NOT NULL,
	prb_delete_date date DEFAULT SYSDATE NOT NULL,
	pr_index number NOT NULL,
	pb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (prb_id)
);


CREATE TABLE place_report
(
	pr_id nvarchar2(20) NOT NULL,
	pr_report_date date DEFAULT SYSDATE NOT NULL,
	pr_cause nvarchar2(200) NOT NULL,
	pr_complete_yn char(1) DEFAULT 'N' NOT NULL CHECK(pr_complete_yn IN ('Y', 'N')),
	pr_index number NOT NULL,
	pb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (pr_id)
);


CREATE TABLE place_storage
(
	ps_id nvarchar2(20) NOT NULL,
	ps_index number NOT NULL,
	pb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (ps_id)
);


CREATE TABLE QNA
(
	qna_id nvarchar2(20) NOT NULL,
	qna_title nvarchar2(30) NOT NULL,
	qna_content nvarchar2(500),
	qna_post_date date DEFAULT SYSDATE NOT NULL,
	qna_index number NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (qna_id)
);


CREATE TABLE QNA_answer
(
	qnaa_id nvarchar2(20) NOT NULL,
	qnaa_content nvarchar2(500),
	qnaa_post_date date DEFAULT SYSDATE NOT NULL,
	qna_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (qnaa_id)
);


CREATE TABLE rotue_recyclebin
(
	rrb_id nvarchar2(20) NOT NULL,
	rrb_delete_date date DEFAULT SYSDATE,
	rrb_index number NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (rrb_id)
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
	rb_index number NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (rb_id)
);


CREATE TABLE route_place
(
	rp_number number NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	pb_id nvarchar2(20) NOT NULL
);


CREATE TABLE route_report
(
	rr_id nvarchar2(20) NOT NULL,
	rr_report_date date DEFAULT SYSDATE NOT NULL,
	rr_cause nvarchar2(200) NOT NULL,
	rr_complete_yn char(1) DEFAULT 'N' NOT NULL CHECK(rr_complete_yn IN('Y', 'N')),
	rr_index number NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (rr_id)
);


CREATE TABLE route_storage
(
	rs_id nvarchar2(20) NOT NULL,
	rs_index number NOT NULL,
	rb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (rs_id)
);



/* Create Foreign Keys */

ALTER TABLE filter_history
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE filter_stop_sale
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE filter_storage
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE pay
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE place_board
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE pickpic_connect
	ADD FOREIGN KEY (ls_id)
	REFERENCES login_service (ls_id)
;


ALTER TABLE pay_cancel
	ADD FOREIGN KEY (p_id)
	REFERENCES pay (p_id)
;


ALTER TABLE pay_cancel_complete
	ADD FOREIGN KEY (payc_id)
	REFERENCES pay_cancel (payc_id)
;


ALTER TABLE auth_security
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE filter_storage
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE login_history
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pay
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickpic_connect
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE place_board
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE place_report
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE place_storage
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE QNA
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE route_board
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE route_report
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE route_storage
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE album_down
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE place_recyclebin
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE place_report
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE place_storage
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE route_place
	ADD FOREIGN KEY (pb_id)
	REFERENCES place_board (pb_id)
;


ALTER TABLE QNA_answer
	ADD FOREIGN KEY (qna_id)
	REFERENCES QNA (qna_id)
;


ALTER TABLE rotue_recyclebin
	ADD FOREIGN KEY (rb_id)
	REFERENCES route_board (rb_id)
;


ALTER TABLE route_place
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



