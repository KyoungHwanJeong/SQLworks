-- jweb user 계정(db) : c##mydb

-- c##을 붙이지 않는 방법
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- jweb user 계정(db)
CREATE USER jweb IDENTIFIED BY pwjweb;

-- 권한 부여, 리소스 공간 확보
GRANT CONNECT, RESOURCE, DBA TO jweb;