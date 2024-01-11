/*
1. ex2 테이블에 날짜 자료형 col_date, 날짜와 시간 자료형 col_timestamp를 선언한다.
2. 현재 날짜와 시간을 넣는다(SYSDATE, SYSTIMESTAMP)
3. 커밋 후 전체 데이터 조회하기
4. 가변 길이 문자(20 Byte)로 입사일(hire_date) 칼럼을 추가하고 '2023-09-01'을 넣고 커밋 후 전체 데이터 조회하기
*/
CREATE TABLE ex2_2(
    col_date DATE,
    col_timestamp TIMESTAMP
);

INSERT INTO ex2_2 VALUES(SYSDATE, SYSTIMESTAMP);

COMMIT;

SELECT * FROM ex2_2;

ALTER TABLE ex2_2 ADD hire_date VARCHAR2(20);

INSERT INTO ex2_2 (hire_date) VALUES('2023-09-01');

COMMIT;
SELECT *FROM ex2_2;

