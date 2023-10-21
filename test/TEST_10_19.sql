-- test 테이블 생성
CREATE TABLE test(
    action  VARCHAR2(2000)
);

INSERT INTO test VALUES('계정 및 권한 부여를 합니다.');

COMMIT;
DROP TABLE test;