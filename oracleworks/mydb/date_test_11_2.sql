-- 날짜 칼럼 
-- 1. DATE DEFAULT SYSTEM (현재 날짜와 시간)
-- 2. DATE (특정날짜)

SELECT SYSDATE FROM DUAL;
-- 날짜
SELECT * FROM book;

-- 날짜와 시간
SELECT SYSTIMESTAMP FROM DUAL;

-- 20일 전의 날짜 출력
SELECT SYSDATE - 20 FROM DUAL;

-- 특정한 날에서 20일 전의 날짜 출력
SELECT TO_DATE('2023-10-25') - 20 FROM DUAL;

-- 서점의 주문 확정일자
SELECT  orderid 주문번호,
        orderdate 주문일,
        TO_DATE(orderdate) + 10 확정일
FROM orders;

CREATE TABLE date_test1(
    reg_date    DATE,
    hire_date   DATE
);
-- 추가 1.
INSERT INTO date_test1 VALUES (SYSDATE, '2023-11-01');
INSERT INTO date_test1 VALUES (SYSDATE, TO_DATE('2023-11-01'));

-- 자바 클래스와 연동시에 
CREATE TABLE date_test2(
    reg_date    DATE DEFAULT SYSDATE,
    hire_date   DATE
);
-- 추가 2.
INSERT INTO date_test2(hire_date) VALUES ('2023-11-01');
INSERT INTO date_test2 VALUES (SYSDATE, TO_DATE('2023-11-01'));

SELECT * FROM date_test1;
SELECT * FROM date_test2;

COMMIT;
DROP TABLE date_test1;
DROP TABLE date_test2;