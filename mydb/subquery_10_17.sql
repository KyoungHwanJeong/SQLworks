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
-- 서브 쿼리(Sub Query): 부속질의(중첩 쿼리)
-- SELECT문 내부에 또 SELECT문이 존재함

-- 도서중 가격이 가장 높은 가격을 검색하시오
-- MAX(price) : 35000
SELECT MAX(price) FROM book;

-- 도서중에서 가장 비싼 도서의 이름과 도서 가격을 검색하시오
SELECT bookname, price
FROM book
WHERE price = 
      (SELECT MAX(price) FROM book);
      
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT custid FROM orders;
/*
SELECT name
FROM customer
WHERE custid IN(1, 2, 3, 4);
*/
SELECT name
FROM customer
WHERE custid IN(SELECT custid FROM orders);

-- 다중행 서브쿼리 (WHERE 절)
-- 도서를 구매한 적이 있는 고객의 이름 출력
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);

-- 다중행 서브쿼리 (WHERE 절)
-- 도서를 구매한 적이 없는 고객의 이름 출력
SELECT name
FROM customer
WHERE custid NOT IN (SELECT custid FROM orders);

-- 조인 방식 : customer, orders
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
SELECT DISTINCT cus.name
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;

-- FROM절에 있는 서브쿼리 - 인라인뷰 라고도 함
-- 고객의 이름과 고객의 판매액의 합을 검색(customer, orders)
-- 그룹별 : Groub by
-- 단 , 고객 번호가 2 이하임

-- 동등 조인
SELECT cs.name, SUM(od.saleprice) total
FROM customer cs, orders od
WHERE cs.custid = od.custid 
    AND cs.custid <= 2
GROUP BY cs.name;

SELECT cus.name, SUM(ord.saleprice) total
FROM customer cus, orders ord
WHERE cus.custid = ord.custid
GROUP BY cus.name;
/*
-- HAVING이 들어간...?
SELECT cs.name, SUM(od.saleprice) total
FROM customer cs, orders od
WHERE cs.custid = od.custid 
    AND cs.custid <= 2
GROUP BY cs.name;
    HAVING SUM(od.saleprice) >= 30000;
*/
/*
 실행순서
 1. FROM 절 테이블명
 2. WHERE, GROUP BY
 3. SELECT 절
 4. ORDER 절
*/
-- 서브 쿼리(FROM 절)
SELECT cs.name, SUM(od.saleprice)
FROM (SELECT * FROM customer
        WHERE custid <= 2) cs, 
     orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;

--
SELECT * FROM product;
SELECT * FROM product_review;

-- 스칼라 서브쿼리
--상품 리뷰 테이블에 있는 상품코드와 상품 이름, 고객 아이디, 내용을 검색(SELECT 절)
SELECT  a.product_code,
        (select b.product_name 
         from product b
         where a.product_code = b.product_code) product_name,
        a.member_id,
        a.content
FROM product_review a;

-- 리뷰가 없는 상품을 검색하시오
SELECT *
FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code
WHERE b.content IS NULL;