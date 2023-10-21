/*
-- product 테이블을 생성한다
    상품코드(6 byte)(PK), 상품명(50 byte)(NOT NULL), 상품가격(NOT NULL)
-- 상품 데이터
    ('100001', '무소음 무선 마우스', 25000)
    ('100002', '기계식 게이밍 키보드', 30000)
    ('100003', '무결점 패널 광시야각 모니터', 1200000)
    
-- 문제
-- 1. 상품의 총 개수 및 상품 가격의 평균을 구하시오(평균가격은 백원 단위로 반올림하기)
-- 2. 상품 중에서 마우스 이름과 가격 검색하기
-- 3. 상품을 가격순으로 정렬하시오 (내림차순)
*/
-- product 테이블 생성
CREATE TABLE product(
    product_code    CHAR(6) PRIMARY KEY,        -- 상품코드
    product_name    VARCHAR2(50) NOT NULL,      -- 상품명
    price           NUMBER NOT NULL             -- 상품가격
);

INSERT INTO product(product_code, product_name, price)
VALUES ('100001', '무소음 무선 마우스',  25000);
INSERT INTO product(product_code, product_name, price)
VALUES ('100002', '기계식 게이밍 키보드',  30000);
INSERT INTO product(product_code, product_name, price)
VALUES ('100003', '무결점 패널 광시야각 모니터',  120000);

COMMIT;
SELECT * FROM product;

-- 상품의 총 개수 및 상품 가격의 평균을 구하시오
-- COUNT(), SUM(), AVG()
SELECT  COUNT(*) AS 상품의총개수,
        ROUND(AVG(price), -2) AS 평균가격 -- 백원 단위로 반올림하기
FROM product;

-- 상품 중에서 마우스 이름과 가격 검색하기
SELECT product_name, price
FROM product
WHERE product_name LIKE '%마우스%';

-- 상품을 가격순으로 정렬하시오 (내림차순)
SELECT * FROM product
ORDER BY price DESC;

drop table product;