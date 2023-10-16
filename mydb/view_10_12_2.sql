/*
뷰 생성하기
-- 1. customer에서 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 생성한다
-- 2. 고객 이름이 '김연아'인 고객을 '신유빈'으로 업데이트 하고 고객 정보를 출력하기
-- 3. 고객 아이디가 3인 고객을 삭제하고 고객 정보를 출력하기
-- 4. 뷰 삭제하기
*/
-- 1. customer에서 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 생성한다
CREATE VIEW vw_customer_2
AS SELECT * FROM customer_2
    WHERE address LIKE '%대한민국%';
    
-- 2. 고객 이름이 '김연아'인 고객을 '신유빈'으로 업데이트 하고 고객 정보를 출력하기
UPDATE vw_customer_2
    SET name ='신유빈'
WHERE name = '김연아';
SELECT * FROM vw_customer_2;

-- 3. 고객 아이디가 3인 고객을 삭제하고 고객 정보를 출력하기
DELETE FROM vw_customer_2
WHERE custid = 3;   -- 무결성 제약조건, 삭제 안됨

-- 4. 뷰 삭제하기
DROP VIEW vw_customer_2;