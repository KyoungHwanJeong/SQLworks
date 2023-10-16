/*
-- 1. 주문테이블 칼럼의 자료형 구조 출력하기
-- 2. 별칭 '총판매건수'를 넣어서 총 판매건수를 출력하기
-- 3. 별칭 '총판매액', '총평균액'을 넣어서 고객이 주문한 도서의 총 판매액과 총 평균액을 계산하기
-- 4. 별칭 '총판매액'을 넣어서 고객이 주문한 도서의 총 판매액을 계산하기
-- 5. 도서 수량이 3권이상인 고객의 고객 아이디, 도서수량, 총판매액(별칭)을 계산하고 출력하기(GROUP BY절, HAVING절 이용)
-- 6. 도서 수량이 3권이상이고 총 판매액이 35000 이상인 도서의 고객 아이디와 총 판매액과 도서 수량을 계산하기
-- 7. 총 고객 수와 전화번호 수를 검색하기
-- 8. 도서 중에서 최대가격, 최저가격 을 출력하기
-- 9. '3번 고객(안산)'이 주문한 도서의 총 판매액을 계산하기
--10. 3번 고객의 아이디와 주문 가격을 검색하기
--11. 고객의 아이디와 도서이름과 주문 가격을 검색하기
--12. 고객의 이름과 고객이 주문한 주문 가격을 검색하기(customer, order 조인)
--13. 12번을 별칭('cus', 'ord')을 사용하여 조인하기
--14. 12번을 별칭('cus', 'ord')을 사용하여 조인하고, 고객 이름별로 1차 정렬(오름차순), 주문 가격별로 2차 정렬(내림차순)하시오
--15. 3번 고객의 아이디와 도서이름과 주문 가격을 검색하기
--16. 3번 고객의 아이디와 도서이름과 주문 가격을 검색하기(테이블 3개 쓰기 customer, book, order)
*/
-- 주문 테이블의 칼럼, 자료형 구조
SELECT * FROM orders;
DESC orders;

-- 통계 함수 - 개수(COUNT), 합계(SUM), 평균(AVG), 최대값(MAX), 최소값(MIN)
-- COUNT(*) : '*' - 칼럼명
-- COUNT(칼럼명) : 
SELECT COUNT(*) AS 총판매건수 -- 별칭은 붙여서 쓴다
FROM orders;

-- 고객이 주문한 도서의 총 판매액과 총 평균액 계산
SELECT  SUM(saleprice) AS 총판매액,
        AVG(saleprice) AS 총평균액
FROM orders;

-- 고객이 주문한 도서의 총 판매액 계산
SELECT SUM(saleprice) AS 총판매액
FROM orders;

-- 고객별로 주문한 도서의 총 판매액과 도서 수량을 계산
-- 도서 수량이 3권 이상인 자료 검색(HAVING)
-- HAVING 절 사용 - GROUP BY절에서 조건이 있을 때 사용한다.
-- GROUP BY 칼럼명
SELECT  custid,
        COUNT(*) AS 도서수량,
        SUM(saleprice) AS 총판매액
FROM orders
GROUP BY custid
HAVING COUNT(*) >=3;

-- 도서 수량이 3권이상이고 총 판매액이 35000 이상인 도서의 고객 아이디와 총 판매액과 도서 수량을 계산
SELECT  custid,
        COUNT(*) AS 도서수량,
        SUM(saleprice) AS 총판매액
FROM orders
GROUP BY custid
HAVING COUNT(*) >=3
    AND SUM(saleprice) > 35000;

-- 총 고객 수와 전화번호 수를 검색
SELECT COUNT(*) AS 총고객수, COUNT(phone) AS 전화번호수
FROM customer;

-- 도서 중에서 최대가격, 최저가격 알기
SELECT MAX(price) 최고가격, MIN(price) 최저가격
FROM book;

-- '3번 고객(안산)'이 주문한 도서의 총 판매액 구하기
SELECT SUM(saleprice) AS 총판매액
from orders
where custid = 3;

-- 3번 고객의 아이디와 주문 가격을 검색
select custid, saleprice
from orders
where custid = 3;

-- 고객의 아이디와 도서이름과 주문 가격을 검색
select custid, bookname, saleprice
from orders, book
where orders.bookid = book.bookid;

-- 조인(Join)
-- 동등조인(EQUI JOIN): equal(=)을 사용하는 조인
-- 테이블A.칼럼명 = 테이블B.칼럼명 (이때 칼럼 - 외래키)

-- 고객의 이름과 고객이 주문한 주문 가격을 검색하시오(customer, order 조인)
select customer.name, orders.saleprice
from customer, orders
where customer.custid = orders.custid;

-- 별칭 사용 조인
select cus.name, ord.saleprice
from customer cus, orders ord   -- as 생략가능
where cus.custid = ord.custid;

-- 별칭 사용 조인
-- 고객 이름별 1차 정렬(오름차순, asc), 주문 가격별 내림차순 2차 정렬(desc)
select cus.name, ord.saleprice
from customer cus, orders ord   -- as 생략가능
where cus.custid = ord.custid
order by cus.name, ord.saleprice desc;

-- 3번 고객의 아이디와 도서이름과 주문 가격을 검색
select custid, bookname, saleprice
from orders, book
where orders.bookid = book.bookid
    and orders.custid = 3;

-- 3번 고객의 아이디와 도서이름과 주문 가격을 검색(테이블 3개 쓰기)
select customer.custid, book.bookname, orders.saleprice
from orders, customer, book
where orders.custid = customer.custid
and orders.bookid = book.bookid
and customer.name = '안산';

-- 전체 출력
select * from orders;   -- 전체 조회는 *을 사용한다