/*
1. ex3 테이블에 NULL을 허용한 가변길이 문자(10 Byte) col_null, NULL 을 허용하지 않는 가변길이 문자(10 Byte) col_not_null을
선언한다.
2. 값 (' ', 'hello')와 ('안녕', '')을 넣고 커밋 후 전체 조회하기
*/
-- ex3 테이블 생성
CREATE TABLE ex3(
    col_null VARCHAR2(10),  -- NULL 허용.
    col_not_null VARCHAR2(10) NOT NULL  -- NULL 불허.

);
INSERT INTO ex3 VALUES(' ', 'hello');
INSERT INTO ex3 VALUES('안녕', '');   -- null 에러(null을 넣을 수 없음)

COMMIT;

SELECT * FROM ex3;

DROP TABLE ex3;