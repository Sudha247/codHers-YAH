/* Creating a new database for Complain Lodging Portal */
DROP DATABASE CLP;
CREATE DATABASE CLP;
USE CLP;

/* Create a new table for general public */
DROP TABLE PUBLIC;
CREATE TABLE PUBLIC(
#___Public User ID, generated after otp check___
p_uid VARCHAR(10) PRIMARY KEY,
#___Password, generated with user id, hashed___
p_pwd VARCHAR(100),
#___First Name___
p_fname VARCHAR(100),
#___Last Name___
p_lname VARCHAR(100),
#___Date of birth, check to see if 18___
p_dob DATE,
#___Phone Number, send otp and validate___
p_ph NUMERIC NOT NULL UNIQUE,
#___Email ID___
p_email VARCHAR(100),
#___Address Line1___
p_addr_l1 VARCHAR(100),
#___Address Line2___
p_addr_l2 VARCHAR(100),
#___Address Pincode___
p_addr_pincode NUMERIC,
#___Address City___
p_addr_city VARCHAR(100),
#___Address State___
p_addr_state VARCHAR(100)
);

/*Create a new table to store complaints*/
DROP TABLE COMPLAINTS;
CREATE TABLE COMPLAINTS(
#___Complaint ID, generate after user submits___
c_id VARCHAR(10) PRIMARY KEY,
#___Department____
c_dept VARCHAR(100),
#___Subject of complaint___
c_subject VARCHAR(100),
#___Text of complaint___
c_text LONGTEXT,
#___Time of most recent reask___
c_time_of_lodging DATETIME,
#___Resolve status. TRUE if resolved___
c_status BOOLEAN,
#___Resolve update. An explanation by official who resolved___
c_resolve_update LONGTEXT
);

/*Create a new table for officials*/
DROP TABLE OFFICIALS;
CREATE TABLE OFFICIALS(
#___Official user id___
o_uid VARCHAR(10) PRIMARY KEY,
#___Password, hashed___
o_pwd VARCHAR(100),
#___First Name___
o_fname VARCHAR(100),
#___Last Name___
o_lname VARCHAR(100),
#___Department___
o_dept VARCHAR(100),
#___Designation___
o_designation VARCHAR(100)
);

/*Create a new table for public-complaints*/
DROP TABLE PUBLIC_COMPLAINTS;
CREATE TABLE PUBLIC_COMPLAINTS(
#___uid of public user who lodged/reasked complaint___
p_uid_f VARCHAR(10) REFERENCES PUBLIC(p_uid),
#___id of complaint___
c_id_uf VARCHAR(10) REFERENCES COMPLAINTS(c_id),
#___time when complaint was lodged/reasked____
time_of_lodging DATETIME
);

/*Create a new table for official-complaints*/
DROP TABLE OFFICIAL_COMPLAINTS;
CREATE TABLE OFFICIAL_COMPLAINTS(
#___uid of official who resolved complaint___
po_uid_f VARCHAR(10) REFERENCES OFFICIALS(p_uid),
#___id of complaint___
c_id_of VARCHAR(10) REFERENCES COMPLAINTS(c_id),
#___time when complaint was resolved____
time_of_resolving DATETIME
);




insert into COMPLAINTS values ("100","Railways","blah","blah blah","2018-08-18 00:00:00", FALSE, "bllaahh");
insert into COMPLAINTS values ("101","pwd","blah","blah blah","2018-08-18 00:00:00", FALSE, "bllaahh");
insert into COMPLAINTS values ("102","edu","blah","blah blah","2018-08-18 00:00:00", FALSE, "bllaahh");
insert into COMPLAINTS values ("103","edu","blah","blah blah","2018-08-18 00:00:00", FALSE, "bllaahh");

insert into PUBLIC values ("u1","pass1","f1","l1",'2018-08-18',1231,"e1","a11","a21",123,"c1","s2");
insert into PUBLIC values ("u2","pass1","f1","l1",'2018-08-18',1232,"e1","a11","a21",123,"c1","s2");
insert into PUBLIC values ("u3","pass1","f1","l1",'2018-08-18',1233,"e1","a11","a21",123,"c1","s2");


insert into PUBLIC_COMPLAINTS values ("u1","100",'2018-08-18 00:00:00');
insert into PUBLIC_COMPLAINTS values ("u1","101",'2018-08-18 00:00:00');
insert into PUBLIC_COMPLAINTS values ("u2","102",'2018-08-18 00:00:00');
insert into PUBLIC_COMPLAINTS values ("u2","100",'2018-08-18 00:00:00');
insert into PUBLIC_COMPLAINTS values ("u2","103",'2018-08-18 00:00:00');
insert into PUBLIC_COMPLAINTS values ("u1","103",'2018-08-18 00:00:00');
