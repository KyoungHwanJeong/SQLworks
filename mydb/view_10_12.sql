-- 뷰(VIEW) 생성
-- UPDATE, DELELTE 기능을 사용 할 수 있음, 하지만 제약이 있다.
-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만드시오

CREATE VIEW vw_customer
AS SELECT * FROM customer
    WHERE address LIKE '대한민국%';

-- 업데이트
UPDATE vw_customer
    SET name = '신유빈'
    WHERE name = '김연아';    
    
-- 고객 아이디가 3인 고객을 삭제
-- 참조하고 있는 order 테이블이 있어서 삭제 불가
DELETE vw_customer
    WHERE custid = 3;

COMMIT;

SELECT * FROM vw_customer;

-- VIEW 삭제
DROP VIEW vw_customer;