/*
-- 1. 리뷰가 있는 상품의 정보(리뷰번호,상품코드,상품이름,리뷰내용,작성일)를 검색하시오
-- 2. 리뷰가 있는 상품의 정보(리뷰번호,상품코드,상품이름,리뷰내용,작성일)를 검색하시오(내부 조인을 이용해서)
-- 3. 리뷰의 유무와 상관없이 모든 상품의 정보를 검색하시오
-- 4. 리뷰가 없는 상품의 정보(이름, 리뷰정보)를 검색하시오
-- 5. 상품 리뷰 테이블에 product_name 칼럼을 추가해서 출력하시오(스칼라 서브쿼리를 이용해서)
*/
-- 조인 연습
-- product, product_review
SELECT * FROM product;
SELECT * FROM product_review;

-- 리뷰가 있는 상품의 정보를 검색하시오
-- 리뷰 테이블에 product_name 칼럼을 출력
SELECT  b.review_no,
        a.product_code, 
        a.product_name, 
        b.content,
        b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;

SELECT  a.product_code, 
        a.product_name, 
        a.price, 
        b.*
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(미국협회) 조인 - STANDARD JOIN(표준조인)
-- 내부조인(INNER JOIN ~ ON)
SELECT  b.review_no,
        a.product_code, 
        a.product_name, 
        b.content,
        b.regdate
FROM product a JOIN product_review b
    ON a.product_code = b.product_code;
    
-- 외부조인(LEFT, RIGHT 조인)    
-- 리뷰의 유무와 상관없이 모든 상품의 정보를 검색
SELECT  b.review_no,
        a.product_code, 
        a.product_name, 
        b.content,
        b.regdate
FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code;

-- 리뷰가 없는 상품의 정보(이름, 리뷰정보)를 검색하시오
SELECT  a.product_name "상품후기가 없는 상품",
        b.content
FROM product a LEFT JOIN product_review b
    ON a.product_code = b.product_code
WHERE b.content IS NULL;

-- 상품 리뷰 테이블에 product_name 칼럼을 추가
-- 스칼라 서브쿼리: 한 칼럼만 반환함, SELECT 절에서 사용
SELECT  A.review_no,
        A.product_code,
        (SELECT B.product_name 
        FROM product B
        WHERE A.product_code = B.product_code) product_name,
        A.content,
        A.member_id,
        A.regdate
FROM product_review A;
