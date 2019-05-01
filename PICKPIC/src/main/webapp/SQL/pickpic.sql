
/* Drop Tables */

DROP TABLE album_down CASCADE CONSTRAINTS;
DROP TABLE answer_question CASCADE CONSTRAINTS;
DROP TABLE auth_security CASCADE CONSTRAINTS;
DROP TABLE connection_status CASCADE CONSTRAINTS;
DROP TABLE filter_price_history CASCADE CONSTRAINTS;
DROP TABLE filter_sale_status CASCADE CONSTRAINTS;
DROP TABLE filter_storage CASCADE CONSTRAINTS;
DROP TABLE payment_cancel_complete CASCADE CONSTRAINTS;
DROP TABLE payment_cancel CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE pickplace_recycle_bin CASCADE CONSTRAINTS;
DROP TABLE pickplace_report CASCADE CONSTRAINTS;
DROP TABLE pickplace_storage CASCADE CONSTRAINTS;
DROP TABLE pickroad_pickplace CASCADE CONSTRAINTS;
DROP TABLE pickplace_board CASCADE CONSTRAINTS;
DROP TABLE filter CASCADE CONSTRAINTS;
DROP TABLE login_history CASCADE CONSTRAINTS;
DROP TABLE login_service CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE pickroad_recycle_bin CASCADE CONSTRAINTS;
DROP TABLE pickroad_report CASCADE CONSTRAINTS;
DROP TABLE pickroad_storage CASCADE CONSTRAINTS;
DROP TABLE pickroad_board CASCADE CONSTRAINTS;
DROP TABLE question CASCADE CONSTRAINTS;
DROP TABLE pickpic_user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE album_down
(
	ad_id nvarchar2(20) NOT NULL,
	ad_down_date date DEFAULT SYSDATE NOT NULL,
	ad_index number NOT NULL,
	ppb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (ad_id)
);


CREATE TABLE answer_question
(
	aq_id nvarchar2(20) NOT NULL,
	aq_content nvarchar2(500),
	aq_post_date date DEFAULT SYSDATE NOT NULL,
	q_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (aq_id)
);


CREATE TABLE auth_security
(
	as_id nvarchar2(12) NOT NULL,
	as_enabled_yn char(1) DEFAULT 'N' NOT NULL CHECK(as_enabled_yn IN('Y', 'N')),
	as_class nvarchar2(10) DEFAULT 'GUEST' NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (as_id)
);


CREATE TABLE connection_status
(
	cs_connect_date date DEFAULT SYSDATE NOT NULL,
	cs_service_id nvarchar2(20) NOT NULL,
	ls_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL
);


CREATE TABLE filter
(
	f_id nvarchar2(20) NOT NULL,
	f_name nvarchar2(10) NOT NULL,
	f_price number NOT NULL,
	f_keyword nvarchar2(10),
	f_post_date date DEFAULT SYSDATE NOT NULL,
	f_index number NOT NULL,
	PRIMARY KEY (f_id)
);


CREATE TABLE filter_price_history
(
	fph_id nvarchar2(20) NOT NULL,
	fph_content nvarchar2(200),
	fph_before_price number NOT NULL,
	fph_after_price number NOT NULL,
	fph_change_date date DEFAULT SYSDATE NOT NULL,
	fph_reason nvarchar2(30) NOT NULL,
	fph_event_yn char(1) DEFAULT 'N' CHECK(fph_event_yn IN('Y', 'N')),
	fph_index number,
	f_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (fph_id)
);


CREATE TABLE filter_sale_status
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


CREATE TABLE payment
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


CREATE TABLE payment_cancel
(
	pc_id nvarchar2(20) NOT NULL,
	pc_cause nvarchar2(30) NOT NULL,
	pc_report_date date DEFAULT SYSDATE NOT NULL,
	pc_accept_yn char(1) DEFAULT 'N' NOT NULL CHECK(pc_accept_yn IN('Y', 'N')),
	pc_index number NOT NULL,
	p_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pc_id)
);


CREATE TABLE payment_cancel_complete
(
	pcc_id nvarchar2(20) NOT NULL,
	pcc_date date DEFAULT SYSDATE NOT NULL,
	pcc_price number NOT NULL,
	pcc_way nvarchar2(20),
	pc_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pcc_id)
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


CREATE TABLE pickplace_board
(
	ppb_id nvarchar2(20) NOT NULL,
	ppb_title nvarchar2(30) NOT NULL,
	ppb_content nvarchar2(500),
	ppb_post_date date DEFAULT SYSDATE NOT NULL,
	ppb_count number,
	ppb_pick number,
	ppb_nation nvarchar2(20) NOT NULL,
	ppb_city nvarchar2(20) NOT NULL,
	ppb_area nvarchar2(20) NOT NULL,
	ppb_detail_location nvarchar2(20),
	ppb_image_path nvarchar2(30) NOT NULL,
	ppb_index number NOT NULL,
	f_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (ppb_id)
);


CREATE TABLE pickplace_recycle_bin
(
	pprb_id nvarchar2(20) NOT NULL,
	pprb_delete_date date DEFAULT SYSDATE NOT NULL,
	pprb_index number NOT NULL,
	ppb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (pprb_id)
);


