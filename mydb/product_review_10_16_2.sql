/*
-- product_review 테이블을 생성한다
    리뷰번호(PK), 상품코드(6 byte)(NOT NULL), 회원아이디(20 byte)(NOT NULL), 리뷰내용(CLOB)(NOT NULL),
    작성일(DATE DEFALUT)
    상품코드는 외래키이다
-- 시퀀스 seq_rno 를 캐쉬 없음으로 생성한다
-- 리뷰 데이터
    (seq_rno.NEXTVAL, '100001', 'today10', '무소음인데 소음이 조금 있는 듯...')
    (seq_rno.NEXTVAL, '100002', 'cloud100', '무선이라 정말 편하네요!')
    (seq_rno.NEXTVAL, '100003', 'sky123', '게임할 맛 납니다.')

-- 1. 커밋 하고 나서 테이블 유지하고 데이터 전체 삭제하기
-- 2. 시퀀스를 삭제하고 다시 생성하기
-- 3. 상품코드가 '100001'이고 회원 아이디가 'cloud100'인 상품의 정보를 출력하시오
-- 4. 리뷰가 있는 상품을 검색하시오(오라클 방식, 동등조인)
-- 5. 리뷰가 있는 상품을 검색하시오(표준방식, 내부조인을 이용)
-- 6. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(오라클 방식)
-- 7. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(표준방식)
-- 8. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(표준방식 RIGHT JOIN으로 )
*/
CREATE TABLE product_review_2(
    review_no       NUMBER PRIMARY KEY,     -- 리뷰 번호
    product_code    CHAR(6) NOT NULL,       -- 상품 코드
    member_id       VARCHAR2(20) NOT NULL,  -- 회원 아이디
    content         CLOB NOT NULL,          -- 리뷰 내용
    regdate         DATE DEFAULT SYSDATE,    -- 작성일
    FOREIGN KEY(product_code) REFERENCES product_2(product_code)
);
-- 시퀀스 생성
CREATE SEQUENCE seq_rno_2 NOCACHE;
-- 리뷰 데이터
INSERT INTO product_review_2(review_no, product_code, member_id, content)
VALUES(seq_rno_2.NEXTVAL, '100001', 'today10', '무소음인데 소음이 조금 있는듯...');
INSERT INTO product_review_2(review_no, product_code, member_id, content)
VALUES(seq_rno_2.NEXTVAL, '100001', 'cloud100', '무선이라 정말 편하네요!');
INSERT INTO product_review_2(review_no, product_code, member_id, content)
VALUES(seq_rno_2.NEXTVAL, '100002', 'sky123', '게임할 맛 납니다.');
COMMIT;
SELECT * FROM product_review_2;

-- 1. 커밋 하고 나서 테이블 유지하고 데이터 전체 삭제하기
TRUNCATE TABLE product_review_2;
ROLLBACK;                                  -- 롤백이 안됨

-- 2. 시퀀스를 삭제하고 다시 생성하기
DROP SEQUENCE seq_rno_2;
DROP TABLE product_review_2;

-- 3. 상품코드가 '100001'이고 회원 아이디가 'cloud100'인 상품의 정보를 출력하시오
SELECT * FROM product_review_2
WHERE product_code = 100001 AND member_id LIKE 'cloud100';

-- 4. 리뷰가 있는 상품을 검색하시오(오라클 방식, 동등조인)
SELECT * FROM product_2 a, product_review_2 b
WHERE a.product_code = b.product_code;

-- 5. 리뷰가 있는 상품을 검색하시오(표준방식, 내부조인을 이용)
SELECT * FROM product_2 a INNER JOIN product_review_2 b
ON a.product_code = b.product_code;

-- 6. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(오라클 방식)
SELECT * FROM product_2 a, product_review_2 b
WHERE a.product_code = b.product_code(+);

-- 7. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(표준방식)
SELECT * FROM product_2 a LEFT OUTER JOIN product_review_2 b
ON a.product_code = b.product_code;

-- 8. 리뷰의 유무에 관계없이 상품의 정보를 검색하시오(표준방식 RIGHT JOIN으로 )
SELECT  a.product_code,
        a.product_name,
        a.price,
        b.member_id,
        b.content,
        b.regdate
FROM product_review_2 b RIGHT OUTER JOIN product_2 a
ON a.product_code = b.product_code;