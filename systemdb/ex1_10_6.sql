/*
1. ex1 테이블의 colum1, colum2에 고정길이 문자(10 Byte), 가변길이 문자(10 Byte)를 선언한다.
2. colum1, colum2에 값 'abc', 'abc'를 넣고 '당산', '당산'을 넣는다
3. 커밋 후 전체 데이터 조회하기.
*/
-- 스키마:system
-- 테이블
CREATE TABLE ex1(
    colum1 CHAR(10),    -- 고정길이 문자(10 Byte)
    colum2 VARCHAR2(10) -- 가변길이 문자(10 Byte)
);

-- 데이터 추가
INSERT INTO ex1(colum1, colum2) VALUES ('abc', 'abc');  -- SQL은 ' '를 쓴다
INSERT INTO ex1 VALUES ('당산', '당산');

-- 데이터 조회
SELECT colum1, LENGTH(colum1),colum2 ,LENGTH(colum2) FROM ex1;  -- LENGTH()함수: colum의 길이.

-- 트랜잭션(데이터 영속화, 임시저장) : COMMIT, ROLLBACK
COMMIT;

DROP TABLE ex1;