/*
1. ex3 테이블에 NULL을 허용한 가변길이 문자(10 Byte) col_null, NULL 을 허용하지 않는 가변길이 문자(10 Byte) col_not_null을
선언한다.
2. 값 (' ', 'hello')와 ('안녕', '')을 넣고 커밋 후 전체 조회하기
*/
CREATE TABLE ex3_2(
    col_null VARCHAR2(10),
    col_not_null VARCHAR2(10) NOT NULL
);

INSERT INTO ex3_2 VALUES (' ', 'hello');
INSERT INTO ex3_2 VALUES ('안녕',  '');   -- null 을 넣을 수 없어서 에러

COMMIT;

SELECT * FROM ex3_2;
