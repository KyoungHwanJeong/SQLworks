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