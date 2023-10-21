-- USER 삭제 
DROP USER c##sample;

-- USER 삭제 이하 데이터까지 삭제
DROP USER c##sample CASCADE;

-- 새로운 사용자(user) 생성
CREATE USER c##mydb IDENTIFIED BY pwmydb;

--  세션(저장을 유지)을 생성할 권한 부여
GRANT CREATE SESSION TO c##mydb;

-- 테이블, 자원(resource) 생성할 권한 부여
GRANT CREATE TABLE, RESOURCE TO c##mydb;

-- DBA에 접속(연결)할 권한 부여
GRANT CONNECT, DBA TO c##mydb;
