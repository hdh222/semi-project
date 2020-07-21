create table member (
user_id varchar2(100) primary key,
user_pwd varchar2(100) not null,
user_name varchar2(100) not null,
user_sex number not null,
user_phone varchar2(100),
user_addr varchar2(100)
);
