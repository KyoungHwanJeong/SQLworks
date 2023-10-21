/*
-- 1. 주문 번호, 음료 코드, 음료 이름, 주문 수량을 출력하시오(동등조인을 이용해서)
-- 2. 주문 번호, 음료 코드, 음료 이름, 주문 수량을 출력하시오(내부조인을 이용해서)
-- 3. 주문 번호, 음료 코드, 음료 이름, 주문 수량을 출력하시오(JOIN ~ USING을 이용해서)
-- 4. 주문이 없는 음료를 포함하여 모든 주문 정보를 출력하시오
*/
-- 테이블 생성, 자료 삽입
CREATE TABLE drink_2(
    drink_code  VARCHAR2(3)  NOT NULL PRIMARY KEY,   -- 음료 코드
    drink_name  VARCHAR2(30) NOT NULL                -- 음료 이름
);

CREATE TABLE cafe_order_2(
    order_no    VARCHAR2(10) PRIMARY KEY,            -- 주문 번호
    drink_code  VARCHAR2(3) NOT NULL,                -- 음료 코드
    order_cnt   NUMBER NOT NULL,                     -- 주문 수량
    FOREIGN KEY (drink_code) REFERENCES drink(drink_code)      -- 외래키
);
// 음료
INSERT INTO drink_2 VALUES('A01', '아메리카노');
INSERT INTO drink_2 VALUES('B01', '카페라떼');
INSERT INTO drink_2 VALUES('C01', '자몽');
// 주문
INSERT INTO cafe_order_2 VALUES('2023100101', 'A01', 3);
INSERT INTO cafe_order_2 VALUES('2023100102', 'B01', 1);
INSERT INTO cafe_order_2 VALUES('2023100123', 'A01', 2);

COMMIT;

SELECT * FROM drink_2;
SELECT * FROM cafe_order_2;

-- 1. 주문 번호, 음료 코드, 음료 이름, 주문 수량을 출력하시오(동등조인을 이용해서)
SELECT B.order_no, A.drink_code, A.drink_name, B.order_cnt
FROM drink_2 A, cafe_order_2 B
WHERE A.drink_code = B.drink_code;

-- 2. 주문 번호, 음료 코드, 음료 이름, 주문 수량을 출력하시오(내부조인을 이용해서)
SELECT B.order_no, A.drink_code, A.drink_name, B.order_cnt
FROM drink_2 A INNER JOIN cafe_order_2 B
    ON A.drink_code = B.drink_code;

-- 3. 주문 번호, 음료 코드, 음료 이름, 주문 수량을 출력하시오(JOIN ~ USING을 이용해서)
SELECT B.order_no, drink_code, A.drink_name, B.order_cnt
FROM drink_2 A JOIN cafe_order_2 B
    USING (drink_code);
    
-- 4. 주문이 없는 음료를 포함하여 모든 주문 정보를 출력하시오
SELECT B.order_no, A.drink_code, A.drink_name, B.order_cnt
FROM drink_2 A LEFT OUTER JOIN cafe_order_2 B
    ON A.drink_code = B.drink_code;
