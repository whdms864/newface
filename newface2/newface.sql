SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS ad;
DROP TABLE IF EXISTS ader;
DROP TABLE IF EXISTS admin_msg;
DROP TABLE IF EXISTS noti_com;
DROP TABLE IF EXISTS noti;
DROP TABLE IF EXISTS qna11_com;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS buy;
DROP TABLE IF EXISTS cash;
DROP TABLE IF EXISTS hompy_posi;
DROP TABLE IF EXISTS room_posi;
DROP TABLE IF EXISTS mine;
DROP TABLE IF EXISTS item;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS diary_com;
DROP TABLE IF EXISTS diary_love;
DROP TABLE IF EXISTS diary_singo;
DROP TABLE IF EXISTS diary;
DROP TABLE IF EXISTS diary_folder;
DROP TABLE IF EXISTS guestbook_com;
DROP TABLE IF EXISTS guestbook;
DROP TABLE IF EXISTS iu_com;
DROP TABLE IF EXISTS miniroom;
DROP TABLE IF EXISTS photo_com;
DROP TABLE IF EXISTS photo_love;
DROP TABLE IF EXISTS photo_singo;
DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS photo_folder;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS setup;
DROP TABLE IF EXISTS today;
DROP TABLE IF EXISTS hompy;
DROP TABLE IF EXISTS iu;
DROP TABLE IF EXISTS msg;
DROP TABLE IF EXISTS qna11;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE ad
(
	ad_num int NOT NULL AUTO_INCREMENT,
	type varchar(20),
	pay varchar(4000),
	ad_img varchar(4000),
	url varchar(1000),
	sdate varchar(1000),
	edate varchar(1000),
	ader_num int NOT NULL,
	PRIMARY KEY (ad_num)
);


CREATE TABLE ader
(
	ader_num int NOT NULL AUTO_INCREMENT,
	hname varchar(1000),
	pname varchar(1000),
	snum varchar(1000),
	dname varchar(1000),
	phone varchar(1000),
	regdate datetime,
	PRIMARY KEY (ader_num)
);


CREATE TABLE admin
(
	id varchar(250) NOT NULL,
	pwd varchar(250),
	name varchar(1000),
	PRIMARY KEY (id)
);


CREATE TABLE admin_msg
(
	adminmsg_num int NOT NULL,
	content varchar(4000),
	send_del varchar(20),
	recv_del varchar(20),
	regdate datetime,
	sender varchar(250) NOT NULL,
	receiver varchar(250) NOT NULL,
	PRIMARY KEY (adminmsg_num)
);


CREATE TABLE buy
(
	buy_num int NOT NULL AUTO_INCREMENT,
	regdate datetime,
	cnt int,
	pay int,
	item_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (buy_num)
);


CREATE TABLE cash
(
	cash_num int NOT NULL AUTO_INCREMENT,
	cnt int,
	id varchar(250) NOT NULL,
	PRIMARY KEY (cash_num)
);


CREATE TABLE category
(
	category_num int NOT NULL AUTO_INCREMENT,
	name varchar(1000),
	PRIMARY KEY (category_num)
);


CREATE TABLE diary
(
	diary_num int NOT NULL AUTO_INCREMENT,
	type varchar(20),
	title varchar(1000),
	content varchar(4000),
	singo int,
	love int,
	regdate datetime,
	diary_folder_num int NOT NULL,
	blind int,
	PRIMARY KEY (diary_num)
);


CREATE TABLE diary_com
(
	diary_com_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	singo varchar(20),
	regdate datetime,
	diary_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (diary_com_num)
);


CREATE TABLE diary_folder
(
	diary_folder_num int NOT NULL AUTO_INCREMENT,
	fname varchar(1000),
	regdate datetime,
	hompy_num int NOT NULL,
	PRIMARY KEY (diary_folder_num)
);


CREATE TABLE diary_love
(
	diary_love_num int NOT NULL AUTO_INCREMENT,
	id varchar(250) NOT NULL,
	diary_num int NOT NULL,
	PRIMARY KEY (diary_love_num)
);


CREATE TABLE diary_singo
(
	diary_singo_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	diary_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (diary_singo_num)
);


