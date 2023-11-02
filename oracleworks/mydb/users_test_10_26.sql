CREATE TABLE users_3 (

    userid VARCHAR2(20) PRIMARY KEY,

    username VARCHAR2(30) NOT NULL,

    userpassword VARCHAR2(50) NOT NULL,

    userage NUMBER(3) NOT NULL,

    useremail VARCHAR2(50) NOT NULL

);
commit;
select * from users_3;
drop table users_3;