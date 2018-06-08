drop database forumdb;
create database forumdb;
use forumdb;
-- drop table board;
-- drop table forum;
-- drop table usertbl;

create table manager

(
   id varchar(16) not null,
   password varchar(20) not null,
   name varchar(50) not null,
   email1 varchar(50),
   email2 varchar(50),

   gender varchar(10),
   hobby varchar(20),
   register DATETIME,
   primary key(id)
); 

insert into manager values("manager1", "1234", "manager1", "asd", "naver", "female", "h2", "2016-11-22 11:11:11");
insert into manager values("manager2", "1234", "manager2", "asd", "naver", "male", "h2", "2016-11-22 11:11:11");
insert into manager values("manager3", "1234", "manager3", "asd", "naver", "female", "h2", "2016-11-22 11:11:11");
insert into manager values("manager4", "1234", "manager4", "asd", "naver", "female", "h2", "2016-11-22 11:11:11");
insert into manager values("manager5", "1234", "manager5", "asd", "naver", "female", "h2", "2016-11-22 11:11:11");

create table member

(
   id varchar(16) not null,
   password varchar(20) not null,
   name varchar(50) not null,
   email1 varchar(50),
   email2 varchar(50),
   gender varchar(10),
   hobby varchar(20),
   register DATETIME,
   primary key(id)
); 

create table usertbl
(
   userid varchar(16) not null,
   passwd varchar(20) not null,
   nm varchar(50) not null,
   email varchar(50),
   intro varchar(255),
   regdate DATETIME,
   primary key(userid)
); 

create table board
(
   id     integer,
   userid varchar(16) not null,
   regdate DATETIME,
   hit integer,
   title varchar(80),
   body varchar(255),
   fname varchar( 80),
   primary key(id),
   FOREIGN KEY (userid)
        REFERENCES member(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
); 

create table qaboard
(
   id     integer,
   userid varchar(16) not null,
   regdate DATETIME,
   hit integer,
   title varchar(80),
   body varchar(255),
   fname varchar(80),
   primary key(id),
   FOREIGN KEY (userid)
        REFERENCES member(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
); 

create table forum
(
   id     integer,
   userid varchar(16) not null,
   regdate DATETIME,
   hit integer,
   title varchar(80),
   body varchar(255),
   fname varchar(80),
   refid integer,
   lev integer,
   pos varchar(80),
   primary key(id),
   FOREIGN KEY (userid)
        REFERENCES usertbl(userid)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
   FOREIGN KEY (refid)
        REFERENCES forum(id)
); 


create table goods
(
   goods_no int ,
   goods_name varchar(16) not null,
   goods_price int,
   goods_fname varchar(40),
   primary key(goods_no)

); 


show tables;