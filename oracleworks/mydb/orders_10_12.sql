/*
주문 테이블
1. order 테이블을 생성한다
    주문 아이디(PK), 고객 아이디(NOT NULL), 도서 아이디(NOT NULL), 도서 가격(NOT NULL), 주문 날짜(20 byte)(NOT NULL),
    고객 아이디(FK), 도서 아이디(FK)
2. 주문 데이터
    (1, 1, 1, 6000, '2018-07-01')
    (2, 1, 3, 21000, '2018-07-03')
    (3, 2, 5, 8000, '2018-07-03')
    (4, 3, 6, 6000, '2018-07-04')
    (5, 4, 7, 20000, '2018-07-05')
    
    (6, 1, 2, 12000, '2018-07-07')
    (7, 4, 8, 13000, '2018-07-07')
    (8, 3, 10, 12000, '2018-07-08')
    (9, 2, 10, 7000, '2018-07-09')
    (10, 3, 8, 13000, '2018-07-10')
    를 생성한다
*/

-- 주문 테이블 생성
CREATE TABLE orders(
    orderid     NUMBER PRIMARY KEY,
    custid      NUMBER NOT NULL,
    bookid      NUMBER NOT NULL,
    saleprice   NUMBER NOT NULL,
    orderdate   VARCHAR2(20) NOT NULL,
    FOREIGN KEY (custid) REFERENCES customer(custid),   -- 외래키
    FOREIGN KEY (bookid) REFERENCES book(bookid)   -- 외래키
);

-- 주문 데이터 추가
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (1, 1, 1, 6000, '2018-07-01');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (2, 1, 3, 21000, '2018-07-03');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (3, 2, 5, 8000, '2018-07-03');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (4, 3, 6, 6000, '2018-07-04');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (5, 4, 7, 20000, '2018-07-05');

INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (6, 1, 2, 12000, '2018-07-07');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (7, 4, 8, 13000, '2018-07-07');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (8, 3, 10, 12000, '2018-07-08');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (9, 2, 10, 7000, '2018-07-09');
INSERT INTO orders(orderid, custid, bookid, saleprice, orderdate)
VALUES (10, 3, 8, 13000, '2018-07-10');

COMMIT;

DROP TABLE orders;
