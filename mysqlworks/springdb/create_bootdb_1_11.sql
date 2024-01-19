-- 계정 : myuser, 비번: pwmyuser 만들기
create user 'springuser'@'localhost' identified by 'pwspring';

-- springuser에게 모든 권한 부여
grant all privileges on *.* to 'springuser'@'localhost';

--
create database bootdb;

use bootdb;

desc board;
select * from tbl_board;
select * from tbl_member;
select * from tbl_member2;

select * from board order by desc;
select * from board;

delete from tbl_board where id=9;
delete from board;

update tbl_board set board_hits=0 where id;

truncate tbl_board;