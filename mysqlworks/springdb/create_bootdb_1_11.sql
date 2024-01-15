-- 계정 : myuser, 비번: pwmyuser 만들기
create user 'springuser'@'localhost' identified by 'pwspring';

-- myuser에게 모든 권한 부여
grant all privileges on *.* to 'myuser'@'localhost';

--
create database bootdb;

use bootdb;

desc board;
select * from board;