/*
조인(join)
-- 1. 고객 이름과 고객의 주문 가격에 관한 데이터를 모두 검색하시오
-- 2. 주문하지 않은 데이터도 모두 검색하고 이름 순으로 정렬하기((+) : 외부 조인)
-- 3. 고객의 이름, 주문한 도서 이름, 주문일, 주문금액을 검색하기
-- 4. 고객(customer)과 고객의 주문(order)에 관한 데이터(주문하지 않은 고객 포함)를 모두 검색해서 이름순으로 정렬하시오
-- 5. 박지성 고객의 주문(order)에 관한 데이터(주문하지 않은 고객 포함)를 모두 검색해서 이름순으로 정렬하시오
-- 6. 고객별 주문 금액의 총액을 이름순으로 정렬하여 출력하시오
-- 7. 김연아 고객의 주문 총 금액을 출력하시오(Having으로 제한을 둠)
-- 8. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오(내부조인)
-- 9. 고객(customer)과 고객의 주문(orders)에 관한 데이터중 주문되지 않은 데이터를 포함하여 고객의 이름과 고객이 주문한
    도서의 판매가격을 검색하시오(외부조인)
*/
-- 1. 고객(customer)과 고객의 주문(order)에 관한 데이터를 모두 검색하시오
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
ORDER BY cus.name;

-- 2. 주문하지 않은 데이터도 모두 검색하고 이름 순으로 정렬하기((+) : 외부 조인)
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- 3. 고객의 이름, 주문한 도서 이름, 주문일, 주문금액을 검색하기
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer_2 cus, book_2 bk, orders_2 ord
WHERE cus.custid = ord.custid AND bk.bookid = ord.bookid;

-- 4. 고객(customer)과 고객의 주문(order)에 관한 데이터를 모두 검색해서 이름순으로 정렬하시오
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- 5. 박지성 고객의 주문(order)에 관한 데이터(주문하지 않은 고객 포함)를 모두 검색해서 이름순으로 정렬하시오
SELECT cus.name, ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid(+) AND cus.name = '박지성'
ORDER BY cus.name;

-- 6. 고객별 주문 금액의 총액을 이름순으로 정렬하여 출력하시오
SELECT cus.name, SUM(ord.saleprice)
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
ORDER BY cus.name;

-- 7. 김연아 고객의 주문 총 금액을 출력하시오(Having으로 제한을 둠)
SELECT cus.name, SUM(ord.saleprice)
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
    HAVING cus.name = '김연아'
GROUP BY cus.name;

-- 내부조인
-- 8. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오(내부조인)
SELECT name, saleprice
FROM customer_2 cus INNER JOIN orders_2 ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- 외부조인
-- 9. 고객(customer)과 고객의 주문(orders)에 관한 데이터중 주문되지 않은 데이터를 포함하여 고객의 이름과 고객이 주문한
--  도서의 판매가격을 검색하시오(외부조인)
SELECT name, saleprice
FROM customer_2 cus LEFT OUTER JOIN orders_2 ord
    ON cus.custid = ord.custid
    ORDER BY cus.name;
