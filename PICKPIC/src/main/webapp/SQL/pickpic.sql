
/* Drop Tables */

DROP TABLE album_down CASCADE CONSTRAINTS;
DROP TABLE answer_question CASCADE CONSTRAINTS;
DROP TABLE auth_security CASCADE CONSTRAINTS;
DROP TABLE connection_status CASCADE CONSTRAINTS;
DROP TABLE filter_storage CASCADE CONSTRAINTS;
DROP TABLE refund CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE pickplace_recycle_bin CASCADE CONSTRAINTS;
DROP TABLE pickplace_report CASCADE CONSTRAINTS;
DROP TABLE pickplace_storage CASCADE CONSTRAINTS;
DROP TABLE pickroad_pickplace CASCADE CONSTRAINTS;
DROP TABLE pickplace_board CASCADE CONSTRAINTS;
DROP TABLE filter CASCADE CONSTRAINTS;
DROP TABLE login_history CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE pickroad_recycle_bin CASCADE CONSTRAINTS;
DROP TABLE pickroad_report CASCADE CONSTRAINTS;
DROP TABLE pickroad_storage CASCADE CONSTRAINTS;
DROP TABLE pickroad_board CASCADE CONSTRAINTS;
DROP TABLE question CASCADE CONSTRAINTS;
DROP TABLE pickpic_account CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE album_down
(
	ad_id nvarchar2(12) NOT NULL,
	ad_down_date date DEFAULT SYSDATE NOT NULL,
	ad_way nvarchar2(10) NOT NULL,
	ad_image_path nvarchar2(50) NOT NULL,
	ad_index number NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (ad_id)
);


CREATE TABLE answer_question
(
	aq_id nvarchar2(12) NOT NULL,
	aq_content nvarchar2(500),
	aq_post_date date DEFAULT SYSDATE NOT NULL,
	q_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (aq_id)
);


CREATE TABLE auth_security
(
	as_id nvarchar2(12) NOT NULL,
	as_enabled_yn char(1) DEFAULT 'N' NOT NULL CHECK(as_enabled_yn IN('Y', 'N')),
	as_class nvarchar2(10) DEFAULT 'GUEST' NOT NULL,
	as_date date DEFAULT SYSDATE NOT NULL,
	as_index number NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (as_id)
);


CREATE TABLE connection_status
(
	cs_id nvarchar2(12) NOT NULL,
	cs_name nvarchar2(10) NOT NULL,
	cs_connect_date date DEFAULT SYSDATE NOT NULL,
	cs_service_token nvarchar2(30) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (cs_id)
);


CREATE TABLE filter
(
	f_id nvarchar2(12) NOT NULL,
	f_name nvarchar2(10) NOT NULL,
	f_price number NOT NULL,
	f_post_date date DEFAULT SYSDATE NOT NULL,
	f_change_date date DEFAULT SYSDATE NOT NULL,
	f_reason nvarchar2(30) NOT NULL,
	f_sale_yn char(1) DEFAULT 'N' NOT NULL CHECK(f_sale_yn IN('Y', 'N')),
	f_event_yn char(1) DEFAULT 'N' NOT NULL CHECK(f_event_yn IN('Y', 'N')),
	f_index number NOT NULL,
	PRIMARY KEY (f_id)
);


CREATE TABLE filter_storage
(
	fs_id nvarchar2(12) NOT NULL,
	fs_index number NOT NULL,
	f_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (fs_id)
);


CREATE TABLE login_history
(
	lh_id nvarchar2(12) NOT NULL,
	lh_login_date date DEFAULT SYSDATE NOT NULL,
	lh_index number NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (lh_id)
);


CREATE TABLE notice
(
	n_id nvarchar2(12) NOT NULL,
	n_title nvarchar2(30) NOT NULL,
	n_content nvarchar2(500),
	n_post_date date DEFAULT SYSDATE NOT NULL,
	n_index number NOT NULL,
	PRIMARY KEY (n_id)
);


CREATE TABLE payment
(
	p_id nvarchar2(12) NOT NULL,
	p_price number NOT NULL,
	p_method nvarchar2(10) NOT NULL,
	p_date date DEFAULT SYSDATE NOT NULL,
	p_index number NOT NULL,
	f_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (p_id)
);


CREATE TABLE pickpic_account
(
	ppa_id nvarchar2(12) NOT NULL,
	ppa_user_id nvarchar2(20) NOT NULL,
	ppa_password varchar2(15) NOT NULL,
	ppa_name nvarchar2(5) NOT NULL,
	ppa_nickname nvarchar2(10) NOT NULL,
	ppa_gender nvarchar2(1) NOT NULL,
	ppa_register_date date DEFAULT SYSDATE NOT NULL,
	ppa_profile_path nvarchar2(50),
	ppa_index number NOT NULL,
	PRIMARY KEY (ppa_id)
);


