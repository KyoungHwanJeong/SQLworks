-- 계정 : jweb, 비번: pwjweb 만들기
create user 'jweb'@'localhost' identified by 'pwjweb';

-- myuser에게 모든 권한 부여
grant all privileges on *.* to 'jweb'@'localhost';