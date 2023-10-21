/*
--1. 도서중 가격이 가장 높은 가격을 검색하시오
--2. 도서중에서 가장 비싼 도서의 이름과 도서 가격을 검색하시오
--3. 도서를 구매한 적이 있는 고객의 이름을 검색하시오
--4. 도서를 구매한 적이 있는 고객의 이름 출력(서브쿼리 이용해서)
--5. 도서를 구매한 적이 없는 고객의 이름 출력(서브쿼리 이용해서)
--6. 도서를 구매한 적이 있는 고객의 이름을 검색하시오(조인)
--7. 고객의 이름과 고객의 판매액의 합을 검색(customer, orders)
--8. 고객의 이름과 고객의 판매액의 합을 검색(customer, orders), 단 고객번호가 2 이하임
--9. 8번의 답을 FROM 절에서 서브쿼리 방식으로 출력하기
--10. 상품 리뷰 테이블에 있는 상품코드와 상품 이름, 고객 아이디, 내용을 검색(SELECT 절에서 서브쿼리 이용하기)
--11. 리뷰가 없는 상품을 검색하시오
*/

--1. 도서중 가격이 가장 높은 가격을 검색하시오
SELECT MAX(price) FROM book_2;

--2. 도서중에서 가장 비싼 도서의 이름을 검색하시오
SELECT bookname FROM book_2
WHERE price = (SELECT MAX(price) FROM book_2);

--3. 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT name FROM customer_2
WHERE custid IN(SELECT custid FROM orders_2);

--4. 도서를 구매한 적이 있는 고객의 이름 출력(서브쿼리 이용해서)
SELECT name FROM customer_2
WHERE custid IN(SELECT custid FROM orders_2);

--5. 도서를 구매한 적이 없는 고객의 이름 출력(서브쿼리 이용해서)
SELECT name FROM customer_2
WHERE custid NOT IN(SELECT custid FROM orders_2);

--6. 도서를 구매한 적이 있는 고객의 이름을 검색하시오(조인)
SELECT DISTINCT cus.name 
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid;

--7. 고객의 이름과 고객의 판매액의 합을 검색(customer, orders)
SELECT cus.name, SUM(ord.saleprice) total
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

--8. 고객의 이름과 고객의 판매액의 합을 검색(customer, orders), 단 고객번호가 2 이하임
SELECT cus.name, SUM(ord.saleprice) total
FROM customer_2 cus, orders_2 ord
WHERE cus.custid = ord.custid AND cus.custid <= 2
GROUP BY cus.name;

--9. 8번의 답을 FROM 절에서 서브쿼리 방식으로 출력하기
SELECT cus.name, SUM(ord.saleprice) total
FROM (SELECT * FROM customer_2
        WHERE custid <= 2) cus, orders_2 ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;

--10. 상품 리뷰 테이블에 있는 상품코드와 상품 이름, 고객 아이디, 내용을 검색(SELECT 절에서 서브쿼리 이용하기)
SELECT product_code,
    (SELECT b.product_name FROM product_2 b 
    WHERE a.product_code = b.product_code) product_name,
        a.member_id,
        a.content
FROM product_review_2 a;