CREATE TABLE guestbook
(
	guest_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	secret varchar(20),
	regdate datetime,
	id varchar(250) NOT NULL,
	hompy_num int NOT NULL,
	PRIMARY KEY (guest_num)
);


CREATE TABLE guestbook_com
(
	guest_com_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	regdate datetime,
	guest_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (guest_com_num)
);


CREATE TABLE hompy
(
	hompy_num int NOT NULL AUTO_INCREMENT,
	hname varchar(1000),
	id varchar(250) NOT NULL,
	PRIMARY KEY (hompy_num)
);


CREATE TABLE hompy_posi
(
	hompy_posi_num int NOT NULL AUTO_INCREMENT,
	hompy_num int NOT NULL,
	mine_num int NOT NULL,
	PRIMARY KEY (hompy_posi_num)
);


CREATE TABLE item
(
	item_num int NOT NULL AUTO_INCREMENT,
	pay int,
	name varchar(1000),
	content varchar(4000),
	item_img varchar(4000),
	regdate datetime,
	category_num int NOT NULL,
	PRIMARY KEY (item_num)
);


CREATE TABLE iu
(
	iu_num int NOT NULL AUTO_INCREMENT,
	i_name varchar(1000),
	u_name varchar(1000),
	i_id varchar(250) NOT NULL,
	u_id varchar(250) NOT NULL,
	PRIMARY KEY (iu_num)
);


CREATE TABLE iu_com
(
	iu_com_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	regdate datetime,
	hompy_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (iu_com_num)
);


CREATE TABLE member
(
	id varchar(250) NOT NULL,
	pwd varchar(250) NOT NULL,
	name varchar(50),
	email varchar(50),
	addr varchar(100),
	birth varchar(50),
	school varchar(50),
	type varchar(20),
	regdate datetime,
	PRIMARY KEY (id)
);


CREATE TABLE mine
(
	mine_num int NOT NULL AUTO_INCREMENT,
	totcnt int,
	cnt int,
	item_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (mine_num)
);


CREATE TABLE miniroom
(
	mini_num int NOT NULL AUTO_INCREMENT,
	name varchar(1000),
	hompy_num int NOT NULL,
	PRIMARY KEY (mini_num)
);


CREATE TABLE msg
(
	msg_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	send_del varchar(20),
	recv_del varchar(20),
	regdate date,
	send_clx varchar(20),
	chk varchar(100),
	sender varchar(250) NOT NULL,
	receiver varchar(250) NOT NULL,
	PRIMARY KEY (msg_num)
);


CREATE TABLE noti
(
	noti_num int NOT NULL AUTO_INCREMENT,
	title varchar(1000),
	content varchar(4000),
	regdate datetime,
	id varchar(250) NOT NULL,
	PRIMARY KEY (noti_num)
);


CREATE TABLE noti_com
(
	noti_com_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	singo varchar(20),
	regdate datetime,
	id varchar(250) NOT NULL,
	noti_num int NOT NULL,
	PRIMARY KEY (noti_com_num)
);


CREATE TABLE photo
(
	photo_num int NOT NULL AUTO_INCREMENT,
	title varchar(1000),
	content varchar(4000),
	love int,
	secret varchar(20),
	singo int,
	regdate datetime,
	type varchar(20),
	photo_folder_num int NOT NULL,
	blind int,
	PRIMARY KEY (photo_num)
);


CREATE TABLE photo_com
(
	photo_com_num int NOT NULL AUTO_INCREMENT,
	singo varchar(20),
	content varchar(4000),
	regdate datetime,
	photo_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (photo_com_num)
);


CREATE TABLE photo_folder
(
	photo_folder_num int NOT NULL AUTO_INCREMENT,
	fname varchar(1000),
	regdate datetime,
	hompy_num int NOT NULL,
	PRIMARY KEY (photo_folder_num)
);


CREATE TABLE photo_love
(
	photo_love_num int NOT NULL AUTO_INCREMENT,
	id varchar(250) NOT NULL,
	photo_num int NOT NULL,
	PRIMARY KEY (photo_love_num)
);


CREATE TABLE photo_singo
(
	ps_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	photo_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (ps_num)
);


