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

-- 1. 주문테이블 칼럼의 자료형 구조 출력하기
SELECT * FROM orders_2;
DESC orders_2;

-- 2. 별칭 '총판매건수'를 넣어서 총 판매건수를 출력하기
SELECT count(*) AS 총판매건수
FROM orders_2;

-- 3. 별칭 '총판매액', '총평균액'을 넣어서 고객이 주문한 도서의 총 판매액과 총 평균액을 계산하기
SELECT  SUM(saleprice) AS 총판매액,
        AVG(saleprice) AS 총평균액
FROM orders_2;

-- 4. 별칭 '총판매액'을 넣어서 고객이 주문한 도서의 총 판매액을 계산하기
SELECT SUM(saleprice) AS 총판매액
FROM orders_2;

-- 5. 도서 수량이 3권이상인 고객의 고객 아이디, 도서수량, 총판매액(별칭)을 계산하고 출력하기(GROUP BY절, HAVING절 이용)
SELECT  custid AS 고객아이디,
        COUNT(*) AS 도서수량,
        SUM(saleprice) AS 총판매액
FROM orders_2
GROUP BY custid
HAVING COUNT(*) >= 3;

-- 6. 도서 수량이 3권이상이고 총 판매액이 35000 이상인 도서의 고객 아이디와 총 판매액과 도서 수량을 계산하기
SELECT  custid AS 고객아이디,
        SUM(saleprice) AS 총판매액,
        COUNT(*) AS 도서수량
FROM orders_2
GROUP BY custid
HAVING COUNT(*) >= 3 AND SUM(saleprice) >= 35000;

-- 7. 총 고객 수와 전화번호 수를 검색하기
SELECT COUNT(*) AS 총고객수, COUNT(phone) AS 전화번호수
FROM customer_2;

-- 8. 도서 중에서 최대가격, 최저가격 을 출력하기
SELECT MAX(price) 최고가격, MIN(price) 최저가격
FROM book_2;

-- 9. '3번 고객(안산)'이 주문한 도서의 총 판매액을 계산하기
SELECT SUM(saleprice) AS 총판매액
FROM orders_2
WHERE custid = 3;

--10. 3번 고객의 아이디와 주문 가격을 검색하기
SELECT custid, saleprice
FROM orders_2
WHERE custid = 3;

--11. 고객의 아이디와 도서이름과 주문 가격을 검색하기
SELECT custid, bookname, saleprice
FROM orders_2, book_2
WHERE orders_2.bookid = book_2.bookid;

--12. 고객의 이름과 고객이 주문한 주문 가격을 검색하기(customer, order 조인)
SELECT customer_2.name, orders_2.saleprice
FROM customer_2, orders_2
WHERE customer_2.custid = orders_2.custid;

--13. 12번을 별칭('cus', 'ord')을 사용하여 조인하기
SELECT cus.name , ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid;

--14. 12번을 별칭('cus', 'ord')을 사용하여 조인하고, 고객 이름별로 1차 정렬(오름차순), 주문 가격별로 2차 정렬(내림차순)하시오
SELECT cus.name , ord.saleprice
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
ORDER BY cus.name ASC, ord.saleprice DESC;

--15. 3번 고객의 아이디와 도서이름과 주문 가격을 검색하기
SELECT custid, bookname, saleprice
FROM orders_2, book_2
WHERE orders_2.bookid = book_2.bookid AND orders_2.custid = 3;
