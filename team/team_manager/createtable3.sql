--drop database forumdb;
--create database forumdb;
use forumdb;
 --drop table board;
-- drop table forum;
-- drop table usertbl;




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
   fname varchar(80),
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



show tables;