CREATE TABLE pickplace_report
(
	ppr_id nvarchar2(20) NOT NULL,
	ppr_report_date date DEFAULT SYSDATE NOT NULL,
	ppr_reason nvarchar2(200) NOT NULL,
	ppr_aceept_yn char(1) DEFAULT 'N' NOT NULL CHECK(ppr_aceept_yn IN ('Y', 'N')),
	ppr_index number NOT NULL,
	ppb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (ppr_id)
);


CREATE TABLE pickplace_storage
(
	pps_id nvarchar2(20) NOT NULL,
	pps_index number NOT NULL,
	ppb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (pps_id)
);


CREATE TABLE pickroad_board
(
	prb_id nvarchar2(20) NOT NULL,
	prb_title nvarchar2(30) NOT NULL,
	prb_content nvarchar2(500) NOT NULL,
	prb_post_date date DEFAULT SYSDATE NOT NULL,
	prb_view number,
	prb_recommend number,
	prb_start_date date,
	prb_end_date date,
	prb_index number NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (prb_id)
);


CREATE TABLE pickroad_pickplace
(
	prpp_order number NOT NULL,
	prb_id nvarchar2(20) NOT NULL,
	ppb_id nvarchar2(20) NOT NULL
);


CREATE TABLE pickroad_recycle_bin
(
	prrb_id nvarchar2(20) NOT NULL,
	prrb_delete_date date DEFAULT SYSDATE,
	prrb_index number NOT NULL,
	prb_id nvarchar2(20) NOT NULL,
	PRIMARY KEY (prrb_id)
);


CREATE TABLE pickroad_report
(
	prr_id nvarchar2(20) NOT NULL,
	prr_report_date date DEFAULT SYSDATE NOT NULL,
	prr_reason nvarchar2(200) NOT NULL,
	prr_aceept_yn char(1) DEFAULT 'N' NOT NULL CHECK(prr_aceept_yn IN('Y', 'N')),
	prr_index number NOT NULL,
	prb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (prr_id)
);


CREATE TABLE pickroad_storage
(
	prs_id nvarchar2(20) NOT NULL,
	prs_index number NOT NULL,
	prb_id nvarchar2(20) NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (prs_id)
);


CREATE TABLE question
(
	q_id nvarchar2(20) NOT NULL,
	q_title nvarchar2(30) NOT NULL,
	q_content nvarchar2(500),
	q_post_date date DEFAULT SYSDATE NOT NULL,
	q_index number NOT NULL,
	ppu_serial_no nvarchar2(12) NOT NULL,
	PRIMARY KEY (q_id)
);



/* Create Foreign Keys */

ALTER TABLE filter_price_history
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE filter_sale_status
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE filter_storage
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE payment
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE pickplace_board
	ADD FOREIGN KEY (f_id)
	REFERENCES filter (f_id)
;


ALTER TABLE connection_status
	ADD FOREIGN KEY (ls_id)
	REFERENCES login_service (ls_id)
;


ALTER TABLE payment_cancel
	ADD FOREIGN KEY (p_id)
	REFERENCES payment (p_id)
;


ALTER TABLE payment_cancel_complete
	ADD FOREIGN KEY (pc_id)
	REFERENCES payment_cancel (pc_id)
;


ALTER TABLE auth_security
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE connection_status
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


ALTER TABLE payment
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickplace_board
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickplace_report
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickplace_storage
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickroad_board
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickroad_report
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE pickroad_storage
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE question
	ADD FOREIGN KEY (ppu_serial_no)
	REFERENCES pickpic_user (ppu_serial_no)
;


ALTER TABLE album_down
	ADD FOREIGN KEY (ppb_id)
	REFERENCES pickplace_board (ppb_id)
;


ALTER TABLE pickplace_recycle_bin
	ADD FOREIGN KEY (ppb_id)
	REFERENCES pickplace_board (ppb_id)
;


ALTER TABLE pickplace_report
	ADD FOREIGN KEY (ppb_id)
	REFERENCES pickplace_board (ppb_id)
;


ALTER TABLE pickplace_storage
	ADD FOREIGN KEY (ppb_id)
	REFERENCES pickplace_board (ppb_id)
;


ALTER TABLE pickroad_pickplace
	ADD FOREIGN KEY (ppb_id)
	REFERENCES pickplace_board (ppb_id)
;


ALTER TABLE pickroad_pickplace
	ADD FOREIGN KEY (prb_id)
	REFERENCES pickroad_board (prb_id)
;


ALTER TABLE pickroad_recycle_bin
	ADD FOREIGN KEY (prb_id)
	REFERENCES pickroad_board (prb_id)
;


ALTER TABLE pickroad_report
	ADD FOREIGN KEY (prb_id)
	REFERENCES pickroad_board (prb_id)
;


ALTER TABLE pickroad_storage
	ADD FOREIGN KEY (prb_id)
	REFERENCES pickroad_board (prb_id)
;


ALTER TABLE answer_question
	ADD FOREIGN KEY (q_id)
	REFERENCES question (q_id)
;



