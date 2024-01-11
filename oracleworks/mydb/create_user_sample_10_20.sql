-- USER 삭제 
DROP USER c##sample;

-- USER 삭제 이하 데이터까지 삭제
DROP USER c##sample CASCADE;

CREATE USER c##SAMPLE IDENTIFIED BY pw1234;

-- USER 비밀번호 변경
ALTER USER c##sample IDENTIFIED BY pw12345;

GRANT CREATE SESSION TO c##SAMPLE;

GRANT CREATE TABLE, RESOURCE TO c##SAMPLE;

GRANT CONNECT, DBA TO c##SAMPLE;