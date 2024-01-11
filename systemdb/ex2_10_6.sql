/*
1. ex2 테이블에 날짜 자료형 col_date, 날짜와 시간 자료형 col_timestamp를 선언한다.
2. 현재 날짜와 시간을 넣는다(SYSDATE, SYSTIMESTAMP)
3. 커밋 후 전체 데이터 조회하기
4. 가변 길이 문자(20 Byte)로 입사일(hire_date) 칼럼을 추가하고 '2023-09-01'을 넣고 커밋 후 전체 데이터 조회하기
*/
-- 테이블 생성(CREATE)
CREATE TABLE ex2(
    col_date DATE,   -- 날짜 자료형(시스템의 현재 날짜)
    col_timestamp TIMESTAMP -- 날짜와 시간 자료형
);
-- 현재 날짜 삽입(INSERT)
INSERT INTO ex2 VALUES (SYSDATE, SYSTIMESTAMP);
INSERT INTO ex2 (hire_date) VALUES ('2023-09-01');

COMMIT;

SELECT * FROM ex2;

-- 새로운 칼럼명 추가(ALTER): 입사일 칼럼 추가
ALTER TABLE ex2 ADD hire_date VARCHAR2(20);

-- 테이블 삭제(DROP)
DROP TABLE ex2;