CREATE TABLE profile
(
	pro_num int NOT NULL AUTO_INCREMENT,
	todayis varchar(500),
	content varchar(4000),
	regdate datetime,
	org_name varchar(1000),
	save_name varchar(1000),
	hompy_num int NOT NULL,
	PRIMARY KEY (pro_num)
);


CREATE TABLE qna11
(
	qna11_num int NOT NULL AUTO_INCREMENT,
	title varchar(1000),
	content varchar(4000),
	regdate datetime,
	confirm varchar(20),
	id varchar(250) NOT NULL,
	PRIMARY KEY (qna11_num)
);


CREATE TABLE qna11_com
(
	qna11_com_num int NOT NULL AUTO_INCREMENT,
	content varchar(4000),
	regdate datetime,
	qna11_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (qna11_com_num)
);


CREATE TABLE room_posi
(
	room_posi_num int NOT NULL AUTO_INCREMENT,
	mini_num int NOT NULL,
	drag varchar(20),
	x double,
	y double,
	mine_num int NOT NULL,
	PRIMARY KEY (room_posi_num)
);


CREATE TABLE setup
(
	setup_num int NOT NULL AUTO_INCREMENT,
	hompy_num int NOT NULL,
	guest int,
	photo int,
	diary int,
	jukebox int,
	PRIMARY KEY (setup_num)
);


CREATE TABLE today
(
	today_num int NOT NULL AUTO_INCREMENT,
	regdate datetime,
	hompy_num int NOT NULL,
	id varchar(250) NOT NULL,
	PRIMARY KEY (today_num)
);



/* Create Foreign Keys */

ALTER TABLE ad
	ADD FOREIGN KEY (ader_num)
	REFERENCES ader (ader_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE admin_msg
	ADD FOREIGN KEY (sender)
	REFERENCES admin (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE noti
	ADD FOREIGN KEY (id)
	REFERENCES admin (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE qna11_com
	ADD FOREIGN KEY (id)
	REFERENCES admin (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE item
	ADD FOREIGN KEY (category_num)
	REFERENCES category (category_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_com
	ADD FOREIGN KEY (diary_num)
	REFERENCES diary (diary_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_love
	ADD FOREIGN KEY (diary_num)
	REFERENCES diary (diary_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_singo
	ADD FOREIGN KEY (diary_num)
	REFERENCES diary (diary_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary
	ADD FOREIGN KEY (diary_folder_num)
	REFERENCES diary_folder (diary_folder_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE guestbook_com
	ADD FOREIGN KEY (guest_num)
	REFERENCES guestbook (guest_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_folder
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE guestbook
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE hompy_posi
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE iu_com
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE miniroom
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_folder
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE profile
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE setup
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE today
	ADD FOREIGN KEY (hompy_num)
	REFERENCES hompy (hompy_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buy
	ADD FOREIGN KEY (item_num)
	REFERENCES item (item_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mine
	ADD FOREIGN KEY (item_num)
	REFERENCES item (item_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE admin_msg
	ADD FOREIGN KEY (receiver)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE buy
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE cash
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_love
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE diary_singo
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE guestbook
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE guestbook_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE hompy
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE iu
	ADD FOREIGN KEY (i_id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE iu
	ADD FOREIGN KEY (u_id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE iu_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE mine
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE msg
	ADD FOREIGN KEY (receiver)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE msg
	ADD FOREIGN KEY (sender)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE noti_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_com
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_love
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_singo
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE qna11
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE today
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE hompy_posi
	ADD FOREIGN KEY (mine_num)
	REFERENCES mine (mine_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE room_posi
	ADD FOREIGN KEY (mine_num)
	REFERENCES mine (mine_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE room_posi
	ADD FOREIGN KEY (mini_num)
	REFERENCES miniroom (mini_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE noti_com
	ADD FOREIGN KEY (noti_num)
	REFERENCES noti (noti_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_com
	ADD FOREIGN KEY (photo_num)
	REFERENCES photo (photo_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_love
	ADD FOREIGN KEY (photo_num)
	REFERENCES photo (photo_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo_singo
	ADD FOREIGN KEY (photo_num)
	REFERENCES photo (photo_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE photo
	ADD FOREIGN KEY (photo_folder_num)
	REFERENCES photo_folder (photo_folder_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE qna11_com
	ADD FOREIGN KEY (qna11_num)
	REFERENCES qna11 (qna11_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



