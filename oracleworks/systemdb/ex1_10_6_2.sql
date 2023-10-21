/*
1. ex1 테이블의 colum1, colum2에 고정길이 문자(10 Byte), 가변길이 문자(10 Byte)를 선언한다.
2. colum1, colum2에 값 'abc', 'abc'를 넣고 '당산', '당산'을 넣는다
3. 커밋 후 전체 데이터 조회하기.
*/

CREATE TABLE ex1_2(
    colum1 CHAR(10),
    colum2 VARCHAR2(10)
);

INSERT INTO ex1_2(colum1, colum2) VALUES ('abc', 'abc');
INSERT INTO ex1_2 VALUES('당산', '당산');

-- 커밋
COMMIT;

-- 전체 조회
SELECT colum1, LENGTH(colum1), colum2, LENGTH(colum2) FROM  ex1_2;
