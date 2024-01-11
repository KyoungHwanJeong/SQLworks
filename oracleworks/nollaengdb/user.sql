--user table
create TABLE users(
    user_no      INT,
    user_id       VARCHAR2(20) unique,
    user_passwd   VARCHAR2(20) NOT NULL,
    user_name     VARCHAR2(30) NOT NULL,
    user_phone    VARCHAR2(20),
    user_addr     varchar2(60),
    user_joindate TIMESTAMP DEFAULT SYSTIMESTAMP,
    PRIMARY KEY(user_no)
);

create sequence seq_user_no nocache;


drop table Users;
drop sequence seq_user_no;


commit;
insert into users (user_no, user_id, user_passwd, user_name, user_phone, user_addr)
values(seq_user_no.nextval, 'ubin', 'u1234567', '장유빈', '010-1234-5678','서울특별시 당산로82');

commit;
select * from users;    -- 전체 출력

SELECT * FROM users ORDER BY user_no;

SELECT COUNT(*) AS count FROM users WHERE user_id = 'ubin';

--id중복확인
SELECT DECODE(count(*), 1, 'true', 'false') as result
FROM users WHERE user_id = 'ubin';