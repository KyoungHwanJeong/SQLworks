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

-- 조인 : 두 테이블을 서로 연결하여 사용하는 기법
-- 동등 조인(equi join) : 조인 조건이 정확히 일치하는 경우에 결과 출력
-- 외부 조인(outer join) : 조인 조건이 정확히 일치하지 않아도 모든 결과를 출력
-- 

select * from book;
select * from customer;
select * from orders;

-- 고객(customer)과 고객의 주문(order)에 관한 데이터를 모두 검색하시오
-- 고객 이름으로 정렬(자동으로 그룹화 됨)
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid       -- 카테시안곱: customer(6개) X orders(10개), id 중복제거를 하지 않으면 값이 중복되어 출력된다
ORDER BY cus.name;

-- 주문하지 않은 데이터도 모두 검색((+) : 외부 조인)
-- 조건이 일치하지 않은 테이블에 +를 넣어줌
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- 고객의 이름, 주문한 도서 이름, 주문일, 주문금액
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer cus, book bk, orders ord
WHERE cus.custid = ord.custid       -- 기본키 = 외래키
    AND bk.bookid = ord.bookid;
    
-- 고객(customer)과 고객의 주문(order)에 관한 데이터(주문하지 않은 고객 포함)를 모두 검색하시오    
-- 조건 : '박지성' 고객의 주문내역을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+) 
    --AND cus.name = '박지성'
ORDER BY cus.name;

-- 고객별 주문 금액의 총액을 출력
-- SUM은 그룹함수이기 때문에 GROUP BY 해줘야 함
SELECT cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name
ORDER BY cus.name asc;

-- 김연아 고객의 주문 총 금액을 출력(Having으로 제한을 둠)
SELECT cus.custid, cus.name, SUM(ord.saleprice)
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.custid, cus.name
    HAVING cus.name = '김연아'
ORDER BY cus.name asc;

-- 표준조인(ANSI SQL)
-- 내부조인(INNER JOIN)
-- 고객의 이름(customer)과 고객의 주문(orders)에 관한 데이터를 모두 검색하시오
-- 고객이 주문한 도서의 판매가격을 검색하시오
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord     -- INNER 는 생략 가능
    ON cus.custid = ord.custid
    ORDER BY cus.name;
    
-- 외부 조인(OUTER JOIN)
-- JOIN 조건에 충족하는 데이터가 아니어도 출력하는 기법
-- 고객(customer)과 고객의 주문(orders)에 관한 데이터중
-- 주문되지 않은 데이터를 포함하여 고객의 이름과 고객이 주문한
-- 도서의 판매가격을 검색하시오

SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord -- 고객이 다 나오게 하려면 고객이 왼쪽에 있으므로 LEFT OUTER JOIN을 한다. 주문이 다 나오게 하려면 RIGHT OUTER JOIN을 한다.
    ON cus.custid = ord.custid
ORDER BY cus.name;