CREATE TABLE pickplace_board
(
	ppb_id nvarchar2(12) NOT NULL,
	ppb_title nvarchar2(30) NOT NULL,
	ppb_content nvarchar2(500),
	ppb_post_date date DEFAULT SYSDATE NOT NULL,
	ppb_count number DEFAULT 0 NOT NULL,
	ppb_pick number DEFAULT 0 NOT NULL,
	ppb_nation nvarchar2(20) NOT NULL,
	ppb_city nvarchar2(20) NOT NULL,
	ppb_area nvarchar2(20) NOT NULL,
	ppb_detail_location nvarchar2(20),
	ppb_image_path nvarchar2(30) NOT NULL,
	ppb_index number NOT NULL,
	f_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (ppb_id)
);


CREATE TABLE pickplace_recycle_bin
(
	pprb_id nvarchar2(12) NOT NULL,
	pprb_delete_date date DEFAULT SYSDATE NOT NULL,
	pprb_index number NOT NULL,
	ppb_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (pprb_id)
);


CREATE TABLE pickplace_report
(
	ppr_id nvarchar2(12) NOT NULL,
	ppr_report_date date DEFAULT SYSDATE NOT NULL,
	ppr_reason nvarchar2(200) NOT NULL,
	ppr_aceept_yn char(1) DEFAULT 'N' NOT NULL CHECK(ppr_aceept_yn IN ('Y', 'N')),
	ppr_index number NOT NULL,
	ppb_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (ppr_id)
);


CREATE TABLE pickplace_storage
(
	pps_id nvarchar2(12) NOT NULL,
	pps_index number NOT NULL,
	ppb_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (pps_id)
);


CREATE TABLE pickroad_board
(
	prb_id nvarchar2(12) NOT NULL,
	prb_title nvarchar2(30) NOT NULL,
	prb_content nvarchar2(500),
	prb_post_date date DEFAULT SYSDATE NOT NULL,
	prb_view number DEFAULT 0 NOT NULL,
	prb_recommend number DEFAULT 0 NOT NULL,
	prb_start_date date NOT NULL,
	prb_end_date date NOT NULL,
	prb_index number NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (prb_id)
);


CREATE TABLE pickroad_pickplace
(
	prpp_order number NOT NULL,
	prb_id nvarchar2(12) NOT NULL,
	ppb_id nvarchar2(12) NOT NULL
);


CREATE TABLE pickroad_recycle_bin
(
	prrb_id nvarchar2(12) NOT NULL,
	prrb_delete_date date DEFAULT SYSDATE NOT NULL,
	prrb_index number NOT NULL,
	prb_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (prrb_id)
);


CREATE TABLE pickroad_report
(
	prr_id nvarchar2(12) NOT NULL,
	prr_report_date date DEFAULT SYSDATE NOT NULL,
	prr_reason nvarchar2(200) NOT NULL,
	prr_aceept_yn char(1) DEFAULT 'N' NOT NULL CHECK(prr_aceept_yn IN('Y', 'N')),
	prr_index number NOT NULL,
	prb_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (prr_id)
);


CREATE TABLE pickroad_storage
(
	prs_id nvarchar2(12) NOT NULL,
	prs_index number NOT NULL,
	prb_id nvarchar2(12) NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (prs_id)
);


CREATE TABLE question
(
	q_id nvarchar2(12) NOT NULL,
	q_title nvarchar2(30) NOT NULL,
	q_content nvarchar2(500),
	q_post_date date DEFAULT SYSDATE NOT NULL,
	q_index number NOT NULL,
	ppa_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (q_id)
);


CREATE TABLE refund
(
	r_id nvarchar2(12) NOT NULL,
	r_cause nvarchar2(30) NOT NULL,
	r_date date DEFAULT SYSDATE NOT NULL,
	r_index number NOT NULL,
	p_id nvarchar2(12) NOT NULL,
	PRIMARY KEY (r_id)
);



/* Create Foreign Keys */

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


ALTER TABLE refund
	ADD FOREIGN KEY (p_id)
	REFERENCES payment (p_id)
;


ALTER TABLE album_down
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE auth_security
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE connection_status
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE filter_storage
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE login_history
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE payment
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE pickplace_board
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE pickplace_report
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE pickplace_storage
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE pickroad_board
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE pickroad_report
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE pickroad_storage
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
;


ALTER TABLE question
	ADD FOREIGN KEY (ppa_id)
	REFERENCES pickpic_account (ppa_id)
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



